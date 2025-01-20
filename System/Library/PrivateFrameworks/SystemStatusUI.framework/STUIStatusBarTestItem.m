@interface STUIStatusBarTestItem
+ (id)displayIdentifierForIndex:(int64_t)a3 displayIndex:(int64_t)a4;
+ (id)identifierForIndex:(int64_t)a3;
- (NSArray)overrideDependentEntryKeys;
- (NSMutableDictionary)stringViews;
- (STUIStatusBarAnimation)additionAnimation;
- (STUIStatusBarAnimation)otherAnimation;
- (STUIStatusBarAnimation)removalAnimation;
- (STUIStatusBarTestItem)initWithIdentifier:(id)a3 statusBar:(id)a4;
- (id)_defaultStringFromDisplayIdentifier:(id)a3;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (id)viewForIdentifier:(id)a3;
- (void)setAdditionAnimation:(id)a3;
- (void)setOtherAnimation:(id)a3;
- (void)setOverrideDependentEntryKeys:(id)a3;
- (void)setRemovalAnimation:(id)a3;
- (void)setStringViews:(id)a3;
@end

@implementation STUIStatusBarTestItem

- (id)dependentEntryKeys
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  if (self->_overrideDependentEntryKeys)
  {
    v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  }
  else
  {
    v4 = [(STUIStatusBarItem *)self identifier];
    v5 = +[STUIStatusBarTestData dependentDataKeyForItemIdentifier:v4];
    v3 = [v2 setWithObject:v5];
  }
  return v3;
}

+ (id)identifierForIndex:(int64_t)a3
{
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a3);
  v5 = [a1 itemIdentifierFromString:v4];

  return v5;
}

+ (id)displayIdentifierForIndex:(int64_t)a3 displayIndex:(int64_t)a4
{
  v6 = [a1 identifierForIndex:a3];
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a4);
  v8 = [a1 displayItemIdentifierFromIdentifier:v6 string:v7];

  return v8;
}

- (STUIStatusBarTestItem)initWithIdentifier:(id)a3 statusBar:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarTestItem;
  v4 = [(STUIStatusBarItem *)&v7 initWithIdentifier:a3 statusBar:a4];
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [(STUIStatusBarTestItem *)v4 setStringViews:v5];

  return v4;
}

- (id)viewForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_stringViews objectForKeyedSubscript:v4];
  if (!v5)
  {
    v6 = [STUIStatusBarStringView alloc];
    v5 = -[STUIStatusBarStringView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    objc_super v7 = [MEMORY[0x1E4FB1618] greenColor];
    v8 = [v7 colorWithAlphaComponent:0.3];
    [(STUIStatusBarStringView *)v5 setBackgroundColor:v8];

    [(NSMutableDictionary *)self->_stringViews setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)_defaultStringFromDisplayIdentifier:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v4 object];
  v6 = [v5 string];
  objc_super v7 = [v4 string];

  v8 = [v3 stringWithFormat:@"%@.%@", v6, v7];

  return v8;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  v20.receiver = self;
  v20.super_class = (Class)STUIStatusBarTestItem;
  id v6 = a4;
  id v7 = a3;
  v8 = [(STUIStatusBarItem *)&v20 applyUpdate:v7 toDisplayItem:v6];
  v9 = objc_msgSend(v7, "data", v20.receiver, v20.super_class);

  v10 = [v6 identifier];

  v11 = [v9 testEntries];
  v12 = +[STUIStatusBarTestData dependentDataKeyForDisplayItemIdentifier:v10];
  v13 = [v11 objectForKeyedSubscript:v12];

  v14 = [(STUIStatusBarTestItem *)self viewForIdentifier:v10];
  v15 = [v13 stringValue];

  if (v15) {
    [v13 stringValue];
  }
  else {
  v16 = [(STUIStatusBarTestItem *)self _defaultStringFromDisplayIdentifier:v10];
  }
  [v14 setText:v16];
  v17 = [(STUIStatusBarTestItem *)self otherAnimation];

  if (v17)
  {
    uint64_t v18 = [(STUIStatusBarTestItem *)self otherAnimation];

    v8 = (void *)v18;
  }

  return v8;
}

- (NSArray)overrideDependentEntryKeys
{
  return self->_overrideDependentEntryKeys;
}

- (void)setOverrideDependentEntryKeys:(id)a3
{
}

- (STUIStatusBarAnimation)additionAnimation
{
  return self->_additionAnimation;
}

- (void)setAdditionAnimation:(id)a3
{
}

- (STUIStatusBarAnimation)removalAnimation
{
  return self->_removalAnimation;
}

- (void)setRemovalAnimation:(id)a3
{
}

- (STUIStatusBarAnimation)otherAnimation
{
  return self->_otherAnimation;
}

- (void)setOtherAnimation:(id)a3
{
}

- (NSMutableDictionary)stringViews
{
  return self->_stringViews;
}

- (void)setStringViews:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringViews, 0);
  objc_storeStrong((id *)&self->_otherAnimation, 0);
  objc_storeStrong((id *)&self->_removalAnimation, 0);
  objc_storeStrong((id *)&self->_additionAnimation, 0);
  objc_storeStrong((id *)&self->_overrideDependentEntryKeys, 0);
}

@end