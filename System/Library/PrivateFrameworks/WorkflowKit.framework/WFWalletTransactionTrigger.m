@interface WFWalletTransactionTrigger
+ (BOOL)isAllowedToRunAutomatically;
+ (BOOL)isSupportedOnThisDevice;
+ (BOOL)isUserInitiated;
+ (BOOL)supportsSecureCoding;
+ (id)displayGlyph;
+ (id)localizedDisplayExplanation;
+ (id)localizedDisplayName;
+ (int64_t)triggerBacking;
- (BOOL)hasValidConfiguration;
- (BOOL)isEqual:(id)a3;
- (Class)shortcutInputContentItemClass;
- (NSArray)selectedMerchantTypes;
- (NSArray)selectedMerchants;
- (NSArray)selectedPassUniqueIDs;
- (WFWalletTransactionTrigger)init;
- (WFWalletTransactionTrigger)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localizedDescriptionWithConfigurationSummary;
- (id)localizedPastTenseDescription;
- (id)suggestedActions;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedMerchantTypes:(id)a3;
- (void)setSelectedMerchants:(id)a3;
- (void)setSelectedPassUniqueIDs:(id)a3;
@end

@implementation WFWalletTransactionTrigger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedMerchants, 0);
  objc_storeStrong((id *)&self->_selectedMerchantTypes, 0);
  objc_storeStrong((id *)&self->_selectedPassUniqueIDs, 0);
}

- (void)setSelectedMerchants:(id)a3
{
}

- (NSArray)selectedMerchants
{
  return self->_selectedMerchants;
}

- (void)setSelectedMerchantTypes:(id)a3
{
}

- (NSArray)selectedMerchantTypes
{
  return self->_selectedMerchantTypes;
}

- (void)setSelectedPassUniqueIDs:(id)a3
{
}

- (NSArray)selectedPassUniqueIDs
{
  return self->_selectedPassUniqueIDs;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(WFWalletTransactionTrigger *)self selectedPassUniqueIDs];
  v7 = [(WFWalletTransactionTrigger *)self selectedMerchantTypes];
  v8 = [(WFWalletTransactionTrigger *)self selectedMerchants];
  v9 = [v3 stringWithFormat:@"<%@: %p, selectedPassUniqueIDs: %@, selectedMerchantTypes: %@, selectedMerchants: %@>", v5, self, v6, v7, v8];

  return v9;
}

- (id)suggestedActions
{
  v2 = +[WFActionRegistry sharedRegistry];
  v3 = [v2 createActionsWithIdentifiers:&unk_1F2317928 serializedParameterArray:0];
  v4 = objc_msgSend(v3, "if_objectsPassingTest:", &__block_literal_global_22633);

  return v4;
}

BOOL __46__WFWalletTransactionTrigger_suggestedActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (Class)shortcutInputContentItemClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WFWalletTransactionTrigger *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    v7 = [(WFWalletTransactionTrigger *)self selectedPassUniqueIDs];
    v8 = [(WFWalletTransactionTrigger *)v6 selectedPassUniqueIDs];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      id v14 = v9;
      if (!v9 || !v10) {
        goto LABEL_25;
      }
      int v15 = [v9 isEqual:v10];

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    v16 = [(WFWalletTransactionTrigger *)self selectedMerchantTypes];
    v17 = [(WFWalletTransactionTrigger *)v6 selectedMerchantTypes];
    id v14 = v16;
    id v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {
    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      id v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      int v12 = [v14 isEqual:v18];

      if (!v12) {
        goto LABEL_25;
      }
    }
    v21 = [(WFWalletTransactionTrigger *)self selectedMerchants];
    v22 = [(WFWalletTransactionTrigger *)v6 selectedMerchants];
    id v20 = v21;
    id v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23) {
        LOBYTE(v12) = [v20 isEqual:v23];
      }
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFWalletTransactionTrigger;
  id v4 = [(WFTrigger *)&v10 copyWithZone:a3];
  v5 = [(WFWalletTransactionTrigger *)self selectedPassUniqueIDs];
  v6 = (void *)[v5 copy];
  [v4 setSelectedPassUniqueIDs:v6];

  v7 = [(WFWalletTransactionTrigger *)self selectedMerchantTypes];
  [v4 setSelectedMerchantTypes:v7];

  v8 = [(WFWalletTransactionTrigger *)self selectedMerchants];
  [v4 setSelectedMerchants:v8];

  return v4;
}

- (WFWalletTransactionTrigger)initWithCoder:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)WFWalletTransactionTrigger;
  v5 = [(WFTrigger *)&v23 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"selectedPassUniqueIDs"];
    selectedPassUniqueIDs = v5->_selectedPassUniqueIDs;
    v5->_selectedPassUniqueIDs = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"selectedMerchantTypes"];
    selectedMerchantTypes = v5->_selectedMerchantTypes;
    v5->_selectedMerchantTypes = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    id v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"selectedMerchants"];
    selectedMerchants = v5->_selectedMerchants;
    v5->_selectedMerchants = (NSArray *)v19;

    v21 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFWalletTransactionTrigger;
  id v4 = a3;
  [(WFTrigger *)&v8 encodeWithCoder:v4];
  v5 = [(WFWalletTransactionTrigger *)self selectedPassUniqueIDs];
  [v4 encodeObject:v5 forKey:@"selectedPassUniqueIDs"];

  v6 = [(WFWalletTransactionTrigger *)self selectedMerchantTypes];
  [v4 encodeObject:v6 forKey:@"selectedMerchantTypes"];

  v7 = [(WFWalletTransactionTrigger *)self selectedMerchants];
  [v4 encodeObject:v7 forKey:@"selectedMerchants"];
}

- (id)localizedPastTenseDescription
{
  return WFPassTypeToLocalizedDescriptionWithTrigger(self, 1);
}

- (id)localizedDescriptionWithConfigurationSummary
{
  return WFPassTypeToLocalizedDescriptionWithTrigger(self, 0);
}

- (BOOL)hasValidConfiguration
{
  id v2 = [(WFWalletTransactionTrigger *)self selectedPassUniqueIDs];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (WFWalletTransactionTrigger)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFWalletTransactionTrigger;
  id v2 = [(WFTrigger *)&v8 init];
  BOOL v3 = v2;
  if (v2)
  {
    selectedPassUniqueIDs = v2->_selectedPassUniqueIDs;
    v2->_selectedPassUniqueIDs = (NSArray *)MEMORY[0x1E4F1CBF0];

    selectedMerchantTypes = v3->_selectedMerchantTypes;
    v3->_selectedMerchantTypes = (NSArray *)&unk_1F2317910;

    v6 = v3;
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)triggerBacking
{
  return 2;
}

+ (id)displayGlyph
{
  id v2 = (void *)MEMORY[0x1E4FB4770];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:a1];
  id v4 = [v2 imageNamed:@"Wallet" inBundle:v3];

  return v4;
}

+ (id)localizedDisplayExplanation
{
  return WFLocalizedString(@"Ex. “When I tap a Wallet Card or Pass”");
}

+ (id)localizedDisplayName
{
  return WFLocalizedString(@"Transaction");
}

+ (BOOL)isSupportedOnThisDevice
{
  return 1;
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