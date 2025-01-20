@interface UISUIActivityExtensionItemData
+ (BOOL)supportsSecureCoding;
+ (id)_extensionItemsByPreparingToSendExtensionItems:(id)a3 toDestinationExtension:(id)a4;
+ (id)_onBackgroundQueue_extensionItemsByPreparingToSendExtensionItems:(id)a3 toDestinationExtension:(id)a4;
- (NSArray)extensionItems;
- (NSDictionary)openURLAnnotationsByURL;
- (NSMutableDictionary)attachmentNamesByItemUUID;
- (NSMutableDictionary)dataTypesByItemUUID;
- (NSMutableDictionary)previewImageDataByItemUUID;
- (NSMutableDictionary)previewImagesByItemUUID;
- (NSMutableDictionary)subjectsByItemUUID;
- (UISUIActivityExtensionItemData)init;
- (UISUIActivityExtensionItemData)initWithCoder:(id)a3;
- (__CFDictionary)itemProviderOrExtensionItemWithMetadataToUUID;
- (id)_getItemUUIDForItem:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_uuidMappingDataForTemporaryAttachmentToExtensionItem:(id)a3 attachments:(id)a4;
- (id)allDataTypes;
- (id)attachmentNameForItem:(id)a3;
- (id)dataTypeForItem:(id)a3;
- (id)previewImageDataForItem:(id)a3;
- (id)previewImageForItem:(id)a3;
- (id)subjectForItem:(id)a3;
- (void)_appendTemporaryUUIDMappingAttachmentToExtensionItem:(id)a3;
- (void)_changeUUIDMappingFromExtensionItems:(id)a3 toClonedExtensionItems:(id)a4;
- (void)_loadItemProviderOrExtensionItemWithMetadataToUUIDFromTemporaryUUIDMappingAttachedToExtensionItems:(id)a3;
- (void)_removeTemporaryUUIDMappingAttachmentFromExtensionItems:(id)a3;
- (void)_setItemUUID:(id)a3 forItem:(id)a4;
- (void)addAttachmentName:(id)a3 forItem:(id)a4;
- (void)addDataType:(id)a3 forItem:(id)a4;
- (void)addPreviewImage:(id)a3 forItem:(id)a4;
- (void)addPreviewImageData:(id)a3 forItem:(id)a4;
- (void)addSubject:(id)a3 forItem:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)prepareForSendingAsCompletionToHostWithAuditToken:(id *)a3;
- (void)prepareForSendingToExtension:(id)a3;
- (void)setExtensionItems:(id)a3;
- (void)setOpenURLAnnotationsByURL:(id)a3;
@end

