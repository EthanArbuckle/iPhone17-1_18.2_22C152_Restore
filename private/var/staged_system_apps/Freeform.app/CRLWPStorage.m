@interface CRLWPStorage
- (BOOL)adjustRangesByDelta:(int64_t)a3 startingAt:(int64_t)a4;
- (BOOL)allowsTypographicalFractions;
- (BOOL)canUserReplaceText;
- (BOOL)hasColumnBreakAtCharIndex:(int64_t)a3;
- (BOOL)hasMarkedText;
- (BOOL)hasSmartFields;
- (BOOL)hasSmartFieldsInRange:(_NSRange)a3;
- (BOOL)hasVisibleContent;
- (BOOL)isAllWhitespaceInRange:(_NSRange)a3;
- (BOOL)isEmptyParagraphAtIndex:(int64_t)a3;
- (BOOL)isEmptyParagraphAtSelection:(id)a3;
- (BOOL)isSelectable;
- (BOOL)isSupported;
- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(int64_t)a3;
- (BOOL)isWritingDirectionRightToLeftForParagraphAtParIndex:(int64_t)a3;
- (CRLCanvasElementInfo)parentInfo;
- (CRLCanvasInfoGeometry)geometry;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSAttributedString)attributedMarkedText;
- (NSAttributedString)coreTextAttributedString;
- (NSDictionary)markedTextStyle;
- (NSString)crlaxString;
- (NSString)string;
- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3;
- (_NSRange)charRangeMappedToStorage:(_NSRange)a3;
- (_NSRange)charRangeRemappedFromStorage:(_NSRange)a3;
- (_NSRange)findRangeOfWordBackwardFromCharIndex:(int64_t)a3 expandingRangeToEndOfWord:(BOOL)a4;
- (_NSRange)range;
- (_NSRange)rangeByExpandingToIncludePartialWords:(_NSRange)a3;
- (_NSRange)rangeOfNearestWhitespaceBeforeCharIndex:(int64_t)a3 includingBreaks:(BOOL)a4;
- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3;
- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3 forLocale:(id)a4;
- (_NSRange)textRangeForParagraphAtCharIndex:(int64_t)a3;
- (_NSRange)textRangeForParagraphAtIndex:(int64_t)a3;
- (_NSRange)textRangeForParagraphsInCharRange:(_NSRange)a3;
- (_NSRange)wordAtCharIndex:(int64_t)a3 includePreviousWord:(BOOL)a4;
- (_NSRange)wordAtCharIndex:(int64_t)a3 includePreviousWord:(BOOL)a4 includeHyphenation:(BOOL)a5;
- (_TtC8Freeform12CRLTextRange)markedTextRange;
- (_TtC8Freeform12CRLTextRange)selectedMarkedTextRange;
- (_TtC8Freeform12CRLTextRange)selectedMarkedTextRangeFromOS;
- (_TtC8Freeform12CRLWPStorage)init;
- (_TtC8Freeform17CRLBoardDataStore)store;
- (_TtC8Freeform8CRLBoard)parentBoard;
- (id)attachmentOrFootnoteAtCharIndex:(int64_t)a3;
- (id)characterStyleAtCharIndex:(int64_t)a3;
- (id)characterStyleAtCharIndex:(int64_t)a3 before:(BOOL)a4 effectiveRange:(_NSRange *)a5;
- (id)characterStyleAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)commandForReplaceAllWithProvider:(id)a3;
- (id)copyWithMarkedText;
- (id)hyperlinkFieldAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)initFromStorage:(id)a3 withRange:(_NSRange)a4;
- (id)languageForTextRange:(_NSRange)a3 useStringTokenizer:(BOOL)a4 useDocumentLanguage:(BOOL)a5;
- (id)listStyleAtCharIndex:(int64_t)a3;
- (id)listStyleAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)listStyleAtParIndex:(int64_t)a3;
- (id)listStyleAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)numberedListLabelAtCharIndex:(int64_t)a3;
- (id)numberedListLabelAtParIndex:(int64_t)a3;
- (id)paragraphStyleAtCharIndex:(int64_t)a3;
- (id)paragraphStyleAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)paragraphStyleAtParIndex:(int64_t)a3;
- (id)paragraphStyleAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)rangeForParagraphAt:(int64_t)a3;
- (id)searchForString:(id)a3 options:(unint64_t)a4 searchCanvasDelegate:(id)a5 onHit:(id)a6;
- (id)smartFieldAtCharIndex:(int64_t)a3 attributeKind:(unint64_t)a4 effectiveRange:(_NSRange *)a5;
- (id)smartFieldsWithAttributeKind:(unint64_t)a3 intersectingRange:(_NSRange)a4;
- (id)stringEquivalentFromRange:(_NSRange)a3;
- (id)substringWithRange:(_NSRange)a3;
- (int64_t)attachmentCount;
- (int64_t)charIndexForParagraphAtIndex:(int64_t)a3;
- (int64_t)charIndexMappedFromStorage:(int64_t)a3;
- (int64_t)charIndexMappedToStorage:(int64_t)a3;
- (int64_t)charIndexRemappedFromStorage:(int64_t)a3;
- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(id)a5 hyphenChar:(unsigned int *)a6;
- (int64_t)length;
- (int64_t)listNumberAtParIndex:(int64_t)a3;
- (int64_t)listStartAtParIndex:(int64_t)a3;
- (int64_t)listStartAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (int64_t)nextCharacterIndex:(int64_t)a3;
- (int64_t)paragraphCount;
- (int64_t)paragraphIndexAtCharIndex:(int64_t)a3;
- (int64_t)paragraphIndexAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (int64_t)paragraphLevelAtParIndex:(int64_t)a3;
- (int64_t)paragraphLevelAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4;
- (int64_t)previousCharacterIndex:(int64_t)a3;
- (int64_t)storageLength;
- (int64_t)writingDirectionForParagraphAtCharIndex:(int64_t)a3;
- (unint64_t)changeCount;
- (unsigned)characterAtIndex:(int64_t)a3;
- (unsigned)wpKind;
- (void)continueSearch:(id)a3;
- (void)enumerateSmartFieldsWithAttributeKind:(unint64_t)a3 inRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4;
- (void)replaceCharactersIn:(_NSRange)a3 with:(id)a4;
- (void)replaceCharactersIn:(_NSRange)a3 withStorage:(id)a4;
- (void)setAttributedMarkedText:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setMarkedTextRange:(id)a3;
- (void)setMarkedTextStyle:(id)a3;
- (void)setParentInfo:(id)a3;
- (void)setSelectedMarkedTextRange:(id)a3;
- (void)setSelectedMarkedTextRangeFromOS:(id)a3;
- (void)setStore:(id)a3;
- (void)setUpForTesting;
@end

