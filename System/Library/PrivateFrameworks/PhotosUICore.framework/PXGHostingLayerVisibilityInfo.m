@interface PXGHostingLayerVisibilityInfo
- (BOOL)isVisible;
- (PXGHostingLayerVisibilityInfo)init;
- (PXGHostingLayerVisibilityInfoDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setIsVisible:(BOOL)a3;
@end

@implementation PXGHostingLayerVisibilityInfo

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (PXGHostingLayerVisibilityInfoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGHostingLayerVisibilityInfoDelegate *)WeakRetained;
}

- (BOOL)isVisible
{
  return self->_isVisible;
}

- (void)setIsVisible:(BOOL)a3
{
  if (self->_isVisible != a3)
  {
    self->_isVisible = a3;
    id v4 = [(PXGHostingLayerVisibilityInfo *)self delegate];
    [v4 hostingLayerVisibilityInfoDidChange:self];
  }
}

- (PXGHostingLayerVisibilityInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXGHostingLayerVisibilityInfo;
  result = [(PXGHostingLayerVisibilityInfo *)&v3 init];
  if (result) {
    result->_isVisible = 1;
  }
  return result;
}

@end