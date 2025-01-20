@interface PETAggregateStateStorageInMemory
- (BOOL)resetLocked;
- (PETAggregateStateStorageInMemory)init;
- (void)dealloc;
- (void)expand:(unint64_t)a3 andRunWithLock:(id)a4;
- (void)reset;
@end

@implementation PETAggregateStateStorageInMemory

- (void).cxx_destruct
{
}

- (void)reset
{
  p_lock = &self->_lock;
  pthread_mutex_lock(&self->_lock);
  createBlankStorage();
  v4 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v4;

  pthread_mutex_unlock(p_lock);
}

- (BOOL)resetLocked
{
  createBlankStorage();
  v3 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  data = self->_data;
  self->_data = v3;

  return 1;
}

- (void)expand:(unint64_t)a3 andRunWithLock:(id)a4
{
  v7 = (uint64_t (**)(id, void *, NSUInteger, NSUInteger, unsigned char *))a4;
  if (!v7)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PETAggregateStateStorage.m", 106, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  pthread_mutex_lock(&self->_lock);
  if (a3)
  {
    NSUInteger v8 = [(NSMutableData *)self->_data length];
    [(NSMutableData *)self->_data increaseLengthBy:a3];
  }
  else
  {
    NSUInteger v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  char v13 = 0;
  char v9 = v7[2](v7, [(NSMutableData *)self->_data mutableBytes], [(NSMutableData *)self->_data length], v8, &v13);
  if (a3 && (v9 & 1) == 0) {
    -[NSMutableData replaceBytesInRange:withBytes:length:](self->_data, "replaceBytesInRange:withBytes:length:", [(NSMutableData *)self->_data length] - a3, a3, 0, 0);
  }
  if (v13)
  {
    createBlankStorage();
    v10 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    self->_data = v10;
  }
  pthread_mutex_unlock(&self->_lock);
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)PETAggregateStateStorageInMemory;
  [(PETAggregateStateStorageInMemory *)&v3 dealloc];
}

- (PETAggregateStateStorageInMemory)init
{
  v6.receiver = self;
  v6.super_class = (Class)PETAggregateStateStorageInMemory;
  v2 = [(PETAggregateStateStorageInMemory *)&v6 init];
  if (v2)
  {
    uint64_t v3 = createBlankStorage();
    data = v2->_data;
    v2->_data = (NSMutableData *)v3;

    pthread_mutex_init(&v2->_lock, 0);
  }
  return v2;
}

@end