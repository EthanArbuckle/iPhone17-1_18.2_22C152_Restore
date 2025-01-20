@interface MFSearchBar
- (BOOL)showsProgress;
- (MFSearchBar)initWithCoder:(id)a3;
- (MFSearchBar)initWithFrame:(CGRect)a3;
- (NSArray)representedObjects;
- (NSArray)representedSuggestionTokens;
- (NSArray)selectedRepresentedObjects;
- (NSProgress)progress;
- (int64_t)_dataOwnerForCopy;
- (int64_t)_dataOwnerForPaste;
- (void)replaceSearchBarWithTokens:(id)a3 userQueryString:(id)a4;
- (void)setProgress:(id)a3;
- (void)setRepresentedObjects:(id)a3;
- (void)setShowsProgress:(BOOL)a3;
@end

@implementation MFSearchBar

- (MFSearchBar)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFSearchBar;
  v3 = -[MFSearchBar initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    sub_100059A90(v3);
  }
  return v4;
}

- (MFSearchBar)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFSearchBar;
  v5 = [(MFSearchBar *)&v8 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5) {
    sub_100059A90(v5);
  }

  return v6;
}

- (NSArray)representedObjects
{
  v3 = +[NSMutableArray array];
  id v4 = [(MFSearchBar *)self searchTextField];
  v5 = [v4 tokens];
  id v6 = [v5 count];

  if (v6)
  {
    v7 = [(MFSearchBar *)self searchTextField];
    objc_super v8 = [v7 tokens];
    v9 = [v8 ef_map:&stru_10060CE18];
    [v3 addObjectsFromArray:v9];
  }
  v10 = [(MFSearchBar *)self text];
  id v11 = [v10 length];

  if (v11)
  {
    v12 = [(MFSearchBar *)self text];
    [v3 addObject:v12];
  }
  id v13 = [v3 copy];

  return (NSArray *)v13;
}

- (int64_t)_dataOwnerForPaste
{
  return 3;
}

- (int64_t)_dataOwnerForCopy
{
  return 3;
}

- (void)setRepresentedObjects:(id)a3
{
  id v15 = a3;
  v16 = [(MFSearchBar *)self searchTextField];
  id v4 = [v16 tokens];
  v5 = (char *)[v4 count];

  while ((uint64_t)v5 > 0)
    [v16 removeTokenAtIndex:--v5];
  [(MFSearchBar *)self setText:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v15 reverseObjectEnumerator];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          v12 = [v11 image];
          id v13 = [v11 title];
          v14 = +[UISearchToken tokenWithIcon:v12 text:v13];

          [v14 setRepresentedObject:v11];
          [v16 insertToken:v14 atIndex:0];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_14;
          }
          [(MFSearchBar *)self setText:v10];
          id v11 = [(MFSearchBar *)self delegate];
          [v11 searchBar:self textDidChange:v10];
        }

LABEL_14:
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

- (NSArray)selectedRepresentedObjects
{
  v3 = +[NSMutableArray array];
  id v4 = [(MFSearchBar *)self searchTextField];
  v5 = [(MFSearchBar *)self searchTextField];
  id v6 = [v5 selectedTextRange];
  id v7 = [v4 tokensInRange:v6];

  if ([v7 count])
  {
    uint64_t v8 = [v7 ef_map:&stru_10060CE38];
    [v3 addObjectsFromArray:v8];
  }
  v9 = [(MFSearchBar *)self searchTextField];
  v10 = [v9 selectedTextRange];
  unsigned __int8 v11 = [v10 isEmpty];

  if ((v11 & 1) == 0)
  {
    v12 = [(MFSearchBar *)self searchTextField];
    id v13 = [(MFSearchBar *)self searchTextField];
    v14 = [v13 selectedTextRange];
    id v15 = [v12 textInRange:v14];
    [v3 addObject:v15];
  }
  id v16 = [v3 copy];

  return (NSArray *)v16;
}

- (NSArray)representedSuggestionTokens
{
  v2 = [(MFSearchBar *)self representedObjects];
  v3 = [v2 ef_filter:&stru_10060CE58];

  return (NSArray *)v3;
}

- (void)replaceSearchBarWithTokens:(id)a3 userQueryString:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(MFSearchBar *)self searchTextField];
  [v7 setText:&stru_100619928];
  uint64_t v8 = [v14 ef_map:&stru_10060CE98];
  if ([v6 length]) {
    [v7 setText:v6];
  }
  [v7 setTokens:v8];
  v9 = [v7 tokens];
  v10 = (char *)[v9 count];

  if (v10 && ![v6 length])
  {
    unsigned __int8 v11 = [v7 positionOfTokenAtIndex:v10 - 1];
    v12 = [v7 endOfDocument];
    id v13 = [v7 textRangeFromPosition:v11 toPosition:v12];
    [v7 setSelectedTextRange:v13];
  }
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (BOOL)showsProgress
{
  return self->_showsProgress;
}

- (void)setShowsProgress:(BOOL)a3
{
  self->_showsProgress = a3;
}

- (void).cxx_destruct
{
}

@end