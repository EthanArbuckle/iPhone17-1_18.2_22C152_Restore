@interface THAnnotationCache
+ (id)annotationsOrderedForVisualStacking:(id)a3;
+ (id)sortAnnotationsByPageStorageRange:(id)a3;
- (BOOL)checkIfOneOrMoreAnnotationsForStorage:(id)a3 range:(_NSRange)a4 passesTest:(id)a5;
- (BOOL)hasAnnotationWithNoteInAbsolutePhysicalPageIndex:(unint64_t)a3;
- (BOOL)hasAnnotationWithNoteOnPageInfo:(id)a3;
- (BOOL)needsMigration;
- (BOOL)storage:(id)a3 containsSomeUnhighlightedTextInRange:(_NSRange)a4;
- (BOOL)storage:(id)a3 hasAnnotationInRange:(_NSRange)a4;
- (BOOL)storage:(id)a3 hasAnnotationStrictlyContainingRange:(_NSRange)a4;
- (BOOL)storage:(id)a3 hasAnnotationThatMatchesStyle:(int)a4 inRange:(_NSRange)a5;
- (BOOL)storage:(id)a3 hasAnnotationWithExactRange:(_NSRange)a4;
- (BOOL)storage:(id)a3 hasAnnotationWithNoteInRange:(_NSRange)a4;
- (NSArray)bookmarkAnnotations;
- (NSArray)orphanedAnnotations;
- (NSIndexSet)bookmarkAbsolutePhysicalPageIndexSet;
- (THAnnotation)temporaryAnnotation;
- (THAnnotationCache)initWithAnnotations:(id)a3 contentNode:(id)a4;
- (THAnnotationCache)initWithAnnotations:(id)a3 contentNode:(id)a4 needsMigration:(BOOL)a5;
- (THAnnotationCache)initWithAnnotationsByStorage:(id)a3 bookmarkAnnotations:(id)a4 orphanedAnnotations:(id)a5 needsMigration:(BOOL)a6 temporaryAnnotation:(id)a7 contentNode:(id)a8;
- (_NSRange)differenceRangeWithCache:(id)a3 storageUID:(id)a4;
- (id)annotationWithUUID:(id)a3;
- (id)annotationsForStorage:(id)a3;
- (id)annotationsForStorage:(id)a3 range:(_NSRange)a4;
- (id)annotationsForStorageUID:(id)a3;
- (id)bookmarkForAbsolutePhysicalPageIndex:(unint64_t)a3;
- (id)description;
- (id)highlightAnnotations;
- (id)highlightAnnotationsSortedByRange;
- (id)newAnnotationCacheWithRemovedAnnotation:(id)a3;
- (id)newAnnotationCacheWithTemporaryAnnotation:(id)a3;
- (id)newAnnotationCacheWithUpdatedAnnotation:(id)a3;
- (id)p_newBookmarkAbsolutePhysicalPageIndexSetFromBookmarks:(id)a3;
- (unint64_t)numberOfBookmarkAnnotations;
- (unint64_t)numberOfHighlightAnnotations;
- (unint64_t)numberOfOrphanedAnnotations;
- (void)dealloc;
- (void)enumerateAnnotationsForStorage:(id)a3 range:(_NSRange)a4 withBlock:(id)a5;
- (void)enumerateAnnotationsWithBlock:(id)a3;
- (void)p_updateAnnotationsByStorage:(id)a3 byAddingAnnotation:(id)a4 storageUUID:(id)a5;
- (void)p_updateAnnotationsByStorage:(id)a3 byRemovingAnnotation:(id)a4 storageUUID:(id)a5;
@end

@implementation THAnnotationCache

- (THAnnotationCache)initWithAnnotationsByStorage:(id)a3 bookmarkAnnotations:(id)a4 orphanedAnnotations:(id)a5 needsMigration:(BOOL)a6 temporaryAnnotation:(id)a7 contentNode:(id)a8
{
  v26.receiver = self;
  v26.super_class = (Class)THAnnotationCache;
  v14 = [(THAnnotationCache *)&v26 init];
  v15 = v14;
  if (v14)
  {
    v14->_contentNode = (THModelContentNode *)a8;
    v14->_annotationsByStorage = (NSDictionary *)[a3 copy];
    v15->_bookmarkAnnotations = (NSArray *)[a4 copy];
    v15->_orphanedAnnotations = (NSArray *)[a5 copy];
    v15->_temporaryAnnotation = (THAnnotation *)a7;
    v15->_bookmarkAbsolutePhysicalPageIndexSet = (NSIndexSet *)[(THAnnotationCache *)v15 p_newBookmarkAbsolutePhysicalPageIndexSetFromBookmarks:v15->_bookmarkAnnotations];
    v15->_needsMigration = a6;
    v15->_numberOfHighlightAnnotations = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v16 = [a3 objectEnumerator];
    id v17 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          v15->_numberOfHighlightAnnotations += (unint64_t)[*(id *)(*((void *)&v22 + 1) + 8 * i) count];
        }
        id v18 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v18);
    }
    v15->_numberOfBookmarkAnnotations = [(NSArray *)v15->_bookmarkAnnotations count];
    v15->_numberOfOrphanedAnnotations = [(NSArray *)v15->_orphanedAnnotations count];
  }
  __dmb(0xBu);
  return v15;
}

