@interface TSWPFootnoteReferenceAttachment
- (BOOL)isEqual:(id)a3;
- (BOOL)isSearchable;
- (NSString)customMarkString;
- (TSWPFootnoteReferenceAttachment)initWithContext:(id)a3;
- (TSWPFootnoteReferenceAttachment)initWithContext:(id)a3 wpStorage:(id)a4;
- (TSWPStorage)containedStorage;
- (id)copyWithContext:(id)a3;
- (id)stringEquivalent;
- (int)elementKind;
- (unint64_t)findCharIndex;
- (void)adoptStylesheet:(id)a3 withMapper:(id)a4;
- (void)applyMark;
- (void)checkDebug;
- (void)dealloc;
- (void)setContainedStorage:(id)a3;
- (void)setContainedStorageParentInfoToStorage:(id)a3;
- (void)setCustomMarkString:(id)a3;
- (void)setParentStorage:(id)a3;
- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)willBeRemovedFromDocumentRoot:(id)a3;
@end

@implementation TSWPFootnoteReferenceAttachment

- (TSWPFootnoteReferenceAttachment)initWithContext:(id)a3 wpStorage:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TSWPFootnoteReferenceAttachment;
  v5 = [(TSWPAttachment *)&v10 initWithContext:a3];
  v6 = v5;
  if (v5)
  {
    [(TSWPFootnoteReferenceAttachment *)v5 setContainedStorage:a4];
    if (!v6->_containedStorage)
    {
      v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPFootnoteReferenceAttachment initWithContext:wpStorage:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFootnoteReferenceAttachment.mm"), 73, @"invalid nil value for '%s'", "_containedStorage");
    }
  }
  return v6;
}

- (TSWPFootnoteReferenceAttachment)initWithContext:(id)a3
{
  v5 = (void *)[a3 documentRoot];
  v6 = objc_msgSend((id)objc_msgSend(v5, "theme"), "defaultParagraphStyle");
  LODWORD(v10) = -1;
  v7 = -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:]([TSWPStorage alloc], "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:", a3, 0, 2, [v5 stylesheet], v6, objc_msgSend(v6, "initialListStyle"), 0, 0, v10);
  uint64_t v8 = [(TSWPFootnoteReferenceAttachment *)self initWithContext:a3 wpStorage:v7];
  [(TSWPFootnoteReferenceAttachment *)v8 applyMark];

  return v8;
}

- (void)dealloc
{
  [(TSWPStorage *)self->_containedStorage setOwningAttachment:0];
  [(TSWPStorage *)self->_containedStorage setParentInfo:0];

  v3.receiver = self;
  v3.super_class = (Class)TSWPFootnoteReferenceAttachment;
  [(TSWPFootnoteReferenceAttachment *)&v3 dealloc];
}

- (void)applyMark
{
  if ([(TSPObject *)self context]) {
    [(TSPObject *)self willModify];
  }
  objc_super v3 = [(TSWPAttachment *)[TSWPFootnoteMarkAttachment alloc] initWithContext:[(TSPObject *)self context]];
  -[TSWPStorage insertAttachmentOrFootnote:range:]([(TSWPFootnoteReferenceAttachment *)self containedStorage], "insertAttachmentOrFootnote:range:", v3, 0, 0);
}

- (int)elementKind
{
  return 64;
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSWPFootnoteReferenceAttachment;
  LODWORD(v4) = -[TSWPAttachment isEqual:](&v9, sel_isEqual_);
  if (v4)
  {
    objc_opt_class();
    v4 = (NSString *)TSUDynamicCast();
    if (v4)
    {
      v5 = v4;
      LODWORD(v4) = [(TSWPStorage *)self->_containedStorage isEqual:[(NSString *)v4 containedStorage]];
      if (v4)
      {
        v4 = (NSString *)[(NSString *)v5 customMarkString];
        customMarkString = self->_customMarkString;
        if (v4 == customMarkString)
        {
          LOBYTE(v4) = 1;
        }
        else
        {
          v7 = v4;
          LOBYTE(v4) = 0;
          if (v7 && customMarkString) {
            LOBYTE(v4) = -[NSString isEqualToString:](self->_customMarkString, "isEqualToString:");
          }
        }
      }
    }
  }
  return (char)v4;
}