@implementation CRLWPStorage

- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3
{
  unsigned int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E6260);
  }
  v4 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 67110146;
    unsigned int v20 = v3;
    __int16 v21 = 2082;
    v22 = "-[CRLWPStorage(SpellCheck) rangeOfNumericalSuffixPrecedingCharIndex:]";
    __int16 v23 = 2082;
    v24 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorage+SpellCheck.m";
    __int16 v25 = 1024;
    int v26 = 14;
    __int16 v27 = 2114;
    v28 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014E6280);
  }
  v8 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR))
  {
    v9 = v8;
    v10 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v20 = v3;
    __int16 v21 = 2114;
    v22 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorage(SpellCheck) rangeOfNumericalSuffixPrecedingCharIndex:]");
  v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorage+SpellCheck.m"];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 14, 0, "Abstract method not overridden by %{public}@", v14);

  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v16, "-[CRLWPStorage(SpellCheck) rangeOfNumericalSuffixPrecedingCharIndex:]");
  id v18 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v17 userInfo:0];

  objc_exception_throw(v18);
}

- (_NSRange)rangeOfNumericalSuffixPrecedingCharIndex:(unint64_t)a3 forLocale:(id)a4
{
  id v6 = a4;
  if ((unint64_t)[v6 length] <= 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E62A0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010920E8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E62C0);
    }
    v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorage(SpellCheck) rangeOfNumericalSuffixPrecedingCharIndex:forLocale:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorage+SpellCheck.m"];
    +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:19 isFatal:0 description:"Locale string is too short."];
  }
  uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v10 = 0;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E62E0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_101092054();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E6300);
    }
    v12 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v12);
    }
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPStorage(SpellCheck) rangeOfNumericalSuffixPrecedingCharIndex:forLocale:]");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Spelling/CRLWPStorage+SpellCheck.m"];
    +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:23 isFatal:0 description:"Invalid charIndex."];
  }
  else
  {
    if (qword_1016A9508 != -1) {
      dispatch_once(&qword_1016A9508, &stru_1014E6320);
    }
    v15 = &qword_1016A94B8;
    if (([v6 hasPrefix:@"en"] & 1) == 0)
    {
      if ([v6 hasPrefix:@"fr"])
      {
        v15 = &qword_1016A94C0;
      }
      else if (([v6 hasPrefix:@"it"] & 1) != 0 {
             || ([v6 hasPrefix:@"gl"] & 1) != 0)
      }
      {
        v15 = &qword_1016A94C8;
      }
      else if ([v6 hasPrefix:@"pt"])
      {
        if ([v6 hasSuffix:@"BR"]) {
          v15 = &qword_1016A94D8;
        }
        else {
          v15 = &qword_1016A94D0;
        }
      }
      else if ([v6 hasPrefix:@"es"])
      {
        v15 = &qword_1016A94E0;
      }
      else if ([v6 hasPrefix:@"ca"])
      {
        v15 = &qword_1016A94E8;
      }
      else if ([v6 hasPrefix:@"el"])
      {
        v15 = &qword_1016A94F0;
      }
      else if ([v6 hasPrefix:@"nl"])
      {
        v15 = &qword_1016A94F8;
      }
      else if ([v6 hasPrefix:@"uk"])
      {
        v15 = &qword_1016A9500;
      }
    }
    id v13 = (id)*v15;
    id v14 = -[CRLWPStorage initFromStorage:withRange:]([_TtC8Freeform12CRLWPStorage alloc], "initFromStorage:withRange:", self, 0, a3);
    v16 = (char *)[v14 charIndexMappedFromStorage:a3];
    v17 = sub_1001CCC80(v16, 0, v14);
    if (v17 <= v16) {
      id v18 = v16;
    }
    else {
      id v18 = v17;
    }
    if (v17 >= v16) {
      v19 = v16;
    }
    else {
      v19 = v17;
    }
    unsigned int v20 = [v14 substringWithRange:v19, v18 - v19];
    __int16 v21 = +[NSCharacterSet decimalDigitCharacterSet];
    v22 = (char *)[v20 rangeOfCharacterFromSet:v21 options:4];

    if (v22 == (char *)0x7FFFFFFFFFFFFFFFLL
      || (+[NSCharacterSet letterCharacterSet],
          __int16 v23 = objc_claimAutoreleasedReturnValue(),
          id v24 = objc_msgSend(v20, "rangeOfCharacterFromSet:options:range:", v23, 0, 0, v22),
          v23,
          v24 != (id)0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      __int16 v25 = [v20 substringFromIndex:v22];
      NSUInteger v31 = 0;
      uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      if ([v13 containsObject:v25])
      {
        uint64_t v26 = [v14 charRangeMappedToStorage:v16- ((unsigned char *)[v25 length]+ ~(unint64_t)([v25 characterAtIndex:1] == 46)));
        NSUInteger v31 = v27;
      }
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger v10 = v31;
      }
      else
      {
        if (v22 && [v20 characterAtIndex:v22 - 1] == 49)
        {
          if (qword_1016A9518 != -1) {
            dispatch_once(&qword_1016A9518, &stru_1014E6340);
          }
          v28 = (void *)qword_1016A9510;
        }
        else
        {
          if (qword_1016A9528 != -1) {
            dispatch_once(&qword_1016A9528, &stru_1014E6360);
          }
          v28 = (void *)qword_1016A9520;
        }
        if (objc_msgSend(v28, "containsObject:", v25, v31))
        {
          uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          NSUInteger v10 = v32;
          uint64_t v11 = v26;
        }
      }
    }
  }

  NSUInteger v29 = v11;
  NSUInteger v30 = v10;
  result.length = v30;
  result.location = v29;
  return result;
}

