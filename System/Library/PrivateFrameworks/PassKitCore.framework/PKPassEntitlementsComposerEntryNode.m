@interface PKPassEntitlementsComposerEntryNode
- (BOOL)editable;
- (BOOL)enabled;
- (BOOL)hasEnabledEntitlements;
- (BOOL)intraAccountSharingEnabled;
- (BOOL)isManagingEntitlementConfiguration;
- (BOOL)isManagingTimeConfiguration;
- (BOOL)possibleIntraAccountSharing;
- (NSArray)allPossibleCapabilitySets;
- (NSArray)allPossibleManageability;
- (NSArray)allPossibleShareability;
- (NSArray)allPossibleVisibility;
- (NSCopying)identifier;
- (NSMutableArray)children;
- (PKPassEntitlementsComposerEntryNode)init;
- (PKPassEntitlementsComposerEntryNode)initWithIdentifier:(id)a3 parentEntitlementComposer:(id)a4;
- (PKPassEntitlementsComposerEntryNode)parent;
- (PKPassShareTimeConfiguration)possibleTimeConfiguration;
- (PKPassShareTimeConfiguration)timeConfiguration;
- (id)_allPossibleCapabilityForAccumulateBlock:(id)a3;
- (id)_effectiveValueForProperty:(unint64_t)a3 ofType:(Class)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)_leastRestrictivePossibleCapabilityForAccumulateBlock:(id)a3 maxCapability:(unint64_t)a4;
- (unint64_t)_mostRestrictiveCapabilityForAccumulateBlock:(id)a3 maxCapability:(unint64_t)a4;
- (unint64_t)manageability;
- (unint64_t)maxSelectionCount;
- (unint64_t)possibleManageability;
- (unint64_t)possibleShareability;
- (unint64_t)possibleVisibility;
- (unint64_t)shareability;
- (unint64_t)visibility;
- (void)_mutateCapability:(id)a3;
- (void)childEntryNodeDidSetProperty:(unint64_t)a3 updatedChildNode:(id)a4;
- (void)enumerateEntitlementEntries:(id)a3;
- (void)parentEntryNodeWillSetProperty:(unint64_t)a3 updatedParentNode:(id)a4;
- (void)resetCapabilities;
- (void)setChildren:(id)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 notifyIfRoot:(BOOL)a4;
- (void)setIntraAccountSharingEnabled:(BOOL)a3;
- (void)setIsManagingEntitlementConfiguration:(BOOL)a3;
- (void)setIsManagingTimeConfiguration:(BOOL)a3;
- (void)setManageability:(unint64_t)a3;
- (void)setParent:(id)a3;
- (void)setShareability:(unint64_t)a3;
- (void)setTimeConfiguration:(id)a3;
- (void)setVisibility:(unint64_t)a3;
- (void)updateCapabilitiesWithSet:(id)a3;
@end

@implementation PKPassEntitlementsComposerEntryNode

- (PKPassEntitlementsComposerEntryNode)init
{
  return 0;
}

- (PKPassEntitlementsComposerEntryNode)initWithIdentifier:(id)a3 parentEntitlementComposer:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPassEntitlementsComposerEntryNode;
  v9 = [(PKPassEntitlementsComposerEntryNode *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_parentEntitlementComposer, v8);
    v10->_editable = 1;
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    properties = v10->_properties;
    v10->_properties = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    children = v10->_children;
    v10->_children = v13;
  }
  return v10;
}

- (unint64_t)possibleShareability
{
  return [(PKPassEntitlementsComposerEntryNode *)self _leastRestrictivePossibleCapabilityForAccumulateBlock:&__block_literal_global_217 maxCapability:-1];
}

id __59__PKPassEntitlementsComposerEntryNode_possibleShareability__block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "possibleShareability"));
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (unint64_t)possibleVisibility
{
  return [(PKPassEntitlementsComposerEntryNode *)self _leastRestrictivePossibleCapabilityForAccumulateBlock:&__block_literal_global_102_0 maxCapability:-1];
}

