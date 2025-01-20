@interface UIAirDropExtensionItemDataSource
+ (id)_airdropSupplementalSecurityContextForURL:(id)a3;
+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4;
@end

@implementation UIAirDropExtensionItemDataSource

+ (id)_airdropSupplementalSecurityContextForURL:(id)a3
{
  return airdropSupplementalSecurityContextForURL(a3);
}

+ (id)preparedActivityExtensionItemDataForActivityItemValues:(id)a3 extensionItemDataRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = share_sheet_log();
  v9 = share_sheet_log();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, a1);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PreparingItemData", (const char *)&unk_1A0BA1E03, buf, 2u);
  }

  uint64_t v11 = [v7 maxPreviews];
  *(void *)buf = 0;
  v35 = buf;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  v12 = objc_alloc_init(UISUIActivityExtensionItemData);
  v13 = [v7 activityType];
  [v7 thumbnailSize];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __116__UIAirDropExtensionItemDataSource_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke;
  v27[3] = &unk_1E5A23A20;
  id v18 = v13;
  id v28 = v18;
  v19 = v12;
  v29 = v19;
  v30 = buf;
  uint64_t v31 = v11;
  uint64_t v32 = v15;
  uint64_t v33 = v17;
  v20 = _NSExtensionItemsFromActivityItemValuesForExtensionItemDataRequestWithProcessingBlock(v6, v7, v27);
  [(UISUIActivityExtensionItemData *)v19 setExtensionItems:v20];
  v21 = share_sheet_log();
  v22 = share_sheet_log();
  os_signpost_id_t v23 = os_signpost_id_make_with_pointer(v22, a1);

  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    v26[0] = 0;
    _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v21, OS_SIGNPOST_INTERVAL_END, v23, "PreparingItemData", (const char *)&unk_1A0BA1E03, (uint8_t *)v26, 2u);
  }

  v24 = v19;
  _Block_object_dispose(buf, 8);

  return v24;
}

void __116__UIAirDropExtensionItemDataSource_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[_UIActivityItemMapping _attachmentNameForActivityItem:v6 activityType:*(void *)(a1 + 32)];
  if (v7) {
    [*(id *)(a1 + 40) addAttachmentName:v7 forItem:v5];
  }
  v8 = +[_UIActivityItemMapping _subjectForActivityItem:v6 activityType:*(void *)(a1 + 32)];
  if (v8) {
    [*(id *)(a1 + 40) addSubject:v8 forItem:v5];
  }
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v11 = *(void *)(v10 + 24);
  if (v9 < 1 || v9 > v11)
  {
    *(void *)(v10 + 24) = v11 + 1;
    v12 = share_sheet_log();
    v13 = share_sheet_log();
    os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, v6);

    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v14, "FetchingPreview", (const char *)&unk_1A0BA1E03, buf, 2u);
    }

    uint64_t v15 = +[_UIActivityItemMapping _thumbnailImageDataForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageDataForActivityItem:thumbnailSize:activityType:", v6, *(void *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
    if (v15) {
      [*(id *)(a1 + 40) addPreviewImageData:v15 forItem:v5];
    }
    uint64_t v16 = +[_UIActivityItemMapping _thumbnailImageForActivityItem:thumbnailSize:activityType:](_UIActivityItemMapping, "_thumbnailImageForActivityItem:thumbnailSize:activityType:", v6, *(void *)(a1 + 32), *(double *)(a1 + 64), *(double *)(a1 + 72));
    if (v16) {
      [*(id *)(a1 + 40) addPreviewImage:v16 forItem:v5];
    }
    uint64_t v17 = share_sheet_log();
    id v18 = share_sheet_log();
    os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, v6);

    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A0AD8000, v17, OS_SIGNPOST_INTERVAL_END, v19, "FetchingPreview", (const char *)&unk_1A0BA1E03, buf, 2u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = +[_UIActivityItemMapping _dataTypeIdentifierForActivityItem:v6 activityType:*(void *)(a1 + 32)];
    if (v20
      || (v21 = CGImageSourceCreateWithData((CFDataRef)v6, 0)) != 0
      && (v22 = v21, CGImageSourceGetType(v21), v20 = objc_claimAutoreleasedReturnValue(), CFRelease(v22), v20))
    {
      [*(id *)(a1 + 40) addDataType:v20 forItem:v5];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 isFileURL])
      {
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __116__UIAirDropExtensionItemDataSource_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke_5;
        v23[3] = &unk_1E5A22768;
        id v24 = v6;
        [v5 registerItemForTypeIdentifier:@"com.apple.ShareUI.airdrop.supplementalSecurityContext" loadHandler:v23];
      }
    }
  }
}

void __116__UIAirDropExtensionItemDataSource_preparedActivityExtensionItemDataForActivityItemValues_extensionItemDataRequest___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  airdropSupplementalSecurityContextForURL(v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v4, 0);
}

@end