- (CRLCanvasInfoGeometry)geometry
{
  return (CRLCanvasInfoGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC8Freeform12CRLWPStorage_geometry));
}

- (void)setGeometry:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_geometry);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_geometry) = (Class)a3;
  id v3 = a3;
}

- (BOOL)hasMarkedText
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextRange) != 0;
}

- (NSAttributedString)attributedMarkedText
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC8Freeform12CRLWPStorage_attributedMarkedText));
}

- (void)setAttributedMarkedText:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_attributedMarkedText);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_attributedMarkedText) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform12CRLTextRange)markedTextRange
{
  return (_TtC8Freeform12CRLTextRange *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextRange));
}

- (void)setMarkedTextRange:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextRange);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextRange) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform12CRLTextRange)selectedMarkedTextRange
{
  return (_TtC8Freeform12CRLTextRange *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRange));
}

- (void)setSelectedMarkedTextRange:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRange);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRange) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform12CRLTextRange)selectedMarkedTextRangeFromOS
{
  return (_TtC8Freeform12CRLTextRange *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRangeFromOS));
}

- (void)setSelectedMarkedTextRangeFromOS:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRangeFromOS);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_selectedMarkedTextRangeFromOS) = (Class)a3;
  id v3 = a3;
}

- (NSDictionary)markedTextStyle
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextStyle))
  {
    type metadata accessor for Key(0);
    sub_100912338((unint64_t *)&qword_1016837E0, 255, type metadata accessor for Key);
    swift_bridgeObjectRetain();
    v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }

  return (NSDictionary *)v2.super.isa;
}

