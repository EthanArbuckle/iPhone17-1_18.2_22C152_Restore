@interface PETReservoirSamplingLogStoreInMemory
- ($BC5B52E09B2B7D90AC3928E0EFF6AC05)remap:(unint64_t *)a3;
- (BOOL)appendData:(id)a3 andReturnMapPointer:(id *)a4;
- (BOOL)attemptToRecreate;
- (BOOL)changeLength:(unint64_t)a3;
- (BOOL)lock;
- (PETReservoirSamplingLogStoreInMemory)init;
- (unint64_t)currentLength;
@end

@implementation PETReservoirSamplingLogStoreInMemory

- (void).cxx_destruct
{
}

- (BOOL)attemptToRecreate
{
  v3 = (NSMutableData *)objc_opt_new();
  data = self->_data;
  self->_data = v3;

  return 1;
}

- (BOOL)appendData:(id)a3 andReturnMapPointer:(id *)a4
{
  if (a4) {
    *a4 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)[(NSMutableData *)self->_data mutableBytes];
  }
  return 1;
}

- (BOOL)changeLength:(unint64_t)a3
{
  return 1;
}

- ($BC5B52E09B2B7D90AC3928E0EFF6AC05)remap:(unint64_t *)a3
{
  if (a3) {
    *a3 = [(NSMutableData *)self->_data length];
  }
  data = self->_data;

  return ($BC5B52E09B2B7D90AC3928E0EFF6AC05 *)[(NSMutableData *)data mutableBytes];
}

- (unint64_t)currentLength
{
  return [(NSMutableData *)self->_data length];
}

- (BOOL)lock
{
  return 1;
}

- (PETReservoirSamplingLogStoreInMemory)init
{
  v6.receiver = self;
  v6.super_class = (Class)PETReservoirSamplingLogStoreInMemory;
  v2 = [(PETReservoirSamplingLogStoreInMemory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;
  }
  return v2;
}

@end