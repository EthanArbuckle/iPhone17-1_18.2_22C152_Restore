@interface THUpdateAnnotationAction
- (BOOL)autoUpdateWhenStorageRangeChanges;
- (NSDate)modificationDate;
- (NSDate)userModificationDate;
- (NSMutableDictionary)changedProperties;
- (THUpdateAnnotationAction)initWithAnnotation:(id)a3 contentNode:(id)a4 updateBlock:(id)a5;
- (void)commitWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_maintainIntegrity:(id)a3;
- (void)p_maintainIntegrityForStorageRangeChange:(id)a3;
- (void)p_restoreChangedProperties:(id)a3;
- (void)p_updateAnnotationForStorageRangeChange:(id)a3;
- (void)p_updateContextAndCFIForStorage:(id)a3 storageID:(id)a4 range:(_NSRange)a5 annotation:(id)a6;
- (void)p_updatePageAnnotationForPageChange:(id)a3;
- (void)redoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5;
- (void)setAutoUpdateWhenStorageRangeChanges:(BOOL)a3;
- (void)setChangedProperties:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setUserModificationDate:(id)a3;
- (void)undoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5;
@end

@implementation THUpdateAnnotationAction

- (THUpdateAnnotationAction)initWithAnnotation:(id)a3 contentNode:(id)a4 updateBlock:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)THUpdateAnnotationAction;
  v8 = [(THUpdateAnnotationAction *)&v10 init];
  if (v8)
  {
    v8->_annotationUuid = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationUuid"), "copy");
    v8->_contentNode = (THModelContentNode *)a4;
    v8->_updateBlock = [a5 copy];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THUpdateAnnotationAction;
  [(THUpdateAnnotationAction *)&v3 dealloc];
}

- (void)commitWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v7 = [a4 annotationForUUID:self->_annotationUuid includeDeleted:1 moc:a5];
  if (v7)
  {
    v8 = v7;
    [(THUpdateAnnotationAction *)self setChangedProperties:+[NSMutableDictionary dictionary]];
    -[THUpdateAnnotationAction setModificationDate:](self, "setModificationDate:", [v8 annotationModificationDate]);
    -[THUpdateAnnotationAction setUserModificationDate:](self, "setUserModificationDate:", [v8 userModificationDate]);
    v9 = +[NSArray arrayWithObjects:@"annotationType", @"annotationLocation", @"annotationNote", @"annotationRepresentativeText", @"annotationSelectedText", @"annotationStyle", @"annotationIsUnderline", @"plLocationRangeStart", @"plLocationRangeEnd", @"plAbsolutePhysicalLocation", @"plStorageUUID", @"plUserData", 0];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          [v8 addObserver:self forKeyPath:*(void *)(*((void *)&v23 + 1) + 8 * (void)v13) options:2 context:0];
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }
    updateBlock = (void (**)(id, void *))self->_updateBlock;
    if (updateBlock) {
      updateBlock[2](updateBlock, v8);
    }
    [(THUpdateAnnotationAction *)self p_maintainIntegrity:v8];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v15 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v9);
          }
          [v8 removeObserver:self forKeyPath:*(void *)(*((void *)&v19 + 1) + 8 * (void)v18)];
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [(NSArray *)v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
    [a3 registerAnnotationChangedWithUUID:[v8 annotationUuid] inContentNodeWithID:[v8 annotationContentNodeID]];
  }
}

- (void)undoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v7 = [a4 annotationForUUID:self->_annotationUuid includeDeleted:1 moc:a5];
  if (v7)
  {
    v8 = v7;
    [(THUpdateAnnotationAction *)self p_restoreChangedProperties:v7];
    id v9 = [v8 annotationUuid];
    id v10 = [v8 annotationContentNodeID];
    [a3 registerAnnotationChangedWithUUID:v9 inContentNodeWithID:v10];
  }
}

- (void)redoWithChangeList:(id)a3 annotationHost:(id)a4 moc:(id)a5
{
  id v7 = [a4 annotationForUUID:self->_annotationUuid includeDeleted:1 moc:a5];
  if (v7)
  {
    v8 = v7;
    [(THUpdateAnnotationAction *)self p_restoreChangedProperties:v7];
    id v9 = [v8 annotationUuid];
    id v10 = [v8 annotationContentNodeID];
    [a3 registerAnnotationChangedWithUUID:v9 inContentNodeWithID:v10];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  changedProperties = self->_changedProperties;
  if (!changedProperties)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5, a6) handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction observeValueForKeyPath:ofObject:change:context:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m") lineNumber:162 description:@"no dictionary for tracking changes"];
    changedProperties = self->_changedProperties;
  }
  if (!-[NSMutableDictionary objectForKey:](changedProperties, "objectForKey:", a3, a4, a5, a6))
  {
    id v10 = (NSNull *)[a5 objectForKey:NSKeyValueChangeOldKey];
    if (!v10) {
      id v10 = +[NSNull null];
    }
    id v11 = self->_changedProperties;
    [(NSMutableDictionary *)v11 setObject:v10 forKey:a3];
  }
}

