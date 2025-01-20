@interface SBHLibraryCategoryPodIconListView
- (Class)baseIconViewClass;
- (void)configureIconView:(id)a3 forIcon:(id)a4;
@end

@implementation SBHLibraryCategoryPodIconListView

- (Class)baseIconViewClass
{
  return (Class)objc_opt_class();
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 setImageLoadingBehavior:1];
  v12.receiver = self;
  v12.super_class = (Class)SBHLibraryCategoryPodIconListView;
  [(SBIconListView *)&v12 configureIconView:v6 forIcon:v7];
  v8 = [(SBIconListView *)self iconLocation];
  int v9 = [v8 isEqualToString:@"SBIconLocationAppLibraryCategoryPodSuggestions"];

  if (v9)
  {
    v10 = [v7 nodeIdentifier];
    v11 = [@"SBHLibraryCategoryIconViewController-Suggestions-innerIcon:" stringByAppendingString:v10];
    [v6 setAccessibilityIdentifier:v11];
  }
}

@end