@interface IMThemeBookshelf
- (BOOL)hasRowTopGradient;
- (BOOL)isNight;
- (BOOL)isNight:(id)a3;
- (IMThemeBookshelf)init;
- (UIColor)applicationSnapshotScrimColor;
- (UIColor)backgroundFixedGradientColor0;
- (UIColor)backgroundFixedGradientColor1;
- (UIColor)gridListToggleSelectedColor;
- (UIColor)listAuthorAndGenreTextColor;
- (UIColor)listBookTextColor;
- (UIColor)listMoveHandleColor;
- (UIColor)rowSolidFillColor;
- (UIColor)rowTopGradientColor0;
- (UIColor)rowTopGradientColor1;
- (UIColor)scrimColor;
- (UIColor)scrimColorList;
- (UIColor)searchBackgroundColor;
- (UIColor)searchBackgroundColorList;
- (UIColor)searchPlaceholderTextColor;
- (UIColor)searchTextColor;
- (UIColor)selectedSegmentTextColor;
- (UIColor)separatorColor;
- (UIColor)shelfTopColor;
- (UIColor)toolbarTintColor;
- (double)rowSolidFillColorBottommostAlpha;
- (double)rowSolidFillColorTopmostAlpha;
- (id)backgroundColorForTraitCollection:(id)a3;
- (id)backgroundColorForTraitEnvironment:(id)a3;
- (id)rowBottomGradient;
- (int64_t)toolbarStyle;
- (void)setApplicationSnapshotScrimColor:(id)a3;
- (void)setBackgroundFixedGradientColor0:(id)a3;
- (void)setBackgroundFixedGradientColor1:(id)a3;
- (void)setGridListToggleSelectedColor:(id)a3;
- (void)setHasRowTopGradient:(BOOL)a3;
- (void)setListAuthorAndGenreTextColor:(id)a3;
- (void)setListBookTextColor:(id)a3;
- (void)setListMoveHandleColor:(id)a3;
- (void)setRowBottomGradient:(id)a3;
- (void)setRowSolidFillColor:(id)a3;
- (void)setRowSolidFillColorBottommostAlpha:(double)a3;
- (void)setRowSolidFillColorTopmostAlpha:(double)a3;
- (void)setRowTopGradientColor0:(id)a3;
- (void)setRowTopGradientColor1:(id)a3;
- (void)setScrimColor:(id)a3;
- (void)setScrimColorList:(id)a3;
- (void)setSearchBackgroundColor:(id)a3;
- (void)setSearchBackgroundColorList:(id)a3;
- (void)setSearchPlaceholderTextColor:(id)a3;
- (void)setSearchTextColor:(id)a3;
- (void)setSelectedSegmentTextColor:(id)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setShelfTopColor:(id)a3;
- (void)setToolbarStyle:(int64_t)a3;
- (void)setToolbarTintColor:(id)a3;
- (void)stylizeSegmentedControl:(id)a3;
@end

@implementation IMThemeBookshelf

