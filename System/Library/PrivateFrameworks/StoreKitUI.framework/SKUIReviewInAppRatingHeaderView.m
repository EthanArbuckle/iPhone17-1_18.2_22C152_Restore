@interface SKUIReviewInAppRatingHeaderView
- (BOOL)completed;
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)message;
- (NSString)title;
- (SKUIReviewInAppRatingHeaderView)initWithTitle:(id)a3 message:(id)a4 icon:(id)a5;
- (SKUIStarRatingControl)ratingView;
- (UIImageView)imageView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (id)_messageLabelFont;
- (id)_titleLabelFont;
- (void)layoutSubviews;
- (void)setCompleted:(BOOL)a3;
- (void)setCompletedWithRating:(int64_t)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setImageView:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageLabel:(id)a3;
- (void)setRatingView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation SKUIReviewInAppRatingHeaderView

- (SKUIReviewInAppRatingHeaderView)initWithTitle:(id)a3 message:(id)a4 icon:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v36.receiver = self;
  v36.super_class = (Class)SKUIReviewInAppRatingHeaderView;
  double v12 = *MEMORY[0x1E4F1DB28];
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v16 = -[SKUIReviewInAppRatingHeaderView initWithFrame:](&v36, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v13, v14, v15);
  if (v16)
  {
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v12, v13, v14, v15);
    imageView = v16->_imageView;
    v16->_imageView = (UIImageView *)v17;

    [(UIImageView *)v16->_imageView setImage:v11];
    [(SKUIReviewInAppRatingHeaderView *)v16 addSubview:v16->_imageView];
    objc_storeStrong((id *)&v16->_title, a3);
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v12, v13, v14, v15);
    titleLabel = v16->_titleLabel;
    v16->_titleLabel = (UILabel *)v19;

    v21 = [(SKUIReviewInAppRatingHeaderView *)v16 _titleLabelFont];
    [(UILabel *)v16->_titleLabel setFont:v21];

    [(UILabel *)v16->_titleLabel setText:v9];
    [(UILabel *)v16->_titleLabel setNumberOfLines:0];
    [(UILabel *)v16->_titleLabel setTextAlignment:1];
    [(SKUIReviewInAppRatingHeaderView *)v16 addSubview:v16->_titleLabel];
    objc_storeStrong((id *)&v16->_message, a4);
    uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v12, v13, v14, v15);
    messageLabel = v16->_messageLabel;
    v16->_messageLabel = (UILabel *)v22;

    v24 = [(SKUIReviewInAppRatingHeaderView *)v16 _messageLabelFont];
    [(UILabel *)v16->_messageLabel setFont:v24];

    [(UILabel *)v16->_messageLabel setText:v10];
    [(UILabel *)v16->_messageLabel setNumberOfLines:0];
    [(UILabel *)v16->_messageLabel setTextAlignment:1];
    [(SKUIReviewInAppRatingHeaderView *)v16 addSubview:v16->_messageLabel];
    v25 = objc_alloc_init(SKUIStarRatingControl);
    ratingView = v16->_ratingView;
    v16->_ratingView = v25;

    v27 = v16->_ratingView;
    v28 = (void *)MEMORY[0x1E4FB1818];
    v29 = SKUIBundle();
    v30 = [v28 imageNamed:@"LightRateControl" inBundle:v29];
    [(SKUIStarRatingControl *)v27 setEmptyStarsImage:v30];

    v31 = v16->_ratingView;
    v32 = (void *)MEMORY[0x1E4FB1818];
    v33 = SKUIBundle();
    v34 = [v32 imageNamed:@"RateControlFilled" inBundle:v33];
    [(SKUIStarRatingControl *)v31 setFilledStarsImage:v34];

    [(SKUIStarRatingControl *)v16->_ratingView setUserInteractionEnabled:0];
    [(SKUIReviewInAppRatingHeaderView *)v16 addSubview:v16->_ratingView];
  }

  return v16;
}

- (void)setCompletedWithRating:(int64_t)a3
{
  v5 = [(SKUIReviewInAppRatingHeaderView *)self ratingView];
  [v5 setUserRating:a3];

  [(SKUIReviewInAppRatingHeaderView *)self setCompleted:1];
}

