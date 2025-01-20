@interface CRLWPStorageAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxSelectionContainsVisibleTrackedChanges:(id)a3;
- (NSArray)crlaxInferredHeadingRanges;
- (NSString)crlaxString;
- (_NSRange)_crlaxInfferredHeadingRangeForParagraphIndex:(unint64_t)a3 withBaseFontSize:(unint64_t)a4 excludingCharacters:(id)a5;
- (_NSRange)crlaxInferredHeadingRangeForParagraphIndex:(unint64_t)a3 withBaseFontSize:(unint64_t)a4;
- (_NSRange)crlaxNextInferredHeadingRangeFromCharacterIndex:(unint64_t)a3 wrap:(BOOL)a4;
- (_NSRange)crlaxPreviousInferredHeadingRangeFromCharacterIndex:(unint64_t)a3 wrap:(BOOL)a4;
- (_NSRange)crlaxRange;
- (_NSRange)crlaxTextRangeForParagraphAtIndex:(unint64_t)a3;
- (_TtC8Freeform12CRLWPStorage)crlaxTarget;
- (id)crlaxAttachmentOrFootnoteAtCharIndex:(unint64_t)a3;
- (id)crlaxHyperLinksInRange:(_NSRange)a3;
- (id)crlaxInferredHeadingRangesWithBaseFontSize:(unint64_t)a3;
- (id)crlaxParagraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (id)crlaxSubstringWithRange:(_NSRange)a3;
- (unint64_t)crlaxChangeCount;
- (unint64_t)crlaxCharacterCount;
- (unint64_t)crlaxInferredBaseFontSize;
- (unint64_t)crlaxParagraphCount;
- (unint64_t)crlaxUpdatedInferredBaseFontSize;
- (unsigned)crlaxCharacterAtIndex:(unint64_t)a3;
- (void)_crlaxUpdateInferredBaseFontSize;
- (void)crlaxEnumerateSmartFieldsUsingBlock:(id)a3;
- (void)crlaxEnumerateSmartFieldsWithAttributeKind:(unint64_t)a3 inRange:(_NSRange)a4 usingBlock:(id)a5;
- (void)crlaxSetInferredBaseFontSize:(unint64_t)a3;
@end

@implementation CRLWPStorageAccessibility

+ (id)crlaxTargetClassName
{
  return @"Freeform.CRLWPStorage";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)crlaxInferredBaseFontSize
{
  return (unint64_t)__CRLAccessibilityGetAssociatedUnsignedInteger(self, &unk_1016A9010);
}

- (void)crlaxSetInferredBaseFontSize:(unint64_t)a3
{
}

- (_TtC8Freeform12CRLWPStorage)crlaxTarget
{
  char v7 = 0;
  v2 = self;
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v7);
  if (v7) {
    abort();
  }
  v5 = (void *)v4;

  return (_TtC8Freeform12CRLWPStorage *)v5;
}

- (NSString)crlaxString
{
  char v7 = 0;
  v2 = [(CRLWPStorageAccessibility *)self crlaxValueForKey:@"string"];
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = __CRLAccessibilityCastAsClass(v3, (uint64_t)v2, 1, &v7);
  if (v7) {
    abort();
  }
  v5 = (void *)v4;

  return (NSString *)v5;
}

- (_NSRange)crlaxRange
{
  id v2 = [(CRLWPStorageAccessibility *)self crlaxRangeValueForKey:@"range"];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (unint64_t)crlaxChangeCount
{
  return (unint64_t)[(CRLWPStorageAccessibility *)self crlaxUnsignedIntegerValueForKey:@"changeCount"];
}

- (unint64_t)crlaxCharacterCount
{
  id v2 = [(CRLWPStorageAccessibility *)self crlaxTarget];
  id v3 = [v2 characterCount];

  return (unint64_t)v3;
}

- (unint64_t)crlaxParagraphCount
{
  id v2 = [(CRLWPStorageAccessibility *)self crlaxTarget];
  id v3 = [v2 paragraphCount];

  return (unint64_t)v3;
}

- (unint64_t)crlaxUpdatedInferredBaseFontSize
{
  [(CRLWPStorageAccessibility *)self _crlaxUpdateInferredBaseFontSize];

  return [(CRLWPStorageAccessibility *)self crlaxInferredBaseFontSize];
}

- (id)crlaxSubstringWithRange:(_NSRange)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_1000C6060;
  v11 = sub_1000C6070;
  id v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C6078;
  v5[3] = &unk_1014D3490;
  v5[4] = self;
  v5[5] = &v7;
  _NSRange v6 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (id)crlaxAttachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  char v8 = 0;
  id v3 = [(CRLWPStorageAccessibility *)self attachmentOrFootnoteAtCharIndex:a3];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  _NSRange v6 = (void *)v5;

  return v6;
}

