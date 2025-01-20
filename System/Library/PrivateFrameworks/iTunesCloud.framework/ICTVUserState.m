@interface ICTVUserState
+ (BOOL)supportsSecureCoding;
- (BOOL)isActiveWatchKitUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFrozen;
- (ICTVUserState)initWithBlock:(id)a3;
- (ICTVUserState)initWithCoder:(id)a3;
- (NSString)description;
- (id)copyWithBlock:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveWatchKitUser:(BOOL)a3;
- (void)setFrozen:(BOOL)a3;
@end

@implementation ICTVUserState

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setActiveWatchKitUser:(BOOL)a3
{
  self->_activeWatchKitUser = a3;
}

- (BOOL)isActiveWatchKitUser
{
  return self->_activeWatchKitUser;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(ICTVUserState *)self isActiveWatchKitUser]) {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v4 = MEMORY[0x1E4F1CC28];
  }
  [v3 setObject:v4 forKeyedSubscript:@"activeWatchKitUser"];
  v5 = [NSString stringWithFormat:@"<%@: %p [%@]>", objc_opt_class(), self, v3];

  return (NSString *)v5;
}

- (ICTVUserState)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICTVUserState;
  v5 = [(ICTVUserState *)&v7 init];
  if (v5) {
    v5->_activeWatchKitUser = [v4 decodeBoolForKey:@"activeWatchKitUser"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICTVUserState *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = [(ICTVUserState *)self isActiveWatchKitUser];
      BOOL v7 = [(ICTVUserState *)v5 isActiveWatchKitUser];

      char v8 = v6 ^ v7 ^ 1;
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithBlock:(id)a3
{
  id v4 = a3;
  v5 = [ICTVUserState alloc];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__ICTVUserState_copyWithBlock___block_invoke;
  v9[3] = &unk_1E5AC9130;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  BOOL v7 = [(ICTVUserState *)v5 initWithBlock:v9];

  return v7;
}

uint64_t __31__ICTVUserState_copyWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 8) = *(unsigned char *)(*(void *)(a1 + 32) + 8);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (ICTVUserState)initWithBlock:(id)a3
{
  v5 = (void (**)(id, ICTVUserState *))a3;
  if (self->_frozen)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"ICTVUserState.m" lineNumber:24 description:@"ICTVUserState instance already exists"];
  }
  v9.receiver = self;
  v9.super_class = (Class)ICTVUserState;
  id v6 = [(ICTVUserState *)&v9 init];
  if (v6)
  {
    v5[2](v5, v6);
    v6->_frozen = 1;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end