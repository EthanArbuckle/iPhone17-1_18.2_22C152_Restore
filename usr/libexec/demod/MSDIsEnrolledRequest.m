@interface MSDIsEnrolledRequest
- (Class)getResponseClass;
- (id)parseResponseForError:(id)a3 andPayload:(id)a4;
@end

@implementation MSDIsEnrolledRequest

- (Class)getResponseClass
{
  return (Class)objc_opt_class();
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MSDIsEnrolledRequest;
  v8 = [(MSDServerRequest *)&v20 parseResponseForError:v6 andPayload:v7];
  v9 = [v8 error];

  if (v9)
  {
    v12 = 0;
    v10 = 0;
    id v11 = v6;
  }
  else
  {
    id v19 = v6;
    v10 = [(MSDCommandServerRequest *)self getDataDictFromPayload:v7 error:&v19];
    id v11 = v19;

    if (v10)
    {
      v12 = [v10 objectForKey:@"Result"];
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ([v12 BOOLValue])
          {
            v13 = sub_100068600();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
              sub_1000D70E8(v13);
            }
          }
          [v8 setIsEnrolled:[v12 BOOLValue]];
          goto LABEL_10;
        }
      }
      v15 = sub_100068600();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1000D7038(self, (uint64_t)v10, v15);
      }
    }
    else
    {
      v12 = 0;
    }
  }
  v16 = [v8 error];

  if (!v16)
  {
    id v18 = v11;
    sub_1000C3140(&v18, 3727744512, @"Unexpected server response.");
    id v17 = v18;

    [v8 setError:v17];
    id v11 = v17;
  }
LABEL_10:

  return v8;
}

@end