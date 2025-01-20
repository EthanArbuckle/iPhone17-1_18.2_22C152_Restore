@interface RPTBlockInteraction
- (RPTBlockInteraction)initWithActions:(id)a3;
- (id)actionsComposer;
- (void)invokeWithComposer:(id)a3 duration:(double)a4;
- (void)setActionsComposer:(id)a3;
@end

@implementation RPTBlockInteraction

- (RPTBlockInteraction)initWithActions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPTBlockInteraction;
  v5 = [(RPTBlockInteraction *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1BA9B23F0](v4);
    id actionsComposer = v5->_actionsComposer;
    v5->_id actionsComposer = (id)v6;
  }
  return v5;
}

- (void)invokeWithComposer:(id)a3 duration:(double)a4
{
  id v5 = a3;
  uint64_t v6 = [(RPTBlockInteraction *)self actionsComposer];
  v6[2](v6, v5);
}

- (id)actionsComposer
{
  return self->_actionsComposer;
}

- (void)setActionsComposer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end