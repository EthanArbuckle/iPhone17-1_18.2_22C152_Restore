@interface CRLPdfTagger
+ (BOOL)isHeaderTag:(int)a3;
+ (BOOL)isHeadingStyle:(id)a3 headingIndex:(int *)a4;
+ (BOOL)shouldMapDrawableRep:(id)a3;
+ (unint64_t)indexOfFirstVisibleCharInRange:(_NSRange)a3 ofStorage:(id)a4;
- (BOOL)charIndexIsAtEndOfParagraph:(unint64_t)a3;
- (BOOL)charIndexIsAtStartOfParagraph:(unint64_t)a3;
- (BOOL)currentParagraphHasContents;
- (BOOL)currentParagraphNeedsSpans;
- (BOOL)needsSeparateRunsForLineFragmentWithRange:(_NSRange)a3;
- (BOOL)topOfContextStackIsParagraph;
- (CGContext)cgContext;
- (CRLPdfTagger)init;
- (_NSRange)currentParagraphRange;
- (_NSRange)topmostColumnRange;
- (id)regularDrawableRepForObjectRep:(id)a3;
- (id)retrieveHighestInfoAtCharIndex:(unint64_t)a3 returnTagType:(int *)a4;
- (id)state;
- (id)topOfContextStack;
- (id)topOfContextStackWithExpectedClass:(Class)a3;
- (id)topmostColumn;
- (id)topmostColumnContext;
- (id)topmostContextOfClass:(Class)a3;
- (id)topmostParagraphContext;
- (id)topmostParagraphLevelResolver;
- (id)topmostTextStorage;
- (int)tagTypeAtDepth:(unint64_t)a3;
- (int)topmostTagType;
- (unint64_t)depthOfContext:(id)a3;
- (unint64_t)depthOfTopmostTagOfType:(int)a3;
- (unint64_t)indexOfFirstVisibleCharInParagraphAtOrAfterCharIndex:(unint64_t)a3;
- (unint64_t)tagStackHeight;
- (unint64_t)taggingPreventionDepth;
- (void)advanceParagraphEnumeratorToCharIndex:(unint64_t)a3;
- (void)assertCharIndexRelativeToParagraphRange:(BOOL)a3;
- (void)assertTopOfContextStackIsParagraph:(BOOL)a3;
- (void)beginAncillaryTextRunWithRange:(_NSRange)a3 baseTextRange:(_NSRange)a4;
- (void)beginComment;
- (void)beginDrawable:(id)a3;
- (void)beginFreehandDrawing:(id)a3;
- (void)beginLineFragmentBodyWithRange:(_NSRange)a3;
- (void)beginLineFragmentWithRange:(_NSRange)a3;
- (void)beginListLabel;
- (void)beginMultiParagraphEntityWithLineFragmentRange:(_NSRange)a3;
- (void)beginObject:(id)a3;
- (void)beginPage;
- (void)beginParagraphBodyWithLineFragmentRange:(_NSRange)a3;
- (void)beginParagraphWithLineFragmentRange:(_NSRange)a3;
- (void)beginPrimaryTextRunWithRange:(_NSRange)a3 hasActualContents:(BOOL)a4;
- (void)beginTagWithType:(int)a3;
- (void)beginTagWithType:(int)a3 tagProperties:(id)a4;
- (void)beginTextColumn:(id)a3 limitSelection:(id)a4;
- (void)beginTextStorageChunk:(id)a3 limitSelection:(id)a4;
- (void)dispatchObject:(id)a3 drawableBlock:(id)a4;
- (void)endAncillaryTextRunWithRange:(_NSRange)a3 baseTextRange:(_NSRange)a4;
- (void)endComment;
- (void)endDrawable:(id)a3;
- (void)endFreehandDrawing:(id)a3;
- (void)endLineFragmentBodyWithRange:(_NSRange)a3;
- (void)endLineFragmentWithRange:(_NSRange)a3;
- (void)endListLabel;
- (void)endMultiParagraphEntityWithLineFragmentRange:(_NSRange)a3;
- (void)endObject:(id)a3;
- (void)endPage;
- (void)endParagraphWithLineFragmentRange:(_NSRange)a3;
- (void)endPrimaryTextRunWithRange:(_NSRange)a3 hasActualContents:(BOOL)a4;
- (void)endTag;
- (void)endTextColumn:(id)a3;
- (void)endTextStorageChunk:(id)a3;
- (void)executeBlock:(id)a3;
- (void)handleObject:(id)a3 drawableBlock:(id)a4;
- (void)popContextWithExpectedClass:(Class)a3;
- (void)popTagStackUntilReachingHeight:(unint64_t)a3;
- (void)pushContext:(id)a3;
- (void)restoreStateFromTopOfContextStackWithExpectedClass:(Class)a3;
- (void)setCgContext:(CGContext *)a3;
- (void)setState:(id)a3;
- (void)setTaggingPreventionDepth:(unint64_t)a3;
- (void)setUp;
@end