- (THAnnotationCache)initWithAnnotations:(id)a3 contentNode:(id)a4
{
  return [(THAnnotationCache *)self initWithAnnotations:a3 contentNode:a4 needsMigration:0];
}

- (THAnnotationCache)initWithAnnotations:(id)a3 contentNode:(id)a4 needsMigration:(BOOL)a5
{
  v41.receiver = self;
  v41.super_class = (Class)THAnnotationCache;
  v8 = [(THAnnotationCache *)&v41 init];
  v9 = v8;
  if (!v8) {
    return v9;
  }
  v8->_contentNode = (THModelContentNode *)a4;
  id v10 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:[a3 count]];
  id v31 = objc_alloc_init((Class)NSMutableArray);
  id v32 = objc_alloc_init((Class)NSMutableArray);
  v28 = v9;
  v9->_numberOfBookmarkAnnotations = 0;
  p_numberOfBookmarkAnnotations = &v9->_numberOfBookmarkAnnotations;
  *(p_numberOfBookmarkAnnotations - 1) = 0;
  v29 = p_numberOfBookmarkAnnotations - 1;
  v30 = p_numberOfBookmarkAnnotations;
  p_numberOfBookmarkAnnotations[1] = 0;
  v12 = p_numberOfBookmarkAnnotations + 1;
  *((unsigned char *)p_numberOfBookmarkAnnotations - 16) = a5;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = [a3 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (!v13) {
    goto LABEL_15;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v38;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v38 != v15) {
        objc_enumerationMutation(a3);
      }
      id v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      id v18 = v32;
      uint64_t v19 = v12;
      if (([v17 annotationIsOrphan] & 1) == 0)
      {
        uint64_t v19 = v30;
        id v18 = v31;
        if (([v17 annotationIsBookmark] & 1) == 0)
        {
          if ([v17 annotationType] != 2) {
            continue;
          }
          id v20 = [v17 annotationStorageUID];
          id v18 = [v10 objectForKey:v20];
          uint64_t v19 = v29;
          if (!v18)
          {
            id v18 = +[NSMutableArray array];
            [v10 setObject:v18 forKey:v20];
            uint64_t v19 = v29;
          }
        }
      }
      [v18 addObject:v17];
      ++*v19;
    }
    id v14 = [a3 countByEnumeratingWithState:&v37 objects:v43 count:16];
  }
  while (v14);
LABEL_15:
  id v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v22 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v21, "setObject:forKey:", objc_msgSend(objc_msgSend(v10, "objectForKey:", *(void *)(*((void *)&v33 + 1) + 8 * (void)j)), "sortedArrayWithOptions:usingComparator:", 1, &stru_45AC18), *(void *)(*((void *)&v33 + 1) + 8 * (void)j));
      }
      id v23 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v23);
  }
  id v26 = [v31 sortedArrayWithOptions:1 usingComparator:&stru_45AC38];
  v9 = v28;
  v28->_annotationsByStorage = (NSDictionary *)[v21 copy];
  v28->_bookmarkAnnotations = (NSArray *)[v26 copy];
  v28->_orphanedAnnotations = (NSArray *)[v32 copy];
  v28->_bookmarkAbsolutePhysicalPageIndexSet = (NSIndexSet *)[(THAnnotationCache *)v28 p_newBookmarkAbsolutePhysicalPageIndexSetFromBookmarks:v28->_bookmarkAnnotations];

  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THAnnotationCache;
  [(THAnnotationCache *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:@"<%@=%p annotationsByStorage=%@>", NSStringFromClass(v3), self, self->_annotationsByStorage];
}

