@interface SUUIRedeemCameraLandingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SUUIRedeemCameraLandingView)initWithClientContext:(id)a3;
- (UIButton)button;
- (UIImage)image;
- (int64_t)spacingStyle;
- (void)layoutSubviews;
- (void)setSpacingStyle:(int64_t)a3;
@end

@implementation SUUIRedeemCameraLandingView

- (SUUIRedeemCameraLandingView)initWithClientContext:(id)a3
{
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SUUIRedeemCameraLandingView;
  v5 = [(SUUIRedeemCameraLandingView *)&v51 init];
  if (!v5) {
    goto LABEL_27;
  }
  v6 = (void *)MEMORY[0x263F827E8];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v8 = [v6 imageNamed:@"RedemptionCardArtworkCobra" inBundle:v7];

  uint64_t v9 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
  imageView = v5->_imageView;
  v5->_imageView = (UIImageView *)v9;

  [(SUUIRedeemCameraLandingView *)v5 addSubview:v5->_imageView];
  v11 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  headerLabel = v5->_headerLabel;
  v5->_headerLabel = v11;

  v13 = v5->_headerLabel;
  v14 = [MEMORY[0x263F825C8] whiteColor];
  [(UILabel *)v13 setBackgroundColor:v14];

  v15 = v5->_headerLabel;
  v16 = [MEMORY[0x263F81708] boldSystemFontOfSize:17.0];
  [(UILabel *)v15 setFont:v16];

  [(UILabel *)v5->_headerLabel setNumberOfLines:0];
  v17 = v5->_headerLabel;
  v18 = [MEMORY[0x263F825C8] blackColor];
  [(UILabel *)v17 setTextColor:v18];

  [(UILabel *)v5->_headerLabel setTextAlignment:1];
  v19 = (void *)MGCopyAnswer();
  BOOL v20 = +[SUUIRedeemViewControllerLegacy redeemRequiresNationalId:v4];
  int v21 = [v19 integerValue];
  v50 = (void *)v8;
  switch(v21)
  {
    case 1:
      v22 = v5->_headerLabel;
      v23 = @"CAMERA_REDEEM_PROMPT_IPHONE";
      v24 = @"CAMERA_REDEEM_PROMPT_IPHONE_CN";
      goto LABEL_8;
    case 2:
      v22 = v5->_headerLabel;
      v23 = @"CAMERA_REDEEM_PROMPT_IPOD";
      v24 = @"CAMERA_REDEEM_PROMPT_IPOD_CN";
      goto LABEL_8;
    case 3:
      v22 = v5->_headerLabel;
      v23 = @"CAMERA_REDEEM_PROMPT_IPAD";
      v24 = @"CAMERA_REDEEM_PROMPT_IPAD_CN";
LABEL_8:
      if (v20) {
        v25 = v24;
      }
      else {
        v25 = v23;
      }
      if (v4) {
        [v4 localizedStringForKey:v25 inTable:@"Redeem"];
      }
      else {
      v26 = +[SUUIClientContext localizedStringForKey:v25 inBundles:0 inTable:@"Redeem"];
      }
      [(UILabel *)v22 setText:v26];

      break;
  }
  [(SUUIRedeemCameraLandingView *)v5 addSubview:v5->_headerLabel];
  v27 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  bodyLabel = v5->_bodyLabel;
  v5->_bodyLabel = v27;

  v29 = v5->_bodyLabel;
  if (v20) {
    v30 = @"CAMERA_REDEEM_CARD_DESCRIPTION_CN";
  }
  else {
    v30 = @"CAMERA_REDEEM_CARD_DESCRIPTION";
  }
  if (v4) {
    [v4 localizedStringForKey:v30 inTable:@"Redeem"];
  }
  else {
  v31 = +[SUUIClientContext localizedStringForKey:v30 inBundles:0 inTable:@"Redeem"];
  }
  [(UILabel *)v29 setText:v31];

  v32 = v5->_bodyLabel;
  v33 = (void *)MEMORY[0x263F81708];
  v34 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v35 = [v34 userInterfaceIdiom];

  double v36 = 14.0;
  if ((v35 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v36 = 16.0;
  }
  v37 = [v33 systemFontOfSize:v36];
  [(UILabel *)v32 setFont:v37];

  v38 = v5->_bodyLabel;
  v39 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.600000024];
  [(UILabel *)v38 setTextColor:v39];

  [(UILabel *)v5->_bodyLabel setNumberOfLines:0];
  [(UILabel *)v5->_bodyLabel setTextAlignment:1];
  v40 = v5->_bodyLabel;
  v41 = [MEMORY[0x263F825C8] whiteColor];
  [(UILabel *)v40 setBackgroundColor:v41];

  [(SUUIRedeemCameraLandingView *)v5 addSubview:v5->_bodyLabel];
  uint64_t v42 = [MEMORY[0x263F824E8] buttonWithType:1];
  button = v5->_button;
  v5->_button = (UIButton *)v42;

  v44 = v5->_button;
  if (v4) {
    [v4 localizedStringForKey:@"CAMERA_REDEEM_USE_CAMERA_BUTTON" inTable:@"Redeem"];
  }
  else {
  v45 = +[SUUIClientContext localizedStringForKey:@"CAMERA_REDEEM_USE_CAMERA_BUTTON" inBundles:0 inTable:@"Redeem"];
  }
  [(UIButton *)v44 setTitle:v45 forState:0];

  v46 = [(UIButton *)v5->_button titleLabel];
  v47 = [MEMORY[0x263F81708] systemFontOfSize:18.0];
  [v46 setFont:v47];

  [(UIButton *)v5->_button sizeToFit];
  [(SUUIRedeemCameraLandingView *)v5 addSubview:v5->_button];
  v48 = [MEMORY[0x263F825C8] whiteColor];
  [(SUUIRedeemCameraLandingView *)v5 setBackgroundColor:v48];

  [(SUUIRedeemCameraLandingView *)v5 setClipsToBounds:1];
LABEL_27:

  return v5;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setSpacingStyle:(int64_t)a3
{
  if (self->_spacingStyle != a3)
  {
    self->_spacingStyle = a3;
    [(SUUIRedeemCameraLandingView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  [(SUUIRedeemCameraLandingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = v3 + -30.0;
  [(UILabel *)self->_headerLabel frame];
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v7, 1.79769313e308);
  double v56 = v8;
  double v10 = v9;
  [(UILabel *)self->_bodyLabel frame];
  -[UILabel sizeThatFits:](self->_bodyLabel, "sizeThatFits:", v7, 1.79769313e308);
  double v58 = v11;
  [(UIButton *)self->_button frame];
  double v57 = v12;
  double v14 = v13;
  [(UIImageView *)self->_imageView frame];
  double v16 = v15;
  double v18 = v17;
  v19 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v20 = [v19 userInterfaceIdiom];

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v21 = 55.0;
  }
  else
  {
    double v21 = 25.0;
    if (self->_spacingStyle == 1) {
      double v21 = 15.0;
    }
  }
  double v22 = v10 + v18 + v21;
  v23 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v24 = [v23 userInterfaceIdiom];

  double v25 = 11.0;
  if ((v24 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    double v25 = 13.0;
    if (self->_spacingStyle == 1) {
      double v25 = 8.0;
    }
  }
  double v26 = v58 + v22 + v25;
  v27 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v28 = [v27 userInterfaceIdiom];

  if ((v28 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v29 = 36.0;
  }
  else
  {
    double v29 = 16.0;
    if (self->_spacingStyle == 1) {
      double v29 = 7.0;
    }
  }
  float v30 = (v6 - (v14 + v26 + v29)) * 0.5;
  CGFloat v31 = floorf(v30);
  float v32 = (v4 - v16) * 0.5;
  CGFloat v33 = floorf(v32);
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v33, v31, v16, v18);
  v60.origin.x = v33;
  v60.origin.y = v31;
  v60.size.width = v16;
  v60.size.height = v18;
  double MaxY = CGRectGetMaxY(v60);
  uint64_t v35 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v36 = [v35 userInterfaceIdiom];

  if ((v36 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v37 = 55.0;
  }
  else
  {
    double v37 = 25.0;
    if (self->_spacingStyle == 1) {
      double v37 = 15.0;
    }
  }
  CGFloat v38 = MaxY + v37;
  float v39 = (v4 - v56) * 0.5;
  CGFloat v40 = floorf(v39);
  -[UILabel setFrame:](self->_headerLabel, "setFrame:", v40, v38, v56, v10);
  v61.origin.x = v40;
  v61.origin.y = v38;
  v61.size.width = v56;
  v61.size.height = v10;
  double v41 = CGRectGetMaxY(v61);
  uint64_t v42 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v43 = [v42 userInterfaceIdiom];

  double v44 = 11.0;
  if ((v43 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    double v44 = 13.0;
    if (self->_spacingStyle == 1) {
      double v44 = 8.0;
    }
  }
  CGFloat v45 = v41 + v44;
  float v46 = (v4 - v7) * 0.5;
  CGFloat v47 = floorf(v46);
  -[UILabel setFrame:](self->_bodyLabel, "setFrame:", v47, v45, v7, v58);
  v62.origin.x = v47;
  v62.origin.y = v45;
  v62.size.width = v7;
  v62.size.height = v58;
  double v48 = CGRectGetMaxY(v62);
  v49 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v50 = [v49 userInterfaceIdiom];

  if ((v50 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v51 = 36.0;
  }
  else
  {
    double v51 = 16.0;
    if (self->_spacingStyle == 1) {
      double v51 = 7.0;
    }
  }
  double v52 = v48 + v51;
  float v53 = (v4 - v57) * 0.5;
  button = self->_button;
  double v55 = floorf(v53);
  -[UIButton setFrame:](button, "setFrame:", v55, v52);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(UILabel *)self->_bodyLabel frame];
  [(UIButton *)self->_button frame];
  double v6 = v5;
  [(UILabel *)self->_headerLabel frame];
  [(UIImageView *)self->_imageView frame];
  double v8 = v7;
  -[UILabel sizeThatFits:](self->_bodyLabel, "sizeThatFits:", width + -30.0, 1.79769313e308);
  double v10 = v9;
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", width + -30.0, 1.79769313e308);
  double v12 = v11;
  double v13 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v14 = [v13 userInterfaceIdiom];

  if ((v14 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v15 = 55.0;
  }
  else if (self->_spacingStyle == 1)
  {
    double v15 = 15.0;
  }
  else
  {
    double v15 = 25.0;
  }
  double v16 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v17 = [v16 userInterfaceIdiom];

  double v18 = 11.0;
  if ((v17 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    if (self->_spacingStyle == 1) {
      double v18 = 8.0;
    }
    else {
      double v18 = 13.0;
    }
  }
  v19 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v20 = [v19 userInterfaceIdiom];

  if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v21 = 36.0;
  }
  else
  {
    double v21 = 16.0;
    if (self->_spacingStyle == 1) {
      double v21 = 7.0;
    }
  }
  double v22 = v6 + v10 + v12 + v8 + v15 + v18 + v21;
  double v23 = width;
  result.height = v22;
  result.double width = v23;
  return result;
}

- (UIButton)button
{
  return self->_button;
}

- (int64_t)spacingStyle
{
  return self->_spacingStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
}

@end