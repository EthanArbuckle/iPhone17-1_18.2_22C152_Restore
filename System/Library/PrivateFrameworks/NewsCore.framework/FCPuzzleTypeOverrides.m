@interface FCPuzzleTypeOverrides
- (FCAssetHandle)exploreTileImageAssetHandle;
- (FCColor)darkStyleThemeColor;
- (FCColor)themeColor;
- (FCPuzzleTypeOverrides)initWithThemeColor:(id)a3 darkStyleThemeColor:(id)a4 exploreTileImageAssetHandle:(id)a5;
- (void)setDarkStyleThemeColor:(id)a3;
- (void)setExploreTileImageAssetHandle:(id)a3;
- (void)setThemeColor:(id)a3;
@end

@implementation FCPuzzleTypeOverrides

- (FCPuzzleTypeOverrides)initWithThemeColor:(id)a3 darkStyleThemeColor:(id)a4 exploreTileImageAssetHandle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)FCPuzzleTypeOverrides;
  v11 = [(FCPuzzleTypeOverrides *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(FCPuzzleTypeOverrides *)v11 setThemeColor:v8];
    [(FCPuzzleTypeOverrides *)v12 setDarkStyleThemeColor:v9];
    [(FCPuzzleTypeOverrides *)v12 setExploreTileImageAssetHandle:v10];
  }

  return v12;
}

- (FCColor)themeColor
{
  return self->_themeColor;
}

- (void)setThemeColor:(id)a3
{
}

- (FCColor)darkStyleThemeColor
{
  return self->_darkStyleThemeColor;
}

- (void)setDarkStyleThemeColor:(id)a3
{
}

- (FCAssetHandle)exploreTileImageAssetHandle
{
  return self->_exploreTileImageAssetHandle;
}

- (void)setExploreTileImageAssetHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exploreTileImageAssetHandle, 0);
  objc_storeStrong((id *)&self->_darkStyleThemeColor, 0);
  objc_storeStrong((id *)&self->_themeColor, 0);
}

@end