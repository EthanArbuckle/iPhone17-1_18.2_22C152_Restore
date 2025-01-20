@interface MTAWorldClockTableViewCell
+ (float)defaultHeight;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTAWorldClockTableViewCell)init;
- (MTAWorldClockTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTUIWorldClockCellView)clockCellView;
- (WorldClockCity)city;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCity:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)updateShouldStackViewInCell:(BOOL)a3;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation MTAWorldClockTableViewCell

+ (float)defaultHeight
{
  +[MTUIWorldClockCellView defaultHeight];
  return v2;
}

- (MTAWorldClockTableViewCell)init
{
  return [(MTAWorldClockTableViewCell *)self initWithStyle:0 reuseIdentifier:@"MTWorldClockCell"];
}

- (MTAWorldClockTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)MTAWorldClockTableViewCell;
  v4 = [(MTAWorldClockTableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(MTAWorldClockTableViewCell *)v4 setOpaque:0];
    [(MTAWorldClockTableViewCell *)v5 setSelectionStyle:0];
    v6 = [(MTAWorldClockTableViewCell *)v5 contentView];
    [v6 setOpaque:0];
    id v7 = objc_alloc((Class)MTUIWorldClockCellView);
    [(MTAWorldClockTableViewCell *)v5 bounds];
    v8 = [v7 initWithFrame:];
    clockCellView = v5->_clockCellView;
    v5->_clockCellView = v8;

    [(MTUIWorldClockCellView *)v5->_clockCellView setDelegate:v5];
    [(MTUIWorldClockCellView *)v5->_clockCellView setAutoresizingMask:18];
    [v6 addSubview:v5->_clockCellView];
    v10 = v5;
  }
  return v5;
}

- (void)dealloc
{
  [(MTUIWorldClockCellView *)self->_clockCellView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockTableViewCell;
  [(MTAWorldClockTableViewCell *)&v3 dealloc];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MTAWorldClockTableViewCell;
  [(MTAWorldClockTableViewCell *)&v3 prepareForReuse];
  [(MTAWorldClockTableViewCell *)self setCity:0];
  [(MTAWorldClockTableViewCell *)self setAccessoryView:0];
  [(MTAWorldClockTableViewCell *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  v5 = [(MTAWorldClockTableViewCell *)self contentView];
  [v5 bounds];
  double v7 = v6;

  -[MTUIWorldClockCellView sizeThatFits:](self->_clockCellView, "sizeThatFits:", v7, height);
  double v9 = v8;
  double v11 = v10;
  [(MTAWorldClockTableViewCell *)self _separatorFrame];
  double v13 = v11 + v12;
  double v14 = v9;
  result.double height = v13;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MTAWorldClockTableViewCell;
  [(MTAWorldClockTableViewCell *)&v4 layoutSubviews];
  objc_super v3 = [(MTAWorldClockTableViewCell *)self contentView];
  [v3 bounds];
  -[MTUIWorldClockCellView setFrame:](self->_clockCellView, "setFrame:");
}

- (void)updateShouldStackViewInCell:(BOOL)a3
{
}

- (void)setCity:(id)a3
{
  v5 = (WorldClockCity *)a3;
  p_city = &self->_city;
  if (self->_city != v5)
  {
    double v12 = v5;
    objc_storeStrong((id *)&self->_city, a3);
    double v7 = [(MTUIWorldClockCellView *)self->_clockCellView nameLabel];
    double v8 = [(WorldClockCity *)*p_city name];
    [v7 setText:v8];

    id v9 = objc_alloc((Class)NSTimeZone);
    double v10 = [(WorldClockCity *)*p_city timeZone];
    id v11 = [v9 initWithName:v10];

    [(MTUIWorldClockCellView *)self->_clockCellView setTimeZone:v11];
    if (!*p_city) {
      goto LABEL_5;
    }
    if ([(MTUIWorldClockCellView *)self->_clockCellView started])
    {
      if (!*p_city)
      {
LABEL_5:
        if ([(MTUIWorldClockCellView *)self->_clockCellView started]) {
          [(MTUIWorldClockCellView *)self->_clockCellView stop];
        }
      }
    }
    else
    {
      [(MTUIWorldClockCellView *)self->_clockCellView start];
    }

    v5 = v12;
  }
}

- (WorldClockCity)city
{
  return self->_city;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTAWorldClockTableViewCell;
  -[MTAWorldClockTableViewCell setEditing:animated:](&v11, "setEditing:animated:");
  clockCellView = self->_clockCellView;
  if (v5) {
    id v8 = [(MTAWorldClockTableViewCell *)self showsReorderControl];
  }
  else {
    id v8 = 0;
  }
  [(MTUIWorldClockCellView *)clockCellView setEditing:v8 animated:v4];
  if (v4)
  {
    +[UIView beginAnimations:@"EditingWorldClockTableViewCell" context:0];
    double v9 = 15.0;
    if (v5) {
      double v9 = 45.0;
    }
    -[MTAWorldClockTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v9, 0.0, 0.0);
    +[UIView commitAnimations];
  }
  else
  {
    double v10 = 15.0;
    if (v5) {
      double v10 = 45.0;
    }
    -[MTAWorldClockTableViewCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v10, 0.0, 0.0);
  }
}

- (void)willTransitionToState:(unint64_t)a3
{
  if ((a3 & 1) == 0) {
    [(MTAWorldClockTableViewCell *)self setShowsReorderControl:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)MTAWorldClockTableViewCell;
  [(MTAWorldClockTableViewCell *)&v5 willTransitionToState:a3];
}

- (MTUIWorldClockCellView)clockCellView
{
  return self->_clockCellView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockCellView, 0);

  objc_storeStrong((id *)&self->_city, 0);
}

@end