@interface PMLLabelLimitRowId
+ (id)labelLimitRowIdWithLabel:(id)a3 limit:(int64_t)a4 rowId:(int64_t)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLabelLimitRowId:(id)a3;
- (NSString)label;
- (PMLLabelLimitRowId)initWithLabel:(id)a3 limit:(int64_t)a4 rowId:(int64_t)a5;
- (int64_t)limit;
- (int64_t)rowId;
- (unint64_t)hash;
@end

@implementation PMLLabelLimitRowId

- (void).cxx_destruct
{
}

- (int64_t)rowId
{
  return self->_rowId;
}

- (int64_t)limit
{
  return self->_limit;
}

- (NSString)label
{
  return self->_label;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  v4 = [NSNumber numberWithInteger:self->_limit];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  v6 = [NSNumber numberWithInteger:self->_rowId];
  unint64_t v7 = [v6 hash] - v5 + 32 * v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PMLLabelLimitRowId *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PMLLabelLimitRowId *)self isEqualToLabelLimitRowId:v5];

  return v6;
}

- (BOOL)isEqualToLabelLimitRowId:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_7;
  }
  int v6 = self->_label != 0;
  unint64_t v7 = [v4 label];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_7;
  }
  label = self->_label;
  if (label)
  {
    v10 = [v5 label];
    int v11 = [(NSString *)label isEqual:v10];

    if (!v11) {
      goto LABEL_7;
    }
  }
  int64_t limit = self->_limit;
  if (limit == [v5 limit])
  {
    int64_t rowId = self->_rowId;
    BOOL v14 = rowId == [v5 rowId];
  }
  else
  {
LABEL_7:
    BOOL v14 = 0;
  }

  return v14;
}

- (PMLLabelLimitRowId)initWithLabel:(id)a3 limit:(int64_t)a4 rowId:(int64_t)a5
{
  id v10 = a3;
  if (v10)
  {
    if ((a4 & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_8:
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PMLLabelLimitRowId.m", 11, @"Invalid parameter not satisfying: %@", @"limit >= 0" object file lineNumber description];

    if ((a5 & 0x8000000000000000) == 0) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  BOOL v14 = [MEMORY[0x263F08690] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"PMLLabelLimitRowId.m", 10, @"Invalid parameter not satisfying: %@", @"label" object file lineNumber description];

  if (a4 < 0) {
    goto LABEL_8;
  }
LABEL_3:
  if ((a5 & 0x8000000000000000) == 0) {
    goto LABEL_4;
  }
LABEL_9:
  v16 = [MEMORY[0x263F08690] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PMLLabelLimitRowId.m", 12, @"Invalid parameter not satisfying: %@", @"rowId >= 0" object file lineNumber description];

LABEL_4:
  v17.receiver = self;
  v17.super_class = (Class)PMLLabelLimitRowId;
  int v11 = [(PMLLabelLimitRowId *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_label, a3);
    v12->_int64_t limit = a4;
    v12->_int64_t rowId = a5;
  }

  return v12;
}

+ (id)labelLimitRowIdWithLabel:(id)a3 limit:(int64_t)a4 rowId:(int64_t)a5
{
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithLabel:v8 limit:a4 rowId:a5];

  return v9;
}

@end