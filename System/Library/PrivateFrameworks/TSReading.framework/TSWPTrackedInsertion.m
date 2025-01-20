@interface TSWPTrackedInsertion
- (TSWPTrackedInsertion)initWithSelection:(id)a3 string:(id)a4 changeSession:(id)a5;
- (_NSRange)insertedRange;
- (int64_t)delta;
- (unint64_t)targetCharIndex;
- (void)dealloc;
- (void)performWithStorage:(id)a3 delta:(int64_t)a4 undoTransaction:(void *)a5 replaceBlock:(id)a6;
@end

@implementation TSWPTrackedInsertion

- (TSWPTrackedInsertion)initWithSelection:(id)a3 string:(id)a4 changeSession:(id)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TSWPTrackedInsertion;
  v8 = [(TSWPTrackedInsertion *)&v14 init];
  if (v8)
  {
    if ([a4 length])
    {
      if (a3)
      {
LABEL_4:
        v8->_selection = (TSWPSelection *)a3;
        v8->_string = (NSString *)a4;
        v8->_changeSession = (TSWPChangeSession *)a5;
        return v8;
      }
    }
    else
    {
      v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPTrackedInsertion initWithSelection:string:changeSession:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTrackedInsertion.mm"), 25, @"Can't track an insertion over an empty range");
      if (a3) {
        goto LABEL_4;
      }
    }
    v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPTrackedInsertion initWithSelection:string:changeSession:]"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTrackedInsertion.mm"), 26, @"invalid nil value for '%s'", "selection");
    goto LABEL_4;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPTrackedInsertion;
  [(TSWPTrackedInsertion *)&v3 dealloc];
}

- (void)performWithStorage:(id)a3 delta:(int64_t)a4 undoTransaction:(void *)a5 replaceBlock:(id)a6
{
  if (a4)
  {
    selection = self->_selection;
    uint64_t v11 = [(TSWPSelection *)selection range] + a4;
    [(TSWPSelection *)self->_selection range];
    uint64_t v13 = -[TSWPSelection copyWithNewRange:](selection, "copyWithNewRange:", v11, v12);

    self->_selection = v13;
  }
  objc_super v14 = (TSWPAttributeArray *)[a3 insertionChangesTable];
  unint64_t v15 = [(TSWPSelection *)self->_selection range];
  if (v16) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = v14 == 0;
  }
  if (!v17)
  {
    [a3 range];
    v42.location = NSExpandedRange();
    v42.length = v22;
    TSWPAttributeArray::begin(v14, &v42, &v40);
    TSWPAttributeArray::end(v14, &v42, &v38);
    for (unint64_t i = v41; ; unint64_t i = ++v41)
    {
      if (i == v39) {
        goto LABEL_8;
      }
      if ([*((id *)v40->var4 + 2 * i + 1) canMergeWithKind:1 session:self->_changeSession])
      {
        unint64_t v24 = TSWPAttributeArray::rangeForAttributeIndex(v40, v41);
        unint64_t v26 = v24 + v25;
        if (v15 > v24 || v15 < v26) {
          break;
        }
      }
    }
    if (v26 == v15)
    {
      int v34 = 1;
    }
    else
    {
      if (v24 != v15)
      {
LABEL_40:
        int v18 = 1;
        goto LABEL_9;
      }
      int v34 = 2;
    }
    TSWPChangeAttributeArray::setInsertionBehavior((uint64_t)v14, v34);
    goto LABEL_40;
  }
LABEL_8:
  int v18 = 0;
LABEL_9:
  (*((void (**)(id, TSWPSelection *, NSString *))a6 + 2))(a6, self->_selection, self->_string);
  uint64_t v19 = [(TSWPTrackedInsertion *)self insertedRange];
  objc_msgSend(a3, "p_handleChangeSplittingForInsertedRange:changeSession:undoTransaction:", v19, v20, self->_changeSession, a5);
  if (v18)
  {
    TSWPChangeAttributeArray::setInsertionBehavior((uint64_t)v14, 0);
    v21 = (objc_object *)objc_retain(*((id *)v14->var4
                                     + 2 * TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v14, v15)
                                     + 1));
    if (!v21) {
      return;
    }
    goto LABEL_32;
  }
  uint64_t v28 = [(TSWPTrackedInsertion *)self insertedRange];
  uint64_t v30 = v29;
  if (v14)
  {
    [a3 range];
    v42.location = NSExpandedRange();
    v42.length = v31;
    TSWPAttributeArray::begin(v14, &v42, &v40);
    TSWPAttributeArray::end(v14, &v42, &v38);
    for (unint64_t j = v41; j != v39; unint64_t j = ++v41)
    {
      v33 = (void *)*((void *)v40->var4 + 2 * j + 1);
      if ([v33 canMergeWithKind:1 session:self->_changeSession])
      {
        v43.location = TSWPAttributeArray::rangeForAttributeIndex(v40, v41);
        if (NSIntersectionRange(v43, v42).length)
        {
          v35 = v33;
          if (!v35) {
            break;
          }
          v36 = v35;
          v21 = v35;
          goto LABEL_31;
        }
      }
    }
  }
  v36 = -[TSWPChange initWithContext:kind:session:]([TSWPChange alloc], "initWithContext:kind:session:", [a3 context], 1, self->_changeSession);
  v21 = 0;
LABEL_31:
  objc_msgSend(a3, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", v36, v28, v30, 15, 0, a5);

  if (v21)
  {
LABEL_32:
    if (a5)
    {
      if (v14)
      {
        unint64_t Object = TSWPAttributeArray::findObject(v14, v21, 0);
        TSWPStorageTransaction::appendToTransaction((uint64_t *)a5, 10, 15, Object, (NSDate *)[(objc_object *)v21 date]);
      }
    }
    -[objc_object setDate:](v21, "setDate:", [MEMORY[0x263EFF910] date]);
    [(objc_object *)v21 trackedTextDidChange];
  }
}

- (unint64_t)targetCharIndex
{
  return [(TSWPSelection *)self->_selection range];
}

- (int64_t)delta
{
  NSUInteger v3 = [(NSString *)self->_string length];
  [(TSWPSelection *)self->_selection range];
  return v3 - v4;
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

@end