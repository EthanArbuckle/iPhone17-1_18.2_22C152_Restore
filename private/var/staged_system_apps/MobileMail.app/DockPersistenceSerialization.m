@interface DockPersistenceSerialization
+ (id)_loadFromLegacyData:(id)a3;
+ (id)_loadFromV1Data:(id)a3;
+ (id)_loadFromV2Data:(id)a3;
+ (id)dictionaryFromDockedStates:(id)a3;
+ (id)dockedStatesFromDictionary:(id)a3;
+ (id)log;
@end

@implementation DockPersistenceSerialization

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B1884;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699488 != -1) {
    dispatch_once(&qword_100699488, block);
  }
  v2 = (void *)qword_100699480;

  return v2;
}

+ (id)dockedStatesFromDictionary:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = &__NSArray0__struct;
    goto LABEL_25;
  }
  objc_opt_class();
  id v5 = &__NSArray0__struct;
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_25;
  }
  v6 = [v4 ef_objectOfClass:objc_opt_class() forKey:@"RestorationCompatabilityVersion"];
  v7 = v6;
  if (v6) {
    id v8 = [v6 integerValue];
  }
  else {
    id v8 = 0;
  }
  v9 = +[DockPersistenceSerialization log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134218240;
    id v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = 2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Deserializing docked states from version %ld to version %ld.", (uint8_t *)&v18, 0x16u);
  }

  if (v8 == (id)2)
  {
    uint64_t v10 = [a1 _loadFromV2Data:v4];
  }
  else if (v8 == (id)1)
  {
    uint64_t v10 = [a1 _loadFromV1Data:v4];
  }
  else
  {
    if (v8)
    {
      v12 = +[DockPersistenceSerialization log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1004597E8((uint64_t)v8, v12, v13);
      }

      v11 = 0;
      goto LABEL_19;
    }
    uint64_t v10 = [a1 _loadFromLegacyData:v4];
  }
  v11 = (void *)v10;
LABEL_19:
  if (v11) {
    v14 = v11;
  }
  else {
    v14 = &__NSArray0__struct;
  }
  id v5 = v14;

  v15 = +[DockPersistenceSerialization log];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    id v16 = [v5 count];
    int v18 = 134217984;
    id v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Deserialization finished with %lu states.", (uint8_t *)&v18, 0xCu);
  }

LABEL_25:

  return v5;
}

+ (id)dictionaryFromDockedStates:(id)a3
{
  id v3 = a3;
  id v4 = +[DockPersistenceSerialization log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v14 = [v3 count];
    __int16 v15 = 2048;
    uint64_t v16 = 2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Serializing %lu docked states with version %ld.", buf, 0x16u);
  }

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v5 setObject:&off_10062A638 forKey:@"RestorationCompatabilityVersion"];
  id v12 = 0;
  v6 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v12];
  id v7 = v12;
  if (v7)
  {
    id v8 = +[DockPersistenceSerialization log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [v7 ef_publicDescription];
      sub_100459858(v9, (uint64_t)buf, v8);
    }
  }
  else
  {
    [v5 ef_setOptionalObject:v6 forKey:@"DockedStates"];
  }
  id v10 = [v5 copy];

  return v10;
}

+ (id)_loadFromLegacyData:(id)a3
{
  id v17 = a3;
  id v20 = objc_alloc_init((Class)NSMutableArray);
  int v18 = [v17 objectForKey:@"actorItems"];
  id v3 = +[DockPersistenceSerialization log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v30 = [v18 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Found %lu legacy serialized states.", buf, 0xCu);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v18;
  id v4 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = [v7 objectForKey:@"identificationString" v17];
        id v9 = [v7 objectForKey:@"resurrectionIdentifier"];
        if ([v9 length])
        {
          uint64_t v10 = objc_opt_class();
          id v27 = 0;
          v11 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v10 fromData:v9 error:&v27];
          id v12 = v27;
          if (v12)
          {
            uint64_t v13 = +[DockPersistenceSerialization log];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              id v14 = [v12 ef_publicDescription];
              sub_1004598E8(v14, buf, &v30, v13);
            }
          }
        }
        else
        {
          id v12 = +[DockPersistenceSerialization log];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            sub_1004598A8(&v25, v26, v12);
          }
          v11 = 0;
        }

        __int16 v15 = +[DockedViewControllerState withID:v11 title:v8];
        [v20 ef_addOptionalObject:v15];
      }
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v4);
  }

  return v20;
}

+ (id)_loadFromV1Data:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 _loadFromV2Data:v4];
  id v6 = [v5 mutableCopy];

  id v7 = [v4 objectForKey:@"PresentedState"];
  if ([v7 length])
  {
    id v8 = +[DockPersistenceSerialization log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Serialized state has previously presented state. Adding to docked states...", buf, 2u);
    }

    id v18 = 0;
    id v9 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v18];
    id v10 = v18;
    if (v9)
    {
      [v6 insertObject:v9 atIndex:0];
      v11 = +[DockPersistenceSerialization log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Previously presented state was added to docked states.", buf, 2u);
      }
    }
    if (v10)
    {
      id v12 = +[DockPersistenceSerialization log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        uint64_t v13 = [v10 ef_publicDescription];
        sub_10045993C(v13, (uint64_t)buf, v12);
      }
    }
  }
  id v14 = +[DockPersistenceSerialization log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = [v6 count];
    *(_DWORD *)id v19 = 134217984;
    id v20 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Found %lu serialized docked states. Updating identifiers and filtering...", v19, 0xCu);
  }

  uint64_t v16 = [v6 ef_filter:&stru_100606758];

  return v16;
}

+ (id)_loadFromV2Data:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"DockedStates"];
  if ([v4 length])
  {
    id v5 = objc_alloc((Class)NSSet);
    v14[0] = objc_opt_class();
    v14[1] = objc_opt_class();
    id v6 = +[NSArray arrayWithObjects:v14 count:2];
    id v7 = [v5 initWithArray:v6];

    id v8 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v7 fromData:v4 error:0];
    id v9 = +[DockPersistenceSerialization log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      id v13 = [v8 count];
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Found %lu serialized docked states. Checking for missing identifiers...", (uint8_t *)&v12, 0xCu);
    }

    id v10 = [v8 ef_filter:&stru_100606778];
  }
  else
  {
    id v7 = +[DockPersistenceSerialization log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1004599C0();
    }
    id v10 = &__NSArray0__struct;
  }

  return v10;
}

@end