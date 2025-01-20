@interface ICAttachmentInsertionController
- (ICAttachmentInsertionController)init;
- (ICAttachmentInsertionController)initWithNote:(id)a3;
- (ICAttachmentInsertionDelegate)attachmentDelegate;
- (ICNote)note;
- (id)_addInlineAttachment:(id)a3 inTextStorage:(id)a4 atTextRange:(_NSRange)a5;
- (id)addAttachment:(id)a3;
- (id)addAttachment:(id)a3 atTextLocation:(unint64_t)a4;
- (id)addAttachment:(id)a3 atTextRange:(_NSRange)a4;
- (id)addInlineAttachment:(id)a3;
- (id)addInlineAttachment:(id)a3 atTextRange:(_NSRange)a4;
- (id)addInlineAttachment:(id)a3 atTextRange:(_NSRange)a4 textView:(id)a5;
- (void)setAttachmentDelegate:(id)a3;
@end

@implementation ICAttachmentInsertionController

- (void)setAttachmentDelegate:(id)a3
{
}

- (ICAttachmentInsertionController)initWithNote:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentInsertionController;
  v5 = [(ICAttachmentInsertionController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_note, v4);
  }

  return v6;
}

- (ICAttachmentInsertionController)init
{
  return 0;
}

- (id)addAttachment:(id)a3
{
  id v4 = a3;
  v5 = [(ICAttachmentInsertionController *)self note];
  v6 = [v5 textStorage];
  v7 = -[ICAttachmentInsertionController addAttachment:atTextLocation:](self, "addAttachment:atTextLocation:", v4, [v6 length]);

  return v7;
}

- (id)addAttachment:(id)a3 atTextLocation:(unint64_t)a4
{
  return -[ICAttachmentInsertionController addAttachment:atTextRange:](self, "addAttachment:atTextRange:", a3, a4, 0);
}

- (id)addAttachment:(id)a3 atTextRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  unint64_t location = a4.location;
  id v7 = a3;
  v31 = self;
  v30 = [(ICAttachmentInsertionController *)self note];
  objc_super v8 = [v30 textStorage];
  if (location > [v8 length])
  {
    v9 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v33.unint64_t location = location;
      v33.NSUInteger length = length;
      -[ICAttachmentInsertionController addAttachment:atTextRange:](v33, v8);
    }

    unint64_t location = [v8 length];
  }
  v10 = [(ICAttachmentInsertionController *)v31 attachmentDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v10, "attachmentInsertionController:willAddAttachment:atRange:", v31, v7, location, length);
  }
  v11 = +[ICTextAttachment textAttachmentWithAttachment:v7];
  v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v11];
  v13 = (void *)[v12 mutableCopy];

  objc_msgSend(v13, "addAttribute:value:range:", *MEMORY[0x1E4FB06B8], v11, 0, objc_msgSend(v13, "length"));
  v14 = [v30 textStorage];
  v15 = (uint64_t *)MEMORY[0x1E4F83220];
  v16 = [v14 attribute:*MEMORY[0x1E4F83220] atIndex:location effectiveRange:0];

  id v17 = objc_alloc_init(MEMORY[0x1E4F834E0]);
  v29 = v16;
  objc_msgSend(v17, "setBlockQuoteLevel:", objc_msgSend(v16, "blockQuoteLevel"));
  uint64_t v18 = *v15;
  uint64_t v19 = objc_msgSend(v13, "ic_range");
  objc_msgSend(v13, "addAttribute:value:range:", v18, v17, v19, v20);
  [v8 beginSkippingTimestampUpdates];
  objc_msgSend(v8, "replaceCharactersInRange:withAttributedString:", location, length, v13);
  [v8 endSkippingTimestampUpdates];
  [v8 fixupAfterEditing];
  [v7 updateChangeCountWithReason:@"Added attachment"];
  v21 = [v7 media];
  [v21 updateChangeCountWithReason:@"Added attachment"];

  v22 = [v7 attachmentModel];
  LODWORD(v21) = [v22 showThumbnailInNoteList];

  if (v21) {
    id v23 = (id)objc_msgSend(v7, "ic_postNotificationOnMainThreadAfterSaveWithName:", *MEMORY[0x1E4F83040]);
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v24 = objc_msgSend(v8, "ic_rangeForAttachment:withTextAttachment:", v7, 0);
    uint64_t v26 = v25;
    v27 = [MEMORY[0x1E4F1C9C8] now];
    objc_msgSend(v8, "setTimestamp:range:", v27, v24, v26);

    objc_msgSend(v10, "attachmentInsertionController:didAddAttachment:atRange:", v31, v7, v24, v26);
  }

  return v11;
}

