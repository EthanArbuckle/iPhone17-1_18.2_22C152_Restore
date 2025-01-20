@interface THReadingStatisticsCollector
- (BCCFISet)visibleContent;
- (NSOperationQueue)chapterDataQueue;
- (THReadingStatisticsCollector)init;
- (THReadingStatisticsCollectorDelegate)delegate;
- (_NSRange)_rangeForBodyRep:(id)a3 visibleUnscaledRect:(CGRect)a4;
- (void)_scanReadingStatisticsWithNode:(id)a3 root:(id)a4 ordinal:(unint64_t *)a5 level:(int64_t)a6 childIndex:(int64_t)a7;
- (void)bodyReps:(id)a3 visibleRectIs:(CGRect)a4;
- (void)dealloc;
- (void)readingStatisticsScanOperation:(id)a3 addTextNodeCharacterCounts:(id)a4;
- (void)scanReadingStatisticsWithDocumentRoot:(id)a3;
- (void)setChapterDataQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setVisibleContent:(id)a3;
@end

@implementation THReadingStatisticsCollector

- (THReadingStatisticsCollector)init
{
  v5.receiver = self;
  v5.super_class = (Class)THReadingStatisticsCollector;
  v2 = [(THReadingStatisticsCollector *)&v5 init];
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v2->_chapterDataQueue = v3;
    [(NSOperationQueue *)v3 setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v2->_chapterDataQueue setQualityOfService:17];
  }
  return v2;
}

- (void)dealloc
{
  [(NSOperationQueue *)self->_chapterDataQueue cancelAllOperations];
  self->_delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)THReadingStatisticsCollector;
  [(THReadingStatisticsCollector *)&v3 dealloc];
}

- (void)bodyReps:(id)a3 visibleRectIs:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  objc_msgSend(objc_msgSend(objc_msgSend(a3, "firstObject"), "interactiveCanvasController"), "layoutIfNeeded");
  id v10 = +[BCMutableCFISet cfiSet];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = [a3 countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v31;
    *(void *)&long long v12 = 138412290;
    long long v28 = v12;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(a3);
        }
        v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v17 = -[THReadingStatisticsCollector _rangeForBodyRep:visibleUnscaledRect:](self, "_rangeForBodyRep:visibleUnscaledRect:", v16, x, y, width, height, v28);
        uint64_t v19 = v18;
        id v20 = [v16 storageContentNode];
        id v21 = [v20 cfiForRange:v17 storageUID:v19 includeFilename:[v20 nodeUniqueIDForInfo:[v16 storage]] pedantic:0];
        if (v21)
        {
          id v22 = v21;
          uint64_t v29 = 0;
          [v10 addCFIString:v21 error:&v29];
          if (v29)
          {
            v23 = BCReadingStatisticsLog();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v28;
              id v35 = v22;
              _os_log_error_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Error forming CFI from string %@", buf, 0xCu);
            }
          }
        }
      }
      id v13 = [a3 countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v13);
  }
  if ((objc_msgSend(v10, "isEqual:", -[THReadingStatisticsCollector visibleContent](self, "visibleContent")) & 1) == 0)
  {
    id v24 = [(BCCFISet *)[(THReadingStatisticsCollector *)self visibleContent] mutableCopy];
    [v24 subtractCFISet:v10];
    id v25 = [v10 mutableCopy];
    [v25 subtractCFISet:[self visibleContent]];
    if ((uint64_t)[v24 cfiCount] >= 1)
    {
      v26 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
        sub_2A0DF8(v24);
      }
      [(THReadingStatisticsCollectorDelegate *)[(THReadingStatisticsCollector *)self delegate] readingStatisticsCollector:self willHideContentWithCFIs:v24];
    }
    if ((uint64_t)[v25 cfiCount] >= 1)
    {
      v27 = BCReadingStatisticsLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_2A0D7C(v25);
      }
      [(THReadingStatisticsCollectorDelegate *)[(THReadingStatisticsCollector *)self delegate] readingStatisticsCollector:self didShowContentWithCFIs:v25];
    }

    [(THReadingStatisticsCollector *)self setVisibleContent:v10];
  }
}

- (void)scanReadingStatisticsWithDocumentRoot:(id)a3
{
  uint64_t v3 = 0;
  -[THReadingStatisticsCollector _scanReadingStatisticsWithNode:root:ordinal:level:childIndex:](self, "_scanReadingStatisticsWithNode:root:ordinal:level:childIndex:", [a3 rootNode], a3, &v3, 0, 0);
}

- (void)readingStatisticsScanOperation:(id)a3 addTextNodeCharacterCounts:(id)a4
{
  v7 = [(THReadingStatisticsCollector *)self delegate];
  id v8 = [a3 ordinal];

  [(THReadingStatisticsCollectorDelegate *)v7 readingStatisticsCollector:self addTextNodeCharacterCounts:a4 ordinal:v8 completion:0];
}