@implementation CRLPdfTagger

- (CRLPdfTagger)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLPdfTagger;
  v2 = [(CRLPdfTagger *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CRLPdfTagger *)v2 setUp];
  }
  return v3;
}

- (void)setUp
{
  self->_stateIsValid = 1;
  v3 = (NSMutableArray *)objc_opt_new();
  contextStack = self->_contextStack;
  self->_contextStack = v3;

  objc_super v5 = (NSMutableArray *)objc_opt_new();
  tagStack = self->_tagStack;
  self->_tagStack = v5;

  v10 = [[CRLPdfTagInfo alloc] initWithTagType:0 tagProperties:0];
  -[NSMutableArray crl_push:](self->_tagStack, "crl_push:");
  v7 = (NSMutableArray *)objc_opt_new();
  paragraphLevelResolverStack = self->_paragraphLevelResolverStack;
  self->_paragraphLevelResolverStack = v7;

  v9 = [(CRLPdfTaggerParagraphLevelResolver *)[CRLPdfTaggerListParagraphLevelResolver alloc] initWithTagger:self];
  [(NSMutableArray *)self->_paragraphLevelResolverStack crl_push:v9];
}

- (void)executeBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  if (self->_stateIsValid) {
    v4[2]();
  }
}

- (void)pushContext:(id)a3
{
  id v13 = a3;
  id v4 = [(NSMutableArray *)self->_contextStack count];
  id v5 = +[NSString stringWithFormat:@"%@", v13];
  id v6 = [v5 UTF8String];
  sub_100478CA8((uint64_t)v4, (uint64_t)"PUSH %s", v7, v8, v9, v10, v11, v12, (uint64_t)v6);

  [(NSMutableArray *)self->_contextStack crl_push:v13];
}

- (void)popContextWithExpectedClass:(Class)a3
{
  id v21 = [(NSMutableArray *)self->_contextStack crl_peek];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v4 = objc_opt_class();
    sub_100477860(0, (uint64_t)"Class mismatch popping rendering context: %@ instead of %@", v5, v6, v7, v8, v9, v10, v4);
  }
  id v11 = [(NSMutableArray *)self->_contextStack crl_pop];
  id v12 = [(NSMutableArray *)self->_contextStack count];
  id v13 = +[NSString stringWithFormat:@"%@", v21];
  id v14 = [v13 UTF8String];
  sub_100478CA8((uint64_t)v12, (uint64_t)"POP %s", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
}

- (void)beginTagWithType:(int)a3 tagProperties:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  CFDictionaryRef tagProperties = (const __CFDictionary *)a4;
  Name = CGPDFTagTypeGetName((CGPDFTagType)v4);
  id v7 = [(NSMutableArray *)self->_tagStack count];
  sub_100478CA8((uint64_t)v7 - 1, (uint64_t)"BEGIN %s", v8, v9, v10, v11, v12, v13, (uint64_t)Name);
  id v14 = [[CRLPdfTagInfo alloc] initWithTagType:v4 tagProperties:tagProperties];
  [(NSMutableArray *)self->_tagStack crl_push:v14];
  if (![(CRLPdfTagger *)self taggingPreventionDepth]) {
    CGPDFContextBeginTag(self->_cgContext, (CGPDFTagType)v4, tagProperties);
  }
}

- (void)beginTagWithType:(int)a3
{
}

