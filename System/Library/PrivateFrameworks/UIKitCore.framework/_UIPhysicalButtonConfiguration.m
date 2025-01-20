@interface _UIPhysicalButtonConfiguration
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)_cameraCaptureShutterConfigurationWithOptionsProvider:(id)a3;
+ (id)_cameraShutterConfigurations;
+ (id)_cameraShutterConfigurationsForButtons:(uint64_t)a3 buttonsCount:(uint64_t)a4 withOptionsProvider:;
+ (id)_cameraShutterConfigurationsWithOptions:(id)a3;
+ (id)_cameraShutterConfigurationsWithOptionsProvider:(id)a3;
+ (id)_configurationWithPhysicalButton:(unint64_t)a3 behavior:(unint64_t)a4 behaviorOptions:(id)a5;
+ (id)_ringerButtonDynamicActionConfiguration;
+ (id)_volumeCameraShutterConfigurationsWithOptionsProvider:(id)a3;
+ (id)_volumeConfigurations;
- (BOOL)_isEqualToConfigurationMinusGeneration:(BOOL)result;
- (BOOL)_wantsSystemShellExclusivePriority;
- (BOOL)isEqual:(id)a3;
- (BSAuditToken)_auditToken;
- (NSString)_name;
- (NSString)debugDescription;
- (_UIPhysicalButtonBehaviorOptions)_behaviorOptions;
- (_UIPhysicalButtonConfiguration)init;
- (_UIPhysicalButtonConfiguration)initWithBSXPCCoder:(id)a3;
- (_UIPhysicalButtonConfiguration)initWithCoder:(id)a3;
- (_UIPhysicalButtonConfiguration)initWithXPCDictionary:(id)a3;
- (id)_initWithPhysicalButton:(unint64_t)a3 behavior:(void *)a4 behaviorOptions:(uint64_t)a5 generation:(void *)a6 auditToken:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_behavior;
- (unint64_t)_button;
- (unint64_t)_generation;
- (unint64_t)hash;
- (void)_setName:(id)a3;
- (void)_setWantsSystemShellExclusivePriority:(BOOL)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)encodeWithXPCDictionary:(id)a3;
@end

@implementation _UIPhysicalButtonConfiguration

- (BSAuditToken)_auditToken
{
  return self->_auditToken;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_behaviorOptions, 0);
}

+ (id)_cameraShutterConfigurationsForButtons:(uint64_t)a3 buttonsCount:(uint64_t)a4 withOptionsProvider:
{
  self;
  v7 = objc_opt_new();
  do
  {
    uint64_t v9 = *a2++;
    uint64_t v8 = v9;
    if (a4)
    {
      v10 = (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a4, v8);
    }
    else
    {
      v10 = 0;
    }
    if (_UIPhysicalButtonBehaviorOptionsIsValidForBehavior(v10, 0))
    {
      uint64_t v11 = [v10 copy];
    }
    else
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v14 = [NSString stringWithUTF8String:"+[_UIPhysicalButtonConfiguration _cameraShutterConfigurationsForButtons:buttonsCount:withOptionsProvider:]"];
      [v17 handleFailureInFunction:v14, @"_UIPhysicalButtonConfiguration.m", 349, @"Invalid options object for camera shutter configurations: %@", v10 file lineNumber description];

      uint64_t v11 = +[_UIPhysicalButtonBehaviorCameraShutterOptions behaviorOptions];
    }
    v12 = (void *)v11;

    v13 = +[_UIPhysicalButtonConfiguration _configurationWithPhysicalButton:v8 behavior:0 behaviorOptions:v12];
    [v7 addObject:v13];

    --a3;
  }
  while (a3);
  v15 = (void *)[v7 copy];

  return v15;
}

