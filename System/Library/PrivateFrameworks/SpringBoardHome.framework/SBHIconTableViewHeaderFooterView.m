@interface SBHIconTableViewHeaderFooterView
- (NSDirectionalEdgeInsets)titleLayoutMargins;
- (NSString)title;
- (SBHIconTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3;
- (void)prepareForReuse;
- (void)setTitle:(id)a3;
- (void)setTitleLayoutMargins:(NSDirectionalEdgeInsets)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation SBHIconTableViewHeaderFooterView

- (SBHIconTableViewHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBHIconTableViewHeaderFooterView;
  v3 = [(SBHIconTableViewHeaderFooterView *)&v6 initWithReuseIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(SBHIconTableViewHeaderFooterView *)v3 setBackgroundView:v4];
  }
  return v3;
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v22 = a3;
  id v4 = [(SBHIconTableViewHeaderFooterView *)self defaultContentConfiguration];
  v5 = [v4 updatedConfigurationForState:v22];

  objc_super v6 = [(SBHIconTableViewHeaderFooterView *)self tableView];
  v7 = [v6 sectionIndexColor];

  v8 = [(SBHIconTableViewHeaderFooterView *)self title];
  if ([v8 isEqualToString:*MEMORY[0x1E4FB2F38]])
  {
    v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"appclip"];
    [v5 setImage:v9];

    v10 = [v5 imageProperties];
    [v10 setTintColor:v7];
  }
  else
  {
    v11 = [v22 traitCollection];
    v12 = (void *)MEMORY[0x1E4FB1E20];
    v13 = [v11 preferredContentSizeCategory];
    v14 = SBHContentSizeCategoryClip(v13, (void *)*MEMORY[0x1E4FB27E8], (void *)*MEMORY[0x1E4FB2780]);
    v10 = [v12 traitCollectionWithPreferredContentSizeCategory:v14];

    v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908] compatibleWithTraitCollection:v10];
    [v5 setText:v8];
    v16 = [v5 textProperties];
    [v16 setFont:v15];

    v17 = [v5 textProperties];
    [v17 setColor:v7];
  }
  [(SBHIconTableViewHeaderFooterView *)self titleLayoutMargins];
  if (v21 != *(double *)(MEMORY[0x1E4FB12A8] + 8)
    || v18 != *MEMORY[0x1E4FB12A8]
    || v20 != *(double *)(MEMORY[0x1E4FB12A8] + 24)
    || v19 != *(double *)(MEMORY[0x1E4FB12A8] + 16))
  {
    objc_msgSend(v5, "setDirectionalLayoutMargins:");
  }
  [(SBHIconTableViewHeaderFooterView *)self setContentConfiguration:v5];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SBHIconTableViewHeaderFooterView;
  [(SBHIconTableViewHeaderFooterView *)&v3 prepareForReuse];
  [(SBHIconTableViewHeaderFooterView *)self setTitle:0];
  -[SBHIconTableViewHeaderFooterView setTitleLayoutMargins:](self, "setTitleLayoutMargins:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    [(SBHIconTableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
  }
}

- (void)setTitleLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  if (self->_titleLayoutMargins.leading != a3.leading
    || self->_titleLayoutMargins.top != a3.top
    || self->_titleLayoutMargins.trailing != a3.trailing
    || self->_titleLayoutMargins.bottom != a3.bottom)
  {
    self->_titleLayoutMargins = a3;
    [(SBHIconTableViewHeaderFooterView *)self setNeedsUpdateConfiguration];
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSDirectionalEdgeInsets)titleLayoutMargins
{
  double top = self->_titleLayoutMargins.top;
  double leading = self->_titleLayoutMargins.leading;
  double bottom = self->_titleLayoutMargins.bottom;
  double trailing = self->_titleLayoutMargins.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
}

@end