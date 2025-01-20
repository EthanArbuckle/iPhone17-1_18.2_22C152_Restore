@interface STUIStatusBarItemUpdate
- (BOOL)dataChanged;
- (BOOL)enabled;
- (BOOL)enablementChanged;
- (BOOL)styleAttributesChanged;
- (NSDictionary)placementInfo;
- (NSString)debugDescription;
- (NSString)description;
- (STStatusBarData)data;
- (STUIStatusBarStyleAttributes)styleAttributes;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setData:(id)a3;
- (void)setDataChanged:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnablementChanged:(BOOL)a3;
- (void)setPlacementInfo:(id)a3;
- (void)setStyleAttributes:(id)a3;
- (void)setStyleAttributesChanged:(BOOL)a3;
@end

@implementation STUIStatusBarItemUpdate

- (STStatusBarData)data
{
  return self->_data;
}

- (void)setStyleAttributesChanged:(BOOL)a3
{
  self->_styleAttributesChanged = a3;
}

- (void)setStyleAttributes:(id)a3
{
}

- (void)setPlacementInfo:(id)a3
{
}

- (void)setEnablementChanged:(BOOL)a3
{
  self->_enablementChanged = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setDataChanged:(BOOL)a3
{
  self->_dataChanged = a3;
}

- (void)setData:(id)a3
{
}

- (BOOL)enablementChanged
{
  return self->_enablementChanged;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)styleAttributesChanged
{
  return self->_styleAttributesChanged;
}

- (STUIStatusBarStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (BOOL)dataChanged
{
  return self->_dataChanged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementInfo, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(STUIStatusBarItemUpdate);
  [(STUIStatusBarItemUpdate *)v4 setEnablementChanged:self->_enablementChanged];
  [(STUIStatusBarItemUpdate *)v4 setEnabled:self->_enabled];
  [(STUIStatusBarItemUpdate *)v4 setDataChanged:self->_dataChanged];
  [(STUIStatusBarItemUpdate *)v4 setData:self->_data];
  [(STUIStatusBarItemUpdate *)v4 setStyleAttributesChanged:self->_styleAttributesChanged];
  [(STUIStatusBarItemUpdate *)v4 setStyleAttributes:self->_styleAttributes];
  [(STUIStatusBarItemUpdate *)v4 setPlacementInfo:self->_placementInfo];
  return v4;
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBarItemUpdate *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STUIStatusBarItemUpdate *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STUIStatusBarItemUpdate *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STUIStatusBarItemUpdate *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(STUIStatusBarItemUpdate *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarItemUpdate *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [(STUIStatusBarItemUpdate *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  v8 = [v7 activeMultilinePrefix];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__STUIStatusBarItemUpdate__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E6AA39F0;
  id v9 = v7;
  id v13 = v9;
  v14 = self;
  [v9 appendBodySectionWithName:0 multilinePrefix:v8 block:v12];

  id v10 = v9;
  return v10;
}

void __75__STUIStatusBarItemUpdate__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "enablementChanged"), @"enablementChanged");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "enabled"), @"enabled");
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "dataChanged"), @"dataChanged");
  v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) data];
  id v7 = (id)[v5 appendObject:v6 withName:@"data" skipIfNil:1];

  id v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "styleAttributesChanged"), @"styleAttributesChanged");
  id v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) styleAttributes];
  id v11 = (id)[v9 appendObject:v10 withName:@"styleAttributes" skipIfNil:1];

  v12 = *(void **)(a1 + 32);
  id v13 = [*(id *)(a1 + 40) placementInfo];
  [v12 appendDictionarySection:v13 withName:@"placementInfo" skipIfEmpty:1];
}

- (NSDictionary)placementInfo
{
  return self->_placementInfo;
}

@end