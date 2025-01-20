@interface LNISIconImage(Workflow)
- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:;
- (id)serializedRepresentation;
- (void)wf_image;
@end

@implementation LNISIconImage(Workflow)

- (id)serializedRepresentation
{
  v2 = objc_opt_new();
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "iconType"));
  objc_msgSend(v2, "if_setObjectIfNonNil:forKey:", v3, @"iconType");

  v4 = [a1 identifier];
  objc_msgSend(v2, "if_setObjectIfNonNil:forKey:", v4, @"identifier");

  return v2;
}

- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = WFEnforceClass(v4, v5);

  if (v6)
  {
    v7 = [v6 objectForKey:@"identifier"];
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
      v11 = [v6 objectForKey:@"iconType"];
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v12 = v11;
        }
        else {
          v12 = 0;
        }
      }
      else
      {
        v12 = 0;
      }
      id v13 = v12;

      uint64_t v14 = [v13 integerValue];
      a1 = (id)[a1 initWithIconType:v14 identifier:v10];
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

- (void)wf_image
{
  uint64_t v2 = [a1 iconType];
  if (v2 == 1)
  {
    id v6 = objc_alloc((Class)getISIconClass());
    id v4 = [a1 identifier];
    uint64_t v5 = [v6 initWithType:v4];
    goto LABEL_5;
  }
  if (!v2)
  {
    id v3 = objc_alloc((Class)getISIconClass());
    id v4 = [a1 identifier];
    uint64_t v5 = [v3 initWithBundleIdentifier:v4];
LABEL_5:
    v7 = (void *)v5;

    goto LABEL_7;
  }
  v7 = 0;
LABEL_7:
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  v8 = (void *)getISImageDescriptorClass_softClass;
  uint64_t v29 = getISImageDescriptorClass_softClass;
  if (!getISImageDescriptorClass_softClass)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getISImageDescriptorClass_block_invoke;
    v24 = &unk_1E6558B78;
    v25 = &v26;
    __getISImageDescriptorClass_block_invoke((uint64_t)&v21);
    v8 = (void *)v27[3];
  }
  id v9 = v8;
  _Block_object_dispose(&v26, 8);
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  id v10 = (void *)getkISImageDescriptorTableUINameSymbolLoc_ptr;
  uint64_t v29 = getkISImageDescriptorTableUINameSymbolLoc_ptr;
  if (!getkISImageDescriptorTableUINameSymbolLoc_ptr)
  {
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __getkISImageDescriptorTableUINameSymbolLoc_block_invoke;
    v24 = &unk_1E6558B78;
    v25 = &v26;
    v11 = IconServicesLibrary();
    v12 = dlsym(v11, "kISImageDescriptorTableUIName");
    *(void *)(v25[1] + 24) = v12;
    getkISImageDescriptorTableUINameSymbolLoc_ptr = *(void *)(v25[1] + 24);
    id v10 = (void *)v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v10)
  {
    id v13 = [v9 imageDescriptorNamed:*v10];
    uint64_t v14 = [v7 prepareImageForDescriptor:v13];
    uint64_t v15 = [v14 CGImage];
    id v16 = objc_alloc(MEMORY[0x1E4FB4770]);
    [v13 scale];
    v17 = objc_msgSend(v16, "initWithCGImage:scale:orientation:", v15, 1);

    id v18 = v17;
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = [NSString stringWithUTF8String:"ISImageDescriptorName getkISImageDescriptorTableUIName(void)"];
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"LNImage+Workflow.m", 25, @"%s", dlerror());

    __break(1u);
  }
}

@end