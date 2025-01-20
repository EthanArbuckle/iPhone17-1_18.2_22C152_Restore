@interface WFEmailTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)requiresNotification;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyphName;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (id)mailBlue;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (Class)shortcutInputContentItemClass;
- (NSArray)selectedAccountDescriptions;
- (NSArray)selectedAccountIdentifiers;
- (NSArray)selectedRecipients;
- (NSArray)selectedSenders;
- (NSString)selectedSubject;
- (WFEmailTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedDescriptionWithConfigurationSummaryWithCount:(unint64_t)a3;
- (id)localizedPastTenseDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedAccountDescriptions:(id)a3;
- (void)setSelectedAccountIdentifiers:(id)a3;
- (void)setSelectedRecipients:(id)a3;
- (void)setSelectedSenders:(id)a3;
- (void)setSelectedSubject:(id)a3;
@end

@implementation WFEmailTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedSenders, 0);
  objc_storeStrong((id *)&self->_selectedRecipients, 0);
  objc_storeStrong((id *)&self->_selectedSubject, 0);
  objc_storeStrong((id *)&self->_selectedAccountDescriptions, 0);
  objc_storeStrong((id *)&self->_selectedAccountIdentifiers, 0);
}

- (void)setSelectedSenders:(id)a3
{
}

- (NSArray)selectedSenders
{
  return self->_selectedSenders;
}

- (void)setSelectedRecipients:(id)a3
{
}

- (NSArray)selectedRecipients
{
  return self->_selectedRecipients;
}

- (void)setSelectedSubject:(id)a3
{
}

- (NSString)selectedSubject
{
  return self->_selectedSubject;
}

- (void)setSelectedAccountDescriptions:(id)a3
{
}

- (NSArray)selectedAccountDescriptions
{
  return self->_selectedAccountDescriptions;
}

- (void)setSelectedAccountIdentifiers:(id)a3
{
}

- (NSArray)selectedAccountIdentifiers
{
  return self->_selectedAccountIdentifiers;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)WFEmailTrigger;
  id v4 = [(WFTrigger *)&v16 copyWithZone:a3];
  v5 = [(WFEmailTrigger *)self selectedAccountIdentifiers];
  v6 = (void *)[v5 copy];
  [v4 setSelectedAccountIdentifiers:v6];

  v7 = [(WFEmailTrigger *)self selectedAccountDescriptions];
  v8 = (void *)[v7 copy];
  [v4 setSelectedAccountDescriptions:v8];

  v9 = [(WFEmailTrigger *)self selectedSubject];
  v10 = (void *)[v9 copy];
  [v4 setSelectedSubject:v10];

  v11 = [(WFEmailTrigger *)self selectedRecipients];
  v12 = (void *)[v11 copy];
  [v4 setSelectedRecipients:v12];

  v13 = [(WFEmailTrigger *)self selectedSenders];
  v14 = (void *)[v13 copy];
  [v4 setSelectedSenders:v14];

  return v4;
}

- (WFEmailTrigger)initWithCoder:(id)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WFEmailTrigger;
  v5 = [(WFTrigger *)&v30 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"selectedAccountIdentifiers"];
    selectedAccountIdentifiers = v5->_selectedAccountIdentifiers;
    v5->_selectedAccountIdentifiers = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"selectedAccountDescriptions"];
    selectedAccountDescriptions = v5->_selectedAccountDescriptions;
    v5->_selectedAccountDescriptions = (NSArray *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedSubject"];
    selectedSubject = v5->_selectedSubject;
    v5->_selectedSubject = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    v20 = [v18 setWithArray:v19];
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"selectedRecipients"];
    selectedRecipients = v5->_selectedRecipients;
    v5->_selectedRecipients = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E4F1CAD0];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    v25 = [v23 setWithArray:v24];
    uint64_t v26 = [v4 decodeObjectOfClasses:v25 forKey:@"selectedSenders"];
    selectedSenders = v5->_selectedSenders;
    v5->_selectedSenders = (NSArray *)v26;

    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFEmailTrigger;
  id v4 = a3;
  [(WFTrigger *)&v10 encodeWithCoder:v4];
  v5 = [(WFEmailTrigger *)self selectedAccountIdentifiers];
  [v4 encodeObject:v5 forKey:@"selectedAccountIdentifiers"];

  v6 = [(WFEmailTrigger *)self selectedAccountDescriptions];
  [v4 encodeObject:v6 forKey:@"selectedAccountDescriptions"];

  v7 = [(WFEmailTrigger *)self selectedSubject];
  [v4 encodeObject:v7 forKey:@"selectedSubject"];

  v8 = [(WFEmailTrigger *)self selectedRecipients];
  [v4 encodeObject:v8 forKey:@"selectedRecipients"];

  uint64_t v9 = [(WFEmailTrigger *)self selectedSenders];
  [v4 encodeObject:v9 forKey:@"selectedSenders"];
}

