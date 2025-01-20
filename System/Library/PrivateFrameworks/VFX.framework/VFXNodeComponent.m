@interface VFXNodeComponent
- (VFXNodeComponent)initWithType:(int64_t)a3 component:(id)a4;
- (VFXNodeComponent)next;
- (id)component;
- (int64_t)type;
- (void)setComponent:(id)a3;
- (void)setNext:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation VFXNodeComponent

- (VFXNodeComponent)initWithType:(int64_t)a3 component:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VFXNodeComponent;
  v7 = [(VFXNodeComponent *)&v14 init];
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setType_(v7, v8, a3, v9);
    objc_msgSend_setComponent_(v10, v11, (uint64_t)v6, v12);
  }

  return v10;
}

- (int64_t)type
{
  return self->type;
}

- (void)setType:(int64_t)a3
{
  self->type = a3;
}

- (id)component
{
  return self->component;
}

- (void)setComponent:(id)a3
{
}

- (VFXNodeComponent)next
{
  return self->next;
}

- (void)setNext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->next, 0);

  objc_storeStrong(&self->component, 0);
}

@end