@interface ICNSBlockOperation
+ (BOOL)_removesDependenciesAfterFinish;
- (BOOL)canCoalesceWithOperation:(id)a3;
- (BOOL)isProcessObjectsForContextDidSaveOperation;
@end

@implementation ICNSBlockOperation

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

- (BOOL)canCoalesceWithOperation:(id)a3
{
  v4 = [a3 name];
  v5 = [(ICNSBlockOperation *)self name];
  unsigned int v6 = 0;
  if (v5 && v4)
  {
    v7 = [(ICNSBlockOperation *)self name];
    unsigned int v6 = [v7 isEqualToString:v4];
  }
  if (([(ICNSBlockOperation *)self isFinished] & 1) != 0
    || ([(ICNSBlockOperation *)self isExecuting] & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    unsigned int v8 = v6 & ~[(ICNSBlockOperation *)self isCancelled];
  }

  return v8;
}

- (BOOL)isProcessObjectsForContextDidSaveOperation
{
  v3 = [(ICNSBlockOperation *)self name];
  if (v3)
  {
    v4 = [(ICNSBlockOperation *)self name];
    unsigned __int8 v5 = [v4 isEqualToString:ICNSBlockOperationNameProcessObjectsForContextDidSave];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

@end