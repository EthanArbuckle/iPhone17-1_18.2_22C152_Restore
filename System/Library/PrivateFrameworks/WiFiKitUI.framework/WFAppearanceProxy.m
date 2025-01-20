@interface WFAppearanceProxy
+ (id)defaultAppearanceProxy;
+ (id)setupAppearanceProxy;
- (UIColor)tableViewCellBackgroundColor;
- (UIFont)cellTextLabelFont;
- (int64_t)tableViewStyle;
- (void)apply;
- (void)setCellTextLabelFont:(id)a3;
- (void)setTableViewCellBackgroundColor:(id)a3;
- (void)setTableViewStyle:(int64_t)a3;
@end

@implementation WFAppearanceProxy

+ (id)setupAppearanceProxy
{
  v2 = objc_alloc_init(WFAppearanceProxy);
  v3 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [(WFAppearanceProxy *)v2 setTableViewCellBackgroundColor:v3];

  v4 = (void *)MEMORY[0x263F81708];
  v5 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  [v5 pointSize];
  v6 = objc_msgSend(v4, "systemFontOfSize:");
  [(WFAppearanceProxy *)v2 setCellTextLabelFont:v6];

  [(WFAppearanceProxy *)v2 setTableViewStyle:2];
  return v2;
}

+ (id)defaultAppearanceProxy
{
  v2 = objc_alloc_init(WFAppearanceProxy);
  if (WFShouldUseInsetTableView()) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [(WFAppearanceProxy *)v2 setTableViewStyle:v3];
  return v2;
}

- (void)apply
{
  uint64_t v3 = [(WFAppearanceProxy *)self tableViewCellBackgroundColor];

  if (v3)
  {
    id v5 = [MEMORY[0x263F82C80] appearance];
    v4 = [(WFAppearanceProxy *)self tableViewCellBackgroundColor];
    [v5 setBackgroundColor:v4];
  }
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (UIFont)cellTextLabelFont
{
  return self->_cellTextLabelFont;
}

- (void)setCellTextLabelFont:(id)a3
{
  self->_cellTextLabelFont = (UIFont *)a3;
}

- (UIColor)tableViewCellBackgroundColor
{
  return self->_tableViewCellBackgroundColor;
}

- (void)setTableViewCellBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end