@implementation UISUIActivityExtensionItemData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUIActivityExtensionItemData)init
{
  v16.receiver = self;
  v16.super_class = (Class)UISUIActivityExtensionItemData;
  v2 = [(UISUIActivityExtensionItemData *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    attachmentNamesByItemUUID = v2->_attachmentNamesByItemUUID;
    v2->_attachmentNamesByItemUUID = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    subjectsByItemUUID = v2->_subjectsByItemUUID;
    v2->_subjectsByItemUUID = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    previewImagesByItemUUID = v2->_previewImagesByItemUUID;
    v2->_previewImagesByItemUUID = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    previewImageDataByItemUUID = v2->_previewImageDataByItemUUID;
    v2->_previewImageDataByItemUUID = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    dataTypesByItemUUID = v2->_dataTypesByItemUUID;
    v2->_dataTypesByItemUUID = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    openURLAnnotationsByURL = v2->_openURLAnnotationsByURL;
    v2->_openURLAnnotationsByURL = (NSDictionary *)v13;

    v2->_itemProviderOrExtensionItemWithMetadataToUUID = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  }
  return v2;
}

- (UISUIActivityExtensionItemData)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UISUIActivityExtensionItemData *)self init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_extensionItems);
    uint64_t v7 = _UISecureDecodeExtensionItemsWithKey(v4, v6);
    extensionItems = v5->_extensionItems;
    v5->_extensionItems = (NSArray *)v7;

    [(UISUIActivityExtensionItemData *)v5 _loadItemProviderOrExtensionItemWithMetadataToUUIDFromTemporaryUUIDMappingAttachedToExtensionItems:v5->_extensionItems];
    [(UISUIActivityExtensionItemData *)v5 _removeTemporaryUUIDMappingAttachmentFromExtensionItems:v5->_extensionItems];
    uint64_t v9 = NSStringFromSelector(sel_attachmentNamesByItemUUID);
    uint64_t v10 = _UISecureDecodeExtensionItemsWithKey(v4, v9);
    attachmentNamesByItemUUID = v5->_attachmentNamesByItemUUID;
    v5->_attachmentNamesByItemUUID = (NSMutableDictionary *)v10;

    v12 = NSStringFromSelector(sel_subjectsByItemUUID);
    uint64_t v13 = _UISecureDecodeExtensionItemsWithKey(v4, v12);
    subjectsByItemUUID = v5->_subjectsByItemUUID;
    v5->_subjectsByItemUUID = (NSMutableDictionary *)v13;

    v15 = NSStringFromSelector(sel_previewImagesByItemUUID);
    uint64_t v16 = _UISecureDecodeExtensionItemsWithKey(v4, v15);
    previewImagesByItemUUID = v5->_previewImagesByItemUUID;
    v5->_previewImagesByItemUUID = (NSMutableDictionary *)v16;

    v18 = NSStringFromSelector(sel_previewImageDataByItemUUID);
    uint64_t v19 = _UISecureDecodeExtensionItemsWithKey(v4, v18);
    previewImageDataByItemUUID = v5->_previewImageDataByItemUUID;
    v5->_previewImageDataByItemUUID = (NSMutableDictionary *)v19;

    v21 = NSStringFromSelector(sel_dataTypesByItemUUID);
    uint64_t v22 = _UISecureDecodeExtensionItemsWithKey(v4, v21);
    dataTypesByItemUUID = v5->_dataTypesByItemUUID;
    v5->_dataTypesByItemUUID = (NSMutableDictionary *)v22;

    v24 = _UISecureStandardPropertyListClasses();
    v25 = NSStringFromSelector(sel_openURLAnnotationsByURL);
    uint64_t v26 = [v4 decodeObjectOfClasses:v24 forKey:v25];
    openURLAnnotationsByURL = v5->_openURLAnnotationsByURL;
    v5->_openURLAnnotationsByURL = (NSDictionary *)v26;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  extensionItems = self->_extensionItems;
  id v5 = a3;
  [(UISUIActivityExtensionItemData *)self _appendTemporaryUUIDMappingAttachmentToExtensionItem:extensionItems];
  v6 = self->_extensionItems;
  uint64_t v7 = NSStringFromSelector(sel_extensionItems);
  [v5 encodeObject:v6 forKey:v7];

  [(UISUIActivityExtensionItemData *)self _removeTemporaryUUIDMappingAttachmentFromExtensionItems:self->_extensionItems];
  attachmentNamesByItemUUID = self->_attachmentNamesByItemUUID;
  uint64_t v9 = NSStringFromSelector(sel_attachmentNamesByItemUUID);
  [v5 encodeObject:attachmentNamesByItemUUID forKey:v9];

  subjectsByItemUUID = self->_subjectsByItemUUID;
  uint64_t v11 = NSStringFromSelector(sel_subjectsByItemUUID);
  [v5 encodeObject:subjectsByItemUUID forKey:v11];

  previewImagesByItemUUID = self->_previewImagesByItemUUID;
  uint64_t v13 = NSStringFromSelector(sel_previewImagesByItemUUID);
  [v5 encodeObject:previewImagesByItemUUID forKey:v13];

  previewImageDataByItemUUID = self->_previewImageDataByItemUUID;
  v15 = NSStringFromSelector(sel_previewImageDataByItemUUID);
  [v5 encodeObject:previewImageDataByItemUUID forKey:v15];

  dataTypesByItemUUID = self->_dataTypesByItemUUID;
  v17 = NSStringFromSelector(sel_dataTypesByItemUUID);
  [v5 encodeObject:dataTypesByItemUUID forKey:v17];

  openURLAnnotationsByURL = self->_openURLAnnotationsByURL;
  NSStringFromSelector(sel_openURLAnnotationsByURL);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:openURLAnnotationsByURL forKey:v19];
}

