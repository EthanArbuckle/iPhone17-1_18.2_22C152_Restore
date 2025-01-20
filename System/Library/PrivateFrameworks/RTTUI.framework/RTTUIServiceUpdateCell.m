@interface RTTUIServiceUpdateCell
+ (double)heightForWidth:(double)a3 delegate:(id)a4 serviceUpdate:(id)a5;
- (BOOL)isAccessibilityElement;
- (RTTUIServiceCellDelegate)delegate;
- (RTTUIServiceUpdateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 serviceUpdate:(id)a5;
- (double)preferredHeightForWidth:(double)a3;
- (id)accessibilityLabel;
- (id)serviceMessage;
- (id)serviceTitle;
- (void)adjustTextViewSize;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
@end

@implementation RTTUIServiceUpdateCell

+ (double)heightForWidth:(double)a3 delegate:(id)a4 serviceUpdate:(id)a5
{
  id v7 = a5;
  uint64_t v8 = heightForWidth_delegate_serviceUpdate__onceToken;
  id v9 = a4;
  if (v8 != -1) {
    dispatch_once(&heightForWidth_delegate_serviceUpdate__onceToken, &__block_literal_global_494);
  }
  v10 = *(void **)(heightForWidth_delegate_serviceUpdate__SizeCell + 1032);
  *(void *)(heightForWidth_delegate_serviceUpdate__SizeCell + 1032) = v7;
  id v11 = v7;

  [(id)heightForWidth_delegate_serviceUpdate__SizeCell setDelegate:v9];
  [(id)heightForWidth_delegate_serviceUpdate__SizeCell updateLayout];
  [(id)heightForWidth_delegate_serviceUpdate__SizeCell preferredHeightForWidth:a3];
  double v13 = v12;

  return v13;
}

uint64_t __64__RTTUIServiceUpdateCell_heightForWidth_delegate_serviceUpdate___block_invoke()
{
  v0 = objc_alloc_init(RTTUIServiceUpdateCell);
  v1 = (void *)heightForWidth_delegate_serviceUpdate__SizeCell;
  heightForWidth_delegate_serviceUpdate__SizeCell = (uint64_t)v0;

  v2 = (void *)heightForWidth_delegate_serviceUpdate__SizeCell;
  return [v2 updateLayout];
}

- (RTTUIServiceUpdateCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 serviceUpdate:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)RTTUIServiceUpdateCell;
  v10 = [(RTTUIServiceUpdateCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  id v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_serviceUpdate, a5);
  }

  return v11;
}

- (double)preferredHeightForWidth:(double)a3
{
  -[UITextView sizeThatFits:](self->_titleView, "sizeThatFits:", a3, 1.79769313e308);
  double v6 = v5;
  -[UITextView sizeThatFits:](self->_subtitleView, "sizeThatFits:", a3, 1.79769313e308);
  return fmax(v6 + v7, 20.0);
}