- (IMThemeBookshelf)init
{
  v40.receiver = self;
  v40.super_class = (Class)IMThemeBookshelf;
  v2 = [(IMTheme *)&v40 init];
  v3 = v2;
  if (v2)
  {
    [(IMTheme *)v2 setCompositingFilter:kCAFilterPlusD];
    v4 = +[UIColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
    [(IMTheme *)v3 setTintColor:v4];

    v5 = +[UIColor colorWithWhite:0.0 alpha:1.0];
    [(IMTheme *)v3 setToolbarTitleColor:v5];

    [(IMThemeBookshelf *)v3 setToolbarStyle:0];
    v6 = +[UIColor clearColor];
    [(IMThemeBookshelf *)v3 setScrimColor:v6];

    v7 = +[UIColor colorWithRed:0.968627451 green:0.968627451 blue:0.968627451 alpha:0.82];
    [(IMThemeBookshelf *)v3 setScrimColorList:v7];

    [(IMThemeBookshelf *)v3 setToolbarTintColor:0];
    v8 = +[UIColor whiteColor];
    [(IMTheme *)v3 setPopoverBackgroundColor:v8];

    v9 = +[UIColor blackColor];
    [(IMTheme *)v3 setPopoverTitleColor:v9];

    v10 = +[UIColor colorWithRed:0.0784313725 green:0.0784313725 blue:0.117647059 alpha:0.35];
    [(IMThemeBookshelf *)v3 setSearchBackgroundColor:v10];

    v11 = +[UIColor colorWithRed:0.0784313725 green:0.0784313725 blue:0.117647059 alpha:0.2];
    [(IMThemeBookshelf *)v3 setSearchBackgroundColorList:v11];

    v12 = +[UIColor colorWithWhite:1.0 alpha:0.899999976];
    [(IMThemeBookshelf *)v3 setSearchTextColor:v12];

    v13 = +[UIColor colorWithWhite:1.0 alpha:0.899999976];
    [(IMThemeBookshelf *)v3 setSearchPlaceholderTextColor:v13];

    v14 = +[UIColor colorWithWhite:1.0 alpha:1.0];
    [(IMThemeBookshelf *)v3 setGridListToggleSelectedColor:v14];

    v15 = +[UIColor colorWithRed:0.0156862745 green:0.0156862745 blue:0.0588235294 alpha:0.45];
    [(IMThemeBookshelf *)v3 setListAuthorAndGenreTextColor:v15];

    v16 = +[UIColor colorWithRed:0.0156862745 green:0.0156862745 blue:0.0588235294 alpha:0.75];
    [(IMThemeBookshelf *)v3 setListBookTextColor:v16];

    v17 = +[UIColor colorWithRed:0.0156862745 green:0.0156862745 blue:0.0588235294 alpha:0.3];
    [(IMThemeBookshelf *)v3 setListMoveHandleColor:v17];

    v18 = +[UIColor colorWithWhite:0.0 alpha:0.1];
    [(IMThemeBookshelf *)v3 setSeparatorColor:v18];

    v19 = +[UIColor colorWithWhite:1.0 alpha:0.95];
    [(IMThemeBookshelf *)v3 setSelectedSegmentTextColor:v19];

    v20 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75];
    [(IMThemeBookshelf *)v3 setBackgroundFixedGradientColor0:v20];

    v21 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    [(IMThemeBookshelf *)v3 setBackgroundFixedGradientColor1:v21];

    v22 = +[UIColor colorWithWhite:1.0 alpha:0.0];
    [(IMThemeBookshelf *)v3 setShelfTopColor:v22];

    id v23 = +[UIColor colorWithRed:0.0156862754 green:0.0156862754 blue:0.0627451017 alpha:0.0];
    id v24 = [v23 CGColor];
    id v25 = +[UIColor colorWithRed:0.0156862754 green:0.0156862754 blue:0.0627451017 alpha:0.100000001];
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v24, [v25 CGColor], 0);
    CFArrayRef v26 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

    *(_OWORD *)locations = xmmword_2A26B0;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v28 = CGGradientCreateWithColors(DeviceRGB, v26, locations);
    [(IMThemeBookshelf *)v3 setRowBottomGradient:v28];
    CGGradientRelease(v28);
    CGColorSpaceRelease(DeviceRGB);
    v29 = +[UIColor colorWithRed:0.941176471 green:0.941176471 blue:0.941176471 alpha:1.0];
    [(IMThemeBookshelf *)v3 setRowSolidFillColor:v29];

    [(IMThemeBookshelf *)v3 setRowSolidFillColorTopmostAlpha:0.0];
    [(IMThemeBookshelf *)v3 setRowSolidFillColorBottommostAlpha:0.720000029];
    v30 = +[UIColor colorWithWhite:0.97 alpha:0.9];
    [(IMTheme *)v3 setTableViewHeaderViewColor:v30];

    v31 = +[UIColor colorWithWhite:0.97 alpha:0.9];
    [(IMTheme *)v3 setTableViewToolbarColor:v31];

    [(IMTheme *)v3 setTableViewToolbarTranslucent:1];
    v32 = +[UIColor colorWithWhite:0.0 alpha:0.67];
    [(IMTheme *)v3 setHeaderTextColor:v32];

    v33 = +[UIColor colorWithWhite:0.0 alpha:0.5];
    [(IMTheme *)v3 setHeaderTextColorDimmed:v33];

    v34 = +[UIColor darkTextColor];
    [(IMTheme *)v3 setContentTextColor:v34];

    v35 = +[UIColor blackColor];
    [(IMTheme *)v3 setButtonTitleColor:v35];

    v36 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5];
    [(IMTheme *)v3 setButtonTitleColorDisabled:v36];

    v37 = [(IMTheme *)v3 contentTextColor];
    [(IMTheme *)v3 setFooterTextColor:v37];

    v38 = +[UIColor colorWithRed:0.780392157 green:0.780392157 blue:0.8 alpha:1.0];
    [(IMThemeBookshelf *)v3 setApplicationSnapshotScrimColor:v38];
  }
  return v3;
}

