@interface HomeActionFooterViewModel
- (BOOL)isEqual:(id)a3;
- (HomeActionFooterViewDelegate)delegate;
- (double)topMargin;
- (unint64_t)hash;
- (void)setDelegate:(id)a3;
- (void)setTopMargin:(double)a3;
@end

@implementation HomeActionFooterViewModel

- (unint64_t)hash
{
  v2 = +[NSNumber numberWithDouble:self->_topMargin];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HomeActionFooterViewModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    delegate = self->_delegate;
    v8 = [(HomeActionFooterViewModel *)v6 delegate];
    if (delegate == v8 || [(HomeActionFooterViewDelegate *)delegate isEqual:v8])
    {
      double topMargin = self->_topMargin;
      [(HomeActionFooterViewModel *)v6 topMargin];
      BOOL v11 = topMargin == v10;
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (HomeActionFooterViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (double)topMargin
{
  return self->_topMargin;
}

- (void)setTopMargin:(double)a3
{
  self->_double topMargin = a3;
}

- (void).cxx_destruct
{
}

@end