- (void)endTag
{
  id v20 = [(NSMutableArray *)self->_tagStack crl_peek];
  CGPDFTagType v3 = [v20 tagType];
  if (![(CRLPdfTagger *)self taggingPreventionDepth]) {
    CGPDFContextEndTag(self->_cgContext);
  }
  id v4 = [(NSMutableArray *)self->_tagStack crl_pop];
  Name = CGPDFTagTypeGetName(v3);
  if ([(NSMutableArray *)self->_tagStack count])
  {
    id v12 = [(NSMutableArray *)self->_tagStack count];
    sub_100478CA8((uint64_t)v12 - 1, (uint64_t)"END %s", v13, v14, v15, v16, v17, v18, (uint64_t)Name);
  }
  else
  {
    sub_100477860(0, (uint64_t)"the tagStack count was 0 and we were trying to endTag", v6, v7, v8, v9, v10, v11, v19);
  }
}

- (unint64_t)tagStackHeight
{
  return (unint64_t)[(NSMutableArray *)self->_tagStack count];
}

- (void)popTagStackUntilReachingHeight:(unint64_t)a3
{
  char v5 = (unint64_t)[(NSMutableArray *)self->_tagStack count] >= a3;
  id v6 = [(NSMutableArray *)self->_tagStack count];
  sub_100477860(v5, (uint64_t)"Tag stack %d less than desired value %d", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  while ((unint64_t)[(NSMutableArray *)self->_tagStack count] > a3)
    [(CRLPdfTagger *)self endTag];
}

- (id)topmostContextOfClass:(Class)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  CGPDFTagType v3 = [(NSMutableArray *)self->_contextStack reverseObjectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          id v8 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v8 = 0;
LABEL_11:

  return v8;
}

- (unint64_t)depthOfContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_contextStack indexOfObjectIdenticalTo:v4];
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_contextStack count] + ~v5;
  }

  return v6;
}

- (int)tagTypeAtDepth:(unint64_t)a3
{
  id v4 = self;
  char v5 = (unint64_t)[(NSMutableArray *)self->_tagStack count] > a3;
  [(NSMutableArray *)v4->_tagStack count];
  sub_100477860(v5, (uint64_t)"Tag depth %d exceeds tag stack height %d", v6, v7, v8, v9, v10, v11, a3);
  long long v12 = [(NSMutableArray *)v4->_tagStack objectAtIndexedSubscript:(char *)[(NSMutableArray *)v4->_tagStack count] + ~a3];
  LODWORD(v4) = [v12 tagType];

  return (int)v4;
}

- (int)topmostTagType
{
  return [(CRLPdfTagger *)self tagTypeAtDepth:0];
}

- (unint64_t)depthOfTopmostTagOfType:(int)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NSMutableArray *)self->_tagStack reverseObjectEnumerator];
  char v5 = (char *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0;
      uint64_t v9 = &v5[(void)v6];
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) tagType] == a3)
        {
          unint64_t v10 = (unint64_t)&v8[(void)v6];
          goto LABEL_11;
        }
        ++v8;
      }
      while (v5 != v8);
      char v5 = (char *)[v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v6 = v9;
      if (v5) {
        continue;
      }
      break;
    }
  }
  unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v10;
}

- (id)state
{
  v2 = [[CRLPdfTaggerState alloc] initWithTagStackHeight:[(CRLPdfTagger *)self tagStackHeight]];

  return v2;
}

- (void)setState:(id)a3
{
  id v4 = a3;
  -[CRLPdfTagger popTagStackUntilReachingHeight:](self, "popTagStackUntilReachingHeight:", [v4 tagStackHeight]);
}

- (id)topOfContextStack
{
  return [(NSMutableArray *)self->_contextStack crl_peek];
}

- (id)topOfContextStackWithExpectedClass:(Class)a3
{
  id v4 = [(NSMutableArray *)self->_contextStack crl_peek];
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v6 = NSStringFromClass(a3);
  uint64_t v7 = (objc_class *)objc_opt_class();
  long long v15 = NSStringFromClass(v7);
  sub_100477860(isKindOfClass & 1, (uint64_t)"Incorrect top context class: expected %@, actual %@", v8, v9, v10, v11, v12, v13, (uint64_t)v6);

  return v4;
}

- (void)restoreStateFromTopOfContextStackWithExpectedClass:(Class)a3
{
  char v5 = [(objc_class *)a3 isSubclassOfClass:objc_opt_class()];
  sub_100477860(v5, (uint64_t)"Unexpected class hierarchy", v6, v7, v8, v9, v10, v11, v13);
  id v14 = [(CRLPdfTagger *)self topOfContextStackWithExpectedClass:a3];
  uint64_t v12 = [v14 taggerState];
  [(CRLPdfTagger *)self setState:v12];

  [(CRLPdfTagger *)self popContextWithExpectedClass:a3];
}

