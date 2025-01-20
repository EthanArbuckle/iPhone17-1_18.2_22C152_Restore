@interface PSSpecifierUpdateOperation
+ (id)_removeOneSpecifierOnlyOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4;
+ (id)insertOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4;
+ (id)moveOperationWithSpecifier:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5;
+ (id)reloadOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4;
+ (id)removeOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4;
- (BOOL)applyToArray:(id)a3;
- (BOOL)removingGroupSpecifierRemovesEntireGroup;
- (NSNumber)index;
- (NSNumber)toIndex;
- (PSSpecifier)specifier;
- (PSSpecifierUpdateOperation)initWithOperation:(int64_t)a3 specifier:(id)a4 fromIndex:(id)a5 toIndex:(id)a6;
- (PSSpecifierUpdateOperation)initWithOperation:(int64_t)a3 specifier:(id)a4 fromIndex:(id)a5 toIndex:(id)a6 removingGroupSpecifierRemovesEntireGroup:(BOOL)a7;
- (PSSpecifierUpdateOperation)initWithOperation:(int64_t)a3 specifier:(id)a4 index:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)operation;
- (void)setIndex:(id)a3;
- (void)setRemovingGroupSpecifierRemovesEntireGroup:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)setToIndex:(id)a3;
@end

@implementation PSSpecifierUpdateOperation

+ (id)insertOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  v9 = (void *)[v7 initWithOperation:1 specifier:v6 index:v8];

  return v9;
}

+ (id)reloadOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  v9 = (void *)[v7 initWithOperation:3 specifier:v6 index:v8];

  return v9;
}

+ (id)removeOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  v9 = (void *)[v7 initWithOperation:4 specifier:v6 index:v8];

  return v9;
}

+ (id)_removeOneSpecifierOnlyOperationWithSpecifier:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  v9 = (void *)[v7 initWithOperation:4 specifier:v6 fromIndex:v8 toIndex:0 removingGroupSpecifierRemovesEntireGroup:0];

  return v9;
}

+ (id)moveOperationWithSpecifier:(id)a3 fromIndex:(unint64_t)a4 toIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc((Class)a1);
  v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
  v11 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a5];
  v12 = (void *)[v9 initWithOperation:2 specifier:v8 fromIndex:v10 toIndex:v11];

  return v12;
}

- (PSSpecifierUpdateOperation)initWithOperation:(int64_t)a3 specifier:(id)a4 index:(id)a5
{
  return [(PSSpecifierUpdateOperation *)self initWithOperation:a3 specifier:a4 fromIndex:a5 toIndex:0];
}

- (PSSpecifierUpdateOperation)initWithOperation:(int64_t)a3 specifier:(id)a4 fromIndex:(id)a5 toIndex:(id)a6
{
  return [(PSSpecifierUpdateOperation *)self initWithOperation:a3 specifier:a4 fromIndex:a5 toIndex:a6 removingGroupSpecifierRemovesEntireGroup:1];
}

- (PSSpecifierUpdateOperation)initWithOperation:(int64_t)a3 specifier:(id)a4 fromIndex:(id)a5 toIndex:(id)a6 removingGroupSpecifierRemovesEntireGroup:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PSSpecifierUpdateOperation;
  v16 = [(PSSpecifierUpdateOperation *)&v19 init];
  v17 = v16;
  if (v16)
  {
    v16->_operation = a3;
    objc_storeStrong((id *)&v16->_specifier, a4);
    objc_storeStrong((id *)&v17->_index, a5);
    objc_storeStrong((id *)&v17->_toIndex, a6);
    [(PSSpecifierUpdateOperation *)v17 setRemovingGroupSpecifierRemovesEntireGroup:v7];
  }

  return v17;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  int64_t operation = self->_operation;
  specifier = self->_specifier;
  index = self->_index;
  toIndex = self->_toIndex;
  return (id)[v4 initWithOperation:operation specifier:specifier fromIndex:index toIndex:toIndex];
}