- (void)dealloc
{
  itemProviderOrExtensionItemWithMetadataToUUID = self->_itemProviderOrExtensionItemWithMetadataToUUID;
  if (itemProviderOrExtensionItemWithMetadataToUUID) {
    CFRelease(itemProviderOrExtensionItemWithMetadataToUUID);
  }
  v4.receiver = self;
  v4.super_class = (Class)UISUIActivityExtensionItemData;
  [(UISUIActivityExtensionItemData *)&v4 dealloc];
}

- (void)addAttachmentName:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:a4 createIfNeeded:1];
  [(NSMutableDictionary *)self->_attachmentNamesByItemUUID setObject:v6 forKey:v7];
}

- (id)attachmentNameForItem:(id)a3
{
  objc_super v4 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:a3 createIfNeeded:0];
  id v5 = [(NSMutableDictionary *)self->_attachmentNamesByItemUUID objectForKeyedSubscript:v4];

  return v5;
}

- (void)addSubject:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:a4 createIfNeeded:1];
  [(NSMutableDictionary *)self->_subjectsByItemUUID setObject:v6 forKey:v7];
}

- (id)subjectForItem:(id)a3
{
  objc_super v4 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:a3 createIfNeeded:0];
  id v5 = [(NSMutableDictionary *)self->_subjectsByItemUUID objectForKeyedSubscript:v4];

  return v5;
}

- (void)addPreviewImage:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:a4 createIfNeeded:1];
  [(NSMutableDictionary *)self->_previewImagesByItemUUID setObject:v6 forKey:v7];
}

- (id)previewImageForItem:(id)a3
{
  objc_super v4 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:a3 createIfNeeded:0];
  id v5 = [(NSMutableDictionary *)self->_previewImagesByItemUUID objectForKeyedSubscript:v4];

  return v5;
}

- (void)addPreviewImageData:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:a4 createIfNeeded:1];
  [(NSMutableDictionary *)self->_previewImageDataByItemUUID setObject:v6 forKey:v7];
}

- (id)previewImageDataForItem:(id)a3
{
  objc_super v4 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:a3 createIfNeeded:0];
  id v5 = [(NSMutableDictionary *)self->_previewImageDataByItemUUID objectForKeyedSubscript:v4];

  return v5;
}

- (void)addDataType:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  id v7 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:a4 createIfNeeded:1];
  [(NSMutableDictionary *)self->_dataTypesByItemUUID setObject:v6 forKey:v7];
}

- (id)dataTypeForItem:(id)a3
{
  objc_super v4 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:a3 createIfNeeded:0];
  id v5 = [(NSMutableDictionary *)self->_dataTypesByItemUUID objectForKeyedSubscript:v4];

  return v5;
}

- (id)allDataTypes
{
  return (id)[(NSMutableDictionary *)self->_dataTypesByItemUUID allValues];
}

- (void)prepareForSendingToExtension:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = [(UISUIActivityExtensionItemData *)self extensionItems];
  id v7 = [v5 _extensionItemsByPreparingToSendExtensionItems:v6 toDestinationExtension:v4];

  [(UISUIActivityExtensionItemData *)self _changeUUIDMappingFromExtensionItems:self->_extensionItems toClonedExtensionItems:v7];
  [(UISUIActivityExtensionItemData *)self setExtensionItems:v7];
}