- (id)p_newBookmarkAbsolutePhysicalPageIndexSetFromBookmarks:(id)a3
{
  id result = [a3 count];
  if (result)
  {
    id v5 = +[NSMutableIndexSet indexSet];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(a3);
          }
          id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) annotationAbsolutePhysicalPageIndex];
          if (v10 != (id)0x7FFFFFFFFFFFFFFFLL) {
            [v5 addIndex:v10];
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    return [v5 copy];
  }
  return result;
}

- (id)bookmarkForAbsolutePhysicalPageIndex:(unint64_t)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  bookmarkAnnotations = self->_bookmarkAnnotations;
  id v5 = [(NSArray *)bookmarkAnnotations countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v12;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v12 != v7) {
      objc_enumerationMutation(bookmarkAnnotations);
    }
    v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
    if ([v9 annotationAbsolutePhysicalPageIndex] == (id)a3) {
      return v9;
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSArray *)bookmarkAnnotations countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)hasAnnotationWithNoteInAbsolutePhysicalPageIndex:(unint64_t)a3
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [(NSDictionary *)self->_annotationsByStorage objectEnumerator];
  id v5 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v17;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v17 != v12) {
                objc_enumerationMutation(v9);
              }
              long long v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)j);
              if ([v14 annotationAbsolutePhysicalPageIndex] == (id)a3
                && objc_msgSend(objc_msgSend(v14, "annotationNote"), "length"))
              {
                LOBYTE(v5) = 1;
                return (char)v5;
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
      }
      id v6 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
      LOBYTE(v5) = 0;
    }
    while (v6);
  }
  return (char)v5;
}

- (BOOL)hasAnnotationWithNoteOnPageInfo:(id)a3
{
  id v4 = [a3 bodyStorageRange];
  if (NSInvalidRange[0] == v4 && NSInvalidRange[1] == v5)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache hasAnnotationWithNoteOnPageInfo:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m") lineNumber:356 description:@"Invalid range."];
    LOBYTE(v10) = 0;
  }
  else
  {
    NSUInteger v7 = (NSUInteger)v4;
    NSUInteger v8 = (NSUInteger)v5;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    v9 = [(NSDictionary *)self->_annotationsByStorage objectEnumerator];
    id v10 = [(NSEnumerator *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v28;
      uint64_t v22 = *(void *)v28;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v24;
            while (2)
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v24 != v17) {
                  objc_enumerationMutation(v14);
                }
                long long v19 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
                v34.location = (NSUInteger)[v19 annotationStorageRange];
                v34.length = v20;
                v33.location = v7;
                v33.length = v8;
                if (NSIntersectionRange(v33, v34).length && objc_msgSend(objc_msgSend(v19, "annotationNote"), "length"))
                {
                  LOBYTE(v10) = 1;
                  return (char)v10;
                }
              }
              id v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }
          uint64_t v12 = v22;
        }
        id v11 = [(NSEnumerator *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
        LOBYTE(v10) = 0;
      }
      while (v11);
    }
  }
  return (char)v10;
}

- (id)annotationsForStorageUID:(id)a3
{
  if (a3) {
    return -[NSDictionary objectForKey:](self->_annotationsByStorage, "objectForKey:");
  }
  else {
    return 0;
  }
}

- (id)annotationsForStorage:(id)a3
{
  id result = [(THModelContentNode *)self->_contentNode annotationIDForInfo:a3];
  if (result)
  {
    id v5 = result;
    annotationsByStorage = self->_annotationsByStorage;
    return [(NSDictionary *)annotationsByStorage objectForKey:v5];
  }
  return result;
}

- (id)annotationsForStorage:(id)a3 range:(_NSRange)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1C4D50;
  v5[3] = &unk_459C70;
  _NSRange v6 = a4;
  return [self annotationsForStorage:a3] tsu_arrayOfObjectsPassingTest:v5];
}

- (id)annotationWithUUID:(id)a3
{
  int64_t annotationsByUUIDOnceToken = self->_annotationsByUUIDOnceToken;
  p_int64_t annotationsByUUIDOnceToken = &self->_annotationsByUUIDOnceToken;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C4E34;
  block[3] = &unk_456DE0;
  block[4] = self;
  if (annotationsByUUIDOnceToken == -1)
  {
    if (a3) {
      return [(NSDictionary *)self->_annotationsByUUID objectForKey:a3];
    }
  }
  else
  {
    dispatch_once(p_annotationsByUUIDOnceToken, block);
    if (a3) {
      return [(NSDictionary *)self->_annotationsByUUID objectForKey:a3];
    }
  }
  return 0;
}

