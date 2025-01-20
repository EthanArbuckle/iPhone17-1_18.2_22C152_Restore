@interface SearchHomeRecentSearchesDataProvider
- (NSArray)objects;
- (NSString)actionTitle;
- (NSString)identifier;
- (NSString)title;
- (SearchHomeRecentSearchesDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6;
- (id)headerAccessibilityIdentifier;
- (id)objectsForAnalytics;
- (int64_t)entriesState;
- (int64_t)type;
- (unint64_t)numberOfVisibleItems;
- (void)deleteAllEntries;
- (void)deleteEntryAtIndex:(unint64_t)a3;
- (void)resetEntriesState;
- (void)setEntriesState:(int64_t)a3;
- (void)setNumberOfVisibleItems:(unint64_t)a3;
- (void)setObjects:(id)a3;
- (void)toggleEntriesSate;
@end

@implementation SearchHomeRecentSearchesDataProvider

- (SearchHomeRecentSearchesDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SearchHomeRecentSearchesDataProvider;
  v13 = [(SearchHomeRecentSearchesDataProvider *)&v21 init];
  if (v13)
  {
    v14 = (NSArray *)[v10 copy];
    objects = v13->_objects;
    v13->_objects = v14;

    v13->_type = a4;
    v16 = (NSString *)[v11 copy];
    identifier = v13->_identifier;
    v13->_identifier = v16;

    v18 = (NSString *)[v12 copy];
    title = v13->_title;
    v13->_title = v18;

    [(SearchHomeRecentSearchesDataProvider *)v13 resetEntriesState];
  }

  return v13;
}

- (void)deleteEntryAtIndex:(unint64_t)a3
{
  v4 = [(SearchHomeRecentSearchesDataProvider *)self objects];
  v5 = [v4 objectAtIndex:a3];

  v6 = +[Recents sharedRecents];
  id v11 = v5;
  v7 = +[NSArray arrayWithObjects:&v11 count:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D37654;
  v9[3] = &unk_1012EB010;
  id v10 = v5;
  id v8 = v5;
  [v6 deleteRecents:v7 completion:v9];

  +[GEOAPPortal captureUserAction:2027 target:13 value:0];
}

- (void)deleteAllEntries
{
  v3 = +[Recents sharedRecents];
  [v3 deleteRecents:self->_objects completion:&stru_101322980];

  +[GEOAPPortal captureUserAction:2026 target:13 value:0];
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
  id v8 = self->_actionTitle;
  self->_actionTitle = v7;

  NSUInteger v9 = 3;
LABEL_8:

  [(SearchHomeRecentSearchesDataProvider *)self setNumberOfVisibleItems:v9];
}

- (void)toggleEntriesSate
{
  int64_t entriesState = self->_entriesState;
  if (entriesState == 1)
  {
    [(SearchHomeRecentSearchesDataProvider *)self setEntriesState:0];
  }
  else if (!entriesState)
  {
    [(SearchHomeRecentSearchesDataProvider *)self setEntriesState:1];
  }
}

- (void)resetEntriesState
{
}

- (NSArray)objects
{
  objects = self->_objects;
  unint64_t v3 = [(SearchHomeRecentSearchesDataProvider *)self numberOfVisibleItems];

  return -[NSArray subarrayWithRange:](objects, "subarrayWithRange:", 0, v3);
}

- (id)objectsForAnalytics
{
  v2 = [(SearchHomeRecentSearchesDataProvider *)self objects];
  id v3 = [v2 copy];

  return v3;
}

- (id)headerAccessibilityIdentifier
{
  return @"SearchHomeRecents";
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

- (int64_t)entriesState
{
  return self->_entriesState;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end