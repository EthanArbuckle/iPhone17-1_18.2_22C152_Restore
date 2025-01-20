@interface MTLToolsFunctionHandle
- (MTLToolsFunction)function;
- (MTLToolsFunctionHandle)initWithBaseObject:(id)a3 parent:(id)a4 function:(id)a5;
- (NSString)name;
- (unint64_t)functionType;
- (void)dealloc;
@end

@implementation MTLToolsFunctionHandle

- (void)dealloc
{
  [(MTLToolsObjectCache *)self->super._device->functionHandleObjectCache removeKey:self->super._baseObject];

  v3.receiver = self;
  v3.super_class = (Class)MTLToolsFunctionHandle;
  [(MTLToolsObject *)&v3 dealloc];
}

- (MTLToolsFunctionHandle)initWithBaseObject:(id)a3 parent:(id)a4 function:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MTLToolsFunctionHandle;
  v6 = [(MTLToolsObject *)&v8 initWithBaseObject:a3 parent:a4];
  if (v6) {
    v6->_function = (MTLToolsFunction *)a5;
  }
  return v6;
}

- (unint64_t)functionType
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 functionType];
}

- (NSString)name
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (NSString *)[v2 name];
}

- (MTLToolsFunction)function
{
  return self->_function;
}

@end