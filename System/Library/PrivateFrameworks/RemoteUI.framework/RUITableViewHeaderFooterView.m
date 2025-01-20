@interface RUITableViewHeaderFooterView
- (BOOL)_useLegacyLayout;
- (CGSize)sizeThatFits:(CGSize)a3;
- (RUIHeader)headerView;
- (RemoteUITableFooter)footerView;
- (UIEdgeInsets)insetsForHeaderFooter;
- (void)_embedContentView:(id)a3;
- (void)embedFooterView:(id)a3;
- (void)embedHeaderView:(id)a3;
- (void)layoutSubviews;
- (void)removeEmbeddedView;
- (void)setFooterView:(id)a3;
- (void)setHeaderView:(id)a3;
@end

@implementation RUITableViewHeaderFooterView

- (BOOL)_useLegacyLayout
{
  v2 = [(RUITableViewHeaderFooterView *)self tableView];
  BOOL v3 = [v2 style] != 2;

  return v3;
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)RUITableViewHeaderFooterView;
  [(RUITableViewHeaderFooterView *)&v46 layoutSubviews];
  BOOL v3 = [(RUITableViewHeaderFooterView *)self headerView];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(RUITableViewHeaderFooterView *)self footerView];
  }
  v6 = v5;

  [v6 bounds];
  if ([(RUITableViewHeaderFooterView *)self _useLegacyLayout])
  {
    v7 = [(RUITableViewHeaderFooterView *)self contentView];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(RUITableViewHeaderFooterView *)self insetsForHeaderFooter];
    double v17 = v9 + v16;
    double v19 = v11 + v18;
    double v21 = v13 - (v16 + v20);
    double v23 = v15 - (v18 + v22);
    v24 = [(RUITableViewHeaderFooterView *)self contentView];
    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

    v25 = [(RUITableViewHeaderFooterView *)self contentView];
    [v25 bounds];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
  }
  else
  {
    double v34 = *MEMORY[0x263F834E8];
    double v35 = *(double *)(MEMORY[0x263F834E8] + 16);
    v36 = [(RUITableViewHeaderFooterView *)self contentView];
    [v36 layoutMargins];
    double v38 = v37;

    v39 = [(RUITableViewHeaderFooterView *)self contentView];
    [v39 layoutMargins];
    double v41 = v40;

    v25 = [(RUITableViewHeaderFooterView *)self contentView];
    [v25 bounds];
    double v27 = v38 + v42;
    double v29 = v34 + v43;
    double v31 = v44 - (v38 + v41);
    double v33 = v45 - (v34 + v35);
  }

  objc_msgSend(v6, "setFrame:", v27, v29, v31, v33);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(RUITableViewHeaderFooterView *)self headerView];
  if (v6)
  {

    goto LABEL_4;
  }
  v7 = [(RUITableViewHeaderFooterView *)self footerView];

  if (v7)
  {
LABEL_4:
    if ([(RUITableViewHeaderFooterView *)self _useLegacyLayout])
    {
      [(RUITableViewHeaderFooterView *)self insetsForHeaderFooter];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
    }
    else
    {
      double v10 = *MEMORY[0x263F834E8];
      double v15 = *(double *)(MEMORY[0x263F834E8] + 8);
      double v14 = *(double *)(MEMORY[0x263F834E8] + 16);
      double v16 = *(double *)(MEMORY[0x263F834E8] + 24);
      [(RUITableViewHeaderFooterView *)self layoutMargins];
      double v12 = v15 + v17;
      [(RUITableViewHeaderFooterView *)self layoutMargins];
      double v8 = v16 + v18;
    }
    double v19 = width - (v8 + v12);
    double v20 = [(RUITableViewHeaderFooterView *)self headerView];

    if (v20)
    {
      double v21 = [(RUITableViewHeaderFooterView *)self headerView];
      if (objc_opt_respondsToSelector())
      {
        double v22 = [(RUITableViewHeaderFooterView *)self tableView];
        [v21 headerHeightForWidth:v22 inView:v19];
LABEL_18:
        double height = v23;

        goto LABEL_19;
      }
      if (objc_opt_respondsToSelector())
      {
        double v22 = [(RUITableViewHeaderFooterView *)self tableView];
        [v21 headerHeightForWidth:v22 inTableView:v19];
        goto LABEL_18;
      }
    }
    else
    {
      v24 = [(RUITableViewHeaderFooterView *)self footerView];

      if (!v24)
      {
LABEL_20:
        double v25 = v14 + v10 + height;
        goto LABEL_21;
      }
      double v21 = [(RUITableViewHeaderFooterView *)self footerView];
      if (objc_opt_respondsToSelector())
      {
        double v22 = [(RUITableViewHeaderFooterView *)self tableView];
        [v21 footerHeightForWidth:v22 inView:v19];
        goto LABEL_18;
      }
      if (objc_opt_respondsToSelector())
      {
        double v22 = [(RUITableViewHeaderFooterView *)self tableView];
        [v21 footerHeightForWidth:v22 inTableView:v19];
        goto LABEL_18;
      }
    }
LABEL_19:

    goto LABEL_20;
  }
  v28.receiver = self;
  v28.super_class = (Class)RUITableViewHeaderFooterView;
  -[RUITableViewHeaderFooterView sizeThatFits:](&v28, sel_sizeThatFits_, width, height);
  double width = v26;