- (id)topmostColumnContext
{
  uint64_t v3 = objc_opt_class();

  return [(CRLPdfTagger *)self topmostContextOfClass:v3];
}

- (id)topmostParagraphContext
{
  uint64_t v3 = objc_opt_class();

  return [(CRLPdfTagger *)self topmostContextOfClass:v3];
}

- (id)topmostColumn
{
  v2 = [(CRLPdfTagger *)self topmostColumnContext];
  uint64_t v3 = [v2 column];

  return v3;
}

- (id)topmostTextStorage
{
  v2 = [(CRLPdfTagger *)self topmostColumn];
  uint64_t v3 = [v2 storage];

  return v3;
}

- (_NSRange)topmostColumnRange
{
  v2 = [(CRLPdfTagger *)self topmostColumnContext];
  id v3 = [v2 range];
  NSUInteger v5 = v4;

  NSUInteger v6 = (NSUInteger)v3;
  NSUInteger v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)topmostParagraphLevelResolver
{
  return [(NSMutableArray *)self->_paragraphLevelResolverStack crl_peek];
}

- (void)beginPage
{
  if (!self->_stateIsValid) {
    [(CRLPdfTagger *)self setUp];
  }
}

- (void)endPage
{
}

- (void)beginTextStorageChunk:(id)a3 limitSelection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100479A10;
  v7[3] = &unk_1014FC9C0;
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(CRLPdfTagger *)v8 executeBlock:v7];
}

- (void)endTextStorageChunk:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100479D50;
  v3[3] = &unk_1014D0800;
  v3[4] = self;
  [(CRLPdfTagger *)self executeBlock:v3];
}

- (void)beginTextColumn:(id)a3 limitSelection:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100479E78;
  v7[3] = &unk_1014FC9C0;
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(CRLPdfTagger *)v8 executeBlock:v7];
}

- (void)endTextColumn:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100479F60;
  v3[3] = &unk_1014D0800;
  v3[4] = self;
  [(CRLPdfTagger *)self executeBlock:v3];
}

- (BOOL)topOfContextStackIsParagraph
{
  v2 = [(NSMutableArray *)self->_contextStack crl_peek];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)assertTopOfContextStackIsParagraph:(BOOL)a3
{
  if ([(CRLPdfTagger *)self topOfContextStackIsParagraph] != a3)
  {
    sub_100477860(0, (uint64_t)"Incorrect paragraph rendering context life span", v3, v4, v5, v6, v7, v8, v10);
  }
}

+ (unint64_t)indexOfFirstVisibleCharInRange:(_NSRange)a3 ofStorage:(id)a4
{
  return a3.location;
}

- (void)beginMultiParagraphEntityWithLineFragmentRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [(CRLPdfTagger *)self topmostParagraphLevelResolver];
  uint64_t v7 = [(CRLPdfTagger *)self topmostColumnContext];
  id v8 = [v7 paragraphEnumerator];
  id v16 = sub_100189F3C((uint64_t)v8);
  char v18 = (unint64_t)v16 <= location && (unint64_t)v16 + v9 >= location + length;
  sub_100477860(v18, (uint64_t)"Line fragment not within current paragraph", v10, v11, v12, v13, v14, v15, v31);
  id v35 = 0;
  id v19 = [v6 levelOfCurrentParagraph:&v35];
  id v33 = v35;
  if ((v19 & 0x80000000) != 0) {
    goto LABEL_17;
  }
  v32 = v7;
  id v20 = [(CRLPdfTagger *)self topmostColumnRange];
  uint64_t v22 = v21;
  v23 = objc_opt_class();
  v24 = [v7 column];
  v25 = [v24 storage];
  id v26 = [v23 indexOfFirstVisibleCharInRange:v20 ofStorage:v22];

  if (v26 >= v16)
  {
    id v28 = 0;
    int v27 = -1;
  }
  else
  {
    id v34 = 0;
    int v27 = [v6 levelOfCurrentParagraph:&v34 sub_100189DFC((uint64_t)v8)];
    id v28 = v34;
    double v29 = sub_100189E20((uint64_t)v8);
    if ((int)v19 <= v27)
    {
      if (v19 != v27)
      {

        uint64_t v7 = v32;
        goto LABEL_17;
      }
      signed int v30 = [v6 paragraphInfo:v28 matchesParagraphInfo:v33 level:v19] ^ 1;
      uint64_t v7 = v32;
      goto LABEL_15;
    }
  }
  uint64_t v7 = v32;
  signed int v30 = v19 - v27;
