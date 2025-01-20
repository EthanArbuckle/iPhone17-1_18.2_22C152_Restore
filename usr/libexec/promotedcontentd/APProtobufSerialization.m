@interface APProtobufSerialization
+ (id)deserializeProtobufferData:(id)a3 ofClass:(Class)a4 error:(id *)a5;
+ (id)serializeProtobuffer:(id)a3;
@end

@implementation APProtobufSerialization

+ (id)serializeProtobuffer:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() options];
  v5 = [v4 objectForKeyedSubscript:@"messageIndex"];

  id v6 = objc_alloc_init((Class)PBDataWriter);
  [v3 writeTo:v6];

  v7 = [v6 data];
  unsigned int v11 = bswap32([v5 integerValue]);
  unsigned int v10 = bswap32([v7 length]);
  v8 = +[NSMutableData data];
  [v8 appendBytes:&v11 length:4];
  [v8 appendBytes:&v10 length:4];
  [v8 appendData:v7];

  return v8;
}

+ (id)deserializeProtobufferData:(id)a3 ofClass:(Class)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = v7;
  if (!v7 || (unint64_t)[v7 length] <= 7)
  {
    if (a5)
    {
      v9 = +[NSString stringWithFormat:@"Protobuffer is nil or less than %u bytes.", 8];
      *a5 = +[APLegacyInterfaceError validationErrorWithCode:4500 andReason:v9];
    }
    unsigned int v10 = APLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v21 = 8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Protobuffer is nil or less than %u bytes.", buf, 8u);
    }

    goto LABEL_8;
  }
  unsigned int v19 = 0;
  *(_DWORD *)buf = 0;
  [v8 getBytes:buf range:0, 4];
  *(_DWORD *)buf = bswap32(*(unsigned int *)buf);
  [v8 getBytes:&v19 range:4];
  uint64_t v13 = bswap32(v19);
  unsigned int v19 = v13;
  if (v13 + 8 <= (unint64_t)[v8 length])
  {
    id v14 = objc_alloc((Class)PBDataReader);
    v15 = [v8 subdataWithRange:8, v13];
    id v16 = [v14 initWithData:v15];

    id v17 = objc_alloc_init(a4);
    if ([v17 readFrom:v16])
    {
      id v11 = v17;
    }
    else
    {
      if (a5)
      {
        v18 = +[NSString stringWithFormat:@"Protocol buffer invalid or of the incorrect type '%@'", a4];
        *a5 = +[APLegacyInterfaceError validationErrorWithCode:4501 andReason:v18];
      }
      id v11 = 0;
    }
  }
  else
  {
    if (!a5)
    {
LABEL_8:
      id v11 = 0;
      goto LABEL_9;
    }
    +[APLegacyInterfaceError validationErrorWithCode:4500 andReason:@"Bad protocol response header for content %@; is the server up-to-date?"];
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:

  return v11;
}

@end