- (id)newAnnotationCacheWithUpdatedAnnotation:(id)a3
{
  id v5 = [a3 annotationStorageUID];
  if ([a3 annotationIsOrphan])
  {
    orphanedAnnotations = (NSArray *)[(NSArray *)self->_orphanedAnnotations mutableCopy];
    [(NSArray *)orphanedAnnotations addObject:a3];
    NSUInteger v7 = [THAnnotationCache alloc];
    annotationsByStorage = self->_annotationsByStorage;
    bookmarkAnnotations = self->_bookmarkAnnotations;
    id v10 = orphanedAnnotations;
    goto LABEL_12;
  }
  if (![a3 annotationIsBookmark])
  {
    if ([a3 annotationIsPlaceholder])
    {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationCache newAnnotationCacheWithUpdatedAnnotation:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"] lineNumber:485 description:@"annotation cache doesn't support placeholder annotations"];
    }
    else if (v5)
    {
      annotationsByStorage = (NSDictionary *)[(NSDictionary *)self->_annotationsByStorage mutableCopy];
      [(THAnnotationCache *)self p_updateAnnotationsByStorage:annotationsByStorage byAddingAnnotation:a3 storageUUID:v5];
      NSUInteger v7 = [THAnnotationCache alloc];
      bookmarkAnnotations = self->_bookmarkAnnotations;
      orphanedAnnotations = self->_orphanedAnnotations;
      id v10 = annotationsByStorage;
      goto LABEL_12;
    }
LABEL_13:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache newAnnotationCacheWithUpdatedAnnotation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m") lineNumber:503 description:@"failed to update annotation cache"];
    return 0;
  }
  id v10 = [(NSArray *)self->_bookmarkAnnotations mutableCopy];
  id v11 = [v10 indexOfObject:a3];
  if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
    [v10 addObject:a3];
  }
  else {
    [v10 replaceObjectAtIndex:v11 withObject:a3];
  }
  bookmarkAnnotations = (NSArray *)[v10 sortedArrayWithOptions:1 usingComparator:&stru_45AC58];
  NSUInteger v7 = [THAnnotationCache alloc];
  annotationsByStorage = self->_annotationsByStorage;
  orphanedAnnotations = self->_orphanedAnnotations;
LABEL_12:
  uint64_t v12 = [(THAnnotationCache *)v7 initWithAnnotationsByStorage:annotationsByStorage bookmarkAnnotations:bookmarkAnnotations orphanedAnnotations:orphanedAnnotations needsMigration:self->_needsMigration temporaryAnnotation:self->_temporaryAnnotation contentNode:self->_contentNode];

  if (!v12) {
    goto LABEL_13;
  }
  return v12;
}

- (id)newAnnotationCacheWithRemovedAnnotation:(id)a3
{
  id v5 = [a3 annotationStorageUID];
  if ([a3 annotationIsOrphan])
  {
    orphanedAnnotations = (NSArray *)[(NSArray *)self->_orphanedAnnotations mutableCopy];
    id v7 = [(NSArray *)orphanedAnnotations indexOfObject:a3];
    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:+[NSString stringWithUTF8String:@"-[THAnnotationCache newAnnotationCacheWithRemovedAnnotation:]"] file:+[NSString stringWithUTF8String:@"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"] lineNumber:523 description:@"orphan annotation not found"];
    }
    else {
      [(NSArray *)orphanedAnnotations removeObjectAtIndex:v7];
    }
    id v10 = [THAnnotationCache alloc];
    annotationsByStorage = self->_annotationsByStorage;
    bookmarkAnnotations = self->_bookmarkAnnotations;
    id v8 = orphanedAnnotations;
  }
  else
  {
    if (![a3 annotationIsBookmark])
    {
      if ([a3 annotationIsPlaceholder])
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache newAnnotationCacheWithRemovedAnnotation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m") lineNumber:563 description:@"annotation cache doesn't support placeholder annotations"];
      }
      else if (v5)
      {
        annotationsByStorage = (NSDictionary *)[(NSDictionary *)self->_annotationsByStorage mutableCopy];
        [(THAnnotationCache *)self p_updateAnnotationsByStorage:annotationsByStorage byRemovingAnnotation:a3 storageUUID:v5];
        id v10 = [THAnnotationCache alloc];
        bookmarkAnnotations = self->_bookmarkAnnotations;
        orphanedAnnotations = self->_orphanedAnnotations;
        id v8 = annotationsByStorage;
        goto LABEL_15;
      }
LABEL_16:
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationCache newAnnotationCacheWithRemovedAnnotation:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m"] lineNumber:581 description:@"failed to update annotation cache"];
      return 0;
    }
    id v8 = [(NSArray *)self->_bookmarkAnnotations mutableCopy];
    id v9 = [v8 indexOfObject:a3];
    if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache newAnnotationCacheWithRemovedAnnotation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m") lineNumber:545 description:@"annotation not found"];
    }
    else {
      [v8 removeObjectAtIndex:v9];
    }
    bookmarkAnnotations = (NSArray *)[v8 sortedArrayWithOptions:1 usingComparator:&stru_45AC78];
    id v10 = [THAnnotationCache alloc];
    annotationsByStorage = self->_annotationsByStorage;
    orphanedAnnotations = self->_orphanedAnnotations;
  }
