@interface ICAttachmentWebModel(NSItemProvider)
- (id)itemProvider;
- (void)itemProvider;
@end

@implementation ICAttachmentWebModel(NSItemProvider)

- (id)itemProvider
{
  v2 = [a1 attachment];
  v3 = [v2 synapseData];

  if (![v3 length]) {
    goto LABEL_10;
  }
  id v12 = 0;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4FA9238]) initWithData:v3 error:&v12];
  id v5 = v12;
  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(ICAttachmentWebModel(NSItemProvider) *)(uint64_t)v5 itemProvider];
    }
  }
  if (v4)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F28D78]) initWithObject:v4];
    v8 = [a1 attachment];
    v9 = [v8 URL];

    if (v9) {
      [v7 registerObject:v9 visibility:0];
    }
  }
  else
  {
LABEL_10:
    v11.receiver = a1;
    v11.super_class = (Class)&off_1F0A3CDB0;
    v7 = objc_msgSendSuper2(&v11, sel_itemProvider);
  }

  return v7;
}

- (void)itemProvider
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Encountered error while trying to deserialize synapse content item: %@", (uint8_t *)&v2, 0xCu);
}

@end