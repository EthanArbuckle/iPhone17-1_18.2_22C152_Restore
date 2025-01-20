@interface _PXVisualDiagnosticsTableColumn
- (NSString)title;
- (_PXVisualDiagnosticsTableColumn)init;
- (double)width;
- (void)setTitle:(id)a3;
- (void)setWidth:(double)a3;
@end

@implementation _PXVisualDiagnosticsTableColumn

- (void).cxx_destruct
{
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)width
{
  return self->_width;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (_PXVisualDiagnosticsTableColumn)init
{
  v3.receiver = self;
  v3.super_class = (Class)_PXVisualDiagnosticsTableColumn;
  result = [(_PXVisualDiagnosticsTableColumn *)&v3 init];
  if (result) {
    result->_width = 100.0;
  }
  return result;
}

@end