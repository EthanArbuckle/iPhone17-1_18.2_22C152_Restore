@interface SMSessionStateTransitionDecision
- (BOOL)isAllowed;
- (SMSessionStateTransitionDecision)initWithIsAllowed:(BOOL)a3 actionBlock:(id)a4;
- (id)actionBlock;
- (void)setActionBlock:(id)a3;
- (void)setIsAllowed:(BOOL)a3;
@end

@implementation SMSessionStateTransitionDecision

- (SMSessionStateTransitionDecision)initWithIsAllowed:(BOOL)a3 actionBlock:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SMSessionStateTransitionDecision;
  v7 = [(SMSessionStateTransitionDecision *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_isAllowed = a3;
    uint64_t v9 = MEMORY[0x1E016DB00](v6);
    id actionBlock = v8->_actionBlock;
    v8->_id actionBlock = (id)v9;
  }
  return v8;
}

- (BOOL)isAllowed
{
  return self->_isAllowed;
}

- (void)setIsAllowed:(BOOL)a3
{
  self->_isAllowed = a3;
}

- (id)actionBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setActionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end