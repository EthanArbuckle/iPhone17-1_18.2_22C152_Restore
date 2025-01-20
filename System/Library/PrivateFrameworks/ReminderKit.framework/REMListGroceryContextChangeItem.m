@interface REMListGroceryContextChangeItem
- (BOOL)shouldCategorizeGroceryItems;
- (BOOL)shouldSuggestConversionToGroceryList;
- (NSArray)unsavedReminderIDsToCategorizeAsGroceryItems;
- (NSString)groceryLocaleID;
- (REMListChangeItem)listChangeItem;
- (REMListGroceryContextChangeItem)initWithListChangeItem:(id)a3;
- (void)categorizeGroceryItemsWithReminderIDs:(id)a3;
- (void)setGroceryLocaleID:(id)a3;
- (void)setListChangeItem:(id)a3;
- (void)setShouldCategorizeGroceryItems:(BOOL)a3;
@end

@implementation REMListGroceryContextChangeItem

- (REMListGroceryContextChangeItem)initWithListChangeItem:(id)a3
{
  id v5 = a3;
  if (!v5) {
    NSLog(&cfstr_SIsUnexpectedl.isa, "listChangeItem");
  }
  v9.receiver = self;
  v9.super_class = (Class)REMListGroceryContextChangeItem;
  v6 = [(REMListGroceryContextChangeItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_listChangeItem, a3);
  }

  return v7;
}

- (BOOL)shouldCategorizeGroceryItems
{
  v2 = [(REMListGroceryContextChangeItem *)self listChangeItem];
  char v3 = [v2 shouldCategorizeGroceryItems];

  return v3;
}

- (void)setShouldCategorizeGroceryItems:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(REMListGroceryContextChangeItem *)self listChangeItem];
  [v4 setShouldCategorizeGroceryItems:v3];
}

- (BOOL)shouldSuggestConversionToGroceryList
{
  v2 = [(REMListGroceryContextChangeItem *)self listChangeItem];
  char v3 = [v2 shouldSuggestConversionToGroceryList];

  return v3;
}

- (NSString)groceryLocaleID
{
  v2 = [(REMListGroceryContextChangeItem *)self listChangeItem];
  char v3 = [v2 groceryLocaleID];

  return (NSString *)v3;
}

- (void)setGroceryLocaleID:(id)a3
{
  id v4 = a3;
  id v5 = [(REMListGroceryContextChangeItem *)self listChangeItem];
  [v5 setGroceryLocaleID:v4];
}

- (NSArray)unsavedReminderIDsToCategorizeAsGroceryItems
{
  v2 = [(REMListGroceryContextChangeItem *)self listChangeItem];
  char v3 = [v2 unsavedReminderIDsToCategorizeAsGroceryItems];

  return (NSArray *)v3;
}

- (void)categorizeGroceryItemsWithReminderIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(REMListGroceryContextChangeItem *)self listChangeItem];
  v6 = [v5 unsavedReminderIDsToCategorizeAsGroceryItems];

  v7 = [(REMListGroceryContextChangeItem *)self listChangeItem];
  id v11 = v7;
  if (v6)
  {
    v8 = [v7 unsavedReminderIDsToCategorizeAsGroceryItems];
    objc_super v9 = [v8 arrayByAddingObjectsFromArray:v4];

    v10 = [(REMListGroceryContextChangeItem *)self listChangeItem];
    [v10 setUnsavedReminderIDsToCategorizeAsGroceryItems:v9];

    id v4 = v8;
  }
  else
  {
    [v7 setUnsavedReminderIDsToCategorizeAsGroceryItems:v4];
  }
}

- (REMListChangeItem)listChangeItem
{
  return self->_listChangeItem;
}

- (void)setListChangeItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end