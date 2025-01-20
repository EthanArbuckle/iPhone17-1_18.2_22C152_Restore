@interface THAnnotationChangeList
- (BOOL)isEmpty;
- (NSArray)changedContentNodeIDs;
- (id)addedAnnotationUUIDsForContentNodeID:(id)a3;
- (id)changedAnnotationUUIDsForContentNodeID:(id)a3;
- (id)deletedAnnotationUUIDsForContentNodeID:(id)a3;
- (void)dealloc;
- (void)registerAnnotationAddedWithUUID:(id)a3 toContentNodeWithID:(id)a4;
- (void)registerAnnotationChangedWithUUID:(id)a3 inContentNodeWithID:(id)a4;
- (void)registerAnnotationDeletedWithUUID:(id)a3 fromContentNodeWithID:(id)a4;
@end

@implementation THAnnotationChangeList

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THAnnotationChangeList;
  [(THAnnotationChangeList *)&v3 dealloc];
}

- (void)registerAnnotationAddedWithUUID:(id)a3 toContentNodeWithID:(id)a4
{
  if (!a3)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"] lineNumber:36 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"annotationUUID"]];
    if (a4) {
      return;
    }
    goto LABEL_16;
  }
  if (!a4)
  {
LABEL_16:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:37 description:@"invalid nil value for '%s'", "contentNodeID"];
    return;
  }
  v6 = +[TSUPair pairWithFirst:second:](TSUPair, "pairWithFirst:second:");
  if ([(NSMutableSet *)self->_addedAnnotations containsObject:v6]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:43 description:@"annotation shouldn't be added more than once"];
  }
  addedAnnotations = self->_addedAnnotations;
  if (!addedAnnotations)
  {
    addedAnnotations = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_addedAnnotations = addedAnnotations;
  }
  [(NSMutableSet *)addedAnnotations addObject:v6];
  [(NSMutableSet *)self->_deletedAnnotations removeObject:v6];
  if (([(NSMutableSet *)self->_addedAnnotations containsObject:v6] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:55 description:@"added annotation should be added"];
  }
  if ([(NSMutableSet *)self->_deletedAnnotations containsObject:v6]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:56 description:@"added annotation should not be deleted"];
  }
  if ([(NSMutableSet *)self->_changedAnnotations containsObject:v6])
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationAddedWithUUID:toContentNodeWithID:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:57 description:@"added annotation should not be changed"];
  }
}

- (void)registerAnnotationDeletedWithUUID:(id)a3 fromContentNodeWithID:(id)a4
{
  if (!a3)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"] lineNumber:63 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"annotationUUID"];
    if (a4) {
      return;
    }
    goto LABEL_16;
  }
  if (!a4)
  {
LABEL_16:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:64 description:@"invalid nil value for '%s'", "contentNodeID"];
    return;
  }
  v6 = +[TSUPair pairWithFirst:second:](TSUPair, "pairWithFirst:second:");
  if ([(NSMutableSet *)self->_deletedAnnotations containsObject:v6]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:70 description:@"annotation shouldn't be deleted more than once"];
  }
  deletedAnnotations = self->_deletedAnnotations;
  if (!deletedAnnotations)
  {
    deletedAnnotations = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    self->_deletedAnnotations = deletedAnnotations;
  }
  [(NSMutableSet *)deletedAnnotations addObject:v6];
  [(NSMutableSet *)self->_addedAnnotations removeObject:v6];
  [(NSMutableSet *)self->_changedAnnotations removeObject:v6];
  if ([(NSMutableSet *)self->_addedAnnotations containsObject:v6]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:83 description:@"deleted annotation should not be added"];
  }
  if (([(NSMutableSet *)self->_deletedAnnotations containsObject:v6] & 1) == 0) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:84 description:@"deleted annotation should be deleted"];
  }
  if ([(NSMutableSet *)self->_changedAnnotations containsObject:v6])
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationDeletedWithUUID:fromContentNodeWithID:]");
    v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"];
    [v8 handleFailureInFunction:v9 file:v10 lineNumber:85 description:@"deleted annotation should not be changed"];
  }
}

