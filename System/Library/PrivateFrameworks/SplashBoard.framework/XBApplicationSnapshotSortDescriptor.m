@interface XBApplicationSnapshotSortDescriptor
+ (id)_propertyKeyForSnapshotKey:(unint64_t)a3 overriddenForNil:(BOOL *)a4;
+ (id)sortDescriptorWithKey:(unint64_t)a3 ascending:(BOOL)a4 comparator:(id)a5;
- (BOOL)ascending;
- (NSSortDescriptor)NSSortDescriptor;
- (NSString)description;
- (XBApplicationSnapshotSortDescriptor)initWithKey:(unint64_t)a3 ascending:(BOOL)a4 comparator:(id)a5;
- (id)_stringForKey:(unint64_t)a3;
- (id)comparator;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)key;
- (void)setAscending:(BOOL)a3;
- (void)setComparator:(id)a3;
- (void)setKey:(unint64_t)a3;
@end

@implementation XBApplicationSnapshotSortDescriptor

- (void).cxx_destruct
{
}

- (NSSortDescriptor)NSSortDescriptor
{
  char v9 = 0;
  v3 = [(id)objc_opt_class() _propertyKeyForSnapshotKey:self->_key overriddenForNil:&v9];
  if (v9)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__XBApplicationSnapshotSortDescriptor_NSSortDescriptor__block_invoke;
    v8[3] = &unk_2646A64C0;
    v8[4] = self;
    comparator = v8;
  }
  else
  {
    comparator = self->_comparator;
  }
  v5 = (void *)MEMORY[0x223CB2F50](comparator);
  v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:v3 ascending:self->_ascending comparator:v5];

  return (NSSortDescriptor *)v6;
}

+ (id)_propertyKeyForSnapshotKey:(unint64_t)a3 overriddenForNil:(BOOL *)a4
{
  id result = @"referenceSize";
  switch(a3)
  {
    case 1uLL:
      if (a4) {
        *a4 = 1;
      }
      id result = @"_sortableName";
      break;
    case 2uLL:
      if (a4) {
        *a4 = 1;
      }
      id result = @"_sortableScheme";
      break;
    case 3uLL:
      if (a4) {
        *a4 = 1;
      }
      id result = @"_sortableLaunchInterfaceIdentifier";
      break;
    case 4uLL:
      if (a4) {
        *a4 = 0;
      }
      id result = @"_interfaceOrientationMask";
      break;
    case 6uLL:
      id result = @"imageScale";
      break;
    case 7uLL:
      if (a4) {
        *a4 = 0;
      }
      id result = @"_contentTypeMask";
      break;
    case 8uLL:
      if (a4) {
        *a4 = 1;
      }
      id result = @"_sortableStatusBarSettings";
      break;
    case 9uLL:
      if (a4) {
        *a4 = 1;
      }
      id result = @"_sortableRequiredOSVersion";
      break;
    case 0xAuLL:
      id result = @"creationDate";
      break;
    case 0xBuLL:
      id result = @"hasProtectedContent";
      break;
    case 0xCuLL:
      id result = @"userInterfaceStyle";
      break;
    case 0xDuLL:
      id result = @"customSafeAreaInsets";
      break;
    default:
      return result;
  }
  return result;
}

+ (id)sortDescriptorWithKey:(unint64_t)a3 ascending:(BOOL)a4 comparator:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  char v9 = (void *)[objc_alloc((Class)a1) initWithKey:a3 ascending:v5 comparator:v8];

  return v9;
}

- (XBApplicationSnapshotSortDescriptor)initWithKey:(unint64_t)a3 ascending:(BOOL)a4 comparator:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)XBApplicationSnapshotSortDescriptor;
  char v9 = [(XBApplicationSnapshotSortDescriptor *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_key = a3;
    v9->_ascending = a4;
    uint64_t v11 = [v8 copy];
    id comparator = v10->_comparator;
    v10->_id comparator = (id)v11;
  }
  return v10;
}

- (NSString)description
{
  return (NSString *)[(XBApplicationSnapshotSortDescriptor *)self descriptionWithMultilinePrefix:0];
}

uint64_t __55__XBApplicationSnapshotSortDescriptor_NSSortDescriptor__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  FAKE_NIL_PTR();
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  char v9 = v7;
  if (v8 == v7)
  {

    char v9 = 0;
  }
  id v10 = v6;
  FAKE_NIL_PTR();
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v10;
  if (v11 == v10)
  {

    v12 = 0;
  }
  uint64_t v13 = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24) + 16))();

  return v13;
}

- (id)succinctDescription
{
  v2 = [(XBApplicationSnapshotSortDescriptor *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x263F3F658] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(XBApplicationSnapshotSortDescriptor *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(XBApplicationSnapshotSortDescriptor *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__XBApplicationSnapshotSortDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2646A5BC0;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __77__XBApplicationSnapshotSortDescriptor_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) _stringForKey:*(void *)(*(void *)(a1 + 40) + 8)];
  id v4 = (id)[v2 appendObject:v3 withName:@"key"];

  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"ascending"];
}

- (id)_stringForKey:(unint64_t)a3
{
  if (a3 - 2 > 0xB) {
    return @"XBApplicationSnapshotNameKey";
  }
  else {
    return off_2646A64E0[a3 - 2];
  }
}

- (unint64_t)key
{
  return self->_key;
}

- (void)setKey:(unint64_t)a3
{
  self->_key = a3;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void)setAscending:(BOOL)a3
{
  self->_ascending = a3;
}

- (id)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
}

@end