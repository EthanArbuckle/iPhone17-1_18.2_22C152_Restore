@interface WFAppInBackgroundTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)isUserInitiated;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyphName;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (NSArray)selectedBundleIdentifiers;
- (WFAppInBackgroundTrigger)init;
- (WFAppInBackgroundTrigger)initWithCoder:(id)a3;
- (id)awakeAfterUsingCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedBundleIdentifiers:(id)a3;
@end

@implementation WFAppInBackgroundTrigger

- (void).cxx_destruct
{
}

- (void)setSelectedBundleIdentifiers:(id)a3
{
}

- (NSArray)selectedBundleIdentifiers
{
  return self->_selectedBundleIdentifiers;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFAppInBackgroundTrigger;
  id v4 = [(WFTrigger *)&v8 copyWithZone:a3];
  v5 = [(WFAppInBackgroundTrigger *)self selectedBundleIdentifiers];
  v6 = (void *)[v5 copy];
  [v4 setSelectedBundleIdentifiers:v6];

  return v4;
}

- (id)awakeAfterUsingCoder:(id)a3
{
  id v4 = objc_alloc_init(WFAppInFocusTrigger);
  [(WFAppInFocusTrigger *)v4 setOnFocus:0];
  [(WFAppInFocusTrigger *)v4 setOnBackground:1];

  return v4;
}

- (WFAppInBackgroundTrigger)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WFAppInBackgroundTrigger;
  v5 = [(WFTrigger *)&v23 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E4F1CBF0];
    [(WFAppInBackgroundTrigger *)v5 setSelectedBundleIdentifiers:MEMORY[0x1E4F1CBF0]];
    if ([v4 containsValueForKey:@"appIdentifiers"])
    {
      objc_super v8 = (void *)MEMORY[0x1E4F1CAD0];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      v10 = [v8 setWithArray:v9];
      uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"appIdentifiers"];
      v12 = (void *)v11;
      if (v11) {
        uint64_t v13 = v11;
      }
      else {
        uint64_t v13 = (uint64_t)v7;
      }
      [(WFAppInBackgroundTrigger *)v6 setSelectedBundleIdentifiers:v13];
    }
    else
    {
      if (![v4 containsValueForKey:@"selectedApps"])
      {
LABEL_13:
        v21 = v6;
        goto LABEL_14;
      }
      v14 = (void *)MEMORY[0x1E4F1CAD0];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      v16 = [v14 setWithArray:v15];
      uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"selectedApps"];
      v18 = (void *)v17;
      if (v17) {
        v19 = (void *)v17;
      }
      else {
        v19 = v7;
      }
      id v20 = v19;

      v9 = objc_msgSend(v20, "if_compactMap:", &__block_literal_global_51281);

      [(WFAppInBackgroundTrigger *)v6 setSelectedBundleIdentifiers:v9];
    }

    goto LABEL_13;
  }
LABEL_14:

  return v6;
}

uint64_t __42__WFAppInBackgroundTrigger_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bundleIdentifier];
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFAppInBackgroundTrigger;
  id v4 = a3;
  [(WFTrigger *)&v6 encodeWithCoder:v4];
  v5 = [(WFAppInBackgroundTrigger *)self selectedBundleIdentifiers];
  [v4 encodeObject:v5 forKey:@"appIdentifiers"];
}

- (id)localizedPastTenseDescription
{
  v3 = [(WFAppInBackgroundTrigger *)self selectedBundleIdentifiers];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
    objc_super v6 = [(WFAppInBackgroundTrigger *)self selectedBundleIdentifiers];
    v7 = [v6 objectAtIndexedSubscript:0];
    objc_super v8 = (void *)[v5 initWithBundleIdentifier:v7 allowPlaceholder:1 error:0];

    v9 = [v8 localizedName];
    v10 = NSString;
    uint64_t v11 = WFLocalizedString(@"Closed “%@”");
    v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v9);
  }
  else
  {
    uint64_t v13 = NSString;
    objc_super v8 = WFLocalizedString(@"Closed any of %lu apps");
    v9 = [(WFAppInBackgroundTrigger *)self selectedBundleIdentifiers];
    v12 = objc_msgSend(v13, "localizedStringWithFormat:", v8, objc_msgSend(v9, "count"));
  }

  return v12;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  v3 = [(WFAppInBackgroundTrigger *)self selectedBundleIdentifiers];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F223C8]);
    objc_super v6 = [(WFAppInBackgroundTrigger *)self selectedBundleIdentifiers];
    v7 = [v6 objectAtIndexedSubscript:0];
    objc_super v8 = (void *)[v5 initWithBundleIdentifier:v7 allowPlaceholder:1 error:0];

    v9 = [v8 localizedName];
    v10 = NSString;
    uint64_t v11 = WFLocalizedString(@"When “%@” is closed");
    v12 = objc_msgSend(v10, "localizedStringWithFormat:", v11, v9);
  }
  else
  {
    uint64_t v13 = NSString;
    objc_super v8 = WFLocalizedPluralString(@"When any of %lu apps is closed");
    v9 = [(WFAppInBackgroundTrigger *)self selectedBundleIdentifiers];
    v12 = objc_msgSend(v13, "localizedStringWithFormat:", v8, objc_msgSend(v9, "count"));
  }

  return v12;
}

- (BOOL)hasValidConfiguration
{
  v2 = [(WFAppInBackgroundTrigger *)self selectedBundleIdentifiers];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (WFAppInBackgroundTrigger)init
{
  v7.receiver = self;
  v7.super_class = (Class)WFAppInBackgroundTrigger;
  v2 = [(WFTrigger *)&v7 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    selectedBundleIdentifiers = v2->_selectedBundleIdentifiers;
    v2->_selectedBundleIdentifiers = (NSArray *)v3;

    id v5 = v2;
  }

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)displayGlyphName
{
  return @"xmark.square.fill";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When “Mail” is closed”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Close App");
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