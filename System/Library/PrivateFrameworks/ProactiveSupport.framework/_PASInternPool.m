@interface _PASInternPool
- (BOOL)isEmpty;
- (BOOL)isInterned:(id)a3;
- (_PASInternPool)init;
- (_PASInternPool)initWithBehavior:(unint64_t)a3 copyWithZone:(id)a4;
- (id)_intern:(char)a3 copyInput:;
- (id)intern:(id)a3;
- (id)internNoCopy:(id)a3;
- (void)clear;
@end

@implementation _PASInternPool

- (id)intern:(id)a3
{
  return -[_PASInternPool _intern:copyInput:]((uint64_t)self, a3, 1);
}

- (_PASInternPool)initWithBehavior:(unint64_t)a3 copyWithZone:(id)a4
{
  id v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_PASInternPool;
  v7 = [(_PASInternPool *)&v17 init];
  v8 = v7;
  if (v7)
  {
    if (a3 == 1) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = 5;
    }
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28D30], "allocWithZone:", -[_PASZonedObject allocationZone](v7, "allocationZone")), "initWithOptions:capacity:", v9, 0);
    v11 = [[_PASLock alloc] initWithGuardedData:v10];
    lock = v8->_lock;
    v8->_lock = v11;

    if (v6) {
      v13 = v6;
    }
    else {
      v13 = &__block_literal_global_2144;
    }
    uint64_t v14 = MEMORY[0x1A6245320](v13);
    id copyWithZone = v8->_copyWithZone;
    v8->_id copyWithZone = (id)v14;
  }
  return v8;
}

- (id)_intern:(char)a3 copyInput:
{
  id v5 = a2;
  id v6 = v5;
  id v7 = 0;
  if (a1 && v5)
  {
    if (malloc_size(v5))
    {
      v8 = (void *)MEMORY[0x1A62450A0]();
      uint64_t v16 = 0;
      objc_super v17 = &v16;
      uint64_t v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__2138;
      v20 = __Block_byref_object_dispose__2139;
      id v21 = 0;
      uint64_t v9 = *(void **)(a1 + 8);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __36___PASInternPool__intern_copyInput___block_invoke;
      v11[3] = &unk_1E5AEAF50;
      uint64_t v13 = a1;
      uint64_t v14 = &v16;
      char v15 = a3;
      id v12 = v6;
      [v9 runWithLockAcquired:v11];
      id v7 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      id v7 = v6;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_copyWithZone, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)clear
{
  v3 = (void *)MEMORY[0x1A62450A0](self, a2);
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_4];
}

- (BOOL)isEmpty
{
  v2 = self;
  v3 = (void *)MEMORY[0x1A62450A0](self, a2);
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  lock = v2->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25___PASInternPool_isEmpty__block_invoke;
  v6[3] = &unk_1E5AEAFA0;
  v6[4] = &v7;
  [(_PASLock *)lock runWithLockAcquired:v6];
  LOBYTE(v2) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

- (BOOL)isInterned:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    if (malloc_size(v4))
    {
      id v6 = (void *)MEMORY[0x1A62450A0]();
      uint64_t v13 = 0;
      uint64_t v14 = &v13;
      uint64_t v15 = 0x2020000000;
      char v16 = 0;
      lock = self->_lock;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __29___PASInternPool_isInterned___block_invoke;
      v10[3] = &unk_1E5AEAF78;
      id v12 = &v13;
      id v11 = v5;
      [(_PASLock *)lock runWithLockAcquired:v10];
      BOOL v8 = *((unsigned char *)v14 + 24) != 0;

      _Block_object_dispose(&v13, 8);
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (id)internNoCopy:(id)a3
{
  return -[_PASInternPool _intern:copyInput:]((uint64_t)self, a3, 0);
}

- (_PASInternPool)init
{
  return [(_PASInternPool *)self initWithBehavior:0 copyWithZone:0];
}

@end