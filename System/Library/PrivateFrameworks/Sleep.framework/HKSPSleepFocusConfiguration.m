@interface HKSPSleepFocusConfiguration
+ (id)readFromDefaults:(id)a3;
+ (unint64_t)defaultConfigurationState;
- (BOOL)hasSleepFocusMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)mirrorsFocusModes;
- (HKSPSleepFocusConfiguration)initWithUUID:(id)a3 mirrorsFocusModes:(BOOL)a4 state:(unint64_t)a5;
- (NSUUID)uuid;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)sleepFocusConfigurationUpdatingMirrorsFocusModes:(BOOL)a3;
- (id)sleepFocusConfigurationUpdatingUUID:(id)a3 state:(unint64_t)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (unint64_t)state;
- (void)writeToDefaults:(id)a3;
@end

@implementation HKSPSleepFocusConfiguration

- (id)succinctDescription
{
  v2 = [(HKSPSleepFocusConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  if ([(HKSPSleepFocusConfiguration *)self hasSleepFocusMode])
  {
    v4 = [(HKSPSleepFocusConfiguration *)self uuid];
    id v5 = (id)[v3 appendObject:v4 withName:@"uuid"];

    unint64_t v6 = [(HKSPSleepFocusConfiguration *)self state];
    if (v6 > 3) {
      v7 = @"Unconfigured";
    }
    else {
      v7 = off_1E5D342E8[v6];
    }
    [v3 appendString:v7 withName:@"state"];
  }
  else
  {
    id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepFocusConfiguration hasSleepFocusMode](self, "hasSleepFocusMode"), @"hasSleepFocusMode");
  }
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[HKSPSleepFocusConfiguration mirrorsFocusModes](self, "mirrorsFocusModes"), @"mirrorsFocusModes");
  return v3;
}

- (BOOL)hasSleepFocusMode
{
  v2 = [(HKSPSleepFocusConfiguration *)self uuid];
  BOOL v3 = v2 != 0;

  return v3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)mirrorsFocusModes
{
  return self->_mirrorsFocusModes;
}

- (HKSPSleepFocusConfiguration)initWithUUID:(id)a3 mirrorsFocusModes:(BOOL)a4 state:(unint64_t)a5
{
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HKSPSleepFocusConfiguration;
  id v9 = [(HKSPSleepFocusConfiguration *)&v14 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    uuid = v9->_uuid;
    v9->_uuid = (NSUUID *)v10;

    v9->_mirrorsFocusModes = a4;
    v9->_state = a5;
    v12 = v9;
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (id)sleepFocusConfigurationUpdatingUUID:(id)a3 state:(unint64_t)a4
{
  id v6 = a3;
  v7 = [[HKSPSleepFocusConfiguration alloc] initWithUUID:v6 mirrorsFocusModes:[(HKSPSleepFocusConfiguration *)self mirrorsFocusModes] state:a4];

  return v7;
}

- (id)sleepFocusConfigurationUpdatingMirrorsFocusModes:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [HKSPSleepFocusConfiguration alloc];
  id v6 = [(HKSPSleepFocusConfiguration *)self uuid];
  v7 = [(HKSPSleepFocusConfiguration *)v5 initWithUUID:v6 mirrorsFocusModes:v3 state:[(HKSPSleepFocusConfiguration *)self state]];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKSPSleepFocusConfiguration *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [MEMORY[0x1E4F4F738] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      v7 = [(HKSPSleepFocusConfiguration *)self uuid];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __39__HKSPSleepFocusConfiguration_isEqual___block_invoke;
      v22[3] = &unk_1E5D31C98;
      id v8 = v5;
      v23 = v8;
      id v9 = (id)[v6 appendObject:v7 counterpart:v22];

      BOOL v10 = [(HKSPSleepFocusConfiguration *)self mirrorsFocusModes];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __39__HKSPSleepFocusConfiguration_isEqual___block_invoke_2;
      v20[3] = &unk_1E5D325D8;
      v11 = v8;
      v21 = v11;
      id v12 = (id)[v6 appendBool:v10 counterpart:v20];
      unint64_t v13 = [(HKSPSleepFocusConfiguration *)self state];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __39__HKSPSleepFocusConfiguration_isEqual___block_invoke_3;
      v18[3] = &unk_1E5D32600;
      v19 = v11;
      objc_super v14 = v11;
      id v15 = (id)[v6 appendUnsignedInteger:v13 counterpart:v18];
      char v16 = [v6 isEqual];
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

uint64_t __39__HKSPSleepFocusConfiguration_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) uuid];
}

uint64_t __39__HKSPSleepFocusConfiguration_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) mirrorsFocusModes];
}

uint64_t __39__HKSPSleepFocusConfiguration_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) state];
}

- (unint64_t)hash
{
  BOOL v3 = [MEMORY[0x1E4F4F758] builder];
  v4 = [(HKSPSleepFocusConfiguration *)self uuid];
  id v5 = (id)[v3 appendObject:v4];

  id v6 = (id)objc_msgSend(v3, "appendBool:", -[HKSPSleepFocusConfiguration mirrorsFocusModes](self, "mirrorsFocusModes"));
  id v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[HKSPSleepFocusConfiguration state](self, "state"));
  unint64_t v8 = [v3 hash];

  return v8;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(HKSPSleepFocusConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

+ (unint64_t)defaultConfigurationState
{
  return 1;
}

- (unint64_t)state
{
  return self->_state;
}

+ (id)readFromDefaults:(id)a3
{
  id v3 = a3;
  v4 = objc_msgSend(v3, "hksp_objectForKey:", @"SleepFocusUUID");
  uint64_t v5 = objc_msgSend(v3, "hksp_BOOLForKey:", @"MirrorsSleepFocusMode");
  uint64_t v6 = objc_msgSend(v3, "hksp_integerForKey:", @"SleepFocusState");

  id v7 = [HKSPSleepFocusConfiguration alloc];
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v4];
  id v9 = [(HKSPSleepFocusConfiguration *)v7 initWithUUID:v8 mirrorsFocusModes:v5 state:v6];

  return v9;
}

- (void)writeToDefaults:(id)a3
{
  id v6 = a3;
  v4 = [(HKSPSleepFocusConfiguration *)self uuid];
  uint64_t v5 = [v4 UUIDString];
  objc_msgSend(v6, "hksp_setObject:forKey:", v5, @"SleepFocusUUID");

  objc_msgSend(v6, "hksp_setBool:forKey:", -[HKSPSleepFocusConfiguration mirrorsFocusModes](self, "mirrorsFocusModes"), @"MirrorsSleepFocusMode");
  objc_msgSend(v6, "hksp_setInteger:forKey:", -[HKSPSleepFocusConfiguration state](self, "state"), @"SleepFocusState");
}

@end