id __57__PKPassEntitlementsComposerEntryNode_possibleVisibility__block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "possibleVisibility"));
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (unint64_t)possibleManageability
{
  return [(PKPassEntitlementsComposerEntryNode *)self _leastRestrictivePossibleCapabilityForAccumulateBlock:&__block_literal_global_104_1 maxCapability:-1];
}

id __60__PKPassEntitlementsComposerEntryNode_possibleManageability__block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "possibleManageability"));
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (BOOL)possibleIntraAccountSharing
{
  return [(PKPassEntitlementsComposerEntryNode *)self _leastRestrictivePossibleCapabilityForAccumulateBlock:&__block_literal_global_106_2 maxCapability:1] == 1;
}

id __66__PKPassEntitlementsComposerEntryNode_possibleIntraAccountSharing__block_invoke(uint64_t a1, void *a2)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a2, "possibleIntraAccountSharing"));
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (NSArray)allPossibleShareability
{
  return (NSArray *)[(PKPassEntitlementsComposerEntryNode *)self _allPossibleCapabilityForAccumulateBlock:&__block_literal_global_108_0];
}

uint64_t __62__PKPassEntitlementsComposerEntryNode_allPossibleShareability__block_invoke(uint64_t a1, void *a2)
{
  return [a2 allPossibleShareability];
}

- (NSArray)allPossibleVisibility
{
  return (NSArray *)[(PKPassEntitlementsComposerEntryNode *)self _allPossibleCapabilityForAccumulateBlock:&__block_literal_global_110];
}

uint64_t __60__PKPassEntitlementsComposerEntryNode_allPossibleVisibility__block_invoke(uint64_t a1, void *a2)
{
  return [a2 allPossibleVisibility];
}

- (NSArray)allPossibleManageability
{
  return (NSArray *)[(PKPassEntitlementsComposerEntryNode *)self _allPossibleCapabilityForAccumulateBlock:&__block_literal_global_112_2];
}

uint64_t __63__PKPassEntitlementsComposerEntryNode_allPossibleManageability__block_invoke(uint64_t a1, void *a2)
{
  return [a2 allPossibleManageability];
}

- (NSArray)allPossibleCapabilitySets
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntitlementComposer);
  v4 = [WeakRetained _allPossibleCapabilitySetsForView:self];

  return (NSArray *)v4;
}

- (PKPassShareTimeConfiguration)possibleTimeConfiguration
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = self->_children;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "possibleTimeConfiguration", (void)v13);
        v9 = v8;
        if (v8)
        {
          if (v5)
          {
            uint64_t v10 = [v5 intersect:v8];

            id v5 = (id)v10;
          }
          else
          {
            id v5 = v8;
          }
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }

  if ([v5 support]) {
    id v11 = v5;
  }
  else {
    id v11 = 0;
  }

  return (PKPassShareTimeConfiguration *)v11;
}

- (unint64_t)shareability
{
  uint64_t v3 = [(PKPassEntitlementsComposerEntryNode *)self _effectiveValueForProperty:1 ofType:objc_opt_class()];
  uint64_t v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 shareability];
  }
  else {
    uint64_t v5 = [(PKPassEntitlementsComposerEntryNode *)self _mostRestrictiveCapabilityForAccumulateBlock:&__block_literal_global_116_1 maxCapability:999];
  }
  unint64_t v6 = v5;

  return v6;
}

uint64_t __51__PKPassEntitlementsComposerEntryNode_shareability__block_invoke(uint64_t a1, void *a2)
{
  return [a2 shareability];
}

- (void)setShareability:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PKPassEntitlementsComposerEntryNode_setShareability___block_invoke;
  v3[3] = &__block_descriptor_40_e47_v16__0__PKMutablePassEntitlementCapabilitySet_8l;
  v3[4] = a3;
  [(PKPassEntitlementsComposerEntryNode *)self _mutateCapability:v3];
}