- (void)stylizeSegmentedControl:(id)a3
{
  id v4 = a3;
  v5 = [(IMTheme *)self tintColor];
  [v4 setTintColor:v5];

  v6 = [v4 titleTextAttributesForState:4];
  id v8 = +[NSMutableDictionary dictionaryWithDictionary:v6];

  v7 = [(IMThemeBookshelf *)self selectedSegmentTextColor];
  [v8 setObject:v7 forKeyedSubscript:NSForegroundColorAttributeName];

  [v4 setTitleTextAttributes:v8 forState:4];
}

- (BOOL)isNight:(id)a3
{
  return 0;
}

- (id)backgroundColorForTraitEnvironment:(id)a3
{
  return [(IMThemeBookshelf *)self backgroundColorForTraitCollection:0];
}

- (id)backgroundColorForTraitCollection:(id)a3
{
  return +[UIColor whiteColor];
}

- (UIColor)applicationSnapshotScrimColor
{
  return self->_applicationSnapshotScrimColor;
}

- (void)setApplicationSnapshotScrimColor:(id)a3
{
}

- (UIColor)scrimColor
{
  return self->_scrimColor;
}

- (void)setScrimColor:(id)a3
{
}

- (UIColor)scrimColorList
{
  return self->_scrimColorList;
}

- (void)setScrimColorList:(id)a3
{
}

- (int64_t)toolbarStyle
{
  return self->_toolbarStyle;
}

- (void)setToolbarStyle:(int64_t)a3
{
  self->_toolbarStyle = a3;
}

- (UIColor)toolbarTintColor
{
  return self->_toolbarTintColor;
}

