@interface WFMessageTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)requiresNotification;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyph;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (id)messagesGreen;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (Class)shortcutInputContentItemClass;
- (NSArray)selectedSenders;
- (NSArray)selectedSendersStrings;
- (NSString)selectedContents;
- (WFMessageTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedDescriptionWithConfigurationSummaryWithCount:(unint64_t)a3;
- (id)localizedPastTenseDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedContents:(id)a3;
- (void)setSelectedSenders:(id)a3;
- (void)setSelectedSendersStrings:(id)a3;
@end

@implementation WFMessageTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedSendersStrings, 0);
  objc_storeStrong((id *)&self->_selectedSenders, 0);
  objc_storeStrong((id *)&self->_selectedContents, 0);
}

- (void)setSelectedSendersStrings:(id)a3
{
}

- (NSArray)selectedSendersStrings
{
  return self->_selectedSendersStrings;
}

- (void)setSelectedSenders:(id)a3
{
}

- (NSArray)selectedSenders
{
  return self->_selectedSenders;
}

- (void)setSelectedContents:(id)a3
{
}

- (NSString)selectedContents
{
  return self->_selectedContents;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WFMessageTrigger;
  id v4 = [(WFTrigger *)&v12 copyWithZone:a3];
  v5 = [(WFMessageTrigger *)self selectedContents];
  v6 = (void *)[v5 copy];
  [v4 setSelectedContents:v6];

  v7 = [(WFMessageTrigger *)self selectedSenders];
  v8 = (void *)[v7 copy];
  [v4 setSelectedSenders:v8];

  v9 = [(WFMessageTrigger *)self selectedSendersStrings];
  v10 = (void *)[v9 copy];
  [v4 setSelectedSendersStrings:v10];

  return v4;
}

- (WFMessageTrigger)initWithCoder:(id)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WFMessageTrigger;
  v5 = [(WFTrigger *)&v22 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"selectedContents"];
    selectedContents = v5->_selectedContents;
    v5->_selectedContents = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = 0;
    v25 = &v24;
    uint64_t v26 = 0x2050000000;
    v9 = (void *)getCNContactClass_softClass;
    uint64_t v27 = getCNContactClass_softClass;
    if (!getCNContactClass_softClass)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __getCNContactClass_block_invoke;
      v23[3] = &unk_1E6558B78;
      v23[4] = &v24;
      __getCNContactClass_block_invoke((uint64_t)v23);
      v9 = (void *)v25[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v24, 8);
    v29[0] = v10;
    v29[1] = objc_opt_class();
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
    objc_super v12 = [v8 setWithArray:v11];
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"selectedSenders"];
    selectedSenders = v5->_selectedSenders;
    v5->_selectedSenders = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    v17 = [v15 setWithArray:v16];
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"selectedSendersStrings"];
    selectedSendersStrings = v5->_selectedSendersStrings;
    v5->_selectedSendersStrings = (NSArray *)v18;

    v20 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFMessageTrigger;
  id v4 = a3;
  [(WFTrigger *)&v8 encodeWithCoder:v4];
  v5 = [(WFMessageTrigger *)self selectedContents];
  [v4 encodeObject:v5 forKey:@"selectedContents"];

  uint64_t v6 = [(WFMessageTrigger *)self selectedSenders];
  [v4 encodeObject:v6 forKey:@"selectedSenders"];

  v7 = [(WFMessageTrigger *)self selectedSendersStrings];
  [v4 encodeObject:v7 forKey:@"selectedSendersStrings"];
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
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_new();
  uint64_t v6 = [(WFMessageTrigger *)self selectedContents];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    objc_super v8 = NSString;
    v9 = WFLocalizedString(@"Containing ‘%@’");
    id v10 = [(WFMessageTrigger *)self selectedContents];
    v11 = objc_msgSend(v8, "stringWithFormat:", v9, v10);
    [v5 addObject:v11];
  }
  objc_super v12 = [(WFMessageTrigger *)self selectedSenders];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    v14 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v15 = [(WFMessageTrigger *)self selectedSenders];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [MEMORY[0x1E4F5A7B8] contactWithCNContact:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          v21 = [v20 triggerDisplayName];
          [v14 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v17);
    }

    objc_super v22 = NSString;
    v23 = WFLocalizedString(@"From %@");
    uint64_t v24 = [v14 componentsJoinedByString:@", "];
    v25 = objc_msgSend(v22, "stringWithFormat:", v23, v24);
    [v5 addObject:v25];
  }
  uint64_t v26 = NSString;
  if (a3 == 1)
  {
    uint64_t v27 = WFLocalizedString(@"When I Get a Message %@");
    uint64_t v28 = [v5 componentsJoinedByString:@" "];
    v29 = (void *)v28;
  }
  else
  {
    uint64_t v27 = WFLocalizedString(@"When I Get a Message %@ (%d)");
    uint64_t v28 = [v5 componentsJoinedByString:@" "];
    v29 = (void *)v28;
    unint64_t v32 = a3;
  }
  v30 = objc_msgSend(v26, "stringWithFormat:", v27, v28, v32);

  return v30;
}

- (id)localizedDescriptionWithConfigurationSummary
{
  return [(WFMessageTrigger *)self localizedDescriptionWithConfigurationSummaryWithCount:1];
}

- (BOOL)hasValidConfiguration
{
  v3 = [(WFMessageTrigger *)self selectedSenders];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(WFMessageTrigger *)self selectedContents];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

+ (id)messagesGreen
{
  return (id)[MEMORY[0x1E4FB45E0] colorWithRed:0.298039228 green:0.850980401 blue:0.392156869 alpha:1.0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)triggerBacking
{
  return 1;
}

+ (id)displayGlyph
{
  return (id)[MEMORY[0x1E4FB4770] triggerDisplaySymbolNamed:@"message.fill" renderingMode:2];
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When I get a message from Mom”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Message");
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