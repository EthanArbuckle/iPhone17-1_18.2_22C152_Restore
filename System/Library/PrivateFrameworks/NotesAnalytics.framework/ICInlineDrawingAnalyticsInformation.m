@interface ICInlineDrawingAnalyticsInformation
- (int64_t)lastUsedTool;
- (unint64_t)endFingerStrokeCount;
- (unint64_t)endPencilStrokeCount;
- (unint64_t)startFingerStrokeCount;
- (unint64_t)startPencilStrokeCount;
- (void)setEndFingerStrokeCount:(unint64_t)a3;
- (void)setEndPencilStrokeCount:(unint64_t)a3;
- (void)setLastUsedTool:(int64_t)a3;
- (void)setStartFingerStrokeCount:(unint64_t)a3;
- (void)setStartPencilStrokeCount:(unint64_t)a3;
@end

@implementation ICInlineDrawingAnalyticsInformation

- (unint64_t)startFingerStrokeCount
{
  return self->_startFingerStrokeCount;
}

- (void)setStartFingerStrokeCount:(unint64_t)a3
{
  self->_startFingerStrokeCount = a3;
}

- (unint64_t)startPencilStrokeCount
{
  return self->_startPencilStrokeCount;
}

- (void)setStartPencilStrokeCount:(unint64_t)a3
{
  self->_startPencilStrokeCount = a3;
}

- (unint64_t)endFingerStrokeCount
{
  return self->_endFingerStrokeCount;
}

- (void)setEndFingerStrokeCount:(unint64_t)a3
{
  self->_endFingerStrokeCount = a3;
}

- (unint64_t)endPencilStrokeCount
{
  return self->_endPencilStrokeCount;
}

- (void)setEndPencilStrokeCount:(unint64_t)a3
{
  self->_endPencilStrokeCount = a3;
}

- (int64_t)lastUsedTool
{
  return self->_lastUsedTool;
}

- (void)setLastUsedTool:(int64_t)a3
{
  self->_lastUsedTool = a3;
}

@end