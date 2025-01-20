@interface PUIStylePickerComponents
- (BOOL)containsComponent:(unint64_t)a3;
- (PUIStylePickerComponents)init;
- (PUIStylePickerComponents)initWithComponent:(unint64_t)a3;
- (PUIStylePickerComponents)initWithComponents:(unint64_t)a3;
- (PUIStylePickerComponents)initWithIndexSet:(id)a3;
- (id)componentsByAddingComponent:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)numberOfComponents;
- (void)enumerateComponents:(id)a3;
@end

@implementation PUIStylePickerComponents

- (PUIStylePickerComponents)initWithIndexSet:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIStylePickerComponents;
  v5 = [(PUIStylePickerComponents *)&v11 init];
  if (v5)
  {
    v6 = (void *)[v4 mutableCopy];
    v7 = v6;
    if (v6) {
      v8 = v6;
    }
    else {
      v8 = (NSMutableIndexSet *)objc_opt_new();
    }
    indexSet = v5->_indexSet;
    v5->_indexSet = v8;
  }
  return v5;
}

- (PUIStylePickerComponents)initWithComponents:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUIStylePickerComponents;
  v3 = [(PUIStylePickerComponents *)&v7 init];
  if (v3)
  {
    id v4 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    indexSet = v3->_indexSet;
    v3->_indexSet = v4;
  }
  return v3;
}

- (PUIStylePickerComponents)init
{
  v3 = objc_opt_new();
  [v3 addIndex:1];
  [v3 addIndex:16];
  [v3 addIndex:8];
  [v3 addIndex:2];
  [v3 addIndex:4];
  id v4 = [(PUIStylePickerComponents *)self initWithIndexSet:v3];

  return v4;
}

- (PUIStylePickerComponents)initWithComponent:(unint64_t)a3
{
  v5 = objc_opt_new();
  [v5 addIndex:a3];
  v6 = [(PUIStylePickerComponents *)self initWithIndexSet:v5];

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __39__PUIStylePickerComponents_description__block_invoke;
  v8[3] = &unk_265471898;
  id v9 = v4;
  id v5 = v4;
  [(PUIStylePickerComponents *)self enumerateComponents:v8];
  [v3 appendArraySection:v5 withName:@"components" skipIfEmpty:1];
  v6 = [v3 build];

  return v6;
}

uint64_t __39__PUIStylePickerComponents_description__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = @"PUIStylePickerComponentFont";
  switch(a2)
  {
    case 1:
      return [v2 addObject:v3];
    case 2:
      v3 = @"PUIStylePickerComponentNumberingSystem";
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      v3 = @"PUIStylePickerComponentStyle";
      break;
    case 8:
      v3 = @"PUIStylePickerComponentTextLayout";
      break;
    default:
      if (a2 == 16) {
        v3 = @"PUIStylePickerComponentTextAlignment";
      }
      else {
LABEL_6:
      }
        v3 = @"(unknown PUIStylePickerComponent)";
      break;
  }
  return [v2 addObject:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  indexSet = self->_indexSet;
  return (id)[v4 initWithIndexSet:indexSet];
}

- (id)componentsByAddingComponent:(unint64_t)a3
{
  id v4 = (void *)[(NSMutableIndexSet *)self->_indexSet mutableCopy];
  [v4 addIndex:a3];
  id v5 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIndexSet:v4];

  return v5;
}

- (BOOL)containsComponent:(unint64_t)a3
{
  return [(NSMutableIndexSet *)self->_indexSet containsIndex:a3];
}

- (void)enumerateComponents:(id)a3
{
  id v4 = a3;
  indexSet = self->_indexSet;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__PUIStylePickerComponents_enumerateComponents___block_invoke;
  v7[3] = &unk_2654718C0;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableIndexSet *)indexSet enumerateIndexesUsingBlock:v7];
}

uint64_t __48__PUIStylePickerComponents_enumerateComponents___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (unint64_t)numberOfComponents
{
  return [(NSMutableIndexSet *)self->_indexSet count];
}

- (unint64_t)hash
{
  return [(NSMutableIndexSet *)self->_indexSet hash];
}

- (void).cxx_destruct
{
}

@end