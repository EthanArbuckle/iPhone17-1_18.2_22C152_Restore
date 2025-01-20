@interface FTManagedHandle
+ (id)managedHandleForTUHandle:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedHandlesForTUHandles:(id)a3 inManagedObjectContext:(id)a4;
- (FTManagedHandle)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (TUHandle)tuHandle;
@end

@implementation FTManagedHandle

+ (id)managedHandleForTUHandle:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 persistentStoreCoordinator];
  v8 = [v7 managedObjectModel];

  if (v8)
  {
    v9 = [v8 entitiesByName];
    v10 = [v9 objectForKeyedSubscript:@"Handle"];

    if (v10)
    {
      id v11 = [objc_alloc((Class)objc_opt_class()) initWithEntity:v10 insertIntoManagedObjectContext:v6];
    }
    else
    {
      v13 = FTCServiceLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        CFStringRef v19 = @"Handle";
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not find entity description with name %@ in managed object context %@. Falling back to convenience initializer.", (uint8_t *)&v18, 0x16u);
      }

      id v11 = [objc_alloc((Class)objc_opt_class()) initWithContext:v6];
    }
    v12 = v11;
    v14 = [v5 isoCountryCode];
    [v12 setIsoCountryCode:v14];

    v15 = [v5 normalizedValue];
    [v12 setNormalizedValue:v15];

    objc_msgSend(v12, "setType:", (__int16)objc_msgSend(v5, "type"));
    v16 = [v5 value];
    [v12 setValue:v16];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)managedHandlesForTUHandles:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v6 count]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(a1, "managedHandleForTUHandle:inManagedObjectContext:", *(void *)(*((void *)&v17 + 1) + 8 * i), v7, (void)v17);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  id v15 = [v8 copy];

  return v15;
}

- (TUHandle)tuHandle
{
  unsigned int v3 = [(FTManagedHandle *)self type];
  switch(v3)
  {
    case 1u:
      v4 = [(FTManagedHandle *)self value];
      uint64_t v5 = +[TUHandle normalizedGenericHandleForValue:v4];
      goto LABEL_6;
    case 2u:
      v4 = [(FTManagedHandle *)self value];
      id v7 = [(FTManagedHandle *)self isoCountryCode];
      id v6 = +[TUHandle normalizedPhoneNumberHandleForValue:v4 isoCountryCode:v7];

      goto LABEL_8;
    case 3u:
      v4 = [(FTManagedHandle *)self value];
      uint64_t v5 = +[TUHandle normalizedEmailAddressHandleForValue:v4];
LABEL_6:
      id v6 = (void *)v5;
LABEL_8:

      goto LABEL_10;
  }
  id v6 = 0;
LABEL_10:

  return (TUHandle *)v6;
}

- (FTManagedHandle)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FTManagedHandle();
  return [(FTManagedHandle *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end