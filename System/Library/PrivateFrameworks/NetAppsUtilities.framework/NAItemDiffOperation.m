@interface NAItemDiffOperation
+ (id)deleteOperationWithItem:(id)a3 atIndexPath:(id)a4;
+ (id)insertOperationWithItem:(id)a3 atIndexPath:(id)a4;
+ (id)moveOperationWithItem:(id)a3 fromIndexPath:(id)a4 toIndexPath:(id)a5;
+ (id)reloadOperationWithItem:(id)a3 atIndexPath:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NAItemDiffOperation)initWithOperationType:(unint64_t)a3 item:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6;
- (NSIndexPath)fromIndexPath;
- (NSIndexPath)toIndexPath;
- (NSString)description;
- (NSString)operationDescription;
- (id)_operationDescriptionWithVerboseType:(BOOL)a3;
- (id)item;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation NAItemDiffOperation

- (NAItemDiffOperation)initWithOperationType:(unint64_t)a3 item:(id)a4 fromIndexPath:(id)a5 toIndexPath:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)NAItemDiffOperation;
  v14 = [(NAItemDiffOperation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong(&v14->_item, a4);
    objc_storeStrong((id *)&v15->_fromIndexPath, a5);
    objc_storeStrong((id *)&v15->_toIndexPath, a6);
  }

  return v15;
}

+ (id)insertOperationWithItem:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithOperationType:1 item:v7 fromIndexPath:0 toIndexPath:v6];

  return v8;
}

+ (id)deleteOperationWithItem:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithOperationType:2 item:v7 fromIndexPath:v6 toIndexPath:0];

  return v8;
}

+ (id)moveOperationWithItem:(id)a3 fromIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithOperationType:3 item:v10 fromIndexPath:v9 toIndexPath:v8];

  return v11;
}

+ (id)reloadOperationWithItem:(id)a3 atIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithOperationType:0 item:v7 fromIndexPath:v6 toIndexPath:v6];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NAItemDiffOperation *)a3;
  if (self == v4)
  {
    char v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(NAItemDiffOperation *)self type];
      if (v6 != [(NAItemDiffOperation *)v5 type])
      {
        char v15 = 0;
LABEL_24:

        goto LABEL_25;
      }
      id v7 = [(NAItemDiffOperation *)self item];
      id v8 = [(NAItemDiffOperation *)v5 item];
      if (![v7 isEqual:v8])
      {
        char v15 = 0;
LABEL_23:

        goto LABEL_24;
      }
      id v9 = [(NAItemDiffOperation *)self fromIndexPath];
      id v10 = [(NAItemDiffOperation *)v5 fromIndexPath];
      id v11 = v9;
      id v12 = v10;
      id v13 = v12;
      if (v11 == v12)
      {
      }
      else
      {
        if (!v11)
        {
          char v15 = 0;
          id v18 = v12;
LABEL_21:

          goto LABEL_22;
        }
        int v14 = [v11 isEqual:v12];

        if (!v14)
        {
          char v15 = 0;
LABEL_22:

          goto LABEL_23;
        }
      }
      v16 = [(NAItemDiffOperation *)self toIndexPath];
      objc_super v17 = [(NAItemDiffOperation *)v5 toIndexPath];
      id v18 = v16;
      id v19 = v17;
      if (v18 == v19)
      {
        char v15 = 1;
      }
      else if (v18)
      {
        char v15 = [v18 isEqual:v19];
      }
      else
      {
        char v15 = 0;
      }

      goto LABEL_21;
    }
    char v15 = 0;
  }
LABEL_25:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NAItemDiffOperation *)self type];
  v4 = [(NAItemDiffOperation *)self item];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = [(NAItemDiffOperation *)self fromIndexPath];
  uint64_t v7 = [v6 hash];
  id v8 = [(NAItemDiffOperation *)self toIndexPath];
  unint64_t v9 = ((v7 << 8) ^ (v5 << 16) ^ [v8 hash]) + v3;

  return v9;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NAItemDiffOperation *)self _operationDescriptionWithVerboseType:0];
  unint64_t v6 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)operationDescription
{
  return (NSString *)[(NAItemDiffOperation *)self _operationDescriptionWithVerboseType:1];
}

- (id)_operationDescriptionWithVerboseType:(BOOL)a3
{
  BOOL v3 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__NAItemDiffOperation__operationDescriptionWithVerboseType___block_invoke;
  v12[3] = &unk_1E6109CE8;
  v12[4] = self;
  uint64_t v5 = __60__NAItemDiffOperation__operationDescriptionWithVerboseType___block_invoke((uint64_t)v12);
  unint64_t v6 = [(NAItemDiffOperation *)self type];
  if (v6 > 3)
  {
    uint64_t v7 = @"(unknown operation type)";
    if (!v3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v7 = off_1E610A4F8[v6];
  if (v3)
  {
LABEL_5:
    uint64_t v7 = [(__CFString *)v7 stringByAppendingString:@" item"];
  }
LABEL_6:
  id v8 = NSString;
  unint64_t v9 = [(NAItemDiffOperation *)self item];
  id v10 = [v8 stringWithFormat:@"%@ %@ \"%@\"", v7, v5, v9];

  return v10;
}

id __60__NAItemDiffOperation__operationDescriptionWithVerboseType___block_invoke(uint64_t a1)
{
  unint64_t v3 = [*(id *)(a1 + 32) type];
  if (v3 < 2)
  {
    unint64_t v9 = [*(id *)(a1 + 32) toIndexPath];
LABEL_7:
    uint64_t v5 = v9;
    v1 = _NAStandardIndexPathDescription(v9);
    goto LABEL_8;
  }
  if (v3 == 2)
  {
    unint64_t v9 = [*(id *)(a1 + 32) fromIndexPath];
    goto LABEL_7;
  }
  if (v3 != 3) {
    goto LABEL_9;
  }
  uint64_t v4 = NSString;
  uint64_t v5 = [*(id *)(a1 + 32) fromIndexPath];
  unint64_t v6 = _NAStandardIndexPathDescription(v5);
  uint64_t v7 = [*(id *)(a1 + 32) toIndexPath];
  id v8 = _NAStandardIndexPathDescription(v7);
  v1 = [v4 stringWithFormat:@"%@ -> %@", v6, v8];

LABEL_8:
LABEL_9:
  return v1;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)item
{
  return self->_item;
}

- (NSIndexPath)fromIndexPath
{
  return self->_fromIndexPath;
}

- (NSIndexPath)toIndexPath
{
  return self->_toIndexPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toIndexPath, 0);
  objc_storeStrong((id *)&self->_fromIndexPath, 0);
  objc_storeStrong(&self->_item, 0);
}

@end