- (void)setMarkedTextStyle:(id)a3
{
  if (a3)
  {
    type metadata accessor for Key(0);
    sub_100912338((unint64_t *)&qword_1016837E0, 255, type metadata accessor for Key);
    id v4 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    id v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_markedTextStyle) = v4;

  swift_bridgeObjectRelease();
}

- (id)copyWithMarkedText
{
  NSDictionary v2 = self;
  id v3 = (void *)sub_1008FC744();

  return v3;
}

- (CRLCanvasElementInfo)parentInfo
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CRLCanvasElementInfo *)Strong;
}

- (void)setParentInfo:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1008FD30C((uint64_t)a3);
}

- (_TtC8Freeform17CRLBoardDataStore)store
{
  return (_TtC8Freeform17CRLBoardDataStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                     + OBJC_IVAR____TtC8Freeform12CRLWPStorage_store));
}

- (void)setStore:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_store);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage_store) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform8CRLBoard)parentBoard
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    type metadata accessor for CRLContainerItem(0);
    v5 = (void *)swift_dynamicCastClass();
    if (v5)
    {
      id v6 = *(uint64_t (**)(void))((swift_isaMask & *v5) + 0x2E8);
      v7 = self;
      v8 = (void *)v6();

      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:

  return (_TtC8Freeform8CRLBoard *)v8;
}

- (BOOL)isSelectable
{
  return 0;
}

- (BOOL)isSupported
{
  return 1;
}

- (Class)layoutClass
{
  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  return (Class)sub_1008FD64C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform12CRLWPStorage_repClass);
}

- (Class)editorClass
{
  return (Class)sub_1008FD64C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8Freeform12CRLWPStorage_editorClass);
}

- (BOOL)hasVisibleContent
{
  NSDictionary v2 = self;
  sub_1008FD694();
  char v4 = v3;

  return v4 & 1;
}

- (NSAttributedString)coreTextAttributedString
{
  char v2 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage__hasValidPresentationProperties);
  char v3 = self;
  if ((v2 & 1) == 0) {
    sub_1008FDB6C();
  }
  char v4 = (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v3->super.isa
                                                                     + OBJC_IVAR____TtC8Freeform12CRLWPStorage__coreTextAttributedString));

  return v4;
}

- (id)initFromStorage:(id)a3 withRange:(_NSRange)a4
{
  return (id)sub_1008FFCEC((char *)a3, a4.location, (uint64_t (*)(uint64_t))a4.length);
}

- (int64_t)length
{
  char v2 = self;
  sub_100900858();
  int64_t v4 = v3;

  return v4;
}

- (NSString)string
{
  return (NSString *)sub_100900D38(self, (uint64_t)a2, sub_100900AB8);
}

- (NSString)crlaxString
{
  return (NSString *)sub_100900D38(self, (uint64_t)a2, sub_100900DA8);
}

