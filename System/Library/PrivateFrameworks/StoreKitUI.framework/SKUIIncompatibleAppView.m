@interface SKUIIncompatibleAppView
- (NSString)message;
- (NSString)title;
- (UIImage)iconImage;
- (id)addButtonWithTitle:(id)a3;
- (void)layoutSubviews;
- (void)removeButtonTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)setBackgroundColor:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUIIncompatibleAppView

- (id)addButtonWithTitle:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIncompatibleAppView addButtonWithTitle:]();
  }
  if (!self->_buttons)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    buttons = self->_buttons;
    self->_buttons = v5;
  }
  v7 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  [v7 setTitle:v4 forState:0];

  v8 = [v7 titleLabel];
  v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0];
  [v8 setFont:v9];

  [v7 sizeToFit];
  [(SKUIIncompatibleAppView *)self addSubview:v7];
  [(NSMutableArray *)self->_buttons addObject:v7];

  return v7;
}

- (UIImage)iconImage
{
  return [(UIImageView *)self->_iconView image];
}

- (NSString)message
{
  return [(UILabel *)self->_messageLabel text];
}

- (void)removeButtonTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v9 = self->_buttons;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v13++), "removeTarget:action:forControlEvents:", v8, a4, a5, (void)v14);
      }
      while (v11 != v13);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)setIconImage:(id)a3
{
  id v4 = a3;
  iconView = self->_iconView;
  id v11 = v4;
  if (v4)
  {
    if (!iconView)
    {
      v6 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      v7 = self->_iconView;
      self->_iconView = v6;

      id v8 = self->_iconView;
      v9 = [(SKUIIncompatibleAppView *)self backgroundColor];
      [(UIImageView *)v8 setBackgroundColor:v9];

      [(SKUIIncompatibleAppView *)self addSubview:self->_iconView];
      iconView = self->_iconView;
    }
    [(UIImageView *)iconView setImage:v11];
    [(UIImageView *)self->_iconView sizeToFit];
    [(SKUIIncompatibleAppView *)self setNeedsLayout];
  }
  else
  {
    [(UIImageView *)iconView removeFromSuperview];
    uint64_t v10 = self->_iconView;
    self->_iconView = 0;
  }
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  messageLabel = self->_messageLabel;
  id v15 = v4;
  if (v4)
  {
    if (!messageLabel)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v7 = self->_messageLabel;
      self->_messageLabel = v6;

      id v8 = self->_messageLabel;
      v9 = [(SKUIIncompatibleAppView *)self backgroundColor];
      [(UILabel *)v8 setBackgroundColor:v9];

      uint64_t v10 = self->_messageLabel;
      id v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
      [(UILabel *)v10 setFont:v11];

      [(UILabel *)self->_messageLabel setNumberOfLines:0];
      [(UILabel *)self->_messageLabel setTextAlignment:1];
      uint64_t v12 = self->_messageLabel;
      uint64_t v13 = [MEMORY[0x1E4FB1618] blackColor];
      [(UILabel *)v12 setTextColor:v13];

      [(SKUIIncompatibleAppView *)self addSubview:self->_messageLabel];
      messageLabel = self->_messageLabel;
    }
    [(UILabel *)messageLabel setText:v15];
    [(SKUIIncompatibleAppView *)self setNeedsLayout];
  }
  else
  {
    [(UILabel *)messageLabel removeFromSuperview];
    long long v14 = self->_messageLabel;
    self->_messageLabel = 0;
  }
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  titleLabel = self->_titleLabel;
  id v15 = v4;
  if (v4)
  {
    if (!titleLabel)
    {
      v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v7 = self->_titleLabel;
      self->_titleLabel = v6;

      id v8 = self->_titleLabel;
      v9 = [(SKUIIncompatibleAppView *)self backgroundColor];
      [(UILabel *)v8 setBackgroundColor:v9];

      uint64_t v10 = self->_titleLabel;
      id v11 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
      [(UILabel *)v10 setFont:v11];

      [(UILabel *)self->_titleLabel setNumberOfLines:0];
      [(UILabel *)self->_titleLabel setTextAlignment:1];
      uint64_t v12 = self->_titleLabel;
      uint64_t v13 = [MEMORY[0x1E4FB1618] blackColor];
      [(UILabel *)v12 setTextColor:v13];

      [(SKUIIncompatibleAppView *)self addSubview:self->_titleLabel];
      titleLabel = self->_titleLabel;
    }
    [(UILabel *)titleLabel setText:v15];
    [(SKUIIncompatibleAppView *)self setNeedsLayout];
  }
  else
  {
    [(UILabel *)titleLabel removeFromSuperview];
    long long v14 = self->_titleLabel;
    self->_titleLabel = 0;
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)layoutSubviews
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  [(SKUIIncompatibleAppView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = v3 + -30.0;
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  messageLabel = self->_messageLabel;
  double v10 = v8;
  if (messageLabel)
  {
    -[UILabel sizeThatFits:](messageLabel, "sizeThatFits:", v3 + -30.0, 1.79769313e308);
    double v10 = v11;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    -[UILabel sizeThatFits:](titleLabel, "sizeThatFits:", v7, 1.79769313e308);
    double v8 = v13;
  }
  long long v14 = (double *)&v50;
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  iconView = self->_iconView;
  if (iconView)
  {
    [(UIImageView *)iconView bounds];
    long long v14 = v51;
    double v17 = v16 + 20.0 + v51[3];
    v51[3] = v17;
  }
  else
  {
    double v17 = 0.0;
  }
  if (v8 > 0.00000011920929)
  {
    double v17 = v8 + 9.0 + v17;
    v14[3] = v17;
  }
  if (v10 > 0.00000011920929) {
    v14[3] = v10 + 19.0 + v17;
  }
  buttons = self->_buttons;
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __41__SKUIIncompatibleAppView_layoutSubviews__block_invoke;
  v49[3] = &unk_1E642AAF0;
  v49[4] = &v50;
  [(NSMutableArray *)buttons enumerateObjectsUsingBlock:v49];
  float v19 = (v6 - v51[3]) * 0.5;
  double v20 = floorf(v19);
  v21 = self->_iconView;
  if (v21)
  {
    [(UIImageView *)v21 frame];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    float v26 = (v4 - v22) * 0.5;
    CGFloat v27 = floorf(v26);
    -[UIImageView setFrame:](self->_iconView, "setFrame:", v27, v20);
    v56.origin.x = v27;
    v56.origin.y = v20;
    v56.size.width = v23;
    v56.size.height = v25;
    double v20 = CGRectGetMaxY(v56) + 20.0;
  }
  v28 = self->_titleLabel;
  if (v28)
  {
    [(UILabel *)v28 frame];
    float v29 = v8;
    CGFloat v30 = ceilf(v29);
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", 15.0, v20, v7, v30);
    v57.origin.x = 15.0;
    v57.origin.y = v20;
    v57.size.width = v7;
    v57.size.height = v30;
    double v20 = CGRectGetMaxY(v57) + 9.0;
  }
  v31 = self->_messageLabel;
  if (v31)
  {
    [(UILabel *)v31 frame];
    float v32 = v10;
    CGFloat v33 = ceilf(v32);
    -[UILabel setFrame:](self->_messageLabel, "setFrame:", 15.0, v20, v7, v33);
    v58.origin.x = 15.0;
    v58.origin.y = v20;
    v58.size.width = v7;
    v58.size.height = v33;
    double v20 = CGRectGetMaxY(v58) + 19.0;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v34 = self->_buttons;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v35)
  {
    uint64_t v36 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v46 != v36) {
          objc_enumerationMutation(v34);
        }
        v38 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        objc_msgSend(v38, "frame", (void)v45);
        CGFloat v40 = v39;
        CGFloat v42 = v41;
        float v43 = (v4 - v39) * 0.5;
        CGFloat v44 = floorf(v43);
        objc_msgSend(v38, "setFrame:", v44, v20);
        v59.origin.x = v44;
        v59.origin.y = v20;
        v59.size.width = v40;
        v59.size.height = v42;
        double v20 = CGRectGetMaxY(v59) + 13.0;
      }
      uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v45 objects:v54 count:16];
    }
    while (v35);
  }

  _Block_object_dispose(&v50, 8);
}

double __41__SKUIIncompatibleAppView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3) {
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
  }
                                                                            + 24)
                                                                + 13.0;
  [a2 bounds];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

- (void)setBackgroundColor:(id)a3
{
  buttons = self->_buttons;
  id v6 = a3;
  [(NSMutableArray *)buttons makeObjectsPerformSelector:a2 withObject:v6];
  [(UIImageView *)self->_iconView setBackgroundColor:v6];
  [(UILabel *)self->_messageLabel setBackgroundColor:v6];
  [(UILabel *)self->_titleLabel setBackgroundColor:v6];
  v7.receiver = self;
  v7.super_class = (Class)SKUIIncompatibleAppView;
  [(SKUIIncompatibleAppView *)&v7 setBackgroundColor:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);

  objc_storeStrong((id *)&self->_buttons, 0);
}

- (void)addButtonWithTitle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIIncompatibleAppView addButtonWithTitle:]";
}

@end