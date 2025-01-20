@interface BABlock
- (BABlock)initWithToken:(id)a3 block:(id)a4;
- (BOOL)blockFired;
- (BOOL)executeWithSuccessfulDequeue:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSUUID)token;
- (OS_dispatch_source)fireByTimer;
- (id)block;
- (unint64_t)hash;
- (void)setFireByTimer:(id)a3;
@end

@implementation BABlock

- (BABlock)initWithToken:(id)a3 block:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BABlock;
  v9 = [(BABlock *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_token, a3);
    id v11 = objc_retainBlock(v8);
    id block = v10->_block;
    v10->_id block = v11;

    fireByTimer = v10->_fireByTimer;
    v10->_fireByTimer = 0;
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (BABlock *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_5;
  }
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
    goto LABEL_7;
  }
  if ([(BABlock *)v4 isMemberOfClass:objc_opt_class()])
  {
    v6 = [(BABlock *)v5 token];
    id v7 = [(BABlock *)self token];
    unsigned __int8 v8 = [v6 isEqual:v7];
  }
  else
  {
LABEL_5:
    unsigned __int8 v8 = 0;
  }
LABEL_7:

  return v8;
}

- (unint64_t)hash
{
  v2 = [(BABlock *)self token];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)executeWithSuccessfulDequeue:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  unsigned __int8 v5 = [(BABlock *)v4 blockFired];
  if (v5)
  {
    objc_sync_exit(v4);
  }
  else
  {
    v4->_blockFired = 1;
    v6 = [(BABlock *)v4 fireByTimer];

    if (v6)
    {
      id v7 = [(BABlock *)v4 fireByTimer];
      dispatch_source_cancel(v7);
    }
    objc_sync_exit(v4);

    uint64_t v8 = [(BABlock *)v4 block];
    v9 = [(BABlock *)v4 token];
    (*(void (**)(uint64_t, BOOL, void *))(v8 + 16))(v8, v3, v9);

    v4 = (BABlock *)v8;
  }

  return v5 ^ 1;
}

- (id)block
{
  return self->_block;
}

- (NSUUID)token
{
  return self->_token;
}

- (OS_dispatch_source)fireByTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFireByTimer:(id)a3
{
}

- (BOOL)blockFired
{
  return self->_blockFired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireByTimer, 0);
  objc_storeStrong((id *)&self->_token, 0);

  objc_storeStrong(&self->_block, 0);
}

@end