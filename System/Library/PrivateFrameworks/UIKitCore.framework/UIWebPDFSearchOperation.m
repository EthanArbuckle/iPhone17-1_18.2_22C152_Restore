@interface UIWebPDFSearchOperation
- (BOOL)_hitSearchLimit;
- (NSString)searchString;
- (UIPDFDocument)documentToSearch;
- (UIWebPDFSearchOperation)init;
- (UIWebPDFSearchOperationDelegate)searchDelegate;
- (__CTFont)_fontWithPDFFont:(CGPDFFont *)a3 size:(double)a4;
- (double)documentScale;
- (id)sanitizedAttributedStringForAttributedString:(id)a3;
- (unint64_t)currentPageIndex;
- (unint64_t)currentPageResultCount;
- (unint64_t)numberOfResultsToSkip;
- (unint64_t)resultLimit;
- (unint64_t)startingPageIndex;
- (void)_notifyDelegateOfStatus;
- (void)_search;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)setDocumentScale:(double)a3;
- (void)setDocumentToSearch:(id)a3;
- (void)setNumberOfResultsToSkip:(unint64_t)a3;
- (void)setResultLimit:(unint64_t)a3;
- (void)setSearchDelegate:(id)a3;
- (void)setSearchString:(id)a3;
- (void)setStartingPageIndex:(unint64_t)a3;
@end

@implementation UIWebPDFSearchOperation

- (UIWebPDFSearchOperation)init
{
  v4.receiver = self;
  v4.super_class = (Class)UIWebPDFSearchOperation;
  v2 = [(UIWebPDFSearchOperation *)&v4 init];
  if (v2)
  {
    v2->_results = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(UIWebPDFSearchOperation *)v2 setResultLimit:101];
    [(UIWebPDFSearchOperation *)v2 setDocumentScale:1.0];
  }
  return v2;
}

- (void)dealloc
{
  [(UIWebPDFSearchOperation *)self setDocumentToSearch:0];
  [(UIWebPDFSearchOperation *)self setSearchString:0];

  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFSearchOperation;
  [(UIWebPDFSearchOperation *)&v3 dealloc];
}

- (BOOL)_hitSearchLimit
{
  unint64_t totalResultsCount = self->_totalResultsCount;
  return totalResultsCount >= [(UIWebPDFSearchOperation *)self resultLimit];
}

- (void)_notifyDelegateOfStatus
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__UIWebPDFSearchOperation__notifyDelegateOfStatus__block_invoke;
  block[3] = &unk_1E52DC580;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __50__UIWebPDFSearchOperation__notifyDelegateOfStatus__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCancelled];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(v3 + 312), "searchWasCancelled:");
    objc_super v4 = *(void **)(a1 + 32);
    return [v4 setSearchDelegate:0];
  }
  else
  {
    *(void *)(*(void *)(a1 + 32) + 280) = [*(id *)(v3 + 248) count];
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(void *)(v6 + 280))
    {
      [*(id *)(v6 + 312) search:v6 hasPartialResults:*(void *)(v6 + 248)];
      [*(id *)(*(void *)(a1 + 32) + 248) removeAllObjects];
      uint64_t v6 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v6 + 288))
    {
      v7 = *(void **)(v6 + 312);
      return objc_msgSend(v7, "searchDidFinish:");
    }
    else
    {
      uint64_t result = [(id)v6 _hitSearchLimit];
      if (result)
      {
        v8 = *(void **)(*(void *)(a1 + 32) + 312);
        return objc_msgSend(v8, "searchLimitHit:");
      }
    }
  }
  return result;
}