+ (id)_configurationWithPhysicalButton:(unint64_t)a3 behavior:(unint64_t)a4 behaviorOptions:(id)a5
{
  uint64_t v8 = [_UIPhysicalButtonConfiguration alloc];
  uint64_t bytes = 0;
  do
  {
    uint64_t v9 = CCRandomGenerateBytes(&bytes, 8uLL);
    if (v9)
    {
      uint64_t v12 = v9;
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      v16 = [NSString stringWithUTF8String:"uint64_t _UIPhysicalButtonConfigurationRandomGeneration(void)"];
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v16, @"_UIPhysicalButtonConfiguration.m", 287, @"Failed to create configuration generation with status: %d", v12);
    }
    uint64_t v10 = bytes;
    if (bytes) {
      BOOL v11 = bytes == 0x3E1CC2CA76C17F8;
    }
    else {
      BOOL v11 = 1;
    }
  }
  while (v11);
  v13 = [MEMORY[0x1E4F4F6A8] tokenForCurrentProcess];
  id v14 = -[_UIPhysicalButtonConfiguration _initWithPhysicalButton:behavior:behaviorOptions:generation:auditToken:](v8, a3, a4, a5, v10, v13);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = -[_UIPhysicalButtonConfiguration _initWithPhysicalButton:behavior:behaviorOptions:generation:auditToken:]([_UIPhysicalButtonConfiguration alloc], self->_button, self->_behavior, self->_behaviorOptions, self->_generation, self->_auditToken);
  [v4 _setName:self->_name];
  [v4 _setWantsSystemShellExclusivePriority:self->_wantsSystemShellExclusivePriority];
  return v4;
}

- (void)_setWantsSystemShellExclusivePriority:(BOOL)a3
{
  self->_wantsSystemShellExclusivePriority = a3;
}

- (void)_setName:(id)a3
{
}

- (unint64_t)_button
{
  return self->_button;
}

- (unint64_t)_behavior
{
  return self->_behavior;
}

- (id)_initWithPhysicalButton:(unint64_t)a3 behavior:(void *)a4 behaviorOptions:(uint64_t)a5 generation:(void *)a6 auditToken:
{
  id v6 = a1;
  if (!a1) {
    return v6;
  }
  uint64_t v12 = objc_opt_class();
  if (v12 != objc_opt_class())
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_ object:v6 file:@"_UIPhysicalButtonConfiguration.m" lineNumber:445 description:@"_UIPhysicalButtonConfiguration cannot be subclassed"];
  }
  if ((_UIPhysicalButtonIsValid(a2) & 1) == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, @"_UIPhysicalButtonConfiguration.m", 447, @"Invalid button: %lu", a2);
  }
  if ((_UIPhysicalButtonBehaviorIsValidForButton(a3, a2) & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = _NSStringFromUIPhysicalButton(a2);
    v23 = _NSStringFromUIPhysicalButtonBehavior(a3);
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, @"_UIPhysicalButtonConfiguration.m", 449, @"Invalid behavior for button: %@; behavior: %@",
      v22,
      v23);
  }
  if (_UIPhysicalButtonBehaviorOptionsIsValidForBehavior(a4, a3))
  {
    if (a5) {
      goto LABEL_10;
    }
LABEL_15:
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, @"_UIPhysicalButtonConfiguration.m", 452, @"Invalid configuration generation: %llu", 0);

    if (a6) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  v24 = [MEMORY[0x1E4F28B00] currentHandler];
  v25 = _NSStringFromUIPhysicalButtonBehavior(a3);
  [v24 handleFailureInMethod:sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, @"_UIPhysicalButtonConfiguration.m", 451, @"Invalid options for %@: %@", v25, a4 object file lineNumber description];

  if (!a5) {
    goto LABEL_15;
  }
LABEL_10:
  if (a6) {
    goto LABEL_11;
  }
LABEL_16:
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:sel__initWithPhysicalButton_behavior_behaviorOptions_generation_auditToken_, v6, @"_UIPhysicalButtonConfiguration.m", 453, @"Invalid configuration auditToken: %@", 0 object file lineNumber description];

LABEL_11:
  v28.receiver = v6;
  v28.super_class = (Class)_UIPhysicalButtonConfiguration;
  v13 = objc_msgSendSuper2(&v28, sel_init);
  id v6 = v13;
  if (v13)
  {
    v13[2] = a2;
    v13[3] = a3;
    uint64_t v14 = [a4 copy];
    v15 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v14;

    *((void *)v6 + 5) = a5;
    uint64_t v16 = [a6 copy];
    v17 = (void *)*((void *)v6 + 6);
    *((void *)v6 + 6) = v16;

    *((unsigned char *)v6 + 8) = 0;
  }
  return v6;
}

