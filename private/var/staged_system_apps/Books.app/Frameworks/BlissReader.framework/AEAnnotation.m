@interface AEAnnotation
- (BOOL)isBookmark;
- (BOOL)isOrphan;
- (BOOL)isPlaceholder;
- (NSDictionary)placeholderHistory;
- (NSString)annotationBookVersion;
- (NSString)annotationContentNodeID;
- (NSString)annotationStorageIDWithoutContentNodeID;
- (NSString)selectionPostContextText;
- (NSString)selectionPreContextText;
- (_NSRange)annotationStorageRange;
- (id)p_userDataDictionary;
- (id)p_userDataObjectForKey:(id)a3;
- (unint64_t)absolutePhysicalPageIndex;
- (unint64_t)contentNodeRelativePageIndex;
- (void)p_setUserDataDictionary:(id)a3;
- (void)p_setUserDataObject:(id)a3 forKey:(id)a4;
- (void)setAbsolutePhysicalPageIndex:(unint64_t)a3;
- (void)setAnnotationBookVersion:(id)a3;
- (void)setAnnotationStorageRange:(_NSRange)a3;
- (void)setContentNodeRelativePageIndex:(unint64_t)a3;
- (void)setPlaceholderHistory:(id)a3;
- (void)setSelectionPostContextText:(id)a3;
- (void)setSelectionPreContextText:(id)a3;
@end

@implementation AEAnnotation

- (BOOL)isPlaceholder
{
  return [(AEAnnotation *)self annotationType] == 3;
}

- (BOOL)isBookmark
{
  return [(AEAnnotation *)self annotationType] == 1;
}

- (BOOL)isOrphan
{
  return [(AEAnnotation *)self annotationLocation] == 0;
}

- (unint64_t)absolutePhysicalPageIndex
{
  id v2 = [(AEAnnotation *)self plAbsolutePhysicalLocation];

  return (unint64_t)[v2 unsignedIntegerValue];
}

- (void)setAbsolutePhysicalPageIndex:(unint64_t)a3
{
  v4 = +[NSNumber numberWithUnsignedInteger:a3];

  [(AEAnnotation *)self setPlAbsolutePhysicalLocation:v4];
}

- (void)setAnnotationStorageRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
  v7 = +[NSNumber numberWithUnsignedInteger:location + length];
  [(AEAnnotation *)self setPlLocationRangeStart:v6];

  [(AEAnnotation *)self setPlLocationRangeEnd:v7];
}

- (_NSRange)annotationStorageRange
{
  v3 = [[self plLocationRangeStart] unsignedIntegerValue];
  v4 = [self plLocationRangeEnd].unsignedIntegerValue;
  if (v4 >= v3) {
    NSUInteger v5 = v4 - v3;
  }
  else {
    NSUInteger v5 = 0;
  }
  NSUInteger v6 = (NSUInteger)v3;
  result.NSUInteger length = v5;
  result.NSUInteger location = v6;
  return result;
}

- (NSString)annotationBookVersion
{
  return (NSString *)[(AEAnnotation *)self assetVersion];
}

- (void)setAnnotationBookVersion:(id)a3
{
}

- (NSString)annotationContentNodeID
{
  id v2 = [(AEAnnotation *)self plStorageUUID];
  if ((unint64_t)[v2 length] < 0x26) {
    return 0;
  }

  return [v2 substringWithRange:0, 38];
}

- (NSString)annotationStorageIDWithoutContentNodeID
{
  id v3 = [(AEAnnotation *)self plStorageUUID];
  id v4 = [v3 length];
  NSUInteger v5 = (char *)[v3 length];
  if ((unint64_t)v4 < 0x28)
  {
    if (v5 != (unsigned char *)&stru_20.cmdsize + 2)
    {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[AEAnnotation(THAdditions) annotationStorageIDWithoutContentNodeID]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/AEAnnotation_THAdditions.m") lineNumber:118 description:@"Unexpected annotation storageUID string (annotation type=%d): %@", -[AEAnnotation annotationType](self, "annotationType"), v3];
      return 0;
    }
    return (NSString *)v3;
  }
  else
  {
    return [v3 substringWithRange:39, v5 - 39];
  }
}

