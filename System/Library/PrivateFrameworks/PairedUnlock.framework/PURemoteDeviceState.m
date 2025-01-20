@interface PURemoteDeviceState
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPasscodeSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPasscodeLocked;
- (BOOL)isUnlockOnly;
- (BOOL)isWristDetectEnabled;
- (PURemoteDeviceState)initWithCoder:(id)a3;
- (PURemotePasscodePolicy)passcodePolicy;
- (id)description;
- (unint64_t)hash;
- (unsigned)version;
- (void)encodeWithCoder:(id)a3;
- (void)setPasscodeLocked:(BOOL)a3;
- (void)setPasscodePolicy:(id)a3;
- (void)setPasscodeSet:(BOOL)a3;
- (void)setUnlockOnly:(BOOL)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWristDetectEnabled:(BOOL)a3;
@end

@implementation PURemoteDeviceState

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL v6 = [(PURemoteDeviceState *)self hasPasscodeSet];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __31__PURemoteDeviceState_isEqual___block_invoke;
  v30[3] = &unk_2646A7EE8;
  id v7 = v4;
  id v31 = v7;
  id v8 = (id)[v5 appendBool:v6 counterpart:v30];
  BOOL v9 = [(PURemoteDeviceState *)self isUnlockOnly];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __31__PURemoteDeviceState_isEqual___block_invoke_2;
  v28[3] = &unk_2646A7EE8;
  id v10 = v7;
  id v29 = v10;
  id v11 = (id)[v5 appendBool:v9 counterpart:v28];
  BOOL v12 = [(PURemoteDeviceState *)self isPasscodeLocked];
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __31__PURemoteDeviceState_isEqual___block_invoke_3;
  v26[3] = &unk_2646A7EE8;
  id v13 = v10;
  id v27 = v13;
  id v14 = (id)[v5 appendBool:v12 counterpart:v26];
  BOOL v15 = [(PURemoteDeviceState *)self isWristDetectEnabled];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __31__PURemoteDeviceState_isEqual___block_invoke_4;
  v24[3] = &unk_2646A7EE8;
  id v16 = v13;
  id v25 = v16;
  id v17 = (id)[v5 appendBool:v15 counterpart:v24];
  v18 = [(PURemoteDeviceState *)self passcodePolicy];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __31__PURemoteDeviceState_isEqual___block_invoke_5;
  v22[3] = &unk_2646A7F10;
  id v23 = v16;
  id v19 = v16;
  id v20 = (id)[v5 appendObject:v18 counterpart:v22];

  LOBYTE(v18) = [v5 isEqual];
  return (char)v18;
}

uint64_t __31__PURemoteDeviceState_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hasPasscodeSet];
}

uint64_t __31__PURemoteDeviceState_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) isUnlockOnly];
}

uint64_t __31__PURemoteDeviceState_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) isPasscodeLocked];
}

uint64_t __31__PURemoteDeviceState_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) isWristDetectEnabled];
}

uint64_t __31__PURemoteDeviceState_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) passcodePolicy];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263F29C60]);
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[PURemoteDeviceState hasPasscodeSet](self, "hasPasscodeSet"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[PURemoteDeviceState isUnlockOnly](self, "isUnlockOnly"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[PURemoteDeviceState isPasscodeLocked](self, "isPasscodeLocked"));
  id v7 = (id)objc_msgSend(v3, "appendBool:", -[PURemoteDeviceState isWristDetectEnabled](self, "isWristDetectEnabled"));
  id v8 = [(PURemoteDeviceState *)self passcodePolicy];
  id v9 = (id)[v3 appendObject:v8];

  unint64_t v10 = [v3 hash];
  return v10;
}

- (id)description
{
  id v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)[v3 appendInt:self->_version withName:@"version"];
  id v5 = (id)[v3 appendBool:self->_passcodeSet withName:@"passcodeSet"];
  id v6 = (id)[v3 appendBool:self->_unlockOnly withName:@"isUnlockOnly" ifEqualTo:1];
  id v7 = (id)[v3 appendBool:self->_passcodeLocked withName:@"isPasscodeLocked"];
  id v8 = (id)[v3 appendBool:self->_wristDetectEnabled withName:@"wristDetectEnabled"];
  id v9 = (id)[v3 appendObject:self->_passcodePolicy withName:@"policy"];
  unint64_t v10 = [v3 build];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PURemoteDeviceState)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PURemoteDeviceState;
  id v5 = [(PURemoteDeviceState *)&v9 init];
  if (v5)
  {
    v5->_version = [v4 decodeIntegerForKey:@"kPURemoteDeviceState_Version"];
    v5->_passcodeSet = [v4 decodeBoolForKey:@"kPURemoteDeviceState_PasscodeSet"];
    v5->_passcodeLocked = [v4 decodeBoolForKey:@"kPURemoteDeviceState_PasscodeLocked"];
    v5->_unlockOnly = [v4 decodeBoolForKey:@"kPURemoteDeviceState_UnlockOnly"];
    v5->_wristDetectEnabled = [v4 decodeBoolForKey:@"kPURemoteDeviceState_WristDetectEnabled"];
    uint64_t v6 = [v4 decodeObjectForKey:@"kPURemoteDeviceState_PasscodePolicy"];
    passcodePolicy = v5->_passcodePolicy;
    v5->_passcodePolicy = (PURemotePasscodePolicy *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t version = self->_version;
  id v5 = a3;
  [v5 encodeInteger:version forKey:@"kPURemoteDeviceState_Version"];
  [v5 encodeBool:self->_passcodeSet forKey:@"kPURemoteDeviceState_PasscodeSet"];
  [v5 encodeBool:self->_passcodeLocked forKey:@"kPURemoteDeviceState_PasscodeLocked"];
  [v5 encodeBool:self->_unlockOnly forKey:@"kPURemoteDeviceState_UnlockOnly"];
  [v5 encodeBool:self->_wristDetectEnabled forKey:@"kPURemoteDeviceState_WristDetectEnabled"];
  [v5 encodeObject:self->_passcodePolicy forKey:@"kPURemoteDeviceState_PasscodePolicy"];
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_uint64_t version = a3;
}

- (BOOL)hasPasscodeSet
{
  return self->_passcodeSet;
}

- (void)setPasscodeSet:(BOOL)a3
{
  self->_passcodeSet = a3;
}

- (BOOL)isPasscodeLocked
{
  return self->_passcodeLocked;
}

- (void)setPasscodeLocked:(BOOL)a3
{
  self->_passcodeLocked = a3;
}

- (BOOL)isUnlockOnly
{
  return self->_unlockOnly;
}

- (void)setUnlockOnly:(BOOL)a3
{
  self->_unlockOnly = a3;
}

- (BOOL)isWristDetectEnabled
{
  return self->_wristDetectEnabled;
}

- (void)setWristDetectEnabled:(BOOL)a3
{
  self->_wristDetectEnabled = a3;
}

- (PURemotePasscodePolicy)passcodePolicy
{
  return self->_passcodePolicy;
}

- (void)setPasscodePolicy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end