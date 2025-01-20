@interface SXRenderedBorders
@end

@implementation SXRenderedBorders

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
  objc_storeStrong((id *)&self->_bottom, 0);
  objc_storeStrong((id *)&self->_top, 0);
}

@end