- (_UIPhysicalButtonBehaviorOptions)_behaviorOptions
{
  v2 = (void *)[(_UIPhysicalButtonBehaviorOptions *)self->_behaviorOptions copy];
  return (_UIPhysicalButtonBehaviorOptions *)v2;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v7 = [NSNumber numberWithUnsignedInteger:self->_button];
  v5 = [NSNumber numberWithUnsignedInteger:self->_behavior];
  id v6 = [NSNumber numberWithUnsignedLongLong:self->_generation];
  [a3 encodeObject:v7 forKey:@"button"];
  [a3 encodeObject:v5 forKey:@"behavior"];
  [a3 encodeObject:self->_behaviorOptions forKey:@"behaviorOptions"];
  [a3 encodeObject:self->_name forKey:@"name"];
  [a3 encodeBool:self->_wantsSystemShellExclusivePriority forKey:@"wantsSystemShellExclusivePriority"];
  [a3 encodeObject:v6 forKey:@"generation"];
  [a3 encodeObject:self->_auditToken forKey:@"auditToken"];
}

- (_UIPhysicalButtonConfiguration)initWithBSXPCCoder:(id)a3
{
  id v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"button"];
  id v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"behavior"];
  uint64_t v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"behaviorOptions"];
  uint64_t v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  char v10 = [a3 decodeBoolForKey:@"wantsSystemShellExclusivePriority"];
  BOOL v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"generation"];
  uint64_t v12 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
  if (v6) {
    BOOL v13 = v7 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13 || v11 == 0)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"_UIPhysicalButtonConfiguration.m", 728, @"Invalid encoded configuration: %@", a3 object file lineNumber description];

    v18 = 0;
  }
  else
  {
    v15 = -[_UIPhysicalButtonConfiguration _initWithPhysicalButton:behavior:behaviorOptions:generation:auditToken:](self, [v6 unsignedIntegerValue], objc_msgSend(v7, "unsignedIntegerValue"), v8, objc_msgSend(v11, "unsignedLongLongValue"), v12);
    if (v15)
    {
      uint64_t v16 = [v9 copy];
      v17 = (void *)v15[7];
      v15[7] = v16;

      *((unsigned char *)v15 + 8) = v10;
    }
    self = v15;
    v18 = self;
  }

  return v18;
}

- (unint64_t)_generation
{
  return self->_generation;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3 || !_NSIsNSObject()) {
    return 0;
  }
  v5 = a3;
  unint64_t v6 = [(_UIPhysicalButtonConfiguration *)self hash];
  BOOL v7 = v6 == [v5 hash]
    && -[_UIPhysicalButtonConfiguration _isEqualToConfigurationMinusGeneration:]((BOOL)self, (uint64_t)v5)
    && self->_generation == v5[5];

  return v7;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendUnsignedInteger:self->_button];
  id v5 = (id)[v3 appendUnsignedInteger:self->_behavior];
  id v6 = (id)[v3 appendObject:self->_behaviorOptions];
  id v7 = (id)[v3 appendObject:self->_auditToken];
  id v8 = (id)[v3 appendString:self->_name];
  id v9 = (id)[v3 appendBool:self->_wantsSystemShellExclusivePriority];
  id v10 = (id)[v3 appendInt64:self->_generation];
  unint64_t v11 = [v3 hash];

  return v11;
}

- (BOOL)_isEqualToConfigurationMinusGeneration:(BOOL)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = objc_opt_class();
    if (v4 != objc_opt_class()
      || *(void *)(v3 + 16) != *(void *)(a2 + 16)
      || *(void *)(v3 + 24) != *(void *)(a2 + 24))
    {
      return 0;
    }
    id v5 = *(void **)(a2 + 32);
    id v6 = *(id *)(v3 + 32);
    id v7 = v5;
    if (v6 == v7)
    {
    }
    else
    {
      id v8 = v7;
      if (!v6 || !v7) {
        goto LABEL_22;
      }
      int v9 = [v6 isEqual:v7];

      if (!v9) {
        return 0;
      }
    }
    id v10 = *(void **)(a2 + 48);
    id v6 = *(id *)(v3 + 48);
    id v11 = v10;
    if (v6 == v11)
    {
    }
    else
    {
      id v8 = v11;
      if (!v6 || !v11) {
        goto LABEL_22;
      }
      int v12 = [v6 isEqual:v11];

      if (!v12) {
        return 0;
      }
    }
    BOOL v13 = *(void **)(a2 + 56);
    id v6 = *(id *)(v3 + 56);
    id v14 = v13;
    if (v6 == v14)
    {

      return *(unsigned __int8 *)(v3 + 8) == *(unsigned __int8 *)(a2 + 8);
    }
    id v8 = v14;
    if (v6 && v14)
    {
      int v15 = [v6 isEqual:v14];

      if (v15) {
        return *(unsigned __int8 *)(v3 + 8) == *(unsigned __int8 *)(a2 + 8);
      }
      return 0;
    }
