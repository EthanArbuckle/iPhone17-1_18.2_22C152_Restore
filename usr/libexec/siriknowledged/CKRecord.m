@interface CKRecord
+ (id)acceptedClasses;
- (NSSecureCoding)data;
- (void)setData:(id)a3;
@end

@implementation CKRecord

- (void)setData:(id)a3
{
  if (a3)
  {
    id v9 = 0;
    v4 = +[NSKeyedArchiver archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v9];
    id v5 = v9;
    if (v5)
    {
      v6 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v11 = "-[CKRecord(SiriKnowledgeAdditions) setData:]";
        __int16 v12 = 2112;
        id v13 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Error encountered while encoding record data: %@", buf, 0x16u);
      }
    }
    else
    {
      if (!v4)
      {
LABEL_11:

        return;
      }
      v7 = [(CKRecord *)self encryptedValuesByKey];
      [v7 setObject:v4 forKey:@"value"];
    }
    goto LABEL_11;
  }
  id v8 = [(CKRecord *)self encryptedValuesByKey];
  [v8 setObject:0 forKey:@"value"];
}

- (NSSecureCoding)data
{
  v2 = [(CKRecord *)self encryptedValuesByKey];
  v3 = [v2 objectForKey:@"value"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = 0;
    id v4 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v3 error:&v18];
    id v5 = v18;
    v6 = [(id)objc_opt_class() acceptedClasses];
    if (!v6)
    {
      uint64_t v17 = objc_opt_class();
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_opt_class();
      v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    }
    id v14 = [v4 decodeObjectOfClasses:v6 forKey:NSKeyedArchiveRootObjectKey];
    [v4 finishDecoding];
    if (v5)
    {
      v15 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v20 = "-[CKRecord(SiriKnowledgeAdditions) data]";
        __int16 v21 = 2112;
        id v22 = v5;
        _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Error encountered while decoding record data: %@", buf, 0x16u);
      }

      id v14 = 0;
    }
  }
  else
  {
    id v14 = v3;
  }

  return (NSSecureCoding *)v14;
}

+ (id)acceptedClasses
{
  if (qword_10001DEA8 != -1) {
    dispatch_once(&qword_10001DEA8, &stru_100018558);
  }
  v2 = (void *)qword_10001DEA0;

  return v2;
}

@end