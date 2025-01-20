@interface PRRETableViewCell
- (id)_currentValue;
- (void)_configure;
- (void)_valueChanged:(id)a3;
- (void)prepareForReuse;
@end

@implementation PRRETableViewCell

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PRRETableViewCell;
  [(PRRETableViewCell *)&v3 prepareForReuse];
  [(PRRETableViewCell *)self setTag:0];
}

- (void)_valueChanged:(id)a3
{
  id v6 = [(PRRETableViewCell *)self _tableView];
  v4 = [v6 delegate];
  v5 = [(PRRETableViewCell *)self _currentValue];
  [v4 cell:self valueChanged:v5];
}

- (void)_configure
{
  id v4 = [(PRRETableViewCell *)self defaultContentConfiguration];
  objc_super v3 = NSStringForPRSceneSetting([(PRRETableViewCell *)self tag]);
  [v4 setText:v3];

  [(PRRETableViewCell *)self setContentConfiguration:v4];
}

- (id)_currentValue
{
  return 0;
}

@end