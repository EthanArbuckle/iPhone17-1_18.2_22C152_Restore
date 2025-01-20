@interface UITableViewIndexVisualStyle_CarPlay
- (UIFont)font;
- (UITableViewIndex)tableViewIndex;
- (UITableViewIndexVisualStyle_CarPlay)initWithTableViewIndex:(id)a3;
- (double)_lineSpacingForCurrentIdiom;
- (double)indexWidth;
- (double)minLineSpacing;
- (void)setFont:(id)a3;
- (void)setTableViewIndex:(id)a3;
@end

@implementation UITableViewIndexVisualStyle_CarPlay

- (UITableViewIndexVisualStyle_CarPlay)initWithTableViewIndex:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UITableViewIndexVisualStyle_CarPlay;
  id v3 = a3;
  v4 = [(UITableViewIndexVisualStyle_CarPlay *)&v7 init];
  -[UITableViewIndexVisualStyle_CarPlay setTableViewIndex:](v4, "setTableViewIndex:", v3, v7.receiver, v7.super_class);

  v5 = [off_1E52D39B8 boldSystemFontOfSize:11.0];
  [(UITableViewIndexVisualStyle_CarPlay *)v4 setFont:v5];

  return v4;
}

- (double)indexWidth
{
  v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double result = 15.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return 30.0;
  }
  return result;
}

- (double)_lineSpacingForCurrentIdiom
{
  v2 = [(UITableViewIndexVisualStyle_CarPlay *)self tableViewIndex];
  uint64_t v3 = [v2 traitCollection];
  if (([v3 userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v4 = 16.0;
  }
  else {
    double v4 = 6.0;
  }

  return v4;
}

- (double)minLineSpacing
{
  [(UITableViewIndexVisualStyle_CarPlay *)self _lineSpacingForCurrentIdiom];
  uint64_t v3 = [(UITableViewIndexVisualStyle_CarPlay *)self tableViewIndex];
  UIRoundToViewScale(v3);
  double v5 = v4;

  return v5;
}

- (UITableViewIndex)tableViewIndex
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableViewIndex);
  return (UITableViewIndex *)WeakRetained;
}

- (void)setTableViewIndex:(id)a3
{
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_tableViewIndex);
}

@end