@interface BKPaginationLayoutOperation
- (_NSRange)pageRangeForLocation:(id)a3;
- (id)cfiForAnnotation:(id)a3;
- (id)cfiForLocation:(id)a3;
- (id)chapterTitleForLocation:(id)a3;
- (id)layoutComplete:(unint64_t)a3;
- (id)locationForCfi:(id)a3;
- (id)newBookmarkPageArray;
- (id)newHistoryEntityResultsArray;
- (id)newLandmarkInfoAnchorArray;
- (id)newNavigationInfoAnchorArray;
- (id)newPageLocationArrayWithAnchorInfos:(id)a3;
- (id)newPhysicalPageAnchorArray;
- (id)pageTitleForLocation:(id)a3;
- (id)startCFIsForNavigationInfoHrefs:(id)a3;
- (id)text;
- (id)textNodeCharacterCounts;
- (unint64_t)pageOffsetForCFILocation:(id)a3;
- (unint64_t)pageOffsetForHref:(id)a3;
- (void)_populateTOCEntriesFromNavigationInfoAnchors:(id)a3;
- (void)execute;
- (void)populateRecordJob:(id)a3;
@end

@implementation BKPaginationLayoutOperation

- (id)newHistoryEntityResultsArray
{
  v3 = [(BKPaginationOperation *)self job];
  v4 = [v3 historyEntities];
  if (![v4 count]) {
    goto LABEL_15;
  }
  v22 = v4;
  id v23 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
      if ([(BKPaginationLayoutOperation *)self isCancelled]) {
        break;
      }
      v11 = [v10 location];
      id v12 = [v11 ordinal];
      unsigned int v13 = [v3 documentOrdinal];

      if (v12 == (id)(int)v13)
      {
        v14 = [v3 lookupKey];
        id v15 = [v10 pageForLookupKey:v14];

        if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v16 = [v10 location];
          id v17 = [(BKPaginationLayoutOperation *)self pageRangeForLocation:v16];

          if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v18 = [objc_alloc((Class)NSNumber) initWithInteger:v17];
            id v19 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:v18, @"pageOffset", v10, @"BKHistoryEntity", 0];
            [v23 addObject:v19];
          }
        }
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  v4 = v22;
  id v20 = v23;
  if (!v23) {
LABEL_15:
  }
    id v20 = objc_alloc_init((Class)NSArray);

  return v20;
}

- (id)newBookmarkPageArray
{
  v3 = [(BKPaginationOperation *)self job];
  v4 = [v3 bookmarks];
  id v5 = [v3 physicalPageAnchors];
  id v43 = [v5 count];

  if (![v4 count]) {
    goto LABEL_38;
  }
  v39 = v3;
  v37 = +[AEAnnotationProvider sharedInstance];
  id v6 = [v37 uiManagedObjectContext];
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v38 = v4;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v49;
    id v41 = v7;
    v42 = v6;
LABEL_4:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v49 != v10) {
        objc_enumerationMutation(obj);
      }
      uint64_t v12 = *(void *)(*((void *)&v48 + 1) + 8 * v11);
      if ([(BKPaginationLayoutOperation *)self isCancelled]) {
        goto LABEL_35;
      }
      v14 = [v6 existingObjectWithID:v12 error:0];
      id v15 = v14;
      if (v14)
      {
        if (([v14 isDeleted] & 1) == 0
          && ([v15 isAnnotationDeleted] & 1) == 0)
        {
          break;
        }
      }
