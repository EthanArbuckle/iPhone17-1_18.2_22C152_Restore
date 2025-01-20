@interface ICChangeDatesActivity
+ (int64_t)activityCategory;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (ICChangeDatesActivity)initWithObject:(id)a3 activityType:(unsigned __int8)a4;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (id)representedObject;
- (unsigned)type;
- (void)setCreationDateForAttachmentObject:(id)a3;
- (void)setCreationDateForNoteObject:(id)a3;
- (void)setModificationDateForAttachmentObject:(id)a3;
- (void)setModificationDateForNoteObject:(id)a3;
- (void)setRepresentedObject:(id)a3;
- (void)setType:(unsigned __int8)a3;
@end

@implementation ICChangeDatesActivity

- (ICChangeDatesActivity)initWithObject:(id)a3 activityType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICChangeDatesActivity;
  v7 = [(UIActivity *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(ICChangeDatesActivity *)v7 setRepresentedObject:v6];
    [(ICChangeDatesActivity *)v8 setType:v4];
  }

  return v8;
}

- (id)activityViewController
{
  v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\nChange Dates" message:@"Change Modification Date or Creation Date" preferredStyle:0];
  id v4 = objc_alloc_init(MEMORY[0x1E4FB16B0]);
  [v4 setDatePickerMode:2];
  v5 = [v3 view];
  [v5 addSubview:v4];

  id v6 = (void *)MEMORY[0x1E4FB1410];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __47__ICChangeDatesActivity_activityViewController__block_invoke;
  v19[3] = &unk_1E5FDD6A8;
  v19[4] = self;
  id v7 = v4;
  id v20 = v7;
  v8 = [v6 actionWithTitle:@"Set Modification Date" style:0 handler:v19];
  [v3 addAction:v8];

  v9 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __47__ICChangeDatesActivity_activityViewController__block_invoke_2;
  v16 = &unk_1E5FDD6A8;
  v17 = self;
  id v18 = v7;
  id v10 = v7;
  v11 = [v9 actionWithTitle:@"Set Creation Date" style:0 handler:&v13];
  objc_msgSend(v3, "addAction:", v11, v13, v14, v15, v16, v17);

  return v3;
}

void __47__ICChangeDatesActivity_activityViewController__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) type];
  if (v2 == 1)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) date];
    objc_msgSend(v4, "setModificationDateForAttachmentObject:");
  }
  else
  {
    if (v2) {
      return;
    }
    v3 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) date];
    objc_msgSend(v3, "setModificationDateForNoteObject:");
  }
}

void __47__ICChangeDatesActivity_activityViewController__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) type];
  if (v2 == 1)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) date];
    objc_msgSend(v4, "setCreationDateForAttachmentObject:");
  }
  else
  {
    if (v2) {
      return;
    }
    v3 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) date];
    objc_msgSend(v3, "setCreationDateForNoteObject:");
  }
}

- (void)setModificationDateForNoteObject:(id)a3
{
  id v14 = a3;
  id v4 = [(ICChangeDatesActivity *)self representedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v6 = [(ICChangeDatesActivity *)self representedObject];
  id v7 = v6;
  if (isKindOfClass)
  {
    [v6 setModificationDate:v14];
    v8 = [v7 creationDate];
    char v9 = objc_msgSend(v8, "ic_isLaterThanDate:", v14);

    if ((v9 & 1) == 0)
    {
LABEL_4:
      id v10 = [v7 managedObjectContext];
      objc_msgSend(v10, "ic_save");

      goto LABEL_8;
    }
LABEL_3:
    [v7 setCreationDate:v14];
    goto LABEL_4;
  }
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    id v7 = [(ICChangeDatesActivity *)self representedObject];
    [v7 setModificationDate:v14];
    v12 = [v7 creationDate];
    int v13 = objc_msgSend(v12, "ic_isLaterThanDate:", v14);

    if (!v13) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
LABEL_8:
}

- (void)setCreationDateForNoteObject:(id)a3
{
  id v14 = a3;
  id v4 = [(ICChangeDatesActivity *)self representedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v6 = [(ICChangeDatesActivity *)self representedObject];
  id v7 = v6;
  if (isKindOfClass)
  {
    [v6 setCreationDate:v14];
    v8 = [v7 modificationDate];
    char v9 = objc_msgSend(v8, "ic_isEarlierThanDate:", v14);

    if ((v9 & 1) == 0)
    {
LABEL_4:
      id v10 = [v7 managedObjectContext];
      objc_msgSend(v10, "ic_save");

      goto LABEL_8;
    }
LABEL_3:
    [v7 setModificationDate:v14];
    goto LABEL_4;
  }
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if (v11)
  {
    id v7 = [(ICChangeDatesActivity *)self representedObject];
    [v7 setCreationDate:v14];
    v12 = [v7 modificationDate];
    int v13 = objc_msgSend(v12, "ic_isEarlierThanDate:", v14);

    if (!v13) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
LABEL_8:
}

- (void)setModificationDateForAttachmentObject:(id)a3
{
  id v10 = a3;
  id v4 = [(ICChangeDatesActivity *)self representedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(ICChangeDatesActivity *)self representedObject];
    [v6 setModificationDate:v10];
    id v7 = [v6 creationDate];
    int v8 = objc_msgSend(v7, "ic_isLaterThanDate:", v10);

    if (v8) {
      [v6 setCreationDate:v10];
    }
    char v9 = [v6 managedObjectContext];
    objc_msgSend(v9, "ic_save");
  }
}

- (void)setCreationDateForAttachmentObject:(id)a3
{
  id v10 = a3;
  id v4 = [(ICChangeDatesActivity *)self representedObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [(ICChangeDatesActivity *)self representedObject];
    [v6 setCreationDate:v10];
    id v7 = [v6 modificationDate];
    int v8 = objc_msgSend(v7, "ic_isEarlierThanDate:", v10);

    if (v8) {
      [v6 setModificationDate:v10];
    }
    char v9 = [v6 managedObjectContext];
    objc_msgSend(v9, "ic_save");
  }
}

- (id)activityType
{
  return @"com.apple.notes.change-dates";
}

- (id)activityTitle
{
  return @"Change Dates";
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

+ (int64_t)activityCategory
{
  return 0;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (void)setRepresentedObject:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end