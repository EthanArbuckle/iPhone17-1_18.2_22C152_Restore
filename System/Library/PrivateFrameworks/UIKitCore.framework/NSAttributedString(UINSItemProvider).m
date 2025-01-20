@interface NSAttributedString(UINSItemProvider)
+ (id)_objectWithItemProviderData:()UINSItemProvider typeIdentifier:userInfo:error:;
+ (id)_objectWithItemProviderFileURL:()UINSItemProvider typeIdentifier:isInPlace:error:;
+ (id)_objectWithRTFDAtURL:()UINSItemProvider userInfo:error:;
+ (id)_uikit_readableTypeIdentifiersForItemProviderConsideringLinkage:()UINSItemProvider;
+ (id)writableTypeIdentifiersForItemProvider;
+ (uint64_t)_preferredRepresentationForItemProviderReadableTypeIdentifier:()UINSItemProvider;
+ (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()UINSItemProvider;
+ (uint64_t)objectWithItemProviderData:()UINSItemProvider typeIdentifier:error:;
+ (uint64_t)readableTypeIdentifiersForItemProvider;
- (id)initWithItemProviderData:()UINSItemProvider typeIdentifier:error:;
- (uint64_t)_loadFileRepresentationOfTypeIdentifier:()UINSItemProvider forItemProviderCompletionHandler:;
- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()UINSItemProvider;
- (uint64_t)loadDataWithTypeIdentifier:()UINSItemProvider forItemProviderCompletionHandler:;
- (uint64_t)writableTypeIdentifiersForItemProvider;
@end

@implementation NSAttributedString(UINSItemProvider)

+ (id)_uikit_readableTypeIdentifiersForItemProviderConsideringLinkage:()UINSItemProvider
{
  v20[8] = *MEMORY[0x1E4F143B8];
  v20[0] = @"com.apple.uikit.attributedstring";
  v3 = [(id)*MEMORY[0x1E4F444A8] identifier];
  v20[1] = v3;
  v4 = [(id)*MEMORY[0x1E4F443C0] identifier];
  v20[2] = v4;
  v5 = [(id)*MEMORY[0x1E4F444A0] identifier];
  v20[3] = v5;
  v6 = (void *)*MEMORY[0x1E4F44538];
  v7 = [(id)*MEMORY[0x1E4F44538] identifier];
  v20[4] = v7;
  v8 = (void *)*MEMORY[0x1E4F443F0];
  v9 = [(id)*MEMORY[0x1E4F443F0] identifier];
  v20[5] = v9;
  v10 = [(id)*MEMORY[0x1E4F44510] identifier];
  v20[6] = v10;
  v11 = [(id)*MEMORY[0x1E4F44470] identifier];
  v20[7] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:8];

  if (a3 && (dyld_program_sdk_at_least() & 1) == 0)
  {
    v13 = (void *)[v12 mutableCopy];
    v14 = [v6 identifier];
    v19[0] = v14;
    v15 = [v8 identifier];
    v19[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    [v13 removeObjectsInArray:v16];

    v12 = v13;
  }
  return v12;
}

+ (uint64_t)readableTypeIdentifiersForItemProvider
{
  return objc_msgSend(a1, "_uikit_readableTypeIdentifiersForItemProviderConsideringLinkage:", 1);
}

+ (uint64_t)_preferredRepresentationForItemProviderReadableTypeIdentifier:()UINSItemProvider
{
  v3 = (void *)*MEMORY[0x1E4F444A8];
  id v4 = a3;
  v5 = [v3 identifier];
  unsigned int v6 = [v4 isEqualToString:v5];

  return v6;
}

+ (id)_objectWithRTFDAtURL:()UINSItemProvider userInfo:error:
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = [a1 alloc];
  uint64_t v15 = *(void *)off_1E52D1FC0;
  v16[0] = *(void *)off_1E52D2208;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v12 = __mergedOptionDictionaries(v11, v8);

  v13 = (void *)[v10 initWithURL:v9 options:v12 documentAttributes:0 error:a5];
  return v13;
}