uint64_t __55__PKPassEntitlementsComposerEntryNode_setShareability___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setShareability:*(void *)(a1 + 32)];
}

- (unint64_t)visibility
{
  uint64_t v3 = [(PKPassEntitlementsComposerEntryNode *)self _effectiveValueForProperty:1 ofType:objc_opt_class()];
  uint64_t v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 visibility];
  }
  else {
    uint64_t v5 = [(PKPassEntitlementsComposerEntryNode *)self _mostRestrictiveCapabilityForAccumulateBlock:&__block_literal_global_120_0 maxCapability:2];
  }
  unint64_t v6 = v5;

  return v6;
}

uint64_t __49__PKPassEntitlementsComposerEntryNode_visibility__block_invoke(uint64_t a1, void *a2)
{
  return [a2 visibility];
}

- (void)setVisibility:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53__PKPassEntitlementsComposerEntryNode_setVisibility___block_invoke;
  v3[3] = &__block_descriptor_40_e47_v16__0__PKMutablePassEntitlementCapabilitySet_8l;
  v3[4] = a3;
  [(PKPassEntitlementsComposerEntryNode *)self _mutateCapability:v3];
}

uint64_t __53__PKPassEntitlementsComposerEntryNode_setVisibility___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVisibility:*(void *)(a1 + 32)];
}

- (unint64_t)manageability
{
  uint64_t v3 = [(PKPassEntitlementsComposerEntryNode *)self _effectiveValueForProperty:1 ofType:objc_opt_class()];
  uint64_t v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 manageability];
  }
  else {
    uint64_t v5 = [(PKPassEntitlementsComposerEntryNode *)self _mostRestrictiveCapabilityForAccumulateBlock:&__block_literal_global_122 maxCapability:-1];
  }
  unint64_t v6 = v5;

  return v6;
}

uint64_t __52__PKPassEntitlementsComposerEntryNode_manageability__block_invoke(uint64_t a1, void *a2)
{
  return [a2 manageability];
}

- (void)setManageability:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PKPassEntitlementsComposerEntryNode_setManageability___block_invoke;
  v3[3] = &__block_descriptor_40_e47_v16__0__PKMutablePassEntitlementCapabilitySet_8l;
  v3[4] = a3;
  [(PKPassEntitlementsComposerEntryNode *)self _mutateCapability:v3];
}

uint64_t __56__PKPassEntitlementsComposerEntryNode_setManageability___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setManageability:*(void *)(a1 + 32)];
}

- (BOOL)intraAccountSharingEnabled
{
  uint64_t v3 = [(PKPassEntitlementsComposerEntryNode *)self _effectiveValueForProperty:1 ofType:objc_opt_class()];
  uint64_t v4 = v3;
  if (v3) {
    char v5 = [v3 intraAccountSharingEnabled];
  }
  else {
    char v5 = [(PKPassEntitlementsComposerEntryNode *)self _mostRestrictiveCapabilityForAccumulateBlock:&__block_literal_global_124_0 maxCapability:1] == 1;
  }

  return v5;
}

uint64_t __65__PKPassEntitlementsComposerEntryNode_intraAccountSharingEnabled__block_invoke(uint64_t a1, void *a2)
{
  return [a2 intraAccountSharingEnabled];
}

- (void)setIntraAccountSharingEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__PKPassEntitlementsComposerEntryNode_setIntraAccountSharingEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e47_v16__0__PKMutablePassEntitlementCapabilitySet_8l;
  BOOL v4 = a3;
  [(PKPassEntitlementsComposerEntryNode *)self _mutateCapability:v3];
}

uint64_t __69__PKPassEntitlementsComposerEntryNode_setIntraAccountSharingEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIntraAccountSharingEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (void)updateCapabilitiesWithSet:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKPassEntitlementsComposerEntryNode_updateCapabilitiesWithSet___block_invoke;
  v6[3] = &unk_1E56F5208;
  id v7 = v4;
  id v5 = v4;
  [(PKPassEntitlementsComposerEntryNode *)self _mutateCapability:v6];
}