LABEL_15:

  if (v30 >= 1)
  {
    do
    {
      -[CRLPdfTagger beginTagWithType:](self, "beginTagWithType:", [v6 tagType]);
      --v30;
    }
    while (v30);
  }
LABEL_17:
}

- (void)endMultiParagraphEntityWithLineFragmentRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v6 = [(CRLPdfTagger *)self topmostParagraphLevelResolver];
  uint64_t v7 = [(CRLPdfTagger *)self topmostColumnContext];
  id v8 = [v7 paragraphEnumerator];
  uint64_t v9 = (char *)sub_100189F3C((uint64_t)v8);
  uint64_t v17 = &v9[v16];
  char v19 = (unint64_t)v9 <= location && (unint64_t)v17 >= location + length;
  sub_100477860(v19, (uint64_t)"Line fragment not within current paragraph", v10, v11, v12, v13, v14, v15, v32);
  id v35 = 0;
  id v20 = [v6 levelOfCurrentParagraph:&v35];
  id v33 = v35;
  if ((v20 & 0x80000000) != 0) {
    goto LABEL_14;
  }
  uint64_t v21 = (char *)[(CRLPdfTagger *)self topmostColumnRange];
  v23 = (char *)(&v21[v22] - v17);
  if (&v21[v22] <= v17) {
    goto LABEL_10;
  }
  v24 = objc_opt_class();
  v25 = [v7 column];
  id v26 = [v25 storage];
  id v27 = [v24 indexOfFirstVisibleCharInRange:v17 ofStorage:v23];

  if (v27 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    id v28 = 0;
    int v29 = -1;
  }
  else
  {
    id v34 = 0;
    int v29 = [v6 levelOfCurrentParagraph:&v34 sub_100189E20((uint64_t)v8)];
    id v28 = v34;
    double v31 = sub_100189DFC((uint64_t)v8);
    if ((int)v20 <= v29)
    {
      if (v20 != v29)
      {

        goto LABEL_14;
      }
      signed int v30 = [v6 paragraphInfo:v33 matchesParagraphInfo:v28 level:v20] ^ 1;
      goto LABEL_12;
    }
  }
  signed int v30 = v20 - v29;
LABEL_12:

  if (v30 >= 1)
  {
    do
    {
      [(CRLPdfTagger *)self endTag];
      --v30;
    }
    while (v30);
  }
LABEL_14:
}

+ (BOOL)isHeadingStyle:(id)a3 headingIndex:(int *)a4
{
  unsigned int v5 = [a3 intValueForProperty:41];
  if (a4 && v5 <= 6) {
    *a4 = v5;
  }
  return v5 < 7;
}

+ (BOOL)isHeaderTag:(int)a3
{
  return (a3 - 201) < 7;
}

- (BOOL)currentParagraphNeedsSpans
{
  v2 = [(CRLPdfTagger *)self topmostColumnContext];
  uint64_t v3 = [v2 column];
  uint64_t v4 = [v3 storage];
  id v5 = sub_100189F3C((uint64_t)[v2 paragraphEnumerator]);
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  char v11 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10047A688;
  v9[3] = &unk_1014FC9E8;
  v9[4] = &v12;
  v9[5] = v10;
  [v4 enumerateSmartFieldsWithAttributeKind:6 inRange:v5 usingBlock:v6];
  char v7 = *((unsigned char *)v13 + 24);
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)currentParagraphHasContents
{
  v2 = [(CRLPdfTagger *)self topmostColumnContext];
  uint64_t v3 = [v2 column];
  uint64_t v4 = [v3 storage];
  id v5 = (char *)sub_100189F3C((uint64_t)[v2 paragraphEnumerator]);
  char v7 = v5;
  uint64_t v8 = v6;
  if (v6) {
    uint64_t v8 = v6 - sub_1001CA284((uint64_t)[v4 characterAtIndex:&v5[v6 - 1]]);
  }
  uint64_t v9 = (char *)[objc_opt_class() indexOfFirstVisibleCharInRange:v7 ofStorage:v8];
  BOOL v11 = v9 != (char *)0x7FFFFFFFFFFFFFFFLL && v9 < &v7[v8];

  return v11;
}

- (void)beginParagraphWithLineFragmentRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(CRLPdfTagger *)self assertTopOfContextStackIsParagraph:0];
  -[CRLPdfTagger beginMultiParagraphEntityWithLineFragmentRange:](self, "beginMultiParagraphEntityWithLineFragmentRange:", location, length);
  uint64_t v6 = [[CRLPdfTaggerParagraphContext alloc] initWithStateOfTagger:self needsSpans:[(CRLPdfTagger *)self currentParagraphNeedsSpans]];
  [(CRLPdfTagger *)self pushContext:v6];
  char v7 = [(CRLPdfTagger *)self topmostColumnContext];
  id v8 = [v7 paragraphEnumerator];
  uint64_t v9 = sub_100189EA4((uint64_t)v8, 0);
  uint64_t v10 = sub_10018A008((uint64_t)v8);
  id v11 = [v10 labelTypeForLevel:sub_100189FF8((uint64_t)v8)];
  int v17 = 0;
  unsigned int v12 = +[CRLPdfTagger isHeadingStyle:v9 headingIndex:&v17];
  if (v12) {
    unsigned int v13 = dword_101178B58[v17];
  }
  else {
    unsigned int v13 = 0;
  }
  if (v11) {
    BOOL v14 = v13 == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14) {
    unsigned int v13 = 301;
  }
  if (v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = 200;
  }
  if (v13) {
    int v16 = v12;
  }
  else {
    int v16 = 1;
  }
  if (v16 != 1 || [(CRLPdfTagger *)self currentParagraphHasContents]) {
    [(CRLPdfTagger *)self beginTagWithType:v15];
  }
}

- (void)endParagraphWithLineFragmentRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  [(CRLPdfTagger *)self restoreStateFromTopOfContextStackWithExpectedClass:objc_opt_class()];

  -[CRLPdfTagger endMultiParagraphEntityWithLineFragmentRange:](self, "endMultiParagraphEntityWithLineFragmentRange:", location, length);
}

- (void)beginParagraphBodyWithLineFragmentRange:(_NSRange)a3
{
  if ([(CRLPdfTagger *)self topmostTagType] == 301)
  {
    [(CRLPdfTagger *)self beginTagWithType:303];
  }
}

- (void)assertCharIndexRelativeToParagraphRange:(BOOL)a3
{
  if (!a3) {
    sub_100477860(0, (uint64_t)"Char index not in paragraph range", a3, v3, v4, v5, v6, v7, v8);
  }
}

- (void)advanceParagraphEnumeratorToCharIndex:(unint64_t)a3
{
  id v7 = [(CRLPdfTagger *)self topmostColumnContext];
  for (id i = [v7 paragraphEnumerator]; ; sub_100189E20((uint64_t)i))
  {
    id v5 = sub_100189F3C((uint64_t)i);
    if ((unint64_t)v5 + v6 > a3) {
      break;
    }
  }
}

- (_NSRange)currentParagraphRange
{
  id v3 = [(CRLPdfTagger *)self topmostColumnRange];
  NSUInteger v5 = v4;
  uint64_t v6 = [(CRLPdfTagger *)self topmostColumnContext];
  v10.NSUInteger location = (NSUInteger)sub_100189F3C((uint64_t)[v6 paragraphEnumerator]);
  v12.NSUInteger location = (NSUInteger)v3;
  v12.NSUInteger length = v5;
  NSRange v7 = NSIntersectionRange(v10, v12);

  NSUInteger location = v7.location;
  NSUInteger length = v7.length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (BOOL)charIndexIsAtStartOfParagraph:(unint64_t)a3
{
  return [(CRLPdfTagger *)self currentParagraphRange] == (id)a3;
}

- (BOOL)charIndexIsAtEndOfParagraph:(unint64_t)a3
{
  NSUInteger v4 = (char *)[(CRLPdfTagger *)self currentParagraphRange];
  return &v4[v5] == (char *)a3;
}

- (unint64_t)indexOfFirstVisibleCharInParagraphAtOrAfterCharIndex:(unint64_t)a3
{
  id v4 = [(CRLPdfTagger *)self currentParagraphRange];
  if (a3 - (unint64_t)v4 < v5 && a3 >= (unint64_t)v4) {
    return a3;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)beginLineFragmentWithRange:(_NSRange)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10047AC9C;
  v3[3] = &unk_1014FCA10;
  _NSRange v4 = a3;
  v3[4] = self;
  [(CRLPdfTagger *)self executeBlock:v3];
}

- (void)endLineFragmentWithRange:(_NSRange)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10047AD80;
  v3[3] = &unk_1014FCA10;
  _NSRange v4 = a3;
  v3[4] = self;
  [(CRLPdfTagger *)self executeBlock:v3];
}