LABEL_15:
  long long v13 = [(THAnnotationCache *)v10 initWithAnnotationsByStorage:annotationsByStorage bookmarkAnnotations:bookmarkAnnotations orphanedAnnotations:orphanedAnnotations needsMigration:self->_needsMigration temporaryAnnotation:self->_temporaryAnnotation contentNode:self->_contentNode];

  if (!v13) {
    goto LABEL_16;
  }
  return v13;
}

- (void)p_updateAnnotationsByStorage:(id)a3 byAddingAnnotation:(id)a4 storageUUID:(id)a5
{
  id v8 = (NSArray *)[a3 objectForKey:a5];
  if (!v8) {
    id v8 = +[NSArray array];
  }
  id v10 = [(NSArray *)v8 mutableCopy];
  id v9 = [v10 indexOfObject:a4];
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL) {
    [v10 addObject:a4];
  }
  else {
    [v10 replaceObjectAtIndex:v9 withObject:a4];
  }
  [a3 setObject:[v10 sortedArrayWithOptions:1 usingComparator:&stru_45AC98] forKey:a5];
}

- (void)p_updateAnnotationsByStorage:(id)a3 byRemovingAnnotation:(id)a4 storageUUID:(id)a5
{
  id v8 = (NSArray *)[a3 objectForKey:a5];
  if (!v8) {
    id v8 = +[NSArray array];
  }
  id v10 = [(NSArray *)v8 mutableCopy];
  id v9 = [v10 indexOfObject:a4];
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache p_updateAnnotationsByStorage:byRemovingAnnotation:storageUUID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m") lineNumber:626 description:@"could not find annotation for removal: %@", a4];
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationCache p_updateAnnotationsByStorage:byRemovingAnnotation:storageUUID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationCache.m") lineNumber:633 description:@"annotation not found"];
  }
  else
  {
    [v10 removeObjectAtIndex:v9];
  }
  [a3 setObject:[v10 sortedArrayWithOptions:1 usingComparator:&stru_45ACB8] forKey:a5];
}

- (id)newAnnotationCacheWithTemporaryAnnotation:(id)a3
{
  if ([(THAnnotationCache *)self temporaryAnnotation] == a3)
  {
    return self;
  }
  else
  {
    id v4 = [(NSDictionary *)self->_annotationsByStorage mutableCopy];
    temporaryAnnotation = self->_temporaryAnnotation;
    if (temporaryAnnotation) {
      [(THAnnotationCache *)self p_updateAnnotationsByStorage:v4 byRemovingAnnotation:temporaryAnnotation storageUUID:[(THAnnotation *)self->_temporaryAnnotation annotationStorageUID]];
    }
    if (a3) {
      -[THAnnotationCache p_updateAnnotationsByStorage:byAddingAnnotation:storageUUID:](self, "p_updateAnnotationsByStorage:byAddingAnnotation:storageUUID:", v4, a3, [a3 annotationStorageUID]);
    }
    _NSRange v6 = [[THAnnotationCache alloc] initWithAnnotationsByStorage:v4 bookmarkAnnotations:self->_bookmarkAnnotations orphanedAnnotations:self->_orphanedAnnotations needsMigration:self->_needsMigration temporaryAnnotation:a3 contentNode:self->_contentNode];

    return v6;
  }
}

