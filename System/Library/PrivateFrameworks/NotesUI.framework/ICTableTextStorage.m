@interface ICTableTextStorage
- (ICTableTextStorage)initWithDocument:(id)a3;
- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4;
- (void)textStorage:(id)a3 didProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6;
@end

@implementation ICTableTextStorage

- (ICTableTextStorage)initWithDocument:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICTableTextStorage;
  v3 = [(ICTTTextStorage *)&v6 initWithDocument:a3];
  if (v3)
  {
    v4 = objc_alloc_init(ICTableTextController);
    [(ICTTTextStorage *)v3 setStyler:v4];
  }
  return v3;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withAttributedString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  unint64_t v8 = [(ICTTTextStorage *)self length];
  v14.receiver = self;
  v14.super_class = (Class)ICTableTextStorage;
  -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](&v14, sel_replaceCharactersInRange_withAttributedString_, location, length, v7);

  if ([(ICTTTextStorage *)self isReadingSelectionFromPasteboard])
  {
    unint64_t v9 = length - v8 + [(ICTTTextStorage *)self length];
    v10 = [(ICTTTextStorage *)self string];
    uint64_t v11 = objc_msgSend(v10, "paragraphRangeForRange:", location, v9);
    uint64_t v13 = v12;

    -[NSMutableAttributedString ic_convertParagraphStyleToBodyInRange:](self, "ic_convertParagraphStyleToBodyInRange:", v11, v13);
  }
}

- (void)textStorage:(id)a3 didProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
}

@end