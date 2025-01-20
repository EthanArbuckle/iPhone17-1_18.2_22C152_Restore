@interface PCSRegistryOperation
- (NSError)error;
- (NSString)operationUUID;
- (PCSRegistryOperation)init;
- (id)debugDescription;
- (id)description;
- (id)operationStateString;
- (id)pendingDependenciesString:(id)a3;
- selfname;
- (void)setError:(id)a3;
- (void)setOperationUUID:(id)a3;
@end

@implementation PCSRegistryOperation

- (PCSRegistryOperation)init
{
  v7.receiver = self;
  v7.super_class = (Class)PCSRegistryOperation;
  v2 = [(PCSRegistryOperation *)&v7 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    operationUUID = v2->_operationUUID;
    v2->_operationUUID = (NSString *)v4;
  }
  return v2;
}

- selfname
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t vars8;

  v3 = [(PCSRegistryOperation *)self name];

  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (v3)
  {
    v6 = [(PCSRegistryOperation *)self name];
    objc_super v7 = [(PCSRegistryOperation *)self operationUUID];
    v8 = +[NSString stringWithFormat:@"%@(%@,%@)", v5, v6, v7];
  }
  else
  {
    v6 = [(PCSRegistryOperation *)self operationUUID];
    v8 = +[NSString stringWithFormat:@"%@(%@)", v5, v6];
  }

  return v8;
}

- (id)operationStateString
{
  if ([(PCSRegistryOperation *)self isFinished])
  {
    v3 = @"finished ";
  }
  else if ([(PCSRegistryOperation *)self isCancelled])
  {
    v3 = @"cancelled";
  }
  else if ([(PCSRegistryOperation *)self isExecuting])
  {
    v3 = @"executing";
  }
  else if ([(PCSRegistryOperation *)self isReady])
  {
    v3 = @"ready";
  }
  else
  {
    v3 = @"pending";
  }

  return v3;
}

- (id)description
{
  v3 = [(PCSRegistryOperation *)self operationStateString];
  uint64_t v4 = [(PCSRegistryOperation *)self error];

  v5 = [(PCSRegistryOperation *)self selfname];
  if (v4)
  {
    v6 = [(PCSRegistryOperation *)self error];
    +[NSString stringWithFormat:@"<%@: %@ error:%@>", v5, v3, v6];
  }
  else
  {
    v6 = [(PCSRegistryOperation *)self pendingDependenciesString:@" dep:"];
    +[NSString stringWithFormat:@"<%@: %@%@>", v5, v3, v6];
  objc_super v7 = };

  return v7;
}

- (id)debugDescription
{
  v3 = [(PCSRegistryOperation *)self operationStateString];
  uint64_t v4 = [(PCSRegistryOperation *)self error];

  v5 = [(PCSRegistryOperation *)self selfname];
  if (v4)
  {
    v6 = [(PCSRegistryOperation *)self error];
    +[NSString stringWithFormat:@"<%@ (%p): %@ error:%@>", v5, self, v3, v6];
  }
  else
  {
    v6 = [(PCSRegistryOperation *)self pendingDependenciesString:@" dep:"];
    +[NSString stringWithFormat:@"<%@ (%p): %@%@>", v5, self, v3, v6];
  objc_super v7 = };

  return v7;
}

- (id)pendingDependenciesString:(id)a3
{
  id v4 = a3;
  v5 = [(PCSRegistryOperation *)self dependencies];
  id v6 = [v5 copy];

  objc_super v7 = [v6 indexesOfObjectsPassingTest:&stru_10001C838];
  v8 = [v6 objectsAtIndexes:v7];

  if ([v8 count])
  {
    v9 = [v8 componentsJoinedByString:@", "];
    v10 = +[NSString stringWithFormat:@"%@%@", v4, v9];
  }
  else
  {
    v10 = &stru_10001D108;
  }

  return v10;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void)setError:(id)a3
{
}

- (NSString)operationUUID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setOperationUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationUUID, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

@end