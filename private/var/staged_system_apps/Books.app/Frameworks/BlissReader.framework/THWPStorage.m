@interface THWPStorage
- (BOOL)applyTheme;
- (BOOL)preventHighlighting;
- (BOOL)rangeContainsAttachment:(_NSRange)a3;
- (BOOL)supportsSections;
- (BOOL)usesApplicationFontScaling;
- (Class)layoutClass;
- (Class)repClass;
- (THWPAnnotationSource)annotationSource;
- (THWPStorage)initWithContext:(id)a3;
- (_NSRange)closestMatchForString:(id)a3 leftContext:(id)a4 rightContext:(id)a5 startCharIndex:(unint64_t)a6;
- (_NSRange)p_closestMatchForString:(id)a3 startCharIndex:(unint64_t)a4;
- (_NSRange)rangeOfInterest;
- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5;
- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4;
- (double)p_applicationFontScaleWithFilterDelegate:(id)a3;
- (id)documentRoot;
- (unint64_t)fontSize;
- (unint64_t)wordCountInRange:(_NSRange)a3;
- (void)annotationsChangedInRange:(_NSRange)a3;
- (void)contextualStringsForSelection:(_NSRange)a3 prefix:(id *)a4 suffix:(id *)a5;
- (void)dealloc;
- (void)p_freeAnnotationRanges;
- (void)p_reloadAnnotations;
- (void)setAnnotationSource:(id)a3;
- (void)setApplyTheme:(BOOL)a3;
- (void)setFontSize:(unint64_t)a3;
- (void)setPreventHighlighting:(BOOL)a3;
- (void)setUsesApplicationFontScaling:(BOOL)a3;
- (void)updateAnnotationSourceWithContentNode:(id)a3;
@end

@implementation THWPStorage

- (BOOL)usesApplicationFontScaling
{
  return self->mUsesApplicationFontScaling;
}

- (void)setUsesApplicationFontScaling:(BOOL)a3
{
  self->mUsesApplicationFontScaling = a3;
}

- (THWPStorage)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWPStorage;
  result = [(THWPStorage *)&v4 initWithContext:a3];
  if (result)
  {
    result->_fontSize = 0x7FFFFFFFFFFFFFFFLL;
    result->_applyTheme = 1;
  }
  return result;
}

- (unint64_t)wordCountInRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a3.length == 0) {
    return 0;
  }
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  CFStringRef v6 = (const __CFString *)[(THWPStorage *)self string];
  v11.NSUInteger location = location;
  v11.NSUInteger length = length;
  CFStringTokenizerRef v7 = CFStringTokenizerCreate(0, v6, v11, 0, 0);
  if (!v7) {
    return 0;
  }
  v8 = v7;
  unint64_t v9 = -1;
  do
    ++v9;
  while (CFStringTokenizerAdvanceToNextToken(v8));
  CFRelease(v8);
  return v9;
}

