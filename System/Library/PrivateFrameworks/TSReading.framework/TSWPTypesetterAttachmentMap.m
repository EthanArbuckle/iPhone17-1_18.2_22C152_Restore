@interface TSWPTypesetterAttachmentMap
+ (id)mapWithAttachment:(id)a3 layout:(id)a4 pageNumber:(unint64_t)a5 pageCount:(unint64_t)a6 footnoteMarkProvider:(id)a7 styleProvider:(id)a8 colorOverride:(id)a9;
- (TSDLayout)layout;
- (TSWPAttachment)attachment;
- (__CTLine)lineRef;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setAttachment:(id)a3;
- (void)setLayout:(id)a3;
@end

@implementation TSWPTypesetterAttachmentMap

- (TSWPAttachment)attachment
{
  return self->_attachment;
}

- (TSDLayout)layout
{
  return self->_layout;
}

- (void)dealloc
{
  lineRef = self->_lineRef;
  if (lineRef) {
    CFRelease(lineRef);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPTypesetterAttachmentMap;
  [(TSWPTypesetterAttachmentMap *)&v4 dealloc];
}

+ (id)mapWithAttachment:(id)a3 layout:(id)a4 pageNumber:(unint64_t)a5 pageCount:(unint64_t)a6 footnoteMarkProvider:(id)a7 styleProvider:(id)a8 colorOverride:(id)a9
{
  v15 = objc_alloc_init((Class)a1);
  v16 = v15;
  if (v15)
  {
    v15[1] = a3;
    v15[2] = a4;
    if (([a3 elementKind] & 0x1E0) != 0)
    {
      objc_opt_class();
      v17 = (void *)TSUDynamicCast();
      v18 = (void *)[v17 parentStorage];
      uint64_t v19 = [v17 findCharIndex];
      if (a7)
      {
        objc_opt_class();
        v20 = (void *)TSUDynamicCast();
        if (v20)
        {
          uint64_t v21 = [v20 containedStorage];
          id v22 = a7;
LABEL_10:
          uint64_t v25 = [v22 markStringForFootnoteReferenceStorage:v21];
LABEL_12:
          CFStringRef v26 = (const __CFString *)v25;
          if (v25)
          {
            uint64_t v27 = [v18 characterStyleAtCharIndex:v19 left:0 effectiveRange:0];
            v28 = objc_msgSend(a8, "paragraphStyleAtParIndex:effectiveRange:", objc_msgSend(v18, "paragraphIndexAtCharIndex:", v19), 0);
            uint64_t v29 = [v18 isWritingDirectionRightToLeftForParagraphAtCharIndex:v19];
            CFAllocatorRef v30 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
            MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, (CFDictionaryRef)[v28 getTypesetterAttributes:v27 scalePercent:100 isRightToLeft:v29]);
            if (MutableCopy)
            {
              v32 = MutableCopy;
              CFDictionaryRemoveValue(MutableCopy, @"TSWPSuperscript");
              if (a9) {
                CFDictionarySetValue(v32, (const void *)*MEMORY[0x263F03C60], (const void *)[a9 CGColor]);
              }
              CFAttributedStringRef v33 = CFAttributedStringCreate(v30, v26, v32);
              if (v33)
              {
                CFAttributedStringRef v34 = v33;
                CTLineRef v35 = CTLineCreateWithAttributedString(v33);
                CFRelease(v34);
                CFRelease(v32);
                v16[3] = v35;
                if (v35) {
                  goto LABEL_22;
                }
                goto LABEL_21;
              }
              CFRelease(v32);
            }
          }
          v16[3] = 0;
LABEL_21:
          v36 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v37 = [NSString stringWithUTF8String:"+[TSWPTypesetterAttachmentMap mapWithAttachment:layout:pageNumber:pageCount:footnoteMarkProvider:styleProvider:colorOverride:]"];
          objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPCoreTextTypesetter.mm"), 161, @"invalid nil value for '%s'", "result->_lineRef");
          goto LABEL_22;
        }
        if ([v17 elementKind] == 128)
        {
          if ([v18 wpKind] != 2)
          {
            v23 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
            uint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", "CTLineRef createLineRefForAttachment(TSWPTextualAttachment *, NSUInteger, NSUInteger, id<TSWPFootnoteMarkProvider>, id<TSWPStyleProvider>, TSUColor *)");
            objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPCoreTextTypesetter.mm"), 4657, @"Footnote mark in non-footnote storage");
          }
          id v22 = a7;
          uint64_t v21 = (uint64_t)v18;
          goto LABEL_10;
        }
      }
      uint64_t v25 = [v17 stringWithPageNumber:a5 pageCount:a6 charIndex:v19];
      goto LABEL_12;
    }
  }
LABEL_22:

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_alloc_init(TSWPTypesetterAttachmentMap);
  v5 = v4;
  if (v4)
  {
    v4->_attachment = self->_attachment;
    v4->_layout = self->_layout;
    v5->_lineRef = (__CTLine *)CFRetain(self->_lineRef);
  }
  return v5;
}

- (void)setAttachment:(id)a3
{
  self->_attachment = (TSWPAttachment *)a3;
}

- (void)setLayout:(id)a3
{
}

- (__CTLine)lineRef
{
  return self->_lineRef;
}

@end