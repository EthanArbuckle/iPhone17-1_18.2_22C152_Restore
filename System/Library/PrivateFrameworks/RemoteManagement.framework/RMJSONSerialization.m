@interface RMJSONSerialization
+ (NSDateFormatter)dateFormatter;
+ (id)serializeValue:(id)a3;
@end

@implementation RMJSONSerialization

+ (NSDateFormatter)dateFormatter
{
  if (qword_1000253B0 != -1) {
    dispatch_once(&qword_1000253B0, &stru_10001C678);
  }
  v2 = (void *)qword_1000253A8;

  return (NSDateFormatter *)v2;
}

+ (id)serializeValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v5 = v4;
LABEL_4:
    id v6 = v5;
    goto LABEL_5;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v4 || (isKindOfClass & 1) != 0)
  {
    id v5 = +[NSNull null];
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [a1 dateFormatter];
    id v6 = [v9 stringFromDate:v4];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 UUIDString];
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 absoluteString];
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 base64EncodedStringWithOptions:0];
      goto LABEL_4;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x3032000000;
      v33 = sub_1000084D0;
      v34 = sub_1000084E0;
      id v35 = (id)objc_opt_new();
      id v10 = v4;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000084E8;
      v29[3] = &unk_10001C6A0;
      v29[4] = &v30;
      v29[5] = a1;
      [v10 enumerateKeysAndObjectsUsingBlock:v29];
      id v6 = (id)v31[5];

      _Block_object_dispose(&v30, 8);
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = (id)objc_opt_new();
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v11 = v4;
        id v12 = [v11 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v26;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v11);
              }
              v15 = [a1 serializeValue:*(void *)(*((void *)&v25 + 1) + 8 * i)];
              if (!v15)
              {

                id v6 = 0;
                goto LABEL_42;
              }
              [v6 addObject:v15];
            }
            id v12 = [v11 countByEnumeratingWithState:&v25 objects:v37 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_42:
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v6 = (id)objc_opt_new();
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v16 = v4;
          id v17 = [v16 countByEnumeratingWithState:&v21 objects:v36 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v22;
            while (2)
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v22 != v18) {
                  objc_enumerationMutation(v16);
                }
                v20 = objc_msgSend(a1, "serializeValue:", *(void *)(*((void *)&v21 + 1) + 8 * (void)j), (void)v21);
                if (!v20)
                {

                  id v6 = 0;
                  goto LABEL_45;
                }
                [v6 addObject:v20];
              }
              id v17 = [v16 countByEnumeratingWithState:&v21 objects:v36 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
LABEL_45:
        }
        else
        {
          id v6 = 0;
        }
      }
    }
  }
LABEL_5:

  return v6;
}

@end