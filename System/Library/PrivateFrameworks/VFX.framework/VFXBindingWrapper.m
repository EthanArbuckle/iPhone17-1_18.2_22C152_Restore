@interface VFXBindingWrapper
- (_TtP3VFX10VFXBinding_)binding;
- (int64_t)index;
- (signed)type;
- (void)dealloc;
- (void)setBinding:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setType:(signed __int16)a3;
@end

@implementation VFXBindingWrapper

- (void)dealloc
{
  objc_msgSend_setBinding_(self, a2, 0, v2);
  v4.receiver = self;
  v4.super_class = (Class)VFXBindingWrapper;
  [(VFXBindingWrapper *)&v4 dealloc];
}

- (_TtP3VFX10VFXBinding_)binding
{
  return self->binding;
}

- (void)setBinding:(id)a3
{
}

- (int64_t)index
{
  return self->index;
}

- (void)setIndex:(int64_t)a3
{
  self->index = a3;
}

- (signed)type
{
  return self->type;
}

- (void)setType:(signed __int16)a3
{
  self->type = a3;
}

@end