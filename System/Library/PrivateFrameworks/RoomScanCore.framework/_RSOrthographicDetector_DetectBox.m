@interface _RSOrthographicDetector_DetectBox
- (id)description;
@end

@implementation _RSOrthographicDetector_DetectBox

- (id)description
{
  float x = self->_box.origin.x;
  float y = self->_box.origin.y;
  float width = self->_box.size.width;
  float height = self->_box.size.height;
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"<_RSOrthographicDetector_DetectBox %p> { origin = < %.2f , %.2f > size = < %.2f x %.2f> }", self, x, y, width, height);
}

@end