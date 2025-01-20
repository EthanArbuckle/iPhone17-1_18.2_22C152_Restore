@interface SXTextTangierStorage
- (BOOL)isSelectable;
- (BOOL)shouldHyphenate;
- (BOOL)supportsSections;
- (NSCache)tokenizersCache;
- (NSLocale)locale;
- (NSMutableArray)attachments;
- (NSSet)rangedExclusionPaths;
- (SXTextTangierStorage)initWithContext:(id)a3 stylesheet:(id)a4 storageKind:(int)a5 string:(id)a6 locale:(id)a7;
- (_NSRange)insertAttachmentOrFootnote:(id)a3 range:(_NSRange)a4;
- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4;
- (os_unfair_lock_s)unfairLock;
- (void)dealloc;
- (void)setAttachments:(id)a3;
- (void)setIsSelectable:(BOOL)a3;
- (void)setRangedExclusionPaths:(id)a3;
- (void)setShouldHyphenate:(BOOL)a3;
- (void)setTokenizersCache:(id)a3;
@end

@implementation SXTextTangierStorage

- (SXTextTangierStorage)initWithContext:(id)a3 stylesheet:(id)a4 storageKind:(int)a5 string:(id)a6 locale:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v13 = a7;
  v14 = (objc_class *)MEMORY[0x263F7C780];
  id v15 = a6;
  id v16 = a4;
  id v17 = a3;
  v18 = (void *)[[v14 alloc] initWithContext:v17];
  v19 = [MEMORY[0x263F7C778] defaultStyleWithContext:v17];
  v24.receiver = self;
  v24.super_class = (Class)SXTextTangierStorage;
  v20 = [(TSWPStorage *)&v24 initWithContext:v17 string:v15 kind:v9 stylesheet:v16 paragraphStyle:v18 listStyle:v19 section:0 columnStyle:0];

  if (v20)
  {
    objc_storeStrong((id *)&v20->_locale, a7);
    v21 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    tokenizersCache = v20->_tokenizersCache;
    v20->_tokenizersCache = v21;

    v20->_unfairLock._os_unfair_lock_opaque = 0;
  }

  return v20;
}

- (BOOL)supportsSections
{
  return 0;
}

