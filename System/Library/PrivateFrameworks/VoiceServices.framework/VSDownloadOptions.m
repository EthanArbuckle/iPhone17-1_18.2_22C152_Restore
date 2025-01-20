@interface VSDownloadOptions
- (BOOL)allowCellularData;
- (BOOL)allowDiscretionary;
- (void)setAllowCellularData:(BOOL)a3;
- (void)setAllowDiscretionary:(BOOL)a3;
@end

@implementation VSDownloadOptions

- (void)setAllowDiscretionary:(BOOL)a3
{
  self->_allowDiscretionary = a3;
}

- (BOOL)allowDiscretionary
{
  return self->_allowDiscretionary;
}

- (void)setAllowCellularData:(BOOL)a3
{
  self->_allowCellularData = a3;
}

- (BOOL)allowCellularData
{
  return self->_allowCellularData;
}

@end