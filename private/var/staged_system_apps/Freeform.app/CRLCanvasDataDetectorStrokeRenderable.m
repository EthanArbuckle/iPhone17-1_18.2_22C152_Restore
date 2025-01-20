@interface CRLCanvasDataDetectorStrokeRenderable
- (CGRect)recognitionFrame;
- (void)setRecognitionFrame:(CGRect)a3;
@end

@implementation CRLCanvasDataDetectorStrokeRenderable

- (CGRect)recognitionFrame
{
  double x = self->_recognitionFrame.origin.x;
  double y = self->_recognitionFrame.origin.y;
  double width = self->_recognitionFrame.size.width;
  double height = self->_recognitionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRecognitionFrame:(CGRect)a3
{
  self->_recognitionFrame = a3;
}

@end