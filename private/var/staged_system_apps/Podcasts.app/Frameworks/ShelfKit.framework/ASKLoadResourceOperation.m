@interface ASKLoadResourceOperation
- (id)outputBlock;
- (int64_t)_loadReason;
- (void)_setLoadReason:(int64_t)a3;
- (void)didCompleteWithResource:(id)a3 error:(id)a4;
- (void)main;
- (void)setOutputBlock:(id)a3;
@end

@implementation ASKLoadResourceOperation

- (void)didCompleteWithResource:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  uint64_t v7 = [(ASKLoadResourceOperation *)self outputBlock];
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v9, v6);
    [(ASKLoadResourceOperation *)self setOutputBlock:0];
  }
}

- (void)main
{
}

- (id)outputBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setOutputBlock:(id)a3
{
}

- (int64_t)_loadReason
{
  return self->__loadReason;
}

- (void)_setLoadReason:(int64_t)a3
{
  self->__loadReason = a3;
}

- (void).cxx_destruct
{
}

@end