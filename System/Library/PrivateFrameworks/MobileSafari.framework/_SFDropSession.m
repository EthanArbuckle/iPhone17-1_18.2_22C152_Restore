@interface _SFDropSession
+ (BOOL)dropSession:(id)a3 containsItemsMatching:(void *)a4 allowedTypeIdentifiers:(id)a5 allowedClasses:(id)a6;
+ (void)dropSession:(id)a3 loadObjectsUsingLocalObjectLoader:(void *)a4 objectLoader:(void *)a5 completionHandler:(id)a6;
@end

@implementation _SFDropSession

+ (BOOL)dropSession:(id)a3 containsItemsMatching:(void *)a4 allowedTypeIdentifiers:(id)a5 allowedClasses:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [v9 localDragSession];

  if (!a4) {
    goto LABEL_5;
  }
  if (!v12) {
    goto LABEL_5;
  }
  v13 = [v9 items];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90___SFDropSession_dropSession_containsItemsMatching_allowedTypeIdentifiers_allowedClasses___block_invoke;
  v22[3] = &__block_descriptor_40_e20_B16__0__UIDragItem_8l;
  v22[4] = a4;
  char v14 = objc_msgSend(v13, "safari_containsObjectPassingTest:", v22);

  if (v14)
  {
    char v15 = 1;
  }
  else
  {
LABEL_5:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __90___SFDropSession_dropSession_containsItemsMatching_allowedTypeIdentifiers_allowedClasses___block_invoke_2;
    aBlock[3] = &unk_1E54EA878;
    id v20 = v11;
    id v16 = v9;
    id v21 = v16;
    v17 = (uint64_t (**)(void))_Block_copy(aBlock);
    if ([v10 count] && (objc_msgSend(v16, "hasItemsConformingToTypeIdentifiers:", v10) & 1) != 0) {
      char v15 = 1;
    }
    else {
      char v15 = v17[2](v17);
    }
  }
  return v15;
}

+ (void)dropSession:(id)a3 loadObjectsUsingLocalObjectLoader:(void *)a4 objectLoader:(void *)a5 completionHandler:(id)a6
{
  id v9 = (void *)MEMORY[0x1E4FB1710];
  id v10 = a6;
  id v11 = [a3 items];
  objc_msgSend(v9, "_sf_loadObjectsFromDragItems:usingLocalObjectLoader:objectLoader:completionHandler:", v11, a4, a5, v10);
}

@end