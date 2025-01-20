@interface PRRESegmentTableViewCell
- (PRRESegmentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_currentValue;
- (void)_configure;
- (void)_setCurrentValue:(id)a3;
@end

@implementation PRRESegmentTableViewCell

- (PRRESegmentTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PRRESegmentTableViewCell;
  v4 = [(PRRESegmentTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E4FB1C10]);
    segment = v4->_segment;
    v4->_segment = v5;

    [(UISegmentedControl *)v4->_segment addTarget:v4 action:sel__valueChanged_ forControlEvents:4096];
    [(PRRESegmentTableViewCell *)v4 setAccessoryView:v4->_segment];
  }
  return v4;
}

- (void)_configure
{
  v3.receiver = self;
  v3.super_class = (Class)PRRESegmentTableViewCell;
  [(PRRETableViewCell *)&v3 _configure];
  [(UISegmentedControl *)self->_segment removeAllSegments];
  [(UISegmentedControl *)self->_segment insertSegmentWithTitle:@"🚫" atIndex:0 animated:0];
  [(UISegmentedControl *)self->_segment insertSegmentWithTitle:@"✅" atIndex:1 animated:0];
  [(UISegmentedControl *)self->_segment insertSegmentWithTitle:@"🟡" atIndex:2 animated:0];
  [(UISegmentedControl *)self->_segment insertSegmentWithTitle:@"🛑" atIndex:3 animated:0];
  [(UISegmentedControl *)self->_segment sizeToFit];
  [(PRRESegmentTableViewCell *)self setNeedsLayout];
}

- (id)_currentValue
{
  v2 = NSNumber;
  NSInteger v3 = [(UISegmentedControl *)self->_segment selectedSegmentIndex];
  return (id)[v2 numberWithInteger:v3];
}

- (void)_setCurrentValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v10 = v4;
  if (v5)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v10;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  segment = self->_segment;
  uint64_t v9 = [v7 integerValue];

  [(UISegmentedControl *)segment setSelectedSegmentIndex:v9];
}

- (void).cxx_destruct
{
}

@end