@interface MTLDebugFunctionHandle
- (MTLDebugFunctionHandle)initWithBaseObject:(id)a3 parent:(id)a4 function:(id)a5 stage:(unint64_t)a6;
- (unint64_t)stage;
@end

@implementation MTLDebugFunctionHandle

- (MTLDebugFunctionHandle)initWithBaseObject:(id)a3 parent:(id)a4 function:(id)a5 stage:(unint64_t)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MTLDebugFunctionHandle;
  result = [(MTLToolsFunctionHandle *)&v8 initWithBaseObject:a3 parent:a4 function:a5];
  if (result) {
    result->_stage = a6;
  }
  return result;
}

- (unint64_t)stage
{
  return self->_stage;
}

@end