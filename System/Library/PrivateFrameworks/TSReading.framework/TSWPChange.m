@interface TSWPChange
- (BOOL)canMergeWithKind:(int)a3 session:(id)a4;
- (BOOL)isDeletion;
- (BOOL)isFromChangeSession:(id)a3;
- (BOOL)isHidden;
- (BOOL)isInsertion;
- (BOOL)showsHiddenDeletionMarkup;
- (BOOL)showsMarkup;
- (NSDate)date;
- (TSUColor)changeAdornmentsColor;
- (TSUColor)textMarkupColor;
- (TSWPChange)initWithContext:(id)a3 kind:(int)a4 session:(id)a5;
- (TSWPChangeSession)session;
- (TSWPStorage)parentStorage;
- (id)copyWithContext:(id)a3;
- (void)dealloc;
- (void)p_invalidateAnnotationResultsForDocumentRoot:(id)a3;
- (void)setDate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setParentStorage:(id)a3;
- (void)setSession:(id)a3;
- (void)trackedTextDidChange;
@end

@implementation TSWPChange

- (TSWPChangeSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->_session = (TSWPChangeSession *)a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  [(TSPObject *)self willModify];
  id v5 = a3;

  self->_date = (NSDate *)a3;
}

- (TSWPChange)initWithContext:(id)a3 kind:(int)a4 session:(id)a5
{
  v12.receiver = self;
  v12.super_class = (Class)TSWPChange;
  v8 = -[TSPObject initWithContext:](&v12, sel_initWithContext_);
  v9 = v8;
  if (v8)
  {
    v8->_kind = a4;
    v8->_session = (TSWPChangeSession *)a5;
    v9->_date = (NSDate *)objc_alloc_init(MEMORY[0x263EFF910]);
    objc_opt_class();
    [a3 documentObject];
    v10 = (void *)TSUDynamicCast();
    if (v10) {
      v9->_hidden = objc_msgSend((id)objc_msgSend(v10, "changeVisibility"), "shouldShowChangeKind:date:", v9->_kind, -[TSWPChangeSession date](v9->_session, "date")) ^ 1;
    }
    else {
      v9->_hidden = 1;
    }
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPChange;
  [(TSWPChange *)&v3 dealloc];
}

- (BOOL)isInsertion
{
  return self->_kind == 1;
}

- (BOOL)isDeletion
{
  return self->_kind == 2;
}

- (void)setHidden:(BOOL)a3
{
  if (a3 && self->_kind != 2)
  {
    id v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSWPChange setHidden:]"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPChange.mm"), 90, @"Only deletions may be hidden");
  }
  [(TSPObject *)self willModify];
  self->_hidden = a3;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)showsMarkup
{
  objc_super v3 = objc_msgSend(-[TSPObject documentRoot](self, "documentRoot"), "changeVisibility");
  if ([(TSWPChange *)self isHidden]) {
    return 0;
  }
  uint64_t kind = self->_kind;
  uint64_t v6 = [(TSWPChangeSession *)self->_session date];

  return [v3 shouldShowMarkupForChangeKind:kind date:v6];
}

- (BOOL)showsHiddenDeletionMarkup
{
  if (self->_kind != 2)
  {
    objc_super v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSWPChange showsHiddenDeletionMarkup]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPChange.mm"), 116, @"Only call this method for deletions");
    if (self->_kind != 2) {
      return 0;
    }
  }
  if (![(TSWPChange *)self isHidden] || [(TSWPChange *)self showsMarkup]) {
    return 0;
  }
  uint64_t v6 = objc_msgSend(-[TSPObject documentRoot](self, "documentRoot"), "changeVisibility");
  v7 = [(TSWPChangeSession *)self->_session date];

  return [v6 shouldShowMarkupForChangeKind:1 date:v7];
}

- (TSUColor)textMarkupColor
{
  v2 = [(TSWPChangeSession *)self->_session author];

  return [(TSKAnnotationAuthor *)v2 textMarkupColor];
}

- (TSUColor)changeAdornmentsColor
{
  v2 = [(TSWPChangeSession *)self->_session author];

  return [(TSKAnnotationAuthor *)v2 changeAdornmentsColor];
}

- (void)trackedTextDidChange
{
  id v3 = [(TSPObject *)self documentRoot];

  [(TSWPChange *)self p_invalidateAnnotationResultsForDocumentRoot:v3];
}

- (void)p_invalidateAnnotationResultsForDocumentRoot:(id)a3
{
  uint64_t v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];

  [v4 postNotificationName:@"kTSDAnnotationInvalidatedNotification" object:a3];
}

- (id)copyWithContext:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", -[TSWPChange zone](self, "zone")), "initWithContext:", a3);
  uint64_t v5 = v4;
  if (v4)
  {
    *(_DWORD *)(v4 + 56) = self->_kind;
    *(void *)(v4 + 64) = self->_session;
    *(void *)(v5 + 72) = [(NSDate *)self->_date copy];
    *(unsigned char *)(v5 + 80) = self->_hidden;
  }
  return (id)v5;
}

- (BOOL)canMergeWithKind:(int)a3 session:(id)a4
{
  if (self->_kind == a3) {
    return [a4 isEqualToSession:self->_session];
  }
  else {
    return 0;
  }
}

- (BOOL)isFromChangeSession:(id)a3
{
  return [a3 isEqualToSession:self->_session];
}

- (TSWPStorage)parentStorage
{
  return self->_parentStorage;
}

- (void)setParentStorage:(id)a3
{
  self->_parentStorage = (TSWPStorage *)a3;
}

@end