LABEL_22:

    return 0;
  }
  return result;
}

+ (id)_cameraShutterConfigurationsWithOptionsProvider:(id)a3
{
  return +[_UIPhysicalButtonConfiguration _cameraShutterConfigurationsForButtons:buttonsCount:withOptionsProvider:]((uint64_t)a1, _cameraShutterConfigurationsWithOptionsProvider__buttons, 4, (uint64_t)a3);
}

+ (id)_volumeCameraShutterConfigurationsWithOptionsProvider:(id)a3
{
  return +[_UIPhysicalButtonConfiguration _cameraShutterConfigurationsForButtons:buttonsCount:withOptionsProvider:]((uint64_t)a1, (uint64_t *)&_volumeCameraShutterConfigurationsWithOptionsProvider__buttons, 2, (uint64_t)a3);
}

+ (id)_cameraCaptureShutterConfigurationWithOptionsProvider:(id)a3
{
  return +[_UIPhysicalButtonConfiguration _cameraShutterConfigurationsForButtons:buttonsCount:withOptionsProvider:]((uint64_t)a1, &_cameraCaptureShutterConfigurationWithOptionsProvider__buttons, 1, (uint64_t)a3);
}

+ (id)_cameraShutterConfigurationsWithOptions:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74___UIPhysicalButtonConfiguration__cameraShutterConfigurationsWithOptions___block_invoke;
  v5[3] = &unk_1E5311070;
  v5[4] = a3;
  uint64_t v3 = [a1 _cameraShutterConfigurationsWithOptionsProvider:v5];
  return v3;
}

+ (id)_cameraShutterConfigurations
{
  return (id)[a1 _cameraShutterConfigurationsWithOptionsProvider:0];
}

+ (id)_ringerButtonDynamicActionConfiguration
{
  v2 = +[_UIPhysicalButtonConfiguration _configurationWithPhysicalButton:3 behavior:1 behaviorOptions:0];
  uint64_t v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];

  return v3;
}

+ (id)_volumeConfigurations
{
  v2 = +[_UIPhysicalButtonConfiguration _configurationWithPhysicalButton:1 behavior:2 behaviorOptions:0];
  uint64_t v3 = +[_UIPhysicalButtonConfiguration _configurationWithPhysicalButton:2 behavior:2 behaviorOptions:0];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v2, v3, 0);

  return v4;
}

- (_UIPhysicalButtonConfiguration)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButtonConfiguration.m", 435, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonConfiguration init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIPhysicalButtonConfiguration *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  v2 = [(_UIPhysicalButtonConfiguration *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  uint64_t v4 = _NSStringFromUIPhysicalButton(self->_button);
  [v3 appendString:v4 withName:@"button"];
  id v5 = _NSStringFromUIPhysicalButtonBehavior(self->_behavior);
  [v3 appendString:v5 withName:@"behavior"];
  behaviorOptions = self->_behaviorOptions;
  if (behaviorOptions)
  {
    id v7 = NSString;
    id v8 = behaviorOptions;
    int v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    id v11 = [v7 stringWithFormat:@"<%@: %p>", v10, v8];
  }
  else
  {
    id v11 = @"(nil)";
  }
  id v12 = (id)[v3 appendObject:v11 withName:@"behaviorOptions" skipIfNil:1];

  id v13 = (id)[v3 appendUInt64:self->_generation withName:@"generation"];
  id v14 = (id)objc_msgSend(v3, "appendInt:withName:", -[BSAuditToken pid](self->_auditToken, "pid"), @"pid");

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIPhysicalButtonConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIPhysicalButtonConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72___UIPhysicalButtonConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  id v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = [NSNumber numberWithUnsignedInteger:self->_button];
  id v5 = [NSNumber numberWithUnsignedInteger:self->_behavior];
  id v6 = [NSNumber numberWithUnsignedLongLong:self->_generation];
  [a3 encodeObject:v7 forKey:@"button"];
  [a3 encodeObject:v5 forKey:@"behavior"];
  [a3 encodeObject:self->_behaviorOptions forKey:@"behaviorOptions"];
  [a3 encodeObject:self->_name forKey:@"name"];
  [a3 encodeBool:self->_wantsSystemShellExclusivePriority forKey:@"wantsSystemShellExclusivePriority"];
  [a3 encodeObject:v6 forKey:@"generation"];
  [a3 encodeObject:self->_auditToken forKey:@"auditToken"];
}

