@interface SBFLazyObjectProvider
- (SBFLazyObjectProvider)initWithGenerator:(id)a3;
- (id)generator;
- (id)object;
- (void)setGenerator:(id)a3;
- (void)setObject:(id)a3;
@end

@implementation SBFLazyObjectProvider

- (SBFLazyObjectProvider)initWithGenerator:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFLazyObjectProvider;
  v5 = [(SBFLazyObjectProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id generator = v5->_generator;
    v5->_id generator = (id)v6;
  }
  return v5;
}

- (id)object
{
  object = (void (**)(id, SEL))self->_object;
  if (!object)
  {
    object = (void (**)(id, SEL))self->_generator;
    if (object)
    {
      id v4 = object[2](object, a2);
      id v5 = self->_object;
      self->_object = v4;

      object = (void (**)(id, SEL))self->_object;
    }
  }
  return object;
}

- (void)setObject:(id)a3
{
}

- (id)generator
{
  return self->_generator;
}

- (void)setGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_generator, 0);
  objc_storeStrong(&self->_object, 0);
}

@end