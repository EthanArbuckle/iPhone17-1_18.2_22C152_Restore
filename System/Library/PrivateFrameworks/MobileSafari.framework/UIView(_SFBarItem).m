@interface UIView(_SFBarItem)
- (void)sf_configureLargeContentViewerForBarItem:()_SFBarItem;
- (void)sf_configureLargeContentViewerWithImage:()_SFBarItem title:;
@end

@implementation UIView(_SFBarItem)

- (void)sf_configureLargeContentViewerWithImage:()_SFBarItem title:
{
  id v7 = a4;
  id v6 = a3;
  [a1 setShowsLargeContentViewer:1];
  [a1 setLargeContentImage:v6];

  [a1 setLargeContentTitle:v7];
}

- (void)sf_configureLargeContentViewerForBarItem:()_SFBarItem
{
  [a1 setShowsLargeContentViewer:1];
  v5 = (void *)MEMORY[0x1E4FB1818];
  id v6 = SFSystemImageNameForBarItem(a3);
  id v7 = [v5 _systemImageNamed:v6];
  [a1 setLargeContentImage:v7];

  SFAccessibilityTitleForBarItem(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setLargeContentTitle:v8];
}

@end