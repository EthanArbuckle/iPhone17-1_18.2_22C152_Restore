@interface _UIStatusBarItem
+ (Class)itemClassForIdentifier:(id)a3;
+ (_UIStatusBarIdentifier)defaultDisplayIdentifier;
+ (_UIStatusBarIdentifier)identifier;
+ (id)createItemForIdentifier:(id)a3 statusBar:(id)a4;
+ (id)displayItemIdentifierFromIdentifier:(id)a3 string:(id)a4;
+ (id)displayItemIdentifierFromString:(id)a3;
+ (id)itemIdentifierForDisplayItemIdentifier:(id)a3;
+ (id)itemIdentifierFromString:(id)a3;
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (BOOL)needsUpdate;
- (NSMutableDictionary)displayItems;
- (NSSet)dependentEntryKeys;
- (_UIStatusBar)statusBar;
- (_UIStatusBarIdentifier)identifier;
- (_UIStatusBarItem)initWithIdentifier:(id)a3 statusBar:(id)a4;
- (id)_applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)createDisplayItemForIdentifier:(id)a3;
- (id)description;
- (id)displayItemForIdentifier:(id)a3;
- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3;
- (id)viewForIdentifier:(id)a3;
- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4;
- (void)setDisplayItems:(id)a3;
- (void)setNeedsUpdate;
- (void)updatedDisplayItemsWithData:(id)a3;
@end

@implementation _UIStatusBarItem

+ (id)itemIdentifierFromString:(id)a3
{
  id v3 = a3;
  v4 = +[_UIStatusBarIdentifier identifierForObject:objc_opt_class() string:v3];

  return v4;
}

+ (id)displayItemIdentifierFromString:(id)a3
{
  id v4 = a3;
  v5 = [a1 identifier];
  v6 = [a1 displayItemIdentifierFromIdentifier:v5 string:v4];

  return v6;
}

+ (id)displayItemIdentifierFromIdentifier:(id)a3 string:(id)a4
{
  return +[_UIStatusBarIdentifier identifierForObject:a3 string:a4];
}

+ (id)itemIdentifierForDisplayItemIdentifier:(id)a3
{
  return (id)[a3 object];
}

+ (_UIStatusBarIdentifier)identifier
{
  return (_UIStatusBarIdentifier *)[a1 itemIdentifierFromString:0];
}

+ (_UIStatusBarIdentifier)defaultDisplayIdentifier
{
  return (_UIStatusBarIdentifier *)[a1 displayItemIdentifierFromString:0];
}

+ (Class)itemClassForIdentifier:(id)a3
{
  return (Class)[a3 object];
}

+ (id)createItemForIdentifier:(id)a3 statusBar:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = (objc_class *)[a1 itemClassForIdentifier:v7];
  if (!v9)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"_UIStatusBarItem.m", 63, @"No class found for item with identifier %@", v7 object file lineNumber description];
  }
  v10 = (void *)[[v9 alloc] initWithIdentifier:v7 statusBar:v8];

  return v10;
}

- (_UIStatusBarItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  v6 = (_UIStatusBarIdentifier *)a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIStatusBarItem;
  id v7 = a4;
  id v8 = [(_UIStatusBarItem *)&v14 init];
  identifier = v8->_identifier;
  v8->_identifier = v6;
  v10 = v6;

  objc_storeWeak((id *)&v8->_statusBar, v7);
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v14.receiver, v14.super_class);
  displayItems = v8->_displayItems;
  v8->_displayItems = (NSMutableDictionary *)v11;

  return v8;
}

- (id)description
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = NSStringFromSelector(sel_identifier);
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  v5 = +[UIDescriptionBuilder descriptionForObject:self keys:v4];

  return v5;
}

- (NSSet)dependentEntryKeys
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] set];
}

- (void)setNeedsUpdate
{
  self->_needsUpdate = 1;
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(_UIStatusBarItem *)self dependentEntryKeys];
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

- (id)overriddenStyleAttributesForData:(id)a3 identifier:(id)a4
{
  return 0;
}

- (id)_applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 enabilityChanged]) {
    objc_msgSend(v7, "setEnabled:", objc_msgSend(v6, "enabled"));
  }
  uint64_t v8 = [(_UIStatusBarItem *)self applyUpdate:v6 toDisplayItem:v7];
  if ([v6 styleAttributesChanged] && objc_msgSend(v7, "isEnabled"))
  {
    v9 = [v6 styleAttributes];
    [(_UIStatusBarItem *)self applyStyleAttributes:v9 toDisplayItem:v7];
  }
  if ([v6 enabilityChanged] && (objc_msgSend(v6, "enabled") & 1) == 0) {
    [v7 setEnabled:0];
  }

  return v8;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  return 0;
}

- (void)applyStyleAttributes:(id)a3 toDisplayItem:(id)a4
{
}

- (void)updatedDisplayItemsWithData:(id)a3
{
  self->_needsUpdate = 0;
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3
{
  return 0;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3
{
  return 0;
}

- (id)createDisplayItemForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [[_UIStatusBarDisplayItem alloc] initWithIdentifier:v4 item:self];

  return v5;
}

- (id)displayItemForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_displayItems objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v5 = [(_UIStatusBarItem *)self createDisplayItemForIdentifier:v4];
    [(NSMutableDictionary *)self->_displayItems setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)viewForIdentifier:(id)a3
{
  id v5 = (void *)MEMORY[0x1E4F28B00];
  id v6 = a3;
  id v7 = [v5 currentHandler];
  [v7 handleFailureInMethod:a2, self, @"_UIStatusBarItem.m", 189, @"%@ has no view for identifier %@", self, v6 object file lineNumber description];

  return 0;
}

- (_UIStatusBarIdentifier)identifier
{
  return self->_identifier;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (NSMutableDictionary)displayItems
{
  return self->_displayItems;
}

- (void)setDisplayItems:(id)a3
{
}

- (_UIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (_UIStatusBar *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_statusBar);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end