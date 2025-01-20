@interface THWPagedCanvasControlLayout
- (Class)repClassOverride;
- (THWPagedCanvasControlLayoutDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)validate;
@end

@implementation THWPagedCanvasControlLayout

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (void)validate
{
  v3.receiver = self;
  v3.super_class = (Class)THWPagedCanvasControlLayout;
  [(THWControlLayout *)&v3 validate];
  [(THWPagedCanvasControlLayoutDelegate *)self->_delegate pagedCanvasControlLayoutDidValidate:self];
}

- (THWPagedCanvasControlLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWPagedCanvasControlLayoutDelegate *)a3;
}

@end