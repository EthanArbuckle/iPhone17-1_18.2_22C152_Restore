@interface SBAuthenticationFeedback
- (BOOL)hintFailureText;
- (BOOL)isEqual:(id)a3;
- (BOOL)jiggleLock;
- (BOOL)showPasscode;
- (BOOL)vibrate;
- (id)description;
- (id)initForFailureShowingPasscode:(BOOL)a3;
- (id)initForFailureWithFailureSettings:(id)a3;
- (id)initForSuccess;
- (unint64_t)hash;
- (unint64_t)result;
@end

@implementation SBAuthenticationFeedback

- (id)initForSuccess
{
  v3.receiver = self;
  v3.super_class = (Class)SBAuthenticationFeedback;
  id result = [(SBAuthenticationFeedback *)&v3 init];
  if (result)
  {
    *((void *)result + 3) = 0;
    *((_WORD *)result + 8) = 1;
    *((unsigned char *)result + 18) = 0;
  }
  return result;
}

- (id)initForFailureShowingPasscode:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBAuthenticationFeedback;
  id result = [(SBAuthenticationFeedback *)&v5 init];
  if (result)
  {
    *((void *)result + 3) = 1;
    *((unsigned char *)result + 16) = 1;
    *((unsigned char *)result + 17) = a3;
    *((unsigned char *)result + 18) = 1;
  }
  return result;
}

- (id)initForFailureWithFailureSettings:(id)a3
{
  id v4 = a3;
  objc_super v5 = -[SBAuthenticationFeedback initForFailureShowingPasscode:](self, "initForFailureShowingPasscode:", [v4 showPasscode]);
  if (v5)
  {
    v5[16] = [v4 vibrate];
    v5[18] = [v4 jiggleLock];
  }

  return v5;
}

- (BOOL)hintFailureText
{
  if (self->_result == 1) {
    return ![(SBAuthenticationFeedback *)self showPasscode];
  }
  else {
    return 0;
  }
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = v3;
  if (self->_result) {
    objc_super v5 = @"Failure";
  }
  else {
    objc_super v5 = @"Success";
  }
  [v3 appendString:v5 withName:@"result"];
  id v6 = (id)[v4 appendBool:self->_showPasscode withName:@"showPasscode"];
  id v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBAuthenticationFeedback hintFailureText](self, "hintFailureText"), @"hintFailureText");
  id v8 = (id)[v4 appendBool:self->_vibrate withName:@"vibrates"];
  id v9 = (id)[v4 appendBool:self->_jiggleLock withName:@"jiggleLock"];
  v10 = [v4 build];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t v6 = self->_result;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __36__SBAuthenticationFeedback_isEqual___block_invoke;
  v28[3] = &unk_1E6AF9660;
  id v7 = v4;
  id v29 = v7;
  id v8 = (id)[v5 appendInteger:v6 counterpart:v28];
  BOOL jiggleLock = self->_jiggleLock;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __36__SBAuthenticationFeedback_isEqual___block_invoke_2;
  v26[3] = &unk_1E6AF99E8;
  id v10 = v7;
  id v27 = v10;
  id v11 = (id)[v5 appendBool:jiggleLock counterpart:v26];
  BOOL vibrate = self->_vibrate;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __36__SBAuthenticationFeedback_isEqual___block_invoke_3;
  v24[3] = &unk_1E6AF99E8;
  id v13 = v10;
  id v25 = v13;
  id v14 = (id)[v5 appendBool:vibrate counterpart:v24];
  uint64_t showPasscode = self->_showPasscode;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __36__SBAuthenticationFeedback_isEqual___block_invoke_4;
  v22 = &unk_1E6AF99E8;
  id v23 = v13;
  id v16 = v13;
  id v17 = (id)[v5 appendBool:showPasscode counterpart:&v19];
  LOBYTE(showPasscode) = objc_msgSend(v5, "isEqual", v19, v20, v21, v22);

  return showPasscode;
}

uint64_t __36__SBAuthenticationFeedback_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) result];
}

uint64_t __36__SBAuthenticationFeedback_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) jiggleLock];
}

uint64_t __36__SBAuthenticationFeedback_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) vibrate];
}

uint64_t __36__SBAuthenticationFeedback_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) showPasscode];
}

- (unint64_t)hash
{
  unint64_t v3 = [(SBAuthenticationFeedback *)self showPasscode];
  if ([(SBAuthenticationFeedback *)self jiggleLock]) {
    v3 |= 4uLL;
  }
  BOOL v4 = [(SBAuthenticationFeedback *)self vibrate];
  unint64_t v5 = v3 | 8;
  if (!v4) {
    unint64_t v5 = v3;
  }
  unint64_t v6 = self->_result;
  unint64_t v7 = v5 | 0x20;
  if (v6 == 1) {
    v5 |= 0x10uLL;
  }
  if (v6) {
    return v5;
  }
  else {
    return v7;
  }
}

- (unint64_t)result
{
  return self->_result;
}

- (BOOL)showPasscode
{
  return self->_showPasscode;
}

- (BOOL)vibrate
{
  return self->_vibrate;
}

- (BOOL)jiggleLock
{
  return self->_jiggleLock;
}

@end