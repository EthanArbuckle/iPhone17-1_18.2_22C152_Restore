@interface VUICollectionConfiguration
- (BOOL)hideLockupTitles;
- (double)minimumLineSpacing;
- (int64_t)gridFilter;
- (int64_t)gridStyle;
- (int64_t)gridType;
- (void)setGridFilter:(int64_t)a3;
- (void)setGridStyle:(int64_t)a3;
- (void)setGridType:(int64_t)a3;
- (void)setHideLockupTitles:(BOOL)a3;
- (void)setMinimumLineSpacing:(double)a3;
@end

@implementation VUICollectionConfiguration

- (int64_t)gridFilter
{
  return self->_gridFilter;
}

- (void)setGridFilter:(int64_t)a3
{
  self->_gridFilter = a3;
}

- (int64_t)gridStyle
{
  return self->_gridStyle;
}

- (void)setGridStyle:(int64_t)a3
{
  self->_gridStyle = a3;
}

- (int64_t)gridType
{
  return self->_gridType;
}

- (void)setGridType:(int64_t)a3
{
  self->_gridType = a3;
}

- (double)minimumLineSpacing
{
  return self->_minimumLineSpacing;
}

- (void)setMinimumLineSpacing:(double)a3
{
  self->_minimumLineSpacing = a3;
}

- (BOOL)hideLockupTitles
{
  return self->_hideLockupTitles;
}

- (void)setHideLockupTitles:(BOOL)a3
{
  self->_hideLockupTitles = a3;
}

@end