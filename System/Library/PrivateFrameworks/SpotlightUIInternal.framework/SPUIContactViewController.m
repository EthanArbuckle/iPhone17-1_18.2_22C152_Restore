@interface SPUIContactViewController
- (BOOL)isBackgroundColorViewHidden;
- (NSArray)preferredBundleIdentifiers;
- (NSString)contactIdentifier;
- (SPUIContactViewController)init;
- (SearchUIBackgroundColorView)backgroundColorView;
- (void)setBackgroundColorView:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setIsBackgroundColorViewHidden:(BOOL)a3;
- (void)updateWithContactIdentifier:(id)a3 preferredBundleIdentifiers:(id)a4;
- (void)willUpdateFromResultsWithHighlightedResult:(id)a3 viewController:(id)a4;
@end

@implementation SPUIContactViewController

- (SPUIContactViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SPUIContactViewController;
  v2 = [(SPUIViewController *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(SPUIViewController *)v2 searchResultViewController];
    [v4 setShouldAnimateUpdates:1];
  }
  return v3;
}

- (void)updateWithContactIdentifier:(id)a3 preferredBundleIdentifiers:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
  id v8 = a4;
  v9 = (NSArray *)[v8 copy];

  preferredBundleIdentifiers = self->_preferredBundleIdentifiers;
  self->_preferredBundleIdentifiers = v9;

  [(SPUIViewController *)self activateViewController:0 animate:0];
  v11 = +[SPUISearchModel sharedGeneralInstance];
  [v11 activate];
  [v11 updateWithQueryContext:0];
  v12 = [(SPUIViewController *)self searchResultViewController];
  [v12 searchAgentClearedResults:v11];

  v13 = [(SPUIContactViewController *)self backgroundColorView];
  [v13 setColor:0];

  if ([v7 length])
  {
    v14 = [MEMORY[0x263F78DA0] searchEntityWithContactIdentifier:v7 fromSuggestion:0];
    [v14 setPreferredBundleIDs:self->_preferredBundleIdentifiers];
    id v15 = objc_alloc(MEMORY[0x263F78DB0]);
    uint64_t v16 = [v14 tokenText];
    v17 = (void *)v16;
    if (v16) {
      v18 = (__CFString *)v16;
    }
    else {
      v18 = &stru_26F104E28;
    }
    v19 = (void *)[v15 initWithSearchString:v18];

    v29[0] = v14;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:1];
    [v19 setSearchEntities:v20];

    [v11 updateWithQueryContext:v19];
    v21 = [v14 tokenText];
    v22 = [(SPUIViewController *)self searchResultViewController];
    [v22 setQueryString:v21];

    if (![(SPUIContactViewController *)self isBackgroundColorViewHidden])
    {
      v23 = objc_opt_new();
      id v28 = v7;
      v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
      [v23 setContactIdentifiers:v24];

      v25 = objc_opt_new();
      [v25 setImage:v23];
      v26 = [(SPUIContactViewController *)self backgroundColorView];
      if (!v26)
      {
        v26 = objc_opt_new();
        [v26 setShowsPlaceholderPlatterView:0];
        [v26 setDelegate:self];
        v27 = [(SPUIContactViewController *)self view];
        [v27 insertSubview:v26 atIndex:0];

        [MEMORY[0x263F67C10] fillContainerWithView:v26];
        [(SPUIContactViewController *)self setBackgroundColorView:v26];
      }
      [v26 setColor:v25];
      [v14 setEntityBackgroundColor:v25];
    }
  }
}

- (void)setContactIdentifier:(id)a3
{
}

- (void)willUpdateFromResultsWithHighlightedResult:(id)a3 viewController:(id)a4
{
  id v5 = [(SPUIViewController *)self searchResultViewController];
  [(SPUIViewController *)self activateViewController:v5 animate:1];
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (BOOL)isBackgroundColorViewHidden
{
  return self->_isBackgroundColorViewHidden;
}

- (void)setIsBackgroundColorViewHidden:(BOOL)a3
{
  self->_isBackgroundColorViewHidden = a3;
}

- (NSArray)preferredBundleIdentifiers
{
  return self->_preferredBundleIdentifiers;
}

- (SearchUIBackgroundColorView)backgroundColorView
{
  return (SearchUIBackgroundColorView *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setBackgroundColorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_preferredBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end