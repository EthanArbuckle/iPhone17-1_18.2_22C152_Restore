@interface PCSCKKSOperationBlock
- (id)block;
- (void)setBlock:(id)a3;
- (void)start;
@end

@implementation PCSCKKSOperationBlock

- (void)start
{
  if ([(PCSCKKSOperation *)self startOperation])
  {
    [(PCSCKKSOperation *)self checkDependencies];
    v3 = [(PCSCKKSOperationBlock *)self block];
    v3[2](v3, 0);

    [(PCSCKKSOperation *)self completeOperation];
  }
  else
  {
    v5 = [(PCSCKKSOperationBlock *)self block];
    v4 = [(PCSCKKSOperation *)self error];
    v5[2](v5, v4);
  }
}

- (id)block
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end