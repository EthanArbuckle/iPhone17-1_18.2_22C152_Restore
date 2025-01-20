@interface ICASDrawingTool
- (ICASDrawingTool)initWithDrawingTool:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)drawingTool;
@end

@implementation ICASDrawingTool

- (ICASDrawingTool)initWithDrawingTool:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASDrawingTool;
  result = [(ICASDrawingTool *)&v5 init];
  if (result) {
    result->_drawingTool = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASDrawingTool *)self drawingTool];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"pencil";
  }
  if (v3 == 2) {
    return @"finger";
  }
  else {
    return v4;
  }
}

- (int64_t)drawingTool
{
  return self->_drawingTool;
}

@end