@interface PETReservoirSamplingLog
- (BOOL)_lock;
- (BOOL)_readHeader;
- (PETReservoirSamplingLog)initWithPath:(id)a3 limit:(unint64_t)a4;
- (PETReservoirSamplingLog)initWithStore:(id)a3 limit:(unint64_t)a4;
- (id)initInMemoryWithLimit:(unint64_t)a3;
- (void)_clearLocked;
- (void)_enumerateItemsWithBlockLocked:(id)a3;
- (void)_gc;
- (void)_unlock;
- (void)clear;
- (void)dealloc;
- (void)enumerateAndClearItemsWithBlock:(id)a3;
- (void)enumerateItemsWithBlock:(id)a3;
- (void)log:(id)a3;
- (void)unlock;
@end

@implementation PETReservoirSamplingLog

- (void).cxx_destruct
{
}

- (void)unlock
{
}

- (void)enumerateAndClearItemsWithBlock:(id)a3
{
  id v4 = a3;
  if ([(PETReservoirSamplingLog *)self _lock])
  {
    [(PETReservoirSamplingLog *)self _enumerateItemsWithBlockLocked:v4];
    [(PETReservoirSamplingLog *)self _clearLocked];
    [(PETReservoirSamplingLog *)self _unlock];
  }
}

- (void)_clearLocked
{
  unint64_t v6 = 0;
  uint64_t v3 = [(PETReservoirSamplingLogStore *)self->_store remap:&v6];
  if (v3 && v6 >= 8 * (unint64_t)self->_limit + 16)
  {
    *(void *)(v3 + 8) = 0;
    uint64_t limit = self->_limit;
    if (limit)
    {
      memset((void *)(v3 + 16), 255, 8 * limit);
      uint64_t v5 = 8 * self->_limit + 16;
    }
    else
    {
      uint64_t v5 = 16;
    }
    [(PETReservoirSamplingLogStore *)self->_store changeLength:v5];
  }
}

- (void)clear
{
  if ([(PETReservoirSamplingLog *)self _lock])
  {
    [(PETReservoirSamplingLog *)self _clearLocked];
    [(PETReservoirSamplingLog *)self _unlock];
  }
}

- (void)_enumerateItemsWithBlockLocked:(id)a3
{
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  unint64_t v17 = 0;
  uint64_t v5 = [(PETReservoirSamplingLogStore *)self->_store remap:&v17];
  if (v5)
  {
    unint64_t limit = self->_limit;
    if (v17 >= 8 * limit + 16 && limit != 0)
    {
      uint64_t v8 = v5;
      unint64_t v9 = 0;
      v10 = MEMORY[0x1E4F14500];
      v11 = (unsigned int *)(v5 + 16);
      do
      {
        if (*v11 != -1)
        {
          v12 = (void *)MEMORY[0x192FD4890]();
          unsigned __int8 v16 = 0;
          if (v17 >= v11[1] + *v11)
          {
            v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v8 + *v11 length:v11[1] freeWhenDone:0];
            v4[2](v4, v13, &v16);
            int v14 = v16;

            if (v14)
            {
              break;
            }
          }
          else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v15 = 0;
            _os_log_error_impl(&dword_190C01000, v10, OS_LOG_TYPE_ERROR, "Out of bounds chunk", v15, 2u);
          }
          unint64_t limit = self->_limit;
        }
        ++v9;
        v11 += 2;
      }
      while (v9 < limit);
    }
  }
}

- (void)enumerateItemsWithBlock:(id)a3
{
  id v4 = a3;
  if ([(PETReservoirSamplingLog *)self _lock])
  {
    [(PETReservoirSamplingLog *)self _enumerateItemsWithBlockLocked:v4];
    [(PETReservoirSamplingLog *)self _unlock];
  }
}