- (void)setRangedExclusionPaths:(id)a3
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v51 = a3;
  objc_storeStrong((id *)&self->_rangedExclusionPaths, a3);
  v5 = [(SXTextTangierStorage *)self attachments];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(SXTextTangierStorage *)self setAttachments:v6];
  }
  v7 = [(SXTextTangierStorage *)self attachments];
  uint64_t v8 = [v7 count];

  if (v8 - 1 >= 0)
  {
    do
    {
      --v8;
      uint64_t v9 = [(SXTextTangierStorage *)self attachments];
      v10 = [v9 objectAtIndex:v8];

      objc_opt_class();
      v11 = [v10 drawable];
      v12 = TSUDynamicCast();

      if (v12)
      {
        uint64_t v13 = [v12 actualRange];
        -[TSWPStorage deleteRange:undoTransaction:](self, "deleteRange:undoTransaction:", v13, v14, 0);
      }
    }
    while (v8 > 0);
  }
  id v15 = [(SXTextTangierStorage *)self attachments];
  [v15 removeAllObjects];

  id v16 = [(SXTextTangierStorage *)self rangedExclusionPaths];
  id v17 = [v16 allObjects];
  v18 = [v17 sortedArrayUsingComparator:&__block_literal_global_34];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  obuint64_t j = v18;
  uint64_t v55 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v55)
  {
    uint64_t v53 = *(void *)v62;
    double v19 = *MEMORY[0x263F00148];
    double v20 = *(double *)(MEMORY[0x263F00148] + 8);
    v54 = self;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v62 != v53) {
          objc_enumerationMutation(obj);
        }
        v22 = *(double **)(*((void *)&v61 + 1) + 8 * i);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        id v23 = [(SXTextTangierStorage *)self attachments];
        uint64_t v24 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v58;
          while (2)
          {
            for (uint64_t j = 0; j != v25; ++j)
            {
              if (*(void *)v58 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = *(void **)(*((void *)&v57 + 1) + 8 * j);
              objc_opt_class();
              v29 = [v28 drawable];
              v30 = TSUDynamicCast();

              if (v30)
              {
                v31 = [v30 exclusionPath];

                if (v31 == v22)
                {
                  self = v54;
                  goto LABEL_31;
                }
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        v32 = -[SXTextExclusionPath path](v22);
        memset(&rect, 0, sizeof(rect));
        id v23 = v32;
        BOOL IsRect = CGPathIsRect((CGPathRef)[v23 CGPath], &rect);
        if (!IsRect)
        {
          [v23 bounds];
          rect.origin.x = v34;
          rect.origin.y = v35;
          rect.size.width = v36;
          rect.size.height = v37;
        }
        id v38 = objc_alloc(MEMORY[0x263F7C6B0]);
        v39 = objc_msgSend(v38, "initWithPosition:size:", v19, v20, rect.size.width, rect.size.height);
        v40 = [SXTextTangierAttachmentInfo alloc];
        self = v54;
        v41 = [(TSPObject *)v54 context];
        v42 = [(TSDDrawableInfo *)v40 initWithContext:v41 geometry:v39];

        BOOL v43 = !IsRect;
        uint64_t v44 = 1;
        v45 = [MEMORY[0x263F7C6A0] exteriorTextWrapWithIsHTMLWrap:0 type:1 direction:2 fitType:v43 margin:0.0 alphaThreshold:0.0];
        [(TSDDrawableInfo *)v42 setExteriorTextWrap:v45];

        [(SXTextTangierAttachmentInfo *)v42 setExclusionPath:v22];
        if (-[SXTextExclusionPath lineVerticalAlignment]((uint64_t)v22) != 1)
        {
          if (-[SXTextExclusionPath lineVerticalAlignment]((uint64_t)v22) == 2)
          {
            uint64_t v44 = 2;
          }
          else if (-[SXTextExclusionPath lineVerticalAlignment]((uint64_t)v22) == 3)
          {
            uint64_t v44 = 3;
          }
          else
          {
            uint64_t v44 = 4 * (-[SXTextExclusionPath lineVerticalAlignment]((uint64_t)v22) == 4);
          }
        }
        id v46 = objc_alloc(MEMORY[0x263F7C728]);
        v47 = [(TSPObject *)v54 context];
        v48 = (void *)[v46 initWithContext:v47 drawable:v42];

        [v48 setHOffset:-[SXTextExclusionPath position]((uint64_t)v22)];
        [v48 setVOffset:0.0];
        [v48 setVAlignment:v44];
        [v48 setAttachmentAnchorY:-[SXTextExclusionPath verticalAlignmentFactor]((uint64_t)v22)];
        uint64_t v49 = -[SXTextTangierStorage insertAttachmentOrFootnote:range:](v54, "insertAttachmentOrFootnote:range:", v48, -[SXTextExclusionPath range]((uint64_t)v22), 0);
        -[SXTextTangierAttachmentInfo setActualRange:](v42, "setActualRange:", v49, v50);

LABEL_31:
      }
      uint64_t v55 = [obj countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v55);
  }
}

uint64_t __48__SXTextTangierStorage_setRangedExclusionPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = -[SXTextExclusionPath range]((uint64_t)v4);
  if (v6 <= -[SXTextExclusionPath range]((uint64_t)v5))
  {
    unint64_t v8 = -[SXTextExclusionPath range]((uint64_t)v4);
    uint64_t v7 = v8 < -[SXTextExclusionPath range]((uint64_t)v5);
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (_NSRange)insertAttachmentOrFootnote:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v14.receiver = self;
  v14.super_class = (Class)SXTextTangierStorage;
  id v7 = a3;
  id v8 = -[TSWPStorage insertAttachmentOrFootnote:range:](&v14, sel_insertAttachmentOrFootnote_range_, v7, location, length);
  NSUInteger v10 = v9;
  v11 = [(SXTextTangierStorage *)self attachments];
  [v11 addObject:v7];

  NSUInteger v12 = (NSUInteger)v8;
  NSUInteger v13 = v10;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:");
  unint64_t v9 = v8;
  NSUInteger v10 = *MEMORY[0x263F7C7C8];
  NSUInteger v35 = *(void *)(MEMORY[0x263F7C7C8] + 8);
  v11 = [(TSWPStorage *)self string];

  unint64_t v12 = [(TSWPStorage *)self length];
  unint64_t v13 = v7 + v9;
  NSUInteger v36 = v10;
  if (a3 >= v7 && a3 - v7 < v9)
  {
    if (v12 < v13)
    {
      objc_super v14 = [MEMORY[0x263F7C7F0] currentHandler];
      id v15 = [NSString stringWithUTF8String:"-[SXTextTangierStorage wordAtCharIndex:includePreviousWord:]"];
      id v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierStorage.m"];
      [v14 handleFailureInFunction:v15 file:v16 lineNumber:174 description:@"Specified range is out of range of string"];

LABEL_14:
      NSUInteger v23 = v35;
      NSUInteger v22 = v36;
LABEL_32:

      goto LABEL_33;
    }
    goto LABEL_9;
  }
  if (v12 < v13)
  {
    id v17 = [MEMORY[0x263F7C7F0] currentHandler];
    v18 = [NSString stringWithUTF8String:"-[SXTextTangierStorage wordAtCharIndex:includePreviousWord:]"];
    double v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierStorage.m"];
    [v17 handleFailureInFunction:v18 file:v19 lineNumber:174 description:@"Specified range is out of range of string"];

    if (v13 == a3) {
      goto LABEL_24;
    }
LABEL_13:
    objc_super v14 = [MEMORY[0x263F7C7F0] currentHandler];
    id v15 = [NSString stringWithUTF8String:"-[SXTextTangierStorage wordAtCharIndex:includePreviousWord:]"];
    v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/FeldsparServicesUI/Modules/silex/Silex/Text/Tangier/SXTextTangierStorage.m"];
    [v14 handleFailureInFunction:v15 file:v21 lineNumber:175 description:@"Character index out of range"];

    goto LABEL_14;
  }
  if (v13 != a3) {
    goto LABEL_13;
  }
LABEL_9:
  if (CFStringGetLength(v11) <= a3)
  {
    int v20 = 0;
  }
  else
  {
    int v20 = 0;
    if (CFStringGetCharacterAtIndex(v11, a3) && v13 > a3) {
      int v20 = IsWhitespaceCharacter() ^ 1;
    }
  }
  if (v4 && a3 > v7)
  {
    CFStringGetCharacterAtIndex(v11, a3 - 1);
    int v24 = IsWhitespaceCharacter();
    v20 |= v24 ^ 1;
    if (!v24) {
      --a3;
    }
  }
  if (v20 && v9)
  {
    uint64_t v25 = [(TSWPStorage *)self string];
    objc_super v14 = objc_msgSend(v25, "substringWithRange:", v7, v9);

    os_unfair_lock_lock_with_options();
    uint64_t v26 = [(SXTextTangierStorage *)self tokenizersCache];
    id v15 = [v26 objectForKey:v14];

    os_unfair_lock_unlock(&self->_unfairLock);
    if (v15)
    {
      CFRetain(v15);
      v27 = (__CFStringTokenizer *)v15;
      NSUInteger v23 = v35;
      NSUInteger v22 = v36;
    }
    else
    {
      v38.CFIndex location = v7;
      v38.CFIndex length = v9;
      v27 = CFStringTokenizerCreate(0, v11, v38, 4uLL, 0);
      os_unfair_lock_lock_with_options();
      v28 = [(SXTextTangierStorage *)self tokenizersCache];
      [v28 setObject:v27 forKey:v14];

      os_unfair_lock_unlock(&self->_unfairLock);
      NSUInteger v23 = v35;
      NSUInteger v22 = v36;
      if (!v27) {
        goto LABEL_32;
      }
    }
    CFStringTokenizerTokenType v29 = CFStringTokenizerGoToTokenAtIndex(v27, a3);
    CFIndex length = 0;
    CFIndex location = -1;
    if (v29 && (v29 & 0x10) == 0)
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v27);
      CFIndex length = CurrentTokenRange.length;
      CFIndex location = CurrentTokenRange.location;
    }
    if (location != -1 && length != 0)
    {
      NSUInteger v23 = length;
      NSUInteger v22 = location;
    }
    CFRelease(v27);
    goto LABEL_32;
  }