- (void)p_maintainIntegrityForStorageRangeChange:(id)a3
{
  if ([(NSMutableDictionary *)self->_changedProperties objectForKey:@"annotationLocation"]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrityForStorageRangeChange:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m") lineNumber:182 description:@"possible conflict setting annotationLocation"];
  }
  if ([(NSMutableDictionary *)self->_changedProperties objectForKey:@"annotationRepresentativeText"])
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrityForStorageRangeChange:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m") lineNumber:183 description:@"possible conflict setting annotationRepresentativeText"];
  }
  if ([(NSMutableDictionary *)self->_changedProperties objectForKey:@"plAbsolutePhysicalLocation"])
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrityForStorageRangeChange:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m") lineNumber:184 description:@"possible conflict setting plAbsolutePhysicalLocation"];
  }

  [(THUpdateAnnotationAction *)self p_updateAnnotationForStorageRangeChange:a3];
}

- (void)p_maintainIntegrity:(id)a3
{
  unsigned int v5 = [a3 annotationType];
  if (v5 != 1 && v5 != 3)
  {
    if (v5 != 2)
    {
      [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THUpdateAnnotationAction p_maintainIntegrity:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m"] lineNumber:219 description:[NSString stringWithFormat:@"unexpected annotation type: %d", [a3 annotationType]];
      return;
    }
    changedProperties = self->_changedProperties;
    goto LABEL_13;
  }
  id v7 = [(NSMutableDictionary *)self->_changedProperties objectForKey:@"plAbsolutePhysicalLocation"];
  changedProperties = self->_changedProperties;
  if (!v7)
  {
LABEL_13:
    if ([(NSMutableDictionary *)changedProperties objectForKey:@"plLocationRangeStart"]
      || [(NSMutableDictionary *)self->_changedProperties objectForKey:@"plLocationRangeEnd"]
      || [(NSMutableDictionary *)self->_changedProperties objectForKey:@"plStorageUUID"])
    {
      [(THUpdateAnnotationAction *)self p_maintainIntegrityForStorageRangeChange:a3];
    }
    return;
  }
  if ([(NSMutableDictionary *)changedProperties objectForKey:@"annotationLocation"]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrity:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m") lineNumber:206 description:@"possible conflict setting annotationLocation"];
  }
  if ([(NSMutableDictionary *)self->_changedProperties objectForKey:@"annotationRepresentativeText"])
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_maintainIntegrity:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m") lineNumber:207 description:@"possible conflict setting annotationRepresentativeText"];
  }

  [(THUpdateAnnotationAction *)self p_updatePageAnnotationForPageChange:a3];
}

- (void)p_updatePageAnnotationForPageChange:(id)a3
{
  [a3 setContentNodeRelativePageIndex:[self->_contentNode relativePageIndexForAbsolutePageIndex:[a3 absolutePhysicalPageIndex]]];
  id v5 = [a3 annotationStorageRange];
  uint64_t v7 = v6;
  id v8 = [a3 annotationStorageIDWithoutContentNodeID];
  objc_opt_class();
  [(THModelContentNode *)self->_contentNode infoForNodeUniqueID:v8];
  uint64_t v9 = TSUDynamicCast();
  if (!v9)
  {
    objc_opt_class();
    [(THModelContentNode *)self->_contentNode infoForNodeUniqueID:v8 forPresentationType:+[THPresentationType flowPresentationTypeInContext:[(THModelContentNode *)self->_contentNode context]]];
    uint64_t v9 = TSUDynamicCast();
  }
  -[THUpdateAnnotationAction p_updateContextAndCFIForStorage:storageID:range:annotation:](self, "p_updateContextAndCFIForStorage:storageID:range:annotation:", v9, v8, v5, v7, a3);
  if (!v9 || v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [a3 setAnnotationRepresentativeText:0];
    [a3 setSelectionPreContextText:0];
    [a3 setSelectionPostContextText:0];
  }
}