- (void)_gc
{
  unint64_t v15 = 0;
  uint64_t v3 = [(PETReservoirSamplingLogStore *)self->_store remap:&v15];
  if (v3 && v15 >= 8 * (unint64_t)self->_limit + 16)
  {
    id v4 = (_DWORD *)v3;
    uint64_t v5 = (unsigned int *)(v3 + 16);
    qsort((void *)(v3 + 16), *(unsigned int *)(v3 + 4), 8uLL, (int (__cdecl *)(const void *, const void *))chunkCompareByOffset);
    unsigned int v6 = 8 * v4[1] + 16;
    LODWORD(limit) = self->_limit;
    if (limit)
    {
      unsigned int v8 = *v5;
      if (*v5 != -1)
      {
        unint64_t v9 = 0;
        v10 = v4 + 6;
        v11 = MEMORY[0x1E4F14500];
        do
        {
          size_t v12 = *(v10 - 1);
          if (v15 >= v12 + v8)
          {
            memmove((char *)v4 + v6, (char *)v4 + v8, v12);
            *(v10 - 2) = v6;
            v6 += *(v10 - 1);
          }
          else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)int v14 = 0;
            _os_log_error_impl(&dword_190C01000, v11, OS_LOG_TYPE_ERROR, "Out of bounds chunk", v14, 2u);
          }
          ++v9;
          unint64_t limit = self->_limit;
          if (v9 >= limit) {
            break;
          }
          unsigned int v13 = *v10;
          v10 += 2;
          unsigned int v8 = v13;
        }
        while (v13 != -1);
      }
    }
    v4[2] = limit;
    [(PETReservoirSamplingLogStore *)self->_store changeLength:v6];
  }
}

- (void)log:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PETReservoirSamplingLog *)self _lock])
  {
    unint64_t v26 = 0;
    uint64_t v5 = [(PETReservoirSamplingLogStore *)self->_store headerMap:&v26];
    uint64_t v25 = v5;
    if (v5 && v26 >= 8 * (unint64_t)self->_limit + 16)
    {
      unsigned int v6 = *(_DWORD *)(v5 + 12);
      unint64_t v7 = v6 + 1;
      *(_DWORD *)(v5 + 12) = v7;
      unsigned int limit = self->_limit;
      if (v6 < limit)
      {
        int v9 = [(PETReservoirSamplingLogStore *)self->_store currentLength];
        if ([(PETReservoirSamplingLogStore *)self->_store appendData:v4 andReturnMapPointer:&v25])
        {
          if (v25)
          {
            *(_DWORD *)(v25 + 8 * *(unsigned int *)(v25 + 8) + 16) = v9;
            int v10 = [v4 length];
            uint64_t v11 = v25;
            uint64_t v12 = *(unsigned int *)(v25 + 8);
            *(_DWORD *)(v25 + 8 * v12 + 20) = v10;
            *(_DWORD *)(v11 + 8) = v12 + 1;
          }
          goto LABEL_15;
        }
LABEL_13:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          int v22 = *__error();
          v23 = __error();
          v24 = strerror(*v23);
          *(_DWORD *)buf = 67109378;
          int v28 = v22;
          __int16 v29 = 2080;
          v30 = v24;
          _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not append: [%i] %s", buf, 0x12u);
        }
        goto LABEL_15;
      }
      unint64_t v13 = self->_rng.s[0];
      unint64_t v14 = self->_rng.s[1];
      unint64_t v15 = v14 + v13;
      unint64_t v16 = v14 ^ v13;
      self->_rng.s[0] = __ROR8__(v13, 9) ^ (v16 << 14) ^ v16;
      self->_rng.s[1] = __ROR8__(v16, 28);
      unint64_t v17 = v15 % v7;
      if (limit > (v15 % v7))
      {
        int v18 = [(PETReservoirSamplingLogStore *)self->_store currentLength];
        if ([(PETReservoirSamplingLogStore *)self->_store appendData:v4 andReturnMapPointer:&v25])
        {
          if (v25)
          {
            *(_DWORD *)(v25 + 8 * v17 + 16) = v18;
            int v19 = [v4 length];
            uint64_t v20 = v25;
            *(_DWORD *)(v25 + 8 * v17 + 20) = v19;
            unsigned int v21 = *(_DWORD *)(v20 + 8) + 1;
            *(_DWORD *)(v20 + 8) = v21;
            if (v21 > 2 * self->_limit) {
              [(PETReservoirSamplingLog *)self _gc];
            }
          }
          goto LABEL_15;
        }
        goto LABEL_13;
      }
    }