- (void)crlaxEnumerateSmartFieldsUsingBlock:(id)a3
{
  id v6 = a3;
  id v4 = [(CRLWPStorageAccessibility *)self crlaxRange];
  -[CRLWPStorageAccessibility crlaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](self, "crlaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v4, v5, v6);
}

- (void)crlaxEnumerateSmartFieldsWithAttributeKind:(unint64_t)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000C6260;
  v6[3] = &unk_1014CE370;
  v6[4] = self;
  unint64_t v8 = a3;
  _NSRange v9 = a4;
  id v5 = a5;
  id v7 = v5;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
}

- (BOOL)crlaxSelectionContainsVisibleTrackedChanges:(id)a3
{
  return 0;
}

- (id)crlaxParagraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return 0;
}

- (NSArray)crlaxInferredHeadingRanges
{
  unint64_t v3 = [(CRLWPStorageAccessibility *)self crlaxUpdatedInferredBaseFontSize];

  return (NSArray *)[(CRLWPStorageAccessibility *)self crlaxInferredHeadingRangesWithBaseFontSize:v3];
}

- (id)crlaxInferredHeadingRangesWithBaseFontSize:(unint64_t)a3
{
  id v5 = +[NSMutableArray array];
  unint64_t v6 = [(CRLWPStorageAccessibility *)self crlaxParagraphCount];
  unint64_t v7 = v6;
  if (qword_1016A9018)
  {
    if (!v6) {
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v8 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v9 = [v8 mutableCopy];

    v10 = +[NSCharacterSet controlCharacterSet];
    [v9 formUnionWithCharacterSet:v10];

    [v9 addCharactersInRange:65532, 1];
    id v11 = [v9 copy];
    id v12 = (void *)qword_1016A9018;
    qword_1016A9018 = (uint64_t)v11;

    if (!v7) {
      goto LABEL_12;
    }
  }
  uint64_t v13 = 0;
  do
  {
    id v14 = [(CRLWPStorageAccessibility *)self _crlaxInfferredHeadingRangeForParagraphIndex:v13 withBaseFontSize:a3 excludingCharacters:qword_1016A9018];
    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL || v15 != 0)
    {
      v17 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v14, v15);
      [v5 addObject:v17];
    }
    ++v13;
  }
  while (v7 != v13);
LABEL_12:
  id v18 = [v5 copy];

  return v18;
}

- (_NSRange)crlaxInferredHeadingRangeForParagraphIndex:(unint64_t)a3 withBaseFontSize:(unint64_t)a4
{
  if (!qword_1016A9020)
  {
    unint64_t v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v8 = [v7 mutableCopy];

    id v9 = +[NSCharacterSet controlCharacterSet];
    [v8 formUnionWithCharacterSet:v9];

    [v8 addCharactersInRange:65532, 1];
    id v10 = [v8 copy];
    id v11 = (void *)qword_1016A9020;
    qword_1016A9020 = (uint64_t)v10;
  }

  id v12 = -[CRLWPStorageAccessibility _crlaxInfferredHeadingRangeForParagraphIndex:withBaseFontSize:excludingCharacters:](self, "_crlaxInfferredHeadingRangeForParagraphIndex:withBaseFontSize:excludingCharacters:", a3, a4);
  result.length = v13;
  result.location = (NSUInteger)v12;
  return result;
}

- (_NSRange)_crlaxInfferredHeadingRangeForParagraphIndex:(unint64_t)a3 withBaseFontSize:(unint64_t)a4 excludingCharacters:(id)a5
{
  id v7 = a5;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v8 = 0;
  unint64_t v10 = [(CRLWPStorageAccessibility *)self crlaxCharacterCount];
  id v11 = (char *)[(CRLWPStorageAccessibility *)self crlaxTextRangeForParagraphAtIndex:a3];
  if (v12)
  {
    NSUInteger v13 = v11;
    uint64_t v14 = v12;
    uint64_t v15 = &v11[v12];
    if ((unint64_t)v11 <= v10) {
      id v16 = (id)v10;
    }
    else {
      id v16 = v11;
    }
    unint64_t v17 = (unint64_t)v11;
    while (v16 != (id)v17)
    {
      id v18 = [(CRLWPStorageAccessibility *)self crlaxTarget];
      unsigned int v19 = [v7 characterIsMember:[v18 characterAtIndex:v17]];

      if (v19)
      {
        if (++v17 < (unint64_t)v15) {
          continue;
        }
      }
      goto LABEL_11;
    }
    unint64_t v17 = (unint64_t)v16;
LABEL_11:
    unint64_t v20 = (unint64_t)&v13[v14 - 1];
    NSUInteger v8 = 0;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v21 = [(CRLWPStorageAccessibility *)self crlaxTarget];
      unsigned int v22 = [v7 characterIsMember:[v21 characterAtIndex:v20]];

      if (!v22) {
        break;
      }
      if (!v20) {
        break;
      }
      --v20;
    }
    while (v20 >= v17);
    unint64_t v23 = v20 - v17;
    if (v20 > v17 && v23 <= 0x44)
    {
      unint64_t v24 = v23 + 1;
      unint64_t v25 = v20 + 1;
      if (v17 >= v20 + 1)
      {
        NSUInteger v8 = v24;
LABEL_23:
        uint64_t v9 = v17;
      }
      else
      {
        NSUInteger v32 = v24;
        unint64_t v26 = v17;
        while (1)
        {
          v27 = [(CRLWPStorageAccessibility *)self crlaxTarget];
          id v28 = [v27 characterAtIndex:v26];

          v29 = +[NSCharacterSet lowercaseLetterCharacterSet];
          LODWORD(v28) = [v29 characterIsMember:v28];

          if (v28) {
            break;
          }
          if (v25 == ++v26)
          {
            NSUInteger v8 = v32;
            goto LABEL_23;
          }
        }
      }
    }
  }

  NSUInteger v30 = v9;
  NSUInteger v31 = v8;
  result.length = v31;
  result.location = v30;
  return result;
}