- (void)replaceCharactersIn:(_NSRange)a3 withStorage:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v8 = self;
  sub_100903AC0(location, length, (uint64_t)v7);
}

- (void)replaceCharactersIn:(_NSRange)a3 with:(id)a4
{
  NSUInteger length = a3.length;
  int64_t location = a3.location;
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  BOOL v9 = __OFADD__(location, length);
  int64_t v10 = location + length;
  if (v9)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v10 < location)
  {
LABEL_7:
    __break(1u);
    return;
  }
  uint64_t v11 = v7;
  unint64_t v12 = v8;
  id v13 = self;
  sub_100901520(location, v10, v11, v12, 1);

  swift_bridgeObjectRelease();
}

- (_TtC8Freeform12CRLWPStorage)init
{
  _NSRange result = (_TtC8Freeform12CRLWPStorage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_10051B3EC((uint64_t)self + OBJC_IVAR____TtC8Freeform12CRLWPStorage_shapeItemTextPresetOverride, (uint64_t)v3, &qword_10168D670);
  sub_1008EF10C(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1005DF280);

  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (_NSRange)range
{
  char v2 = self;
  sub_100907764();
  NSUInteger v4 = v3;

  NSUInteger v5 = 0;
  NSUInteger v6 = v4;
  result.NSUInteger length = v6;
  result.int64_t location = v5;
  return result;
}

- (BOOL)hasSmartFields
{
  char v2 = self;
  id v3 = [(CRLWPStorage *)v2 range];
  unsigned __int8 v5 = -[CRLWPStorage hasSmartFieldsInRange:](v2, "hasSmartFieldsInRange:", v3, v4);

  return v5;
}

- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(id)a5 hyphenChar:(unsigned int *)a6
{
  uint64_t v6 = type metadata accessor for Locale();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  int64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Locale._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)writingDirectionForParagraphAtCharIndex:(int64_t)a3
{
  uint64_t v4 = self;
  sub_100907C78(a3);
  int64_t v6 = v5;

  return v6;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtParIndex:(int64_t)a3
{
  uint64_t v4 = self;
  LOBYTE(a3) = [(CRLWPStorage *)v4 isWritingDirectionRightToLeftForParagraphAtCharIndex:[(CRLWPStorage *)v4 textRangeForParagraphAtIndex:a3]];

  return a3;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(int64_t)a3
{
  return (id)[(CRLWPStorage *)self writingDirectionForParagraphAtCharIndex:a3] == (id)1;
}

- (_NSRange)textRangeForParagraphsInCharRange:(_NSRange)a3
{
  int64_t length = a3.length;
  NSUInteger location = a3.location;
  int64_t v5 = self;
  id v6 = [(CRLWPStorage *)v5 paragraphIndexAtCharIndex:location];
  id v7 = [(CRLWPStorage *)v5 textRangeForParagraphAtIndex:v6];
  NSUInteger v9 = (NSUInteger)v7;
  NSUInteger v10 = v8;
  if (length >= 2)
  {
    NSUInteger v11 = location + length;
    if (__OFADD__(location, length))
    {
      __break(1u);
    }
    else if (!__OFSUB__(v11, 1))
    {
      id v12 = [(CRLWPStorage *)v5 paragraphIndexAtCharIndex:v11 - 1];
      id v13 = [(CRLWPStorage *)v5 textRangeForParagraphAtIndex:v12];
      if (v12 != v6)
      {
        v18.NSUInteger location = (NSUInteger)v13;
        v18.int64_t length = v14;
        v16.NSUInteger location = v9;
        v16.int64_t length = v10;
        NSRange v15 = NSUnionRange(v16, v18);
        NSUInteger v9 = v15.location;
        NSUInteger v10 = v15.length;
      }
      goto LABEL_6;
    }
    __break(1u);
    goto LABEL_9;
  }
LABEL_6:

  id v7 = (id)v9;
  NSUInteger v8 = v10;
LABEL_9:
  result.int64_t length = v8;
  result.NSUInteger location = (NSUInteger)v7;
  return result;
}

- (_NSRange)findRangeOfWordBackwardFromCharIndex:(int64_t)a3 expandingRangeToEndOfWord:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = self;
  sub_100907ED0(a3, v4);
  NSUInteger v8 = v7;
  NSUInteger v10 = v9;

  NSUInteger v11 = v8;
  NSUInteger v12 = v10;
  result.int64_t length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (_NSRange)rangeOfNearestWhitespaceBeforeCharIndex:(int64_t)a3 includingBreaks:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = self;
  sub_100908464(a3, v4);
  NSUInteger v8 = v7;
  NSUInteger v10 = v9;

  NSUInteger v11 = v8;
  NSUInteger v12 = v10;
  result.int64_t length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (BOOL)isEmptyParagraphAtSelection:(id)a3
{
  id v4 = a3;
  int64_t v5 = self;
  unsigned __int8 v6 = -[CRLWPStorage isEmptyParagraphAtIndex:](v5, "isEmptyParagraphAtIndex:", -[CRLWPStorage paragraphIndexAtCharIndex:](v5, "paragraphIndexAtCharIndex:", [v4 leadingCharIndex]));

  return v6;
}

- (BOOL)isEmptyParagraphAtIndex:(int64_t)a3
{
  id v4 = self;
  id v5 = [(CRLWPStorage *)v4 textRangeForParagraphAtIndex:a3];
  if (v6) {
    unsigned __int8 v7 = sub_1001CA284([(CRLWPStorage *)v4 characterAtIndex:v5]);
  }
  else {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (id)rangeForParagraphAt:(int64_t)a3
{
  id v4 = self;
  id v5 = [(CRLWPStorage *)v4 textRangeForParagraphAtIndex:a3];
  uint64_t v7 = v6;
  id v8 = objc_allocWithZone((Class)type metadata accessor for CRLTextRange());
  NSUInteger v9 = (void *)sub_1006CC83C((uint64_t)v5, v7);

  return v9;
}

- (_NSRange)textRangeForParagraphAtIndex:(int64_t)a3
{
  id v4 = self;
  sub_100908AA8(a3);
  NSUInteger v6 = v5;
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.int64_t length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (_NSRange)textRangeForParagraphAtCharIndex:(int64_t)a3
{
  id v4 = self;
  sub_100908B68(a3);
  NSUInteger v6 = v5;
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.int64_t length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (id)attachmentOrFootnoteAtCharIndex:(int64_t)a3
{
  return 0;
}

- (id)smartFieldsWithAttributeKind:(unint64_t)a3 intersectingRange:(_NSRange)a4
{
  Swift::Int length = a4.length;
  Swift::Int location = a4.location;
  NSUInteger v7 = self;
  sub_100908C44(a3, location, length);

  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (id)smartFieldAtCharIndex:(int64_t)a3 attributeKind:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  NSArray v8 = self;
  sub_100909484(a3, a4, a5);
  NSUInteger v10 = v9;

  return v10;
}

- (void)enumerateSmartFieldsWithAttributeKind:(unint64_t)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v9 = _Block_copy(a5);
  _Block_copy(v9);
  NSUInteger v10 = self;
  sub_1009199FC(a3, location, length, (char *)v10, (char *)v9);
  _Block_release(v9);
  _Block_release(v9);
}

- (id)hyperlinkFieldAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSUInteger v6 = self;
  NSUInteger v7 = (void *)sub_10091A17C((char *)a3, (char **)a4, &OBJC_IVAR____TtC8Freeform12CRLWPStorage__hyperlinkRuns);

  return v7;
}

- (BOOL)hasColumnBreakAtCharIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)paragraphCount
{
  char v2 = *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage__hasValidRanges);
  id v3 = self;
  if ((v2 & 1) == 0) {
    sub_1008FF790();
  }
  int64_t v4 = (*(void **)((char *)&v3->super.isa + OBJC_IVAR____TtC8Freeform12CRLWPStorage__paragraphRanges))[2];

  return v4;
}

- (id)paragraphStyleAtParIndex:(int64_t)a3
{
  id v3 = [(CRLWPStorage *)self paragraphStyleAtParIndex:a3 effectiveRange:0];

  return v3;
}

- (id)paragraphStyleAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSUInteger v6 = self;
  NSUInteger v7 = (void *)sub_1009097AC(a3, a4);

  return v7;
}

- (int64_t)charIndexForParagraphAtIndex:(int64_t)a3
{
  long long v7 = xmmword_101176F48;
  int64_t v4 = self;
  id v5 = [(CRLWPStorage *)v4 paragraphStyleAtParIndex:a3 effectiveRange:&v7];

  return v7;
}

- (int64_t)paragraphIndexAtCharIndex:(int64_t)a3
{
  return [(CRLWPStorage *)self paragraphIndexAtCharIndex:a3 effectiveRange:0];
}

- (int64_t)paragraphIndexAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSUInteger v6 = self;
  sub_10090996C(a3, (uint64_t *)a4);
  int64_t v8 = v7;

  return v8;
}

- (id)paragraphStyleAtCharIndex:(int64_t)a3
{
  id v3 = [(CRLWPStorage *)self paragraphStyleAtCharIndex:a3 effectiveRange:0];

  return v3;
}

- (id)paragraphStyleAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSUInteger v6 = self;
  int64_t v7 = (void *)sub_100909AF8(a3, (uint64_t *)a4);

  return v7;
}

- (id)characterStyleAtCharIndex:(int64_t)a3
{
  id v3 = [(CRLWPStorage *)self characterStyleAtCharIndex:a3 effectiveRange:0];

  return v3;
}

- (id)characterStyleAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v4 = [(CRLWPStorage *)self characterStyleAtCharIndex:a3 before:1 effectiveRange:a4];

  return v4;
}

