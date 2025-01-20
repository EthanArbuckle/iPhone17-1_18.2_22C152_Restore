@interface FlyoverStatusToastView
+ (CGSize)preferredSize;
- (BOOL)didDismiss;
- (BOOL)didPresent;
- (FlyoverStatusToastView)initWithTrackingStateReason:(unint64_t)a3;
- (void)dismissWithCompletionHandler:(id)a3;
- (void)present;
@end

@implementation FlyoverStatusToastView

- (FlyoverStatusToastView)initWithTrackingStateReason:(unint64_t)a3
{
  v68.receiver = self;
  v68.super_class = (Class)FlyoverStatusToastView;
  v4 = -[FlyoverStatusToastView initWithFrame:](&v68, "initWithFrame:", 0.0, 0.0, 235.0, 60.0);
  v5 = v4;
  if (v4)
  {
    v6 = [(FlyoverStatusToastView *)v4 layer];
    [v6 setAllowsGroupBlending:0];

    [(FlyoverStatusToastView *)v5 setAccessibilityIdentifier:@"FlyoverStatusToastView"];
    id v7 = objc_alloc((Class)UIVisualEffectView);
    v8 = +[UIBlurEffect effectWithStyle:1];
    v9 = (UIVisualEffectView *)[v7 initWithEffect:v8];
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = v9;

    [(UIVisualEffectView *)v5->_backgroundView setAlpha:0.0];
    [(UIVisualEffectView *)v5->_backgroundView _setContinuousCornerRadius:7.5];
    [(UIVisualEffectView *)v5->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v11 = [(UIVisualEffectView *)v5->_backgroundView topAnchor];
    v12 = [(FlyoverStatusToastView *)v5 topAnchor];
    uint64_t v13 = [v11 constraintEqualToAnchor:v12 constant:5.0];
    backgroundTopConstraint = v5->_backgroundTopConstraint;
    v5->_backgroundTopConstraint = (NSLayoutConstraint *)v13;

    v15 = [(UIVisualEffectView *)v5->_backgroundView leftAnchor];
    v16 = [(FlyoverStatusToastView *)v5 leftAnchor];
    uint64_t v17 = [v15 constraintEqualToAnchor:v16 constant:5.0];
    backgroundLeftConstraint = v5->_backgroundLeftConstraint;
    v5->_backgroundLeftConstraint = (NSLayoutConstraint *)v17;

    v19 = [(UIVisualEffectView *)v5->_backgroundView bottomAnchor];
    v20 = [(FlyoverStatusToastView *)v5 bottomAnchor];
    uint64_t v21 = [v19 constraintEqualToAnchor:v20 constant:-5.0];
    backgroundBottomConstraint = v5->_backgroundBottomConstraint;
    v5->_backgroundBottomConstraint = (NSLayoutConstraint *)v21;

    v23 = [(UIVisualEffectView *)v5->_backgroundView rightAnchor];
    v24 = [(FlyoverStatusToastView *)v5 rightAnchor];
    uint64_t v25 = [v23 constraintEqualToAnchor:v24 constant:-5.0];
    backgroundRightConstraint = v5->_backgroundRightConstraint;
    v5->_backgroundRightConstraint = (NSLayoutConstraint *)v25;

    [(UIVisualEffectView *)v5->_backgroundView setAccessibilityIdentifier:@"FlyoverStatusToastBackground"];
    [(FlyoverStatusToastView *)v5 addSubview:v5->_backgroundView];
    v27 = [FlyoverGlyphView alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v31 = -[FlyoverGlyphView initWithFrame:](v27, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    glyphView = v5->_glyphView;
    v5->_glyphView = v31;

    [(FlyoverGlyphView *)v5->_glyphView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(FlyoverStatusToastView *)v5 addSubview:v5->_glyphView];
    v33 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    label = v5->_label;
    v5->_label = v33;

    [(UILabel *)v5->_label setAlpha:0.0];
    [(UILabel *)v5->_label setTextAlignment:1];
    [(UILabel *)v5->_label setNumberOfLines:2];
    v35 = +[UIColor colorWithWhite:0.0 alpha:0.5];
    [(UILabel *)v5->_label setTextColor:v35];

    v36 = +[UIFont systemFontOfSize:13.0 weight:UIFontWeightMedium];
    [(UILabel *)v5->_label setFont:v36];

    [(UILabel *)v5->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v37 = kCAFilterPlusD;
    v38 = [(UILabel *)v5->_label layer];
    [v38 setCompositingFilter:v37];

    [(UILabel *)v5->_label setAccessibilityIdentifier:@"FlyoverStatusToastLabel"];
    [(FlyoverStatusToastView *)v5 addSubview:v5->_label];
    switch(a3)
    {
      case 4uLL:
        v39 = +[NSBundle mainBundle];
        v40 = v39;
        CFStringRef v41 = @"FULL SCREEN REQUIRED [Flyover]";
        break;
      case 3uLL:
        v39 = +[NSBundle mainBundle];
        v40 = v39;
        CFStringRef v41 = @"LOW DETAIL [Flyover]";
        break;
      case 2uLL:
        v39 = +[NSBundle mainBundle];
        v40 = v39;
        CFStringRef v41 = @"EXCESSIVE MOTION [Flyover]";
        break;
      default:
LABEL_9:
        v69[0] = v5->_backgroundTopConstraint;
        v69[1] = v5->_backgroundLeftConstraint;
        v69[2] = v5->_backgroundBottomConstraint;
        v69[3] = v5->_backgroundRightConstraint;
        v67 = [(FlyoverGlyphView *)v5->_glyphView widthAnchor];
        v66 = [v67 constraintEqualToConstant:50.0];
        v69[4] = v66;
        v65 = [(FlyoverGlyphView *)v5->_glyphView heightAnchor];
        v64 = [v65 constraintEqualToConstant:50.0];
        v69[5] = v64;
        v63 = [(FlyoverGlyphView *)v5->_glyphView leadingAnchor];
        v62 = [(FlyoverStatusToastView *)v5 leadingAnchor];
        v61 = [v63 constraintEqualToAnchor:v62 constant:6.0];
        v69[6] = v61;
        v60 = [(FlyoverGlyphView *)v5->_glyphView centerYAnchor];
        v59 = [(FlyoverStatusToastView *)v5 centerYAnchor];
        v58 = [v60 constraintEqualToAnchor:v59];
        v69[7] = v58;
        v57 = [(UILabel *)v5->_label topAnchor];
        v56 = [(FlyoverStatusToastView *)v5 topAnchor];
        v55 = [v57 constraintEqualToAnchor:v56 constant:5.0];
        v69[8] = v55;
        v54 = [(UILabel *)v5->_label leftAnchor];
        v43 = [(FlyoverStatusToastView *)v5 leftAnchor];
        v44 = [v54 constraintEqualToAnchor:v43 constant:55.0];
        v69[9] = v44;
        v45 = [(UILabel *)v5->_label bottomAnchor];
        v46 = [(FlyoverStatusToastView *)v5 bottomAnchor];
        v47 = [v45 constraintEqualToAnchor:v46 constant:-5.0];
        v69[10] = v47;
        v48 = [(UILabel *)v5->_label rightAnchor];
        v49 = [(FlyoverStatusToastView *)v5 rightAnchor];
        v50 = [v48 constraintEqualToAnchor:v49 constant:-15.0];
        v69[11] = v50;
        v51 = +[NSArray arrayWithObjects:v69 count:12];
        +[NSLayoutConstraint activateConstraints:v51];

        [(FlyoverStatusToastView *)v5 layoutIfNeeded];
        v52 = v5;
        goto LABEL_10;
    }
    v42 = [v39 localizedStringForKey:v41 value:@"localized string not found" table:0];
    [(UILabel *)v5->_label setText:v42];

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (void)present
{
  self->_didPresent = 1;
  [(NSLayoutConstraint *)self->_backgroundTopConstraint setConstant:0.0];
  [(NSLayoutConstraint *)self->_backgroundLeftConstraint setConstant:0.0];
  [(NSLayoutConstraint *)self->_backgroundBottomConstraint setConstant:0.0];
  [(NSLayoutConstraint *)self->_backgroundRightConstraint setConstant:0.0];
  [(FlyoverGlyphView *)self->_glyphView startAnimating];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100AC375C;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  +[UIView animateWithDuration:0 delay:v3 options:0 animations:0.23 completion:0.0];
}

- (void)dismissWithCompletionHandler:(id)a3
{
  id v4 = a3;
  self->_didDismiss = 1;
  [(NSLayoutConstraint *)self->_backgroundTopConstraint setConstant:5.0];
  [(NSLayoutConstraint *)self->_backgroundLeftConstraint setConstant:5.0];
  [(NSLayoutConstraint *)self->_backgroundBottomConstraint setConstant:-5.0];
  [(NSLayoutConstraint *)self->_backgroundRightConstraint setConstant:-5.0];
  double v5 = CACurrentMediaTime();
  [(FlyoverGlyphView *)self->_glyphView stopAnimating];
  double v7 = v6 - v5 + -0.516666667 + 0.25;
  id v10 = v4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100AC3940;
  v11[3] = &unk_1012E5D08;
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100AC39A4;
  v9[3] = &unk_1012EAFC0;
  id v8 = v4;
  +[UIView animateWithDuration:0 delay:v11 options:v9 animations:0.23 completion:v7];
}

+ (CGSize)preferredSize
{
  double v2 = 235.0;
  double v3 = 60.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (BOOL)didDismiss
{
  return self->_didDismiss;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundRightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundBottomConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundLeftConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundTopConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end