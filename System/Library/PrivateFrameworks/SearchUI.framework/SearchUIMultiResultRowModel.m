@interface SearchUIMultiResultRowModel
- (BOOL)fillsBackgroundWithContent;
- (BOOL)isFocusable;
- (BOOL)isTappable;
- (Class)collectionViewCellClass;
- (NSArray)multiResults;
- (SearchUIMultiResultRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4;
- (id)accessibilityIdentifier;
- (id)dragAppBundleID;
- (int)separatorStyle;
- (int64_t)removeResult:(id)a3;
- (void)setMultiResults:(id)a3;
@end

@implementation SearchUIMultiResultRowModel

- (NSArray)multiResults
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (SearchUIMultiResultRowModel)initWithResults:(id)a3 itemIdentifier:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUIMultiResultRowModel;
  v7 = [(SearchUIRowModel *)&v10 initWithResults:v6 itemIdentifier:a4];
  v8 = v7;
  if (v7) {
    [(SearchUIMultiResultRowModel *)v7 setMultiResults:v6];
  }

  return v8;
}

- (void)setMultiResults:(id)a3
{
}

- (BOOL)fillsBackgroundWithContent
{
  return 1;
}

- (int)separatorStyle
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return 0;
}

- (Class)collectionViewCellClass
{
  return (Class)objc_opt_class();
}

- (int64_t)removeResult:(id)a3
{
  id v4 = a3;
  v5 = [(SearchUIMultiResultRowModel *)self multiResults];
  id v6 = (void *)[v5 mutableCopy];

  int64_t v7 = [v6 indexOfObject:v4];
  [v6 removeObject:v4];

  [(SearchUIMultiResultRowModel *)self setMultiResults:v6];
  return v7;
}

- (BOOL)isTappable
{
  v2 = [(SearchUIMultiResultRowModel *)self results];
  BOOL v3 = [v2 count] == 1;

  return v3;
}

- (id)dragAppBundleID
{
  BOOL v3 = [(SearchUIRowModel *)self identifyingResult];
  if ([v3 isLocalApplicationResult])
  {
    id v4 = [(SearchUIRowModel *)self identifyingResult];
    v5 = [v4 applicationBundleIdentifier];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isFocusable
{
  return 0;
}

- (void).cxx_destruct
{
}

@end