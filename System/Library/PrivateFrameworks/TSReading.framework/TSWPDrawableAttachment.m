@interface TSWPDrawableAttachment
+ (void)setPositionerClass:(Class)a3;
- (BOOL)isAnchored;
- (BOOL)isDrawable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHTMLWrap;
- (BOOL)isPartitioned;
- (BOOL)isSearchable;
- (BOOL)specifiesEnabledKnobMask;
- (Class)positionerClass;
- (TSDDrawableInfo)drawable;
- (TSWPDrawableAttachment)init;
- (TSWPDrawableAttachment)initWithContext:(id)a3 drawable:(id)a4;
- (double)attachmentAnchorY;
- (double)descent;
- (double)hOffset;
- (double)vOffset;
- (id)copyWithContext:(id)a3;
- (id)detachDrawable;
- (id)textRepresentationForCopy;
- (id)textStorages;
- (int)elementKind;
- (int)hOffsetType;
- (int)vAlignment;
- (int)vOffsetType;
- (unint64_t)enabledKnobMask;
- (void)adoptStylesheet:(id)a3 withMapper:(id)a4;
- (void)attachDrawable:(id)a3;
- (void)dealloc;
- (void)infoChanged;
- (void)invalidate;
- (void)setAttachmentAnchorY:(double)a3;
- (void)setHOffset:(double)a3;
- (void)setHOffsetType:(int)a3;
- (void)setParentStorage:(id)a3;
- (void)setVAlignment:(int)a3;
- (void)setVOffset:(double)a3;
- (void)setVOffsetType:(int)a3;
- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)wasRemovedFromDocumentRoot:(id)a3;
- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4;
- (void)willBeRemovedFromDocumentRoot:(id)a3;
@end

@implementation TSWPDrawableAttachment

- (TSDDrawableInfo)drawable
{
  return self->_drawableInfo;
}

- (double)descent
{
  return 0.0;
}

- (BOOL)isDrawable
{
  return 1;
}

- (BOOL)isPartitioned
{
  if ([(TSWPDrawableAttachment *)self isAnchored]) {
    return 0;
  }
  v3 = objc_opt_class();

  return [v3 canPartition];
}

- (BOOL)isAnchored
{
  v2 = [(TSDDrawableInfo *)self->_drawableInfo exteriorTextWrap];
  if (v2) {
    LOBYTE(v2) = [(TSDExteriorTextWrap *)v2 type] != 0;
  }
  return (char)v2;
}

- (void)setParentStorage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPDrawableAttachment;
  -[TSWPAttachment setParentStorage:](&v5, sel_setParentStorage_);
  [(TSDDrawableInfo *)self->_drawableInfo setParentInfo:a3];
}

- (TSWPDrawableAttachment)initWithContext:(id)a3 drawable:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TSWPDrawableAttachment;
  objc_super v5 = [(TSWPAttachment *)&v8 initWithContext:a3];
  if (v5)
  {
    v6 = (TSDDrawableInfo *)a4;
    v5->_drawableInfo = v6;
    [(TSDDrawableInfo *)v6 setOwningAttachment:v5];
    v5->_hOffsetType = 0;
    v5->_hOffset = NAN;
    v5->_vOffsetType = 0;
    v5->_vOffset = NAN;
    v5->_vAlignment = 0;
  }
  return v5;
}

- (int)elementKind
{
  return [(TSDDrawableInfo *)self->_drawableInfo elementKind];
}

- (void)setHOffsetType:(int)a3
{
  self->_hOffsetType = a3;
}

- (void)setHOffset:(double)a3
{
  self->_hOffset = a3;
}

- (void)setVOffsetType:(int)a3
{
  self->_vOffsetType = a3;
}

- (void)setVOffset:(double)a3
{
  self->_vOffset = a3;
}

+ (void)setPositionerClass:(Class)a3
{
  if (([(objc_class *)a3 conformsToProtocol:&unk_26D7EF2C0] & 1) == 0)
  {
    v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"+[TSWPDrawableAttachment setPositionerClass:]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPDrawableAttachment.mm"), 92, @"Invalid positioner class");
  }
  _tswpDrawableAttachmentPositionerClass = (uint64_t)a3;
}

- (void)dealloc
{
  [(TSDDrawableInfo *)self->_drawableInfo setOwningAttachment:0];

  v3.receiver = self;
  v3.super_class = (Class)TSWPDrawableAttachment;
  [(TSWPDrawableAttachment *)&v3 dealloc];
}

- (TSWPDrawableAttachment)init
{
}

