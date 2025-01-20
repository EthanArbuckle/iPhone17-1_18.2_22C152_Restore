@interface UISearchTab
- (UISearchTab)initWithViewControllerProvider:(id)a3;
@end

@implementation UISearchTab

- (UISearchTab)initWithViewControllerProvider:(id)a3
{
  id v4 = a3;
  if (qword_1EB262DF0 != -1) {
    dispatch_once(&qword_1EB262DF0, &__block_literal_global_476);
  }
  v8.receiver = self;
  v8.super_class = (Class)UISearchTab;
  v5 = [(UITab *)&v8 initWithTitle:_MergedGlobals_1215 image:qword_1EB262DE8 identifier:@"com.apple.UIKit.Search" viewControllerProvider:v4];
  v6 = v5;
  if (v5) {
    [(UITab *)v5 setPreferredPlacement:4];
  }

  return v6;
}

void __46__UISearchTab_initWithViewControllerProvider___block_invoke()
{
  uint64_t v0 = _UINSLocalizedStringWithDefaultValue(@"Search", @"Search");
  v1 = (void *)_MergedGlobals_1215;
  _MergedGlobals_1215 = v0;

  uint64_t v2 = +[UIImage systemImageNamed:@"magnifyingglass"];
  v3 = (void *)qword_1EB262DE8;
  qword_1EB262DE8 = v2;
}

@end