@interface UITextCompletionView
- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)_calculateRectForExpandedHitRegion;
- (UITextCompletionView)initWithFrame:(CGRect)a3 string:(id)a4 type:(int)a5 edgeType:(int)a6;
- (void)drawRect:(CGRect)a3;
@end

@implementation UITextCompletionView

- (UITextCompletionView)initWithFrame:(CGRect)a3 string:(id)a4 type:(int)a5 edgeType:(int)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v13 = a4;
  if (v13)
  {
    v14 = _documentTextFont();
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v13, "_legacy_sizeWithFont:forWidth:lineBreakMode:", v14, 2, 3.40282347e38);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRect v24 = CGRectInset(v23, 0.0, 0.0);
  double v15 = v24.size.height * 0.68;
  if ((a6 - 1) >= 2) {
    double v15 = -0.0;
  }
  CGFloat v16 = v24.size.width + v15;
  CGRect v25 = CGRectIntegral(v24);
  v22.receiver = self;
  v22.super_class = (Class)UITextCompletionView;
  v17 = -[UIView initWithFrame:](&v22, sel_initWithFrame_, v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  v18 = v17;
  if (v17)
  {
    v17->_edgeType = a6;
    uint64_t v19 = [v13 copy];
    string = v18->_string;
    v18->_string = (NSString *)v19;

    v18->_type = a5;
    objc_storeStrong((id *)&v18->_textFont, v14);
    [(UIView *)v18 setOpaque:0];
    [(UIView *)v18 setUserInteractionEnabled:0];
  }

  return v18;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  [(UIView *)self bounds];
  v5 = 0;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  switch(self->_type)
  {
    case 2:
      _typedTextBackgroundColor();
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = +[UIColor systemBlackColor];
      goto LABEL_6;
    case 8:
      _typedTextBackgroundColor();
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      double v15 = (void *)_textCompletionTextColor_color;
      if (!_textCompletionTextColor_color)
      {
        uint64_t v16 = +[UIColor systemGrayColor];
        v17 = (void *)_textCompletionTextColor_color;
        _textCompletionTextColor_color = v16;

        double v15 = (void *)_textCompletionTextColor_color;
      }
      id v14 = v15;
LABEL_6:
      v18 = v14;
      v5 = v41;
      goto LABEL_10;
    case 9:
      uint64_t v19 = +[UIColor systemBackgroundColor];
      id v42 = [v19 colorWithAlphaComponent:1.0];

      v5 = v42;
      goto LABEL_9;
    case 0xA:
      v5 = +[UIColor systemBlueColor];
LABEL_9:
      v18 = 0;
LABEL_10:
      id v43 = v5;
      if (v5)
      {
        v45.origin.CGFloat x = v7;
        v45.origin.CGFloat y = v9;
        v45.size.CGFloat width = v11;
        v45.size.double height = v13;
        CGRect v46 = CGRectInset(v45, 1.0, 1.0);
        CGFloat x = v46.origin.x;
        CGFloat y = v46.origin.y;
        CGFloat width = v46.size.width;
        CGFloat v23 = v46.size.height;
        [v43 set];
        v5 = v43;
        switch(self->_edgeType)
        {
          case 0:
          case 3:
            UIRectFillUsingOperation(1, x, y, width, v23);
            goto LABEL_16;
          case 1:
            v47.origin.CGFloat x = x;
            v47.origin.CGFloat y = y;
            v47.size.CGFloat width = width;
            v47.size.double height = v23;
            double v24 = CGRectGetHeight(v47) * 0.5;
            v48.origin.CGFloat x = x;
            v48.origin.CGFloat y = y;
            v48.size.CGFloat width = width;
            v48.size.double height = v23;
            double v25 = CGRectGetWidth(v48) * 0.5;
            double v26 = x;
            double v27 = y;
            double v28 = width;
            double v29 = v23;
            uint64_t v30 = 10;
            goto LABEL_15;
          case 2:
            v49.origin.CGFloat x = x;
            v49.origin.CGFloat y = y;
            v49.size.CGFloat width = width;
            v49.size.double height = v23;
            double v24 = CGRectGetHeight(v49) * 0.5;
            v50.origin.CGFloat x = x;
            v50.origin.CGFloat y = y;
            v50.size.CGFloat width = width;
            v50.size.double height = v23;
            double v25 = CGRectGetWidth(v50) * 0.5;
            double v26 = x;
            double v27 = y;
            double v28 = width;
            double v29 = v23;
            uint64_t v30 = 5;
LABEL_15:
            v31 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v30, v26, v27, v28, v29, v24, v25);
            [v31 fill];

LABEL_16:
            v5 = v43;
            break;
          default:
            break;
        }
      }
      if (v18)
      {
        [v18 set];
        string = self->_string;
        if (string && [(NSString *)string length])
        {
          [(NSString *)self->_string _legacy_sizeWithFont:self->_textFont forWidth:2 lineBreakMode:3.40282347e38];
          double v34 = v33;
        }
        else
        {
          objc_msgSend(@" ", "_legacy_sizeWithFont:forWidth:lineBreakMode:", self->_textFont, 2, 3.40282347e38);
          double v34 = v35;
        }
        if (+[UIKeyboard isInputSystemUI])
        {
          v36 = +[UIKeyboard keyboardApplicationIdentifier];
        }
        else
        {
          v36 = 0;
        }
        double v37 = height - v34;
        if ([v36 isEqualToString:@"com.apple.mobilemail"])
        {
          if (v37 < 1.0) {
            double v37 = 0.0;
          }
          else {
            double v37 = v37 + -1.0;
          }
        }
        else if (([v36 isEqualToString:@"com.apple.MobileSMS"] & 1) == 0)
        {
          int v38 = [v36 isEqualToString:@"com.apple.mobilenotes"];
          double v39 = 1.0;
          if (v37 < 1.0) {
            double v39 = 0.0;
          }
          if (v38) {
            double v37 = v39;
          }
        }

        double v40 = 0.0;
        if (self->_edgeType == 2) {
          double v40 = v13 * 0.68 + 0.0;
        }
        -[NSString _legacy_drawAtPoint:forWidth:withFont:lineBreakMode:](self->_string, "_legacy_drawAtPoint:forWidth:withFont:lineBreakMode:", self->_textFont, 2, v40, v37 + 0.0, 3.40282347e38);

        v5 = v43;
      }
      break;
    default:
      break;
  }
}

- (CGRect)_calculateRectForExpandedHitRegion
{
  [(UIView *)self bounds];
  CGRect v21 = CGRectInset(v20, -15.0, -30.0);
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat height = v21.size.height;
  CGFloat v6 = v21.size.width + 5.0;
  [(UIView *)self bounds];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  CGFloat v15 = x;
  CGFloat v16 = y;
  CGFloat v17 = v6;
  CGFloat v18 = height;
  return CGRectUnion(*(CGRect *)&v15, *(CGRect *)&v8);
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  [(UITextCompletionView *)self _calculateRectForExpandedHitRegion];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  GSEventGetLocationInWindow();
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", GSEventGetWindow(), v13, v14);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v19 = v6;
  uint64_t v20 = v8;
  uint64_t v21 = v10;
  uint64_t v22 = v12;
  return CGRectContainsPoint(*(CGRect *)&v19, *(CGPoint *)&v16);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UITextCompletionView *)self _calculateRectForExpandedHitRegion];
  CGFloat v10 = x;
  CGFloat v11 = y;
  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFont, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end