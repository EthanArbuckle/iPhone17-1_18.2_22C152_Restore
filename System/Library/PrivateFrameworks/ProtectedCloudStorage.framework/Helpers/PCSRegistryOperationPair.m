@interface PCSRegistryOperationPair
- (PCSRegistryOperation)actualOperation;
- (PCSRegistryOperation)finishOperation;
- (id)description;
- (id)init:(id)a3 finish:(id)a4;
- (void)setActualOperation:(id)a3;
- (void)setFinishOperation:(id)a3;
@end

@implementation PCSRegistryOperationPair

- (id)init:(id)a3 finish:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PCSRegistryOperationPair;
  v9 = [(PCSRegistryOperationPair *)&v12 init];
  p_isa = (id *)&v9->super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actualOperation, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

- (id)description
{
  v3 = [(PCSRegistryOperationPair *)self actualOperation];
  v4 = [(PCSRegistryOperationPair *)self finishOperation];
  v5 = +[NSString stringWithFormat:@"<PCSRegistryOperationPair: %@, %@>", v3, v4];

  return v5;
}

- (PCSRegistryOperation)actualOperation
{
  return (PCSRegistryOperation *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActualOperation:(id)a3
{
}

- (PCSRegistryOperation)finishOperation
{
  return (PCSRegistryOperation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFinishOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOperation, 0);
  objc_storeStrong((id *)&self->_actualOperation, 0);
}

@end