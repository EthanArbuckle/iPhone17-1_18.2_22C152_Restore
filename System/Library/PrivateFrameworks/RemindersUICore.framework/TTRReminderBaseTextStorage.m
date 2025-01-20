@interface TTRReminderBaseTextStorage
- (REMCRMutableAttributedString)backingStore;
- (TTRReminderBaseTextStorage)init;
- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)string;
- (void)mutableAttributedString:(id)a3 didEdit:(int64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6;
- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4;
- (void)setAttributes:(id)a3 range:(_NSRange)a4;
- (void)setBackingStore:(id)a3;
@end

@implementation TTRReminderBaseTextStorage

- (TTRReminderBaseTextStorage)init
{
  v8.receiver = self;
  v8.super_class = (Class)TTRReminderBaseTextStorage;
  v2 = [(TTRReminderBaseTextStorage *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F94AB0]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F28E48]);
    uint64_t v5 = [v3 initWithBackingStore:v4];
    backingStore = v2->_backingStore;
    v2->_backingStore = (REMCRMutableAttributedString *)v5;

    [(REMCRMutableAttributedString *)v2->_backingStore setEditObserver:v2];
  }
  return v2;
}

- (id)string
{
  v2 = [(TTRReminderBaseTextStorage *)self backingStore];
  id v3 = [v2 string];

  return v3;
}

- (id)attributesAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  v6 = [(TTRReminderBaseTextStorage *)self backingStore];
  v7 = [v6 attributesAtIndex:a3 effectiveRange:a4];

  return v7;
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  id v8 = [(TTRReminderBaseTextStorage *)self backingStore];
  objc_msgSend(v8, "replaceCharactersInRange:withString:", location, length, v7);
}

- (void)setAttributes:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  id v8 = [(TTRReminderBaseTextStorage *)self backingStore];
  objc_msgSend(v8, "setAttributes:range:", v7, location, length);
}

- (void)mutableAttributedString:(id)a3 didEdit:(int64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
}

- (REMCRMutableAttributedString)backingStore
{
  return self->_backingStore;
}

- (void)setBackingStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end