- (_NSRange)differenceRangeWithCache:(id)a3 storageUID:(id)a4
{
  id v6 = [(THAnnotationCache *)self annotationsForStorageUID:a4];
  id v7 = [a3 annotationsForStorageUID:a4];
  id v8 = (char *)[v6 count];
  v52 = v7;
  id v9 = (char *)[v7 count];
  id v11 = v9;
  if (!v8)
  {
    id v12 = 0;
    if (v9) {
      goto LABEL_3;
    }
LABEL_29:
    uint64_t v14 = 0;
    uint64_t v18 = 0;
    BOOL v15 = 1;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_31;
  }
  id v12 = [v6 objectAtIndex:0];
  if (!v11) {
    goto LABEL_29;
  }
LABEL_3:
  id v13 = [v7 objectAtIndex:0];
  uint64_t v14 = 0;
  BOOL v15 = 1;
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12)
  {
    id v17 = v13;
    uint64_t v18 = 0;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    BOOL v20 = 1;
    BOOL v21 = 1;
    if (v13)
    {
      uint64_t v18 = 0;
      uint64_t v14 = 0;
      do
      {
        if (sub_1C5E60(v12, v17))
        {
          if (++v14 >= (unint64_t)v8) {
            id v12 = 0;
          }
          else {
            id v12 = [v6 objectAtIndex:v14];
          }
          if (++v18 >= (unint64_t)v11) {
            id v17 = 0;
          }
          else {
            id v17 = [v7 objectAtIndex:v18];
          }
          uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
          uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          uint64_t v16 = v18;
          uint64_t v19 = v14;
        }
        BOOL v15 = v19 == 0x7FFFFFFFFFFFFFFFLL;
        BOOL v20 = v16 == 0x7FFFFFFFFFFFFFFFLL;
        BOOL v21 = v16 == 0x7FFFFFFFFFFFFFFFLL && v19 == 0x7FFFFFFFFFFFFFFFLL;
      }
      while (v21 && v12 != 0 && v17 != 0);
    }
    if (!v21) {
      goto LABEL_34;
    }
    goto LABEL_32;
  }
  uint64_t v18 = 0;
LABEL_31:
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v20 = 1;
LABEL_32:
  if (v8 == v11)
  {
    NSUInteger v24 = 0;
    NSUInteger v25 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_62:
    NSUInteger v40 = v25;
    NSUInteger v41 = v24;
    goto LABEL_91;
  }
LABEL_34:
  if (v8 <= v11) {
    BOOL v15 = 0;
  }
  if (v15)
  {
    uint64_t v26 = (uint64_t)(v8 - 1);
    uint64_t v19 = v14;
  }
  else
  {
    if (!v20)
    {
      NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
      if (v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger length = 0;
        uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v18 = v16;
        goto LABEL_55;
      }
      int v30 = 1;
      uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
      if (v8 && v11)
      {
        uint64_t v44 = (uint64_t)(v11 - 1);
        v45 = v8 - 1;
        do
        {
          unsigned int v46 = sub_1C5E60([v6 objectAtIndex:v45], [v52 objectAtIndex:v44]);
          if (v46) {
            uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v26 = (uint64_t)v45;
          }
          if (v46) {
            uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v28 = v44;
          }
          BOOL v47 = v45-- != 0;
          int v48 = v47;
          BOOL v47 = v44-- != 0;
          char v49 = v47;
          BOOL v51 = v26 != 0x7FFFFFFFFFFFFFFFLL || v28 != 0x7FFFFFFFFFFFFFFFLL || v48 == 0;
        }
        while (!v51 && (v49 & 1) != 0);
      }
      else
      {
        uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
      }
      goto LABEL_45;
    }
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 > v8)
    {
      NSUInteger length = 0;
      NSUInteger v24 = 0;
      uint64_t v28 = (uint64_t)(v11 - 1);
      NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger v25 = 0x7FFFFFFFFFFFFFFFLL;
      if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_58;
      }
      goto LABEL_55;
    }
  }
  int v30 = 0;
  uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger length = 0;
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    NSUInteger location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_46;
  }
  uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_45:
  NSUInteger location = (NSUInteger)objc_msgSend(objc_msgSend(v6, "objectAtIndex:", v19), "annotationStorageRange");
  NSUInteger length = v31;
  uint64_t v18 = v16;
LABEL_46:
  if (v26 != 0x7FFFFFFFFFFFFFFFLL && v19 != v26)
  {
    id v32 = [[v6 objectAtIndex:v26] annotationStorageRange];
    v10.NSUInteger location = (NSUInteger)v32;
    v10.NSUInteger length = v33;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v54.NSUInteger location = location;
      v54.NSUInteger length = length;
      NSRange v34 = NSUnionRange(v54, v10);
      NSUInteger location = v34.location;
      NSUInteger length = v34.length;
      uint64_t v26 = v18;
      NSUInteger v25 = v34.location;
      NSUInteger v24 = v34.length;
      if ((v30 & 1) == 0) {
        goto LABEL_58;
      }
      goto LABEL_55;
    }
    NSUInteger location = (NSUInteger)v32;
    NSUInteger length = v33;
  }
  uint64_t v26 = v18;
  NSUInteger v25 = location;
  NSUInteger v24 = length;
  if (!v30) {
    goto LABEL_58;
  }