- (__CTFont)_fontWithPDFFont:(CGPDFFont *)a3 size:(double)a4
{
  Font = (CGFont *)CGPDFFontGetFont();
  for (CFStringRef i = (id)CGFontCopyPostScriptName(Font);
        ;
        CFStringRef i = (const __CFString *)[(__CFString *)v7 substringFromIndex:7])
  {
    v7 = (__CFString *)i;
    if (!i) {
      break;
    }
    v8 = CTFontDescriptorCreateWithNameAndSize(i, a4);
    if (!v8) {
      break;
    }
    v9 = v8;
    MatchingFontDescriptorsWithOptions = (const void *)CTFontDescriptorCreateMatchingFontDescriptorsWithOptions();
    if (MatchingFontDescriptorsWithOptions)
    {
      CFRelease(MatchingFontDescriptorsWithOptions);
      uint64_t result = CTFontCreateWithFontDescriptor(v9, a4, 0);
      if (result) {
        return result;
      }
    }
    if ((unint64_t)[(__CFString *)v7 length] < 8
      || [(__CFString *)v7 characterAtIndex:6] != 43)
    {
      break;
    }
  }
  if ([(__CFString *)v7 isEqualToString:@"Arial,Bold"])
  {
    CFStringRef v12 = @"Arial-BoldMT";
  }
  else if ([(__CFString *)v7 isEqualToString:@"Arial,BoldItalic"])
  {
    CFStringRef v12 = @"Arial-BoldItalicMT";
  }
  else if ([(__CFString *)v7 isEqualToString:@"Arial,Italic"])
  {
    CFStringRef v12 = @"Arial-ItalicMT";
  }
  else if (([(__CFString *)v7 isEqualToString:@"Helvetica-Black"] & 1) != 0 {
         || ([(__CFString *)v7 isEqualToString:@"Helvetica-Narrow-Bold"] & 1) != 0)
  }
  {
    CFStringRef v12 = @"Helvetica-Bold";
  }
  else if ([(__CFString *)v7 isEqualToString:@"HelveticaNeue-Black"])
  {
    CFStringRef v12 = @"HelveticaNeue-Bold";
  }
  else if ([(__CFString *)v7 isEqualToString:@"TimesNewRoman"])
  {
    CFStringRef v12 = @"TimesNewRomanPSMT";
  }
  else if ([(__CFString *)v7 isEqualToString:@"TimesNewRoman,Bold"])
  {
    CFStringRef v12 = @"TimesNewRomanPS-BoldMT";
  }
  else if ([(__CFString *)v7 isEqualToString:@"TimesNewRoman,BoldItalic"])
  {
    CFStringRef v12 = @"TimesNewRomanPS-BoldItalicMT";
  }
  else if ([(__CFString *)v7 isEqualToString:@"TimesNewRoman,Italic"])
  {
    CFStringRef v12 = @"TimesNewRomanPS-ItalicMT";
  }
  else
  {
    if (![(__CFString *)v7 isEqualToString:@"ZapfDingbats"]
      || ([+[UIDevice currentDevice] userInterfaceIdiom] & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      CFStringRef v12 = 0;
      goto LABEL_19;
    }
    CFStringRef v12 = @"ZapfDingbatsITC";
  }
  uint64_t result = CTFontCreateWithName(v12, a4, 0);
  if (result) {
    return result;
  }
LABEL_19:
  CGPDFFontGetFontDescriptor();
  char Flags = CGPDFFontDescriptorGetFlags();
  if ((Flags & 2) != 0)
  {
    if (Flags) {
      CFStringRef v12 = @"Courier";
    }
    else {
      CFStringRef v12 = @"TimesNewRomanPSMT";
    }
    goto LABEL_26;
  }
  if ((Flags & 1) == 0)
  {
    CFStringRef v12 = @"Helvetica";
    goto LABEL_26;
  }
  if (v12)
  {
LABEL_26:
    uint64_t result = CTFontCreateWithName(v12, a4, 0);
    if (result) {
      return result;
    }
  }
  return CTFontCreateWithName(@"TimesNewRomanPSMT", a4, 0);
}

- (id)sanitizedAttributedStringForAttributedString:(id)a3
{
  if (!a3) {
    return 0;
  }
  id result = (id)[a3 string];
  if (result)
  {
    id v6 = result;
    id result = (id)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:result];
    if (result)
    {
      id v7 = result;
      uint64_t v8 = [v6 length];
      if (v8)
      {
        unint64_t v9 = v8;
        uint64_t v10 = 0;
        uint64_t v23 = *MEMORY[0x1E4F243F0];
        uint64_t v11 = *MEMORY[0x1E4F248A0];
        uint64_t v12 = *MEMORY[0x1E4F24740];
        do
        {
          uint64_t v26 = 0;
          uint64_t v27 = 0;
          uint64_t v13 = [a3 attributesAtIndex:v10 effectiveRange:&v26];
          if (v13)
          {
            v14 = (void *)v13;
            v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
            v16 = (void *)[v14 valueForKey:*MEMORY[0x1E4F1DE68]];
            uint64_t v17 = [v14 valueForKey:*MEMORY[0x1E4F1DE60]];
            if (v17) {
              BOOL v18 = v16 == 0;
            }
            else {
              BOOL v18 = 1;
            }
            if (!v18)
            {
              v19 = (void *)v17;
              double v25 = 0.0;
              objc_msgSend(v16, "getBytes:range:", &v25, 0, 8);
              uint64_t v24 = 0;
              objc_msgSend(v19, "getBytes:range:", &v24, 0, 8);
              v20 = [(UIWebPDFSearchOperation *)self _fontWithPDFFont:v24 size:v25];
              if (v20)
              {
                v21 = v20;
                [v15 setValue:v20 forKey:v23];
                CFRelease(v21);
              }
            }
            uint64_t v22 = [v7 length];
            [v7 beginEditing];
            objc_msgSend(v7, "removeAttribute:range:", v11, 0, v22);
            objc_msgSend(v7, "addAttribute:value:range:", v12, -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"), 0, v22);
            [v7 endEditing];
            objc_msgSend(v7, "setAttributes:range:", v15, v26, v27);
          }
          uint64_t v10 = v27 + v26;
        }
        while (v27 + v26 < v9);
      }
      return v7;
    }
  }
  return result;
}

- (void)_search
{
  uint64_t v3 = [(UIWebPDFSearchOperation *)self searchString];
  if ([(NSString *)v3 length]
    && (objc_super v4 = [(UIWebPDFSearchOperation *)self documentToSearch]) != 0
    && (v5 = v4,
        uint64_t v6 = 256,
        unint64_t pageIndex = self->_pageIndex,
        pageIndex < [(UIPDFDocument *)v4 numberOfPages])
    && (id v8 = [(UIPDFDocument *)v5 pageAtIndex:self->_pageIndex]) != 0)
  {
    unint64_t v9 = v8;
    long long v42 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v44 = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v53.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v53.c = v42;
    long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v53.tx = v41;
    unint64_t v10 = [v8 rotation];
    if (v10)
    {
      CGAffineTransformMakeRotation(&t2, (double)v10 * -3.14159265 / 180.0);
      *(_OWORD *)&t1.a = v44;
      *(_OWORD *)&t1.c = v42;
      *(_OWORD *)&t1.tx = v41;
      CGAffineTransformConcat(&v53, &t1, &t2);
    }
    if (!self->_complete)
    {
      uint64_t v11 = 0;
      uint64_t v12 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
      uint64_t v13 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
      v39 = v9;
      uint64_t v40 = 256;
      do
      {
        if ([(UIWebPDFSearchOperation *)self isCancelled]) {
          break;
        }
        uint64_t v14 = v12[461];
        unint64_t v15 = *(unint64_t *)((char *)&self->super.super.isa + v14);
        if (v15 >= [(UIWebPDFSearchOperation *)self resultLimit]) {
          break;
        }
        uint64_t v16 = [v9 findString:v3 fromSelection:v11 options:1];
        if (!v16)
        {
          ++*(Class *)((char *)&self->super.super.isa + v6);
          break;
        }
        uint64_t v17 = v13[466];
        uint64_t v18 = *(uint64_t *)((char *)&self->super.super.isa + v17);
        if (v18)
        {
          *(Class *)((char *)&self->super.super.isa + v17) = (Class)(v18 - 1);
          v19 = v11;
        }
        else
        {
          v19 = (void *)v16;
          v20 = objc_alloc_init(UIWebPDFSearchResult);
          if (v20)
          {
            v21 = v20;
            [(UIWebPDFSearchResult *)v20 setPageIndex:*(Class *)((char *)&self->super.super.isa + v6)];
            [(UIWebPDFSearchResult *)v21 setString:self->searchString];
            [v19 bounds];
            CGFloat v23 = v22;
            CGFloat v25 = v24;
            CGFloat v27 = v26;
            CGFloat v29 = v28;
            [v19 transform];
            v54.origin.x = v23;
            v54.origin.y = v25;
            v54.size.width = v27;
            v54.size.height = v29;
            CGRect v55 = CGRectApplyAffineTransform(v54, &v50);
            v43 = v21;
            -[UIWebPDFSearchResult setBoundingBox:](v21, "setBoundingBox:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
            v45 = (void *)[MEMORY[0x1E4F1CA48] array];
            v30 = (void *)[MEMORY[0x1E4F1CA48] array];
            v31 = (void *)[MEMORY[0x1E4F1CA48] array];
            uint64_t v32 = [v19 numberOfRectangles];
            if (v32)
            {
              uint64_t v33 = v32;
              for (uint64_t i = 0; i != v33; ++i)
              {
                memset(&t1, 0, sizeof(t1));
                memset(&v49, 0, sizeof(v49));
                if (([v19 getBounds:&v49 transform:&t1 index:i] & 1) == 0)
                {
                  id v35 = -[UIWebPDFSearchOperation sanitizedAttributedStringForAttributedString:](self, "sanitizedAttributedStringForAttributedString:", [v19 attributedStringAtIndex:i]);
                  if (v35)
                  {
                    id v36 = v35;
                    CGAffineTransform v48 = t1;
                    CGRect v49 = CGRectApplyAffineTransform(v49, &v48);
                    CGAffineTransform v47 = t1;
                    CGAffineTransform v46 = v53;
                    CGAffineTransformConcat(&v48, &v47, &v46);
                    CGAffineTransform t1 = v48;
                    v37 = NSNumber;
                    long double v38 = atan2(v48.b, v48.a);
                    *(float *)&long double v38 = v38;
                    *(float *)&long double v38 = -*(float *)&v38;
                    objc_msgSend(v31, "addObject:", objc_msgSend(v37, "numberWithFloat:", (double)v38));
                    objc_msgSend(v45, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", *(_OWORD *)&v49.origin, *(_OWORD *)&v49.size));
                    [v30 addObject:v36];
                  }
                }
              }
            }
            [(UIWebPDFSearchResult *)v43 setRotationAngles:v31];
            [(UIWebPDFSearchResult *)v43 setRects:v45];
            [(UIWebPDFSearchResult *)v43 setStrings:v30];
            [(NSMutableArray *)self->_results addObject:v43];

            ++*(Class *)((char *)&self->super.super.isa + v14);
            unint64_t v9 = v39;
            uint64_t v6 = v40;
            uint64_t v12 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
            uint64_t v13 = &OBJC_IVAR___UIScrollView__asyncScrollDecelerationState;
          }
        }
        uint64_t v11 = v19;
      }
      while (!self->_complete);
    }
  }
  else
  {
    self->_complete = 1;
  }
}

- (void)main
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__UIWebPDFSearchOperation_main__block_invoke;
  block[3] = &unk_1E52DC580;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  while (!self->_complete
       && ![(UIWebPDFSearchOperation *)self _hitSearchLimit]
       && ([(UIWebPDFSearchOperation *)self isCancelled] & 1) == 0)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    [(UIWebPDFSearchOperation *)self _search];
    [(UIWebPDFSearchOperation *)self _notifyDelegateOfStatus];
    [v4 drain];
  }
  [v3 drain];
}

uint64_t __31__UIWebPDFSearchOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 312), "searchDidBegin:");
}

