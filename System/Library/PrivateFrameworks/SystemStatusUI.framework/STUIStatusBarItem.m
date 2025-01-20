@interface STUIStatusBarItem
+ (Class)itemClassForIdentifier:(id)a3;
+ (STUIStatusBarIdentifier)defaultDisplayIdentifier;
+ (STUIStatusBarIdentifier)identifier;
+ (id)createItemForIdentifier:(id)a3 statusBar:(id)a4;
+ (id)displayItemIdentifierFromIdentifier:(id)a3 string:(id)a4;
+ (id)displayItemIdentifierFromString:(id)a3;
+ (id)itemIdentifierForDisplayItemIdentifier:(id)a3;
+ (id)itemIdentifierFromString:(id)a3;
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (BOOL)needsUpdate;
- (NSMutableDictionary)displayItems;
- (NSSet)dependentEntryKeys;
- (NSString)debugDescription;
- (NSString)description;
- (STUIStatusBar)statusBar;
- (STUIStatusBarIdentifier)identifier;
- (STUIStatusBarItem)initWithIdentifier:(id)a3 statusBar:(id)a4;
- (id)_applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayItemForIdentifier:(id)a3;
- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (id)viewForIdentifier:(id)a3;
- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4;
- (void)setDisplayItems:(id)a3;
- (void)setNeedsUpdate;
- (void)updatedDisplayItemsWithData:(id)a3;
@end

@implementation STUIStatusBarItem

- (void)updatedDisplayItemsWithData:(id)a3
{
  self->_needsUpdate = 0;
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(STUIStatusBarItem *)self dependentEntryKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [v5 valueForKey:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        char v11 = [v10 isEnabled];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)itemIdentifierForDisplayItemIdentifier:(id)a3
{
  return (id)[a3 object];
}

- (id)displayItemForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_displayItems objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [(STUIStatusBarItem *)self createDisplayItemForIdentifier:v4];
    [(NSMutableDictionary *)self->_displayItems setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[STUIStatusBarDisplayItem alloc] initWithIdentifier:v4 item:self];

  return v5;
}

+ (id)createItemForIdentifier:(id)a3 statusBar:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "itemClassForIdentifier:", v7)), "initWithIdentifier:statusBar:", v7, v6);

  return v8;
}

+ (Class)itemClassForIdentifier:(id)a3
{
  return (Class)[a3 object];
}

- (STUIStatusBarItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  id v6 = (STUIStatusBarIdentifier *)a3;
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarItem;
  id v7 = a4;
  uint64_t v8 = [(STUIStatusBarItem *)&v14 init];
  identifier = v8->_identifier;
  v8->_identifier = v6;
  v10 = v6;

  objc_storeWeak((id *)&v8->_statusBar, v7);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v14.receiver, v14.super_class);
  displayItems = v8->_displayItems;
  v8->_displayItems = (NSMutableDictionary *)v11;

  return v8;
}

- (id)_applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 enablementChanged]) {
    objc_msgSend(v7, "setEnabled:", objc_msgSend(v6, "enabled"));
  }
  uint64_t v8 = [(STUIStatusBarItem *)self applyUpdate:v6 toDisplayItem:v7];
  if ([v6 styleAttributesChanged] && objc_msgSend(v7, "isEnabled"))
  {
    v9 = [v6 styleAttributes];
    [(STUIStatusBarItem *)self applyStyleAttributes:v9 toDisplayItem:v7];
  }
  if ([v6 enablementChanged] && (objc_msgSend(v6, "enabled") & 1) == 0) {
    [v7 setEnabled:0];
  }

  return v8;
}

- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4
{
  return 0;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  return 0;
}

- (NSMutableDictionary)displayItems
{
  return self->_displayItems;
}

+ (STUIStatusBarIdentifier)defaultDisplayIdentifier
{
  return (STUIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:0];
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  return 0;
}

- (STUIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (STUIStatusBar *)WeakRetained;
}

+ (id)displayItemIdentifierFromString:(id)a3
{
  id v4 = a3;
  id v5 = [a1 identifier];
  id v6 = [a1 displayItemIdentifierFromIdentifier:v5 string:v4];

  return v6;
}

+ (id)itemIdentifierFromString:(id)a3
{
  id v3 = a3;
  id v4 = +[STUIStatusBarIdentifier identifierForObject:objc_opt_class() string:v3];

  return v4;
}

+ (STUIStatusBarIdentifier)identifier
{
  return (STUIStatusBarIdentifier *)[a1 itemIdentifierFromString:0];
}

+ (id)displayItemIdentifierFromIdentifier:(id)a3 string:(id)a4
{
  return +[STUIStatusBarIdentifier identifierForObject:a3 string:a4];
}

- (STUIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (void)setNeedsUpdate
{
  self->_needsUpdate = 1;
}

- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4
{
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBar);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSSet)dependentEntryKeys
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  return 0;
}

- (id)viewForIdentifier:(id)a3
{
  return 0;
}

- (NSString)description
{
  return (NSString *)[(STUIStatusBarItem *)self descriptionWithMultilinePrefix:0];
}

- (NSString)debugDescription
{
  return (NSString *)[(STUIStatusBarItem *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STUIStatusBarItem *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(STUIStatusBarItem *)self identifier];
  id v5 = (id)[v3 appendObject:v4 withName:@"identifier"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STUIStatusBarItem *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STUIStatusBarItem *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:1];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return [(STUIStatusBarItem *)self _descriptionBuilderWithMultilinePrefix:a3 forDebug:0];
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(STUIStatusBarItem *)self succinctDescriptionBuilder];
  [v7 setUseDebugDescription:v4];
  [v7 setActiveMultilinePrefix:v6];

  return v7;
}

- (void)setDisplayItems:(id)a3
{
}

@end