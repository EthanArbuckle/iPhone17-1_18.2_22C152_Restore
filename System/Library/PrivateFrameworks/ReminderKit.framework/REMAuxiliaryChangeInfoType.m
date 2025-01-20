@interface REMAuxiliaryChangeInfoType
+ (BOOL)resolveInstanceMethod:(SEL)a3;
+ (NSString)cdEntityName;
+ (id)newObjectID;
+ (id)objectIDWithUUID:(id)a3;
- (NSDictionary)storage;
- (REMAuxiliaryChangeInfoType)initWithREMObjectID:(id)a3;
- (REMObjectID)remObjectID;
- (id)valueForUndefinedKey:(id)a3;
- (void)setRemObjectID:(id)a3;
- (void)setStorage:(id)a3;
@end

@implementation REMAuxiliaryChangeInfoType

+ (NSString)cdEntityName
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

- (REMAuxiliaryChangeInfoType)initWithREMObjectID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)REMAuxiliaryChangeInfoType;
  uint64_t v5 = [(REMAuxiliaryChangeInfoType *)&v8 init];
  v6 = v5;
  if (v4 && v5) {
    [(REMAuxiliaryChangeInfoType *)v5 setRemObjectID:v4];
  }

  return v6;
}

+ (id)newObjectID
{
  v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [a1 objectIDWithUUID:v3];

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 cdEntityName];
  v6 = +[REMObjectID objectIDWithUUID:v4 entityName:v5];

  return v6;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(REMAuxiliaryChangeInfoType *)self storage];
  v6 = [v5 valueForKey:v4];

  return v6;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  id v4 = (objc_class *)objc_opt_class();
  class_addMethod(v4, a3, (IMP)dynamicMethodIMP, "@@:");
  return 1;
}

- (REMObjectID)remObjectID
{
  return self->remObjectID;
}

- (void)setRemObjectID:(id)a3
{
}

- (NSDictionary)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->remObjectID, 0);
}

@end