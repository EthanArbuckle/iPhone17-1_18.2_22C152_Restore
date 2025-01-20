@interface NoteObject(ItemProviderWriting)
+ (id)writableTypeIdentifiersForItemProvider;
- (id)fileWrapperForURL:()ItemProviderWriting;
- (id)writableTypeIdentifiersForItemProvider;
- (uint64_t)_loadFileRepresentationOfTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:;
- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()ItemProviderWriting;
- (uint64_t)itemProviderType;
- (uint64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:()ItemProviderWriting;
- (uint64_t)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:;
@end

@implementation NoteObject(ItemProviderWriting)

+ (id)writableTypeIdentifiersForItemProvider
{
  v2[1] = *MEMORY[0x1E4F143B8];
  v2[0] = *MEMORY[0x1E4F82D40];
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:1];
  return v0;
}

- (id)writableTypeIdentifiersForItemProvider
{
  v6[2] = *MEMORY[0x1E4F143B8];
  if ([a1 isPlainText])
  {
    v1 = [(id)*MEMORY[0x1E4F44510] identifier];
    uint64_t v2 = *MEMORY[0x1E4F82D40];
    v6[0] = v1;
    v6[1] = v2;
    uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  }
  else
  {
    v1 = [MEMORY[0x1E4F28B18] writableTypeIdentifiersForItemProvider];
    uint64_t v3 = [v1 arrayByAddingObject:*MEMORY[0x1E4F82D40]];
  }
  v4 = (void *)v3;

  return v4;
}

- (uint64_t)itemProviderVisibilityForRepresentationWithTypeIdentifier:()ItemProviderWriting
{
  if ([a3 isEqual:*MEMORY[0x1E4F82D40]]) {
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
  if ([v6 isEqualToString:*MEMORY[0x1E4F82D40]])
  {
    v8 = os_log_create("com.apple.notes", "DragAndDrop");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NoteObject(ItemProviderWriting) loadDataWithTypeIdentifier:forItemProviderCompletionHandler:](v8);
    }

    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
    block[3] = &unk_1E5FDBB10;
    id v12 = v6;
    uint64_t v13 = a1;
    id v14 = v7;
    dispatch_async(v9, block);
  }
  return 0;
}

- (uint64_t)itemProviderType
{
  return 2;
}

- (uint64_t)_loadFileRepresentationOfTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__78;
  v18 = __Block_byref_object_dispose__78;
  id v19 = 0;
  v8 = [a1 managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__NoteObject_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v13[3] = &unk_1E5FD91F8;
  v13[4] = a1;
  v13[5] = &v14;
  [v8 performBlockAndWait:v13];

  v9 = [MEMORY[0x1E4F83418] attributedStringFromHTMLString:v15[5] readerDelegate:a1];
  v10 = v9;
  if (v9) {
    id v11 = (id)[v9 _loadFileRepresentationOfTypeIdentifier:v6 forItemProviderCompletionHandler:v7];
  }
  else {
    (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, 0, 0);
  }

  _Block_object_dispose(&v14, 8);
  return 0;
}

- (uint64_t)_preferredRepresentationForItemProviderWritableTypeIdentifier:()ItemProviderWriting
{
  return objc_msgSend(MEMORY[0x1E4F28B18], "_preferredRepresentationForItemProviderWritableTypeIdentifier:");
}

- (id)fileWrapperForURL:()ItemProviderWriting
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F833D8] contentIDStringFromCIDURL:v4];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__78;
  v18 = __Block_byref_object_dispose__78;
  id v19 = 0;
  id v6 = [a1 managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__NoteObject_ItemProviderWriting__fileWrapperForURL___block_invoke;
  v10[3] = &unk_1E5FD93E0;
  id v11 = v5;
  id v12 = a1;
  uint64_t v13 = &v14;
  [v6 performBlockAndWait:v10];

  uint64_t v7 = v15[5];
  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F28CF0]);
    a1 = (void *)[v8 initWithURL:v15[5] options:0 error:0];
  }

  _Block_object_dispose(&v14, 8);
  if (!v7) {
LABEL_5:
  }
    a1 = 0;

  return a1;
}

- (void)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Data should never be requested for the item provider UTI", v1, 2u);
}

@end