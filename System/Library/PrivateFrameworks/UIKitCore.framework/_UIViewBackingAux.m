@interface _UIViewBackingAux
@end

@implementation _UIViewBackingAux

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureGroupName, 0);
  objc_storeStrong((id *)&self->_effectHost, 0);
  objc_storeStrong((id *)&self->_allSubviewsCache, 0);
  objc_storeStrong((id *)&self->_privateSubviews, 0);
  objc_storeStrong((id *)&self->_intermediateLayerRetained, 0);
}

@end