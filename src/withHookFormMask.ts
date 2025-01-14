import Inputmask from 'inputmask';

import { compose } from './utils';
import { Mask, Options, Register } from './types';

export const withHookFormMask = (register: Register, mask: Mask, options?: Options) => {
  //
  let newRef;

  if (register) {
    const { ref } = register;

    const maskInput = Inputmask({
      mask,
      jitMasking: true,
      ...options,
    });

    newRef = compose((_ref: HTMLElement) => {
      if (_ref) maskInput.mask(_ref);
      return _ref;
    }, ref);
  }

  return {
    ...register,
    ref: newRef,
  };
};