- (void)registerAnnotationChangedWithUUID:(id)a3 inContentNodeWithID:(id)a4
{
  if (!a3)
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationChangeList registerAnnotationChangedWithUUID:inContentNodeWithID:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"] lineNumber:91 description:@"invalid nil value for '%s'", "annotationUUID"];
    if (a4) {
      return;
    }
    goto LABEL_15;
  }
  if (!a4)
  {
LABEL_15:
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationChangedWithUUID:inContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:92 description:@"invalid nil value for '%s'", "contentNodeID"];
    return;
  }
  v6 = +[TSUPair pairWithFirst:second:](TSUPair, "pairWithFirst:second:");
  if (([(NSMutableSet *)self->_addedAnnotations containsObject:v6] & 1) == 0)
  {
    changedAnnotations = self->_changedAnnotations;
    if (!changedAnnotations)
    {
      changedAnnotations = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      self->_changedAnnotations = changedAnnotations;
    }
    [(NSMutableSet *)changedAnnotations addObject:v6];
    if ([(NSMutableSet *)self->_addedAnnotations containsObject:v6]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationChangedWithUUID:inContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:108 description:@"changed annotation should not be added"];
    }
    if ([(NSMutableSet *)self->_deletedAnnotations containsObject:v6]) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationChangedWithUUID:inContentNodeWithID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:109 description:@"changed annotation should not be deleted"];
    }
    if (([(NSMutableSet *)self->_changedAnnotations containsObject:v6] & 1) == 0)
    {
      id v8 = +[TSUAssertionHandler currentHandler];
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList registerAnnotationChangedWithUUID:inContentNodeWithID:]");
      v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"];
      [v8 handleFailureInFunction:v9 file:v10 lineNumber:110 description:@"changed annotation should be changed"];
    }
  }
}

- (BOOL)isEmpty
{
  return ![(NSMutableSet *)self->_addedAnnotations count]
      && ![(NSMutableSet *)self->_deletedAnnotations count]
      && [(NSMutableSet *)self->_changedAnnotations count] == 0;
}

- (NSArray)changedContentNodeIDs
{
  id v3 = +[NSMutableSet set];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  addedAnnotations = self->_addedAnnotations;
  id v5 = [(NSMutableSet *)addedAnnotations countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(addedAnnotations);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "second"));
      }
      id v6 = [(NSMutableSet *)addedAnnotations countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v6);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  deletedAnnotations = self->_deletedAnnotations;
  id v10 = [(NSMutableSet *)deletedAnnotations countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(deletedAnnotations);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)j), "second"));
      }
      id v11 = [(NSMutableSet *)deletedAnnotations countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v11);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  changedAnnotations = self->_changedAnnotations;
  id v15 = [(NSMutableSet *)changedAnnotations countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (k = 0; k != v16; k = (char *)k + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(changedAnnotations);
        }
        [v3 addObject:[k second]];
      }
      id v16 = [(NSMutableSet *)changedAnnotations countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v16);
  }
  return (NSArray *)[v3 allObjects];
}

- (id)addedAnnotationUUIDsForContentNodeID:(id)a3
{
  if (a3)
  {
    id v5 = +[NSMutableSet set];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    addedAnnotations = self->_addedAnnotations;
    id v7 = [(NSMutableSet *)addedAnnotations countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(addedAnnotations);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v11, "second"), "isEqualToString:", a3)) {
            [v5 addObject:[v11 first]];
          }
        }
        id v8 = [(NSMutableSet *)addedAnnotations countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationChangeList addedAnnotationUUIDsForContentNodeID:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"] lineNumber:145 description:[NSString stringWithFormat:@"invalid nil value for '%s'", @"contentNodeID"];
    id v5 = +[NSMutableSet set];
  }
  return [v5 allObjects];
}

- (id)deletedAnnotationUUIDsForContentNodeID:(id)a3
{
  if (a3)
  {
    id v5 = +[NSMutableSet set];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    deletedAnnotations = self->_deletedAnnotations;
    id v7 = [(NSMutableSet *)deletedAnnotations countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(deletedAnnotations);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v11, "second"), "isEqualToString:", a3)) {
            [v5 addObject:[v11 first]];
          }
        }
        id v8 = [(NSMutableSet *)deletedAnnotations countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THAnnotationChangeList deletedAnnotationUUIDsForContentNodeID:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m"] lineNumber:165 description:[NSString stringWithFormat:@"invalid nil value for '%s'", "contentNodeID"];
    id v5 = +[NSMutableSet set];
  }
  return [v5 allObjects];
}

- (id)changedAnnotationUUIDsForContentNodeID:(id)a3
{
  if (a3)
  {
    id v5 = +[NSMutableSet set];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    changedAnnotations = self->_changedAnnotations;
    id v7 = [(NSMutableSet *)changedAnnotations countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(changedAnnotations);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v11, "second"), "isEqualToString:", a3)) {
            [v5 addObject:[v11 first]];
          }
        }
        id v8 = [(NSMutableSet *)changedAnnotations countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THAnnotationChangeList changedAnnotationUUIDsForContentNodeID:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THAnnotationChangeList.m") lineNumber:185 description:@"invalid nil value for '%s'", "contentNodeID"];
    id v5 = +[NSMutableSet set];
  }
  return [v5 allObjects];
}

@end