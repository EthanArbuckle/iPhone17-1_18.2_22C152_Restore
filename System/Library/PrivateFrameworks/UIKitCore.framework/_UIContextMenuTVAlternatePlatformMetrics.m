@interface _UIContextMenuTVAlternatePlatformMetrics
- (_UIContextMenuTVAlternatePlatformMetrics)init;
@end

@implementation _UIContextMenuTVAlternatePlatformMetrics

- (_UIContextMenuTVAlternatePlatformMetrics)init
{
  v11.receiver = self;
  v11.super_class = (Class)_UIContextMenuTVAlternatePlatformMetrics;
  v2 = [(_UIContextMenuPlatformMetrics *)&v11 init];
  if (v2)
  {
    v3 = +[UIBlurEffect effectWithStyle:5002];
    [(_UIContextMenuPlatformMetrics *)v2 setMenuBackgroundEffect:v3];
    [(_UIContextMenuPlatformMetrics *)v2 setMenuCornerRadius:36.0];
    [(_UIContextMenuPlatformMetrics *)v2 setDefaultMenuWidth:302.0];
    [(_UIContextMenuPlatformMetrics *)v2 setItemSeparatorHeight:0.0];
    [(_UIContextMenuPlatformMetrics *)v2 setItemTopToFirstBaseline:44.0];
    [(_UIContextMenuPlatformMetrics *)v2 setItemTopToFirstBaselineWithSubtitle:44.0];
    [(_UIContextMenuPlatformMetrics *)v2 setItemLastBaselineToBottom:28.0];
    [(_UIContextMenuPlatformMetrics *)v2 setItemLastBaselineToBottomWithSubtitle:28.0];
    [(_UIContextMenuPlatformMetrics *)v2 setItemBaselineToBaseline:32.0];
    [(_UIContextMenuPlatformMetrics *)v2 setDynamicImageBoxWidth:35.0];
    [(_UIContextMenuPlatformMetrics *)v2 setMinIntraItemSpacing:8.0];
    -[_UIContextMenuPlatformMetrics setMenuItemInternalPadding:](v2, "setMenuItemInternalPadding:", 0.0, 24.0, 0.0, 24.0);
    v4 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1"];
    [(_UIContextMenuPlatformMetrics *)v2 setTitleFont:v4];

    v5 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedCaption2"];
    [(_UIContextMenuPlatformMetrics *)v2 setTitleEmphasizedFont:v5];

    v6 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption2"];
    [(_UIContextMenuPlatformMetrics *)v2 setSubtitleFont:v6];

    v7 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1"];
    [(_UIContextMenuPlatformMetrics *)v2 setIconSymbolFont:v7];

    v8 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleEmphasizedCaption2"];
    [(_UIContextMenuPlatformMetrics *)v2 setIconEmphasizedSymbolFont:v8];

    [(_UIContextMenuPlatformMetrics *)v2 setItemBackgroundColorProvider:&__block_literal_global_376];
    -[_UIContextMenuPlatformMetrics setHeaderPadding:](v2, "setHeaderPadding:", 16.0, 24.0, 14.0, 24.0);
    [(_UIContextMenuPlatformMetrics *)v2 headerPadding];
    -[_UIContextMenuPlatformMetrics setMenuTitlePadding:](v2, "setMenuTitlePadding:");
    v9 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption3"];
    [(_UIContextMenuPlatformMetrics *)v2 setHeaderFont:v9];

    [(_UIContextMenuPlatformMetrics *)v2 setMenuMaximumHeight:400.0];
    [(_UIContextMenuPlatformMetrics *)v2 setPreviewPlatterCornerRadius:24.0];
  }
  return v2;
}

@end