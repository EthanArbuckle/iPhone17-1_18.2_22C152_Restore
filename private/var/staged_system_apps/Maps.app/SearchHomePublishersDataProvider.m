@interface SearchHomePublishersDataProvider
- (BOOL)showDisclosureIndicator;
- (NSArray)objects;
- (NSArray)viewModels;
- (NSString)identifier;
- (NSString)title;
- (SearchHomePublishersDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6;
- (id)headerAccessibilityIdentifier;
- (int64_t)type;
- (void)setObjects:(id)a3;
- (void)setViewModels:(id)a3;
@end

@implementation SearchHomePublishersDataProvider

- (SearchHomePublishersDataProvider)initWithObjects:(id)a3 type:(int64_t)a4 identifier:(id)a5 title:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v37.receiver = self;
  v37.super_class = (Class)SearchHomePublishersDataProvider;
  v13 = [(SearchHomePublishersDataProvider *)&v37 init];
  if (v13)
  {
    int64_t v31 = a4;
    v32 = v11;
    v14 = (NSArray *)[v10 copy];
    objects = v13->_objects;
    v13->_objects = v14;

    BOOL v16 = [(SearchHomePublishersDataProvider *)v13 showDisclosureIndicator];
    v17 = +[NSMutableArray arrayWithCapacity:[(NSArray *)v13->_objects count]];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v18 = v13->_objects;
    id v19 = [(NSArray *)v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v34;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = +[TwoLinesContentViewModelComposer cellModelForPublisher:*(void *)(*((void *)&v33 + 1) + 8 * i) showDisclosureIndicator:v16];
          [v17 addObject:v23];
        }
        id v20 = [(NSArray *)v18 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v20);
    }

    v24 = (NSArray *)[v17 copy];
    viewModels = v13->_viewModels;
    v13->_viewModels = v24;

    id v11 = v32;
    v13->_type = v31;
    v26 = (NSString *)[v32 copy];
    identifier = v13->_identifier;
    v13->_identifier = v26;

    v28 = (NSString *)[v12 copy];
    title = v13->_title;
    v13->_title = v28;
  }
  return v13;
}

- (id)headerAccessibilityIdentifier
{
  return @"SearchHomePublishers";
}

- (BOOL)showDisclosureIndicator
{
  v2 = +[UIDevice currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] != (id)5;

  return v3;
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

- (NSArray)objects
{
  return self->_objects;
}

- (void)setObjects:(id)a3
{
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void)setViewModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end