- (void)beginListLabel
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10047AE5C;
  v2[3] = &unk_1014D0800;
  v2[4] = self;
  [(CRLPdfTagger *)self executeBlock:v2];
}

- (void)endListLabel
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10047AF6C;
  v2[3] = &unk_1014D0800;
  v2[4] = self;
  [(CRLPdfTagger *)self executeBlock:v2];
}

- (void)beginLineFragmentBodyWithRange:(_NSRange)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10047B024;
  v3[3] = &unk_1014FCA10;
  _NSRange v4 = a3;
  v3[4] = self;
  [(CRLPdfTagger *)self executeBlock:v3];
}

- (void)endLineFragmentBodyWithRange:(_NSRange)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10047B144;
  v3[3] = &unk_1014FCA10;
  _NSRange v4 = a3;
  v3[4] = self;
  [(CRLPdfTagger *)self executeBlock:v3];
}

- (BOOL)needsSeparateRunsForLineFragmentWithRange:(_NSRange)a3
{
  return 1;
}

- (id)retrieveHighestInfoAtCharIndex:(unint64_t)a3 returnTagType:(int *)a4
{
  uint64_t v6 = [(CRLPdfTagger *)self topmostTextStorage];
  NSRange v7 = v6;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [v6 smartFieldAtCharIndex:a3 attributeKind:6 effectiveRange:0];
    uint64_t v10 = objc_opt_class();
    uint64_t v8 = sub_1002469D0(v10, v9);

    if (v8) {
      *a4 = 506;
    }
  }

  return v8;
}

- (void)beginPrimaryTextRunWithRange:(_NSRange)a3 hasActualContents:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10047B308;
  v4[3] = &unk_1014FCA38;
  v4[4] = self;
  _NSRange v5 = a3;
  BOOL v6 = a4;
  [(CRLPdfTagger *)self executeBlock:v4];
}

- (void)endPrimaryTextRunWithRange:(_NSRange)a3 hasActualContents:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10047B45C;
  v4[3] = &unk_1014D0800;
  v4[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v4, a3.length, a4);
}

- (void)beginAncillaryTextRunWithRange:(_NSRange)a3 baseTextRange:(_NSRange)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10047B518;
  v4[3] = &unk_1014FCA60;
  v4[4] = self;
  _NSRange v5 = a3;
  _NSRange v6 = a4;
  [(CRLPdfTagger *)self executeBlock:v4];
}

- (void)endAncillaryTextRunWithRange:(_NSRange)a3 baseTextRange:(_NSRange)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10047B640;
  v4[3] = &unk_1014D0800;
  v4[4] = self;
  -[CRLPdfTagger executeBlock:](self, "executeBlock:", v4, a3.length, a4.location, a4.length);
}

- (void)dispatchObject:(id)a3 drawableBlock:(id)a4
{
  id v9 = a3;
  _NSRange v5 = (void (**)(id, id))a4;
  uint64_t v6 = objc_opt_class();
  NSRange v7 = [v9 info];
  uint64_t v8 = sub_1002469D0(v6, v7);

  if (v5 && v8) {
    v5[2](v5, v9);
  }
}

- (void)handleObject:(id)a3 drawableBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10047B85C;
  v7[3] = &unk_1014FCA88;
  uint64_t v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(CRLPdfTagger *)v8 executeBlock:v7];
}