void __65__PKPassEntitlementsComposerEntryNode_updateCapabilitiesWithSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setShareability:", objc_msgSend(v3, "shareability"));
  objc_msgSend(v4, "setVisibility:", objc_msgSend(*(id *)(a1 + 32), "visibility"));
  objc_msgSend(v4, "setManageability:", objc_msgSend(*(id *)(a1 + 32), "manageability"));
  objc_msgSend(v4, "setIntraAccountSharingEnabled:", objc_msgSend(*(id *)(a1 + 32), "intraAccountSharingEnabled"));
}

- (void)resetCapabilities
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __56__PKPassEntitlementsComposerEntryNode_resetCapabilities__block_invoke;
  v2[3] = &unk_1E56F5208;
  v2[4] = self;
  [(PKPassEntitlementsComposerEntryNode *)self _mutateCapability:v2];
}

void __56__PKPassEntitlementsComposerEntryNode_resetCapabilities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setShareability:", objc_msgSend(v3, "possibleShareability"));
  objc_msgSend(v4, "setVisibility:", objc_msgSend(*(id *)(a1 + 32), "possibleVisibility"));
  objc_msgSend(v4, "setManageability:", objc_msgSend(*(id *)(a1 + 32), "possibleManageability"));
  objc_msgSend(v4, "setIntraAccountSharingEnabled:", objc_msgSend(*(id *)(a1 + 32), "possibleIntraAccountSharing"));
}

- (PKPassShareTimeConfiguration)timeConfiguration
{
  uint64_t v3 = objc_opt_class();
  return (PKPassShareTimeConfiguration *)[(PKPassEntitlementsComposerEntryNode *)self _effectiveValueForProperty:2 ofType:v3];
}

- (void)setTimeConfiguration:(id)a3
{
  id v6 = a3;
  [(PKPassEntitlementsComposerEntryNode *)self parentEntryNodeWillSetProperty:2 updatedParentNode:self];
  if (v6)
  {
    [(NSMutableDictionary *)self->_properties setObject:v6 forKeyedSubscript:&unk_1EE22C740];
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA98] null];
    [(NSMutableDictionary *)self->_properties setObject:v4 forKeyedSubscript:&unk_1EE22C740];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained childEntryNodeDidSetProperty:2 updatedChildNode:self];
}

- (BOOL)isManagingTimeConfiguration
{
  v2 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:&unk_1EE22C740];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setIsManagingTimeConfiguration:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(PKPassEntitlementsComposerEntryNode *)self setTimeConfiguration:0];
  }
  else
  {
    [(NSMutableDictionary *)self->_properties setObject:0 forKeyedSubscript:&unk_1EE22C740];
    id v4 = [(PKPassEntitlementsComposerEntryNode *)self possibleTimeConfiguration];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = self->_children;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "setTimeConfiguration:", v4, (void)v10);
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)isManagingEntitlementConfiguration
{
  v2 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:&unk_1EE22C758];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setIsManagingEntitlementConfiguration:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [(PKPassEntitlementsComposerEntryNode *)self resetCapabilities];
  }
  else
  {
    id v4 = [[PKPassEntitlementCapabilitySet alloc] initWithLocalizedName:&stru_1EE0F5368 shareability:[(PKPassEntitlementsComposerEntryNode *)self shareability] manageability:[(PKPassEntitlementsComposerEntryNode *)self manageability] visibility:[(PKPassEntitlementsComposerEntryNode *)self visibility]];
    [(NSMutableDictionary *)self->_properties setObject:0 forKeyedSubscript:&unk_1EE22C758];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = self->_children;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "updateCapabilitiesWithSet:", v4, (void)v10);
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (BOOL)enabled
{
  v2 = [(PKPassEntitlementsComposerEntryNode *)self _effectiveValueForProperty:0 ofType:objc_opt_class()];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3 notifyIfRoot:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(PKPassEntitlementsComposerEntryNode *)self parentEntryNodeWillSetProperty:0 updatedParentNode:self];
  uint64_t v7 = [NSNumber numberWithBool:v5];
  [(NSMutableDictionary *)self->_properties setObject:v7 forKeyedSubscript:&unk_1EE22C770];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_parent);
    [v9 childEntryNodeDidSetProperty:0 updatedChildNode:self];
  }
  else
  {
    if (!v4) {
      return;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_parentEntitlementComposer);
    [v9 _rootEntryNodeDidSetEnabled:self];
  }
}

