@interface _UITableViewDiffableDataSource
- (UITableView)tableView;
- (_UITableViewDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4;
- (_UITableViewDiffableDataSource)initWithTableView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5;
- (int64_t)defaultRowAnimation;
- (void)setDefaultRowAnimation:(int64_t)a3;
@end

@implementation _UITableViewDiffableDataSource

- (_UITableViewDiffableDataSource)initWithTableView:(id)a3 cellProvider:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UITableViewDiffableDataSource;
  return [(_UIDiffableDataSource *)&v5 initWithTableView:a3 cellProvider:a4];
}

- (UITableView)tableView
{
  v2 = [(_UIDiffableDataSource *)self dsImpl];
  v3 = [v2 tableView];

  return (UITableView *)v3;
}

- (_UITableViewDiffableDataSource)initWithTableView:(id)a3 reuseIdentifierProvider:(id)a4 cellConfigurationHandler:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)_UITableViewDiffableDataSource;
  return [(_UIDiffableDataSource *)&v6 initWithTableView:a3 reuseIdentifierProvider:a4 cellConfigurationHandler:a5];
}

- (int64_t)defaultRowAnimation
{
  return self->_defaultRowAnimation;
}

- (void)setDefaultRowAnimation:(int64_t)a3
{
  self->_defaultRowAnimation = a3;
}

@end