- (void)p_updateAnnotationForStorageRangeChange:(id)a3
{
  id v5 = (char *)[a3 annotationStorageRange];
  if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_contentNode)
    {
      uint64_t v7 = v5;
      uint64_t v8 = v6;
      id v9 = [a3 annotationStorageIDWithoutContentNodeID];
      objc_opt_class();
      [(THModelContentNode *)self->_contentNode infoForNodeUniqueID:v9 forPresentationType:+[THPresentationType paginatedPresentationTypeInContext:[(THModelContentNode *)self->_contentNode context]]];
      id v10 = (void *)TSUDynamicCast();
      if (v10
        || (objc_opt_class(),
            [(THModelContentNode *)self->_contentNode infoForNodeUniqueID:v9 forPresentationType:+[THPresentationType flowPresentationTypeInContext:[(THModelContentNode *)self->_contentNode context]]], (id v10 = (void *)TSUDynamicCast()) != 0))
      {
        if (&v7[v8] > [v10 length]) {
          [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_updateAnnotationForStorageRangeChange:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m") lineNumber:268 description:@"annotation has an invalid storage range"];
        }
        if (&v7[v8] <= [v10 length])
        {
          [a3 setContentNodeRelativePageIndex:[self->_contentNode relativePageIndexForCharacterIndex:v7 forInfo:v10]];
          objc_msgSend(a3, "setAbsolutePhysicalPageIndex:", -[THModelNode absolutePageIndexForRelativePageIndex:forPresentationType:](self->_contentNode, "absolutePageIndexForRelativePageIndex:forPresentationType:", objc_msgSend(a3, "contentNodeRelativePageIndex"), +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(v10, "context"))));
          -[THUpdateAnnotationAction p_updateContextAndCFIForStorage:storageID:range:annotation:](self, "p_updateContextAndCFIForStorage:storageID:range:annotation:", v10, v9, v7, v8, a3);
        }
      }
    }
  }
}

- (void)p_updateContextAndCFIForStorage:(id)a3 storageID:(id)a4 range:(_NSRange)a5 annotation:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  [a6 setAnnotationLocation:[self->_contentNode cfiForRange:a5.location length:a5.length storageUID:a4 includeFilename:1 pedantic:0]];
  if (a3 && location != 0x7FFFFFFFFFFFFFFFLL && location + length > (unint64_t)[a3 length]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUpdateAnnotationAction p_updateContextAndCFIForStorage:storageID:range:annotation:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/THUpdateAnnotationAction.m") lineNumber:288 description:@"annotation has an invalid storage range"];
  }
  if (a3 && location != 0x7FFFFFFFFFFFFFFFLL && location + length <= (unint64_t)[a3 length])
  {
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    if ([a6 annotationType] == 2) {
      NSUInteger v10 = length;
    }
    else {
      NSUInteger v10 = 0;
    }
    [a3 contextualStringsForSelection:location prefix:v10 suffix:&v12, &v11];
    [a6 setAnnotationRepresentativeText:[a3 substringWithRange:location, length]];
    [a6 setSelectionPreContextText:v12];
    [a6 setSelectionPostContextText:v11];
  }
}

- (void)p_restoreChangedProperties:(id)a3
{
  id v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  long long v23 = (NSDate *)objc_msgSend(objc_msgSend(a3, "annotationModificationDate"), "copy");
  long long v22 = (NSDate *)objc_msgSend(objc_msgSend(a3, "userModificationDate"), "copy");
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  changedProperties = self->_changedProperties;
  id v7 = [(NSMutableDictionary *)changedProperties countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(changedProperties);
        }
        uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v12 = (NSNull *)[a3 valueForKey:v11];
        if (!v12) {
          uint64_t v12 = +[NSNull null];
        }
        id v13 = [(NSNull *)v12 copy];
        [(NSMutableDictionary *)v5 setObject:v13 forKey:v11];
      }
      id v8 = [(NSMutableDictionary *)changedProperties countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v8);
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v14 = self->_changedProperties;
  id v15 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (j = 0; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * (void)j);
        long long v20 = (NSNull *)[(NSMutableDictionary *)self->_changedProperties objectForKey:v19];
        if (v20 == +[NSNull null]) {
          long long v21 = 0;
        }
        else {
          long long v21 = v20;
        }
        [a3 setValue:v21 forKey:v19];
      }
      id v16 = [(NSMutableDictionary *)v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }
  [a3 setAnnotationModificationDate:self->_modificationDate];
  [a3 setUserModificationDate:self->_userModificationDate];

  self->_changedProperties = v5;
  self->_modificationDate = v23;

  self->_userModificationDate = v22;
}

- (NSMutableDictionary)changedProperties
{
  return self->_changedProperties;
}

- (void)setChangedProperties:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSDate)userModificationDate
{
  return self->_userModificationDate;
}

- (void)setUserModificationDate:(id)a3
{
}

- (BOOL)autoUpdateWhenStorageRangeChanges
{
  return self->_autoUpdateWhenStorageRangeChanges;
}

- (void)setAutoUpdateWhenStorageRangeChanges:(BOOL)a3
{
  self->_autoUpdateWhenStorageRangeChanges = a3;
}

@end