LABEL_15:
    [(PETReservoirSamplingLog *)self _unlock];
  }
}

- (void)_unlock
{
  [(PETReservoirSamplingLogStore *)self->_store unlock];

  pthread_mutex_unlock(&self->_lock);
}

- (BOOL)_lock
{
  pthread_mutex_lock(&self->_lock);
  store = self->_store;

  return [(PETReservoirSamplingLogStore *)store lock];
}

- (BOOL)_readHeader
{
  if ([(PETReservoirSamplingLog *)self _lock])
  {
    uint64_t v3 = [(PETReservoirSamplingLogStore *)self->_store currentLength];
    unint64_t v12 = 0;
    store = self->_store;
    if (v3)
    {
      uint64_t v5 = (void *)[(PETReservoirSamplingLogStore *)store remap:&v12];
      if (v5)
      {
        uint64_t limit = self->_limit;
        if (v12 >= 8 * limit + 16 && *v5 == __PAIR64__(limit, -1014632835))
        {
LABEL_13:
          BOOL v7 = 1;
LABEL_15:
          [(PETReservoirSamplingLog *)self _unlock];
          return v7;
        }
      }
    }
    else if ([(PETReservoirSamplingLogStore *)store changeLength:8 * self->_limit + 16])
    {
      uint64_t v8 = [(PETReservoirSamplingLogStore *)self->_store remap:&v12];
      if (v8)
      {
        if (v12 == 8 * self->_limit + 16)
        {
          *(_DWORD *)uint64_t v8 = -1014632835;
          unsigned int v9 = self->_limit;
          *(void *)(v8 + 8) = 0;
          *(_DWORD *)(v8 + 4) = v9;
          uint64_t v10 = self->_limit;
          if (v10) {
            memset((void *)(v8 + 16), 255, 8 * v10);
          }
          goto LABEL_13;
        }
      }
    }
    BOOL v7 = 0;
    goto LABEL_15;
  }
  return 0;
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)PETReservoirSamplingLog;
  [(PETReservoirSamplingLog *)&v3 dealloc];
}

- (id)initInMemoryWithLimit:(unint64_t)a3
{
  uint64_t v5 = objc_opt_new();
  unsigned int v6 = [(PETReservoirSamplingLog *)self initWithStore:v5 limit:a3];

  return v6;
}

- (PETReservoirSamplingLog)initWithPath:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = [[PETReservoirSamplingLogStoreFile alloc] initWithPath:v6];

  uint64_t v8 = [(PETReservoirSamplingLog *)self initWithStore:v7 limit:a4];
  return v8;
}

- (PETReservoirSamplingLog)initWithStore:(id)a3 limit:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unsigned int v9 = v8;
  if (a4 - 0xFFFFFFFF > 0xFFFFFFFF00000001)
  {
    if (v8) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v11 = 0;
    goto LABEL_13;
  }
  unint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PETReservoirSamplingLog.m", 236, @"Invalid parameter not satisfying: %@", @"limit > 0 && limit < UINT32_MAX" object file lineNumber description];

  if (!v9) {
    goto LABEL_12;
  }
LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PETReservoirSamplingLog;
  uint64_t v10 = [(PETReservoirSamplingLog *)&v16 init];
  self = v10;
  if (v10)
  {
    pthread_mutex_init(&v10->_lock, 0);
    objc_storeStrong((id *)&self->_store, a3);
    self->_uint64_t limit = a4;
    self->_rng = ($FEF0A0984D2795EAE1E2AD40E2F6E7E6)xmmword_190C2D900;
    if (![(PETReservoirSamplingLog *)self _readHeader])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        unint64_t v13 = (objc_class *)objc_opt_class();
        unint64_t v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138412290;
        int v18 = v14;
        _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error reading %@ header, emptying log", buf, 0xCu);
      }
      if (![(PETReservoirSamplingLogStore *)self->_store attemptToRecreate]
        || ![(PETReservoirSamplingLog *)self _readHeader])
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_190C01000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Could not empty log", buf, 2u);
        }
        goto LABEL_12;
      }
    }
  }
  self = self;
  uint64_t v11 = self;
LABEL_13:

  return v11;
}

@end