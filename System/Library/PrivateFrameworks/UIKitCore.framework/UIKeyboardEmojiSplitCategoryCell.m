@interface UIKeyboardEmojiSplitCategoryCell
- (UIImageView)symbol;
- (UIKeyboardEmojiSplitCategoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)title;
- (UIView)selectedCircle;
- (id)symbolFont;
- (id)titleFont;
- (void)setPressIndicatorHidden:(BOOL)a3;
- (void)setSelectedCircle:(id)a3;
- (void)setSelectedCircleBlendMode:(BOOL)a3;
- (void)setSymbol:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleText:(id)a3;
@end

@implementation UIKeyboardEmojiSplitCategoryCell

- (id)symbolFont
{
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v3 = [v2 preferencesActions];
  [v3 rivenSizeFactor:20.0];
  v4 = objc_msgSend(off_1E52D39B8, "fontWithName:size:traits:", @".Keycaps-Keys", 4096);

  return v4;
}

- (id)titleFont
{
  v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v3 = [v2 preferencesActions];
  [v3 rivenSizeFactor:14.0];
  v4 = objc_msgSend(off_1E52D39B8, "systemFontOfSize:");

  return v4;
}

- (UIKeyboardEmojiSplitCategoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v59.receiver = self;
  v59.super_class = (Class)UIKeyboardEmojiSplitCategoryCell;
  v4 = [(UITableViewCell *)&v59 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor blueColor];
    [(UITableViewCell *)v4 setBackgroundColor:v5];

    v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v7 = [v6 preferencesActions];
    [v7 rivenSizeFactor:200.0];
    double v9 = v8;
    v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v11 = [v10 preferencesActions];
    [v11 rivenSizeFactor:34.0];
    double v13 = v12;

    v14 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v15 = [v14 preferencesActions];
    [v15 rivenSizeFactor:32.0];
    CGFloat v17 = 22.0 - (v16 + -32.0);

    v18 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v19 = [v18 preferencesActions];
    [v19 rivenSizeFactor:32.0];
    double v21 = v20;

    v22 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v17, 1.0, v21, v13);
    symbol = v4->_symbol;
    v4->_symbol = v22;

    v24 = +[UIColor clearColor];
    [(UIImageView *)v4->_symbol setBackgroundColor:v24];

    [(UIImageView *)v4->_symbol setContentMode:4];
    v25 = [(UITableViewCell *)v4 contentView];
    [v25 addSubview:v4->_symbol];

    v60.origin.y = 1.0;
    v60.origin.x = v17;
    v60.size.width = v21;
    v60.size.height = v13;
    CGFloat v26 = CGRectGetMaxX(v60) + 6.0;
    v27 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", v26, 0.0, v9 - v26, v13);
    title = v4->_title;
    v4->_title = v27;

    [(UILabel *)v4->_title setText:&stru_1ED0E84C0];
    v29 = [(UIKeyboardEmojiSplitCategoryCell *)v4 titleFont];
    [(UILabel *)v4->_title setFont:v29];

    v30 = +[UIColor clearColor];
    [(UIView *)v4->_title setBackgroundColor:v30];

    v31 = +[UIColor blackColor];
    [(UILabel *)v4->_title setTextColor:v31];

    [(UILabel *)v4->_title setTextAlignment:0];
    v32 = [(UITableViewCell *)v4 contentView];
    [v32 addSubview:v4->_title];

    v33 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v34 = [v33 preferencesActions];
    [v34 rivenSizeFactor:4.0];
    CGFloat v36 = v17 - v35;
    v37 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v38 = [v37 preferencesActions];
    [v38 rivenSizeFactor:3.0];
    double v40 = 1.0 - v39;
    v41 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v42 = [v41 preferencesActions];
    [v42 rivenSizeFactor:40.0];
    double v44 = v43;
    v45 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v46 = [v45 preferencesActions];
    [v46 rivenSizeFactor:40.0];
    double v48 = v47;

    v49 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v36, v40, v44, v48);
    selectedCircle = v4->_selectedCircle;
    v4->_selectedCircle = v49;

    v51 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v52 = [v51 preferencesActions];
    [v52 rivenSizeFactor:20.0];
    double v54 = v53;
    v55 = [(UIView *)v4->_selectedCircle layer];
    [v55 setCornerRadius:v54];

    [(UIView *)v4->_selectedCircle setHidden:1];
    v56 = [(UITableViewCell *)v4 contentView];
    [v56 addSubview:v4->_selectedCircle];

    [(UITableViewCell *)v4 setSelectionStyle:0];
    v57 = v4;
  }

  return v4;
}

- (void)setTitleText:(id)a3
{
}

- (void)setPressIndicatorHidden:(BOOL)a3
{
}

- (void)setSelectedCircleBlendMode:(BOOL)a3
{
  if (a3)
  {
    v4 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2C8]];
    v5 = [(UIView *)self->_selectedCircle layer];
    [v5 setCompositingFilter:v4];

    v6 = +[UIColor blackColor];
    [(UIView *)self->_selectedCircle setBackgroundColor:v6];

    v7 = [(UIView *)self->_selectedCircle layer];
    LODWORD(v8) = 1045220557;
  }
  else
  {
    double v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A008]];
    v10 = [(UIView *)self->_selectedCircle layer];
    [v10 setCompositingFilter:v9];

    v11 = +[UIColor colorWithRed:0.380392157 green:0.380392157 blue:0.380392157 alpha:1.0];
    [(UIView *)self->_selectedCircle setBackgroundColor:v11];

    v7 = [(UIView *)self->_selectedCircle layer];
    LODWORD(v8) = 1061779669;
  }
  id v12 = v7;
  [v7 setOpacity:v8];
}

- (UIImageView)symbol
{
  return self->_symbol;
}

- (void)setSymbol:(id)a3
{
}

- (UILabel)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (UIView)selectedCircle
{
  return self->_selectedCircle;
}

- (void)setSelectedCircle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedCircle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
}

@end