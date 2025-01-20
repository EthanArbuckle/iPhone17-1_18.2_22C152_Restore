@interface WFExternalDisplayTrigger(ContentInput)
- (id)contentCollectionWithEventInfo:()ContentInput;
- (uint64_t)requiresEventInfoAsInput;
- (void)eventInfoForEvent:()ContentInput completion:;
@end

@implementation WFExternalDisplayTrigger(ContentInput)

- (id)contentCollectionWithEventInfo:()ContentInput
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F5A8C8];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 objectForKeyedSubscript:@"UniqueId"];
  v7 = [v4 objectForKeyedSubscript:@"WFDeviceName"];
  v8 = [v4 objectForKeyedSubscript:@"ProductName"];

  v9 = (void *)[v5 initWithDisplayUUID:v6 deviceName:v7 name:v8];
  v10 = [MEMORY[0x1E4F5A8D0] itemWithObject:v9];
  v11 = (void *)MEMORY[0x1E4F5A830];
  v15[0] = v10;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  v13 = [v11 collectionWithItems:v12];

  return v13;
}

- (void)eventInfoForEvent:()ContentInput completion:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = [a3 eventBody];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 deviceName];
      if (v7)
      {
        v8 = (void *)v7;
        uint64_t v9 = [v6 productName];
        if (v9)
        {
          v10 = (void *)v9;
          v11 = [v6 uniqueId];

          if (v11)
          {
            v12 = objc_msgSend(v6, "deviceName", @"WFDeviceName");
            v22[0] = v12;
            v21[1] = @"ProductName";
            v13 = [v6 productName];
            v22[1] = v13;
            v21[2] = @"UniqueId";
            v14 = [v6 uniqueId];
            v22[2] = v14;
            v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
            v5[2](v5, v15);

LABEL_14:
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      v17 = getWFTriggersLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = [v6 deviceName];
        v19 = [v6 productName];
        v20 = [v6 uniqueId];
        *(_DWORD *)buf = 136316162;
        v24 = "-[WFExternalDisplayTrigger(ContentInput) eventInfoForEvent:completion:]";
        __int16 v25 = 2112;
        v26 = v6;
        __int16 v27 = 2112;
        v28 = v18;
        __int16 v29 = 2112;
        v30 = v19;
        __int16 v31 = 2112;
        v32 = v20;
        _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_ERROR, "%s Failed to create event info for display event due to nil property. <%@ deviceName: %@, productName: %@, uniqueId: %@>", buf, 0x34u);
      }
      v5[2](v5, 0);
      goto LABEL_14;
    }
  }

  v16 = getWFTriggersLogObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[WFExternalDisplayTrigger(ContentInput) eventInfoForEvent:completion:]";
    _os_log_impl(&dword_1C7D7E000, v16, OS_LOG_TYPE_DEFAULT, "%s Could not create display event no event info output", buf, 0xCu);
  }

  v5[2](v5, 0);
LABEL_15:
}

- (uint64_t)requiresEventInfoAsInput
{
  return 1;
}

@end