- (id)description
{
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __41__PSSpecifierUpdateOperation_description__block_invoke;
  v17 = &unk_1E5C5F7D8;
  v18 = self;
  unint64_t operation = self->_operation;
  if (operation > 4) {
    v4 = @"***Unknown Operation***";
  }
  else {
    v4 = *(&off_1E5C5F7F8 + operation);
  }
  v5 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)PSSpecifierUpdateOperation;
  id v6 = [(PSSpecifierUpdateOperation *)&v13 description];
  BOOL v7 = [(PSSpecifier *)self->_specifier identifier];
  index = self->_index;
  toIndex = self->_toIndex;
  if (toIndex)
  {
    v10 = [NSString stringWithFormat:@" -> %@", self->_toIndex];
  }
  else
  {
    v10 = &stru_1EFB51FD0;
  }
  v11 = [v5 stringWithFormat:@"%@: %@ ID: %@, index: %@%@, specifier: %@", v6, v4, v7, index, v10, self->_specifier];
  if (toIndex) {

  }
  return v11;
}

__CFString *__41__PSSpecifierUpdateOperation_description__block_invoke(uint64_t a1)
{
  unint64_t v1 = *(void *)(*(void *)(a1 + 32) + 16);
  if (v1 > 4) {
    return @"***Unknown Operation***";
  }
  else {
    return *(&off_1E5C5F7F8 + v1);
  }
}

- (BOOL)applyToArray:(id)a3
{
  id v4 = a3;
  int64_t operation = self->_operation;
  switch(operation)
  {
    case 4:
      BOOL v8 = [(PSSpecifierUpdateOperation *)self removingGroupSpecifierRemovesEntireGroup];
      index = self->_index;
      if (v8)
      {
        if (index)
        {
          unint64_t v10 = [(NSNumber *)index unsignedIntegerValue];
          v11 = [v4 objectAtIndex:v10];
        }
        else
        {
          if (!self->_specifier) {
            goto LABEL_28;
          }
          unint64_t v10 = objc_msgSend(v4, "indexOfObject:");
          v11 = self->_specifier;
        }
        objc_super v13 = v11;
        [v4 removeObjectAtIndex:v10];
        if (![(PSSpecifier *)v13 cellType])
        {
          while ([v4 count] > v10)
          {
            uint64_t v14 = [v4 objectAtIndex:v10];
            uint64_t v15 = [v14 cellType];

            if (!v15) {
              break;
            }
            [v4 removeObjectAtIndex:v10];
          }
        }

        break;
      }
      if (index)
      {
        objc_msgSend(v4, "removeObjectAtIndex:", -[NSNumber unsignedIntegerValue](index, "unsignedIntegerValue"));
        break;
      }
      if (self->_specifier)
      {
        objc_msgSend(v4, "removeObject:");
        break;
      }
LABEL_28:
      BOOL v16 = 0;
      goto LABEL_29;
    case 2:
      if (self->_index && self->_toIndex)
      {
        v12 = self->_specifier;
        if (!v12)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", -[NSNumber unsignedIntegerValue](self->_index, "unsignedIntegerValue"));
          v12 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v4, "removeObjectAtIndex:", -[NSNumber unsignedIntegerValue](self->_index, "unsignedIntegerValue"));
        objc_msgSend(v4, "insertObject:atIndex:", v12, -[NSNumber unsignedIntegerValue](self->_toIndex, "unsignedIntegerValue"));

        break;
      }
      goto LABEL_28;
    case 1:
      specifier = self->_specifier;
      if (specifier)
      {
        BOOL v7 = self->_index;
        if (v7)
        {
          objc_msgSend(v4, "insertObject:atIndex:", specifier, -[NSNumber unsignedIntegerValue](v7, "unsignedIntegerValue"));
          break;
        }
      }
      goto LABEL_28;
  }
  BOOL v16 = 1;
LABEL_29:

  return v16;
}

- (int64_t)operation
{
  return self->_operation;
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(id)a3
{
}

- (NSNumber)toIndex
{
  return self->_toIndex;
}

- (void)setToIndex:(id)a3
{
}

- (BOOL)removingGroupSpecifierRemovesEntireGroup
{
  return self->_removingGroupSpecifierRemovesEntireGroup;
}

- (void)setRemovingGroupSpecifierRemovesEntireGroup:(BOOL)a3
{
  self->_removingGroupSpecifierRemovesEntireGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toIndex, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

@end