- (_NSRange)_rangeForBodyRep:(id)a3 visibleUnscaledRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v9 = objc_msgSend(objc_msgSend(a3, "storage"), "length");
  if (v9)
  {
    [a3 convertNaturalPointFromUnscaledCanvas:x, y];
    [a3 pinToNaturalBounds:1];
    double v11 = v10;
    double v13 = v12;
    v24.origin.double x = x;
    v24.origin.double y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v24);
    v25.origin.double x = x;
    v25.origin.double y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    [a3 convertNaturalPointFromUnscaledCanvas:MaxX CGRectGetMaxY(v25)];
    [a3 pinToNaturalBounds:1 andLastLineFragment:];
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = [a3 charIndexFromPoint:1 allowPastBreak:0 isAtEndOfLine:v11 v13];
    v9 = [a3 charIndexFromPoint:1 allowPastBreak:0 isAtEndOfLine:v16 v18];
    id v20 = v9;
    BOOL v21 = v19 > v9;
    if (v19 < v9) {
      v9 = v19;
    }
    if (v21) {
      id v20 = v19;
    }
    NSUInteger v22 = v20 - v9;
  }
  else
  {
    NSUInteger v22 = 0;
  }
  result.length = v22;
  result.location = (NSUInteger)v9;
  return result;
}

- (void)_scanReadingStatisticsWithNode:(id)a3 root:(id)a4 ordinal:(unint64_t *)a5 level:(int64_t)a6 childIndex:(int64_t)a7
{
  if (a3)
  {
    if (a5) {
      goto LABEL_3;
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THReadingStatisticsCollector _scanReadingStatisticsWithNode:root:ordinal:level:childIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/THReadingStatisticsCollector.m") lineNumber:144 description:@"invalid nil value for '%s'", "node"];
    if (a5) {
      goto LABEL_3;
    }
  }
  [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THReadingStatisticsCollector _scanReadingStatisticsWithNode:root:ordinal:level:childIndex:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/THReadingStatisticsCollector.m") lineNumber:145 description:@"invalid nil value for '%s'", "ordinal"];
LABEL_3:
  objc_opt_class();
  double v13 = (void *)TSUDynamicCast();
  objc_opt_class();
  uint64_t v14 = (void *)TSUDynamicCast();
  if (v13)
  {
    if (a6 == 2
      && !a7
      && [(THReadingStatisticsCollectorDelegate *)[(THReadingStatisticsCollector *)self delegate] readingStatisticsCollector:self needTextNodeCharacterCountsForOrdinal:*a5])
    {
      id v15 = [[a3 parent] nodeGUID];
      objc_opt_class();
      [a3 parent];
      double v16 = (void *)TSUDynamicCast();
      if (v16) {
        id v15 = [[[v16 childNodes] firstObject] nodeGUID];
      }
      double v17 = +[NSString stringWithFormat:@"#chapterguid(%@)", v15];
      double v18 = +[NSString stringWithFormat:@"epubcfi(/6/%ld!/2/1:0)", 2 * *a5 + 2];
      v26[0] = v17;
      v25[0] = kBCReadingStatisticsHrefKey;
      v25[1] = kBCReadingStatisticsNameKey;
      id v19 = [a3 title];
      v25[2] = kBCReadingStatisticsStartCFIKey;
      v26[1] = v19;
      v26[2] = v18;
      v27 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
      [(THReadingStatisticsCollectorDelegate *)[(THReadingStatisticsCollector *)self delegate] readingStatisticsCollector:self addTOCEntries:+[NSArray arrayWithObjects:&v27 count:1] ordinal:*a5 completion:0];
    }
    if ([self.delegate readingStatisticsCollector:self needTextNodeCharacterCountsForOrdinal:*a5]) {
    [[self chapterDataQueue] addOperation:[[THReadingStatisticsScanOperation alloc] initWithDelegate:self ordinal:*a5 applePubURL:[a4 zipPackage] documentEntryURI:[v13 applePubRelativePath]]];
}
    ++*a5;
    }
  }
  else
  {
    id v20 = v14;
    if (v14)
    {
      BOOL v21 = (char *)[v14 count];
      if (v21)
      {
        NSUInteger v22 = v21;
        v23 = 0;
        int64_t v24 = a6 + 1;
        do
        {
          -[THReadingStatisticsCollector _scanReadingStatisticsWithNode:root:ordinal:level:childIndex:](self, "_scanReadingStatisticsWithNode:root:ordinal:level:childIndex:", [v20 nodeAtIndex:v23], a4, a5, v24, v23);
          ++v23;
        }
        while (v22 != v23);
      }
    }
  }
}

- (THReadingStatisticsCollectorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THReadingStatisticsCollectorDelegate *)a3;
}

- (BCCFISet)visibleContent
{
  return self->_visibleContent;
}

- (void)setVisibleContent:(id)a3
{
}

- (NSOperationQueue)chapterDataQueue
{
  return self->_chapterDataQueue;
}

- (void)setChapterDataQueue:(id)a3
{
}

@end