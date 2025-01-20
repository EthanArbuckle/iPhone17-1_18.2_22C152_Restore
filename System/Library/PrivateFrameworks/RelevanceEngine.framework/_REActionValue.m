@interface _REActionValue
- (NSSet)uuids;
- (REDonatedAction)action;
- (_REActionValue)initWithAction:(id)a3;
- (void)addAction:(id)a3;
- (void)removeActionWithUUID:(id)a3;
@end

@implementation _REActionValue

- (_REActionValue)initWithAction:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_REActionValue;
  v6 = [(_REActionValue *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_action, a3);
    v8 = (void *)MEMORY[0x263EFF9C0];
    v9 = [v5 identifier];
    uint64_t v10 = [v8 setWithObject:v9];
    mutableUUIDs = v7->_mutableUUIDs;
    v7->_mutableUUIDs = (NSMutableSet *)v10;
  }
  return v7;
}

- (NSSet)uuids
{
  v2 = (void *)[(NSMutableSet *)self->_mutableUUIDs copy];
  return (NSSet *)v2;
}

- (void)addAction:(id)a3
{
  id v12 = a3;
  mutableUUIDs = self->_mutableUUIDs;
  v6 = [v12 identifier];
  [(NSMutableSet *)mutableUUIDs addObject:v6];

  v7 = [v12 creationDate];
  action = self->_action;
  p_action = &self->_action;
  uint64_t v10 = [(REDonatedAction *)action creationDate];
  uint64_t v11 = [v7 compare:v10];

  if (v11 == 1) {
    objc_storeStrong((id *)p_action, a3);
  }
}

- (void)removeActionWithUUID:(id)a3
{
}

- (REDonatedAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_mutableUUIDs, 0);
}

@end