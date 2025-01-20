@interface _SiriPresentationOptionsMutation
- (_SiriPresentationOptionsMutation)init;
- (_SiriPresentationOptionsMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setHideOtherWindowsDuringAppearance:(BOOL)a3;
- (void)setInputType:(int64_t)a3;
- (void)setLaunchActions:(id)a3;
- (void)setRequestSource:(int64_t)a3;
- (void)setRotationStyle:(int64_t)a3;
- (void)setShouldAllowBiometricAutoUnlock:(BOOL)a3;
- (void)setShouldDeactivateScenesBelow:(BOOL)a3;
- (void)setWakeScreen:(BOOL)a3;
@end

@implementation _SiriPresentationOptionsMutation

- (_SiriPresentationOptionsMutation)init
{
  return [(_SiriPresentationOptionsMutation *)self initWithBaseModel:0];
}

- (_SiriPresentationOptionsMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SiriPresentationOptionsMutation;
  v6 = [(_SiriPresentationOptionsMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (void)setWakeScreen:(BOOL)a3
{
  self->_wakeScreen = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (void)setHideOtherWindowsDuringAppearance:(BOOL)a3
{
  self->_hideOtherWindowsDuringAppearance = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (void)setShouldAllowBiometricAutoUnlock:(BOOL)a3
{
  self->_shouldAllowBiometricAutoUnlock = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (void)setShouldDeactivateScenesBelow:(BOOL)a3
{
  self->_shouldDeactivateScenesBelow = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (void)setRotationStyle:(int64_t)a3
{
  self->_rotationStyle = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (void)setRequestSource:(int64_t)a3
{
  self->_requestSource = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (void)setLaunchActions:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v6 = [SiriPresentationOptions alloc];
    __int16 mutationFlags = (__int16)self->_mutationFlags;
    if ((mutationFlags & 2) != 0)
    {
      BOOL wakeScreen = self->_wakeScreen;
      if ((mutationFlags & 0x20) != 0)
      {
LABEL_6:
        int64_t rotationStyle = self->_rotationStyle;
        if ((mutationFlags & 0x40) != 0)
        {
LABEL_7:
          int64_t requestSource = self->_requestSource;
LABEL_20:
          if ((mutationFlags & 0x80) != 0) {
            int64_t inputType = self->_inputType;
          }
          else {
            int64_t inputType = 0;
          }
          uint64_t v5 = [(SiriPresentationOptions *)v6 initWithWakeScreen:wakeScreen hideOtherWindowsDuringAppearance:self->_hideOtherWindowsDuringAppearance shouldAllowBiometricAutoUnlock:self->_shouldAllowBiometricAutoUnlock shouldDeactivateScenesBelow:self->_shouldDeactivateScenesBelow rotationStyle:rotationStyle requestSource:requestSource inputType:inputType launchActions:self->_launchActions];
          goto LABEL_24;
        }
LABEL_19:
        int64_t requestSource = 0;
        goto LABEL_20;
      }
    }
    else
    {
      BOOL wakeScreen = 1;
      if ((mutationFlags & 0x20) != 0) {
        goto LABEL_6;
      }
    }
    int64_t rotationStyle = 1;
    if ((mutationFlags & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
  __int16 v4 = (__int16)self->_mutationFlags;
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(SiriPresentationOptions *)baseModel copy];
LABEL_24:
    v20 = (SiriPresentationOptions *)v5;
    goto LABEL_34;
  }
  if ((v4 & 2) != 0)
  {
    uint64_t v11 = self->_wakeScreen;
    if ((v4 & 4) != 0)
    {
LABEL_10:
      BOOL hideOtherWindowsDuringAppearance = self->_hideOtherWindowsDuringAppearance;
      if ((v4 & 8) != 0) {
        goto LABEL_11;
      }
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v11 = [(SiriPresentationOptions *)baseModel wakeScreen];
    __int16 v4 = (__int16)self->_mutationFlags;
    if ((v4 & 4) != 0) {
      goto LABEL_10;
    }
  }
  BOOL hideOtherWindowsDuringAppearance = [(SiriPresentationOptions *)self->_baseModel hideOtherWindowsDuringAppearance];
  __int16 v4 = (__int16)self->_mutationFlags;
  if ((v4 & 8) != 0)
  {
LABEL_11:
    BOOL shouldAllowBiometricAutoUnlock = self->_shouldAllowBiometricAutoUnlock;
    if ((v4 & 0x10) != 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  BOOL shouldAllowBiometricAutoUnlock = [(SiriPresentationOptions *)self->_baseModel shouldAllowBiometricAutoUnlock];
  __int16 v4 = (__int16)self->_mutationFlags;
  if ((v4 & 0x10) != 0)
  {
LABEL_12:
    BOOL shouldDeactivateScenesBelow = self->_shouldDeactivateScenesBelow;
    if ((v4 & 0x20) != 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  BOOL shouldDeactivateScenesBelow = [(SiriPresentationOptions *)self->_baseModel shouldDeactivateScenesBelow];
  __int16 v4 = (__int16)self->_mutationFlags;
  if ((v4 & 0x20) != 0)
  {
LABEL_13:
    int64_t v15 = self->_rotationStyle;
    if ((v4 & 0x40) != 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  int64_t v15 = [(SiriPresentationOptions *)self->_baseModel rotationStyle];
  __int16 v4 = (__int16)self->_mutationFlags;
  if ((v4 & 0x40) != 0)
  {
LABEL_14:
    int64_t v16 = self->_requestSource;
    if ((v4 & 0x80) != 0) {
      goto LABEL_15;
    }
LABEL_31:
    int64_t v17 = [(SiriPresentationOptions *)self->_baseModel inputType];
    if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
      goto LABEL_16;
    }
LABEL_32:
    v18 = [(SiriPresentationOptions *)self->_baseModel launchActions];
    goto LABEL_33;
  }
LABEL_30:
  int64_t v16 = [(SiriPresentationOptions *)self->_baseModel requestSource];
  __int16 v4 = (__int16)self->_mutationFlags;
  if ((v4 & 0x80) == 0) {
    goto LABEL_31;
  }
LABEL_15:
  int64_t v17 = self->_inputType;
  if ((v4 & 0x100) == 0) {
    goto LABEL_32;
  }
LABEL_16:
  v18 = self->_launchActions;
LABEL_33:
  v21 = v18;
  v20 = [[SiriPresentationOptions alloc] initWithWakeScreen:v11 hideOtherWindowsDuringAppearance:hideOtherWindowsDuringAppearance shouldAllowBiometricAutoUnlock:shouldAllowBiometricAutoUnlock shouldDeactivateScenesBelow:shouldDeactivateScenesBelow rotationStyle:v15 requestSource:v16 inputType:v17 launchActions:v18];

LABEL_34:
  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
}

@end