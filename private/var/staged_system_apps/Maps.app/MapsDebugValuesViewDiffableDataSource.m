@interface MapsDebugValuesViewDiffableDataSource
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
@end

@implementation MapsDebugValuesViewDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugVC);
  v6 = [WeakRetained sectionAtIndex:a4];

  v7 = [v6 title];

  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugVC);
  v6 = [WeakRetained sectionAtIndex:a4];

  v7 = [v6 footer];

  return v7;
}

- (void).cxx_destruct
{
}

@end