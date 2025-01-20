@interface VCConfiguredSleepWorkflow
+ (BOOL)supportsSecureCoding;
+ (CGSize)glyphSize;
- (BOOL)isAppLaunchWorkflow;
- (CGImage)iconImage;
- (NSString)actionIdentifier;
- (NSString)bundleIdentifierForDisplay;
- (NSString)description;
- (NSString)name;
- (NSString)summaryString;
- (VCConfiguredSleepWorkflow)initWithCoder:(id)a3;
- (VCConfiguredSleepWorkflow)initWithWorkflowIdentifier:(id)a3 bundleIdentifierForDisplay:(id)a4 summaryString:(id)a5 name:(id)a6 actionIdentifier:(id)a7 glyphCharacter:(unsigned __int16)a8 backgroundColorValue:(int64_t)a9 isAppLaunchWorkflow:(BOOL)a10;
- (double)iconScale;
- (int64_t)backgroundColorValue;
- (unsigned)glyphCharacter;
- (void)encodeWithCoder:(id)a3;
- (void)setIconImage:(CGImage *)a3 scale:(double)a4;
@end

@implementation VCConfiguredSleepWorkflow

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_summaryString, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForDisplay, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (int64_t)backgroundColorValue
{
  return self->_backgroundColorValue;
}

- (BOOL)isAppLaunchWorkflow
{
  return self->_isAppLaunchWorkflow;
}

- (double)iconScale
{
  return self->_iconScale;
}

- (CGImage)iconImage
{
  return self->_iconImage;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)summaryString
{
  return self->_summaryString;
}

- (NSString)bundleIdentifierForDisplay
{
  return self->_bundleIdentifierForDisplay;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(WFDatabaseObjectDescriptor *)self identifier];
  v6 = [(VCConfiguredSleepWorkflow *)self summaryString];
  v7 = [(VCConfiguredSleepWorkflow *)self bundleIdentifierForDisplay];
  v8 = [(VCConfiguredSleepWorkflow *)self name];
  v9 = [(VCConfiguredSleepWorkflow *)self actionIdentifier];
  v10 = [v3 stringWithFormat:@"<%@: %p, identifier: %@, summaryString: %@, bundleIdentifierForDisplay: %@, name: %@, actionIdentifier: %@, isAppLaunchWorkflow: %d>", v4, self, v5, v6, v7, v8, v9, -[VCConfiguredSleepWorkflow isAppLaunchWorkflow](self, "isAppLaunchWorkflow")];

  return (NSString *)v10;
}

- (VCConfiguredSleepWorkflow)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)VCConfiguredSleepWorkflow;
  v5 = [(WFDatabaseObjectDescriptor *)&v16 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifierForDisplay"];
    bundleIdentifierForDisplay = v5->_bundleIdentifierForDisplay;
    v5->_bundleIdentifierForDisplay = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"summaryString"];
    summaryString = v5->_summaryString;
    v5->_summaryString = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
    actionIdentifier = v5->_actionIdentifier;
    v5->_actionIdentifier = (NSString *)v12;

    v5->_glyphCharacter = [v4 decodeInt32ForKey:@"glyphCharacter"];
    v5->_backgroundColorValue = [v4 decodeIntegerForKey:@"backgroundColorValue"];
    v5->_isAppLaunchWorkflow = [v4 decodeBoolForKey:@"isAppLaunchWorkflow"];
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)VCConfiguredSleepWorkflow;
  id v4 = a3;
  [(WFDatabaseObjectDescriptor *)&v9 encodeWithCoder:v4];
  v5 = [(VCConfiguredSleepWorkflow *)self bundleIdentifierForDisplay];
  [v4 encodeObject:v5 forKey:@"bundleIdentifierForDisplay"];

  uint64_t v6 = [(VCConfiguredSleepWorkflow *)self summaryString];
  [v4 encodeObject:v6 forKey:@"summaryString"];

  v7 = [(VCConfiguredSleepWorkflow *)self name];
  [v4 encodeObject:v7 forKey:@"name"];

  uint64_t v8 = [(VCConfiguredSleepWorkflow *)self actionIdentifier];
  [v4 encodeObject:v8 forKey:@"actionIdentifier"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[VCConfiguredSleepWorkflow backgroundColorValue](self, "backgroundColorValue"), @"backgroundColorValue");
  objc_msgSend(v4, "encodeInt32:forKey:", -[VCConfiguredSleepWorkflow glyphCharacter](self, "glyphCharacter"), @"glyphCharacter");
  objc_msgSend(v4, "encodeBool:forKey:", -[VCConfiguredSleepWorkflow isAppLaunchWorkflow](self, "isAppLaunchWorkflow"), @"isAppLaunchWorkflow");
}

