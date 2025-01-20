@interface PPFixup49995922Tuple
+ (id)tupleWithRowid:(int64_t)a3 record:(id)a4 dkUUID:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTuple:(id)a3;
- (NSObject)record;
- (NSUUID)dkUUID;
- (PPFixup49995922Tuple)initWithRowid:(int64_t)a3 record:(id)a4 dkUUID:(id)a5;
- (int64_t)rowid;
- (unint64_t)hash;
@end

@implementation PPFixup49995922Tuple

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dkUUID, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

- (NSUUID)dkUUID
{
  return self->_dkUUID;
}

- (NSObject)record
{
  return self->_record;
}

- (int64_t)rowid
{
  return self->_rowid;
}

- (unint64_t)hash
{
  int64_t rowid = self->_rowid;
  uint64_t v4 = [self->_record hash] - rowid + 32 * rowid;
  return [(NSUUID *)self->_dkUUID hash] - v4 + 32 * v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PPFixup49995922Tuple *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPFixup49995922Tuple *)self isEqualToTuple:v5];

  return v6;
}

- (BOOL)isEqualToTuple:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  int64_t rowid = self->_rowid;
  if (rowid != [v4 rowid]) {
    goto LABEL_9;
  }
  int v7 = self->_record != 0;
  v8 = [v5 record];
  int v9 = v8 == 0;

  if (v7 == v9) {
    goto LABEL_9;
  }
  record = self->_record;
  if (record)
  {
    v11 = [v5 record];
    int v12 = [record isEqual:v11];

    if (!v12) {
      goto LABEL_9;
    }
  }
  int v13 = self->_dkUUID != 0;
  v14 = [v5 dkUUID];
  int v15 = v14 == 0;

  if (v13 == v15)
  {
LABEL_9:
    char v18 = 0;
  }
  else
  {
    dkUUID = self->_dkUUID;
    if (dkUUID)
    {
      v17 = [v5 dkUUID];
      char v18 = [(NSUUID *)dkUUID isEqual:v17];
    }
    else
    {
      char v18 = 1;
    }
  }

  return v18;
}

- (PPFixup49995922Tuple)initWithRowid:(int64_t)a3 record:(id)a4 dkUUID:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    int v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PPFixup49995922Tuple.m", 11, @"Invalid parameter not satisfying: %@", @"record" object file lineNumber description];
  }
  v16.receiver = self;
  v16.super_class = (Class)PPFixup49995922Tuple;
  int v12 = [(PPFixup49995922Tuple *)&v16 init];
  int v13 = v12;
  if (v12)
  {
    v12->_int64_t rowid = a3;
    objc_storeStrong((id *)&v12->_record, a4);
    objc_storeStrong((id *)&v13->_dkUUID, a5);
  }

  return v13;
}

+ (id)tupleWithRowid:(int64_t)a3 record:(id)a4 dkUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = (void *)[objc_alloc((Class)a1) initWithRowid:a3 record:v9 dkUUID:v8];

  return v10;
}

@end