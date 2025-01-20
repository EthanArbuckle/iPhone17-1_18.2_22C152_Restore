@interface REMListGroceryContext
- (BOOL)shouldCategorizeGroceryItems;
- (BOOL)shouldSuggestConversionToGroceryList;
- (NSString)groceryLocaleID;
- (REMList)list;
- (REMListGroceryContext)initWithList:(id)a3;
- (void)setList:(id)a3;
@end

@implementation REMListGroceryContext

- (BOOL)shouldCategorizeGroceryItems
{
  v2 = [(REMListGroceryContext *)self list];
  char v3 = [v2 shouldCategorizeGroceryItems];

  return v3;
}

- (REMList)list
{
  return self->_list;
}

- (REMListGroceryContext)initWithList:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListGroceryContext;
  v6 = [(REMListGroceryContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_list, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (BOOL)shouldSuggestConversionToGroceryList
{
  v2 = [(REMListGroceryContext *)self list];
  char v3 = [v2 shouldSuggestConversionToGroceryList];

  return v3;
}

- (NSString)groceryLocaleID
{
  v2 = [(REMListGroceryContext *)self list];
  char v3 = [v2 groceryLocaleID];

  return (NSString *)v3;
}

- (void)setList:(id)a3
{
}

@end