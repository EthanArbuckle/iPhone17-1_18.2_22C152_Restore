@interface MTAWorldClockCollectionCell
+ (double)preferredHeight;
- (BOOL)isEditing;
- (MTAWorldClockCollectionCell)initWithFrame:(CGRect)a3;
- (MTAWorldClockCollectionCellDelegate)delegate;
- (MTAWorldClockView)worldClockView;
- (UIButton)deleteButton;
- (WorldClockCity)city;
- (void)deleteTapped:(id)a3;
- (void)layoutSubviews;
- (void)setCity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setWorldClockView:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation MTAWorldClockCollectionCell

- (MTAWorldClockCollectionCell)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)MTAWorldClockCollectionCell;
  v3 = -[MTAWorldClockCollectionCell initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(MTAWorldClockCollectionCell *)v3 contentView];
    v6 = +[UIColor mtui_foregroundColor];
    [v5 setBackgroundColor:v6];

    v7 = [(MTAWorldClockCollectionCell *)v4 contentView];
    [v7 setAutoresizingMask:18];

    v8 = [(MTAWorldClockCollectionCell *)v4 contentView];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:1];

    v9 = -[MTAWorldClockView initWithFrame:]([MTAWorldClockView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(MTAWorldClockCollectionCell *)v4 setWorldClockView:v9];

    v10 = [(MTAWorldClockCollectionCell *)v4 contentView];
    v11 = [(MTAWorldClockCollectionCell *)v4 worldClockView];
    [v10 addSubview:v11];

    v12 = +[UIButton buttonWithType:0];
    [(MTAWorldClockCollectionCell *)v4 setDeleteButton:v12];

    v13 = [(MTAWorldClockCollectionCell *)v4 deleteButton];
    v14 = +[UIImage mtui_deleteButtonImage];
    [v13 setImage:v14 forState:0];

    v15 = [(MTAWorldClockCollectionCell *)v4 deleteButton];
    [v15 addTarget:v4 action:"deleteTapped:" forControlEvents:64];

    v16 = [(MTAWorldClockCollectionCell *)v4 deleteButton];
    [v16 setAccessibilityIdentifier:@"Remove clock"];

    v17 = +[UIShape circleShape];
    v18 = [(MTAWorldClockCollectionCell *)v4 deleteButton];
    v19 = [v18 hoverStyle];
    [v19 setShape:v17];

    v20 = [(MTAWorldClockCollectionCell *)v4 contentView];
    v21 = [(MTAWorldClockCollectionCell *)v4 deleteButton];
    [v20 addSubview:v21];

    v22 = [(MTAWorldClockCollectionCell *)v4 deleteButton];
    [v22 setAlpha:0.0];

    v23 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MTAWorldClockCollectionCell;
  [(MTAWorldClockCollectionCell *)&v13 layoutSubviews];
  v3 = [(MTAWorldClockCollectionCell *)self deleteButton];
  [v3 sizeToFit];

  v4 = [(MTAWorldClockCollectionCell *)self deleteButton];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  v9 = [(MTAWorldClockCollectionCell *)self deleteButton];
  [v9 setFrame:24.0, 24.0, v6, v8];

  [(MTAWorldClockCollectionCell *)self bounds];
  CGFloat v10 = CGRectGetWidth(v14) + -32.0;
  [(MTAWorldClockCollectionCell *)self bounds];
  double Height = CGRectGetHeight(v15);
  v12 = [(MTAWorldClockCollectionCell *)self worldClockView];
  [v12 setFrame:CGRectMake(16.0, 0.0, v10, Height)];
}

- (void)setCity:(id)a3
{
  double v5 = (WorldClockCity *)a3;
  city = self->_city;
  if (city != v5 && ([(WorldClockCity *)city isEqual:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_city, a3);
    double v7 = self->_city;
    double v8 = [(MTAWorldClockCollectionCell *)self worldClockView];
    [v8 setCity:v7];
  }

  _objc_release_x1();
}

- (void)start
{
  id v2 = [(MTAWorldClockCollectionCell *)self worldClockView];
  [v2 start];
}

- (void)stop
{
  id v2 = [(MTAWorldClockCollectionCell *)self worldClockView];
  [v2 stop];
}

- (void)setEditing:(BOOL)a3
{
  self->_BOOL editing = a3;
  if (a3) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }
  double v5 = [(MTAWorldClockCollectionCell *)self deleteButton];
  [v5 setAlpha:v4];

  BOOL editing = self->_editing;
  id v7 = [(MTAWorldClockCollectionCell *)self deleteButton];
  [v7 setUserInteractionEnabled:editing];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    +[UIView beginAnimations:@"WorldClockCollectionCellEditing"];
    [(MTAWorldClockCollectionCell *)self setEditing:v4];
    +[UIView endAnimations];
  }
  else
  {
    -[MTAWorldClockCollectionCell setEditing:](self, "setEditing:");
  }
}

- (void)deleteTapped:(id)a3
{
  id v4 = [(MTAWorldClockCollectionCell *)self delegate];
  [v4 deleteCell:self];
}

+ (double)preferredHeight
{
  +[MTAWorldClockView preferredHeight];
  return result;
}

- (MTAWorldClockCollectionCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTAWorldClockCollectionCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)deleteButton
{
  return self->_deleteButton;
}

- (void)setDeleteButton:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (WorldClockCity)city
{
  return self->_city;
}

- (MTAWorldClockView)worldClockView
{
  return self->_worldClockView;
}

- (void)setWorldClockView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_worldClockView, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_deleteButton, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end