- (void)cancel
{
  v3.receiver = self;
  v3.super_class = (Class)UIWebPDFSearchOperation;
  [(UIWebPDFSearchOperation *)&v3 cancel];
  if (!self->_complete) {
    [(UIWebPDFSearchOperation *)self _notifyDelegateOfStatus];
  }
}

- (unint64_t)currentPageResultCount
{
  return self->_currentPageResultCount;
}

- (unint64_t)startingPageIndex
{
  return self->startingPageIndex;
}

- (void)setStartingPageIndex:(unint64_t)a3
{
  self->startingPageIndex = a3;
}

- (unint64_t)currentPageIndex
{
  return self->_pageIndex;
}

- (UIPDFDocument)documentToSearch
{
  return (UIPDFDocument *)objc_getProperty(self, a2, 304, 1);
}

- (void)setDocumentToSearch:(id)a3
{
}

- (UIWebPDFSearchOperationDelegate)searchDelegate
{
  return self->searchDelegate;
}

- (void)setSearchDelegate:(id)a3
{
  self->searchDelegate = (UIWebPDFSearchOperationDelegate *)a3;
}

- (double)documentScale
{
  return self->documentScale;
}

- (void)setDocumentScale:(double)a3
{
  self->documentScale = a3;
}

- (unint64_t)numberOfResultsToSkip
{
  return self->_numberOfResultsToSkip;
}

- (void)setNumberOfResultsToSkip:(unint64_t)a3
{
  self->_numberOfResultsToSkip = a3;
}

- (NSString)searchString
{
  return self->searchString;
}

- (void)setSearchString:(id)a3
{
}

- (unint64_t)resultLimit
{
  return self->resultLimit;
}

- (void)setResultLimit:(unint64_t)a3
{
  self->resultLimit = a3;
}

@end