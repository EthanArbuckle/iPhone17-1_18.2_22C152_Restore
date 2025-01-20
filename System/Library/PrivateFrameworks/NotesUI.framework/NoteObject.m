@interface NoteObject
@end

@implementation NoteObject

void __59__NoteObject_ICLegacyNoteUI__appendAttributedString_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) htmlString];
  uint64_t v3 = [v2 length];
  if (([*(id *)(a1 + 32) isPlainText] & 1) == 0)
  {
    uint64_t v3 = objc_msgSend(v2, "ic_HTMLInsertionPoint");
    uint64_t v4 = ICNoteHTMLFromPlainText();
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  if (v3)
  {
    if ([*(id *)(a1 + 32) isPlainText])
    {
      uint64_t v7 = [v2 characterAtIndex:v3 - 1];
      v8 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      LOBYTE(v7) = [v8 characterIsMember:v7];

      if (v7) {
        goto LABEL_9;
      }
      [NSString stringWithFormat:@"\n%@", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    }
    else
    {
      [NSString stringWithFormat:@"<div>%@</div>", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v9 = };
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
LABEL_9:
  v12 = (void *)[v2 mutableCopy];
  [v12 insertString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) atIndex:v3];
  v13 = objc_opt_new();
  [*(id *)(a1 + 32) setModificationDate:v13];

  v14 = (void *)[v12 copy];
  [*(id *)(a1 + 32) setHtmlString:v14];

  v15 = [*(id *)(a1 + 32) title];
  uint64_t v16 = [v15 length];

  if (!v16)
  {
    v17 = [*(id *)(a1 + 40) string];
    v18 = ICNoteTitleFromPlainText();
    [*(id *)(a1 + 32) setTitle:v18];
  }
  v19 = *(void **)(a1 + 48);
  uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v20 + 40);
  [v19 save:&obj];
  objc_storeStrong((id *)(v20 + 40), obj);
}

void __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [(id)*MEMORY[0x1E4F44510] identifier];
  LODWORD(v2) = [v2 isEqualToString:v3];

  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__78;
  v14 = __Block_byref_object_dispose__78;
  id v15 = 0;
  [*(id *)(a1 + 40) managedObjectContext];
  if (v2) {
    uint64_t v4 = {;
  }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_10;
    v9[3] = &unk_1E5FD91F8;
    v9[4] = *(void *)(a1 + 40);
    v9[5] = &v10;
    [v4 performBlockAndWait:v9];

    uint64_t v5 = [(id)v11[5] dataUsingEncoding:4];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else {
    v6 = {;
  }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2;
    v8[3] = &unk_1E5FD91F8;
    v8[4] = *(void *)(a1 + 40);
    v8[5] = &v10;
    [v6 performBlockAndWait:v8];

    uint64_t v5 = [MEMORY[0x1E4F83418] attributedStringFromHTMLString:v11[5] readerDelegate:*(void *)(a1 + 40)];
    id v7 = (id)[v5 loadDataWithTypeIdentifier:*(void *)(a1 + 32) forItemProviderCompletionHandler:*(void *)(a1 + 48)];
  }

  _Block_object_dispose(&v10, 8);
}

void __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_10(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) body];
  uint64_t v2 = [v5 contentAsPlainText];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __95__NoteObject_ItemProviderWriting__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) content];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;
  return MEMORY[0x1F41817F8](v2);
}

uint64_t __108__NoteObject_ItemProviderWriting___loadFileRepresentationOfTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) content];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;
  return MEMORY[0x1F41817F8](v2);
}

void __53__NoteObject_ItemProviderWriting__fileWrapperForURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F833D8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v8 = [v2 attachmentWithContentID:v3 context:v4];

  uint64_t v5 = [v8 fileURL];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

@end