@interface TRILockedFactorPackSet
+ (id)lockedSetWithFactorPackSetId:(id)a3 path:(id)a4 lock:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLockedSet:(id)a3;
- (NSString)path;
- (TRIFactorPackSetId)factorPackSetId;
- (TRILockedFactorPackSet)initWithFactorPackSetId:(id)a3 path:(id)a4 lock:(id)a5;
- (TRIReferenceManagedDirReaderLock)lock;
- (id)copyWithReplacementFactorPackSetId:(id)a3;
- (id)copyWithReplacementLock:(id)a3;
- (id)copyWithReplacementPath:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation TRILockedFactorPackSet

- (TRILockedFactorPackSet)initWithFactorPackSetId:(id)a3 path:(id)a4 lock:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1678, @"Invalid parameter not satisfying: %@", @"path != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1677, @"Invalid parameter not satisfying: %@", @"factorPackSetId != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"TRIClientTupleTypes.m", 1679, @"Invalid parameter not satisfying: %@", @"lock != nil" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)TRILockedFactorPackSet;
  v13 = [(TRILockedFactorPackSet *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_factorPackSetId, a3);
    objc_storeStrong((id *)&v14->_path, a4);
    objc_storeStrong((id *)&v14->_lock, a5);
  }

  return v14;
}

+ (id)lockedSetWithFactorPackSetId:(id)a3 path:(id)a4 lock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithFactorPackSetId:v10 path:v9 lock:v8];

  return v11;
}

- (id)copyWithReplacementFactorPackSetId:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorPackSetId:v4 path:self->_path lock:self->_lock];

  return v5;
}

- (id)copyWithReplacementPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorPackSetId:self->_factorPackSetId path:v4 lock:self->_lock];

  return v5;
}

- (id)copyWithReplacementLock:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFactorPackSetId:self->_factorPackSetId path:self->_path lock:v4];

  return v5;
}

- (BOOL)isEqualToLockedSet:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = self->_factorPackSetId != 0;
  v7 = [v4 factorPackSetId];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_11;
  }
  factorPackSetId = self->_factorPackSetId;
  if (factorPackSetId)
  {
    id v10 = [v5 factorPackSetId];
    int v11 = [(TRIFactorPackSetId *)factorPackSetId isEqual:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  int v12 = self->_path != 0;
  v13 = [v5 path];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_11;
  }
  path = self->_path;
  if (path)
  {
    v16 = [v5 path];
    int v17 = [(NSString *)path isEqual:v16];

    if (!v17) {
      goto LABEL_11;
    }
  }
  int v18 = self->_lock != 0;
  objc_super v19 = [v5 lock];
  int v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    char v23 = 0;
  }
  else
  {
    lock = self->_lock;
    if (lock)
    {
      v22 = [v5 lock];
      char v23 = [(TRIReferenceManagedDirReaderLock *)lock isEqual:v22];
    }
    else
    {
      char v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TRILockedFactorPackSet *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(TRILockedFactorPackSet *)self isEqualToLockedSet:v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(TRIFactorPackSetId *)self->_factorPackSetId hash];
  NSUInteger v4 = [(NSString *)self->_path hash] - v3 + 32 * v3;
  return [(TRIReferenceManagedDirReaderLock *)self->_lock hash] - v4 + 32 * v4;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<TRILockedFactorPackSet | factorPackSetId:%@ path:%@ lock:%@>", self->_factorPackSetId, self->_path, self->_lock];
  return v2;
}

- (TRIFactorPackSetId)factorPackSetId
{
  return self->_factorPackSetId;
}

- (NSString)path
{
  return self->_path;
}

- (TRIReferenceManagedDirReaderLock)lock
{
  return self->_lock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_factorPackSetId, 0);
}

@end