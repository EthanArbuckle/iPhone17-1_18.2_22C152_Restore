@interface STBlockOperation
+ (id)blockOperationWithBlock:(id)a3;
- (id)block;
- (void)main;
- (void)setBlock:(id)a3;
@end

@implementation STBlockOperation

+ (id)blockOperationWithBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setBlock:v3];

  return v4;
}

- (void)main
{
  id v3 = [(STBlockOperation *)self block];
  v3[2]();

  [(STBlockOperation *)self endOperationWithResultObject:0];
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end