LABEL_55:
  NSUInteger v25 = (NSUInteger)objc_msgSend(objc_msgSend(v52, "objectAtIndex:", v18, v10.length), "annotationStorageRange");
  NSUInteger v24 = v35;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v55.NSUInteger location = location;
    v55.NSUInteger length = length;
    v57.NSUInteger location = v25;
    v57.NSUInteger length = v24;
    NSRange v36 = NSUnionRange(v55, v57);
    NSUInteger v25 = v36.location;
    NSUInteger v24 = v36.length;
  }
  uint64_t v26 = v18;
LABEL_58:
  if (v28 == 0x7FFFFFFFFFFFFFFFLL || v26 == v28) {
    goto LABEL_62;
  }
  id v37 = [[v52 objectAtIndex:v28] annotationStorageRange];
  v39.NSUInteger location = (NSUInteger)v37;
  v39.NSUInteger length = v38;
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v25 = (NSUInteger)v37;
    NSUInteger v24 = v38;
    goto LABEL_62;
  }
  v42.NSUInteger location = v25;
  v42.NSUInteger length = v24;

  NSRange v43 = NSUnionRange(v42, v39);
  NSUInteger v41 = v43.length;
  NSUInteger v40 = v43.location;
LABEL_91:
  result.NSUInteger length = v41;
  result.NSUInteger location = v40;
  return result;
}

- (void)enumerateAnnotationsForStorage:(id)a3 range:(_NSRange)a4 withBlock:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = -[THAnnotationCache annotationsForStorage:](self, "annotationsForStorage:", a3, 0);
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v18 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
      id v14 = [v13 annotationStorageRange];
      if (location + length <= (unint64_t)v14) {
        break;
      }
      v23.NSUInteger location = (NSUInteger)v14;
      v23.NSUInteger length = v15;
      v22.NSUInteger location = location;
      v22.NSUInteger length = length;
      NSRange v16 = NSIntersectionRange(v22, v23);
      if (a5)
      {
        if (v16.length) {
          (*((void (**)(id, void *))a5 + 2))(a5, v13);
        }
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          goto LABEL_3;
        }
        return;
      }
    }
  }
}

- (BOOL)checkIfOneOrMoreAnnotationsForStorage:(id)a3 range:(_NSRange)a4 passesTest:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = [(THAnnotationCache *)self annotationsForStorage:a3];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v9) {
    return 0;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v21;
  NSUInteger v12 = location + length;
LABEL_3:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v21 != v11) {
      objc_enumerationMutation(v8);
    }
    id v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
    id v15 = [v14 annotationStorageRange];
    BOOL v17 = v12 > (unint64_t)v15;
    if (v12 <= (unint64_t)v15) {
      return v17;
    }
    v26.NSUInteger location = (NSUInteger)v15;
    v26.NSUInteger length = v16;
    v25.NSUInteger location = location;
    v25.NSUInteger length = length;
    NSRange v18 = NSIntersectionRange(v25, v26);
    if (a5)
    {
      if (v18.length && ((*((uint64_t (**)(id, void *))a5 + 2))(a5, v14) & 1) != 0) {
        return v17;
      }
    }
    if (v10 == (id)++v13)
    {
      id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v10) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (void)enumerateAnnotationsWithBlock:(id)a3
{
  if (a3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    obj = self->_annotationsByStorage;
    id v5 = [(NSDictionary *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = [(NSDictionary *)self->_annotationsByStorage objectForKey:*(void *)(*((void *)&v19 + 1) + 8 * (void)v8)];
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v10 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v16;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v16 != v12) {
                  objc_enumerationMutation(v9);
                }
                (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v15 + 1) + 8 * (void)v13));
                uint64_t v13 = (char *)v13 + 1;
              }
              while (v11 != v13);
              id v11 = [v9 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v11);
          }
          id v8 = (char *)v8 + 1;
        }
        while (v8 != v6);
        id v6 = [(NSDictionary *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }
  }
}

