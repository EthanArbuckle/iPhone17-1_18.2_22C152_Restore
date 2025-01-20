@interface ICAttachmentModel(NSItemProvider)
- (id)itemProvider;
@end

@implementation ICAttachmentModel(NSItemProvider)

- (id)itemProvider
{
  v2 = [a1 attachment];
  int v3 = [v2 isURL];

  if (v3)
  {
    v4 = [a1 attachment];
    v5 = [v4 URL];

    v6 = [a1 attachment];
    v7 = [v6 title];

    if (![v7 length])
    {
      v8 = (void *)MEMORY[0x1E4F832A0];
      v9 = [a1 attachment];
      uint64_t v10 = objc_msgSend(v8, "defaultTitleForAttachmentType:", objc_msgSend(v9, "attachmentType"));

      v7 = (void *)v10;
    }
    if ([v7 length])
    {
      uint64_t v11 = [MEMORY[0x1E4F28D78] itemProviderWithURL:v5 title:v7];
    }
    else
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v5];
    }
    v14 = (void *)v11;
  }
  else
  {
    id v12 = objc_alloc(MEMORY[0x1E4F28D78]);
    v13 = ICCheckedProtocolCast();
    v14 = (void *)[v12 initWithObject:v13];

    [a1 registerFileLoadHandlersOnItemProvider:v14];
    v5 = [a1 attachment];
    v7 = [v5 title];
    [v14 setSuggestedName:v7];
  }

  return v14;
}

@end