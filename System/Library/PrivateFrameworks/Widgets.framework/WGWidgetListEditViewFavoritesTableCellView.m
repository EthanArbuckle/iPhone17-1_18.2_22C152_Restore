@interface WGWidgetListEditViewFavoritesTableCellView
- (WGWidgetListEditViewFavoritesTableCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation WGWidgetListEditViewFavoritesTableCellView

- (WGWidgetListEditViewFavoritesTableCellView)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v30[2] = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)WGWidgetListEditViewFavoritesTableCellView;
  v4 = [(WGWidgetListEditViewFavoritesTableCellView *)&v29 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(WGWidgetListEditViewFavoritesTableCellView *)v4 contentView];
    v7 = [MEMORY[0x263F1C6B0] systemImageNamed:@"plus.circle.fill"];
    v8 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:v7];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [MEMORY[0x263F1C550] colorWithRed:0.784313725 green:0.780392157 blue:0.8 alpha:1.0];
    [v8 setTintColor:v9];

    id v10 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    int v11 = _os_feature_enabled_impl();
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = v12;
    if (v11) {
      v14 = @"WIDGETS_EDIT_DRAG_TO_PIN_LEGACY";
    }
    else {
      v14 = @"WIDGETS_EDIT_DRAG_TO_PIN";
    }
    v15 = [v12 localizedStringForKey:v14 value:&stru_26D5C79B8 table:@"Widgets"];
    [v10 setText:v15];

    v16 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [v10 setFont:v16];

    v17 = [MEMORY[0x263F1C550] colorWithWhite:0.596078431 alpha:1.0];
    [v10 setTextColor:v17];

    id v18 = objc_alloc(MEMORY[0x263F1C9B8]);
    v30[0] = v8;
    v30[1] = v10;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
    v20 = (void *)[v18 initWithArrangedSubviews:v19];

    [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20 setAxis:0];
    [v20 setAlignment:2];
    [v20 setSpacing:8.0];
    [v6 addSubview:v20];
    id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
    v22 = [v20 centerXAnchor];
    v23 = [v6 centerXAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v21 addObject:v24];

    v25 = [v20 centerYAnchor];
    v26 = [v6 centerYAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    [v21 addObject:v27];

    [MEMORY[0x263F08938] activateConstraints:v21];
  }
  return v5;
}

@end