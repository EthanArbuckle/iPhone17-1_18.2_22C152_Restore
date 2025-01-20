@interface ICASDrawingActionType
- (ICASDrawingActionType)initWithDrawingActionType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)drawingActionType;
@end

@implementation ICASDrawingActionType

- (ICASDrawingActionType)initWithDrawingActionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASDrawingActionType;
  result = [(ICASDrawingActionType *)&v5 init];
  if (result) {
    result->_drawingActionType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASDrawingActionType *)self drawingActionType];
  if ((unint64_t)(v3 - 1) > 2) {
    return @"unknown";
  }
  else {
    return *(&off_1E64B9120 + v3 - 1);
  }
}

- (int64_t)drawingActionType
{
  return self->_drawingActionType;
}

@end