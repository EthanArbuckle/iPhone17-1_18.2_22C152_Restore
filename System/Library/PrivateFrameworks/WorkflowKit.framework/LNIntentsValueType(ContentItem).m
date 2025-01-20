@interface LNIntentsValueType(ContentItem)
- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem;
- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:;
@end

@implementation LNIntentsValueType(ContentItem)

- (id)wf_contentItemFromLinkValue:()ContentItem appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [a1 typeIdentifier];
  if (v14 <= 11)
  {
    if (v14)
    {
      if (v14 != 3)
      {
LABEL_11:
        id v17 = [v10 value];
        if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v18 = objc_alloc(MEMORY[0x1E4F302A8]);
          if (v12) {
            id v19 = v12;
          }
          else {
            id v19 = v11;
          }
          v20 = (void *)[v18 initWithLocalizedName:0 bundleIdentifier:v19 extensionBundleIdentifier:0 counterpartIdentifiers:0 teamIdentifier:v13 supportedIntents:0 bundleURL:0 documentTypes:0];
          v21 = [MEMORY[0x1E4F5A788] locationWithAppDescriptor:v20];
          v22 = (void *)MEMORY[0x1E4F5A848];
          v23 = objc_msgSend(v17, "wf_fileRepresentation");
          v24 = [v22 itemWithFile:v23 origin:v21 disclosureLevel:1];
        }
        else
        {
          v24 = 0;
        }
        goto LABEL_39;
      }
      v15 = [v10 value];
      if (v15)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v16 = v15;
        }
        else {
          v16 = 0;
        }
      }
      else
      {
        v16 = 0;
      }
      id v31 = v16;

      id v17 = [MEMORY[0x1E4F5A7F0] cnContactWithINPerson:v31];

      v32 = (void *)MEMORY[0x1E4F5A7F8];
    }
    else
    {
      v29 = [v10 value];
      if (v29)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v30 = v29;
        }
        else {
          v30 = 0;
        }
      }
      else
      {
        v30 = 0;
      }
      id v33 = v30;

      id v17 = (id)[objc_alloc(MEMORY[0x1E4F5A778]) initWithBundleIdentifier:v33 localizedName:0];
      v32 = (void *)MEMORY[0x1E4F5A780];
    }
  }
  else if (v14 == 14)
  {
    v25 = [v10 value];
    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v26 = v25;
      }
      else {
        v26 = 0;
      }
    }
    else
    {
      v26 = 0;
    }
    id v17 = v26;

    v32 = (void *)MEMORY[0x1E4F5A898];
  }
  else
  {
    if (v14 != 13) {
      goto LABEL_11;
    }
    v27 = [v10 value];
    if (v27)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v28 = v27;
      }
      else {
        v28 = 0;
      }
    }
    else
    {
      v28 = 0;
    }
    id v17 = v28;

    v32 = (void *)MEMORY[0x1E4F5A9C8];
  }
  v24 = [v32 itemWithObject:v17];
LABEL_39:

  return v24;
}

- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  [a1 typeIdentifier];
  v1 = objc_opt_class();
  return v1;
}

@end