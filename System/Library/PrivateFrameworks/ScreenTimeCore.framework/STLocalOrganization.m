@interface STLocalOrganization
+ (NSString)serializableClassName;
+ (id)fetchOrCreateLocalOrganizationWithContext:(id)a3 error:(id *)a4;
+ (id)fetchRequest;
@end

@implementation STLocalOrganization

+ (id)fetchOrCreateLocalOrganizationWithContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 fetchRequest];
  v8 = [v6 executeFetchRequest:v7 error:a4];
  v9 = v8;
  if (v8)
  {
    if ((unint64_t)[v8 count] >= 2)
    {
      v10 = +[STLog persistence];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        +[STLocalOrganization fetchOrCreateLocalOrganizationWithContext:error:]();
      }
    }
    v11 = [v9 firstObject];
    if (!v11) {
      v11 = [[STLocalOrganization alloc] initWithContext:v6];
    }
    v12 = [(STLocalOrganization *)v11 settings];
    if (!v12)
    {
      v12 = [[STLocalOrganizationSettings alloc] initWithContext:v6];
      [(STLocalOrganizationSettings *)v12 setOrganization:v11];
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fetchRequest
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___STLocalOrganization;
  v2 = objc_msgSendSuper2(&v4, sel_fetchRequest);
  return v2;
}

+ (NSString)serializableClassName
{
  return (NSString *)@"RMLocalOrganization";
}

+ (void)fetchOrCreateLocalOrganizationWithContext:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_1DA519000, v0, v1, "local organization should be unique in the database: %{public}@", v2, v3, v4, v5, v6);
}

@end