+ (id)_objectWithItemProviderData:()UINSItemProvider typeIdentifier:userInfo:error:
{
  v62[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:v11 allowUndeclared:1];
  v14 = [MEMORY[0x1E4F442D8] _typeWithIdentifier:@"com.apple.uikit.attributedstring" allowUndeclared:1];
  if (![v13 conformsToType:v14])
  {
    if ([v13 conformsToType:*MEMORY[0x1E4F44538]])
    {
      id v18 = [a1 alloc];
      uint64_t v19 = *(void *)off_1E52D2448;
      uint64_t v20 = *(void *)off_1E52D2070;
      v61[0] = *(void *)off_1E52D1FC0;
      v61[1] = v20;
      v62[0] = v19;
      v62[1] = MEMORY[0x1E4F1CC28];
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
      v51 = 0;
      v17 = (void *)[v18 _initWithHTMLData:v10 options:v15 documentAttributes:0 error:&v51];
      v21 = v51;
LABEL_8:
      id v16 = v21;
      goto LABEL_10;
    }
    if ([v13 conformsToType:*MEMORY[0x1E4F443F0]])
    {
      id v22 = [a1 alloc];
      uint64_t v23 = *(void *)off_1E52D2078;
      uint64_t v24 = *(void *)off_1E52D2070;
      v59[0] = *(void *)off_1E52D1FC0;
      v59[1] = v24;
      v60[0] = v23;
      v60[1] = MEMORY[0x1E4F1CC28];
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:v59 count:2];
      v50 = 0;
      v17 = (void *)[v22 _initWithHTMLData:v10 options:v15 documentAttributes:0 error:&v50];
      v21 = v50;
      goto LABEL_8;
    }
    if ([v13 conformsToType:*MEMORY[0x1E4F443C0]])
    {
      uint64_t v27 = [objc_alloc(MEMORY[0x1E4F28CF0]) initWithSerializedRepresentation:v10];
      if (v27)
      {
        uint64_t v15 = (void *)v27;
        v45 = _UITemporaryFolderURL(@"com.apple.uikit.attributedstring");
        uint64_t v28 = [v15 filename];
        v29 = (void *)v28;
        if (v28) {
          v30 = (__CFString *)v28;
        }
        else {
          v30 = @"temp.rtfd";
        }
        v44 = [v45 URLByAppendingPathComponent:v30];

        id v49 = 0;
        int v31 = [v15 writeToURL:v44 options:1 originalContentsURL:0 error:&v49];
        id v32 = v49;
        id v16 = v32;
        if (v31)
        {
          id v48 = v32;
          v17 = [(objc_class *)a1 _objectWithRTFDAtURL:v44 userInfo:v12 error:&v48];
          id v33 = v48;

          id v16 = v33;
        }
        else
        {
          v17 = 0;
        }
        v40 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v40 removeItemAtURL:v45 error:0];

        goto LABEL_10;
      }
    }
    else
    {
      if ([v13 conformsToType:*MEMORY[0x1E4F444A0]])
      {
        id v34 = [a1 alloc];
        uint64_t v57 = *(void *)off_1E52D1FC0;
        uint64_t v58 = *(void *)off_1E52D2210;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        v35 = __mergedOptionDictionaries(v15, v12);
        id v47 = 0;
        v17 = (void *)[v34 initWithData:v10 options:v35 documentAttributes:0 error:&v47];
        id v16 = v47;

        goto LABEL_10;
      }
      if ([v13 conformsToType:*MEMORY[0x1E4F44510]])
      {
        id v36 = [a1 alloc];
        uint64_t v37 = *(void *)off_1E52D21C0;
        uint64_t v38 = *(void *)off_1E52D1F88;
        v55[0] = *(void *)off_1E52D1FC0;
        v55[1] = v38;
        v56[0] = v37;
        v56[1] = &unk_1ED3F5940;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
        v39 = __mergedOptionDictionaries(v15, v12);
        id v46 = 0;
        v17 = (void *)[v36 initWithData:v10 options:v39 documentAttributes:0 error:&v46];
        id v16 = v46;

        goto LABEL_10;
      }
      if ([v13 conformsToType:*MEMORY[0x1E4F44470]])
      {
        id v41 = [a1 alloc];
        uint64_t v53 = *(void *)off_1E52D1FC0;
        uint64_t v54 = *(void *)off_1E52D21C0;
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        v43 = __mergedOptionDictionaries(v42, v12);
        v17 = (void *)[v41 initWithData:v10 options:v43 documentAttributes:0 error:0];

LABEL_31:
        id v16 = 0;
        goto LABEL_13;
      }
    }
    v17 = 0;
    goto LABEL_31;
  }
  id v52 = 0;
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v10 error:&v52];
  id v16 = v52;
  if (v15)
  {
    [v15 setRequiresSecureCoding:1];
    [v15 setDecodingFailurePolicy:0];
    v17 = [v15 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
    [v15 finishDecoding];
  }
  else
  {
    v17 = 0;
  }
LABEL_10:

  if (a6 && v16)
  {
    id v16 = v16;
    *a6 = v16;
  }
LABEL_13:
  id v25 = v17;

  return v25;
}