- (void)prepareForSendingAsCompletionToHostWithAuditToken:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = [(UISUIActivityExtensionItemData *)self extensionItems];
  long long v5 = *(_OWORD *)&a3->var0[4];
  long long v30 = *(_OWORD *)a3->var0;
  long long v31 = v5;
  id v6 = v4;
  Class v7 = NSClassFromString(&cfstr_Nsitemprovider.isa);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v26 + 1) + 8 * v8);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v10 = [v9 attachments];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v22 + 1) + 8 * v14);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v16 = [(objc_class *)v7 alloc];
                v21[0] = v30;
                v21[1] = v31;
                v17 = [(objc_class *)v16 initWithItemProvider:v15 destinationProcessAuditToken:v21];
                [v15 setValue:v17 forKey:@"_loadOperator"];
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v32 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v20);
  }
}

+ (id)_onBackgroundQueue_extensionItemsByPreparingToSendExtensionItems:(id)a3 toDestinationExtension:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  Class v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  uint64_t v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __122__UISUIActivityExtensionItemData__onBackgroundQueue_extensionItemsByPreparingToSendExtensionItems_toDestinationExtension___block_invoke;
  v12[3] = &unk_1E5A22E50;
  id v8 = v6;
  id v13 = v8;
  v15 = &v16;
  uint64_t v9 = v7;
  uint64_t v14 = v9;
  [v8 beginExtensionRequestWithInputItems:v5 completion:v12];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __122__UISUIActivityExtensionItemData__onBackgroundQueue_extensionItemsByPreparingToSendExtensionItems_toDestinationExtension___block_invoke(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) _extensionContextForUUID:a2];
  uint64_t v3 = [v6 inputItems];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)_extensionItemsByPreparingToSendExtensionItems:(id)a3 toDestinationExtension:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v13 = 0;
  id v6 = [v5 beginExtensionRequestWithInputItems:a3 error:&v13];
  id v7 = v13;
  if (v7)
  {
    id v8 = share_sheet_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v5 identifier];
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      __int16 v16 = 2114;
      id v17 = v7;
      _os_log_impl(&dword_1A0AD8000, v8, OS_LOG_TYPE_DEFAULT, "Error preparing extension items to send to destination extension (%{public}@). Error = %{public}@", buf, 0x16u);
    }
  }
  id v10 = [v5 _extensionContextForUUID:v6];
  uint64_t v11 = [v10 inputItems];

  return v11;
}

- (void)_loadItemProviderOrExtensionItemWithMetadataToUUIDFromTemporaryUUIDMappingAttachedToExtensionItems:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __133__UISUIActivityExtensionItemData__loadItemProviderOrExtensionItemWithMetadataToUUIDFromTemporaryUUIDMappingAttachedToExtensionItems___block_invoke;
  v33[3] = &unk_1E5A22E78;
  v33[4] = self;
  id v5 = (void (**)(void, void, void))MEMORY[0x1A6229A90](v33);
  itemProviderOrExtensionItemWithMetadataToUUID = self->_itemProviderOrExtensionItemWithMetadataToUUID;
  if (itemProviderOrExtensionItemWithMetadataToUUID) {
    CFRelease(itemProviderOrExtensionItemWithMetadataToUUID);
  }
  self->_itemProviderOrExtensionItemWithMetadataToUUID = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v27 = *(void *)v30;
    uint64_t v26 = *MEMORY[0x1E4F284E8];
    do
    {
      uint64_t v9 = 0;
      uint64_t v24 = v8;
      do
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        uint64_t v11 = [v10 attachments];
        uint64_t v12 = [v11 lastObject];
        id v13 = [v12 userInfo];
        uint64_t v14 = [v13 objectForKeyedSubscript:@"UUIDMappingData"];

        if (v14)
        {
          long long v28 = v14;
          v15 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v14 error:0];
          __int16 v16 = _UISecureStandardPropertyListClasses();
          id v17 = [v15 decodeObjectOfClasses:v16 forKey:v26];

          if (v17)
          {
            uint64_t v18 = [v17 objectForKeyedSubscript:@"extensionItemUUID"];
            ((void (**)(void, void *, void *))v5)[2](v5, v10, v18);

            uint64_t v19 = [v17 objectForKeyedSubscript:@"attachmentUUIDs"];
            if ([v19 count])
            {
              unint64_t v20 = 0;
              do
              {
                id v21 = [v10 attachments];
                long long v22 = [v21 objectAtIndexedSubscript:v20];
                long long v23 = [v19 objectAtIndexedSubscript:v20];
                ((void (**)(void, void *, void *))v5)[2](v5, v22, v23);

                ++v20;
              }
              while (v20 < [v19 count]);
            }

            uint64_t v8 = v24;
            uint64_t v14 = v28;
          }
        }

        ++v9;
      }
      while (v9 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }
}

