@interface COSBeamBridgeInstructionView
+ (id)descriptionForPhase:(int64_t)a3;
+ (id)imageForPhase:(int64_t)a3;
- (COSBeamBridgeInstructionView)initWithWithUserStudyPhase:(int64_t)a3;
- (UIImageView)instructionView;
- (UILabel)instructionDetail;
- (void)bailOut:(id)a3;
- (void)layoutSubviews;
- (void)setInstructionDetail:(id)a3;
- (void)setInstructionView:(id)a3;
@end

@implementation COSBeamBridgeInstructionView

- (COSBeamBridgeInstructionView)initWithWithUserStudyPhase:(int64_t)a3
{
  v23.receiver = self;
  v23.super_class = (Class)COSBeamBridgeInstructionView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = -[COSBeamBridgeInstructionView initWithFrame:](&v23, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v7)
  {
    v8 = +[UIColor colorWithWhite:0.9 alpha:0.45];
    [(COSBeamBridgeInstructionView *)v7 setBackgroundColor:v8];

    id v9 = objc_alloc((Class)UIImageView);
    v10 = [(id)objc_opt_class() imageForPhase:a3];
    v11 = (UIImageView *)[v9 initWithImage:v10];
    instructionView = v7->_instructionView;
    v7->_instructionView = v11;

    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    instructionDetail = v7->_instructionDetail;
    v7->_instructionDetail = v13;

    [(UILabel *)v7->_instructionDetail setNumberOfLines:0];
    v15 = v7->_instructionDetail;
    v16 = +[UIFont systemFontOfSize:14.5];
    [(UILabel *)v15 setFont:v16];

    v17 = v7->_instructionDetail;
    v18 = [(id)objc_opt_class() descriptionForPhase:a3];
    [(UILabel *)v17 setText:v18];

    v19 = v7->_instructionDetail;
    v20 = +[UIColor whiteColor];
    [(UILabel *)v19 setTextColor:v20];

    [(COSBeamBridgeInstructionView *)v7 addSubview:v7->_instructionView];
    [(COSBeamBridgeInstructionView *)v7 addSubview:v7->_instructionDetail];
    id v21 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v7 action:"bailOut:"];
    [v21 setNumberOfTapsRequired:4];
    [(COSBeamBridgeInstructionView *)v7 addGestureRecognizer:v21];
  }
  return v7;
}

- (void)bailOut:(id)a3
{
  v3 = pbb_setup_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "COSBeamBridgeInstructionView terminateWithSuccess", v4, 2u);
  }

  [UIApp terminateWithSuccess];
}

+ (id)imageForPhase:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = @"Left-Right";
      goto LABEL_13;
    case 1:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = @"Left-Left";
      goto LABEL_13;
    case 2:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = @"Hold-Left-Right";
      goto LABEL_13;
    case 3:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = @"Hold-Left-Left";
      goto LABEL_13;
    case 4:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = @"Right-Right";
      goto LABEL_13;
    case 5:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = @"Right-Left";
      goto LABEL_13;
    case 6:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = @"Hold-Right-Right";
      goto LABEL_13;
    case 7:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = @"Hold-Right-Left";
      goto LABEL_13;
    case 8:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = @"Table-Right";
      goto LABEL_13;
    case 9:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = @"Table-Left";
LABEL_13:
      v5 = +[UIImage imageNamed:v4 inBundle:v3];

      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

+ (id)descriptionForPhase:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"LEFT_RIGHT";
      goto LABEL_13;
    case 1:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"LEFT_LEFT";
      goto LABEL_13;
    case 2:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"HOLD_LEFT_RIGHT";
      goto LABEL_13;
    case 3:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"HOLD_LEFT_LEFT";
      goto LABEL_13;
    case 4:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"RIGHT_RIGHT";
      goto LABEL_13;
    case 5:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"RIGHT_LEFT";
      goto LABEL_13;
    case 6:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"HOLD_RIGHT_RIGHT";
      goto LABEL_13;
    case 7:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"HOLD_RIGHT_LEFT";
      goto LABEL_13;
    case 8:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"TABLE_RIGHT";
      goto LABEL_13;
    case 9:
      v3 = +[COSInternalUserStudyAssetManager detailBundle];
      CFStringRef v4 = v3;
      CFStringRef v5 = @"TABLE_LEFT";
LABEL_13:
      v6 = [v3 localizedStringForKey:v5 value:&stru_100249230 table:@"User_Study"];

      break;
    default:
      v6 = &stru_100249230;
      break;
  }

  return v6;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)COSBeamBridgeInstructionView;
  [(COSBeamBridgeInstructionView *)&v21 layoutSubviews];
  [(COSBeamBridgeInstructionView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIImageView sizeThatFits:](self->_instructionView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v12 = v11;
  double v14 = v13;
  v22.origin.x = v4;
  v22.origin.double y = v6;
  v22.size.double width = v8;
  v22.size.double height = v10;
  if (v14 <= CGRectGetHeight(v22))
  {
    double v16 = v12;
  }
  else
  {
    v23.origin.x = v4;
    v23.origin.double y = v6;
    v23.size.double width = v8;
    v23.size.double height = v10;
    CGFloat Height = CGRectGetHeight(v23);
    double v16 = v12 * Height / v14;
    double v14 = Height;
  }
  -[UIImageView setFrame:](self->_instructionView, "setFrame:", 0.0, 0.0, v16, v14);
  v24.origin.x = v4;
  v24.origin.double y = v6;
  v24.size.double width = v8;
  v24.size.double height = v10;
  -[UILabel sizeThatFits:](self->_instructionDetail, "sizeThatFits:", CGRectGetWidth(v24) - v12 + -5.0, 0.0);
  double v18 = v17;
  instructionDetail = self->_instructionDetail;
  v25.origin.x = 0.0;
  v25.origin.double y = 0.0;
  v25.size.double width = v16;
  v25.size.double height = v14;
  CGFloat v20 = CGRectGetMaxX(v25) + 5.0;
  v26.origin.x = v4;
  v26.origin.double y = v6;
  v26.size.double width = v8;
  v26.size.double height = v10;
  -[UILabel setFrame:](instructionDetail, "setFrame:", v20, 0.0, CGRectGetWidth(v26) - v12, v18);
}

- (UIImageView)instructionView
{
  return self->_instructionView;
}

- (void)setInstructionView:(id)a3
{
}

- (UILabel)instructionDetail
{
  return self->_instructionDetail;
}

- (void)setInstructionDetail:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionDetail, 0);

  objc_storeStrong((id *)&self->_instructionView, 0);
}

@end