+ (uint64_t)objectWithItemProviderData:()UINSItemProvider typeIdentifier:error:
{
  return [a1 _objectWithItemProviderData:a3 typeIdentifier:a4 userInfo:MEMORY[0x1E4F1CC08] error:a5];
}

+ (id)_objectWithItemProviderFileURL:()UINSItemProvider typeIdentifier:isInPlace:error:
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v32 = 0;
  id v33 = (id *)&v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__148;
  id v36 = __Block_byref_object_dispose__148;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__148;
  v30 = __Block_byref_object_dispose__148;
  id v31 = 0;
  id v12 = [(id)*MEMORY[0x1E4F444A8] identifier];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__NSAttributedString_UINSItemProvider___objectWithItemProviderFileURL_typeIdentifier_isInPlace_error___block_invoke;
    aBlock[3] = &unk_1E52FF5E0;
    aBlock[4] = &v26;
    aBlock[5] = &v32;
    aBlock[6] = a1;
    v14 = _Block_copy(aBlock);
    uint64_t v15 = v14;
    if (a5)
    {
      int v16 = [v10 startAccessingSecurityScopedResource];
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F28CA0]) initWithFilePresenter:0];
      id v18 = v33;
      id obj = v33[5];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __102__NSAttributedString_UINSItemProvider___objectWithItemProviderFileURL_typeIdentifier_isInPlace_error___block_invoke_2;
      v22[3] = &unk_1E52FF608;
      id v23 = v15;
      [v17 coordinateReadingItemAtURL:v10 options:1 error:&obj byAccessor:v22];
      objc_storeStrong(v18 + 5, obj);
      if (v16) {
        [v10 stopAccessingSecurityScopedResource];
      }
    }
    else
    {
      (*((void (**)(void *, id))v14 + 2))(v14, v10);
    }
  }
  if (a6)
  {
    id v19 = v33[5];
    if (v19) {
      *a6 = v19;
    }
  }
  id v20 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v20;
}

- (id)initWithItemProviderData:()UINSItemProvider typeIdentifier:error:
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[a1 init];
  id v11 = [(id)objc_opt_class() objectWithItemProviderData:v9 typeIdentifier:v8 error:a5];

  id v12 = v11;
  return v12;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v5[0] = @"com.apple.uikit.attributedstring";
  v0 = [(id)*MEMORY[0x1E4F444A8] identifier];
  v5[1] = v0;
  v1 = [(id)*MEMORY[0x1E4F443C0] identifier];
  v5[2] = v1;
  v2 = [(id)*MEMORY[0x1E4F44510] identifier];
  v5[3] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:4];

  return v3;
}

