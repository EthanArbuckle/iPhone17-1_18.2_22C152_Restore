@interface WFCloudKitItemProperty
+ (id)assetPropertyWithName:(id)a3;
+ (id)assetPropertyWithName:(id)a3 fileType:(id)a4;
+ (id)assetPropertyWithName:(id)a3 fileType:(id)a4 ignoredByDefault:(BOOL)a5 encrypted:(BOOL)a6;
+ (id)itemPropertyWithName:(id)a3 itemClass:(Class)a4;
+ (id)itemReferencePropertyWithName:(id)a3 itemClass:(Class)a4;
+ (id)objectPropertyWithName:(id)a3;
+ (id)objectPropertyWithName:(id)a3 constantValue:(id)a4;
+ (id)objectPropertyWithName:(id)a3 constantValue:(id)a4 encrypted:(BOOL)a5;
+ (id)objectPropertyWithName:(id)a3 ignoredByDefault:(BOOL)a4 encrypted:(BOOL)a5;
+ (id)scalarPropertyWithName:(id)a3 constantValue:(id)a4;
+ (id)scalarPropertyWithName:(id)a3 nilValue:(id)a4;
+ (id)scalarPropertyWithName:(id)a3 nilValue:(id)a4 ignoredByDefault:(BOOL)a5 encrypted:(BOOL)a6;
- (BOOL)hasConstantValue;
- (BOOL)isEncrypted;
- (BOOL)isIgnoredByDefault;
- (Class)itemClass;
- (NSString)name;
- (NSValue)nilValue;
- (WFCloudKitItemProperty)initWithType:(unint64_t)a3 name:(id)a4 itemClass:(Class)a5 ignoredByDefault:(BOOL)a6 nilValue:(id)a7 hasConstantValue:(BOOL)a8 constantValue:(id)a9 fileType:(id)a10 encrypted:(BOOL)a11;
- (WFFileType)fileType;
- (id)constantValue;
- (unint64_t)type;
@end

@implementation WFCloudKitItemProperty

- (BOOL)isIgnoredByDefault
{
  return self->_ignoredByDefault;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileType, 0);
  objc_storeStrong(&self->_constantValue, 0);
  objc_storeStrong((id *)&self->_nilValue, 0);
  objc_storeStrong((id *)&self->_itemClass, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)assetPropertyWithName:(id)a3 fileType:(id)a4 ignoredByDefault:(BOOL)a5 encrypted:(BOOL)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  LOBYTE(v14) = a6;
  v12 = (void *)[objc_alloc((Class)a1) initWithType:2 name:v11 itemClass:0 ignoredByDefault:v7 nilValue:0 hasConstantValue:0 constantValue:0 fileType:v10 encrypted:v14];

  return v12;
}

+ (id)objectPropertyWithName:(id)a3 ignoredByDefault:(BOOL)a4 encrypted:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  LOBYTE(v11) = a5;
  v9 = (void *)[objc_alloc((Class)a1) initWithType:1 name:v8 itemClass:0 ignoredByDefault:v6 nilValue:0 hasConstantValue:0 constantValue:0 fileType:0 encrypted:v11];

  return v9;
}

- (WFCloudKitItemProperty)initWithType:(unint64_t)a3 name:(id)a4 itemClass:(Class)a5 ignoredByDefault:(BOOL)a6 nilValue:(id)a7 hasConstantValue:(BOOL)a8 constantValue:(id)a9 fileType:(id)a10 encrypted:(BOOL)a11
{
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  id v18 = a10;
  if (!v15)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"WFCloudKitItemProperty.m", 68, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)WFCloudKitItemProperty;
  v19 = [(WFCloudKitItemProperty *)&v29 init];
  v20 = v19;
  if (v19)
  {
    v19->_type = a3;
    uint64_t v21 = [v15 copy];
    name = v20->_name;
    v20->_name = (NSString *)v21;

    objc_storeStrong((id *)&v20->_itemClass, a5);
    v20->_ignoredByDefault = a6;
    objc_storeStrong((id *)&v20->_nilValue, a7);
    v20->_hasConstantValue = a8;
    objc_storeStrong(&v20->_constantValue, a9);
    objc_storeStrong((id *)&v20->_fileType, a10);
    v20->_encrypted = a11;
    v23 = v20;
  }

  return v20;
}

