@interface SUTableCellContentOverlayView
- (SUCellConfiguration)configuration;
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
- (void)setConfiguration:(id)a3;
@end

@implementation SUTableCellContentOverlayView

- (void)dealloc
{
  self->_configuration = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUTableCellContentOverlayView;
  [(SUTableCellContentOverlayView *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
}

- (SUCellConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

@end