- (void)adjustTextViewSize
{
  [(RTTUIServiceUpdateCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v47 = *(double *)(MEMORY[0x263F00148] + 8);
  CGFloat v48 = *MEMORY[0x263F00148];
  id v11 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D298]];
  [(UITextView *)self->_titleView setFont:v11];

  double v12 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [(UITextView *)self->_subtitleView setFont:v12];

  titleView = self->_titleView;
  v14 = [(RTTUIServiceUpdateCell *)self window];
  [v14 frame];
  -[UITextView sizeThatFits:](titleView, "sizeThatFits:", CGRectGetWidth(v50), 1.79769313e308);
  double v16 = v15;

  double v17 = fmax(v16, 20.0);
  CGFloat v44 = v4;
  CGFloat v45 = v17;
  v51.origin.x = v4;
  v51.origin.y = v6;
  v51.size.width = v8;
  v51.size.height = v10;
  double Width = CGRectGetWidth(v51);
  v19 = self->_titleView;
  v20 = [(RTTUIServiceUpdateCell *)self window];
  [v20 frame];
  -[UITextView sizeThatFits:](v19, "sizeThatFits:", CGRectGetWidth(v52), v17);
  double v22 = v21;

  double v23 = fmax(v22, 130.0);
  if (Width >= v23) {
    CGFloat v24 = v23;
  }
  else {
    CGFloat v24 = Width;
  }
  v53.origin.x = v4;
  v53.origin.y = v6;
  v53.size.width = v8;
  v53.size.height = v10;
  double v25 = CGRectGetWidth(v53);
  v54.origin.x = v48;
  v54.origin.y = v47;
  v54.size.width = v24;
  v54.size.height = v17;
  double v46 = (v25 - CGRectGetWidth(v54)) * 0.5;
  -[UITextView setFrame:](self->_titleView, "setFrame:");
  subtitleView = self->_subtitleView;
  v27 = [(RTTUIServiceUpdateCell *)self window];
  [v27 frame];
  -[UITextView sizeThatFits:](subtitleView, "sizeThatFits:", CGRectGetWidth(v55), 1.79769313e308);
  double v29 = v28;

  double v30 = fmax(v29, 20.0);
  v56.origin.x = v4;
  v56.origin.y = v6;
  CGFloat v31 = v6;
  v56.size.width = v8;
  CGFloat v32 = v8;
  v56.size.height = v10;
  CGFloat v33 = v10;
  double v34 = CGRectGetWidth(v56);
  v35 = self->_subtitleView;
  v36 = [(RTTUIServiceUpdateCell *)self window];
  [v36 frame];
  -[UITextView sizeThatFits:](v35, "sizeThatFits:", CGRectGetWidth(v57), v30);
  double v38 = v37;

  double v39 = fmax(v38, 130.0);
  if (v34 >= v39) {
    double v34 = v39;
  }
  v58.origin.x = v44;
  v58.origin.y = v31;
  v58.size.width = v32;
  v58.size.height = v33;
  double v40 = CGRectGetWidth(v58);
  v59.origin.x = v48;
  v59.origin.y = v47;
  v59.size.width = v34;
  v59.size.height = v30;
  double v41 = (v40 - CGRectGetWidth(v59)) * 0.5;
  v60.origin.x = v46;
  v60.origin.y = v47;
  v60.size.width = v24;
  v60.size.height = v45;
  double MaxY = CGRectGetMaxY(v60);
  -[UITextView setFrame:](self->_subtitleView, "setFrame:", v41, MaxY, v34, v30);
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __44__RTTUIServiceUpdateCell_adjustTextViewSize__block_invoke;
  v49[3] = &unk_264638A68;
  v49[4] = self;
  *(double *)&v49[5] = v46;
  *(CGFloat *)&v49[6] = v47;
  *(CGFloat *)&v49[7] = v24;
  *(CGFloat *)&v49[8] = v45;
  *(double *)&v49[9] = v41;
  *(double *)&v49[10] = MaxY;
  *(double *)&v49[11] = v34;
  *(double *)&v49[12] = v30;
  v43 = (void (**)(void))MEMORY[0x223CA2070](v49);
  v43[2]();
}

void __44__RTTUIServiceUpdateCell_adjustTextViewSize__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundView];
  CGRect v4 = CGRectUnion(*(CGRect *)(a1 + 40), *(CGRect *)(a1 + 72));
  objc_msgSend(v2, "setFrame:", v4.origin.x, v4.origin.y, v4.size.width, v4.size.height);
}

