@interface LNImage(Workflow)
- (BOOL)wfImageDisplayStyleFromLNImageDisplayStyle:()Workflow;
- (id)contextualActionIcon;
- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:;
- (id)serializedRepresentation;
- (id)spotlightIconWithParameterIdentifier:()Workflow;
- (id)wf_image;
@end

@implementation LNImage(Workflow)

- (BOOL)wfImageDisplayStyleFromLNImageDisplayStyle:()Workflow
{
  return a3 == 1;
}

- (id)serializedRepresentation
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v1 = [a1 inImage];
  if (v1)
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F30520]);
    v3 = [v2 encodeObject:v1];
    v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      v6 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v8 = 136315138;
        v9 = "-[LNImage(Workflow) serializedRepresentation]";
        _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_ERROR, "%s Failed to encode INImage into serialized representation.", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = WFEnforceClass(v4, v5);
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E4F30518]);
    int v8 = [v7 decodeObjectOfClass:objc_opt_class() from:v4];
    if (v8)
    {
      a1 = (id)[a1 initWithINImage:v8];
      id v9 = a1;
    }
    else
    {
      uint64_t v10 = getWFAppIntentsLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 136315138;
        v13 = "-[LNImage(Workflow) initWithSerializedRepresentation:variableProvider:parameter:]";
        _os_log_impl(&dword_1C7F0A000, v10, OS_LOG_TYPE_ERROR, "%s Failed to decode INImage from serialized representation.", (uint8_t *)&v12, 0xCu);
      }

      id v9 = 0;
    }
  }
  else
  {
    v7 = getWFAppIntentsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315138;
      v13 = "-[LNImage(Workflow) initWithSerializedRepresentation:variableProvider:parameter:]";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s Failed to decode INImage: no dictionaryRepresentation was provided.", (uint8_t *)&v12, 0xCu);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)spotlightIconWithParameterIdentifier:()Workflow
{
  id v4 = a3;
  uint64_t v5 = [a1 inImage];
  [a1 displayStyle];
  v6 = (void *)WFContextualActionIconDisplayStyleForLNImageDisplayStyle();
  if ([v5 _isSystem]
    && ([v5 _name], (v7 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([v5 _imageData], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_5;
  }
  uint64_t v10 = [v5 _uri];

  if (v10) {
    goto LABEL_5;
  }
  if (v4)
  {
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4FB4658]) initWithLNPropertyIdentifier:v4 displayStyle:v6];
    goto LABEL_6;
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__13302;
  v25 = __Block_byref_object_dispose__13303;
  id v26 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __58__LNImage_Workflow__spotlightIconWithParameterIdentifier___block_invoke;
  v18 = &unk_1E654F138;
  v20 = &v21;
  int v12 = v11;
  v19 = v12;
  [v5 _retrieveImageFilePathWithReply:&v15];
  dispatch_time_t v13 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v12, v13);
  uint64_t v14 = v22[5];
  if (v14)
  {
    v6 = objc_msgSend(MEMORY[0x1E4FB4658], "iconWithImageURL:displayStyle:", v22[5], v6, v15, v16, v17, v18);
  }

  _Block_object_dispose(&v21, 8);
  if (!v14)
  {
LABEL_5:
    uint64_t v8 = objc_msgSend(a1, "contextualActionIcon", v15, v16, v17, v18);
LABEL_6:
    v6 = (void *)v8;
  }

  return v6;
}

- (id)contextualActionIcon
{
  id v2 = [a1 inImage];
  if ([v2 _isSystem]
    && ([v2 _name], v3 = objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    id v4 = (void *)MEMORY[0x1E4FB4658];
    uint64_t v5 = [v2 _name];
    v6 = [v4 iconWithSystemName:v5];
  }
  else
  {
    [a1 displayStyle];
    uint64_t v7 = WFContextualActionIconDisplayStyleForLNImageDisplayStyle();
    uint64_t v8 = [v2 _imageData];

    if (v8)
    {
      id v9 = (void *)MEMORY[0x1E4FB4658];
      uint64_t v10 = [v2 _imageData];
      uint64_t v11 = [v9 iconWithImageData:v10 scale:v7 displayStyle:0.0];
    }
    else
    {
      int v12 = [v2 _uri];

      if (!v12)
      {
        uint64_t v25 = 0;
        id v26 = &v25;
        uint64_t v27 = 0x3032000000;
        v28 = __Block_byref_object_copy__13302;
        v29 = __Block_byref_object_dispose__13303;
        id v30 = 0;
        dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
        uint64_t v19 = MEMORY[0x1E4F143A8];
        uint64_t v20 = 3221225472;
        uint64_t v21 = __41__LNImage_Workflow__contextualActionIcon__block_invoke;
        v22 = &unk_1E654F110;
        v24 = &v25;
        uint64_t v16 = v15;
        uint64_t v23 = v16;
        objc_msgSend(v2, "wf_transformUsingCodableAttribute:completionHandler:", 0, &v19);
        dispatch_time_t v17 = dispatch_time(0, 2000000000);
        dispatch_semaphore_wait(v16, v17);
        uint64_t v18 = v26[5];
        if (v18)
        {
          v6 = objc_msgSend(MEMORY[0x1E4FB4658], "iconWithImageData:scale:displayStyle:", v18, v7, 0.0, v19, v20, v21, v22);
        }
        else
        {
          v6 = 0;
        }

        _Block_object_dispose(&v25, 8);
        goto LABEL_9;
      }
      dispatch_time_t v13 = (void *)MEMORY[0x1E4FB4658];
      uint64_t v10 = [v2 _uri];
      uint64_t v11 = [v13 iconWithImageURL:v10 displayStyle:v7];
    }
    v6 = (void *)v11;
  }
LABEL_9:

  return v6;
}

- (id)wf_image
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__13302;
  uint64_t v23 = __Block_byref_object_dispose__13303;
  id v24 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v3 = [a1 inImage];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  dispatch_semaphore_t v15 = __29__LNImage_Workflow__wf_image__block_invoke;
  uint64_t v16 = &unk_1E654F110;
  uint64_t v18 = &v19;
  id v4 = v2;
  dispatch_time_t v17 = v4;
  objc_msgSend(v3, "wf_transformUsingCodableAttribute:completionHandler:", 0, &v13);

  dispatch_time_t v5 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v4, v5);
  v6 = objc_msgSend((id)v20[5], "wf_image", v13, v14, v15, v16);
  uint64_t v7 = [a1 inImage];
  uint64_t v8 = [v7 _renderingMode];

  if (v8)
  {
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v6 imageWithRenderingMode:v9];

    v6 = (void *)v10;
  }
  uint64_t v11 = objc_msgSend(v6, "imageWithDisplayStyle:", objc_msgSend(a1, "wfImageDisplayStyleFromLNImageDisplayStyle:", objc_msgSend(a1, "displayStyle")));

  _Block_object_dispose(&v19, 8);
  return v11;
}

@end