@interface SSMetricsDialogEvent
- (NSArray)userActions;
- (NSDictionary)details;
- (NSString)actionType;
- (NSString)actionURL;
- (NSString)dialogId;
- (NSString)dialogType;
- (NSString)dualAction;
- (NSString)message;
- (NSString)result;
- (NSString)targetId;
- (SSMetricsDialogEvent)init;
- (SSMetricsDialogEvent)initWithXPCEncoding:(id)a3;
- (id)copyXPCEncoding;
- (void)setActionType:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setDetails:(id)a3;
- (void)setDialogId:(id)a3;
- (void)setDialogType:(id)a3;
- (void)setDualAction:(id)a3;
- (void)setMessage:(id)a3;
- (void)setResult:(id)a3;
- (void)setTargetId:(id)a3;
- (void)setUserActions:(id)a3;
@end

@implementation SSMetricsDialogEvent

- (SSMetricsDialogEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsDialogEvent;
  v2 = [(SSMetricsBaseEvent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SSMetricsMutableEvent *)v2 setEventType:@"dialog"];
    [(SSMetricsMutableEvent *)v3 setEventVersion:&unk_1EF9A9780];
  }
  return v3;
}

- (NSString)actionType
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"actionType"];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)actionURL
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"actionURL"];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSDictionary)details
{
  return (NSDictionary *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"details"];
}

- (NSString)dialogId
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"dialogId"];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)dialogType
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"dialogType"];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)dualAction
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"dualAction"];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)message
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"message"];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSString)result
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"result"];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (void)setActionType:(id)a3
{
}

- (void)setActionURL:(id)a3
{
}

- (void)setDetails:(id)a3
{
}

- (void)setDialogId:(id)a3
{
}

- (void)setDialogType:(id)a3
{
}

- (void)setDualAction:(id)a3
{
}

- (void)setMessage:(id)a3
{
}

- (void)setResult:(id)a3
{
}

- (void)setTargetId:(id)a3
{
}

- (void)setUserActions:(id)a3
{
}

- (NSString)targetId
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"targetId"];
  v3 = (void *)[v2 copy];

  return (NSString *)v3;
}

- (NSArray)userActions
{
  return (NSArray *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"userActions"];
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  v4 = [(SSMetricsDialogEvent *)self actionType];
  SSXPCDictionarySetObject(v3, "300", v4);

  objc_super v5 = [(SSMetricsDialogEvent *)self actionURL];
  SSXPCDictionarySetObject(v3, "301", v5);

  v6 = [(SSMetricsDialogEvent *)self details];
  SSXPCDictionarySetObject(v3, "302", v6);

  v7 = [(SSMetricsDialogEvent *)self dialogId];
  SSXPCDictionarySetObject(v3, "303", v7);

  v8 = [(SSMetricsDialogEvent *)self dialogType];
  SSXPCDictionarySetObject(v3, "304", v8);

  v9 = [(SSMetricsDialogEvent *)self dualAction];
  SSXPCDictionarySetObject(v3, "311", v9);

  v10 = [(SSMetricsMutableEvent *)self eventType];
  SSXPCDictionarySetObject(v3, "305", v10);

  v11 = [(SSMetricsDialogEvent *)self message];
  SSXPCDictionarySetObject(v3, "306", v11);

  v12 = [(SSMetricsDialogEvent *)self result];
  SSXPCDictionarySetObject(v3, "307", v12);

  v13 = [(SSMetricsDialogEvent *)self targetId];
  SSXPCDictionarySetObject(v3, "308", v13);

  v14 = [(SSMetricsDialogEvent *)self userActions];
  SSXPCDictionarySetObject(v3, "309", v14);

  v15 = [(SSMetricsMutableEvent *)self userAgent];
  SSXPCDictionarySetObject(v3, "310", v15);

  return v3;
}

- (SSMetricsDialogEvent)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4 && MEMORY[0x1A62689E0](v4) == MEMORY[0x1E4F14590])
  {
    v32.receiver = self;
    v32.super_class = (Class)SSMetricsDialogEvent;
    v6 = [(SSMetricsBaseEvent *)&v32 init];
    if (v6)
    {
      uint64_t v8 = objc_opt_class();
      v9 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "300", v8);
      [(SSMetricsDialogEvent *)v6 setActionType:v9];

      uint64_t v10 = objc_opt_class();
      v11 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "301", v10);
      [(SSMetricsDialogEvent *)v6 setActionURL:v11];

      uint64_t v12 = objc_opt_class();
      v13 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "302", v12);
      [(SSMetricsDialogEvent *)v6 setDetails:v13];

      uint64_t v14 = objc_opt_class();
      v15 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "303", v14);
      [(SSMetricsDialogEvent *)v6 setDialogId:v15];

      uint64_t v16 = objc_opt_class();
      v17 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "304", v16);
      [(SSMetricsDialogEvent *)v6 setDialogType:v17];

      uint64_t v18 = objc_opt_class();
      v19 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "311", v18);
      [(SSMetricsDialogEvent *)v6 setDualAction:v19];

      uint64_t v20 = objc_opt_class();
      v21 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "305", v20);
      [(SSMetricsMutableEvent *)v6 setEventType:v21];

      uint64_t v22 = objc_opt_class();
      v23 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "306", v22);
      [(SSMetricsDialogEvent *)v6 setMessage:v23];

      uint64_t v24 = objc_opt_class();
      v25 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "307", v24);
      [(SSMetricsDialogEvent *)v6 setResult:v25];

      uint64_t v26 = objc_opt_class();
      v27 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "308", v26);
      [(SSMetricsDialogEvent *)v6 setTargetId:v27];

      uint64_t v28 = objc_opt_class();
      v29 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "309", v28);
      [(SSMetricsDialogEvent *)v6 setUserActions:v29];

      uint64_t v30 = objc_opt_class();
      v31 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "310", v30);
      [(SSMetricsMutableEvent *)v6 setUserAgent:v31];
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

@end