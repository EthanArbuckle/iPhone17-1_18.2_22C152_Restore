@interface LNSymbolImage(Workflow)
- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:;
- (id)serializedRepresentation;
- (id)wf_image;
@end

@implementation LNSymbolImage(Workflow)

- (id)wf_image
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = [a1 platform];
  if ([v2 isEqualToString:@"UIKit"])
  {
    v3 = (void *)MEMORY[0x1E4F28DC0];
    Class UIColorClass = getUIColorClass();
    v5 = [a1 tintColorData];
    id v26 = 0;
    v6 = [v3 unarchivedObjectOfClass:UIColorClass fromData:v5 error:&v26];
    id v7 = v26;

    v8 = (void *)MEMORY[0x1E4F28DC0];
    Class UIImageSymbolConfigurationClass = getUIImageSymbolConfigurationClass();
    v10 = [a1 configurationData];
    id v25 = v7;
    v11 = [v8 unarchivedObjectOfClass:UIImageSymbolConfigurationClass fromData:v10 error:&v25];
    id v12 = v25;

    if (v11)
    {
      v13 = [MEMORY[0x1E4FB4780] configurationWithUIImageSymbolConfiguration:v11];
    }
    else
    {
      v13 = 0;
    }

    if (v12)
    {
      v14 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[LNSymbolImage(Workflow) wf_image]";
        __int16 v29 = 2112;
        id v30 = v12;
        _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_ERROR, "%s Failed to decode symbol configuration or tintColor data: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v13 = 0;
    v6 = 0;
    id v12 = 0;
  }
  v15 = (void *)MEMORY[0x1E4FB4770];
  v16 = [a1 systemName];
  v17 = [a1 inImage];
  uint64_t v18 = [v17 _renderingMode];
  if (v18 == 2) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = v18 == 1;
  }
  v20 = [v15 systemImageNamed:v16 configuration:v13 renderingMode:v19];

  if (v6)
  {
    v21 = objc_msgSend(MEMORY[0x1E4FB45E0], "colorWithCGColor:", objc_msgSend(v6, "CGColor"));
    uint64_t v22 = [v20 imageWithTintColor:v21];

    v20 = (void *)v22;
  }
  v23 = objc_msgSend(v20, "imageWithDisplayStyle:", objc_msgSend(a1, "wfImageDisplayStyleFromLNImageDisplayStyle:", objc_msgSend(a1, "displayStyle")));

  return v23;
}

- (id)serializedRepresentation
{
  v2 = objc_opt_new();
  v3 = [a1 systemName];
  objc_msgSend(v2, "if_setObjectIfNonNil:forKey:", v3, @"systemName");

  return v2;
}

- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = WFEnforceClass(v4, v5);

  if (v6)
  {
    id v7 = [v6 objectForKey:@"systemName"];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v8 = v7;
      }
      else {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0;
    }
    id v10 = v8;

    if ([v10 length])
    {
      a1 = (id)[a1 initWithSymbolSystemName:v10];
      id v9 = a1;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

@end