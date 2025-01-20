@interface IKViewElement(VideosUI)
+ (id)_vui_updateEventDescriptorWithType:()VideosUI;
- (VUIViewElementDataSource)vui_DataSource;
- (id)vui_description;
- (id)vui_imageURL;
- (id)vui_title;
- (id)vui_updateEventDescriptors;
- (void)_parseElementIfNecessary;
- (void)vui_updateEventDescriptors;
@end

@implementation IKViewElement(VideosUI)

- (VUIViewElementDataSource)vui_DataSource
{
  v2 = [a1 objectForKeyedSubscript:@"ViewElementDataSourceKey"];
  if (!v2)
  {
    v3 = [a1 dataDictionary];
    v2 = [[VUIViewElementDataSource alloc] initWithDataDictionary:v3 viewElement:a1];
    if (v2) {
      [a1 setObject:v2 forKeyedSubscript:@"ViewElementDataSourceKey"];
    }
  }
  return v2;
}

- (id)vui_updateEventDescriptors
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v1 = [a1 attributes];
  v2 = objc_msgSend(v1, "vui_stringForKey:", @"vui-update-events");
  v3 = v2;
  if (v2)
  {
    v33 = v2;
    v34 = v1;
    v4 = [v2 componentsSeparatedByString:@","];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (!v5) {
      goto LABEL_36;
    }
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v47;
    v36 = v4;
    while (1)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v46 + 1) + 8 * i) componentsSeparatedByString:@":"];
        uint64_t v10 = [v9 count];
        if (v10)
        {
          unint64_t v11 = v10;
          unint64_t v45 = 0;
          v12 = [v9 objectAtIndex:0];
          v13 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
          v14 = [v12 stringByTrimmingCharactersInSet:v13];

          if (!VUIAppDocumentUpdateEventTypeFromStringRepresentation(v14, (uint64_t *)&v45)) {
            goto LABEL_33;
          }
          if (v45 <= 2)
          {
            if (v11 <= 1)
            {
              VUIDefaultLogObject();
              v15 = (VUIAppDocumentPurchaseEventDescriptor *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR)) {
                [(IKViewElement(VideosUI) *)&v43 vui_updateEventDescriptors];
              }
              goto LABEL_32;
            }
            v16 = [v9 objectAtIndex:1];
            v17 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
            v15 = [v16 stringByTrimmingCharactersInSet:v17];

            v18 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v15];
            uint64_t v19 = [v18 unsignedIntegerValue];
            if (v19)
            {
              uint64_t v20 = v19;
              if (v11 < 3)
              {
                v22 = 0;
              }
              else
              {
                v35 = [v9 objectAtIndex:2];
                v21 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
                v22 = [v35 stringByTrimmingCharactersInSet:v21];
              }
              v29 = [VUIAppDocumentRefreshEventDescriptor alloc];
              uint64_t v30 = [(VUIAppDocumentRefreshEventDescriptor *)v29 initWithEventType:v45 delayInSeconds:v20 name:v22];

              v15 = (VUIAppDocumentPurchaseEventDescriptor *)v30;
              v4 = v36;
              goto LABEL_30;
            }
            v25 = VUIDefaultLogObject();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              [(IKViewElement(VideosUI) *)&v41 vui_updateEventDescriptors];
            }

LABEL_32:
LABEL_33:

            goto LABEL_34;
          }
          if (v45 == 17)
          {
            v23 = objc_opt_class();
            unint64_t v24 = 17;
          }
          else
          {
            if (v45 == 4)
            {
              if (v11 <= 1)
              {
                VUIDefaultLogObject();
                v15 = (VUIAppDocumentPurchaseEventDescriptor *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v15->super.super, OS_LOG_TYPE_ERROR)) {
                  [(IKViewElement(VideosUI) *)&v39 vui_updateEventDescriptors];
                }
                goto LABEL_32;
              }
              v26 = [v9 objectAtIndex:1];
              v27 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
              v28 = [v26 stringByTrimmingCharactersInSet:v27];

              v4 = v36;
              v15 = [[VUIAppDocumentPurchaseEventDescriptor alloc] initWithCanonicalID:v28];

              goto LABEL_30;
            }
            v23 = objc_opt_class();
            unint64_t v24 = v45;
          }
          objc_msgSend(v23, "_vui_updateEventDescriptorWithType:", v24);
          v15 = (VUIAppDocumentPurchaseEventDescriptor *)objc_claimAutoreleasedReturnValue();
LABEL_30:
          if (v15)
          {
            [v38 addObject:v15];
            goto LABEL_32;
          }
          goto LABEL_33;
        }
LABEL_34:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (!v6)
      {
LABEL_36:

        v3 = v33;
        v1 = v34;
        break;
      }
    }
  }
  v31 = (void *)[v38 copy];

  return v31;
}

- (id)vui_title
{
  [a1 _parseElementIfNecessary];
  return objc_getAssociatedObject(a1, @"VideosTitle");
}

- (id)vui_description
{
  [a1 _parseElementIfNecessary];
  return objc_getAssociatedObject(a1, @"VideosDescription");
}

- (id)vui_imageURL
{
  [a1 _parseElementIfNecessary];
  return objc_getAssociatedObject(a1, @"VideosImageURL");
}