- (id)copyWithContext:(id)a3
{
  id v5 = -[TSWPStorage newSubstorageWithRange:context:flags:](self->_containedStorage, "newSubstorageWithRange:context:flags:", 0, [(TSWPStorage *)self->_containedStorage length], a3, 1);
  v6 = (void *)[objc_allocWithZone((Class)objc_opt_class()) initWithContext:a3 wpStorage:v5];

  objc_msgSend(v6, "setCustomMarkString:", -[TSWPFootnoteReferenceAttachment customMarkString](self, "customMarkString"));
  return v6;
}

- (void)setContainedStorageParentInfoToStorage:(id)a3
{
}

- (void)setContainedStorage:(id)a3
{
  if (self->_containedStorage != a3)
  {
    if ([(TSPObject *)self context]) {
      [(TSPObject *)self willModify];
    }
    [(TSWPStorage *)self->_containedStorage setOwningAttachment:0];
    [(TSWPStorage *)self->_containedStorage setParentInfo:0];
    id v5 = a3;

    self->_containedStorage = (TSWPStorage *)a3;
    [a3 setOwningAttachment:self];
    parentStorage = self->super.super._parentStorage;
    [(TSWPFootnoteReferenceAttachment *)self setContainedStorageParentInfoToStorage:parentStorage];
  }
}

- (void)setParentStorage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment setParentStorage:](&v5, sel_setParentStorage_);
  [(TSWPFootnoteReferenceAttachment *)self setContainedStorageParentInfoToStorage:a3];
}

- (void)setCustomMarkString:(id)a3
{
  if ([(TSPObject *)self context]) {
    [(TSPObject *)self willModify];
  }
  id v5 = a3;

  self->_customMarkString = (NSString *)a3;
}

- (unint64_t)findCharIndex
{
  return [(TSWPStorage *)self->super.super._parentStorage findCharIndexForFootnoteAttachment:self];
}

- (id)stringEquivalent
{
  return 0;
}

- (BOOL)isSearchable
{
  return 1;
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment willBeAddedToDocumentRoot:context:](&v7, sel_willBeAddedToDocumentRoot_context_);
  [(TSWPStorage *)[(TSWPFootnoteReferenceAttachment *)self containedStorage] willBeAddedToDocumentRoot:a3 dolcContext:a4];
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment wasAddedToDocumentRoot:context:](&v7, sel_wasAddedToDocumentRoot_context_);
  [(TSWPStorage *)[(TSWPFootnoteReferenceAttachment *)self containedStorage] wasAddedToDocumentRoot:a3 dolcContext:a4];
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment willBeRemovedFromDocumentRoot:](&v5, sel_willBeRemovedFromDocumentRoot_);
  [(TSWPStorage *)[(TSWPFootnoteReferenceAttachment *)self containedStorage] willBeRemovedFromDocumentRoot:a3];
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPFootnoteReferenceAttachment;
  -[TSWPAttachment wasRemovedFromDocumentRoot:](&v5, sel_wasRemovedFromDocumentRoot_);
  [(TSWPStorage *)[(TSWPFootnoteReferenceAttachment *)self containedStorage] wasRemovedFromDocumentRoot:a3];
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  [a4 pushMappingContext:self];
  v7.receiver = self;
  v7.super_class = (Class)TSWPFootnoteReferenceAttachment;
  [(TSWPAttachment *)&v7 adoptStylesheet:a3 withMapper:a4];
  [(TSWPStorage *)self->_containedStorage adoptStylesheet:a3 withMapper:a4];
  [a4 popMappingContext:self];
}

- (void)checkDebug
{
  parentStorage = self->super.super._parentStorage;
  if (parentStorage
    && [(TSWPStorage *)parentStorage findCharIndexForFootnoteAttachment:self] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSWPFootnoteReferenceAttachment checkDebug]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFootnoteReferenceAttachment.mm"), 270, @"Attachment not found in parent storage");
  }
  if (!self->_containedStorage)
  {
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSWPFootnoteReferenceAttachment checkDebug]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFootnoteReferenceAttachment.mm"), 272, @"invalid nil value for '%s'", "_containedStorage");
  }
}

- (NSString)customMarkString
{
  return self->_customMarkString;
}

- (TSWPStorage)containedStorage
{
  return self->_containedStorage;
}

@end