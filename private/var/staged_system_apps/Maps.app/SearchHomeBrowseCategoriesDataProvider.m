@interface SearchHomeBrowseCategoriesDataProvider
- (BOOL)wantsOneColumnLayout;
- (NSArray)objects;
- (NSString)actionTitle;
- (NSString)identifier;
- (NSString)title;
- (SearchHomeBrowseCategoriesDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6;
- (id)headerAccessibilityIdentifier;
- (id)objectsTitles;
- (int64_t)entriesState;
- (int64_t)type;
- (unint64_t)numberOfVisibleItems;
- (void)resetEntriesState;
- (void)setEntriesState:(int64_t)a3;
- (void)setNumberOfVisibleItems:(unint64_t)a3;
- (void)setObjects:(id)a3;
- (void)setWantsOneColumnLayout:(BOOL)a3;
- (void)toggleEntriesSate;
@end

@implementation SearchHomeBrowseCategoriesDataProvider

- (SearchHomeBrowseCategoriesDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SearchHomeBrowseCategoriesDataProvider;
  v13 = [(SearchHomeBrowseCategoriesDataProvider *)&v21 init];
  if (v13)
  {
    v14 = (NSArray *)[v10 copy];
    objects = v13->_objects;
    v13->_objects = v14;

    [(SearchHomeBrowseCategoriesDataProvider *)v13 setNumberOfVisibleItems:[(NSArray *)v13->_objects count]];
    v13->_type = a4;
    v16 = (NSString *)[v11 copy];
    identifier = v13->_identifier;
    v13->_identifier = v16;

    v18 = (NSString *)[v12 copy];
    title = v13->_title;
    v13->_title = v18;
  }
  return v13;
}

- (id)headerAccessibilityIdentifier
{
  return @"SearchHomeBrowseCategories";
}

- (NSArray)objects
{
  objects = self->_objects;
  unint64_t v3 = [(SearchHomeBrowseCategoriesDataProvider *)self numberOfVisibleItems];

  return -[NSArray subarrayWithRange:](objects, "subarrayWithRange:", 0, v3);
}

- (void)setEntriesState:(int64_t)a3
{
  self->_int64_t entriesState = a3;
  if ([(NSArray *)self->_objects count] <= 3)
  {
    actionTitle = self->_actionTitle;
    self->_actionTitle = (NSString *)&stru_101324E70;

LABEL_7:
    NSUInteger v9 = [(NSArray *)self->_objects count];
    goto LABEL_8;
  }
  int64_t entriesState = self->_entriesState;
  if (!entriesState)
  {
    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"Less [expand state]" value:@"localized string not found" table:0];
    id v12 = self->_actionTitle;
    self->_actionTitle = v11;

    goto LABEL_7;
  }
  if (entriesState != 1) {
    return;
  }
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"More [collapse state]" value:@"localized string not found" table:0];
  v8 = self->_actionTitle;
  self->_actionTitle = v7;

  NSUInteger v9 = 3;
LABEL_8:

  [(SearchHomeBrowseCategoriesDataProvider *)self setNumberOfVisibleItems:v9];
}

- (void)toggleEntriesSate
{
  int64_t entriesState = self->_entriesState;
  if (entriesState == 1)
  {
    [(SearchHomeBrowseCategoriesDataProvider *)self setEntriesState:0];
  }
  else if (!entriesState)
  {
    [(SearchHomeBrowseCategoriesDataProvider *)self setEntriesState:1];
  }
}

- (void)resetEntriesState
{
}

- (id)objectsTitles
{
  id v3 = objc_alloc((Class)NSMutableArray);
  v4 = [(SearchHomeBrowseCategoriesDataProvider *)self objects];
  id v5 = [v3 initWithCapacity:[v4 count]];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(SearchHomeBrowseCategoriesDataProvider *)self objects];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) name];
        [v5 addObject:v11];
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  if ([v5 count]) {
    id v12 = [v5 copy];
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (BOOL)wantsOneColumnLayout
{
  return self->_wantsOneColumnLayout;
}

- (void)setWantsOneColumnLayout:(BOOL)a3
{
  self->_wantsOneColumnLayout = a3;
}

- (void)setObjects:(id)a3
{
}

- (unint64_t)numberOfVisibleItems
{
  return self->_numberOfVisibleItems;
}

- (void)setNumberOfVisibleItems:(unint64_t)a3
{
  self->_numberOfVisibleItems = a3;
}

- (int64_t)entriesState
{
  return self->_entriesState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end