+ (id)_vui_updateEventDescriptorWithType:()VideosUI
{
  v3 = 0;
  switch(a3)
  {
    case 3:
      v3 = +[VUIAppDocumentUpdateEventDescriptor purchases];
      break;
    case 5:
      v3 = +[VUIAppDocumentUpdateEventDescriptor playActivity];
      break;
    case 6:
      v3 = +[VUIAppDocumentUpdateEventDescriptor settings];
      break;
    case 7:
      v3 = +[VUIAppDocumentUpdateEventDescriptor upNext];
      break;
    case 9:
      v3 = +[VUIAppDocumentUpdateEventDescriptor favorites];
      break;
    case 11:
      v3 = +[VUIAppDocumentUpdateEventDescriptor accountChanged];
      break;
    case 12:
      v3 = +[VUIAppDocumentUpdateEventDescriptor removeFromPlayHistory];
      break;
    case 13:
      v3 = +[VUIAppDocumentUpdateEventDescriptor entitlements];
      break;
    case 14:
      v3 = +[VUIAppDocumentUpdateEventDescriptor utsk];
      break;
    case 15:
      v3 = +[VUIAppDocumentUpdateEventDescriptor restrictions];
      break;
    case 16:
      v3 = +[VUIAppDocumentUpdateEventDescriptor preferredVideoFormat];
      break;
    case 17:
      v3 = +[VUIAppDocumentUpdateEventDescriptor postPlay];
      break;
    case 18:
      v3 = +[VUIAppDocumentUpdateEventDescriptor appDidBecomeActive];
      break;
    case 19:
      v3 = +[VUIAppDocumentUpdateEventDescriptor playHistoryUpdated];
      break;
    case 20:
      v3 = +[VUIAppDocumentUpdateEventDescriptor clearPlayHistory];
      break;
    case 21:
      v3 = +[VUIAppDocumentUpdateEventDescriptor appRefresh];
      break;
    case 22:
      v3 = +[VUIAppDocumentUpdateEventDescriptor locationAuthorizationChanged];
      break;
    case 23:
      v3 = +[VUIAppDocumentUpdateEventDescriptor locationRetrieved];
      break;
    default:
      break;
  }
  return v3;
}

- (void)_parseElementIfNecessary
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = objc_getAssociatedObject(a1, @"VideosHasParsedElement");
  char v3 = [v2 BOOLValue];

  if ((v3 & 1) == 0)
  {
    objc_setAssociatedObject(a1, @"VideosHasParsedElement", MEMORY[0x1E4F1CC38], (void *)1);
    if (objc_opt_respondsToSelector())
    {
      v4 = a1;
      [a1 relatedContent];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      v32 = long long v46 = 0u;
      id obj = [v32 children];
      uint64_t v5 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (!v5) {
        goto LABEL_29;
      }
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v44;
      uint64_t v8 = *MEMORY[0x1E4F6EEA8];
      uint64_t v9 = *MEMORY[0x1E4F6EF58];
      uint64_t v10 = *MEMORY[0x1E4F6EE30];
      uint64_t v38 = *MEMORY[0x1E4F6EE78];
      uint64_t v33 = *MEMORY[0x1E4F6EEA8];
      uint64_t v34 = *(void *)v44;
      while (1)
      {
        uint64_t v11 = 0;
        uint64_t v35 = v6;
        do
        {
          if (*(void *)v44 != v7) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v43 + 1) + 8 * v11);
          v13 = [v12 elementName];
          int v14 = [v13 isEqualToString:v8];

          if (v14)
          {
            uint64_t v37 = v11;
            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            v15 = [v12 children];
            uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
            if (!v16) {
              goto LABEL_26;
            }
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v40;
            while (1)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v40 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                v21 = [v20 elementName];
                int v22 = [v21 isEqualToString:v9];

                if (v22)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                  v23 = [v20 text];
                  unint64_t v24 = [v23 string];

                  v25 = v4;
                  v26 = @"VideosTitle";
                  goto LABEL_23;
                }
                v27 = [v20 elementName];
                int v28 = [v27 isEqualToString:v10];

                if (v28)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0) {
                    continue;
                  }
                  v29 = [v20 text];
                  unint64_t v24 = [v29 string];

                  v25 = v4;
                  v26 = @"VideosDescription";
                  goto LABEL_23;
                }
                uint64_t v30 = [v20 elementName];
                int v31 = [v30 isEqualToString:v38];

                if (v31)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    unint64_t v24 = [v20 url];
                    v25 = v4;
                    v26 = @"VideosImageURL";
LABEL_23:
                    objc_setAssociatedObject(v25, v26, v24, (void *)1);

                    continue;
                  }
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v47 count:16];
              if (!v17)
              {
LABEL_26:

                uint64_t v8 = v33;
                uint64_t v7 = v34;
                uint64_t v6 = v35;
                uint64_t v11 = v37;
                break;
              }
            }
          }
          ++v11;
        }
        while (v11 != v6);
        uint64_t v6 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
        if (!v6)
        {
LABEL_29:

          return;
        }
      }
    }
  }
}

- (void)vui_updateEventDescriptors
{
  OUTLINED_FUNCTION_0_16(a1, a2);
  OUTLINED_FUNCTION_1_25(&dword_1E2BD7000, v2, v3, "Purchase events must specify the canonical ID", v4);
}

@end