void __133__UISUIActivityExtensionItemData__loadItemProviderOrExtensionItemWithMetadataToUUIDFromTemporaryUUIDMappingAttachedToExtensionItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA98] null];
  char v7 = [v6 isEqual:v5];

  if ((v7 & 1) == 0) {
    [*(id *)(a1 + 32) _setItemUUID:v5 forItem:v8];
  }
}

- (void)_appendTemporaryUUIDMappingAttachmentToExtensionItem:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = [v8 attachments];
        id v10 = (void *)[v9 mutableCopy];
        uint64_t v11 = v10;
        if (v10)
        {
          id v12 = v10;
        }
        else
        {
          id v12 = [MEMORY[0x1E4F1CA48] array];
        }
        id v13 = v12;

        uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithItem:&stru_1EF308000 typeIdentifier:@"com.apple.UISUIActivityExtensionItemData.uuidMapping"];
        long long v22 = @"UUIDMappingData";
        v15 = [(UISUIActivityExtensionItemData *)self _uuidMappingDataForTemporaryAttachmentToExtensionItem:v8 attachments:v13];
        long long v23 = v15;
        __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
        [v14 setUserInfo:v16];

        [v13 addObject:v14];
        [v8 setAttachments:v13];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v5);
  }
}

- (void)_removeTemporaryUUIDMappingAttachmentFromExtensionItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = [v8 attachments];
        id v10 = [v9 lastObject];
        uint64_t v11 = [v10 userInfo];
        id v12 = [v11 objectForKey:@"UUIDMappingData"];

        if (v12)
        {
          id v13 = [v8 attachments];
          uint64_t v14 = (void *)[v13 mutableCopy];

          [v14 removeLastObject];
          [v8 setAttachments:v14];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
}

- (id)_uuidMappingDataForTemporaryAttachmentToExtensionItem:(id)a3 attachments:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v25 = v6;
  uint64_t v9 = [(UISUIActivityExtensionItemData *)self _getItemUUIDForItem:v6 createIfNeeded:0];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F1CA98] null];
  }
  uint64_t v24 = v11;

  id v12 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v13 = v7;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v27 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", *(void *)(*((void *)&v26 + 1) + 8 * i), 0, v24);
        long long v19 = v18;
        if (v18)
        {
          id v20 = v18;
        }
        else
        {
          id v20 = [MEMORY[0x1E4F1CA98] null];
        }
        long long v21 = v20;

        [v12 addObject:v21];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v15);
  }

  [v8 setObject:v24 forKeyedSubscript:@"extensionItemUUID"];
  [v8 setObject:v12 forKeyedSubscript:@"attachmentUUIDs"];
  long long v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];

  return v22;
}

