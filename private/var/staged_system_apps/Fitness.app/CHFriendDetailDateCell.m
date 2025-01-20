@interface CHFriendDetailDateCell
- (CHFriendDetailDateCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setText:(id)a3;
@end

@implementation CHFriendDetailDateCell

- (CHFriendDetailDateCell)initWithFrame:(CGRect)a3
{
  v21.receiver = self;
  v21.super_class = (Class)CHFriendDetailDateCell;
  v3 = -[CHFriendDetailDateCell initWithFrame:](&v21, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCallout];
    v5 = [v4 fontDescriptorWithSymbolicTraits:0x8000];

    v6 = +[UIFont fontWithDescriptor:v5 size:0.0];
    v7 = objc_opt_new();
    v8 = +[NSParagraphStyle defaultParagraphStyle];
    [v7 setParagraphStyle:v8];

    [v7 setLineSpacing:0.0];
    v22[0] = NSParagraphStyleAttributeName;
    v22[1] = NSFontAttributeName;
    v23[0] = v7;
    v23[1] = v6;
    v22[2] = NSForegroundColorAttributeName;
    v9 = +[UIColor labelColor];
    v23[2] = v9;
    v10 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];

    id v11 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v15 = [v11 initWithFrame:CGRectZero.origin.x, y, width, height];
    dateLabel = v3->_dateLabel;
    v3->_dateLabel = v15;

    [(UILabel *)v3->_dateLabel setNumberOfLines:0];
    [(UILabel *)v3->_dateLabel setLineBreakMode:0];
    [(UILabel *)v3->_dateLabel _setDefaultAttributes:v10];
    [(CHFriendDetailDateCell *)v3 addSubview:v3->_dateLabel];
    v17 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    separatorView = v3->_separatorView;
    v3->_separatorView = v17;

    v19 = +[UIColor separatorColor];
    [(UIView *)v3->_separatorView setBackgroundColor:v19];

    [(CHFriendDetailDateCell *)v3 addSubview:v3->_separatorView];
  }
  return v3;
}

- (void)setText:(id)a3
{
  [(UILabel *)self->_dateLabel setText:a3];

  [(CHFriendDetailDateCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)CHFriendDetailDateCell;
  [(CHFriendDetailDateCell *)&v18 layoutSubviews];
  [(CHFriendDetailDateCell *)self bounds];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:", CGRectGetWidth(v19) + -6.0, 1.79769313e308);
  double v8 = v7;
  double v10 = v9;
  int IsRightToLeft = FIUILocaleIsRightToLeft();
  double v12 = 3.0;
  if (IsRightToLeft)
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    double v12 = CGRectGetWidth(v20) - v8 + -3.0;
  }
  -[UILabel setFrame:](self->_dateLabel, "setFrame:", v12, 0.0, v8, v10);
  v13 = [(UILabel *)self->_dateLabel font];
  [v13 _scaledValueForValue:16.0];
  double v15 = v14;

  [(UILabel *)self->_dateLabel _setFirstLineCapFrameOriginY:v15];
  [(UILabel *)self->_dateLabel _lastLineBaselineFrameOriginY];
  double v17 = v16 + 17.5;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  -[UIView setFrame:](self->_separatorView, "setFrame:", 0.0, v17, CGRectGetWidth(v21), 0.5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);

  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end