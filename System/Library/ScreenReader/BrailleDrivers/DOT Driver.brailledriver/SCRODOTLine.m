@interface SCRODOTLine
- (NSData)data;
- (int64_t)canvasRow;
- (int64_t)type;
- (void)setCanvasRow:(int64_t)a3;
- (void)setData:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SCRODOTLine

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)canvasRow
{
  return self->_canvasRow;
}

- (void)setCanvasRow:(int64_t)a3
{
  self->_canvasRow = a3;
}

- (void).cxx_destruct
{
}

@end