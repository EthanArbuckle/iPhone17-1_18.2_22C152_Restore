@interface STCoreOrganization
+ (Class)internalClassForSerializableClassName:(id)a3;
+ (id)fetchRequest;
@end

@implementation STCoreOrganization

+ (Class)internalClassForSerializableClassName:(id)a3
{
  uint64_t v3 = internalClassForSerializableClassName__oneTime;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&internalClassForSerializableClassName__oneTime, &__block_literal_global_10);
  }
  v5 = [(id)internalClassForSerializableClassName__mapping objectForKey:v4];

  return (Class)v5;
}

void __60__STCoreOrganization_internalClassForSerializableClassName___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0 valueOptions:0 capacity:9];
  v1 = (void *)internalClassForSerializableClassName__mapping;
  internalClassForSerializableClassName__mapping = v0;

  v2 = (void *)internalClassForSerializableClassName__mapping;
  uint64_t v3 = objc_opt_class();
  id v4 = +[STLocalOrganization serializableClassName];
  [v2 setObject:v3 forKey:v4];

  v5 = (void *)internalClassForSerializableClassName__mapping;
  uint64_t v6 = objc_opt_class();
  v7 = +[STiCloudOrganization serializableClassName];
  [v5 setObject:v6 forKey:v7];

  v8 = (void *)internalClassForSerializableClassName__mapping;
  uint64_t v9 = objc_opt_class();
  id v10 = +[STFamilyOrganization serializableClassName];
  [v8 setObject:v9 forKey:v10];
}

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STCoreOrganization;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

@end