- (unint64_t)maxSelectionCount
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntitlementComposer);
  unint64_t v3 = [WeakRetained maxSelectionCount];

  return v3;
}

- (void)enumerateEntitlementEntries:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = self->_children;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "enumerateEntitlementEntries:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)parentEntryNodeWillSetProperty:(unint64_t)a3 updatedParentNode:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (PKPassEntitlementsComposerEntryNode *)a4;
  uint64_t v7 = v6;
  if (self->_editable)
  {
    if (self != v6)
    {
      properties = self->_properties;
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)properties setObject:0 forKeyedSubscript:v9];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v10 = self->_children;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v14++) parentEntryNodeWillSetProperty:a3 updatedParentNode:self];
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v12);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"PKPassEntitlementsComposer: '%lu' should not be updated on non editable composer", a3);
  }
}

- (void)childEntryNodeDidSetProperty:(unint64_t)a3 updatedChildNode:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a4;
  if (self->_editable)
  {
    properties = self->_properties;
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v9 = [(NSMutableDictionary *)properties objectForKeyedSubscript:v8];

    if (v9)
    {
      long long v10 = self->_properties;
      uint64_t v11 = [NSNumber numberWithUnsignedInteger:a3];
      uint64_t v12 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];

      uint64_t v13 = self->_properties;
      uint64_t v14 = [NSNumber numberWithUnsignedInteger:a3];
      [(NSMutableDictionary *)v13 setObject:0 forKeyedSubscript:v14];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
      [WeakRetained childEntryNodeDidSetProperty:a3 updatedChildNode:self];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v16 = self->_children;
      uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (v21 != v6)
            {
              v22 = (void *)v21[2];
              v23 = [NSNumber numberWithUnsignedInteger:a3];
              [v22 setObject:v12 forKeyedSubscript:v23];
            }
          }
          uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v18);
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"PKPassEntitlementsComposer: '%lu' should not be updated on non editable composer", a3);
  }
}

- (void)_mutateCapability:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  [(PKPassEntitlementsComposerEntryNode *)self parentEntryNodeWillSetProperty:1 updatedParentNode:self];
  BOOL v5 = [(NSMutableDictionary *)self->_properties objectForKeyedSubscript:&unk_1EE22C758];
  if (!v5) {
    BOOL v5 = [(PKPassEntitlementCapabilitySet *)[PKMutablePassEntitlementCapabilitySet alloc] initWithLocalizedName:&stru_1EE0F5368 shareability:[(PKPassEntitlementsComposerEntryNode *)self possibleShareability] manageability:[(PKPassEntitlementsComposerEntryNode *)self possibleManageability] visibility:[(PKPassEntitlementsComposerEntryNode *)self possibleVisibility]];
  }
  uint64_t v7 = v5;
  [(NSMutableDictionary *)self->_properties setObject:0 forKeyedSubscript:&unk_1EE22C758];
  v4[2](v4, v7);

  [(NSMutableDictionary *)self->_properties setObject:v7 forKeyedSubscript:&unk_1EE22C758];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained childEntryNodeDidSetProperty:1 updatedChildNode:self];
}

- (unint64_t)_mostRestrictiveCapabilityForAccumulateBlock:(id)a3 maxCapability:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (uint64_t (**)(id, void *))a3;
  if ([(PKPassEntitlementsComposerEntryNode *)self hasEnabledEntitlements])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v7 = self->_children;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v12, "enabled", (void)v15))
          {
            unint64_t v13 = v6[2](v6, v12);
            if (v13 < a4) {
              a4 = v13;
            }
          }
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
  else
  {
    a4 = 0;
  }

  return a4;
}