- (void)_changeUUIDMappingFromExtensionItems:(id)a3 toClonedExtensionItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __94__UISUIActivityExtensionItemData__changeUUIDMappingFromExtensionItems_toClonedExtensionItems___block_invoke;
  v27[3] = &unk_1E5A21CF8;
  v27[4] = self;
  id v8 = (void (**)(void, void, void))MEMORY[0x1A6229A90](v27);
  long long v26 = v6;
  unint64_t v9 = [v6 count];
  unint64_t v10 = [v7 count];
  if (v9 >= v10) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  unint64_t v25 = v11;
  if (v11)
  {
    uint64_t v12 = 0;
    do
    {
      id v13 = [v26 objectAtIndexedSubscript:v12];
      uint64_t v14 = [v7 objectAtIndexedSubscript:v12];
      ((void (**)(void, void *, void *))v8)[2](v8, v13, v14);

      uint64_t v15 = [v26 objectAtIndexedSubscript:v12];
      uint64_t v16 = [v15 attachments];

      long long v17 = [v7 objectAtIndexedSubscript:v12];
      long long v18 = [v17 attachments];

      unint64_t v19 = [v16 count];
      unint64_t v20 = [v18 count];
      if (v19 >= v20) {
        unint64_t v21 = v20;
      }
      else {
        unint64_t v21 = v19;
      }
      if (v21)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          long long v23 = [v16 objectAtIndexedSubscript:i];
          uint64_t v24 = [v18 objectAtIndexedSubscript:i];
          ((void (**)(void, void *, void *))v8)[2](v8, v23, v24);
        }
      }

      ++v12;
    }
    while (v12 != v25);
  }
}

void __94__UISUIActivityExtensionItemData__changeUUIDMappingFromExtensionItems_toClonedExtensionItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) _getItemUUIDForItem:v7 createIfNeeded:0];
  if (v6)
  {
    [*(id *)(a1 + 32) _setItemUUID:v6 forItem:v5];
    [*(id *)(a1 + 32) _setItemUUID:0 forItem:v7];
  }
}

- (void)_setItemUUID:(id)a3 forItem:(id)a4
{
  id value = a3;
  id v6 = a4;
  if (value || !v6)
  {
    if (value && v6) {
      CFDictionarySetValue(self->_itemProviderOrExtensionItemWithMetadataToUUID, v6, value);
    }
  }
  else
  {
    CFDictionaryRemoveValue(self->_itemProviderOrExtensionItemWithMetadataToUUID, v6);
  }
}

- (id)_getItemUUIDForItem:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = CFDictionaryGetValue(self->_itemProviderOrExtensionItemWithMetadataToUUID, v6);
  if (v7) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = !v4;
  }
  if (!v8)
  {
    id v7 = [MEMORY[0x1E4F29128] UUID];
    [(UISUIActivityExtensionItemData *)self _setItemUUID:v7 forItem:v6];
  }

  return v7;
}

- (NSArray)extensionItems
{
  return self->_extensionItems;
}

- (void)setExtensionItems:(id)a3
{
}

- (NSDictionary)openURLAnnotationsByURL
{
  return self->_openURLAnnotationsByURL;
}

- (void)setOpenURLAnnotationsByURL:(id)a3
{
}

- (__CFDictionary)itemProviderOrExtensionItemWithMetadataToUUID
{
  return self->_itemProviderOrExtensionItemWithMetadataToUUID;
}

- (NSMutableDictionary)attachmentNamesByItemUUID
{
  return self->_attachmentNamesByItemUUID;
}

- (NSMutableDictionary)subjectsByItemUUID
{
  return self->_subjectsByItemUUID;
}

- (NSMutableDictionary)previewImagesByItemUUID
{
  return self->_previewImagesByItemUUID;
}

- (NSMutableDictionary)previewImageDataByItemUUID
{
  return self->_previewImageDataByItemUUID;
}

- (NSMutableDictionary)dataTypesByItemUUID
{
  return self->_dataTypesByItemUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTypesByItemUUID, 0);
  objc_storeStrong((id *)&self->_previewImageDataByItemUUID, 0);
  objc_storeStrong((id *)&self->_previewImagesByItemUUID, 0);
  objc_storeStrong((id *)&self->_subjectsByItemUUID, 0);
  objc_storeStrong((id *)&self->_attachmentNamesByItemUUID, 0);
  objc_storeStrong((id *)&self->_openURLAnnotationsByURL, 0);
  objc_storeStrong((id *)&self->_extensionItems, 0);
}

@end