- (void)setCompleted:(BOOL)a3
{
  if (self->_completed != a3)
  {
    BOOL v4 = a3;
    if (a3)
    {
      v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      [v3 localizedStringForKey:@"IN_APP_REVIEW_SUCCESSFUL_TITLE" value:&stru_1F1C879E8 table:0];
    }
    else
    {
      [(SKUIReviewInAppRatingHeaderView *)self title];
    v6 = };
    v7 = [(SKUIReviewInAppRatingHeaderView *)self titleLabel];
    [v7 setText:v6];

    if (v4)
    {

      v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      [v3 localizedStringForKey:@"IN_APP_REVIEW_SUCCESSFUL_MESSAGE" value:&stru_1F1C879E8 table:0];
    }
    else
    {
      [(SKUIReviewInAppRatingHeaderView *)self message];
    v8 = };
    id v9 = [(SKUIReviewInAppRatingHeaderView *)self messageLabel];
    [v9 setText:v8];

    if (v4)
    {

      v8 = v3;
    }

    [(SKUIReviewInAppRatingHeaderView *)self setNeedsLayout];
    [(SKUIReviewInAppRatingHeaderView *)self invalidateIntrinsicContentSize];
    self->_completed = v4;
  }
}

- (void)setContentSize:(CGSize)a3
{
  if (self->_contentSize.width != a3.width || self->_contentSize.height != a3.height)
  {
    self->_contentSize = a3;
    [(SKUIReviewInAppRatingHeaderView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(SKUIReviewInAppRatingHeaderView *)self contentSize];
  if (*MEMORY[0x1E4F1DB30] == v6 && *(double *)(MEMORY[0x1E4F1DB30] + 8) == v5)
  {
    double v10 = 170.0;
  }
  else
  {
    [(SKUIReviewInAppRatingHeaderView *)self contentSize];
    CGFloat width = v8;
    [(SKUIReviewInAppRatingHeaderView *)self contentSize];
    double v10 = fmax(v9, 170.0);
  }
  double v11 = width;
  result.height = v10;
  result.CGFloat width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[SKUIReviewInAppRatingHeaderView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.height = v3;
  result.CGFloat width = v2;
  return result;
}

- (void)layoutSubviews
{
  v73.receiver = self;
  v73.super_class = (Class)SKUIReviewInAppRatingHeaderView;
  [(SKUIReviewInAppRatingHeaderView *)&v73 layoutSubviews];
  [(SKUIReviewInAppRatingHeaderView *)self bounds];
  CGRect v75 = CGRectInset(v74, 20.0, 20.0);
  CGFloat x = v75.origin.x;
  CGFloat y = v75.origin.y;
  double width = v75.size.width;
  double height = v75.size.height;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__SKUIReviewInAppRatingHeaderView_layoutSubviews__block_invoke;
  aBlock[3] = &__block_descriptor_64_e52__CGRect__CGPoint_dd__CGSize_dd__32__0_CGSize_dd_8d24l;
  CGRect v72 = v75;
  v7 = (double (**)(void, double, double, double))_Block_copy(aBlock);
  double v8 = [(SKUIReviewInAppRatingHeaderView *)self imageView];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;
  double v12 = v11;

  v76.origin.CGFloat x = x;
  v76.origin.CGFloat y = y;
  v76.size.double width = width;
  double v70 = width;
  v76.size.double height = height;
  CGFloat MinY = CGRectGetMinY(v76);
  double v14 = v7 + 2;
  double v15 = v7[2](v7, v10, v12, MinY);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  uint64_t v22 = [(SKUIReviewInAppRatingHeaderView *)self imageView];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = [(SKUIReviewInAppRatingHeaderView *)self titleLabel];
  objc_msgSend(v23, "sizeThatFits:", width, height);
  double v25 = v24;
  double v27 = v26;

  v77.origin.CGFloat x = v15;
  v77.origin.CGFloat y = v17;
  v77.size.double width = v19;
  v77.size.double height = v21;
  double MaxY = CGRectGetMaxY(v77);
  v78.origin.CGFloat x = v15;
  v78.origin.CGFloat y = v17;
  v78.size.double width = v19;
  v78.size.double height = v21;
  BOOL v29 = CGRectGetHeight(v78) <= 0.0;
  double v30 = 15.0;
  if (v29) {
    double v30 = 0.0;
  }
  double v31 = (*v14)(v7, v25, v27, MaxY + v30);
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  v38 = [(SKUIReviewInAppRatingHeaderView *)self titleLabel];
  objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

  v39 = [(SKUIReviewInAppRatingHeaderView *)self messageLabel];
  objc_msgSend(v39, "sizeThatFits:", v70, height);
  double v41 = v40;
  double v43 = v42;

  v79.origin.CGFloat x = v31;
  v79.origin.CGFloat y = v33;
  v79.size.double width = v35;
  v79.size.double height = v37;
  double v44 = CGRectGetMaxY(v79);
  v80.origin.CGFloat x = v31;
  v80.origin.CGFloat y = v33;
  v80.size.double width = v35;
  v80.size.double height = v37;
  BOOL v29 = CGRectGetHeight(v80) <= 0.0;
  double v45 = 2.0;
  if (v29) {
    double v45 = 0.0;
  }
  double v46 = (*v14)(v7, v41, v43, v44 + v45);
  double v48 = v47;
  double v50 = v49;
  double v52 = v51;
  v53 = [(SKUIReviewInAppRatingHeaderView *)self messageLabel];
  objc_msgSend(v53, "setFrame:", v46, v48, v50, v52);

  BOOL v54 = [(SKUIReviewInAppRatingHeaderView *)self completed];
  v55 = [(SKUIReviewInAppRatingHeaderView *)self ratingView];
  v56 = v55;
  if (v54)
  {
    [v55 sizeToFit];

    v57 = [(SKUIReviewInAppRatingHeaderView *)self ratingView];
    [v57 frame];
    double v59 = v58;
    double v61 = v60;

    v81.origin.CGFloat x = v46;
    v81.origin.CGFloat y = v48;
    v81.size.double width = v50;
    v81.size.double height = v52;
    double v62 = CGRectGetMaxY(v81);
    v82.origin.CGFloat x = v46;
    v82.origin.CGFloat y = v48;
    v82.size.double width = v50;
    v82.size.double height = v52;
    BOOL v29 = CGRectGetHeight(v82) <= 0.0;
    double v63 = 6.0;
    if (v29) {
      double v63 = 0.0;
    }
    double v46 = v7[2](v7, v59, v61, v62 + v63);
    double v48 = v64;
    double v50 = v65;
    double v52 = v66;
    v67 = [(SKUIReviewInAppRatingHeaderView *)self ratingView];
    objc_msgSend(v67, "setFrame:", v46, v48, v50, v52);

    v56 = [(SKUIReviewInAppRatingHeaderView *)self ratingView];
    [v56 setAlpha:1.0];
    double v68 = 11.0;
  }
  else
  {
    [v55 setAlpha:0.0];
    double v68 = 20.0;
  }

  v83.origin.CGFloat x = v46;
  v83.origin.CGFloat y = v48;
  v83.size.double width = v50;
  v83.size.double height = v52;
  double v69 = v68 + CGRectGetMaxY(v83);
  [(SKUIReviewInAppRatingHeaderView *)self bounds];
  -[SKUIReviewInAppRatingHeaderView setContentSize:](self, "setContentSize:", CGRectGetWidth(v84), v69);
}

double __49__SKUIReviewInAppRatingHeaderView_layoutSubviews__block_invoke(CGRect *a1, double a2)
{
  CGFloat v2 = CGRectGetMidX(a1[1]) + a2 * -0.5;
  double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  double v5 = v4;

  return round(v2 * v5) / v5;
}

- (id)_titleLabelFont
{
  CGFloat v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2908] addingSymbolicTraits:0 options:2];
  double v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (id)_messageLabelFont
{
  CGFloat v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2948] addingSymbolicTraits:0x8000 options:2];
  double v3 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (BOOL)completed
{
  return self->_completed;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
}

- (SKUIStarRatingControl)ratingView
{
  return self->_ratingView;
}

- (void)setRatingView:(id)a3
{
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end