- (id)addInlineAttachment:(id)a3
{
  id v4 = a3;
  v5 = [(ICAttachmentInsertionController *)self note];
  v6 = [v5 textStorage];
  id v7 = -[ICAttachmentInsertionController addInlineAttachment:atTextRange:](self, "addInlineAttachment:atTextRange:", v4, [v6 length], 0);

  return v7;
}

- (id)addInlineAttachment:(id)a3 atTextRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  objc_super v8 = [(ICAttachmentInsertionController *)self note];
  v9 = [v8 textStorage];
  v10 = -[ICAttachmentInsertionController _addInlineAttachment:inTextStorage:atTextRange:](self, "_addInlineAttachment:inTextStorage:atTextRange:", v7, v9, location, length);

  return v10;
}

- (id)addInlineAttachment:(id)a3 atTextRange:(_NSRange)a4 textView:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  objc_opt_class();
  v11 = [v9 textStorage];

  v12 = ICDynamicCast();

  v13 = -[ICAttachmentInsertionController _addInlineAttachment:inTextStorage:atTextRange:](self, "_addInlineAttachment:inTextStorage:atTextRange:", v10, v12, location, length);

  return v13;
}

- (id)_addInlineAttachment:(id)a3 inTextStorage:(id)a4 atTextRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  unint64_t location = a5.location;
  id v9 = a3;
  id v10 = a4;
  if (location > [v10 length])
  {
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v23.unint64_t location = location;
      v23.NSUInteger length = length;
      -[ICAttachmentInsertionController _addInlineAttachment:inTextStorage:atTextRange:](v23, v10);
    }

    unint64_t location = [v10 length];
  }
  v12 = [(ICAttachmentInsertionController *)self attachmentDelegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v12, "attachmentInsertionController:willAddInlineAttachment:atRange:textStorage:", self, v9, location, length, v10);
  }
  v13 = [v10 attributesAtIndex:location effectiveRange:0];
  v14 = +[ICInlineAttachmentUIModel filteredStyleAttributes:v13];
  v15 = (void *)[v14 mutableCopy];

  v16 = +[ICInlineTextAttachment textAttachmentWithAttachment:v9];
  [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4FB06B8]];
  id v17 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v16];
  uint64_t v18 = (void *)[v17 mutableCopy];

  objc_msgSend(v18, "addAttributes:range:", v15, 0, objc_msgSend(v18, "length"));
  objc_msgSend(v10, "replaceCharactersInRange:withAttributedString:", location, length, v18);
  [v10 fixupAfterEditing];
  [v9 updateChangeCountWithReason:@"Added inline attachment"];
  uint64_t v19 = [(ICAttachmentInsertionController *)self note];
  [v19 updateChangeCountWithReason:@"Added inline attachment"];

  uint64_t v20 = [(ICAttachmentInsertionController *)self note];
  [v20 save];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v12, "attachmentInsertionController:didAddInlineAttachment:atRange:textStorage:", self, v9, location + 1, 0, v10);
  }

  return v16;
}

- (ICAttachmentInsertionDelegate)attachmentDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentDelegate);
  return (ICAttachmentInsertionDelegate *)WeakRetained;
}

- (ICNote)note
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_note);
  return (ICNote *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_note);
  objc_destroyWeak((id *)&self->_attachmentDelegate);
}

- (void)addAttachment:(NSRange)a1 atTextRange:(void *)a2 .cold.1(NSRange a1, void *a2)
{
  v3 = NSStringFromRange(a1);
  [a2 length];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v4, v5, "Attempted to addAttachment:atTextRange: with an out of bound range: %@. Adding attachment to the end of text storage instead, %lu.", v6, v7, v8, v9, v10);
}

- (void)_addInlineAttachment:(NSRange)a1 inTextStorage:(void *)a2 atTextRange:.cold.1(NSRange a1, void *a2)
{
  v3 = NSStringFromRange(a1);
  [a2 length];
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v4, v5, "Attempted to addInlineAttachment:atTextRange: with an out of bound range: %@. Adding token attachment to the end of text storage instead, %lu.", v6, v7, v8, v9, v10);
}

@end