LABEL_33:

      if (v9 == (id)++v11)
      {
        id v9 = [obj countByEnumeratingWithState:&v48 objects:v52 count:16];
        if (v9) {
          goto LABEL_4;
        }
        goto LABEL_35;
      }
    }
    v46 = [v15 annotationLocation];
    if (![v46 length]
      || (+[BCCFI unknownCFIString],
          v16 = objc_claimAutoreleasedReturnValue(),
          unsigned int v17 = [v46 isEqualToString:v16],
          v16,
          v17))
    {
      id v18 = [(BKPaginationLayoutOperation *)self cfiForAnnotation:v15];
      if ([v18 length]) {
        [v15 setAnnotationLocation:v18];
      }
    }
    id v19 = [v15 location];
    objc_opt_class();
    v45 = BUDynamicCast();
    unint64_t v44 = -[BKPaginationLayoutOperation pageOffsetForCFILocation:](self, "pageOffsetForCFILocation:");
    if (v43)
    {
      id v20 = [v15 physicalPageNumber];

      if (!v20)
      {
        v21 = [(BKPaginationLayoutOperation *)self pageTitleForLocation:v19];
        [v15 setPhysicalPageNumber:v21];
      }
    }
    v22 = [v15 plUserData];
    if (!v22)
    {
      id v23 = [v15 annotationLocation];

      if (!v23)
      {
LABEL_23:
        long long v26 = [v15 chapterTitle];

        if (!v26)
        {
          v40 = v19;
          uint64_t v27 = [(BKPaginationLayoutOperation *)self chapterTitleForLocation:v19];
          if (v27) {
            v28 = (__CFString *)v27;
          }
          else {
            v28 = &stru_1DF0D8;
          }
          v29 = [v15 chapterTitle];
          unsigned __int8 v30 = [(__CFString *)v28 isEqualToString:v29];

          if ((v30 & 1) == 0) {
            [v15 setChapterTitle:v28];
          }

          id v19 = v40;
          id v7 = v41;
        }
        if (v44 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v31 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v44, 1);
          id v32 = [objc_alloc((Class)NSDictionary) initWithObjectsAndKeys:v12, @"objectID", v31, @"range", 0, context];
          v33 = v19;
          v34 = v32;
          [v7 addObject:v32];

          id v19 = v33;
        }

        id v6 = v42;
        goto LABEL_33;
      }
      v22 = [v15 annotationLocation];
      [(BKPaginationLayoutOperation *)self locationForCfi:v22];
      v25 = long long v24 = v19;
      [v15 setLocation:v25];
      [v15 setAnnotationLocation:v22];

      id v19 = v24;
      id v7 = v41;
    }

    goto LABEL_23;
  }
LABEL_35:

  if ([v6 hasChanges]) {
    [v37 saveManagedObjectContext:v6];
  }

  v4 = v38;
  v3 = v39;
  if (!v7) {
LABEL_38:
  }
    id v7 = objc_alloc_init((Class)NSArray);

  return v7;
}

- (id)newPageLocationArrayWithAnchorInfos:(id)a3
{
  id v4 = a3;
  if (![v4 count]) {
    goto LABEL_16;
  }
  id v23 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v21 = v4;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    id v6 = v5;
    CFStringRef v7 = @"href";
    uint64_t v8 = *(void *)v25;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v25 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * v9);
      if ([(BKPaginationLayoutOperation *)self isCancelled]) {
        break;
      }
      uint64_t v11 = [v10 objectForKey:v7];
      unint64_t v12 = [(BKPaginationLayoutOperation *)self pageOffsetForHref:v11];
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = [objc_alloc((Class)NSNumber) initWithInteger:v12];
        CFStringRef v14 = v7;
        id v15 = objc_alloc((Class)NSDictionary);
        uint64_t v16 = [v10 objectForKey:@"name"];
        unsigned int v17 = (void *)v16;
        if (v16) {
          CFStringRef v18 = (const __CFString *)v16;
        }
        else {
          CFStringRef v18 = &stru_1DF0D8;
        }
        id v19 = [v15 initWithObjectsAndKeys:v11, @"fullHref", v18, @"name", v13, @"documentOffset", 0];

        [v23 addObject:v19];
        CFStringRef v7 = v14;
      }
      if (v6 == (id)++v9)
      {
        id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v6) {
          goto LABEL_4;
        }
        break;
      }
    }
  }

  id v4 = v21;
  if (!v23) {
LABEL_16:
  }
    id v23 = objc_alloc_init((Class)NSArray);

  return v23;
}

- (id)newNavigationInfoAnchorArray
{
  v3 = [(BKPaginationOperation *)self job];
  id v4 = [v3 navigationInfoAnchors];
  id v5 = [(BKPaginationLayoutOperation *)self newPageLocationArrayWithAnchorInfos:v4];

  return v5;
}

- (id)newLandmarkInfoAnchorArray
{
  v3 = [(BKPaginationOperation *)self job];
  id v4 = [v3 landmarkAnchors];
  id v5 = [(BKPaginationLayoutOperation *)self newPageLocationArrayWithAnchorInfos:v4];

  return v5;
}

- (id)newPhysicalPageAnchorArray
{
  v3 = [(BKPaginationOperation *)self job];
  id v4 = [v3 physicalPageAnchors];
  id v5 = [(BKPaginationLayoutOperation *)self newPageLocationArrayWithAnchorInfos:v4];

  return v5;
}

