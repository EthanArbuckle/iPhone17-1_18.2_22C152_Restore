@interface DMDBlockOperation
+ (id)blockOperationWithBlock:(id)a3;
- (id)block;
- (void)main;
- (void)setBlock:(id)a3;
@end

@implementation DMDBlockOperation

+ (id)blockOperationWithBlock:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  [v4 setBlock:v3];

  return v4;
}

- (void)main
{
  v4 = [(DMDBlockOperation *)self block];
  v4[2]();
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