- (id)copyWithContext:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TSWPDrawableAttachment;
  uint64_t v5 = -[TSWPAttachment copyWithContext:](&v8, sel_copyWithContext_);
  if (v5)
  {
    id v6 = [(TSDDrawableInfo *)self->_drawableInfo copyWithContext:a3];
    v5[7] = v6;
    [v6 setOwningAttachment:v5];
    *((_DWORD *)v5 + 16) = self->_hOffsetType;
    v5[9] = *(void *)&self->_hOffset;
    *((_DWORD *)v5 + 20) = self->_vOffsetType;
    v5[11] = *(void *)&self->_vOffset;
    *((_DWORD *)v5 + 24) = self->_vAlignment;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSWPDrawableAttachment;
  unsigned int v4 = -[TSWPAttachment isEqual:](&v9, sel_isEqual_);
  if (v4)
  {
    objc_opt_class();
    uint64_t v5 = TSUDynamicCast();
    if (v5)
    {
      id v6 = (void *)v5;
      int v7 = [(TSWPDrawableAttachment *)self isAnchored];
      if (v7 == [v6 isAnchored]) {
        LOBYTE(v4) = -[TSDDrawableInfo isEqual:](self->_drawableInfo, "isEqual:", [v6 drawable]);
      }
      else {
        LOBYTE(v4) = 0;
      }
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (void)invalidate
{
  objc_super v3 = [(TSWPAttachment *)self parentStorage];
  unint64_t v4 = [(TSWPAttachment *)self findCharIndex];

  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](v3, "p_didChangeRange:delta:broadcastKind:", v4, 1, 0, 1);
}

- (id)detachDrawable
{
  [(TSPObject *)self willModify];
  objc_super v3 = self->_drawableInfo;
  [(TSDDrawableInfo *)self->_drawableInfo setOwningAttachment:0];
  self->_drawableInfo = 0;
  [(TSDDrawableInfo *)v3 setParentInfo:0];
  return v3;
}

- (void)attachDrawable:(id)a3
{
  [(TSPObject *)self willModify];
  uint64_t v5 = (TSDDrawableInfo *)a3;
  self->_drawableInfo = v5;
  [(TSDDrawableInfo *)v5 setOwningAttachment:self];
  id v6 = [(TSWPAttachment *)self parentStorage];
  drawableInfo = self->_drawableInfo;

  [(TSDDrawableInfo *)drawableInfo setParentInfo:v6];
}

- (BOOL)isHTMLWrap
{
  v2 = [(TSDDrawableInfo *)self->_drawableInfo exteriorTextWrap];

  return [(TSDExteriorTextWrap *)v2 isHTMLWrap];
}

- (Class)positionerClass
{
  if (![(TSWPDrawableAttachment *)self isAnchored]) {
    return 0;
  }
  if ([(TSDExteriorTextWrap *)[(TSDDrawableInfo *)self->_drawableInfo exteriorTextWrap] isHTMLWrap])
  {
    return 0;
  }
  return (Class)_tswpDrawableAttachmentPositionerClass;
}

- (BOOL)isSearchable
{
  return 1;
}

- (BOOL)specifiesEnabledKnobMask
{
  if ([(TSDDrawableInfo *)self->_drawableInfo isInlineWithText])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(TSDDrawableInfo *)self->_drawableInfo isAnchoredToText];
    if (v3)
    {
      unint64_t v4 = [(TSDDrawableInfo *)self->_drawableInfo exteriorTextWrap];
      LOBYTE(v3) = [(TSDExteriorTextWrap *)v4 isHTMLWrap];
    }
  }
  return v3;
}

- (unint64_t)enabledKnobMask
{
  if (![(TSDDrawableInfo *)self->_drawableInfo isInlineWithText])
  {
    if ([(TSDExteriorTextWrap *)[(TSDDrawableInfo *)self->_drawableInfo exteriorTextWrap] type]- 1 > 1)
    {
      v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPDrawableAttachment enabledKnobMask]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPDrawableAttachment.mm"), 436, @"Unexpected text wrap type (%d).", -[TSDExteriorTextWrap type](-[TSDDrawableInfo exteriorTextWrap](self->_drawableInfo, "exteriorTextWrap"), "type"));
    }
    else
    {
      int v9 = [(TSDExteriorTextWrap *)[(TSDDrawableInfo *)self->_drawableInfo exteriorTextWrap] direction];
      if (v9 < 3) {
        return qword_22383AC88[v9];
      }
      v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v13 = [NSString stringWithUTF8String:"-[TSWPDrawableAttachment enabledKnobMask]"];
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPDrawableAttachment.mm"), 429, @"Unexpected text wrap direction (%d).", -[TSDExteriorTextWrap direction](-[TSDDrawableInfo exteriorTextWrap](self->_drawableInfo, "exteriorTextWrap"), "direction"));
    }
    return 0;
  }
  unint64_t result = [(TSWPAttachment *)self parentStorage];
  if (!result) {
    return result;
  }
  unint64_t v4 = (void *)result;
  unint64_t v5 = [(TSWPAttachment *)self findCharIndex];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v6 = v5;
  unint64_t result = [v4 paragraphStyleAtCharIndex:v5 effectiveRange:0];
  if (!result) {
    return result;
  }
  uint64_t v7 = [(id)result intValueForProperty:86];
  uint64_t v8 = v7;
  if (v7 >= 5)
  {
    v14 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v15 = [NSString stringWithUTF8String:"-[TSWPDrawableAttachment enabledKnobMask]"];
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPDrawableAttachment.mm"), 403, @"Invalid paragraph alignment value (%d).", v8);
    return 0;
  }
  if (v7 == 4) {
    LODWORD(v8) = [v4 isWritingDirectionRightToLeftForParagraphAtCharIndex:v6];
  }
  return -[TSWPDrawableAttachment enabledKnobMask]::sEnabledKnobMaskTable[v8];
}

