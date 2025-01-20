@interface InvokeMakerInfo
- (InvokeMakerInfo)initWithSel:(SEL)a3 andTarget:(id)a4;
- (SEL)selector;
- (id)target;
- (void)setSelector:(SEL)a3;
- (void)setTarget:(id)a3;
@end

@implementation InvokeMakerInfo

- (InvokeMakerInfo)initWithSel:(SEL)a3 andTarget:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)InvokeMakerInfo;
  v7 = [(InvokeMakerInfo *)&v10 init];
  id target = v7->_target;
  v7->_selector = a3;
  v7->_id target = v6;

  return v7;
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (id)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end