- (void)contextualStringsForSelection:(_NSRange)a3 prefix:(id *)a4 suffix:(id *)a5
{
  if (a3.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger length = a3.length;
    if (a3.length <= 0x100)
    {
      if ((unint64_t)a4 | (unint64_t)a5)
      {
        NSUInteger location = a3.location;
        v10 = (char *)-[THWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:");
        if (v10 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = v11;
          if (v11)
          {
            v13 = v10;
            if (-[THWPStorage wordCountInRange:](self, "wordCountInRange:", location, length) >= 9)
            {
              id v17 = -[THWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", location, length);
              if (v17 == (id)0x7FFFFFFFFFFFFFFFLL || v18 != 1) {
                return;
              }
              v15 = (char *)[(THWPStorage *)self textRangeForParagraphAtIndex:v17];
              uint64_t v16 = v19;
              BOOL v14 = v19 != 0;
            }
            else
            {
              BOOL v14 = 1;
              v15 = v13;
              uint64_t v16 = v12;
            }
            if (v15 != (char *)0x7FFFFFFFFFFFFFFFLL && v14)
            {
              if (a4)
              {
                v20 = location <= (unint64_t)(v15 + 64) ? v15 : (char *)(location - 64);
                if ((unint64_t)v20 < location)
                {
                  v21 = (char *)[(THWPStorage *)self wordAtCharIndex:v20 includePreviousWord:0];
                  if (v21 != (char *)0x7FFFFFFFFFFFFFFFLL
                    || (v21 = (char *)[(THWPStorage *)self nextWordFromIndex:v20 forward:1], v21 != (char *)0x7FFFFFFFFFFFFFFFLL))
                  {
                    v23 = v21;
                    if (v21 < v20) {
                      v23 = (char *)[(THWPStorage *)self nextWordFromIndex:v21 forward:1];
                    }
                    if (v23 != (char *)0x7FFFFFFFFFFFFFFFLL && v23 >= v15 && (unint64_t)&v23[v22] <= location) {
                      *a4 = -[THWPStorage substringWithRange:](self, "substringWithRange:", v23, location - (void)v23);
                    }
                  }
                }
              }
              if (a5)
              {
                NSUInteger v24 = location + length;
                v25 = v24 + 64 >= (unint64_t)&v15[v16] ? &v15[v16] : (char *)(v24 + 64);
                if ((unint64_t)v25 > v24 && v25 <= &v13[v12])
                {
                  v26 = (char *)[(THWPStorage *)self wordAtCharIndex:v25 includePreviousWord:1];
                  if (v26 != (char *)0x7FFFFFFFFFFFFFFFLL
                    || (v26 = (char *)[(THWPStorage *)self nextWordFromIndex:v25 forward:0], v26 != (char *)0x7FFFFFFFFFFFFFFFLL))
                  {
                    v28 = &v26[v27];
                    if (&v26[v27] > v25)
                    {
                      v26 = (char *)-[THWPStorage nextWordFromIndex:forward:](self, "nextWordFromIndex:forward:");
                      if (v26 == (char *)0x7FFFFFFFFFFFFFFFLL) {
                        return;
                      }
                      v28 = &v26[v29];
                    }
                    if ((unint64_t)v26 >= v24 && v28 <= &v15[v16]) {
                      *a5 = -[THWPStorage substringWithRange:](self, "substringWithRange:", v24, &v28[-v24]);
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (void)p_freeAnnotationRanges
{
  self->mAnnotationCount = 0;
  mAnnotationRanges = self->mAnnotationRanges;
  if (mAnnotationRanges)
  {
    free(mAnnotationRanges);
    self->mAnnotationRanges = 0;
  }
}

- (void)dealloc
{
  [(THWPAnnotationSource *)self->mAnnotationSource removeInterest:self];

  self->mAnnotationSource = 0;
  [(THWPStorage *)self p_freeAnnotationRanges];
  v3.receiver = self;
  v3.super_class = (Class)THWPStorage;
  [(THWPStorage *)&v3 dealloc];
}

- (void)updateAnnotationSourceWithContentNode:(id)a3
{
  if (!self->_annotationSourceOnceToken)
  {
    objc_sync_enter(self);
    if (!self->_annotationSourceOnceToken)
    {
      objc_opt_class();
      [self context].documentRoot;
      v5 = (void *)TSUDynamicCast();
      id v6 = [a3 annotationIDForInfo:self];
      if (v6)
      {
        CFStringTokenizerRef v7 = -[THCoreDataAnnotationSource initWithAnnotationController:contentNode:storageId:storageLength:]([THCoreDataAnnotationSource alloc], "initWithAnnotationController:contentNode:storageId:storageLength:", [v5 annotationController], a3, v6, -[THWPStorage length](self, "length"));
        [(THWPStorage *)self setAnnotationSource:v7];

        self->_annotationSourceOnceToken = 1;
      }
    }
    objc_sync_exit(self);
  }
}

- (THWPAnnotationSource)annotationSource
{
  return self->mAnnotationSource;
}

- (void)setAnnotationSource:(id)a3
{
  mAnnotationSource = self->mAnnotationSource;
  if (mAnnotationSource != a3)
  {
    v5 = (THWPAnnotationSource *)a3;
    self->mAnnotationSource = v5;
    [(THWPAnnotationSource *)v5 addInterest:self];
    if (mAnnotationSource)
    {
      [(THWPAnnotationSource *)mAnnotationSource removeInterest:self];
    }
    [(THWPStorage *)self p_reloadAnnotations];
  }
}

- (void)annotationsChangedInRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage annotationsChangedInRange:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm") lineNumber:234 description:@"This operation must only be performed on the main thread."];
  }
  if (length)
  {
    [(THWPStorage *)self p_reloadAnnotations];
    -[THWPStorage styleDidChangeInRange:](self, "styleDidChangeInRange:", location, length);
  }
}

- (void)p_reloadAnnotations
{
  objc_sync_enter(self);
  [(THWPStorage *)self p_freeAnnotationRanges];
  objc_super v3 = [(THWPStorage *)self annotationSource];
  id v4 = [(THWPStorage *)self rangeOfInterest];
  id v6 = -[THWPAnnotationSource annotationsForRange:](v3, "annotationsForRange:", v4, v5);
  CFStringTokenizerRef v7 = v6;
  if (v6)
  {
    unint64_t v8 = (unint64_t)[v6 count];
    unint64_t v9 = v8;
    if (v8)
    {
      v10 = (_NSRange *)malloc_type_malloc(16 * v8, 0x1000040451B5BE8uLL);
      uint64_t v11 = 0;
      p_NSUInteger length = &v10->length;
      do
      {
        id v13 = [v7 objectAtIndex:v11];
        unsigned int v14 = [v13 annotationStyle];
        NSUInteger v15 = 0;
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        if (v14 && v14 != 6) {
          uint64_t v16 = (uint64_t)[v13 annotationStorageRange];
        }
        *(p_length - 1) = v16;
        *p_NSUInteger length = v15;
        ++v11;
        p_length += 2;
      }
      while (v9 != v11);
      self->mAnnotationCount = v9;
      self->mAnnotationRanges = v10;
    }
  }

  objc_sync_exit(self);
}

- (_NSRange)rangeOfInterest
{
  id v2 = [(THWPStorage *)self length];
  NSUInteger v3 = 0;
  result.NSUInteger length = (NSUInteger)v2;
  result.NSUInteger location = v3;
  return result;
}

- (double)p_applicationFontScaleWithFilterDelegate:(id)a3
{
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = [a3 fontSizeForTextSource:self];
    id v6 = +[THApplicationSettings sharedSettings];
    unint64_t v7 = (unint64_t)v5;
LABEL_9:
    [v6 flowFontScaleForFontSize:v7];
    return result;
  }
  unint64_t v8 = [(THWPStorage *)self fontSize];
  id v9 = +[THApplicationSettings sharedSettings];
  id v10 = v9;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = [(THWPStorage *)self fontSize];
    id v6 = v10;
    goto LABEL_9;
  }

  [v9 flowFontScale];
  return result;
}

- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4
{
  if (a4)
  {
    unsigned int v7 = [a4 shouldFilterTextSource:self];
    if (!a3) {
      return 1.0;
    }
  }
  else
  {
    unsigned int v7 = 1;
    if (!a3) {
      return 1.0;
    }
  }
  if (!v7
    || !a3->length
    || ![(THWPStorage *)self usesApplicationFontScaling]
    && (!a4
     || (objc_opt_respondsToSelector() & 1) == 0
     || ![a4 useApplicationFontScaleForTextSource:self]))
  {
    return 1.0;
  }

  [(THWPStorage *)self p_applicationFontScaleWithFilterDelegate:a4];
  return result;
}

- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5
{
  if (a5)
  {
    unsigned int v9 = [a5 shouldFilterTextSource:self];
    if (!a4) {
      goto LABEL_40;
    }
  }
  else
  {
    unsigned int v9 = 1;
    if (!a4)
    {
LABEL_40:
      CFRetain(a3);
      return a3;
    }
  }
  if (!v9 || !a4->length) {
    goto LABEL_40;
  }
  if (([(THWPStorage *)self usesApplicationFontScaling]
     || a5
     && (objc_opt_respondsToSelector() & 1) != 0
     && [a5 useApplicationFontScaleForTextSource:self])
    && ([(THWPStorage *)self p_applicationFontScaleWithFilterDelegate:a5],
        v10 != 1.0)
    && (uint64_t v11 = (const __CTFont *)CFDictionaryGetValue(a3, kCTFontAttributeName)) != 0)
  {
    uint64_t v12 = v11;
    CTFontGetSize(v11);
    id v13 = (__CFString *)CTFontCopyPostScriptName(v12);
    value = (void *)TSWPCreateFontWithName();
  }
  else
  {
    value = 0;
  }
  objc_sync_enter(self);
  if (self->mAnnotationCount)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      mAnnotationRanges = self->mAnnotationRanges;
      v17.NSUInteger length = mAnnotationRanges[v14].length;
      if (v17.length)
      {
        NSUInteger location = mAnnotationRanges[v14].location;
        v17.NSUInteger location = location;
        NSRange v19 = NSIntersectionRange(*a4, v17);
        if (v19.length)
        {
          if (a4->location >= location) {
            NSUInteger length = v19.length;
          }
          else {
            NSUInteger length = 0;
          }
          NSUInteger v21 = v19.location + length - a4->location;
          if (v21) {
            a4->NSUInteger length = v21;
          }
          else {
            [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage createFilteredCoreTextAttributes:effectiveRange:filterDelegate:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm") lineNumber:370 description:@"Bad effective range calculation."];
          }
        }
      }
      ++v15;
      ++v14;
    }
    while (v15 < self->mAnnotationCount);
  }
  objc_sync_exit(self);
  id v22 = (id)CFDictionaryGetValue(a3, kCTForegroundColorAttributeName);
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a3);
  objc_opt_class();
  [self context].documentRoot
  NSUInteger v24 = (void *)TSUDynamicCast();
  if (-[THWPStorage applyTheme](self, "applyTheme") && [v24 themeProvider])
  {
    v25 = +[TSUColor colorWithCGColor:v22];
    if (-[TSUColor isAlmostEqualToColor:](v25, "isAlmostEqualToColor:", +[TSUColor blackColor](TSUColor, "blackColor")) & 1) != 0|| (objc_msgSend(objc_msgSend(v24, "themeProvider"), "forceThemeColors"))
    {
      goto LABEL_36;
    }
    -[TSUColor relativeLuminance](+[TSUColor colorWithCGColor:](TSUColor, "colorWithCGColor:", objc_msgSend(objc_msgSend(v24, "themeProvider"), "backgroundColor")), "relativeLuminance");
    double v27 = v26;
    [(TSUColor *)v25 relativeLuminance];
    if (v28 <= v27) {
      double v29 = v27;
    }
    else {
      double v29 = v28;
    }
    double v30 = v29 + 0.05;
    if (v28 >= v27) {
      double v28 = v27;
    }
    if (v30 / (v28 + 0.05) < 1.4) {
LABEL_36:
    }
      id v22 = [[v24 themeProvider] textColor];
  }
  CFDictionarySetValue(MutableCopy, kCTForegroundColorAttributeName, v22);
  if (value)
  {
    CFDictionarySetValue(MutableCopy, kCTFontAttributeName, value);
    CFRelease(value);
  }
  if (!MutableCopy) {
    goto LABEL_40;
  }
  return MutableCopy;
}

- (BOOL)supportsSections
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (id)documentRoot
{
  id v2 = [(THWPStorage *)self context];

  return [v2 documentRoot];
}

- (_NSRange)p_closestMatchForString:(id)a3 startCharIndex:(unint64_t)a4
{
  unint64_t v4 = a4;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage p_closestMatchForString:startCharIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm") lineNumber:446 description:@"invalid start range"];
  }
  id v7 = [(THWPStorage *)self string];
  id v8 = [a3 length];
  if (v8 <= [v7 length] && objc_msgSend(a3, "length") && objc_msgSend(v7, "length"))
  {
    unsigned int v9 = (char *)[a3 length];
    if (&v9[v4] > [v7 length])
    {
      double v10 = [v7 length];
      unint64_t v4 = v10 - (unsigned char *)[a3 length];
    }
    if ((objc_msgSend(objc_msgSend(v7, "substringWithRange:", v4, v9), "isEqualToString:", a3) & 1) == 0)
    {
      uint64_t v11 = [(char *)[v7 rangeOfString:a3 options:1 range:[v7 length] - v4]];
      id v13 = v12;
      id v14 = [v7 rangeOfString:a3 options:5 range:&v9[v4]];
      unint64_t v15 = (unint64_t)v14;
      unsigned int v9 = v16;
      if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL || v14 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v4 = (unint64_t)v14;
        }
        else
        {
          unsigned int v9 = v13;
          unint64_t v4 = (unint64_t)v11;
        }
      }
      else
      {
        NSRange v17 = (char *)(v4 - (void)v14);
        if (v4 < (unint64_t)v14 || (unint64_t)v11 < v4) {
          [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage p_closestMatchForString:startCharIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm") lineNumber:473 description:@"backward and forward ranges shouldn't cross the startCharIndex"];
        }
        if (&v11[-v4] > v17)
        {
          unint64_t v4 = v15;
        }
        else
        {
          unsigned int v9 = v13;
          unint64_t v4 = (unint64_t)v11;
        }
      }
    }
  }
  else
  {
    unsigned int v9 = 0;
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v18 = v4;
  NSUInteger v19 = (NSUInteger)v9;
  result.NSUInteger length = v19;
  result.NSUInteger location = v18;
  return result;
}

- (_NSRange)closestMatchForString:(id)a3 leftContext:(id)a4 rightContext:(id)a5 startCharIndex:(unint64_t)a6
{
  if (a6 == 0x7FFFFFFFFFFFFFFFLL) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage closestMatchForString:leftContext:rightContext:startCharIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm") lineNumber:499 description:@"invalid start range"];
  }
  if (!a3) {
    a3 = &stru_46D7E8;
  }
  if (!a4) {
    a4 = &stru_46D7E8;
  }
  if (!a5) {
    a5 = &stru_46D7E8;
  }
  if (![a4 length] && !objc_msgSend(a5, "length")) {
    goto LABEL_21;
  }
  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%@%@%@", a4, a3, a5];
  if ((unint64_t)[a4 length] >= a6) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = a6 - (void)[a4 length];
  }
  id v13 = (char *)[(THWPStorage *)self p_closestMatchForString:v11 startCharIndex:v12];
  if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_21;
  }
  unint64_t v15 = v13;
  uint64_t v16 = v14;
  if (v14 != [v11 length]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage closestMatchForString:leftContext:rightContext:startCharIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm") lineNumber:517 description:@"match range should match context string length"];
  }
  NSRange v17 = (char *)[a4 length];
  if (v16 < &v17[(void)[a5 length]]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage closestMatchForString:leftContext:rightContext:startCharIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm") lineNumber:518 description:@"can't subtract context from match range"];
  }
  NSUInteger v18 = &v15[(void)[a4 length]];
  id v19 = [a4 length];
  v20 = (char *)[a5 length];

  if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_21:
    NSUInteger v18 = (char *)[(THWPStorage *)self p_closestMatchForString:a3 startCharIndex:a6];
    NSUInteger v22 = v21;
    NSUInteger v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (v18 == (char *)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  NSUInteger v22 = v16 - &v20[(void)v19];
LABEL_24:
  if (&v18[v22] > [(THWPStorage *)self length]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPStorage closestMatchForString:leftContext:rightContext:startCharIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THWPStorage.mm") lineNumber:532 description:@"bogus match range"];
  }
  NSUInteger v23 = (NSUInteger)v18;
LABEL_27:
  NSUInteger v24 = v22;
  result.NSUInteger length = v24;
  result.NSUInteger location = v23;
  return result;
}

- (BOOL)rangeContainsAttachment:(_NSRange)a3
{
  -[THWPStorage attachmentIndexRangeForTextRange:](self, "attachmentIndexRangeForTextRange:", a3.location, a3.length);
  return v3 != 0;
}

- (BOOL)preventHighlighting
{
  return self->mPreventHighlighting;
}

- (void)setPreventHighlighting:(BOOL)a3
{
  self->mPreventHighlighting = a3;
}

- (unint64_t)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(unint64_t)a3
{
  self->_fontSize = a3;
}

- (BOOL)applyTheme
{
  return self->_applyTheme;
}

- (void)setApplyTheme:(BOOL)a3
{
  self->_applyTheme = a3;
}

@end