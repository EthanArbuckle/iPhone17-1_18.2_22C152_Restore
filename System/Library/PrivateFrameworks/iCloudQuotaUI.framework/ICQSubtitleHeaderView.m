@interface ICQSubtitleHeaderView
- (ICQSubtitleHeaderView)initWithSpecifier:(id)a3;
- (NSArray)subtitleLabels;
- (UILabel)titleLabel;
- (double)preferredHeightForWidth:(double)a3;
- (id)addSubtitle;
- (id)subtitleAtIndex:(unint64_t)a3;
- (void)layoutSubviews;
- (void)removeSubtitleAtIndex:(unint64_t)a3;
- (void)setSubtitleLabels:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation ICQSubtitleHeaderView

- (ICQSubtitleHeaderView)initWithSpecifier:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)ICQSubtitleHeaderView;
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  v7 = -[ICQSubtitleHeaderView initWithFrame:](&v19, sel_initWithFrame_, a3, *MEMORY[0x263F001A8], v4, v5, v6);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v3, v4, v5, v6);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v8;

    v10 = v7->_titleLabel;
    v11 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
    [(UILabel *)v10 setFont:v11];

    v12 = v7->_titleLabel;
    v13 = [MEMORY[0x263F825C8] darkGrayColor];
    [(UILabel *)v12 setTextColor:v13];

    v14 = v7->_titleLabel;
    v15 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v14 setBackgroundColor:v15];

    [(ICQSubtitleHeaderView *)v7 addSubview:v7->_titleLabel];
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    subtitleLabels = v7->_subtitleLabels;
    v7->_subtitleLabels = v16;
  }
  return v7;
}

- (id)subtitleAtIndex:(unint64_t)a3
{
  if ([(NSMutableArray *)self->_subtitleLabels count] <= a3)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = [(NSMutableArray *)self->_subtitleLabels objectAtIndex:a3];
  }
  return v5;
}

- (id)addSubtitle
{
  id v3 = objc_alloc(MEMORY[0x263F828E0]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v5 = [MEMORY[0x263F81708] systemFontOfSize:14.0];
  [v4 setFont:v5];

  double v6 = [MEMORY[0x263F825C8] grayColor];
  [v4 setTextColor:v6];

  v7 = [MEMORY[0x263F825C8] clearColor];
  [v4 setBackgroundColor:v7];

  [v4 setNumberOfLines:0];
  [v4 setLineBreakMode:0];
  [(NSMutableArray *)self->_subtitleLabels addObject:v4];
  [(ICQSubtitleHeaderView *)self addSubview:v4];
  [(ICQSubtitleHeaderView *)self setNeedsLayout];
  return v4;
}

- (void)removeSubtitleAtIndex:(unint64_t)a3
{
}

- (double)preferredHeightForWidth:(double)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  PSTextViewInsets();
  double v32 = v6;
  [(UILabel *)self->_titleLabel sizeToFit];
  [(UILabel *)self->_titleLabel bounds];
  double v8 = v7;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obj = self->_subtitleLabels;
  uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v13 frame];
        double v15 = v14;
        double v17 = v16;
        v18 = [v13 text];
        objc_super v19 = [v13 font];
        v20 = [(ICQSubtitleHeaderView *)self superview];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        double v22 = 15.0;
        if (isKindOfClass)
        {
          id v3 = [(ICQSubtitleHeaderView *)self superview];
          [v3 _backgroundInset];
          double v24 = v23;
          if (PSIsN56())
          {
            PSTableViewSideInset();
          }
          else
          {
            PreferencesTableViewCellLeftPad();
            double v25 = v26;
          }
          double v22 = v24 + v25 - v32;
        }
        objc_msgSend(v18, "_legacy_sizeWithFont:constrainedToSize:lineBreakMode:", v19, objc_msgSend(v13, "lineBreakMode"), a3 + v22 * -2.0, 1.79769313e308);
        double v28 = v27;
        double v30 = v29;
        if (isKindOfClass) {

        }
        objc_msgSend(v13, "setFrame:", v15, v17, v28, v30);
        double v8 = v8 + v30 + 4.0;
      }
      uint64_t v10 = [(NSMutableArray *)obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v10);
  }

  return v8 + 5.0 + 6.0;
}

- (void)layoutSubviews
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  PSTextViewInsets();
  double v4 = v3;
  double v5 = [(ICQSubtitleHeaderView *)self superview];
  objc_opt_class();
  double v6 = 15.0;
  if (objc_opt_isKindOfClass())
  {
    double v7 = [(ICQSubtitleHeaderView *)self superview];
    [v7 _backgroundInset];
    double v9 = v8;
    if (PSIsN56())
    {
      PSTableViewSideInset();
    }
    else
    {
      PreferencesTableViewCellLeftPad();
      double v10 = v11;
    }
    double v6 = v9 + v10 - v4;
  }
  [(ICQSubtitleHeaderView *)self bounds];
  double v13 = v12;
  [(UILabel *)self->_titleLabel frame];
  double v15 = v14;
  double v17 = v16;
  int v18 = [(ICQSubtitleHeaderView *)self _shouldReverseLayoutDirection];
  double v19 = v13 - v6 - v15;
  if (!v18) {
    double v19 = v6;
  }
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v19, 5.0, v15, v17);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v20 = self->_subtitleLabels;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    double v23 = v17 + 5.0 + 4.0;
    uint64_t v24 = *(void *)v31;
    double v25 = v13 + v6 * -2.0;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v20);
        }
        double v27 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_msgSend(v27, "frame", (void)v30);
        double v29 = v28;
        objc_msgSend(v27, "setFrame:", v6, v23, v25);
        double v23 = v23 + v29 + 4.0;
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v22);
  }
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSArray)subtitleLabels
{
  return &self->_subtitleLabels->super;
}

- (void)setSubtitleLabels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabels, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end