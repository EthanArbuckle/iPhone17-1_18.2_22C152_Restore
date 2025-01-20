@interface ICNote(ItemProviderWriting)
+ (void)writableTypeIdentifiersForItemProvider;
- (id)writableTypeIdentifiersForItemProvider;
- (id)writableTypeIdentifiersForNoteContent;
- (uint64_t)_loadFileRepresentationOfTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:;
- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()ItemProviderWriting;
- (uint64_t)itemProviderType;
- (uint64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:()ItemProviderWriting;
- (uint64_t)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:;
- (void)prepareForCopyingData;
@end

@implementation ICNote(ItemProviderWriting)

+ (void)writableTypeIdentifiersForItemProvider
{
  return &unk_26C139120;
}

- (id)writableTypeIdentifiersForNoteContent
{
  v0 = [MEMORY[0x263EFF9B0] orderedSet];
  [v0 addObject:*MEMORY[0x263F5AA90]];
  v1 = [MEMORY[0x263F086A0] writableTypeIdentifiersForItemProvider];
  [v0 addObjectsFromArray:v1];

  v2 = (void *)*MEMORY[0x263F1DAA8];
  v3 = [(id)*MEMORY[0x263F1DAA8] identifier];
  char v4 = [v0 containsObject:v3];

  if ((v4 & 1) == 0)
  {
    v5 = [v2 identifier];
    [v0 insertObject:v5 atIndex:1];
  }
  v6 = [v0 array];

  return v6;
}

- (id)writableTypeIdentifiersForItemProvider
{
  if ([a1 isPasswordProtected] && !objc_msgSend(a1, "isAuthenticated"))
  {
    v3 = &unk_26C139138;
  }
  else
  {
    v2 = [a1 writableTypeIdentifiersForNoteContent];
    v3 = [v2 arrayByAddingObject:@"com.apple.notes.noteitemprovider"];
  }

  return v3;
}

- (uint64_t)itemProviderType
{
  return 1;
}

- (uint64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:()ItemProviderWriting
{
  if ([a3 isEqual:*MEMORY[0x263F5AA90]]) {
    return 3;
  }
  else {
    return 0;
  }
}

- (uint64_t)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.notes.noteitemprovider"])
  {
    v8 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ICNote(ItemProviderWriting) loadDataWithTypeIdentifier:forItemProviderCompletionHandler:](v8);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v9 = [a1 objectID];
    v10 = [MEMORY[0x263F5ACA0] sharedContext];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __91__ICNote_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
    v13[3] = &unk_2640B81B8;
    id v14 = v9;
    id v15 = v6;
    id v16 = v7;
    id v11 = v9;
    [v10 performBackgroundTask:v13];
  }
  return 0;
}

- (void)prepareForCopyingData
{
  id v5 = [a1 textStorage];
  v2 = [v5 styler];

  if (v2)
  {
    objc_msgSend(a1, "filterAttachmentsInTextStorage:range:", v5, 0, objc_msgSend(v5, "length"));
  }
  else
  {
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      id v3 = objc_alloc_init(MEMORY[0x263F5B480]);
      [v3 setNote:a1 firstVisibleLocation:0];
    }
    else
    {
      id v3 = objc_alloc_init(MEMORY[0x263F5B4E8]);
      id v4 = [[ICLayoutManager alloc] initForTemporaryProcessing:1];
      [v3 setNote:a1 stylingTextUsingSeparateTextStorageForRendering:0 withLayoutManager:v4];
    }
    objc_msgSend(a1, "filterAttachmentsInTextStorage:range:", v5, 0, objc_msgSend(v5, "length"));
    [v5 setStyler:0];
  }
}

- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()ItemProviderWriting
{
  return objc_msgSend(MEMORY[0x263F086A0], "_preferredRepresentationForItemProviderWritableTypeIdentifier:");
}

- (uint64_t)_loadFileRepresentationOfTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 objectID];
  v9 = [MEMORY[0x263F5ACA0] sharedContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __104__ICNote_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v14[3] = &unk_2640B81B8;
  id v15 = v8;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  [v9 performBackgroundTask:v14];

  return 0;
}

- (void)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Data should never be requested for the item provider UTI", v1, 2u);
}

@end