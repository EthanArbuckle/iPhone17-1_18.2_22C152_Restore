@interface ICAttachmentTableModel(ItemProviderWriting)
- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:;
- (id)writableTypeIdentifiersForItemProvider;
@end

@implementation ICAttachmentTableModel(ItemProviderWriting)

- (id)writableTypeIdentifiersForItemProvider
{
  v5.receiver = a1;
  v5.super_class = (Class)&off_26C1C4EF0;
  v1 = objc_msgSendSuper2(&v5, sel_writableTypeIdentifiersForItemProvider);
  v2 = [(id)*MEMORY[0x263F1DC68] identifier];
  v3 = [v1 arrayByAddingObject:v2];

  return v3;
}

- (id)loadDataWithTypeIdentifier:()ItemProviderWriting forItemProviderCompletionHandler:
{
  v24[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = a4;
  v8 = [(id)*MEMORY[0x263F1DC68] identifier];
  int v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    v10 = [a1 table];
    if (v10)
    {
      v11 = [a1 attachment];
      v12 = [v11 managedObjectContext];
      v13 = [v10 attributedStringWithNSTextTablesForColumns:0 rows:0 context:v12];

      if (v13)
      {
        v14 = (void *)[v13 mutableCopy];
        objc_msgSend(v14, "fixAttributesInRange:", 0, objc_msgSend(v13, "length"));
        uint64_t v15 = [v14 length];
        uint64_t v23 = *MEMORY[0x263F814D0];
        v24[0] = *MEMORY[0x263F81558];
        v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
        id v22 = 0;
        v17 = objc_msgSend(v14, "dataFromRange:documentAttributes:error:", 0, v15, v16, &v22);
        id v18 = v22;
      }
      else
      {
        id v18 = 0;
        v17 = 0;
      }
    }
    else
    {
      id v18 = 0;
      v17 = 0;
    }
    v7[2](v7, v17, v18);

    v19 = 0;
  }
  else
  {
    v21.receiver = a1;
    v21.super_class = (Class)&off_26C1C4EF0;
    v19 = objc_msgSendSuper2(&v21, sel_loadDataWithTypeIdentifier_forItemProviderCompletionHandler_, v6, v7);
  }

  return v19;
}

@end