LABEL_24:
  NSUInteger v23 = v35;
  NSUInteger v22 = v36;
LABEL_33:
  NSUInteger v33 = v22;
  NSUInteger v34 = v23;
  result.CFIndex length = v34;
  result.CFIndex location = v33;
  return result;
}

- (void)dealloc
{
  v3 = [(SXTextTangierStorage *)self tokenizersCache];
  [v3 removeAllObjects];

  [(SXTextTangierStorage *)self setTokenizersCache:0];
  v4.receiver = self;
  v4.super_class = (Class)SXTextTangierStorage;
  [(TSWPStorage *)&v4 dealloc];
}

- (NSLocale)locale
{
  return self->_locale;
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (void)setIsSelectable:(BOOL)a3
{
  self->_isSelectable = a3;
}

- (BOOL)shouldHyphenate
{
  return self->_shouldHyphenate;
}

- (void)setShouldHyphenate:(BOOL)a3
{
  self->_shouldHyphenate = a3;
}

- (NSSet)rangedExclusionPaths
{
  return self->_rangedExclusionPaths;
}

- (NSMutableArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
}

- (NSCache)tokenizersCache
{
  return self->_tokenizersCache;
}

- (void)setTokenizersCache:(id)a3
{
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizersCache, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_rangedExclusionPaths, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end