+ (id)objectPropertyWithName:(id)a3
{
  return (id)[a1 objectPropertyWithName:a3 ignoredByDefault:0 encrypted:0];
}

+ (id)assetPropertyWithName:(id)a3 fileType:(id)a4
{
  return (id)[a1 assetPropertyWithName:a3 fileType:a4 ignoredByDefault:0 encrypted:0];
}

- (WFFileType)fileType
{
  return self->_fileType;
}

- (id)constantValue
{
  return self->_constantValue;
}

- (BOOL)hasConstantValue
{
  return self->_hasConstantValue;
}

- (NSValue)nilValue
{
  return self->_nilValue;
}

- (BOOL)isEncrypted
{
  return self->_encrypted;
}

- (Class)itemClass
{
  return self->_itemClass;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)type
{
  return self->_type;
}

+ (id)itemPropertyWithName:(id)a3 itemClass:(Class)a4
{
  id v7 = a3;
  if (([(objc_class *)a4 conformsToProtocol:&unk_1F232DED0] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"WFCloudKitItemProperty.m", 63, @"Invalid parameter not satisfying: %@", @"[itemClass conformsToProtocol:@protocol(WFCloudKitItem)]" object file lineNumber description];
  }
  LOBYTE(v11) = 0;
  id v8 = (void *)[objc_alloc((Class)a1) initWithType:3 name:v7 itemClass:a4 ignoredByDefault:0 nilValue:0 hasConstantValue:0 constantValue:0 fileType:0 encrypted:v11];

  return v8;
}

+ (id)itemReferencePropertyWithName:(id)a3 itemClass:(Class)a4
{
  id v7 = a3;
  if (([(objc_class *)a4 conformsToProtocol:&unk_1F232DED0] & 1) == 0)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"WFCloudKitItemProperty.m", 58, @"Invalid parameter not satisfying: %@", @"[itemClass conformsToProtocol:@protocol(WFCloudKitItem)]" object file lineNumber description];
  }
  LOBYTE(v11) = 0;
  id v8 = (void *)[objc_alloc((Class)a1) initWithType:4 name:v7 itemClass:a4 ignoredByDefault:0 nilValue:0 hasConstantValue:0 constantValue:0 fileType:0 encrypted:v11];

  return v8;
}

+ (id)assetPropertyWithName:(id)a3
{
  return (id)[a1 assetPropertyWithName:a3 fileType:0];
}

+ (id)objectPropertyWithName:(id)a3 constantValue:(id)a4 encrypted:(BOOL)a5
{
  id v8 = a4;
  id v9 = a3;
  LOBYTE(v12) = a5;
  id v10 = (void *)[objc_alloc((Class)a1) initWithType:1 name:v9 itemClass:0 ignoredByDefault:0 nilValue:0 hasConstantValue:1 constantValue:v8 fileType:0 encrypted:v12];

  return v10;
}

+ (id)objectPropertyWithName:(id)a3 constantValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  LOBYTE(v10) = 0;
  id v8 = (void *)[objc_alloc((Class)a1) initWithType:1 name:v7 itemClass:0 ignoredByDefault:0 nilValue:0 hasConstantValue:1 constantValue:v6 fileType:0 encrypted:v10];

  return v8;
}

+ (id)scalarPropertyWithName:(id)a3 constantValue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  LOBYTE(v10) = 0;
  id v8 = (void *)[objc_alloc((Class)a1) initWithType:0 name:v7 itemClass:0 ignoredByDefault:0 nilValue:0 hasConstantValue:1 constantValue:v6 fileType:0 encrypted:v10];

  return v8;
}

+ (id)scalarPropertyWithName:(id)a3 nilValue:(id)a4 ignoredByDefault:(BOOL)a5 encrypted:(BOOL)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v12 = a4;
  if (!v12)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"WFCloudKitItemProperty.m", 21, @"Invalid parameter not satisfying: %@", @"nilValue" object file lineNumber description];
  }
  LOBYTE(v16) = a6;
  v13 = (void *)[objc_alloc((Class)a1) initWithType:0 name:v11 itemClass:0 ignoredByDefault:v7 nilValue:v12 hasConstantValue:0 constantValue:0 fileType:0 encrypted:v16];

  return v13;
}

+ (id)scalarPropertyWithName:(id)a3 nilValue:(id)a4
{
  return (id)[a1 scalarPropertyWithName:a3 nilValue:a4 ignoredByDefault:0 encrypted:0];
}

@end