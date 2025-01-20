@interface _PXVisualDiagnosticsStrokeRectConfiguration
- (UIColor)strokeColor;
- (_PXVisualDiagnosticsStrokeRectConfiguration)init;
- (double)lineWidth;
- (void)setLineWidth:(double)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation _PXVisualDiagnosticsStrokeRectConfiguration

- (void).cxx_destruct
{
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setStrokeColor:(id)a3
{
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (_PXVisualDiagnosticsStrokeRectConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXVisualDiagnosticsStrokeRectConfiguration;
  v2 = [(_PXVisualDiagnosticsStrokeRectConfiguration *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F825C8] clearColor];
    strokeColor = v2->_strokeColor;
    v2->_strokeColor = (UIColor *)v3;

    v2->_lineWidth = 1.0;
  }
  return v2;
}

@end