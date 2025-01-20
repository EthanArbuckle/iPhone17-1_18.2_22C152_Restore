@interface PKDashboardPassTilesItem
+ (id)identifier;
- (NSArray)tiles;
- (PKPass)pass;
- (PKPassTile)groupTile;
- (PKPassView)passView;
- (unint64_t)maximumRowsOverride;
- (void)setGroupTile:(id)a3;
- (void)setMaximumRowsOverride:(unint64_t)a3;
- (void)setPass:(id)a3;
- (void)setPassView:(id)a3;
@end

@implementation PKDashboardPassTilesItem

+ (id)identifier
{
  return @"tiles";
}

- (NSArray)tiles
{
  return (NSArray *)[(PKPassTile *)self->_groupTile tiles];
}

- (PKPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (PKPassView)passView
{
  return self->_passView;
}

- (void)setPassView:(id)a3
{
}

- (PKPassTile)groupTile
{
  return self->_groupTile;
}

- (void)setGroupTile:(id)a3
{
}

- (unint64_t)maximumRowsOverride
{
  return self->_maximumRowsOverride;
}

- (void)setMaximumRowsOverride:(unint64_t)a3
{
  self->_maximumRowsOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupTile, 0);
  objc_storeStrong((id *)&self->_passView, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end