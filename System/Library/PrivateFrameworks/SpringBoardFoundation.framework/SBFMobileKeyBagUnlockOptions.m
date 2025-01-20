@interface SBFMobileKeyBagUnlockOptions
- (BOOL)skipSEKeepUserDataOperation;
- (NSData)passcode;
- (SBFMobileKeyBagUnlockOptions)initWithPasscode:(id)a3;
- (SBFMobileKeyBagUnlockOptions)initWithPasscode:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4;
@end

@implementation SBFMobileKeyBagUnlockOptions

- (SBFMobileKeyBagUnlockOptions)initWithPasscode:(id)a3
{
  return [(SBFMobileKeyBagUnlockOptions *)self initWithPasscode:a3 skipSEKeepUserDataOperation:0];
}

- (SBFMobileKeyBagUnlockOptions)initWithPasscode:(id)a3 skipSEKeepUserDataOperation:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFMobileKeyBagUnlockOptions;
  v8 = [(SBFMobileKeyBagUnlockOptions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_passcode, a3);
    v9->_skipSEKeepUserDataOperation = a4;
  }

  return v9;
}

- (NSData)passcode
{
  return self->_passcode;
}

- (BOOL)skipSEKeepUserDataOperation
{
  return self->_skipSEKeepUserDataOperation;
}

- (void).cxx_destruct
{
}

@end