- (id)characterStyleAtCharIndex:(int64_t)a3 before:(BOOL)a4 effectiveRange:(_NSRange *)a5
{
  int64_t v7 = self;
  int64_t v8 = (void *)sub_10091A17C((char *)a3, (char **)a5, &OBJC_IVAR____TtC8Freeform12CRLWPStorage__characterStyleRuns);

  return v8;
}

- (id)numberedListLabelAtCharIndex:(int64_t)a3
{
  id v4 = self;
  id v5 = [(CRLWPStorage *)v4 numberedListLabelAtParIndex:[(CRLWPStorage *)v4 paragraphIndexAtCharIndex:a3]];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)numberedListLabelAtParIndex:(int64_t)a3
{
  id v4 = self;
  sub_100909E00(a3);

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

- (int64_t)listNumberAtParIndex:(int64_t)a3
{
  id v4 = self;
  int64_t v5 = sub_10090A05C(a3);

  return v5;
}

- (id)listStyleAtParIndex:(int64_t)a3
{
  id v3 = [(CRLWPStorage *)self listStyleAtParIndex:a3 effectiveRange:0];

  return v3;
}

- (id)listStyleAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSString v6 = self;
  int64_t v7 = (void *)sub_10090A210(a3, a4);

  return v7;
}

- (id)listStyleAtCharIndex:(int64_t)a3
{
  id v3 = [(CRLWPStorage *)self listStyleAtCharIndex:a3 effectiveRange:0];

  return v3;
}

