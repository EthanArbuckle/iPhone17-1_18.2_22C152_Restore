@interface _PXVisualDiagnosticsFillRectConfiguration
- (UIColor)fillColor;
- (_PXVisualDiagnosticsFillRectConfiguration)init;
- (void)setFillColor:(id)a3;
@end

@implementation _PXVisualDiagnosticsFillRectConfiguration

- (void).cxx_destruct
{
}

- (void)setFillColor:(id)a3
{
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (_PXVisualDiagnosticsFillRectConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXVisualDiagnosticsFillRectConfiguration;
  v2 = [(_PXVisualDiagnosticsFillRectConfiguration *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] clearColor];
    fillColor = v2->_fillColor;
    v2->_fillColor = (UIColor *)v3;
  }
  return v2;
}

@end