- (void)infoChanged
{
  parentStorage = self->super._parentStorage;
  unint64_t v3 = [(TSWPAttachment *)self findCharIndex];

  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](parentStorage, "p_didChangeRange:delta:broadcastKind:", v3, 1, 0, 0);
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  [a4 pushMappingContext:self];
  v7.receiver = self;
  v7.super_class = (Class)TSWPDrawableAttachment;
  [(TSWPAttachment *)&v7 adoptStylesheet:a3 withMapper:a4];
  [(TSDDrawableInfo *)self->_drawableInfo adoptStylesheet:a3 withMapper:a4];
  [a4 popMappingContext:self];
}

- (void)willBeAddedToDocumentRoot:(id)a3 context:(id)a4
{
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a3, "performSelector:withObject:", sel_willAddDrawable_, -[TSWPDrawableAttachment drawable](self, "drawable"));
  }
  v7.receiver = self;
  v7.super_class = (Class)TSWPDrawableAttachment;
  [(TSWPAttachment *)&v7 willBeAddedToDocumentRoot:a3 context:a4];
  [(TSDDrawableInfo *)self->_drawableInfo willBeAddedToDocumentRoot:a3 context:a4];
}

- (void)wasAddedToDocumentRoot:(id)a3 context:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPDrawableAttachment;
  -[TSWPAttachment wasAddedToDocumentRoot:context:](&v7, sel_wasAddedToDocumentRoot_context_);
  [(TSDDrawableInfo *)self->_drawableInfo wasAddedToDocumentRoot:a3 context:a4];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a3, "performSelector:withObject:", sel_didAddDrawable_, -[TSWPDrawableAttachment drawable](self, "drawable"));
  }
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a3, "performSelector:withObject:", sel_willRemoveDrawable_, -[TSWPDrawableAttachment drawable](self, "drawable"));
  }
  [(TSDDrawableInfo *)self->_drawableInfo willBeRemovedFromDocumentRoot:a3];
  v5.receiver = self;
  v5.super_class = (Class)TSWPDrawableAttachment;
  [(TSWPAttachment *)&v5 willBeRemovedFromDocumentRoot:a3];
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  -[TSDDrawableInfo wasRemovedFromDocumentRoot:](self->_drawableInfo, "wasRemovedFromDocumentRoot:");
  v5.receiver = self;
  v5.super_class = (Class)TSWPDrawableAttachment;
  [(TSWPAttachment *)&v5 wasRemovedFromDocumentRoot:a3];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(a3, "performSelector:withObject:", sel_didRemoveDrawable_, -[TSWPDrawableAttachment drawable](self, "drawable"));
  }
}

- (int)hOffsetType
{
  return self->_hOffsetType;
}

- (double)hOffset
{
  return self->_hOffset;
}

- (int)vOffsetType
{
  return self->_vOffsetType;
}

- (double)vOffset
{
  return self->_vOffset;
}

- (int)vAlignment
{
  return self->_vAlignment;
}

- (void)setVAlignment:(int)a3
{
  self->_vAlignment = a3;
}

- (double)attachmentAnchorY
{
  return self->_attachmentAnchorY;
}

- (void)setAttachmentAnchorY:(double)a3
{
  self->_attachmentAnchorY = a3;
}

- (id)textRepresentationForCopy
{
  objc_opt_class();
  [(TSWPDrawableAttachment *)self drawable];
  id result = (id)TSUDynamicCast();
  if (result)
  {
    id result = (id)[result containedStorage];
    if (result)
    {
      id v4 = result;
      if ([result length]) {
        return v4;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (id)textStorages
{
  id result = [(TSWPDrawableAttachment *)self drawable];
  if (result)
  {
    id v3 = result;
    if (objc_opt_respondsToSelector())
    {
      id result = (id)[v3 textStorages];
      if (result)
      {
        id v4 = result;
        if ([result count]) {
          return v4;
        }
        else {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

@end