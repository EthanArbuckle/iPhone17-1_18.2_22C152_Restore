@interface SVXSessionOperation
- (BOOL)handleOperationUsingActivationBlock:(id)a3 deactivationBlock:(id)a4;
- (SVXSessionOperation)initWithActivationContext:(id)a3 completion:(id)a4;
- (SVXSessionOperation)initWithDeactivationContext:(id)a3 completion:(id)a4;
- (id)description;
@end

@implementation SVXSessionOperation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deactivationCompletion, 0);
  objc_storeStrong((id *)&self->_deactivationContext, 0);
  objc_storeStrong(&self->_activationCompletion, 0);

  objc_storeStrong((id *)&self->_activationContext, 0);
}

- (BOOL)handleOperationUsingActivationBlock:(id)a3 deactivationBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  int64_t type = self->_type;
  if (type == 2)
  {
    if (v7)
    {
      uint64_t v10 = 40;
      uint64_t v11 = 32;
      goto LABEL_7;
    }
LABEL_8:
    BOOL v12 = 0;
    goto LABEL_9;
  }
  if (type != 1 || !v6) {
    goto LABEL_8;
  }
  uint64_t v10 = 24;
  uint64_t v11 = 16;
  id v7 = v6;
LABEL_7:
  (*((void (**)(id, void, void))v7 + 2))(v7, *(Class *)((char *)&self->super.isa + v11), *(Class *)((char *)&self->super.isa + v10));
  BOOL v12 = 1;
LABEL_9:

  return v12;
}

- (SVXSessionOperation)initWithDeactivationContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SVXSessionOperation;
  v8 = [(SVXSessionOperation *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_int64_t type = 2;
    uint64_t v10 = [v6 copy];
    deactivationContext = v9->_deactivationContext;
    v9->_deactivationContext = (SVXDeactivationContext *)v10;

    uint64_t v12 = [v7 copy];
    id deactivationCompletion = v9->_deactivationCompletion;
    v9->_id deactivationCompletion = (id)v12;
  }
  return v9;
}

- (SVXSessionOperation)initWithActivationContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SVXSessionOperation;
  v8 = [(SVXSessionOperation *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_int64_t type = 1;
    uint64_t v10 = [v6 copy];
    activationContext = v9->_activationContext;
    v9->_activationContext = (SVXActivationContext *)v10;

    uint64_t v12 = [v7 copy];
    id activationCompletion = v9->_activationCompletion;
    v9->_id activationCompletion = (id)v12;
  }
  return v9;
}

- (id)description
{
  int64_t type = self->_type;
  if (type == 2)
  {
    id v4 = [NSString alloc];
    v21.receiver = self;
    v21.super_class = (Class)SVXSessionOperation;
    v5 = [(SVXSessionOperation *)&v21 description];
    unint64_t v8 = self->_type;
    if (v8 > 2) {
      v9 = @"(unknown)";
    }
    else {
      v9 = off_264552F50[v8];
    }
    v13 = v9;
    v14 = v13;
    deactivationContext = self->_deactivationContext;
  }
  else
  {
    if (type != 1)
    {
      id v10 = [NSString alloc];
      v20.receiver = self;
      v20.super_class = (Class)SVXSessionOperation;
      v5 = [(SVXSessionOperation *)&v20 description];
      unint64_t v11 = self->_type;
      if (v11 > 2) {
        uint64_t v12 = @"(unknown)";
      }
      else {
        uint64_t v12 = off_264552F50[v11];
      }
      v14 = v12;
      v16 = [v10 initWithFormat:@"%@ {int64_t type = %@}", v5, v14, v19];
      goto LABEL_16;
    }
    id v4 = [NSString alloc];
    v22.receiver = self;
    v22.super_class = (Class)SVXSessionOperation;
    v5 = [(SVXSessionOperation *)&v22 description];
    unint64_t v6 = self->_type;
    if (v6 > 2) {
      id v7 = @"(unknown)";
    }
    else {
      id v7 = off_264552F50[v6];
    }
    v13 = v7;
    v14 = v13;
    deactivationContext = self->_activationContext;
  }
  v16 = [v4 initWithFormat:@"%@ {int64_t type = %@, context = %@}", v5, v13, deactivationContext];
LABEL_16:
  v17 = (void *)v16;

  return v17;
}

@end