- (id)listStyleAtCharIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSString v6 = self;
  id v7 = [(CRLWPStorage *)v6 listStyleAtParIndex:[(CRLWPStorage *)v6 paragraphIndexAtCharIndex:a3] effectiveRange:a4];

  return v7;
}

- (int64_t)paragraphLevelAtParIndex:(int64_t)a3
{
  return [(CRLWPStorage *)self paragraphLevelAtParIndex:a3 effectiveRange:0];
}

- (int64_t)paragraphLevelAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSString v6 = self;
  int64_t v7 = sub_10090A3F4(a3, a4);

  return v7;
}

- (int64_t)listStartAtParIndex:(int64_t)a3
{
  return [(CRLWPStorage *)self listStartAtParIndex:a3 effectiveRange:0];
}

- (int64_t)listStartAtParIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSString v6 = self;
  int64_t v7 = sub_10090A504(a3, a4);

  return v7;
}

- (int64_t)charIndexMappedToStorage:(int64_t)a3
{
  return a3;
}

- (int64_t)charIndexMappedFromStorage:(int64_t)a3
{
  return a3;
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (int64_t)charIndexRemappedFromStorage:(int64_t)a3
{
  return a3;
}

- (_NSRange)charRangeRemappedFromStorage:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (unsigned)characterAtIndex:(int64_t)a3
{
  id v4 = self;
  sub_10090A6A4(a3);
  LOWORD(a3) = v5;

  return a3;
}

- (unsigned)wpKind
{
  return 3;
}

- (int64_t)attachmentCount
{
  return 0;
}

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  __int16 v5 = self;
  sub_10090A990(location, length);

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v6;
}

