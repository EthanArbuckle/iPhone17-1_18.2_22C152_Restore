@interface WFNFCTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)isSupportedOnThisDevice;
+ (BOOL)isUserInitiated;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyphName;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (NSString)name;
- (NSString)tagIdentifier;
- (WFNFCTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (void)encodeWithCoder:(id)a3;
- (void)setName:(id)a3;
- (void)setTagIdentifier:(id)a3;
@end

@implementation WFNFCTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_tagIdentifier, 0);
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setTagIdentifier:(id)a3
{
}

- (NSString)tagIdentifier
{
  return self->_tagIdentifier;
}

- (id)suggestedActions
{
  v2 = +[WFActionRegistry sharedRegistry];
  v3 = [v2 createActionsWithIdentifiers:&unk_1F23179B8 serializedParameterArray:0];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFNFCTrigger;
  id v4 = [(WFTrigger *)&v8 copyWithZone:a3];
  v5 = [(WFNFCTrigger *)self tagIdentifier];
  [v4 setTagIdentifier:v5];

  v6 = [(WFNFCTrigger *)self name];
  [v4 setName:v6];

  return v4;
}

- (WFNFCTrigger)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFNFCTrigger;
  v5 = [(WFTrigger *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tagIdentifier"];
    tagIdentifier = v5->_tagIdentifier;
    v5->_tagIdentifier = (NSString *)v6;

    objc_super v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    v9 = v8;
    if (!v8)
    {
      v9 = WFLocalizedString(@"NFC tag");
    }
    objc_storeStrong((id *)&v5->_name, v9);
    if (!v8) {

    }
    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFNFCTrigger;
  id v4 = a3;
  [(WFTrigger *)&v7 encodeWithCoder:v4];
  v5 = [(WFNFCTrigger *)self tagIdentifier];
  [v4 encodeObject:v5 forKey:@"tagIdentifier"];

  uint64_t v6 = [(WFNFCTrigger *)self name];
  [v4 encodeObject:v6 forKey:@"name"];
}

- (id)localizedPastTenseDescription
{
  v3 = NSString;
  id v4 = WFLocalizedString(@"“%@” detected");
  v5 = [(WFNFCTrigger *)self name];
  uint64_t v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  return v6;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  v3 = NSString;
  id v4 = WFLocalizedString(@"When “%@” is detected");
  v5 = [(WFNFCTrigger *)self name];
  uint64_t v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  return v6;
}

- (BOOL)hasValidConfiguration
{
  v3 = [(WFNFCTrigger *)self tagIdentifier];
  if (v3)
  {
    id v4 = [(WFNFCTrigger *)self name];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)displayGlyphName
{
  return @"nfc";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When I tap an NFC tag”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"NFC");
}

+ (BOOL)isSupportedOnThisDevice
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getNFHardwareManagerClass_softClass;
  uint64_t v11 = getNFHardwareManagerClass_softClass;
  if (!getNFHardwareManagerClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getNFHardwareManagerClass_block_invoke;
    v7[3] = &unk_1E6558B78;
    v7[4] = &v8;
    __getNFHardwareManagerClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = [v3 sharedHardwareManager];
  char v5 = [v4 isBackgroundTagReadingAvailable];

  return v5;
}

+ (BOOL)isUserInitiated
{
  return 1;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

@end