- (void)setToolbarTintColor:(id)a3
{
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (void)setSeparatorColor:(id)a3
{
}

- (UIColor)searchBackgroundColor
{
  return self->_searchBackgroundColor;
}

- (void)setSearchBackgroundColor:(id)a3
{
}

- (UIColor)searchBackgroundColorList
{
  return self->_searchBackgroundColorList;
}

- (void)setSearchBackgroundColorList:(id)a3
{
}

- (UIColor)searchTextColor
{
  return self->_searchTextColor;
}

- (void)setSearchTextColor:(id)a3
{
}

- (UIColor)searchPlaceholderTextColor
{
  return self->_searchPlaceholderTextColor;
}

- (void)setSearchPlaceholderTextColor:(id)a3
{
}

- (UIColor)gridListToggleSelectedColor
{
  return self->_gridListToggleSelectedColor;
}

- (void)setGridListToggleSelectedColor:(id)a3
{
}

- (UIColor)listBookTextColor
{
  return self->_listBookTextColor;
}

- (void)setListBookTextColor:(id)a3
{
}

- (UIColor)listAuthorAndGenreTextColor
{
  return self->_listAuthorAndGenreTextColor;
}

- (void)setListAuthorAndGenreTextColor:(id)a3
{
}

- (UIColor)listMoveHandleColor
{
  return self->_listMoveHandleColor;
}

- (void)setListMoveHandleColor:(id)a3
{
}

- (UIColor)selectedSegmentTextColor
{
  return self->_selectedSegmentTextColor;
}

- (void)setSelectedSegmentTextColor:(id)a3
{
}

- (UIColor)backgroundFixedGradientColor0
{
  return self->_backgroundFixedGradientColor0;
}

- (void)setBackgroundFixedGradientColor0:(id)a3
{
}

- (UIColor)backgroundFixedGradientColor1
{
  return self->_backgroundFixedGradientColor1;
}

- (void)setBackgroundFixedGradientColor1:(id)a3
{
}

- (UIColor)shelfTopColor
{
  return self->_shelfTopColor;
}

- (void)setShelfTopColor:(id)a3
{
}

- (id)rowBottomGradient
{
  return self->_rowBottomGradient;
}

- (void)setRowBottomGradient:(id)a3
{
}

- (UIColor)rowSolidFillColor
{
  return self->_rowSolidFillColor;
}

- (void)setRowSolidFillColor:(id)a3
{
}

- (double)rowSolidFillColorTopmostAlpha
{
  return self->_rowSolidFillColorTopmostAlpha;
}

- (void)setRowSolidFillColorTopmostAlpha:(double)a3
{
  self->_rowSolidFillColorTopmostAlpha = a3;
}

- (double)rowSolidFillColorBottommostAlpha
{
  return self->_rowSolidFillColorBottommostAlpha;
}

- (void)setRowSolidFillColorBottommostAlpha:(double)a3
{
  self->_rowSolidFillColorBottommostAlpha = a3;
}

- (BOOL)hasRowTopGradient
{
  return self->_hasRowTopGradient;
}

- (void)setHasRowTopGradient:(BOOL)a3
{
  self->_hasRowTopGradient = a3;
}

- (UIColor)rowTopGradientColor0
{
  return self->_rowTopGradientColor0;
}

- (void)setRowTopGradientColor0:(id)a3
{
}

- (UIColor)rowTopGradientColor1
{
  return self->_rowTopGradientColor1;
}

- (void)setRowTopGradientColor1:(id)a3
{
}

- (BOOL)isNight
{
  return self->_isNight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowTopGradientColor1, 0);
  objc_storeStrong((id *)&self->_rowTopGradientColor0, 0);
  objc_storeStrong((id *)&self->_rowSolidFillColor, 0);
  objc_storeStrong(&self->_rowBottomGradient, 0);
  objc_storeStrong((id *)&self->_shelfTopColor, 0);
  objc_storeStrong((id *)&self->_backgroundFixedGradientColor1, 0);
  objc_storeStrong((id *)&self->_backgroundFixedGradientColor0, 0);
  objc_storeStrong((id *)&self->_selectedSegmentTextColor, 0);
  objc_storeStrong((id *)&self->_listMoveHandleColor, 0);
  objc_storeStrong((id *)&self->_listAuthorAndGenreTextColor, 0);
  objc_storeStrong((id *)&self->_listBookTextColor, 0);
  objc_storeStrong((id *)&self->_gridListToggleSelectedColor, 0);
  objc_storeStrong((id *)&self->_searchPlaceholderTextColor, 0);
  objc_storeStrong((id *)&self->_searchTextColor, 0);
  objc_storeStrong((id *)&self->_searchBackgroundColorList, 0);
  objc_storeStrong((id *)&self->_searchBackgroundColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_toolbarTintColor, 0);
  objc_storeStrong((id *)&self->_scrimColorList, 0);
  objc_storeStrong((id *)&self->_scrimColor, 0);

  objc_storeStrong((id *)&self->_applicationSnapshotScrimColor, 0);
}

@end