LABEL_21:
  double v27 = width;
  result.double height = v25;
  result.double width = v27;
  return result;
}

- (void)removeEmbeddedView
{
  BOOL v3 = [(RUITableViewHeaderFooterView *)self headerView];
  [v3 removeFromSuperview];

  v4 = [(RUITableViewHeaderFooterView *)self footerView];
  [v4 removeFromSuperview];

  [(RUITableViewHeaderFooterView *)self setHeaderView:0];
  [(RUITableViewHeaderFooterView *)self setFooterView:0];
}

- (void)embedHeaderView:(id)a3
{
  id v4 = a3;
  [(RUITableViewHeaderFooterView *)self removeEmbeddedView];
  [(RUITableViewHeaderFooterView *)self setHeaderView:v4];
  [(RUITableViewHeaderFooterView *)self _embedContentView:v4];
}

- (void)embedFooterView:(id)a3
{
  id v4 = a3;
  [(RUITableViewHeaderFooterView *)self removeEmbeddedView];
  [(RUITableViewHeaderFooterView *)self setFooterView:v4];
  [(RUITableViewHeaderFooterView *)self _embedContentView:v4];
}

- (void)_embedContentView:(id)a3
{
  id v4 = a3;
  id v5 = [(RUITableViewHeaderFooterView *)self contentView];
  [v5 addSubview:v4];

  [(RUITableViewHeaderFooterView *)self setNeedsLayout];
}

- (UIEdgeInsets)insetsForHeaderFooter
{
  BOOL v3 = [(RUITableViewHeaderFooterView *)self tableView];
  [v3 separatorInset];
  uint64_t v5 = v4;
  double v7 = v6;
  uint64_t v9 = v8;
  double v11 = v10;

  double v12 = [(RUITableViewHeaderFooterView *)self tableView];
  uint64_t v13 = [v12 style];

  if (v13 == 2)
  {
    if (insetsForHeaderFooter_onceToken != -1) {
      dispatch_once(&insetsForHeaderFooter_onceToken, &__block_literal_global_6);
    }
    uint64_t v5 = insetsForHeaderFooter__insets_0;
    double v14 = *(double *)&insetsForHeaderFooter__insets_1;
    uint64_t v9 = insetsForHeaderFooter__insets_2;
    double v15 = *(double *)&insetsForHeaderFooter__insets_3;
  }
  else
  {
    double v15 = v7 + v11;
    double v14 = v7 + v11;
  }
  double v16 = *(double *)&v5;
  double v17 = *(double *)&v9;
  result.right = v15;
  result.bottom = v17;
  result.left = v14;
  result.top = v16;
  return result;
}

void __53__RUITableViewHeaderFooterView_insetsForHeaderFooter__block_invoke()
{
  id v4 = (id)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:0 reuseIdentifier:0];
  [v4 separatorInset];
  insetsForHeaderFooter__insets_0 = v0;
  insetsForHeaderFooter__insets_1 = v1;
  insetsForHeaderFooter__insets_2 = v2;
  insetsForHeaderFooter__insets_3 = v3;
}

- (RUIHeader)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (RemoteUITableFooter)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end