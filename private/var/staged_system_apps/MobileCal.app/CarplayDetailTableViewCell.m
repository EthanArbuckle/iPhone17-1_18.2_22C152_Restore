@interface CarplayDetailTableViewCell
+ (id)reuseIdentifier;
- (BOOL)isSelectable;
- (DetailTableViewCellDelegate)delegate;
- (void)cellWasTapped;
- (void)setDelegate:(id)a3;
- (void)updateWithEvent:(id)a3;
@end

@implementation CarplayDetailTableViewCell

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)isSelectable
{
  return 1;
}

- (DetailTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DetailTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)updateWithEvent:(id)a3
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)cellWasTapped
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

@end