- (BOOL)adjustRangesByDelta:(int64_t)a3 startingAt:(int64_t)a4
{
  return 1;
}

- (BOOL)hasSmartFieldsInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  __int16 v5 = self;
  LOBYTE(length) = sub_10090ACD8(location, length);

  return length & 1;
}

- (unint64_t)changeCount
{
  return 0;
}

- (int64_t)storageLength
{
  char v2 = self;
  sub_100900858();
  int64_t v4 = v3;

  return v4;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  int64_t v7 = self;
  sub_10090AF40((uint64_t)a3, location, length);
}

- (id)stringEquivalentFromRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  __int16 v5 = self;
  id v6 = -[CRLWPStorage substringWithRange:](v5, "substringWithRange:", location, length);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v7;
}

- (_NSRange)rangeByExpandingToIncludePartialWords:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  __int16 v5 = self;
  uint64_t v6 = sub_10090B2EC(location, length);
  NSUInteger v8 = v7;

  NSUInteger v9 = v6;
  NSUInteger v10 = v8;
  result.NSUInteger length = v10;
  result.NSUInteger location = v9;
  return result;
}

- (BOOL)allowsTypographicalFractions
{
  return [(CRLWPStorage *)self wpKind] != 5;
}

- (BOOL)isAllWhitespaceInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  __int16 v5 = self;
  sub_10090BAA8(location, length);
  LOBYTE(length) = v6;

  return length & 1;
}

- (id)languageForTextRange:(_NSRange)a3 useStringTokenizer:(BOOL)a4 useDocumentLanguage:(BOOL)a5
{
  return 0;
}

- (id)searchForString:(id)a3 options:(unint64_t)a4 searchCanvasDelegate:(id)a5 onHit:(id)a6
{
  NSUInteger v10 = (uint64_t (*)())_Block_copy(a6);
  NSUInteger v11 = v10;
  if (a3)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v13;
    if (v11)
    {
LABEL_3:
      uint64_t v14 = swift_allocObject();
      *(void *)(v14 + 16) = v11;
      NSUInteger v11 = sub_100895C4C;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if (v10) {
      goto LABEL_3;
    }
  }
  uint64_t v14 = 0;
LABEL_6:
  swift_unknownObjectRetain();
  NSRange v15 = self;
  id v16 = sub_10090BE68(v12, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t)v11, v14);
  sub_1005174AC((uint64_t)v11);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return v16;
}

- (void)continueSearch:(id)a3
{
  id v4 = a3;
  __int16 v5 = self;
  sub_10090C3F8(v4);
}

- (id)commandForReplaceAllWithProvider:(id)a3
{
  swift_unknownObjectRetain();
  __int16 v5 = self;
  id v6 = sub_10090C66C(a3);
  swift_unknownObjectRelease();

  return v6;
}

- (BOOL)canUserReplaceText
{
  char v2 = self;
  char v3 = sub_10090D450();

  return v3 & 1;
}

- (int64_t)nextCharacterIndex:(int64_t)a3
{
  id v4 = self;
  sub_10090D54C(a3);
  int64_t v6 = v5;

  return v6;
}

- (int64_t)previousCharacterIndex:(int64_t)a3
{
  id v4 = self;
  sub_10090DA34(a3);
  int64_t v6 = v5;

  return v6;
}

- (_NSRange)wordAtCharIndex:(int64_t)a3 includePreviousWord:(BOOL)a4
{
  id v4 = [(CRLWPStorage *)self wordAtCharIndex:a3 includePreviousWord:a4 includeHyphenation:0];
  result.NSUInteger length = v5;
  result.NSUInteger location = (NSUInteger)v4;
  return result;
}

- (_NSRange)wordAtCharIndex:(int64_t)a3 includePreviousWord:(BOOL)a4 includeHyphenation:(BOOL)a5
{
  NSUInteger v8 = self;
  uint64_t v9 = sub_10090E0B4(a3, a4, a5);
  NSUInteger v11 = v10;

  NSUInteger v12 = v9;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (void)setUpForTesting
{
  char v2 = self;
  sub_10090E464();
}

@end