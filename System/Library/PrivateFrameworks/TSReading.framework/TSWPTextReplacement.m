@interface TSWPTextReplacement
- (TSWPTextReplacement)initWithSelection:(id)a3 string:(id)a4;
- (_NSRange)insertedRange;
- (int64_t)delta;
- (unint64_t)targetCharIndex;
- (void)dealloc;
- (void)performWithStorage:(id)a3 delta:(int64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5 replaceBlock:(id)a6;
@end

@implementation TSWPTextReplacement

- (void)performWithStorage:(id)a3 delta:(int64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5 replaceBlock:(id)a6
{
  selection = self->_selection;
  if (a4)
  {
    uint64_t v11 = [(TSWPSelection *)self->_selection range] + a4;
    [(TSWPSelection *)self->_selection range];
    selection = -[TSWPSelection copyWithNewRange:](selection, "copyWithNewRange:", v11, v12);

    self->_selection = selection;
  }
  (*((void (**)(id, TSWPSelection *, NSString *))a6 + 2))(a6, selection, self->_string);
  uint64_t v14 = [(TSWPTextReplacement *)self insertedRange];

  objc_msgSend(a3, "p_handleChangeSplittingForInsertedRange:changeSession:undoTransaction:", v14, v13, 0, a5);
}

- (_NSRange)insertedRange
{
  uint64_t v3 = [(TSWPSelection *)self->_selection range];
  NSUInteger v4 = [(NSString *)self->_string length];
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (int64_t)delta
{
  NSUInteger v3 = [(NSString *)self->_string length];
  [(TSWPSelection *)self->_selection range];
  return v3 - v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextReplacement;
  [(TSWPTextReplacement *)&v3 dealloc];
}

- (TSWPTextReplacement)initWithSelection:(id)a3 string:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSWPTextReplacement;
  v6 = [(TSWPTextReplacement *)&v8 init];
  if (v6)
  {
    v6->_selection = (TSWPSelection *)a3;
    v6->_string = (NSString *)a4;
  }
  return v6;
}

- (unint64_t)targetCharIndex
{
  return [(TSWPSelection *)self->_selection range];
}

@end