- (void)_populateTOCEntriesFromNavigationInfoAnchors:(id)a3
{
  id v4 = a3;
  id v5 = [(BKPaginationOperation *)self paginationOperationController];
  id v6 = [v5 delegate];

  CFStringRef v7 = [(BKPaginationOperation *)self job];
  uint64_t v8 = (int)[v7 documentOrdinal];
  if ([v6 needTOCEntriesForOrdinal:v8])
  {
    uint64_t v9 = [v4 bu_arrayByInvokingBlock:&stru_1DCAD8];
    [(BKPaginationLayoutOperation *)self startCFIsForNavigationInfoHrefs:v9];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_889C0;
    v12[3] = &unk_1DCB00;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = v13;
    uint64_t v11 = [v4 bu_arrayByInvokingBlock:v12];
    [v6 addTOCEntries:v11 ordinal:v8 completion:0];
  }
}

- (void)populateRecordJob:(id)a3
{
  id v4 = a3;
  id v5 = [(BKPaginationLayoutOperation *)self newNavigationInfoAnchorArray];
  [v4 setNavigationInfoAnchors:v5];

  id v6 = [(BKPaginationLayoutOperation *)self newLandmarkInfoAnchorArray];
  [v4 setLandmarkAnchors:v6];

  id v7 = [(BKPaginationLayoutOperation *)self newPhysicalPageAnchorArray];
  [v4 setPhysicalPageAnchors:v7];

  id v8 = [(BKPaginationLayoutOperation *)self newBookmarkPageArray];
  [v4 setBookmarks:v8];

  id v9 = [(BKPaginationLayoutOperation *)self newHistoryEntityResultsArray];
  [v4 setHistoryEntities:v9];
}

- (id)layoutComplete:(unint64_t)a3
{
  if ([(BKPaginationOperation *)self isJobGenerationValid])
  {
    if (a3 <= 1) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = a3;
    }
    id v6 = [(BKPaginationOperation *)self job];
    id v7 = -[BKPaginationJob init:]([BKPaginationRecordJob alloc], "init:", [v6 jobGeneration]);
    [v7 copyState:v6];
    [v7 setPageCount:v5];
    [(BKPaginationLayoutOperation *)self populateRecordJob:v7];
    uint64_t v8 = (int)[v6 documentOrdinal];
    id v9 = [v6 url];
    id v10 = [v9 baseURL];
    uint64_t v11 = [v10 absoluteString];
    unint64_t v12 = [v11 lastPathComponent];
    id v13 = +[BKTextIndex bookIndexWithName:v12];

    if (v13 && ([v13 containsTextUnitWithOrdinal:v8] & 1) == 0)
    {
      CFStringRef v14 = [(BKPaginationLayoutOperation *)self text];
      if ([v14 length]) {
        [v13 indexTextUnit:v14 withOrdinal:v8];
      }
    }
    id v15 = [v7 navigationInfoAnchors];
    [(BKPaginationLayoutOperation *)self _populateTOCEntriesFromNavigationInfoAnchors:v15];

    uint64_t v16 = [(BKPaginationOperation *)self paginationOperationController];
    unsigned int v17 = [v16 delegate];

    if ([v17 needTextNodeCharacterCountsForOrdinal:v8])
    {
      CFStringRef v18 = [(BKPaginationLayoutOperation *)self textNodeCharacterCounts];
      if (v18) {
        [v17 addTextNodeCharacterCounts:v18 ordinal:v8 completion:0];
      }
    }
    id v19 = [(BKPaginationOperation *)self paginationOperationController];
    [v19 addResultJob:v7];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (unint64_t)pageOffsetForHref:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (_NSRange)pageRangeForLocation:(id)a3
{
  NSUInteger v3 = 0x7FFFFFFFFFFFFFFFLL;
  NSUInteger v4 = 0x7FFFFFFFFFFFFFFFLL;
  result.length = v4;
  result.location = v3;
  return result;
}

- (unint64_t)pageOffsetForCFILocation:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)pageTitleForLocation:(id)a3
{
  return 0;
}

- (id)chapterTitleForLocation:(id)a3
{
  return 0;
}

- (id)cfiForLocation:(id)a3
{
  return 0;
}

- (id)cfiForAnnotation:(id)a3
{
  id v4 = a3;
  if ([v4 conformsToProtocol:&OBJC_PROTOCOL___BKBookmark])
  {
    unint64_t v5 = [v4 location];
    id v6 = [(BKPaginationLayoutOperation *)self cfiForLocation:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)locationForCfi:(id)a3
{
  return 0;
}

- (void)execute
{
  id v2 = [(BKPaginationLayoutOperation *)self layoutComplete:1];
}

- (id)text
{
  return 0;
}

- (id)textNodeCharacterCounts
{
  return 0;
}

- (id)startCFIsForNavigationInfoHrefs:(id)a3
{
  return 0;
}

@end