@interface ICNoteRTFDActivityItemSource
- (ICNote)note;
- (ICNoteRTFDActivityItemSource)init;
- (ICNoteRTFDActivityItemSource)initWithNote:(id)a3 noteExporter:(id)a4;
- (ICShareNoteExporter)noteExporter;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setNote:(id)a3;
- (void)setNoteExporter:(id)a3;
@end

@implementation ICNoteRTFDActivityItemSource

- (ICNoteRTFDActivityItemSource)init
{
  return 0;
}

- (ICNoteRTFDActivityItemSource)initWithNote:(id)a3 noteExporter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteRTFDActivityItemSource;
  v8 = [(ICNoteRTFDActivityItemSource *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ICNoteRTFDActivityItemSource *)v8 setNote:v6];
    [(ICNoteRTFDActivityItemSource *)v9 setNoteExporter:v7];
  }

  return v9;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CB10]);
  return v3;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5 = a4;
  if ((([v5 isEqualToString:@"com.apple.UIKit.activity.RemoteOpenInApplication"] & 1) != 0
     || ([v5 isEqualToString:@"com.apple.UIKit.activity.RemoteOpenInApplication-InPlace"] & 1) != 0
     || [v5 isEqualToString:@"com.apple.UIKit.activity.RemoteOpenInApplication-ByCopy"])&& (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E4F435A8]) & 1) == 0)
  {
    id v7 = [(ICNoteRTFDActivityItemSource *)self noteExporter];
    v8 = [(ICNoteRTFDActivityItemSource *)self note];
    id v6 = [v7 exportRTFDFileFromNote:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  int v4 = [a4 isEqualToString:*MEMORY[0x1E4F435A8]];
  id v5 = (id *)MEMORY[0x1E4F443B8];
  if (!v4) {
    id v5 = (id *)MEMORY[0x1E4F444A8];
  }
  id v6 = [*v5 identifier];
  return v6;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  id v18 = 0;
  v8 = [(ICNoteRTFDActivityItemSource *)self note];
  v9 = [v8 managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__ICNoteRTFDActivityItemSource_activityViewController_subjectForActivityType___block_invoke;
  v12[3] = &unk_1E5FD91F8;
  v12[4] = self;
  v12[5] = &v13;
  [v9 performBlockAndWait:v12];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __78__ICNoteRTFDActivityItemSource_activityViewController_subjectForActivityType___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) note];
  uint64_t v2 = [v5 title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (ICShareNoteExporter)noteExporter
{
  return self->_noteExporter;
}

- (void)setNoteExporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noteExporter, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

@end