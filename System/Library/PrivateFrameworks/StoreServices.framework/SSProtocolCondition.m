@interface SSProtocolCondition
+ (id)newConditionWithDictionary:(id)a3;
- (BOOL)evaluateWithContext:(id)a3;
- (SSProtocolCondition)initWithDictionary:(id)a3;
- (void)dealloc;
@end

@implementation SSProtocolCondition

+ (id)newConditionWithDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 objectForKey:@"condition-key"];
  uint64_t v5 = 0;
  while (([(__CFString *)__ConditionClassMapping[v5] isEqualToString:v4] & 1) == 0)
  {
    v5 += 2;
    if (v5 == 16) {
      goto LABEL_6;
    }
  }
  id result = (id)[objc_alloc(NSClassFromString(&__ConditionClassMapping[v5 + 1]->isa)) initWithDictionary:a3];
  if (result) {
    return result;
  }
LABEL_6:
  id v7 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v7) {
    id v7 = +[SSLogConfig sharedConfig];
  }
  int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  if (!os_log_type_enabled((os_log_t)[v7 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
    v9 &= 2u;
  }
  if (v9)
  {
    int v19 = 138412546;
    uint64_t v20 = objc_opt_class();
    __int16 v21 = 2112;
    uint64_t v22 = v4;
    LODWORD(v18) = 22;
    id result = (id)_os_log_send_and_compose_impl();
    if (!result) {
      return result;
    }
    id v10 = result;
    uint64_t v11 = objc_msgSend(NSString, "stringWithCString:encoding:", result, 4, &v19, v18);
    free(v10);
    SSFileLog(v7, @"%@", v12, v13, v14, v15, v16, v17, v11);
  }
  return 0;
}

- (SSProtocolCondition)initWithDictionary:(id)a3
{
  uint64_t v4 = [(SSProtocolCondition *)self init];
  if (v4)
  {
    uint64_t v5 = (void *)[a3 objectForKey:@"operator"];
    int64_t v6 = 0;
    v4->_operator = 0;
    while (![v5 isEqualToString:__OperationNames[v6]])
    {
      if (++v6 == 6) {
        goto LABEL_7;
      }
    }
    v4->_operator = v6;
LABEL_7:
    v4->_value = (id)[a3 objectForKey:@"value"];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSProtocolCondition;
  [(SSProtocolCondition *)&v3 dealloc];
}

- (BOOL)evaluateWithContext:(id)a3
{
  return 0;
}

@end