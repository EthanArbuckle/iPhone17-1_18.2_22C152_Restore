@interface RCUndoTarget
- (BOOL)shouldEnableSave;
- (RCUndoTarget)initWithUndoTargetType:(int64_t)a3;
- (int64_t)sizeOfUndoStack;
- (int64_t)targetType;
- (void)setShouldEnableSave:(BOOL)a3;
- (void)setSizeOfUndoStack:(int64_t)a3;
- (void)setTargetType:(int64_t)a3;
@end

@implementation RCUndoTarget

- (RCUndoTarget)initWithUndoTargetType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RCUndoTarget;
  result = [(RCUndoTarget *)&v5 init];
  if (result) {
    result->_targetType = a3;
  }
  return result;
}

- (int64_t)sizeOfUndoStack
{
  return self->_sizeOfUndoStack;
}

- (void)setSizeOfUndoStack:(int64_t)a3
{
  self->_sizeOfUndoStack = a3;
}

- (int64_t)targetType
{
  return self->_targetType;
}

- (void)setTargetType:(int64_t)a3
{
  self->_targetType = a3;
}

- (BOOL)shouldEnableSave
{
  return self->_shouldEnableSave;
}

- (void)setShouldEnableSave:(BOOL)a3
{
  self->_shouldEnableSave = a3;
}

@end