- (Class)shortcutInputContentItemClass
{
  return (Class)objc_opt_class();
}

- (id)localizedPastTenseDescription
{
  return &stru_1F229A4D8;
}

- (id)localizedDescriptionWithConfigurationSummaryWithCount:(unint64_t)a3
{
  v5 = objc_opt_new();
  v6 = [(WFEmailTrigger *)self selectedAccountIdentifiers];

  if (v6)
  {
    v7 = NSString;
    v8 = WFLocalizedString(@"In %@");
    uint64_t v9 = [(WFEmailTrigger *)self selectedAccountDescriptions];
    objc_super v10 = [v9 componentsJoinedByString:@", "];
    v11 = objc_msgSend(v7, "stringWithFormat:", v8, v10);
    [v5 addObject:v11];
  }
  v12 = [(WFEmailTrigger *)self selectedSubject];

  if (v12)
  {
    v13 = NSString;
    uint64_t v14 = WFLocalizedString(@"Subject Contains ‘%@’");
    v15 = [(WFEmailTrigger *)self selectedSubject];
    uint64_t v16 = objc_msgSend(v13, "stringWithFormat:", v14, v15);
    [v5 addObject:v16];
  }
  v17 = [(WFEmailTrigger *)self selectedSenders];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    v19 = NSString;
    v20 = WFLocalizedString(@"From %@");
    uint64_t v21 = [(WFEmailTrigger *)self selectedSenders];
    v22 = [v21 componentsJoinedByString:@", "];
    v23 = objc_msgSend(v19, "stringWithFormat:", v20, v22);
    [v5 addObject:v23];
  }
  v24 = [(WFEmailTrigger *)self selectedRecipients];
  uint64_t v25 = [v24 count];

  if (v25)
  {
    uint64_t v26 = NSString;
    v27 = WFLocalizedString(@"To %@");
    v28 = [(WFEmailTrigger *)self selectedRecipients];
    v29 = [v28 componentsJoinedByString:@", "];
    objc_super v30 = objc_msgSend(v26, "stringWithFormat:", v27, v29);
    [v5 addObject:v30];
  }
  v31 = NSString;
  if (a3 == 1)
  {
    v32 = WFLocalizedString(@"When I Get an Email %@");
    uint64_t v33 = [v5 componentsJoinedByString:@" "];
    v34 = (void *)v33;
  }
  else
  {
    v32 = WFLocalizedString(@"When I Get an Email %@ (%d)");
    uint64_t v33 = [v5 componentsJoinedByString:@" "];
    v34 = (void *)v33;
    unint64_t v37 = a3;
  }
  v35 = objc_msgSend(v31, "stringWithFormat:", v32, v33, v37);

  return v35;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  return [(WFEmailTrigger *)self localizedDescriptionWithConfigurationSummaryWithCount:1];
}

- (BOOL)hasValidConfiguration
{
  v3 = [(WFEmailTrigger *)self selectedSenders];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(WFEmailTrigger *)self selectedSubject];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

+ (id)mailBlue
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4FB45E0]) initWithRed:0.352941185 green:0.784313738 blue:0.980392158 alpha:1.0];
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
  return @"envelope.fill";
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When I get an email from Jane”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Email");
}

+ (BOOL)requiresNotification
{
  return 1;
}

+ (BOOL)isAllowedToRunAutomatically
{
  return 1;
}

@end