- (id)regularDrawableRepForObjectRep:(id)a3
{
  uint64_t v6 = 0;
  NSRange v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10047B974;
  id v10 = sub_10047B984;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10047B98C;
  v5[3] = &unk_1014FCAB0;
  v5[4] = &v6;
  [(CRLPdfTagger *)self dispatchObject:a3 drawableBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

+ (BOOL)shouldMapDrawableRep:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  id v5 = [v3 info];
  uint64_t v6 = sub_1002469D0(v4, v5);

  uint64_t v7 = objc_opt_class();
  uint64_t v8 = sub_1002469D0(v7, v6);
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v6 == 0;
  }
  char v10 = !v9;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v12 = isKindOfClass | v10;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = objc_opt_class();
    BOOL v14 = [v3 info];
    uint64_t v15 = sub_1002469D0(v13, v14);

    int v16 = [v15 accessibilityDescription];
    v12 |= [v16 length] != 0;
  }
  return v12 & 1;
}

- (void)beginObject:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10047BBB0;
  v3[3] = &unk_1014FCAD8;
  v3[4] = self;
  [(CRLPdfTagger *)self handleObject:a3 drawableBlock:v3];
}

- (void)endObject:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10047BC98;
  v3[3] = &unk_1014FCAD8;
  v3[4] = self;
  [(CRLPdfTagger *)self handleObject:a3 drawableBlock:v3];
}

- (void)beginDrawable:(id)a3
{
  id v4 = a3;
  id v5 = [[CRLPdfTaggerDrawableContext alloc] initWithStateOfTagger:self drawableRep:v4];
  [(CRLPdfTagger *)self pushContext:v5];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [v4 info];
  uint64_t v8 = sub_1002469D0(v6, v7);

  BOOL v9 = [v8 accessibilityDescription];
  if ([v9 length])
  {
    CGPDFTagProperty v20 = kCGPDFTagPropertyAlternativeText;
    uint64_t v21 = v9;
    char v10 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  }
  else
  {
    char v10 = 0;
  }
  id v11 = [(CRLPdfTagger *)self state];
  [(CRLPdfTaggerDrawableContext *)v5 setTaggerStateOutsideCore:v11];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(CRLPdfTagger *)self beginTagWithType:700 tagProperties:v10];
  }
  else
  {
    char v12 = +[NSString stringWithFormat:@"%@", objc_opt_class()];
    if (([&off_10155CF38 containsObject:v12] & 1) == 0)
    {
      int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FCAF8);
      }
      BOOL v14 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B77AC((uint64_t)v12, v13, v14);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FCB18);
      }
      uint64_t v15 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      {
        int v16 = +[CRLAssertionHandler packedBacktraceString];
        sub_10106CDAC(v16, buf, v13, (os_log_t)v15);
      }

      int v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLPdfTagger beginDrawable:]");
      char v18 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLPdfTagger.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v17, v18, 1488, 0, "Drawable of class %@ not handled", v12 file lineNumber isFatal description];
    }
  }
}

- (void)endDrawable:(id)a3
{
  uint64_t v4 = objc_opt_class();

  [(CRLPdfTagger *)self restoreStateFromTopOfContextStackWithExpectedClass:v4];
}

- (void)beginFreehandDrawing:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10047C2EC;
  v4[3] = &unk_1014ECF00;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CRLPdfTagger *)v5 executeBlock:v4];
}

- (void)endFreehandDrawing:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10047C3A4;
  v4[3] = &unk_1014ECF00;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(CRLPdfTagger *)v5 executeBlock:v4];
}

- (void)beginComment
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10047C420;
  v2[3] = &unk_1014D0800;
  v2[4] = self;
  [(CRLPdfTagger *)self executeBlock:v2];
}

- (void)endComment
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10047C510;
  v2[3] = &unk_1014D0800;
  v2[4] = self;
  [(CRLPdfTagger *)self executeBlock:v2];
}

- (CGContext)cgContext
{
  return self->_cgContext;
}

- (void)setCgContext:(CGContext *)a3
{
  self->_cgContext = a3;
}

- (unint64_t)taggingPreventionDepth
{
  return self->_taggingPreventionDepth;
}

- (void)setTaggingPreventionDepth:(unint64_t)a3
{
  self->_taggingPreventionDepth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paragraphLevelResolverStack, 0);
  objc_storeStrong((id *)&self->_tagStack, 0);

  objc_storeStrong((id *)&self->_contextStack, 0);
}

@end