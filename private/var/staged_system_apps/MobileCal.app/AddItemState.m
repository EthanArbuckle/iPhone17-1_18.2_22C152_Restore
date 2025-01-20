@interface AddItemState
- (AddItemState)initWithEvent:(id)a3;
- (BOOL)explicitTime;
- (EKEvent)event;
- (void)setExplicitTime:(BOOL)a3;
@end

@implementation AddItemState

- (AddItemState)initWithEvent:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AddItemState;
  v6 = [(AddItemState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_event, a3);
  }

  return v7;
}

- (EKEvent)event
{
  return self->_event;
}

- (BOOL)explicitTime
{
  return self->_explicitTime;
}

- (void)setExplicitTime:(BOOL)a3
{
  self->_explicitTime = a3;
}

- (void).cxx_destruct
{
}

@end