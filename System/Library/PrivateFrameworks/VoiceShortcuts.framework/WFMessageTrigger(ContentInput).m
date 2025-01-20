@interface WFMessageTrigger(ContentInput)
- (id)contentCollectionWithEventInfo:()ContentInput;
- (uint64_t)requiresEventInfoAsInput;
@end

@implementation WFMessageTrigger(ContentInput)

- (id)contentCollectionWithEventInfo:()ContentInput
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[WFMessageTrigger(ContentInput) contentCollectionWithEventInfo:]";
    __int16 v19 = 2112;
    id v20 = v3;
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEBUG, "%s Creating WFMessageContentItem from eventinfo: %@", buf, 0x16u);
  }

  id v5 = v3;
  if (v5 && (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), v5, (isKindOfClass & 1) != 0))
  {
    v7 = [v5 objectForKey:@"NewValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v9 = v8;
        }
        else {
          v9 = 0;
        }
      }
      else
      {
        v9 = 0;
      }
      v10 = v9;

      v16 = v10;
      v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v7;
      if (v7)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v11 = v7;
        }
        else {
          v11 = 0;
        }
      }
      else
      {
        v11 = 0;
      }
      v14 = v11;

      v15 = [v14 if_map:&__block_literal_global_238];
      v12 = [MEMORY[0x1E4F5A830] collectionWithItems:v15];

      goto LABEL_20;
    }
  }
  else
  {
    v7 = getWFTriggersLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFMessageTrigger(ContentInput) contentCollectionWithEventInfo:]";
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_ERROR, "%s Event info (%@) was not of type NSDictionary", buf, 0x16u);
    }
  }
  v12 = 0;
LABEL_20:

  return v12;
}

- (uint64_t)requiresEventInfoAsInput
{
  return 1;
}

@end