+ (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()UINSItemProvider
{
  v3 = (void *)*MEMORY[0x1E4F444A8];
  id v4 = a3;
  v5 = [v3 identifier];
  unsigned int v6 = [v4 isEqualToString:v5];

  return v6;
}

- (uint64_t)writableTypeIdentifiersForItemProvider
{
  return [MEMORY[0x1E4F28B18] writableTypeIdentifiersForItemProvider];
}

- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()UINSItemProvider
{
  id v3 = a3;
  uint64_t v4 = [(id)objc_opt_class() _preferredRepresentationForItemProviderWritableTypeIdentifier:v3];

  return v4;
}

- (uint64_t)loadDataWithTypeIdentifier:()UINSItemProvider forItemProviderCompletionHandler:
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  if ([v6 isEqualToString:@"com.apple.uikit.attributedstring"])
  {
    id v24 = 0;
    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v24];
    id v9 = v24;
    v7[2](v7, v8, v9);
  }
  else
  {
    id v10 = [(id)*MEMORY[0x1E4F443C0] identifier];
    int v11 = [v6 isEqualToString:v10];

    if (v11)
    {
      uint64_t v12 = [a1 length];
      uint64_t v27 = *(void *)off_1E52D1FC0;
      v28[0] = *(void *)off_1E52D2208;
      int v13 = (void *)MEMORY[0x1E4F1C9E8];
      v14 = v28;
      uint64_t v15 = &v27;
      uint64_t v16 = 1;
    }
    else
    {
      v17 = [(id)*MEMORY[0x1E4F44510] identifier];
      int v18 = [v6 isEqualToString:v17];

      if (!v18)
      {
        v7[2](v7, 0, 0);
        goto LABEL_9;
      }
      uint64_t v12 = [a1 length];
      uint64_t v19 = *(void *)off_1E52D21C0;
      uint64_t v20 = *(void *)off_1E52D1F88;
      v25[0] = *(void *)off_1E52D1FC0;
      v25[1] = v20;
      v26[0] = v19;
      v26[1] = &unk_1ED3F5940;
      int v13 = (void *)MEMORY[0x1E4F1C9E8];
      v14 = v26;
      uint64_t v15 = v25;
      uint64_t v16 = 2;
    }
    v21 = [v13 dictionaryWithObjects:v14 forKeys:v15 count:v16];
    id v22 = objc_msgSend(a1, "dataFromRange:documentAttributes:error:", 0, v12, v21, 0);

    v7[2](v7, v22, 0);
  }
LABEL_9:

  return 0;
}

- (uint64_t)_loadFileRepresentationOfTypeIdentifier:()UINSItemProvider forItemProviderCompletionHandler:
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = (void *)*MEMORY[0x1E4F444A8];
  id v8 = a3;
  id v9 = [v7 identifier];
  int v10 = [v8 isEqualToString:v9];

  if (v10)
  {
    uint64_t v11 = [a1 length];
    uint64_t v24 = *(void *)off_1E52D1FC0;
    v25[0] = *(void *)off_1E52D2208;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v23 = 0;
    int v13 = objc_msgSend(a1, "fileWrapperFromRange:documentAttributes:error:", 0, v11, v12, &v23);
    id v14 = v23;

    if (v13)
    {
      uint64_t v15 = _UITemporaryFolderURL(@"com.apple.uikit.attributedstring");
      uint64_t v16 = [v7 localizedDescription];
      v17 = [v16 stringByAppendingPathExtensionForType:v7];
      int v18 = [v15 URLByAppendingPathComponent:v17];
      id v22 = v14;
      [v13 writeToURL:v18 options:1 originalContentsURL:0 error:&v22];
      id v19 = v22;

      if (v18 && !v19)
      {
        (*((void (**)(id, void *, void, void))v6 + 2))(v6, v18, 0, 0);
        if (!v15) {
          goto LABEL_12;
        }
        goto LABEL_11;
      }
      id v14 = v19;
    }
    else
    {
      int v18 = 0;
      uint64_t v15 = 0;
    }
    (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v14);

    if (!v15)
    {
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v20 removeItemAtURL:v15 error:0];

    goto LABEL_12;
  }
  (*((void (**)(id, void, void, void))v6 + 2))(v6, 0, 0, 0);
LABEL_13:

  return 0;
}

@end