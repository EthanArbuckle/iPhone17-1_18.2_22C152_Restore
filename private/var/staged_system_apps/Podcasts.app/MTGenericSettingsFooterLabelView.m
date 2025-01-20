@interface MTGenericSettingsFooterLabelView
+ (double)labelInset;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)topAlignLabel;
- (MTGenericSettingsFooterLabelView)init;
- (UITextView)textView;
- (void)_setupLabel;
- (void)_updateColors;
- (void)layoutSubviews;
- (void)setTextView:(id)a3;
- (void)setTopAlignLabel:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MTGenericSettingsFooterLabelView

- (MTGenericSettingsFooterLabelView)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTGenericSettingsFooterLabelView;
  v2 = [(MTGenericSettingsFooterLabelView *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(MTGenericSettingsFooterLabelView *)v2 _setupLabel];
    v4 = +[UIColor clearColor];
    [(MTGenericSettingsFooterLabelView *)v3 setBackgroundColor:v4];

    v5 = [(MTGenericSettingsFooterLabelView *)v3 textView];
    [v5 setDelegate:v3];
  }
  return v3;
}

+ (double)labelInset
{
  return 12.0;
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)MTGenericSettingsFooterLabelView;
  [(MTGenericSettingsFooterLabelView *)&v32 layoutSubviews];
  [(MTGenericSettingsFooterLabelView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(id)objc_opt_class() labelInset];
  CGFloat v12 = v11;
  v33.origin.double x = v4;
  v33.origin.double y = v6;
  v33.size.double width = v8;
  v33.size.double height = v10;
  CGRect v34 = CGRectInset(v33, v12, 0.0);
  double x = v34.origin.x;
  double y = v34.origin.y;
  double width = v34.size.width;
  double height = v34.size.height;
  v17 = [(MTGenericSettingsFooterLabelView *)self textView];
  [v17 setFrame:CGRectMake(x, y, width, height)];

  if ([(MTGenericSettingsFooterLabelView *)self topAlignLabel])
  {
    v18 = [(MTGenericSettingsFooterLabelView *)self textView];
    [v18 sizeToFit];
  }
  if ([(MTGenericSettingsFooterLabelView *)self effectiveUserInterfaceLayoutDirection] == (id)1)
  {
    v19 = [(MTGenericSettingsFooterLabelView *)self textView];
    [v19 frame];
    CGFloat v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    [(MTGenericSettingsFooterLabelView *)self bounds];
    double MaxX = CGRectGetMaxX(v35);
    v36.origin.double x = v21;
    v36.origin.double y = v23;
    v36.size.double width = v25;
    v36.size.double height = v27;
    double v29 = MaxX - CGRectGetWidth(v36);
    v37.origin.double x = v21;
    v37.origin.double y = v23;
    v37.size.double width = v25;
    v37.size.double height = v27;
    double v30 = v29 - CGRectGetMinX(v37);
    v31 = [(MTGenericSettingsFooterLabelView *)self textView];
    [v31 setFrame:v30, v23, v25, v27];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MTGenericSettingsFooterLabelView;
  [(MTGenericSettingsFooterLabelView *)&v3 traitCollectionDidChange:a3];
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  [a4 absoluteString];
  CGFloat v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v6 == UIApplicationOpenSettingsURLString)
  {
    double v7 = +[UIApplication sharedApplication];
    [v7 openGlobalSettings];
  }
  return v6 != UIApplicationOpenSettingsURLString;
}

- (void)_setupLabel
{
  id v3 = objc_alloc_init((Class)UITextView);
  [(MTGenericSettingsFooterLabelView *)self setTextView:v3];

  CGFloat v4 = [(MTGenericSettingsFooterLabelView *)self textView];
  [(MTGenericSettingsFooterLabelView *)self addSubview:v4];

  double v5 = [(MTGenericSettingsFooterLabelView *)self textView];
  [v5 setTextAlignment:4];

  CGFloat v6 = [(MTGenericSettingsFooterLabelView *)self textView];
  [v6 setEditable:0];

  double v7 = [(MTGenericSettingsFooterLabelView *)self textView];
  [v7 setScrollEnabled:0];

  id v9 = +[UIColor clearColor];
  CGFloat v8 = [(MTGenericSettingsFooterLabelView *)self textView];
  [v8 setBackgroundColor:v9];
}

- (void)_updateColors
{
  id v3 = objc_alloc((Class)NSMutableAttributedString);
  CGFloat v4 = [(MTGenericSettingsFooterLabelView *)self textView];
  double v5 = [v4 attributedText];
  id v10 = [v3 initWithAttributedString:v5];

  CGFloat v6 = +[UIListContentConfiguration groupedFooterConfiguration];
  double v7 = [v6 textProperties];
  CGFloat v8 = [v7 resolvedColor];
  [v10 addAttribute:NSForegroundColorAttributeName value:v8 range:0, [v10 length]];

  id v9 = [(MTGenericSettingsFooterLabelView *)self textView];
  [v9 setAttributedText:v10];
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (BOOL)topAlignLabel
{
  return self->_topAlignLabel;
}

- (void)setTopAlignLabel:(BOOL)a3
{
  self->_topAlignLabel = a3;
}

- (void).cxx_destruct
{
}

@end