@interface PREditor
- (WKWallpaperPosterEditingLook)wk_currentLook;
- (void)wk_requestDismissalWithAction:(int64_t)a3;
@end

@implementation PREditor

- (WKWallpaperPosterEditingLook)wk_currentLook
{
  v2 = self;
  id v3 = [(PREditor *)v2 currentLook];

  return (WKWallpaperPosterEditingLook *)v3;
}

- (void)wk_requestDismissalWithAction:(int64_t)a3
{
  [(PREditor *)self requestDismissalWithAction:a3 == 1];
}

@end