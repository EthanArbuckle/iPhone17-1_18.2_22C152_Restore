@interface SearchUIScreenTimeResultsRowModel
- (BOOL)isTappable;
- (Class)cellViewClass;
- (Class)collectionViewCellClass;
- (NSString)title;
- (SFSearchResult)overrideIdentifyingResult;
- (SearchUIScreenTimeResultsRowModel)initWithSection:(id)a3 result:(id)a4 itemIdentifier:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)identifyingResult;
- (void)setOverrideIdentifyingResult:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SearchUIScreenTimeResultsRowModel

- (SearchUIScreenTimeResultsRowModel)initWithSection:(id)a3 result:(id)a4 itemIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 results];
  v27.receiver = self;
  v27.super_class = (Class)SearchUIScreenTimeResultsRowModel;
  v12 = [(SearchUIRowModel *)&v27 initWithResults:v11 itemIdentifier:v10];

  if (v12)
  {
    [(SearchUIScreenTimeResultsRowModel *)v12 setOverrideIdentifyingResult:v9];
    v13 = [(SearchUIScreenTimeResultsRowModel *)v12 identifyingResult];
    v14 = [v13 sectionBundleIdentifier];

    v15 = [(SearchUIScreenTimeResultsRowModel *)v12 identifyingResult];
    v16 = [v15 applicationBundleIdentifier];

    v17 = +[SearchUIUtilities bundleIdentifierForApp:15];
    if ([v14 isEqualToString:v17])
    {
      id v18 = +[SearchUIUtilities bundleIdentifierForApp:15];
    }
    else
    {
      id v18 = v16;
    }
    v19 = v18;

    v20 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v19 allowPlaceholder:1 error:0];
    v21 = [v20 localizedName];

    v22 = NSString;
    v23 = +[SearchUIUtilities localizedStringForKey:@"BLOCKED_APP"];
    v24 = v21;
    if (!v21)
    {
      v24 = [v8 title];
    }
    v25 = [v22 stringWithValidatedFormat:v23, @"%@", 0, v24 validFormatSpecifiers error];
    [(SearchUIScreenTimeResultsRowModel *)v12 setTitle:v25];

    if (!v21) {
  }
    }

  return v12;
}

- (id)identifyingResult
{
  v3 = [(SearchUIScreenTimeResultsRowModel *)self overrideIdentifyingResult];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SearchUIScreenTimeResultsRowModel;
    id v5 = [(SearchUIRowModel *)&v8 identifyingResult];
  }
  v6 = v5;

  return v6;
}

- (Class)cellViewClass
{
  return (Class)objc_opt_class();
}

- (Class)collectionViewCellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isTappable
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIScreenTimeResultsRowModel;
  id v4 = [(SearchUIRowModel *)&v7 copyWithZone:a3];
  id v5 = [(SearchUIScreenTimeResultsRowModel *)self title];
  [v4 setTitle:v5];

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (SFSearchResult)overrideIdentifyingResult
{
  return self->_overrideIdentifyingResult;
}

- (void)setOverrideIdentifyingResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideIdentifyingResult, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end