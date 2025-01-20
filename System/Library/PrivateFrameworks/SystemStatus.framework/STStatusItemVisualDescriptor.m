@interface STStatusItemVisualDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)_defaultVisualDescriptors;
+ (id)visualDescriptorForStatusItemWithIdentifier:(id)a3;
- (BOOL)isCallToAction;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)imageName;
- (NSString)packageName;
- (NSString)systemImageName;
- (NSString)textLabel;
- (STStatusItemVisualDescriptor)initWithCoder:(id)a3;
- (STStatusItemVisualDescriptor)initWithPlistRepresentation:(id)a3;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STStatusItemVisualDescriptor

- (NSString)description
{
  return (NSString *)[(STStatusItemVisualDescriptor *)self descriptionWithMultilinePrefix:0];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  v6 = [(STStatusItemVisualDescriptor *)self packageName];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __40__STStatusItemVisualDescriptor_isEqual___block_invoke;
  v30[3] = &unk_1E6B630A8;
  id v7 = v4;
  id v31 = v7;
  id v8 = (id)[v5 appendString:v6 counterpart:v30];

  v9 = [(STStatusItemVisualDescriptor *)self systemImageName];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __40__STStatusItemVisualDescriptor_isEqual___block_invoke_2;
  v28[3] = &unk_1E6B630A8;
  id v10 = v7;
  id v29 = v10;
  id v11 = (id)[v5 appendString:v9 counterpart:v28];

  v12 = [(STStatusItemVisualDescriptor *)self imageName];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __40__STStatusItemVisualDescriptor_isEqual___block_invoke_3;
  v26[3] = &unk_1E6B630A8;
  id v13 = v10;
  id v27 = v13;
  id v14 = (id)[v5 appendString:v12 counterpart:v26];

  v15 = [(STStatusItemVisualDescriptor *)self textLabel];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __40__STStatusItemVisualDescriptor_isEqual___block_invoke_4;
  v24[3] = &unk_1E6B630A8;
  id v16 = v13;
  id v25 = v16;
  id v17 = (id)[v5 appendString:v15 counterpart:v24];

  uint64_t v18 = [(STStatusItemVisualDescriptor *)self isCallToAction];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __40__STStatusItemVisualDescriptor_isEqual___block_invoke_5;
  v22[3] = &unk_1E6B630D0;
  id v23 = v16;
  id v19 = v16;
  id v20 = (id)[v5 appendBool:v18 counterpart:v22];
  LOBYTE(v18) = [v5 isEqual];

  return v18;
}

uint64_t __40__STStatusItemVisualDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) packageName];
}

uint64_t __40__STStatusItemVisualDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) systemImageName];
}

uint64_t __40__STStatusItemVisualDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) imageName];
}

uint64_t __40__STStatusItemVisualDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) textLabel];
}

uint64_t __40__STStatusItemVisualDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) isCallToAction];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [(STStatusItemVisualDescriptor *)self packageName];
  id v5 = (id)[v3 appendString:v4];

  v6 = [(STStatusItemVisualDescriptor *)self systemImageName];
  id v7 = (id)[v3 appendString:v6];

  id v8 = [(STStatusItemVisualDescriptor *)self imageName];
  id v9 = (id)[v3 appendString:v8];

  id v10 = [(STStatusItemVisualDescriptor *)self textLabel];
  id v11 = (id)[v3 appendString:v10];

  id v12 = (id)objc_msgSend(v3, "appendBool:", -[STStatusItemVisualDescriptor isCallToAction](self, "isCallToAction"));
  unint64_t v13 = [v3 hash];

  return v13;
}

- (id)succinctDescription
{
  v2 = [(STStatusItemVisualDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STStatusItemVisualDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STStatusItemVisualDescriptor *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STStatusItemVisualDescriptor *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STStatusItemVisualDescriptor *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  id v8 = [v7 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__STStatusItemVisualDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E6B63080;
  id v9 = v7;
  id v13 = v9;
  id v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

id __80__STStatusItemVisualDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) packageName];
  [v2 appendString:v3 withName:@"packageName" skipIfEmpty:1];

  BOOL v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) systemImageName];
  [v4 appendString:v5 withName:@"systemImageName" skipIfEmpty:1];

  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) imageName];
  [v6 appendString:v7 withName:@"imageName" skipIfEmpty:1];

  id v8 = *(void **)(a1 + 32);
  id v9 = [*(id *)(a1 + 40) textLabel];
  [v8 appendString:v9 withName:@"textLabel" skipIfEmpty:1];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isCallToAction"), @"callToAction", 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(STStatusItemVisualDescriptor *)self packageName];
  [v8 encodeObject:v4 forKey:@"packageName"];

  id v5 = [(STStatusItemVisualDescriptor *)self systemImageName];
  [v8 encodeObject:v5 forKey:@"systemImageName"];

  id v6 = [(STStatusItemVisualDescriptor *)self imageName];
  [v8 encodeObject:v6 forKey:@"imageName"];

  id v7 = [(STStatusItemVisualDescriptor *)self textLabel];
  [v8 encodeObject:v7 forKey:@"textLabel"];

  objc_msgSend(v8, "encodeBool:forKey:", -[STStatusItemVisualDescriptor isCallToAction](self, "isCallToAction"), @"callToAction");
}