- (void)setIconImage:(CGImage *)a3 scale:(double)a4
{
  CGImageRelease(self->_iconImage);
  self->_iconImage = a3;
  self->_iconScale = a4;
  CGImageRetain(a3);
}

- (VCConfiguredSleepWorkflow)initWithWorkflowIdentifier:(id)a3 bundleIdentifierForDisplay:(id)a4 summaryString:(id)a5 name:(id)a6 actionIdentifier:(id)a7 glyphCharacter:(unsigned __int16)a8 backgroundColorValue:(int64_t)a9 isAppLaunchWorkflow:(BOOL)a10
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  v31.receiver = self;
  v31.super_class = (Class)VCConfiguredSleepWorkflow;
  v20 = [(WFDatabaseObjectDescriptor *)&v31 initWithIdentifier:a3 objectType:0];
  if (v20)
  {
    uint64_t v21 = [v16 copy];
    bundleIdentifierForDisplay = v20->_bundleIdentifierForDisplay;
    v20->_bundleIdentifierForDisplay = (NSString *)v21;

    uint64_t v23 = [v17 copy];
    summaryString = v20->_summaryString;
    v20->_summaryString = (NSString *)v23;

    uint64_t v25 = [v18 copy];
    name = v20->_name;
    v20->_name = (NSString *)v25;

    uint64_t v27 = [v19 copy];
    actionIdentifier = v20->_actionIdentifier;
    v20->_actionIdentifier = (NSString *)v27;

    v20->_glyphCharacter = a8;
    v20->_backgroundColorValue = a9;
    v20->_isAppLaunchWorkflow = a10;
    v29 = v20;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (CGSize)glyphSize
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2050000000;
  v2 = (void *)getISImageDescriptorClass_softClass_16334;
  uint64_t v24 = getISImageDescriptorClass_softClass_16334;
  if (!getISImageDescriptorClass_softClass_16334)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __getISImageDescriptorClass_block_invoke_16335;
    id v19 = &unk_1E6079C28;
    v20 = &v21;
    __getISImageDescriptorClass_block_invoke_16335((uint64_t)&v16);
    v2 = (void *)v22[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v21, 8);
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  id v4 = (void *)getkISImageDescriptorHomeScreenSymbolLoc_ptr_16336;
  uint64_t v24 = getkISImageDescriptorHomeScreenSymbolLoc_ptr_16336;
  if (!getkISImageDescriptorHomeScreenSymbolLoc_ptr_16336)
  {
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    id v18 = __getkISImageDescriptorHomeScreenSymbolLoc_block_invoke_16337;
    id v19 = &unk_1E6079C28;
    v20 = &v21;
    v5 = IconServicesLibrary_16338();
    uint64_t v6 = dlsym(v5, "kISImageDescriptorHomeScreen");
    *(void *)(v20[1] + 24) = v6;
    getkISImageDescriptorHomeScreenSymbolLoc_ptr_16336 = *(void *)(v20[1] + 24);
    id v4 = (void *)v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (v4)
  {
    v7 = [v3 imageDescriptorNamed:*v4];
    [v7 size];
    double v9 = v8;
    double v11 = v10;

    double v12 = v9;
    double v13 = v11;
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [NSString stringWithUTF8String:"NSString *getkISImageDescriptorHomeScreen(void)"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"VCConfiguredSleepWorkflow.m", 19, @"%s", dlerror());

    __break(1u);
  }
  result.height = v13;
  result.width = v12;
  return result;
}

@end