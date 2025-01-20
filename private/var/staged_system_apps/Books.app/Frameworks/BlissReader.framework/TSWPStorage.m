@interface TSWPStorage
- (id)initTemporaryWithContext:(id)a3 storage:(id)a4 range:(_NSRange)a5;
- (id)initTemporaryWithContext:(id)a3 string:(id)a4;
- (unsigned)wordCountOfRange:(_NSRange)a3;
- (void)modifyEachListStyleWithBlock:(id)a3;
- (void)p_modifyEachCharacterStyleWithBlock:(id)a3;
- (void)p_modifyEachListStyleWithBlock:(id)a3;
- (void)p_modifyEachParagraphStyleWithBlock:(id)a3;
- (void)p_removeBackgroundFillFromStyle:(id)a3;
- (void)removeAllCharacterStyles;
- (void)removeSmartFields;
- (void)replaceListLabelTypeNumberWithBullet;
- (void)setFontFamily:(id)a3 fontSize:(double)a4 textColor:(id)a5;
- (void)setFontFamily:(id)a3 fontSize:(double)a4 textColor:(id)a5 alignment:(unsigned int)a6 removeBackgroundFill:(BOOL)a7 removeIndent:(BOOL)a8;
- (void)setFontFamily:(id)a3 fontSize:(double)a4 textColor:(id)a5 underlineColor:(id)a6 underlineWidth:(double)a7 lineSpacing:(id)a8 characterSpacing:(double)a9 alignment:(unsigned int)a10 stripOtherAttributes:(BOOL)a11;
- (void)setFontFamily:(id)a3 textColor:(id)a4;
@end

@implementation TSWPStorage

- (unsigned)wordCountOfRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CFStringRef v5 = (const __CFString *)[(TSWPStorage *)self string];
  v10.NSUInteger location = location;
  v10.NSUInteger length = length;
  CFStringTokenizerRef v6 = CFStringTokenizerCreate(0, v5, v10, 0, 0);
  if (!v6) {
    return 0;
  }
  v7 = v6;
  unsigned int v8 = -1;
  do
    ++v8;
  while (CFStringTokenizerAdvanceToNextToken(v7));
  CFRelease(v7);
  return v8;
}

- (id)initTemporaryWithContext:(id)a3 storage:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v9 = +[THTemporaryObjectContext temporaryContextForDocumentContext:a3];
  id v10 = [a4 newSubstorageWithRange:location storageContext:v9 objectsContext:v9 flags:1];
  if (v10)
  {
    v11 = v10;
    [(TSWPStorage *)self dealloc];
    return v11;
  }
  return self;
}

- (id)initTemporaryWithContext:(id)a3 string:(id)a4
{
  id v5 = +[THTemporaryObjectContext temporaryContextForDocumentContext:a3];
  id v6 = [objc_alloc((Class)TSSStylesheet) initWithContext:v5];
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithContext:v5 string:a4 kind:3 stylesheet:v6 paragraphStyle:[TSWPParagraphStyle defaultStyleWithContext:v5] listStyle:[TSWPListStyle defaultStyleWithContext:v5] section:0 columnStyle:0];

  return v7;
}

