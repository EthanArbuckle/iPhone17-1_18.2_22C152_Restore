@interface ICNoteLinkPresentationActivityItemSource
- (ICNoteLinkPresentationActivityItemSource)init;
- (ICNoteLinkPresentationActivityItemSource)initWithNote:(id)a3;
- (ICNoteLinkPresentationActivityItemSource)initWithNote:(id)a3 thumbnailImage:(id)a4;
- (ICSearchIndexableNote)note;
- (UIImage)thumbnailImage;
- (id)detail;
- (id)title;
- (void)setNote:(id)a3;
- (void)setThumbnailImage:(id)a3;
@end

@implementation ICNoteLinkPresentationActivityItemSource

- (ICNoteLinkPresentationActivityItemSource)init
{
  return 0;
}

- (ICNoteLinkPresentationActivityItemSource)initWithNote:(id)a3
{
  return [(ICNoteLinkPresentationActivityItemSource *)self initWithNote:a3 thumbnailImage:0];
}

- (ICNoteLinkPresentationActivityItemSource)initWithNote:(id)a3 thumbnailImage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICNoteLinkPresentationActivityItemSource;
  v9 = [(ICNoteLinkPresentationActivityItemSource *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_note, a3);
    objc_storeStrong((id *)&v10->_thumbnailImage, a4);
  }

  return v10;
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
  id v5 = a3;
  [(ICLinkPresentationActivityItemSource *)self setIconImage:v5];
}

- (id)title
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  objc_super v12 = __Block_byref_object_dispose__19;
  id v13 = 0;
  v3 = [(ICNoteLinkPresentationActivityItemSource *)self note];
  v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__ICNoteLinkPresentationActivityItemSource_title__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __49__ICNoteLinkPresentationActivityItemSource_title__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) note];
  uint64_t v2 = [v5 trimmedTitle];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)detail
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__19;
  objc_super v12 = __Block_byref_object_dispose__19;
  id v13 = 0;
  uint64_t v3 = [(ICNoteLinkPresentationActivityItemSource *)self note];
  v4 = [v3 managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__ICNoteLinkPresentationActivityItemSource_detail__block_invoke;
  v7[3] = &unk_1E5FD91F8;
  v7[4] = self;
  v7[5] = &v8;
  [v4 performBlockAndWait:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __50__ICNoteLinkPresentationActivityItemSource_detail__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) note];
  uint64_t v2 = [v6 contentInfoText];
  uint64_t v3 = objc_msgSend(v2, "ic_whitespaceAndNewlineCoalescedString");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (ICSearchIndexableNote)note
{
  return (ICSearchIndexableNote *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNote:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
}

@end