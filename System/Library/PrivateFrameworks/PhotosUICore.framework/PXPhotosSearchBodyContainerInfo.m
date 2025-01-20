@interface PXPhotosSearchBodyContainerInfo
- (CGSize)containerSize;
- (id)containerSizeDidChange;
- (void)setContainerSize:(CGSize)a3;
- (void)setContainerSizeDidChange:(id)a3;
@end

@implementation PXPhotosSearchBodyContainerInfo

- (void).cxx_destruct
{
}

- (void)setContainerSizeDidChange:(id)a3
{
}

- (id)containerSizeDidChange
{
  return self->_containerSizeDidChange;
}

- (CGSize)containerSize
{
  double width = self->_containerSize.width;
  double height = self->_containerSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContainerSize:(CGSize)a3
{
  if (self->_containerSize.width != a3.width || self->_containerSize.height != a3.height)
  {
    self->_containerSize = a3;
    containerSizeDidChange = (void (**)(void))self->_containerSizeDidChange;
    if (containerSizeDidChange) {
      containerSizeDidChange[2]();
    }
  }
}

@end