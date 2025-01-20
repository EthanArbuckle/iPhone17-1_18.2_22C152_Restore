@interface VCSleepAction
+ (BOOL)supportsSecureCoding;
+ (id)homeAccessoryActionWithTriggerActionSetsBuilder:(id)a3;
+ (id)identifierForWorkflowActionIdentifier:(id)a3 serializedParameters:(id)a4;
+ (id)openAppActionWithBundleIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGoodForSleep;
- (NSDictionary)serializedParameters;
- (NSString)bundleIdentifierForDisplay;
- (NSString)identifier;
- (NSString)sourceAppBundleIdentifier;
- (NSString)subtitle;
- (NSString)title;
- (NSString)workflowActionIdentifier;
- (VCSleepAction)initWithCoder:(id)a3;
- (VCSleepAction)initWithIdentifier:(id)a3 workflowActionIdentifier:(id)a4 sourceAppBundleIdentifier:(id)a5 bundleIdentifierForDisplay:(id)a6 title:(id)a7 subtitle:(id)a8 serializedParameters:(id)a9 shortcutAvailability:(unint64_t)a10;
- (unint64_t)hash;
- (unint64_t)shortcutAvailability;
- (void)encodeWithCoder:(id)a3;
- (void)setSerializedParameters:(id)a3;
- (void)setSourceAppBundleIdentifier:(id)a3;
- (void)setWorkflowActionIdentifier:(id)a3;
@end

@implementation VCSleepAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_workflowActionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForDisplay, 0);
}

- (void)setSourceAppBundleIdentifier:(id)a3
{
}

- (NSString)sourceAppBundleIdentifier
{
  return self->_sourceAppBundleIdentifier;
}

- (void)setSerializedParameters:(id)a3
{
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (void)setWorkflowActionIdentifier:(id)a3
{
}

- (NSString)workflowActionIdentifier
{
  return self->_workflowActionIdentifier;
}

- (unint64_t)shortcutAvailability
{
  return self->_shortcutAvailability;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isGoodForSleep
{
  return self->_goodForSleep;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)bundleIdentifierForDisplay
{
  return self->_bundleIdentifierForDisplay;
}

- (VCSleepAction)initWithCoder:(id)a3
{
  v18[5] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"workflowActionIdentifier"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"sourceAppBundleIdentifier"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifierForDisplay"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  v18[3] = objc_opt_class();
  v18[4] = objc_opt_class();
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:5];
  v11 = [v9 setWithArray:v10];
  v12 = [v3 decodeObjectOfClasses:v11 forKey:@"serializedParameters"];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutAvailability"];

  v14 = -[VCSleepAction initWithIdentifier:workflowActionIdentifier:sourceAppBundleIdentifier:bundleIdentifierForDisplay:title:subtitle:serializedParameters:shortcutAvailability:](self, "initWithIdentifier:workflowActionIdentifier:sourceAppBundleIdentifier:bundleIdentifierForDisplay:title:subtitle:serializedParameters:shortcutAvailability:", v16, v4, v5, v6, v7, v8, v12, [v13 unsignedIntegerValue]);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(VCSleepAction *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(VCSleepAction *)self sourceAppBundleIdentifier];
  [v4 encodeObject:v6 forKey:@"sourceAppBundleIdentifier"];

  v7 = [(VCSleepAction *)self serializedParameters];
  [v4 encodeObject:v7 forKey:@"serializedParameters"];

  v8 = [(VCSleepAction *)self bundleIdentifierForDisplay];
  [v4 encodeObject:v8 forKey:@"bundleIdentifierForDisplay"];

  v9 = [(VCSleepAction *)self title];
  [v4 encodeObject:v9 forKey:@"title"];

  v10 = [(VCSleepAction *)self subtitle];
  [v4 encodeObject:v10 forKey:@"subtitle"];

  v11 = [(VCSleepAction *)self workflowActionIdentifier];
  [v4 encodeObject:v11 forKey:@"workflowActionIdentifier"];

  objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VCSleepAction shortcutAvailability](self, "shortcutAvailability"));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v12 forKey:@"shortcutAvailability"];
}

- (unint64_t)hash
{
  v2 = [(VCSleepAction *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VCSleepAction *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = [(VCSleepAction *)self identifier];
      v8 = [(VCSleepAction *)v6 identifier];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (VCSleepAction)initWithIdentifier:(id)a3 workflowActionIdentifier:(id)a4 sourceAppBundleIdentifier:(id)a5 bundleIdentifierForDisplay:(id)a6 title:(id)a7 subtitle:(id)a8 serializedParameters:(id)a9 shortcutAvailability:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"VCSleepAction.m", 21, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v18)
    {
LABEL_3:
      if (v19) {
        goto LABEL_4;
      }
LABEL_10:
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      [v43 handleFailureInMethod:a2, self, @"VCSleepAction.m", 23, @"Invalid parameter not satisfying: %@", @"sourceAppBundleIdentifier" object file lineNumber description];

      if (v21) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  v42 = [MEMORY[0x1E4F28B00] currentHandler];
  [v42 handleFailureInMethod:a2, self, @"VCSleepAction.m", 22, @"Invalid parameter not satisfying: %@", @"workflowActionIdentifier" object file lineNumber description];

  if (!v19) {
    goto LABEL_10;
  }
LABEL_4:
  if (v21) {
    goto LABEL_5;
  }
LABEL_11:
  v44 = [MEMORY[0x1E4F28B00] currentHandler];
  [v44 handleFailureInMethod:a2, self, @"VCSleepAction.m", 24, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];

LABEL_5:
  v45.receiver = self;
  v45.super_class = (Class)VCSleepAction;
  v24 = [(VCSleepAction *)&v45 init];
  if (v24)
  {
    uint64_t v25 = [v17 copy];
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    uint64_t v27 = [v18 copy];
    workflowActionIdentifier = v24->_workflowActionIdentifier;
    v24->_workflowActionIdentifier = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    sourceAppBundleIdentifier = v24->_sourceAppBundleIdentifier;
    v24->_sourceAppBundleIdentifier = (NSString *)v29;

    uint64_t v31 = [v20 copy];
    bundleIdentifierForDisplay = v24->_bundleIdentifierForDisplay;
    v24->_bundleIdentifierForDisplay = (NSString *)v31;

    uint64_t v33 = [v21 copy];
    title = v24->_title;
    v24->_title = (NSString *)v33;

    uint64_t v35 = [v22 copy];
    subtitle = v24->_subtitle;
    v24->_subtitle = (NSString *)v35;

    uint64_t v37 = [v23 copy];
    serializedParameters = v24->_serializedParameters;
    v24->_serializedParameters = (NSDictionary *)v37;

    v24->_shortcutAvailability = a10;
    v24->_goodForSleep = a10 != 0;
    v39 = v24;
  }

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)homeAccessoryActionWithTriggerActionSetsBuilder:(id)a3
{
  id v3 = a3;
  id v4 = [[VCSleepHomeAccessoryAction alloc] initWithTriggerActionSetsBuilder:v3];

  return v4;
}

+ (id)identifierForWorkflowActionIdentifier:(id)a3 serializedParameters:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F70C20]);
  id v8 = (id)[v7 combine:v5];
  id v9 = (id)[v7 combineContentsOfPropertyListObject:v6];
  uint64_t v10 = [v7 finalize];
  v11 = objc_msgSend(NSString, "stringWithFormat:", @"%2llX", v10);

  return v11;
}

+ (id)openAppActionWithBundleIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[VCSleepOpenAppAction alloc] initWithBundleIdentifier:v3];

  return v4;
}

@end