- (void)layoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)RTTUIServiceUpdateCell;
  [(RTTUIServiceUpdateCell *)&v58 layoutSubviews];
  double v3 = [(RTTUIServiceUpdateCell *)self delegate];
  int v4 = [v3 isCurrentCallConnected];

  if (!self->_titleView)
  {
    double v5 = [RTTUIStaticTextView alloc];
    CGFloat v6 = [(RTTUIServiceUpdateCell *)self textLabel];
    [v6 frame];
    double v7 = -[RTTUIStaticTextView initWithFrame:textContainer:](v5, "initWithFrame:textContainer:", 0);
    titleView = self->_titleView;
    self->_titleView = v7;

    double v9 = self->_titleView;
    CGFloat v10 = [MEMORY[0x263F1C550] clearColor];
    [(UITextView *)v9 setBackgroundColor:v10];

    id v11 = self->_titleView;
    double v12 = [MEMORY[0x263F1C658] boldSystemFontOfSize:20.0];
    [(UITextView *)v11 setFont:v12];

    objc_super v13 = [(RTTUIServiceUpdateCell *)self contentView];
    [v13 addSubview:self->_titleView];

    v14 = [(UITextView *)self->_titleView textContainer];
    [v14 setLineBreakMode:0];

    double v15 = [(UITextView *)self->_titleView textContainer];
    [v15 setMaximumNumberOfLines:0];

    [(UITextView *)self->_titleView setTextAlignment:1];
    [(UITextView *)self->_titleView setEditable:0];
    [(UITextView *)self->_titleView setSelectable:1];
    [(UITextView *)self->_titleView setScrollEnabled:0];
  }
  if (!self->_subtitleView)
  {
    double v16 = [RTTUIStaticTextView alloc];
    double v17 = [(RTTUIServiceUpdateCell *)self textLabel];
    [v17 frame];
    v18 = -[RTTUIStaticTextView initWithFrame:textContainer:](v16, "initWithFrame:textContainer:", 0);
    subtitleView = self->_subtitleView;
    self->_subtitleView = v18;

    v20 = self->_subtitleView;
    double v21 = [MEMORY[0x263F1C550] clearColor];
    [(UITextView *)v20 setBackgroundColor:v21];

    double v22 = self->_subtitleView;
    double v23 = [MEMORY[0x263F1C658] systemFontOfSize:20.0];
    [(UITextView *)v22 setFont:v23];

    CGFloat v24 = [(RTTUIServiceUpdateCell *)self contentView];
    [v24 addSubview:self->_subtitleView];

    double v25 = [(UITextView *)self->_subtitleView textContainer];
    [v25 setLineBreakMode:0];

    v26 = [(UITextView *)self->_subtitleView textContainer];
    [v26 setMaximumNumberOfLines:0];

    [(UITextView *)self->_subtitleView setTextAlignment:1];
    [(UITextView *)self->_subtitleView setEditable:0];
    [(UITextView *)self->_subtitleView setSelectable:1];
    [(UITextView *)self->_subtitleView setScrollEnabled:0];
  }
  v27 = [MEMORY[0x263F1C550] clearColor];
  [(RTTUIServiceUpdateCell *)self setBackgroundColor:v27];

  double v28 = [(RTTServiceUpdate *)self->_serviceUpdate serviceUpdateType];
  int v29 = [v28 isEqualToString:*MEMORY[0x263F62B18]];

  if (!v29)
  {
    double v30 = [(RTTServiceUpdate *)self->_serviceUpdate serviceUpdateType];
    int v31 = [v30 isEqualToString:*MEMORY[0x263F62B48]];

    if (!v31)
    {
      v36 = [(RTTServiceUpdate *)self->_serviceUpdate serviceUpdateType];
      int v37 = [v36 isEqualToString:*MEMORY[0x263F62B28]];

      if (v37)
      {
        double v38 = self->_titleView;
        double v39 = NSString;
      }
      else
      {
        double v40 = [(RTTServiceUpdate *)self->_serviceUpdate serviceUpdateType];
        int v41 = [v40 isEqualToString:*MEMORY[0x263F62B40]];

        if (!v41)
        {
          CGFloat v45 = [(RTTServiceUpdate *)self->_serviceUpdate serviceUpdateType];
          int v46 = [v45 isEqualToString:*MEMORY[0x263F62B20]];

          if (v46)
          {
            CGFloat v47 = self->_titleView;
          }
          else
          {
            CGFloat v48 = [(RTTServiceUpdate *)self->_serviceUpdate serviceUpdateType];
            v49 = (void *)*MEMORY[0x263F62B38];

            if (v48 == v49)
            {
              CGFloat v47 = self->_titleView;
            }
            else
            {
              CGRect v50 = [(RTTServiceUpdate *)self->_serviceUpdate serviceUpdateType];
              CGRect v51 = (void *)*MEMORY[0x263F62B50];

              if (v50 == v51)
              {
                CGFloat v47 = self->_titleView;
              }
              else
              {
                CGRect v52 = [(RTTServiceUpdate *)self->_serviceUpdate serviceUpdateType];
                CGRect v53 = (void *)*MEMORY[0x263F62B30];

                if (v52 != v53) {
                  goto LABEL_23;
                }
                CGFloat v47 = self->_titleView;
              }
            }
          }
          CGRect v54 = ttyLocString();
          [(UITextView *)v47 setText:v54];

LABEL_22:
          [(UITextView *)self->_subtitleView setText:0];
          goto LABEL_23;
        }
        double v38 = self->_titleView;
        double v39 = NSString;
      }
      v42 = ttyLocString();
      v43 = [(RTTServiceUpdate *)self->_serviceUpdate optionValueForKey:*MEMORY[0x263F62B10]];
      CGFloat v44 = objc_msgSend(v39, "stringWithFormat:", v42, v43);
      [(UITextView *)v38 setText:v44];

      goto LABEL_22;
    }
  }
  CGFloat v32 = self->_titleView;
  CGFloat v33 = ttyLocString();
  [(UITextView *)v32 setText:v33];

  double v34 = self->_subtitleView;
  v35 = ttyLocString();
  [(UITextView *)v34 setText:v35];

LABEL_23:
  int IsRTTNotificationContentExtension = Soft_AXProcessIsRTTNotificationContentExtension();
  if (!v4 || IsRTTNotificationContentExtension)
  {
    uint64_t v56 = [MEMORY[0x263F1C550] labelColor];
  }
  else
  {
    uint64_t v56 = [MEMORY[0x263F1C550] whiteColor];
  }
  CGRect v57 = (void *)v56;
  [(UITextView *)self->_titleView setTextColor:v56];
  [(UITextView *)self->_subtitleView setTextColor:v57];
  [(RTTUIServiceUpdateCell *)self adjustTextViewSize];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return [(UITextView *)self->_subtitleView text];
}

- (id)serviceTitle
{
  return [(UITextView *)self->_titleView text];
}

- (id)serviceMessage
{
  return [(UITextView *)self->_subtitleView text];
}

- (RTTUIServiceCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RTTUIServiceCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceUpdate, 0);
  objc_storeStrong((id *)&self->_subtitleView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end