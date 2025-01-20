@interface _PXVisualDiagnosticsPageConfiguration
- (CGSize)pageSize;
- (_PXVisualDiagnosticsPageConfiguration)initWithConfiguration:(id)a3;
- (void)setPageSize:(CGSize)a3;
@end

@implementation _PXVisualDiagnosticsPageConfiguration

- (void)setPageSize:(CGSize)a3
{
  self->_pageSize = a3;
}

- (CGSize)pageSize
{
  double width = self->_pageSize.width;
  double height = self->_pageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (_PXVisualDiagnosticsPageConfiguration)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXVisualDiagnosticsPageConfiguration;
  v5 = [(_PXVisualDiagnosticsPageConfiguration *)&v9 init];
  if (v5)
  {
    [v4 defaultPageSize];
    v5->_pageSize.double width = v6;
    v5->_pageSize.double height = v7;
  }

  return v5;
}

@end