- (id)p_userDataDictionary
{
  id v2 = [(AEAnnotation *)self plUserData];
  if (!v2) {
    return 0;
  }
  uint64_t v12 = 0;
  id v3 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v2 error:&v12];
  if (v12)
  {
    id v4 = THLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_2A0F54(&v12, v4);
    }
    return 0;
  }
  else
  {
    v7 = v3;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v5 = [v7 decodeObjectOfClasses:[NSSet setWithObjects:v8, v9, v10, objc_opt_class(), 0] forKey:@"dictionary"];
    [v7 finishDecoding];
  }
  return v5;
}

- (void)p_setUserDataDictionary:(id)a3
{
  if (a3)
  {
    id v7 = objc_alloc_init((Class)NSMutableData);
    id v5 = [objc_alloc((Class)NSKeyedArchiver) initForWritingWithMutableData:v7];
    [v5 encodeObject:a3 forKey:@"dictionary"];
    [v5 finishEncoding];

    id v6 = v7;
  }
  else
  {
    id v6 = 0;
  }
  id v8 = v6;
  [(AEAnnotation *)self setPlUserData:v6];
}

- (id)p_userDataObjectForKey:(id)a3
{
  if (a3)
  {
    id v4 = [(AEAnnotation *)self p_userDataDictionary];
    return [v4 objectForKey:a3];
  }
  else
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[AEAnnotation(THAdditions) p_userDataObjectForKey:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/AEAnnotation_THAdditions.m") lineNumber:192 description:@"invalid nil value for '%s'", "key"];
    return 0;
  }
}

- (void)p_setUserDataObject:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    [v7 addEntriesFromDictionary:[self p_userDataDictionary]];
    if (a3) {
      [v7 setObject:a3 forKey:a4];
    }
    else {
      [v7 removeObjectForKey:a4];
    }
    [(AEAnnotation *)self p_setUserDataDictionary:v7];
  }
  else
  {
    [TSUAssertionHandler currentHandler][TSUAssertionHandler handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[AEAnnotation(THAdditions) p_setUserDataObject:forKey:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Annotations/AEAnnotation_THAdditions.m") lineNumber:206 description:@"invalid nil value for '%s'", "key"];
  }
}

- (NSDictionary)placeholderHistory
{
  objc_opt_class();
  [(AEAnnotation *)self p_userDataObjectForKey:@"pgHistory"];

  return (NSDictionary *)TSUDynamicCast();
}

- (void)setPlaceholderHistory:(id)a3
{
}

- (NSString)selectionPreContextText
{
  objc_opt_class();
  [(AEAnnotation *)self p_userDataObjectForKey:@"preContext"];

  return (NSString *)TSUDynamicCast();
}

- (void)setSelectionPreContextText:(id)a3
{
}

- (NSString)selectionPostContextText
{
  objc_opt_class();
  [(AEAnnotation *)self p_userDataObjectForKey:@"postContext"];

  return (NSString *)TSUDynamicCast();
}

- (void)setSelectionPostContextText:(id)a3
{
}

- (unint64_t)contentNodeRelativePageIndex
{
  id v2 = [(AEAnnotation *)self p_userDataObjectForKey:@"cnRelPg"];
  if (!v2) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }

  return (unint64_t)[v2 unsignedIntegerValue];
}

- (void)setContentNodeRelativePageIndex:(unint64_t)a3
{
  id v4 = +[NSNumber numberWithUnsignedInteger:a3];

  [(AEAnnotation *)self p_setUserDataObject:v4 forKey:@"cnRelPg"];
}

@end