@interface SFInfoFetchRequest
- (CGSize)iconSize;
- (id)infoResponseHandler;
- (void)setIconSize:(CGSize)a3;
- (void)setInfoResponseHandler:(id)a3;
@end

@implementation SFInfoFetchRequest

- (CGSize)iconSize
{
  double width = self->_iconSize.width;
  double height = self->_iconSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (id)infoResponseHandler
{
  return self->_infoResponseHandler;
}

- (void)setInfoResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end