- (id)highlightAnnotations
{
  objc_super v3 = +[NSMutableArray arrayWithCapacity:self->_numberOfHighlightAnnotations];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSDictionary *)self->_annotationsByStorage objectEnumerator];
  id v5 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableArray *)v3 addObjectsFromArray:*(void *)(*((void *)&v10 + 1) + 8 * (void)v8)];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (BOOL)storage:(id)a3 hasAnnotationWithNoteInRange:(_NSRange)a4
{
  return -[THAnnotationCache checkIfOneOrMoreAnnotationsForStorage:range:passesTest:](self, "checkIfOneOrMoreAnnotationsForStorage:range:passesTest:", a3, a4.location, a4.length, &stru_45ACF8);
}

- (BOOL)storage:(id)a3 hasAnnotationInRange:(_NSRange)a4
{
  return -[THAnnotationCache checkIfOneOrMoreAnnotationsForStorage:range:passesTest:](self, "checkIfOneOrMoreAnnotationsForStorage:range:passesTest:", a3, a4.location, a4.length, &stru_45AD18);
}

- (BOOL)storage:(id)a3 hasAnnotationStrictlyContainingRange:(_NSRange)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1C6514;
  v5[3] = &unk_45AD38;
  _NSRange v6 = a4;
  return -[THAnnotationCache checkIfOneOrMoreAnnotationsForStorage:range:passesTest:](self, "checkIfOneOrMoreAnnotationsForStorage:range:passesTest:", a3, a4.location, a4.length, v5);
}

- (BOOL)storage:(id)a3 hasAnnotationWithExactRange:(_NSRange)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1C65DC;
  v5[3] = &unk_45AD38;
  _NSRange v6 = a4;
  return -[THAnnotationCache checkIfOneOrMoreAnnotationsForStorage:range:passesTest:](self, "checkIfOneOrMoreAnnotationsForStorage:range:passesTest:", a3, a4.location, a4.length, v5);
}

- (BOOL)storage:(id)a3 hasAnnotationThatMatchesStyle:(int)a4 inRange:(_NSRange)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1C6690;
  v6[3] = &unk_45AD58;
  _NSRange v7 = a5;
  int v8 = a4;
  return -[THAnnotationCache checkIfOneOrMoreAnnotationsForStorage:range:passesTest:](self, "checkIfOneOrMoreAnnotationsForStorage:range:passesTest:", a3, a5.location, a5.length, v6);
}

- (BOOL)storage:(id)a3 containsSomeUnhighlightedTextInRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v11 = 0;
  long long v12 = (NSRange *)&v11;
  uint64_t v13 = 0x3010000000;
  id v14 = &unk_41622E;
  long long v15 = xmmword_3447B0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1C67E4;
  v10[3] = &unk_45AD80;
  v10[4] = &v11;
  -[THAnnotationCache enumerateAnnotationsForStorage:range:withBlock:](self, "enumerateAnnotationsForStorage:range:withBlock:", a3, a4.location, a4.length, v10);
  v16.NSUInteger location = location;
  v16.NSUInteger length = length;
  NSRange v6 = NSIntersectionRange(v16, v12[2]);
  BOOL v8 = location != v6.location || length != v6.length;
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (id)highlightAnnotationsSortedByRange
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:self->_numberOfHighlightAnnotations];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSDictionary *)self->_annotationsByStorage objectEnumerator];
  id v5 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      BOOL v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v11 + 1) + 8 * (void)v8)];
        BOOL v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSEnumerator *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  id v9 = [v3 sortedArrayWithOptions:1 usingComparator:&stru_45ADA0];

  return v9;
}

+ (id)annotationsOrderedForVisualStacking:(id)a3
{
  return [a3 sortedArrayUsingComparator:&stru_45ADC0];
}

+ (id)sortAnnotationsByPageStorageRange:(id)a3
{
  return [a3 sortedArrayWithOptions:1 usingComparator:&stru_45ADE0];
}

- (BOOL)needsMigration
{
  return self->_needsMigration;
}

- (unint64_t)numberOfHighlightAnnotations
{
  return self->_numberOfHighlightAnnotations;
}

- (unint64_t)numberOfBookmarkAnnotations
{
  return self->_numberOfBookmarkAnnotations;
}

- (unint64_t)numberOfOrphanedAnnotations
{
  return self->_numberOfOrphanedAnnotations;
}

- (THAnnotation)temporaryAnnotation
{
  return self->_temporaryAnnotation;
}

- (NSArray)bookmarkAnnotations
{
  return self->_bookmarkAnnotations;
}

- (NSArray)orphanedAnnotations
{
  return self->_orphanedAnnotations;
}

- (NSIndexSet)bookmarkAbsolutePhysicalPageIndexSet
{
  return self->_bookmarkAbsolutePhysicalPageIndexSet;
}

@end