@interface ICHashtagUIModel
- (id)labelColor;
@end

@implementation ICHashtagUIModel

- (id)labelColor
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v3 = [(ICInlineAttachmentUIModel *)self attachment];
  v4 = [v3 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __30__ICHashtagUIModel_labelColor__block_invoke;
  v9[3] = &unk_1E5FDB2D0;
  v9[4] = self;
  v9[5] = &v10;
  [v4 performBlockAndWait:v9];

  if (*((unsigned char *)v11 + 24))
  {
    v8.receiver = self;
    v8.super_class = (Class)ICHashtagUIModel;
    uint64_t v5 = [(ICInlineAttachmentUIModel *)&v8 labelColor];
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] ICHashtagColor];
  }
  v6 = (void *)v5;
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __30__ICHashtagUIModel_labelColor__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) attachment];
  char v3 = [v2 isUnsupported];

  v4 = [*(id *)(a1 + 32) attachment];
  uint64_t v5 = [v4 note];
  char v6 = [v5 isDeletedOrInTrash];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 | v6;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v7 = (void *)MEMORY[0x1E4F83388];
    objc_super v8 = [*(id *)(a1 + 32) attachment];
    v9 = [v8 tokenContentIdentifier];
    uint64_t v10 = [*(id *)(a1 + 32) attachment];
    v11 = [v10 note];
    uint64_t v12 = [v11 account];
    id v13 = [v7 hashtagWithStandardizedContent:v9 account:v12];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v13 == 0;
  }
}

@end