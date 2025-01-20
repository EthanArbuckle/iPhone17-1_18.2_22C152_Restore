@interface LNDynamicOption(Serialization)
+ (id)objectWithWFSerializedRepresentation:()Serialization;
- (id)wfSerializedRepresentation;
- (uint64_t)containsSensitiveContent;
- (void)setContainsSensitiveContent:()Serialization;
@end

@implementation LNDynamicOption(Serialization)

- (void)setContainsSensitiveContent:()Serialization
{
  v2 = (const void *)LNDynamicOptionSensitiveContentKey;
  objc_msgSend(NSNumber, "numberWithBool:");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, v2, v3, (void *)1);
}

- (uint64_t)containsSensitiveContent
{
  v1 = objc_getAssociatedObject(a1, (const void *)LNDynamicOptionSensitiveContentKey);
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v2 = v1;
    }
    else {
      v2 = 0;
    }
  }
  else
  {
    v2 = 0;
  }
  id v3 = v2;

  uint64_t v4 = [v3 BOOLValue];
  return v4;
}

- (id)wfSerializedRepresentation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = (void *)MEMORY[0x1E4F28DB0];
  uint64_t v4 = [a1 value];
  id v11 = 0;
  v5 = [v3 archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
  id v6 = v11;

  if (v6)
  {
    v7 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[LNDynamicOption(Serialization) wfSerializedRepresentation]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_FAULT, "%s Could not archive LNValue into data: %@", buf, 0x16u);
    }

    id v8 = 0;
  }
  else
  {
    [v2 setObject:v5 forKey:@"WFLinkDynamicOptionValue"];
    v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "indentationLevel"));
    [v2 setObject:v9 forKey:@"WFLinkDynamicOptionIndentationLevel"];

    id v8 = v2;
  }

  return v8;
}

+ (id)objectWithWFSerializedRepresentation:()Serialization
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKey:@"WFLinkDynamicOptionValue"];
  id v13 = 0;
  id v6 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v5 error:&v13];
  id v7 = v13;
  if (v7)
  {
    id v8 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v15 = "+[LNDynamicOption(Serialization) objectWithWFSerializedRepresentation:]";
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_FAULT, "%s Failed to decode LNValue from data: %@", buf, 0x16u);
    }

    v9 = 0;
  }
  else
  {
    v10 = [v4 objectForKey:@"WFLinkDynamicOptionIndentationLevel"];
    uint64_t v11 = [v10 unsignedIntegerValue];

    v9 = (void *)[[a1 alloc] initWithValue:v6 indentationLevel:v11];
  }

  return v9;
}

@end