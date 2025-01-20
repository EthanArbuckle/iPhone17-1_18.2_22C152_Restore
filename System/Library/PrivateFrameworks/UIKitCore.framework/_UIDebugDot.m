@interface _UIDebugDot
+ (id)dotWithTitle:(id)a3 color:(id)a4;
+ (id)dotWithTitle:(id)a3 color:(id)a4 diameter:(double)a5;
@end

@implementation _UIDebugDot

+ (id)dotWithTitle:(id)a3 color:(id)a4
{
  return +[_UIDebugDot dotWithTitle:a3 color:a4 diameter:10.0];
}

+ (id)dotWithTitle:(id)a3 color:(id)a4 diameter:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = [_UIDebugDot alloc];
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14 = -[UIView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
  v15 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, a5, a5);
  [(UIView *)v15 _setCornerRadius:a5 * 0.5];
  [(UIView *)v15 setBackgroundColor:v7];
  double v16 = *MEMORY[0x1E4F1DAD8];
  double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[UIView setCenter:](v15, "setCenter:", *MEMORY[0x1E4F1DAD8], v17);
  v18 = [(UIView *)v15 layer];
  [v18 setAllowsEdgeAntialiasing:1];

  [(UIView *)v14 addSubview:v15];
  v19 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v10, v11, v12, v13);
  [(UILabel *)v19 setText:v8];

  [(UILabel *)v19 setTextAlignment:1];
  v20 = +[UIColor whiteColor];
  [(UILabel *)v19 setTextColor:v20];

  v21 = [off_1E52D39B8 boldSystemFontOfSize:9.0];
  [(UILabel *)v19 setFont:v21];

  v22 = [(UIView *)v19 layer];
  objc_msgSend(v22, "setAnchorPoint:", v16, v17);

  [(UIView *)v19 setBackgroundColor:v7];
  [(UIView *)v19 sizeToFit];
  [(UIView *)v19 bounds];
  CGRect v31 = CGRectInset(v30, -3.0, -1.0);
  -[UILabel setBounds:](v19, "setBounds:", v31.origin.x, v31.origin.y, v31.size.width, v31.size.height);
  -[UIView setCenter:](v19, "setCenter:", 9.0, 3.0);
  id v23 = v7;
  uint64_t v24 = [v23 CGColor];

  v25 = [(UIView *)v19 layer];
  [v25 setBorderColor:v24];

  v26 = [(UIView *)v19 layer];
  [v26 setBorderWidth:1.0];

  v27 = [(UIView *)v19 layer];
  [v27 setAllowsEdgeAntialiasing:1];

  [(UIView *)v19 _setContinuousCornerRadius:3.0];
  [(UIView *)v19 setClipsToBounds:1];
  [(UIView *)v14 addSubview:v19];

  return v14;
}

@end