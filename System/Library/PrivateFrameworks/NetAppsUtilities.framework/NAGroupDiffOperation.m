@interface NAGroupDiffOperation
+ (id)deleteOperationWithGroup:(id)a3 atIndex:(unint64_t)a4;
+ (id)insertOperationWithGroup:(id)a3 atIndex:(unint64_t)a4;
+ (id)moveOperationWithGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
- (BOOL)isEqual:(id)a3;
- (NADiffableItemGroup)group;
- (NAGroupDiffOperation)initWithOperationType:(unint64_t)a3 group:(id)a4 fromIndex:(id)a5 toIndex:(id)a6;
- (NSNumber)fromIndex;
- (NSNumber)toIndex;
- (NSString)description;
- (NSString)operationDescription;
- (id)_operationDescriptionWithVerboseType:(BOOL)a3;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation NAGroupDiffOperation

- (NAGroupDiffOperation)initWithOperationType:(unint64_t)a3 group:(id)a4 fromIndex:(id)a5 toIndex:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)NAGroupDiffOperation;
  v14 = [(NAGroupDiffOperation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong((id *)&v14->_group, a4);
    objc_storeStrong((id *)&v15->_fromIndex, a5);
    objc_storeStrong((id *)&v15->_toIndex, a6);
  }

  return v15;
}

+ (id)insertOperationWithGroup:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [NSNumber numberWithUnsignedInteger:a4];
  v9 = (void *)[v7 initWithOperationType:1 group:v6 fromIndex:0 toIndex:v8];

  return v9;
}

+ (id)deleteOperationWithGroup:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [NSNumber numberWithUnsignedInteger:a4];
  v9 = (void *)[v7 initWithOperationType:2 group:v6 fromIndex:v8 toIndex:0];

  return v9;
}

+ (id)moveOperationWithGroup:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc((Class)a1);
  v10 = [NSNumber numberWithUnsignedInteger:a4];
  id v11 = [NSNumber numberWithUnsignedInteger:a5];
  id v12 = (void *)[v9 initWithOperationType:3 group:v8 fromIndex:v10 toIndex:v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NAGroupDiffOperation *)a3;
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
      unint64_t v6 = [(NAGroupDiffOperation *)self type];
      if (v6 != [(NAGroupDiffOperation *)v5 type])
      {
        char v15 = 0;
LABEL_24:

        goto LABEL_25;
      }
      id v7 = [(NAGroupDiffOperation *)self group];
      id v8 = [(NAGroupDiffOperation *)v5 group];
      if (![v7 isEqual:v8])
      {
        char v15 = 0;
LABEL_23:

        goto LABEL_24;
      }
      id v9 = [(NAGroupDiffOperation *)self fromIndex];
      v10 = [(NAGroupDiffOperation *)v5 fromIndex];
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
      v16 = [(NAGroupDiffOperation *)self toIndex];
      objc_super v17 = [(NAGroupDiffOperation *)v5 toIndex];
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
  unint64_t v3 = [(NAGroupDiffOperation *)self type];
  v4 = [(NAGroupDiffOperation *)self group];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = [(NAGroupDiffOperation *)self fromIndex];
  uint64_t v7 = [v6 hash];
  id v8 = [(NAGroupDiffOperation *)self toIndex];
  unint64_t v9 = ((v7 << 8) ^ (v5 << 16) ^ [v8 hash]) + v3;

  return v9;
}

- (NSString)description
{
  unint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NAGroupDiffOperation *)self _operationDescriptionWithVerboseType:0];
  unint64_t v6 = [v3 stringWithFormat:@"<%@:%p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)operationDescription
{
  return (NSString *)[(NAGroupDiffOperation *)self _operationDescriptionWithVerboseType:1];
}

- (id)_operationDescriptionWithVerboseType:(BOOL)a3
{
  BOOL v3 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__NAGroupDiffOperation__operationDescriptionWithVerboseType___block_invoke;
  v13[3] = &unk_1E610A4D8;
  v13[4] = self;
  uint64_t v5 = __61__NAGroupDiffOperation__operationDescriptionWithVerboseType___block_invoke((uint64_t)v13);
  unint64_t v6 = [(NAGroupDiffOperation *)self type];
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
    uint64_t v7 = [(__CFString *)v7 stringByAppendingString:@" group"];
  }
LABEL_6:
  id v8 = NSString;
  unint64_t v9 = [(NAGroupDiffOperation *)self group];
  v10 = [v9 groupIdentifier];
  id v11 = [v8 stringWithFormat:@"%@ %@ \"%@\"", v7, v5, v10];

  return v11;
}

id __61__NAGroupDiffOperation__operationDescriptionWithVerboseType___block_invoke(uint64_t a1)
{
  unint64_t v3 = [*(id *)(a1 + 32) type];
  if (v3 < 2)
  {
    uint64_t v7 = [*(id *)(a1 + 32) toIndex];
LABEL_7:
    v1 = (void *)v7;
    goto LABEL_8;
  }
  if (v3 == 2)
  {
    uint64_t v7 = [*(id *)(a1 + 32) fromIndex];
    goto LABEL_7;
  }
  if (v3 == 3)
  {
    uint64_t v4 = NSString;
    uint64_t v5 = [*(id *)(a1 + 32) fromIndex];
    unint64_t v6 = [*(id *)(a1 + 32) toIndex];
    v1 = [v4 stringWithFormat:@"%@ -> %@", v5, v6];
  }
LABEL_8:
  return v1;
}

- (unint64_t)type
{
  return self->_type;
}

- (NADiffableItemGroup)group
{
  return self->_group;
}

- (NSNumber)fromIndex
{
  return self->_fromIndex;
}

- (NSNumber)toIndex
{
  return self->_toIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toIndex, 0);
  objc_storeStrong((id *)&self->_fromIndex, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end