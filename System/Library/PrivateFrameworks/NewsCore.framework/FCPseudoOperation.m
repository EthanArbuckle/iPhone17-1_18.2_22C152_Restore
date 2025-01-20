@interface FCPseudoOperation
- (FCPseudoOperation)init;
- (FCPseudoOperation)initWithCancelBlock:(id)a3 priorityBlock:(id)a4;
- (FCPseudoOperation)initWithCancelBlock:(id)a3 priorityBlock:(id)a4 shortDescription:(id)a5 longDescription:(id)a6;
- (NSString)longOperationDescription;
- (NSString)shortOperationDescription;
- (id)cancelBlock;
- (id)priorityBlock;
- (int64_t)relativePriority;
- (void)cancel;
- (void)setCancelBlock:(id)a3;
- (void)setLongOperationDescription:(id)a3;
- (void)setPriorityBlock:(id)a3;
- (void)setRelativePriority:(int64_t)a3;
- (void)setShortOperationDescription:(id)a3;
@end

@implementation FCPseudoOperation

- (FCPseudoOperation)init
{
  return [(FCPseudoOperation *)self initWithCancelBlock:0 priorityBlock:0 shortDescription:0 longDescription:0];
}

- (FCPseudoOperation)initWithCancelBlock:(id)a3 priorityBlock:(id)a4 shortDescription:(id)a5 longDescription:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FCPseudoOperation;
  v14 = [(FCPseudoOperation *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    id cancelBlock = v14->_cancelBlock;
    v14->_id cancelBlock = (id)v15;

    uint64_t v17 = [v11 copy];
    id priorityBlock = v14->_priorityBlock;
    v14->_id priorityBlock = (id)v17;

    uint64_t v19 = [v12 copy];
    shortOperationDescription = v14->_shortOperationDescription;
    v14->_shortOperationDescription = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    longOperationDescription = v14->_longOperationDescription;
    v14->_longOperationDescription = (NSString *)v21;
  }
  return v14;
}

- (FCPseudoOperation)initWithCancelBlock:(id)a3 priorityBlock:(id)a4
{
  return [(FCPseudoOperation *)self initWithCancelBlock:a3 priorityBlock:a4 shortDescription:0 longDescription:0];
}

- (void)cancel
{
  v3 = [(FCPseudoOperation *)self cancelBlock];

  if (v3)
  {
    v4 = [(FCPseudoOperation *)self cancelBlock];
    v4[2]();
  }
}

- (void)setRelativePriority:(int64_t)a3
{
  if (self->_relativePriority != a3)
  {
    self->_relativePriority = a3;
    v5 = [(FCPseudoOperation *)self priorityBlock];

    if (v5)
    {
      v6 = [(FCPseudoOperation *)self priorityBlock];
      v6[2](v6, a3);
    }
  }
}

- (int64_t)relativePriority
{
  return self->_relativePriority;
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
}

- (NSString)shortOperationDescription
{
  return self->_shortOperationDescription;
}

- (void)setShortOperationDescription:(id)a3
{
}

- (NSString)longOperationDescription
{
  return self->_longOperationDescription;
}

- (void)setLongOperationDescription:(id)a3
{
}

- (id)priorityBlock
{
  return self->_priorityBlock;
}

- (void)setPriorityBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_priorityBlock, 0);
  objc_storeStrong((id *)&self->_longOperationDescription, 0);
  objc_storeStrong((id *)&self->_shortOperationDescription, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
}

@end