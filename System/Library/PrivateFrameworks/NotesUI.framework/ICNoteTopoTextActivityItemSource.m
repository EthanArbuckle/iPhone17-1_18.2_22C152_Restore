@interface ICNoteTopoTextActivityItemSource
- (ICNote)note;
- (ICNoteTopoTextActivityItemSource)initWithNote:(id)a3;
- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
- (void)setNote:(id)a3;
@end

@implementation ICNoteTopoTextActivityItemSource

- (ICNoteTopoTextActivityItemSource)initWithNote:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICNoteTopoTextActivityItemSource;
  v5 = [(ICNoteTopoTextActivityItemSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ICNoteTopoTextActivityItemSource *)v5 setNote:v4];
  }

  return v6;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9B8], "data", a3);
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  if ([a4 isEqualToString:*MEMORY[0x1E4F435A0]])
  {
    v5 = [(ICNoteTopoTextActivityItemSource *)self note];
    v6 = [v5 textStorage];

    uint64_t v7 = [v6 length];
    objc_super v8 = [v6 mergeableString];
    v9 = [v8 attributedString];
    v10 = objc_msgSend(v9, "attributedSubstringFromRange:", 0, v7);

    id v11 = objc_alloc(MEMORY[0x1E4F83350]);
    v12 = [(ICNoteTopoTextActivityItemSource *)self note];
    v13 = [v12 identifier];
    v14 = (void *)[v11 initWithObjectIdentifier:v13 forPasteboard:1];

    v15 = +[ICTextController removeBeginningListStyleIfNecessaryForAttributedString:fromTextStorage:andRange:](ICTextController, "removeBeginningListStyleIfNecessaryForAttributedString:fromTextStorage:andRange:", v10, v6, 0, v7);

    v16 = [MEMORY[0x1E4F83428] sharedContext];
    v17 = [v16 managedObjectContext];
    v18 = objc_msgSend(v15, "ic_serializeWithFlags:dataPersister:managedObjectContext:error:", 1, v14, v17, 0);

    if (v18)
    {
      v19 = (void *)[objc_alloc(MEMORY[0x1E4F83438]) initWithAttributedStringData:v18 dataPersister:v14];
      uint64_t v23 = *MEMORY[0x1E4F83138];
      v20 = [v19 persistenceData];
      v24[0] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (id)activityViewController:(id)a3 dataTypeIdentifierForActivityType:(id)a4
{
  if ([a4 isEqualToString:*MEMORY[0x1E4F435A0]])
  {
    id v4 = (id)*MEMORY[0x1E4F83138];
  }
  else
  {
    id v4 = [(id)*MEMORY[0x1E4F44470] identifier];
  }
  return v4;
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