- (_UIPhysicalButtonConfiguration)initWithCoder:(id)a3
{
  id v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"button"];
  id v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"behavior"];
  id v8 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"behaviorOptions"];
  int v9 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
  char v10 = [a3 decodeBoolForKey:@"wantsSystemShellExclusivePriority"];
  id v11 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"generation"];
  id v12 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"auditToken"];
  id v13 = v12;
  if (v6) {
    BOOL v14 = v7 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14 || v11 == 0 || v12 == 0)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_UIPhysicalButtonConfiguration.m", 636, @"Invalid encoded configuration: %@", a3 object file lineNumber description];

    v20 = 0;
  }
  else
  {
    v17 = -[_UIPhysicalButtonConfiguration _initWithPhysicalButton:behavior:behaviorOptions:generation:auditToken:](self, [v6 unsignedIntegerValue], objc_msgSend(v7, "unsignedIntegerValue"), v8, objc_msgSend(v11, "unsignedLongLongValue"), v12);
    if (v17)
    {
      uint64_t v18 = [v9 copy];
      v19 = (void *)v17[7];
      v17[7] = v18;

      *((unsigned char *)v17 + 8) = v10;
    }
    self = v17;
    v20 = self;
  }

  return v20;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v5 = (const char *)[@"button" UTF8String];
  id v6 = (const char *)[@"behavior" UTF8String];
  [@"behaviorOptions" UTF8String];
  [@"name" UTF8String];
  id v7 = (const char *)[@"wantsSystemShellExclusivePriority" UTF8String];
  id v8 = (const char *)[@"generation" UTF8String];
  [@"auditToken" UTF8String];
  xpc_dictionary_set_uint64(a3, v5, self->_button);
  xpc_dictionary_set_uint64(a3, v6, self->_behavior);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(a3, v7, self->_wantsSystemShellExclusivePriority);
  xpc_dictionary_set_uint64(a3, v8, self->_generation);
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
}

- (_UIPhysicalButtonConfiguration)initWithXPCDictionary:(id)a3
{
  uint64_t v4 = (const char *)[@"button" UTF8String];
  id v5 = (const char *)[@"behavior" UTF8String];
  [@"behaviorOptions" UTF8String];
  [@"name" UTF8String];
  id v6 = (const char *)[@"wantsSystemShellExclusivePriority" UTF8String];
  id v7 = (const char *)[@"generation" UTF8String];
  [@"auditToken" UTF8String];
  uint64_t uint64 = xpc_dictionary_get_uint64(a3, v4);
  uint64_t v9 = xpc_dictionary_get_uint64(a3, v5);
  char v10 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  id v11 = (void *)BSCreateDeserializedStringFromXPCDictionaryWithKey();
  BOOL v12 = xpc_dictionary_get_BOOL(a3, v6);
  uint64_t v13 = xpc_dictionary_get_uint64(a3, v7);
  BOOL v14 = (void *)BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  int v15 = (_UIPhysicalButtonConfiguration *)-[_UIPhysicalButtonConfiguration _initWithPhysicalButton:behavior:behaviorOptions:generation:auditToken:](self, uint64, v9, v10, v13, v14);
  if (v15)
  {
    uint64_t v16 = [v11 copy];
    name = v15->_name;
    v15->_name = (NSString *)v16;

    v15->_wantsSystemShellExclusivePriority = v12;
  }

  return v15;
}

- (NSString)_name
{
  return self->_name;
}

- (BOOL)_wantsSystemShellExclusivePriority
{
  return self->_wantsSystemShellExclusivePriority;
}

@end