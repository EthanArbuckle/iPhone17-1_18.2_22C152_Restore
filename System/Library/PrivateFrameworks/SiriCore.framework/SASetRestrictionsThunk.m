@interface SASetRestrictionsThunk
- (SASetRestrictionsThunk)initWithThunk:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)siriCore_invokeThunk;
@end

@implementation SASetRestrictionsThunk

- (void).cxx_destruct
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id thunk = self->_thunk;

  return (id)[v4 initWithThunk:thunk];
}

- (void)siriCore_invokeThunk
{
  id thunk = (void (**)(id, SASetRestrictionsThunk *))self->_thunk;
  if (thunk)
  {
    thunk[2](thunk, self);
    id v4 = self->_thunk;
    self->_id thunk = 0;
  }
}

- (SASetRestrictionsThunk)initWithThunk:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASetRestrictionsThunk;
  v5 = [(SASetRestrictionsThunk *)&v9 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x21D4B91D0](v4);
    id thunk = v5->_thunk;
    v5->_id thunk = (id)v6;
  }
  return v5;
}

@end