@interface SKGenericOperation
- (BOOL)run;
- (id)completionBlock;
- (void)setCompletionBlock:(id)a3;
@end

@implementation SKGenericOperation

- (BOOL)run
{
  v3 = [(SKGenericOperation *)self completionBlock];
  v3[2]();

  [(SKManagerOperation *)self finished];
  return 1;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end