- (void)setFontFamily:(id)a3 textColor:(id)a4
{
  if (!a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:textColor:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm") lineNumber:71 description:@"invalid nil value for '%s'", "fontFamily"];
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:@"-[TSWPStorage(THAdditions) setFontFamily:textColor:]"] file:[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm"] lineNumber:72 description:@"invalid nil value for '%s'", "textColor"];
    goto LABEL_3;
  }
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1C30B8;
  v8[3] = &unk_45AAD0;
  v8[4] = a3;
  v8[5] = a4;
  [(TSWPStorage *)self p_modifyEachCharacterStyleWithBlock:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1C3108;
  v7[3] = &unk_45AAF8;
  v7[4] = a3;
  v7[5] = a4;
  [(TSWPStorage *)self p_modifyEachParagraphStyleWithBlock:v7];
}

- (void)setFontFamily:(id)a3 fontSize:(double)a4 textColor:(id)a5
{
  if (!a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm") lineNumber:87 description:@"invalid nil value for '%s'", "fontFamily"];
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm") lineNumber:88 description:@"invalid nil value for '%s'", "textColor"];
    goto LABEL_3;
  }
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1C331C;
  v10[3] = &unk_45AB20;
  *(double *)&v10[6] = a4;
  v10[4] = a3;
  v10[5] = a5;
  [(TSWPStorage *)self p_modifyEachCharacterStyleWithBlock:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1C337C;
  v9[3] = &unk_45AB48;
  *(double *)&v9[6] = a4;
  v9[4] = a3;
  v9[5] = a5;
  [(TSWPStorage *)self p_modifyEachParagraphStyleWithBlock:v9];
}

- (void)setFontFamily:(id)a3 fontSize:(double)a4 textColor:(id)a5 alignment:(unsigned int)a6 removeBackgroundFill:(BOOL)a7 removeIndent:(BOOL)a8
{
  if (!a3)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:alignment:removeBackgroundFill:removeIndent:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm") lineNumber:105 description:@"invalid nil value for '%s'", "fontFamily"];
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:alignment:removeBackgroundFill:removeIndent:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm") lineNumber:106 description:@"invalid nil value for '%s'", "textColor"];
    goto LABEL_3;
  }
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1C35D4;
  v19[3] = &unk_45AB70;
  *(double *)&v19[7] = a4;
  v19[4] = a3;
  v19[5] = a5;
  BOOL v20 = a7;
  v19[6] = self;
  [(TSWPStorage *)self p_modifyEachCharacterStyleWithBlock:v19];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1C3654;
  v15[3] = &unk_45AB98;
  *(double *)&v15[7] = a4;
  v15[4] = a3;
  v15[5] = a5;
  unsigned int v16 = a6;
  BOOL v17 = a7;
  v15[6] = self;
  BOOL v18 = a8;
  [(TSWPStorage *)self p_modifyEachParagraphStyleWithBlock:v15];
}

- (void)setFontFamily:(id)a3 fontSize:(double)a4 textColor:(id)a5 underlineColor:(id)a6 underlineWidth:(double)a7 lineSpacing:(id)a8 characterSpacing:(double)a9 alignment:(unsigned int)a10 stripOtherAttributes:(BOOL)a11
{
  uint64_t v12 = *(void *)&a10;
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
LABEL_22:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm") lineNumber:153 description:@"invalid nil value for '%s'", "textColor"];
    if (a11) {
      goto LABEL_4;
    }
    goto LABEL_23;
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:underlineColor:underlineWidth:lineSpacing:characterSpacing:alignment:stripOtherAttributes:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm") lineNumber:152 description:@"invalid nil value for '%s'", "fontFamily"];
  if (!a5) {
    goto LABEL_22;
  }
LABEL_3:
  if (a11)
  {
LABEL_4:
    id v21 = +[TSWPParagraphStyle defaultStyleWithContext:[(TSWPStorage *)self context]];
    v23 = v21;
    if (a3) {
      [v21 setValue:a3 forProperty:16];
    }
    if (a4 != 0.0) {
      [v23 setCGFloatValue:17 forProperty:a4];
    }
    if (a5) {
      [v23 setValue:a5 forProperty:18];
    }
    if (a6)
    {
      [v23 setIntValue:1 forProperty:22];
      [v23 setValue:a6 forProperty:24];
    }
    if (a7 != 0.0)
    {
      *(float *)&double v22 = a7;
      [v23 setFloatValue:23 forProperty:v22];
    }
    if (a8) {
      [v23 setValue:a8 forProperty:85];
    }
    if (a9 != 0.0)
    {
      *(float *)&double v22 = a9;
      [v23 setFloatValue:35 forProperty:v22];
    }
    [v23 setIntValue:v12 forProperty:86];
    id v24 = [(TSWPStorage *)self range];
    -[TSWPStorage setParagraphStyle:forCharRange:undoTransaction:](self, "setParagraphStyle:forCharRange:undoTransaction:", v23, v24, v25, 0);
    id v27 = [(TSWPStorage *)self range];
    -[TSWPStorage setCharacterStyle:range:undoTransaction:](self, "setCharacterStyle:range:undoTransaction:", 0, v27, v26, 0);
    return;
  }
LABEL_23:

  [(TSWPStorage *)self setFontFamily:a3 fontSize:a5 textColor:a4];
}

- (void)removeSmartFields
{
  [(TSWPStorage *)self addDisallowedElementKind:802304];

  [(TSWPStorage *)self filterInvalidContentForStorage:self undoTransaction:0];
}

- (void)modifyEachListStyleWithBlock:(id)a3
{
}

- (void)removeAllCharacterStyles
{
  id v4 = [(TSWPStorage *)self range];

  -[TSWPStorage setCharacterStyle:range:undoTransaction:](self, "setCharacterStyle:range:undoTransaction:", 0, v4, v3, 0);
}

- (void)replaceListLabelTypeNumberWithBullet
{
}

- (void)p_modifyEachCharacterStyleWithBlock:(id)a3
{
  [(TSWPStorage *)self range];
  TSWPAttributeEnumerator::TSWPAttributeEnumerator();
  while (1)
  {
    uint64_t v5 = TSWPAttributeEnumerator::nextAttributeIndex((TSWPAttributeEnumerator *)v9, &v8);
    if (!v5) {
      break;
    }
    id v6 = *(void **)(v5 + 8);
    if (v6)
    {
      id v7 = [v6 copyWithContext:[self context]];
      (*((void (**)(id, id))a3 + 2))(a3, v7);
      -[TSWPStorage setCharacterStyle:range:undoTransaction:](self, "setCharacterStyle:range:undoTransaction:", v7, v8.location, v8.length, 0);
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v9);
}

- (void)p_modifyEachParagraphStyleWithBlock:(id)a3
{
  [(TSWPStorage *)self range];
  TSWPAttributeEnumerator::TSWPAttributeEnumerator();
  while (1)
  {
    uint64_t v5 = TSWPAttributeEnumerator::nextAttributeIndex((TSWPAttributeEnumerator *)v11, &v10);
    if (!v5) {
      break;
    }
    id v6 = *(void **)(v5 + 8);
    if (v6)
    {
      id v7 = [v6 copyWithContext:[self context]];
      (*((void (**)(id, id))a3 + 2))(a3, v7);
      id v8 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", v10.location, v10.length);
      -[TSWPStorage applyObject:toParagraphIndexRange:forKind:undoTransaction:](self, "applyObject:toParagraphIndexRange:forKind:undoTransaction:", v7, v8, v9, 0, 0);
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v11);
}

- (void)p_modifyEachListStyleWithBlock:(id)a3
{
  [(TSWPStorage *)self range];
  TSWPAttributeEnumerator::TSWPAttributeEnumerator();
  while (1)
  {
    uint64_t v5 = TSWPAttributeEnumerator::nextAttributeIndex((TSWPAttributeEnumerator *)v11, &v10);
    if (!v5) {
      break;
    }
    id v6 = *(void **)(v5 + 8);
    if (v6)
    {
      id v7 = [v6 copyWithContext:[self context]];
      (*((void (**)(id, id))a3 + 2))(a3, v7);
      id v8 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", v10.location, v10.length);
      -[TSWPStorage applyObject:toParagraphIndexRange:forKind:undoTransaction:](self, "applyObject:toParagraphIndexRange:forKind:undoTransaction:", v7, v8, v9, 2, 0);
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v11);
}

- (void)p_removeBackgroundFillFromStyle:(id)a3
{
  id v4 = (NSNull *)[a3 valueForProperty:37];
  if (v4 && v4 != +[NSNull null]) {
    [a3 setValue:[NSNull null] forProperty:37];
  }
  uint64_t v5 = (NSNull *)[a3 valueForProperty:98];
  if (v5 && v5 != +[NSNull null])
  {
    id v6 = +[NSNull null];
    [a3 setValue:v6 forProperty:98];
  }
}

@end