- (unint64_t)_leastRestrictivePossibleCapabilityForAccumulateBlock:(id)a3 maxCapability:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void))a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = self->_children;
  uint64_t v7 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = v6[2](v6, *(void *)(*((void *)&v25 + 1) + 8 * i));
        uint64_t v11 = v10;
        if (v10
          && (long long v23 = 0u,
              long long v24 = 0u,
              long long v21 = 0u,
              long long v22 = 0u,
              (uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16]) != 0))
        {
          uint64_t v13 = v12;
          unint64_t v14 = 0;
          uint64_t v15 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v22 != v15) {
                objc_enumerationMutation(v11);
              }
              unint64_t v17 = [*(id *)(*((void *)&v21 + 1) + 8 * j) unsignedIntegerValue];
              if (v14 <= v17) {
                unint64_t v14 = v17;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v13);
        }
        else
        {
          unint64_t v14 = 0;
        }
        if (a4 >= v14) {
          a4 = v14;
        }
      }
      uint64_t v8 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  return a4;
}

- (id)_allPossibleCapabilityForAccumulateBlock:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  obuint64_t j = self->_children;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v12 = v4[2](v4, v10);
        uint64_t v13 = (void *)[v11 initWithArray:v12];

        if (v7) {
          [v7 intersectSet:v13];
        }
        else {
          uint64_t v7 = (void *)[v13 mutableCopy];
        }
      }
      uint64_t v6 = [(NSMutableArray *)obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  unint64_t v14 = [v7 allObjects];
  uint64_t v15 = [v14 sortedArrayUsingComparator:&__block_literal_global_144_0];
  long long v16 = v15;
  if (!v15) {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v17 = v15;

  return v17;
}

uint64_t __80__PKPassEntitlementsComposerEntryNode__allPossibleCapabilityForAccumulateBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)hasEnabledEntitlements
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_children;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "enabled", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)_effectiveValueForProperty:(unint64_t)a3 ofType:(Class)a4
{
  uint64_t v5 = self;
  if (!v5)
  {
LABEL_8:
    id v13 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *MEMORY[0x1E4F1C3B8];
  while (1)
  {
    properties = v6->_properties;
    long long v9 = [NSNumber numberWithUnsignedInteger:a3];
    long long v10 = [(NSMutableDictionary *)properties objectForKeyedSubscript:v9];

    if (v10) {
      break;
    }
LABEL_7:
    id WeakRetained = (PKPassEntitlementsComposerEntryNode *)objc_loadWeakRetained((id *)&v6->_parent);

    uint64_t v6 = WeakRetained;
    if (!WeakRetained) {
      goto LABEL_8;
    }
  }
  id v11 = [MEMORY[0x1E4F1CA98] null];

  if (v10 == v11)
  {
    id v13 = 0;
    goto LABEL_11;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1E4F1CA00] raise:v7, @"PKPassEntitlementsComposer: Found unexpected value %@ for property '%lu'", v10, a3 format];
    goto LABEL_7;
  }
  id v13 = v10;
LABEL_11:

LABEL_12:
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentEntitlementComposer);
  uint64_t v7 = [v4 initWithIdentifier:identifier parentEntitlementComposer:WeakRetained];

  *(unsigned char *)(v7 + 24) = self->_editable;
  uint64_t v8 = [(NSMutableDictionary *)self->_properties mutableCopy];
  long long v9 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = v8;

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = v10;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = self->_children;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = (id *)objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v16), "copy", (void)v19);
        objc_storeWeak(v17 + 5, (id)v7);
        [*(id *)(v7 + 48) addObject:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v14);
  }

  return (id)v7;
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (PKPassEntitlementsComposerEntryNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (PKPassEntitlementsComposerEntryNode *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_destroyWeak((id *)&self->_parentEntitlementComposer);
}

@end