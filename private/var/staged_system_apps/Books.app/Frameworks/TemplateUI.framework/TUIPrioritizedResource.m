@interface TUIPrioritizedResource
- (TUIPrioritizedResource)initWithResource:(id)a3 priority:(float)a4;
- (TUIResource)resource;
- (float)priority;
- (void)setPriority:(float)a3;
- (void)setResource:(id)a3;
@end

@implementation TUIPrioritizedResource

- (TUIPrioritizedResource)initWithResource:(id)a3 priority:(float)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIPrioritizedResource;
  v8 = [(TUIPrioritizedResource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_resource, a3);
    v9->_priority = a4;
  }

  return v9;
}

- (TUIResource)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
}

@end