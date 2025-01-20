@interface NFStateMachineState
- (BOOL)canTry:(id)a3 withOwner:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NFStateMachineState)initWithName:(id)a3;
- (NSString)name;
- (id)canTryBlock;
- (id)description;
- (id)didEnter:(id)a3 withOwner:(id)a4;
- (id)didEnterBlock;
- (id)didExit:(id)a3 withOwner:(id)a4;
- (id)didExitBlock;
- (id)onCanTry:(id)a3;
- (id)onDidEnter:(id)a3;
- (id)onDidExit:(id)a3;
- (id)onWillEnter:(id)a3;
- (id)onWillExit:(id)a3;
- (id)willEnterBlock;
- (id)willExitBlock;
- (unint64_t)hash;
- (void)setCanTryBlock:(id)a3;
- (void)setDidEnterBlock:(id)a3;
- (void)setDidExitBlock:(id)a3;
- (void)setName:(id)a3;
- (void)setWillEnterBlock:(id)a3;
- (void)setWillExitBlock:(id)a3;
- (void)willEnter:(id)a3 withOwner:(id)a4;
- (void)willExit:(id)a3 withOwner:(id)a4;
@end

@implementation NFStateMachineState

- (id)onWillExit:(id)a3
{
  return self;
}

- (void)setWillExitBlock:(id)a3
{
}

- (id)onDidEnter:(id)a3
{
  return self;
}

- (void)setDidEnterBlock:(id)a3
{
}

- (id)onWillEnter:(id)a3
{
  return self;
}

- (void)setWillEnterBlock:(id)a3
{
}

- (NFStateMachineState)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFStateMachineState;
  v6 = [(NFStateMachineState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_name, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(NFStateMachineState *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)willExit:(id)a3 withOwner:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(NFStateMachineState *)self willExitBlock];

  if (v7)
  {
    v8 = [(NFStateMachineState *)self willExitBlock];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (void)willEnter:(id)a3 withOwner:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = [(NFStateMachineState *)self willEnterBlock];

  if (v7)
  {
    v8 = [(NFStateMachineState *)self willEnterBlock];
    ((void (**)(void, id, id))v8)[2](v8, v9, v6);
  }
}

- (id)willEnterBlock
{
  return self->_willEnterBlock;
}

- (BOOL)canTry:(id)a3 withOwner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NFStateMachineState *)self canTryBlock];

  if (v8)
  {
    id v9 = [(NFStateMachineState *)self canTryBlock];
    char v10 = ((uint64_t (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (id)willExitBlock
{
  return self->_willExitBlock;
}

- (id)canTryBlock
{
  return self->_canTryBlock;
}

- (id)didEnter:(id)a3 withOwner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NFStateMachineState *)self didEnterBlock];

  if (v8)
  {
    id v9 = [(NFStateMachineState *)self didEnterBlock];
    char v10 = ((void (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    char v10 = +[NFPromise asVoid];
  }

  return v10;
}

- (id)didEnterBlock
{
  return self->_didEnterBlock;
}

- (id)didExit:(id)a3 withOwner:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NFStateMachineState *)self didExitBlock];

  if (v8)
  {
    id v9 = [(NFStateMachineState *)self didExitBlock];
    char v10 = ((void (**)(void, id, id))v9)[2](v9, v6, v7);
  }
  else
  {
    char v10 = +[NFPromise asVoid];
  }

  return v10;
}

- (id)didExitBlock
{
  return self->_didExitBlock;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NFStateMachineState *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [(NFStateMachineState *)self name];
      id v7 = [(NFStateMachineState *)v5 name];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(NFStateMachineState *)self name];
  id v5 = [v3 stringWithFormat:@"{%p name=%@}", self, v4];

  return v5;
}

- (id)onCanTry:(id)a3
{
  return self;
}

- (id)onDidExit:(id)a3
{
  return self;
}

- (void)setName:(id)a3
{
}

- (void)setCanTryBlock:(id)a3
{
}

- (void)setDidExitBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didEnterBlock, 0);
  objc_storeStrong(&self->_didExitBlock, 0);
  objc_storeStrong(&self->_willEnterBlock, 0);
  objc_storeStrong(&self->_willExitBlock, 0);
  objc_storeStrong(&self->_canTryBlock, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end