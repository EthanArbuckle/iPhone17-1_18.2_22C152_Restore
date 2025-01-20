@interface ICNoteHTMLActivityItemSource
- (ICNote)note;
- (ICNoteHTMLActivityItemSource)init;
- (ICNoteHTMLActivityItemSource)initWithNote:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setNote:(id)a3;
@end

@implementation ICNoteHTMLActivityItemSource

- (ICNoteHTMLActivityItemSource)init
{
  return 0;
}

- (ICNoteHTMLActivityItemSource)initWithNote:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteHTMLActivityItemSource;
  v5 = [(ICNoteHTMLActivityItemSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICNoteHTMLActivityItemSource *)v5 setNote:v4];
  }

  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(NSString, "string", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F435B0]])
  {
    v5 = [(ICNoteHTMLActivityItemSource *)self note];
    v6 = [v5 htmlStringWithHTMLAttachments];

    v7 = [NSString stringWithFormat:@"<html><body>%@</body></html>", v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10;
  v17 = __Block_byref_object_dispose__10;
  id v18 = 0;
  objc_super v8 = [(ICNoteHTMLActivityItemSource *)self note];
  v9 = [v8 managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __78__ICNoteHTMLActivityItemSource_activityViewController_subjectForActivityType___block_invoke;
  v12[3] = &unk_1E5FD91F8;
  v12[4] = self;
  v12[5] = &v13;
  [v9 performBlockAndWait:v12];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __78__ICNoteHTMLActivityItemSource_activityViewController_subjectForActivityType___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) note];
  uint64_t v2 = [v5 title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (void).cxx_destruct
{
}

@end