- (STStatusItemVisualDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v4 decodeObjectOfClass:v5 forKey:@"packageName"];
  id v7 = [v4 decodeObjectOfClass:v5 forKey:@"systemImageName"];
  id v8 = [v4 decodeObjectOfClass:v5 forKey:@"imageName"];
  id v9 = [v4 decodeObjectOfClass:v5 forKey:@"textLabel"];
  char v10 = [v4 decodeBoolForKey:@"callToAction"];

  v21.receiver = self;
  v21.super_class = (Class)STStatusItemVisualDescriptor;
  id v11 = [(STStatusItemVisualDescriptor *)&v21 init];
  if (v11)
  {
    uint64_t v12 = [v6 copy];
    packageName = v11->_packageName;
    v11->_packageName = (NSString *)v12;

    uint64_t v14 = [v7 copy];
    systemImageName = v11->_systemImageName;
    v11->_systemImageName = (NSString *)v14;

    uint64_t v16 = [v8 copy];
    imageName = v11->_imageName;
    v11->_imageName = (NSString *)v16;

    uint64_t v18 = [v9 copy];
    textLabel = v11->_textLabel;
    v11->_textLabel = (NSString *)v18;

    v11->_callToAction = v10;
  }

  return v11;
}

- (STStatusItemVisualDescriptor)initWithPlistRepresentation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STStatusItemVisualDescriptor;
  uint64_t v5 = [(STStatusItemVisualDescriptor *)&v14 init];
  if (v5)
  {
    id v6 = objc_msgSend(v4, "bs_safeDictionaryForKey:", @"SystemImage");
    uint64_t v7 = objc_msgSend(v6, "bs_safeStringForKey:", @"InternalSymbolName");
    systemImageName = v5->_systemImageName;
    v5->_systemImageName = (NSString *)v7;

    uint64_t v9 = objc_msgSend(v4, "bs_safeStringForKey:", @"TextLabel");
    textLabel = v5->_textLabel;
    v5->_textLabel = (NSString *)v9;

    v5->_callToAction = objc_msgSend(v4, "bs_BOOLForKey:", @"IsCallToAction");
    if (!v5->_textLabel && !v5->_systemImageName && !v5->_imageName && !v5->_packageName)
    {
      id v11 = STSystemStatusLogBundleLoading();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v13 = 0;
        _os_log_error_impl(&dword_1D9514000, v11, OS_LOG_TYPE_ERROR, "A visual descriptor should have a systemImage, image, package, or textLabel — but this one doesn't!", v13, 2u);
      }
    }
  }

  return v5;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)textLabel
{
  return self->_textLabel;
}

- (BOOL)isCallToAction
{
  return self->_callToAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);

  objc_storeStrong((id *)&self->_packageName, 0);
}

+ (id)visualDescriptorForStatusItemWithIdentifier:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__STStatusItemVisualDescriptor_BuiltIns__visualDescriptorForStatusItemWithIdentifier___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v3 = _MergedGlobals_1_0;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_MergedGlobals_1_0, block);
  }
  uint64_t v5 = [(id)qword_1EB5A3508 objectForKey:v4];

  return v5;
}

uint64_t __86__STStatusItemVisualDescriptor_BuiltIns__visualDescriptorForStatusItemWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _defaultVisualDescriptors];
  uint64_t v2 = qword_1EB5A3508;
  qword_1EB5A3508 = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

+ (id)_defaultVisualDescriptors
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = objc_opt_new();
  [v3 setSystemImageName:@"airplane"];
  [v2 setObject:v3 forKey:@"com.apple.systemstatus.status-item.AirplaneMode"];

  id v4 = objc_opt_new();
  [v4 setSystemImageName:@"airplayvideo"];
  [v2 setObject:v4 forKey:@"com.apple.systemstatus.status-item.AirPlay"];

  uint64_t v5 = objc_opt_new();
  [v5 setSystemImageName:@"alarm.fill"];
  [v2 setObject:v5 forKey:@"com.apple.systemstatus.status-item.Alarm"];

  id v6 = objc_opt_new();
  [v6 setSystemImageName:@"carplay"];
  [v2 setObject:v6 forKey:@"com.apple.systemstatus.status-item.CarPlay"];

  uint64_t v7 = objc_opt_new();
  [v7 setSystemImageName:@"display.trianglebadge.exclamationmark"];
  [v2 setObject:v7 forKey:@"com.apple.systemstatus.status-item.DisplayWarning"];

  id v8 = objc_opt_new();
  [v8 setSystemImageName:@"drop.triangle.fill"];
  [v8 setImageName:@"LiquidDetection"];
  [v2 setObject:v8 forKey:@"com.apple.systemstatus.status-item.LiquidDetection"];

  uint64_t v9 = objc_opt_new();
  [v9 setSystemImageName:@"lock.rotation"];
  [v2 setObject:v9 forKey:@"com.apple.systemstatus.status-item.RotationLock"];

  char v10 = objc_opt_new();
  [v10 setImageName:@"Student"];
  [v2 setObject:v10 forKey:@"com.apple.systemstatus.status-item.Student"];

  id v11 = objc_opt_new();
  [v11 setSystemImageName:@"teletype"];
  [v2 setObject:v11 forKey:@"com.apple.systemstatus.status-item.TTY"];

  uint64_t v12 = objc_opt_new();
  [v12 setImageName:@"VPN"];
  [v2 setObject:v12 forKey:@"com.apple.systemstatus.status-item.VPN"];

  return v2;
}

@end