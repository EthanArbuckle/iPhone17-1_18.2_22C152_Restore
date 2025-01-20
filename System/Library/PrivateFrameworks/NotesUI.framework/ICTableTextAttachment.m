@interface ICTableTextAttachment
- ($01BB1521EC52D44A8E7628F5261DCEC8)attachmentBoundsMargins;
- (BOOL)canDragWithoutSelecting;
- (CGSize)lastAttachmentSize;
- (double)lastAvailableWidth;
- (id)image;
- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5;
- (void)fixAttachmentForAttributedString:(id)a3 range:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6;
- (void)setLastAttachmentSize:(CGSize)a3;
- (void)setLastAvailableWidth:(double)a3;
@end

@implementation ICTableTextAttachment

- (id)image
{
  return 0;
}

- (BOOL)canDragWithoutSelecting
{
  return 0;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)attachmentBoundsMargins
{
  v26.receiver = self;
  v26.super_class = (Class)ICTableTextAttachment;
  [(ICTextAttachment *)&v26 attachmentBoundsMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    v11 = [(ICAbstractTextAttachment *)self attachment];
    int v12 = [v11 preferredViewSize];

    if (!v12)
    {
      v13 = [(ICAbstractTextAttachment *)self attachment];
      v14 = [v13 note];
      v15 = [v14 textStorage];

      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      if ([v15 length])
      {
        uint64_t v16 = *MEMORY[0x1E4FB06B8];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __48__ICTableTextAttachment_attachmentBoundsMargins__block_invoke;
        v21[3] = &unk_1E5FDA768;
        v21[4] = self;
        v21[5] = &v22;
        objc_msgSend(v15, "enumerateAttribute:inRange:options:usingBlock:", v16, 0, 1, 0, v21);
      }
      if (*((unsigned char *)v23 + 24)) {
        double v8 = 10.0;
      }
      _Block_object_dispose(&v22, 8);
    }
  }
  double v17 = v4;
  double v18 = v6;
  double v19 = v8;
  double v20 = v10;
  result.var3 = v20;
  result.var2 = v19;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

uint64_t __48__ICTableTextAttachment_attachmentBoundsMargins__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (*(void *)(result + 32) == a2 && a3 == 0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  *a5 = 1;
  return result;
}

- (void)fixAttachmentForAttributedString:(id)a3 range:(_NSRange)a4 forPlainText:(BOOL)a5 forStandardizedText:(BOOL)a6
{
  BOOL v6 = a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v11 = (void *)MEMORY[0x1E4F83510];
  id v12 = a3;
  v13 = [(ICAbstractTextAttachment *)self attachment];
  id v21 = [v11 sharedProviderForAttachment:v13];

  v14 = [v21 table];
  if (v14)
  {
    if (a5) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_opt_class();
    v15 = [(ICAbstractTextAttachment *)self attachment];
    uint64_t v16 = [v15 attachmentModel];
    double v17 = ICDynamicCast();
    v14 = [v17 table];

    if (a5) {
      goto LABEL_7;
    }
  }
  if (!v6)
  {
    double v18 = [(ICAbstractTextAttachment *)self attachment];
    double v19 = [v18 managedObjectContext];
    double v20 = [v14 attributedStringWithNSTextTablesForColumns:0 rows:0 context:v19];

    goto LABEL_8;
  }
LABEL_7:
  double v20 = [v14 joinedAttributedStringForColumns:0 rows:0];
LABEL_8:
  objc_msgSend(v12, "replaceCharactersInRange:withAttributedString:", location, length, v20);
  objc_msgSend(v12, "fixAttributesInRange:", location, objc_msgSend(v20, "length"));
}

- (id)printableTextContentForAppearanceType:(unint64_t)a3 traitCollection:(id)a4 textContainer:(id)a5
{
  BOOL v6 = (void *)MEMORY[0x1E4F83510];
  double v7 = [(ICAbstractTextAttachment *)self attachment];
  double v8 = [v6 sharedProviderForAttachment:v7];

  double v9 = [v8 table];
  double v10 = [(ICAbstractTextAttachment *)self attachment];
  v11 = [v10 managedObjectContext];
  id v12 = [v9 attributedStringWithNSTextTablesForColumns:0 rows:0 context:v11 forPrinting:1];

  return v12;
}

- (double)lastAvailableWidth
{
  return self->_lastAvailableWidth;
}

- (void)setLastAvailableWidth:(double)a3
{
  self->_lastAvailableWidth = a3;
}

- (CGSize)lastAttachmentSize
{
  double width = self->_lastAttachmentSize.width;
  double height = self->_lastAttachmentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastAttachmentSize:(CGSize)a3
{
  self->_lastAttachmentSize = a3;
}

@end