- (_NSRange)crlaxTextRangeForParagraphAtIndex:(unint64_t)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3010000000;
  id v11 = "";
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C68F0;
  v7[3] = &unk_1014CC6B8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  NSUInteger v3 = v9[4];
  NSUInteger v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  NSUInteger v5 = v3;
  NSUInteger v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

- (unsigned)crlaxCharacterAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  __int16 v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C6A1C;
  v5[3] = &unk_1014CC6B8;
  v5[4] = self;
  v5[5] = &v6;
  void v5[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  unsigned __int16 v3 = *((_WORD *)v7 + 12);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (_NSRange)crlaxNextInferredHeadingRangeFromCharacterIndex:(unint64_t)a3 wrap:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(CRLWPStorageAccessibility *)self crlaxInferredHeadingRanges];
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v7 = 0;
  if ([v6 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = v6;
    id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      BOOL v24 = v4;
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v25 + 1) + 8 * i) rangeValue];
          if ((unint64_t)v14 > a3)
          {
            uint64_t v17 = (uint64_t)v14;
            NSUInteger v16 = v15;
            goto LABEL_12;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      NSUInteger v16 = 0;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:
      BOOL v4 = v24;
    }
    else
    {
      NSUInteger v16 = 0;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }

    BOOL v19 = v17 != 0x7FFFFFFFFFFFFFFFLL || v16 != 0 || !v4;
    NSUInteger v7 = v16;
    uint64_t v8 = v17;
    if (!v19)
    {
      unint64_t v20 = [v9 objectAtIndexedSubscript:0];
      uint64_t v8 = (uint64_t)[v20 rangeValue];
      NSUInteger v7 = v21;
    }
  }

  NSUInteger v22 = v8;
  NSUInteger v23 = v7;
  result.length = v23;
  result.location = v22;
  return result;
}

- (_NSRange)crlaxPreviousInferredHeadingRangeFromCharacterIndex:(unint64_t)a3 wrap:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(CRLWPStorageAccessibility *)self crlaxInferredHeadingRanges];
  uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v7 = 0;
  if ([v6 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = [v6 reverseObjectEnumerator];
    id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      BOOL v24 = v4;
      uint64_t v12 = *(void *)v26;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [*(id *)(*((void *)&v25 + 1) + 8 * i) rangeValue];
          if ((unint64_t)v14 + v15 <= a3)
          {
            uint64_t v17 = (uint64_t)v14;
            NSUInteger v16 = v15;
            goto LABEL_12;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      NSUInteger v16 = 0;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:
      BOOL v4 = v24;
    }
    else
    {
      NSUInteger v16 = 0;
      uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }

    BOOL v19 = v17 != 0x7FFFFFFFFFFFFFFFLL || v16 != 0 || !v4;
    NSUInteger v7 = v16;
    uint64_t v8 = v17;
    if (!v19)
    {
      unint64_t v20 = [v6 objectAtIndexedSubscript:[v6 count] - 1];
      uint64_t v8 = (uint64_t)[v20 rangeValue];
      NSUInteger v7 = v21;
    }
  }

  NSUInteger v22 = v8;
  NSUInteger v23 = v7;
  result.length = v23;
  result.location = v22;
  return result;
}

- (id)crlaxHyperLinksInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v5 = [(CRLWPStorageAccessibility *)self crlaxTarget];
  uint64_t v6 = [v5 smartFieldsWithAttributeKind:6 intersectingRange:location length];

  return v6;
}

- (void)_crlaxUpdateInferredBaseFontSize
{
  bzero(v7, 0x1F40uLL);
  uint64_t v3 = 0;
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    unint64_t v5 = v7[v3];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL || (uint64_t v6 = v3, !v5))
    {
      if (v5 <= v7[v4]) {
        uint64_t v6 = v4;
      }
      else {
        uint64_t v6 = v3;
      }
    }
    ++v3;
    uint64_t v4 = v6;
  }
  while (v3 != 1000);

  -[CRLWPStorageAccessibility crlaxSetInferredBaseFontSize:](self, "crlaxSetInferredBaseFontSize:");
}

@end