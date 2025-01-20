@interface THCachedAnnotation
- (BOOL)annotationHasNote;
- (BOOL)annotationIsBookmark;
- (BOOL)annotationIsOrphan;
- (BOOL)annotationIsPlaceholder;
- (BOOL)annotationIsUnderline;
- (BOOL)isEqual:(id)a3;
- (NSDate)annotationCreationDate;
- (NSDate)annotationModificationDate;
- (NSString)annotationBookVersion;
- (NSString)annotationContentNodeID;
- (NSString)annotationLocation;
- (NSString)annotationNote;
- (NSString)annotationRepresentativeText;
- (NSString)annotationSelectedText;
- (NSString)annotationStorageUID;
- (NSString)annotationUuid;
- (NSString)chapterTitle;
- (NSString)description;
- (NSString)physicalPageNumber;
- (THCachedAnnotation)annotationWithChapterTitle:(id)a3 physicalPageNumber:(id)a4;
- (THCachedAnnotation)initWithAnnotation:(id)a3 contentNode:(id)a4;
- (THCachedAnnotation)initWithCachedAnnotation:(id)a3 chapterTitle:(id)a4 physicalPageNumber:(id)a5;
- (THModelContentNode)contentNode;
- (_NSRange)annotationStorageRange;
- (id)initTemporaryWithStorage:(id)a3 range:(_NSRange)a4 contentNode:(id)a5 style:(int)a6 chapterTitle:(id)a7;
- (id)theme;
- (int)annotationStyle;
- (int)annotationType;
- (unint64_t)annotationAbsolutePhysicalPageIndex;
- (unint64_t)annotationContentNodeRelativePageIndex;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation THCachedAnnotation

- (THCachedAnnotation)initWithAnnotation:(id)a3 contentNode:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)THCachedAnnotation;
  v6 = [(THCachedAnnotation *)&v9 init];
  if (v6)
  {
    v6->_annotationUuid = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationUuid"), "copy");
    v6->_annotationStyle = [a3 annotationStyle];
    v6->_annotationType = [a3 annotationType];
    v6->_annotationSelectedText = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationSelectedText"), "copy");
    v6->_annotationRepresentativeText = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationRepresentativeText"), "copy");
    v6->_annotationCreationDate = (NSDate *)objc_msgSend(objc_msgSend(a3, "annotationCreationDate"), "copy");
    v6->_annotationModificationDate = [(NSDate *)[a3 annotationModificationDate] copy];
    v6->_annotationLocation = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationLocation"), "copy");
    v6->_annotationNote = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationNote"), "copy");
    v6->_annotationHasNote = [a3 annotationHasNote];
    v6->_annotationStorageRange.location = (NSUInteger)[a3 annotationStorageRange];
    v6->_annotationStorageRange.length = v7;
    v6->_annotationStorageUID = (NSString *)objc_msgSend(objc_msgSend(a3, "plStorageUUID"), "copy");
    v6->_annotationContentNodeID = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationContentNodeID"), "copy");
    v6->_annotationAbsolutePhysicalPageIndex = (unint64_t)[a3 absolutePhysicalPageIndex];
    v6->_annotationBookVersion = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationBookVersion"), "copy");
    v6->_physicalPageNumber = (NSString *)objc_msgSend(objc_msgSend(a3, "physicalPageNumber"), "copy");
    v6->_contentNode = (THModelContentNode *)a4;
  }
  return v6;
}

- (THCachedAnnotation)initWithCachedAnnotation:(id)a3 chapterTitle:(id)a4 physicalPageNumber:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)THCachedAnnotation;
  v8 = [(THCachedAnnotation *)&v11 init];
  if (v8)
  {
    v8->_annotationUuid = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationUuid"), "copy");
    v8->_annotationStyle = [a3 annotationStyle];
    v8->_annotationType = [a3 annotationType];
    v8->_annotationRepresentativeText = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationRepresentativeText"), "copy");
    v8->_annotationCreationDate = (NSDate *)objc_msgSend(objc_msgSend(a3, "annotationCreationDate"), "copy");
    v8->_annotationModificationDate = (NSDate *)objc_msgSend(objc_msgSend(a3, "annotationModificationDate"), "copy");
    v8->_annotationLocation = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationLocation"), "copy");
    v8->_annotationNote = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationNote"), "copy");
    v8->_annotationHasNote = [a3 annotationHasNote];
    v8->_annotationStorageRange.location = (NSUInteger)[a3 annotationStorageRange];
    v8->_annotationStorageRange.length = v9;
    v8->_annotationStorageUID = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationStorageUID"), "copy");
    v8->_annotationContentNodeID = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationContentNodeID"), "copy");
    v8->_annotationAbsolutePhysicalPageIndex = (unint64_t)[a3 annotationAbsolutePhysicalPageIndex];
    v8->_annotationBookVersion = (NSString *)objc_msgSend(objc_msgSend(a3, "annotationBookVersion"), "copy");
    v8->_physicalPageNumber = (NSString *)[a5 copy];
    v8->_chapterTitle = (NSString *)[a4 copy];
    v8->_contentNode = (THModelContentNode *)[a3 contentNode];
  }
  return v8;
}

- (id)initTemporaryWithStorage:(id)a3 range:(_NSRange)a4 contentNode:(id)a5 style:(int)a6 chapterTitle:(id)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v17.receiver = self;
  v17.super_class = (Class)THCachedAnnotation;
  v13 = [(THCachedAnnotation *)&v17 init];
  if (v13)
  {
    id v14 = [a5 annotationIDForInfo:a3];
    v13->_annotationStorageUID = (NSString *)[v14 copy];
    v13->_annotationContentNodeID = (NSString *)objc_msgSend(objc_msgSend(a5, "nodeGUID"), "copy");
    v13->_annotationStorageRange.NSUInteger location = location;
    v13->_annotationStorageRange.NSUInteger length = length;
    v13->_annotationStyle = a6;
    v13->_annotationUuid = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@-temporary", v14];
    v13->_annotationLocation = (NSString *)objc_msgSend(objc_msgSend(a5, "cfiForRange:storageUID:includeFilename:pedantic:", location, length, objc_msgSend(a5, "nodeUniqueIDForInfo:", a3), 1, 0), "copy");
    v15 = (NSDate *)objc_alloc_init((Class)NSDate);
    v13->_annotationCreationDate = v15;
    v13->_annotationModificationDate = (NSDate *)[(NSDate *)v15 copy];
    v13->_annotationRepresentativeText = (NSString *)objc_msgSend(objc_msgSend(a3, "stringEquivalentFromRange:", location, length), "copy");
    v13->_annotationAbsolutePhysicalPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    v13->_chapterTitle = (NSString *)[a7 copy];
  }
  return v13;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THCachedAnnotation;
  [(THCachedAnnotation *)&v3 dealloc];
}

- (THCachedAnnotation)annotationWithChapterTitle:(id)a3 physicalPageNumber:(id)a4
{
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithCachedAnnotation:self chapterTitle:a3 physicalPageNumber:a4];

  return (THCachedAnnotation *)v4;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  v5 = (void *)TSUDynamicCast();
  annotationUuid = self->_annotationUuid;
  id v7 = [v5 annotationUuid];
  return [(NSString *)annotationUuid isEqual:v7];
}

- (unint64_t)hash
{
  return [(NSString *)self->_annotationUuid hash];
}

- (NSString)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v5 = [(THCachedAnnotation *)self annotationUuid];
  v6 = [(THCachedAnnotation *)self annotationContentNodeID];
  id v7 = [(THCachedAnnotation *)self annotationStorageUID];
  v13.NSUInteger location = (NSUInteger)[(THCachedAnnotation *)self annotationStorageRange];
  v8 = NSStringFromRange(v13);
  if ([(THCachedAnnotation *)self physicalPageNumber]) {
    CFStringRef v9 = +[NSString stringWithFormat:@" pageNumber=%@", [(THCachedAnnotation *)self physicalPageNumber]];
  }
  else {
    CFStringRef v9 = &stru_46D7E8;
  }
  if ([(THCachedAnnotation *)self chapterTitle]) {
    CFStringRef v10 = +[NSString stringWithFormat:@" chapterTitle=\"%@\"", [(THCachedAnnotation *)self chapterTitle]];
  }
  else {
    CFStringRef v10 = &stru_46D7E8;
  }
  if ([(THCachedAnnotation *)self annotationNote]) {
    CFStringRef v11 = +[NSString stringWithFormat:@" note=\"%@\"", [(THCachedAnnotation *)self annotationNote]];
  }
  else {
    CFStringRef v11 = &stru_46D7E8;
  }
  return +[NSString stringWithFormat:@"<%@=%p uid=%@ contentNodeID=%@ storageID=%@ range=%@%@%@%@>", v4, self, v5, v6, v7, v8, v9, v10, v11];
}

- (id)theme
{
  return +[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:");
}

- (NSString)annotationSelectedText
{
  if ([(NSString *)self->_annotationSelectedText length]) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[THCachedAnnotation annotationSelectedText]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THAnnotationController.m"] lineNumber:233 description:@"didn't expect the selectedText field to be used"];
  }
  return self->_annotationRepresentativeText;
}

- (BOOL)annotationIsUnderline
{
  return self->_annotationStyle == 6;
}

- (BOOL)annotationIsOrphan
{
  return self->_annotationLocation == 0;
}

- (BOOL)annotationIsBookmark
{
  return self->_annotationType == 1;
}

- (BOOL)annotationIsPlaceholder
{
  return self->_annotationType == 3;
}

- (NSString)annotationUuid
{
  return self->_annotationUuid;
}

- (int)annotationStyle
{
  return self->_annotationStyle;
}

- (int)annotationType
{
  return self->_annotationType;
}

- (NSString)annotationRepresentativeText
{
  return self->_annotationRepresentativeText;
}

- (NSDate)annotationCreationDate
{
  return self->_annotationCreationDate;
}

- (NSDate)annotationModificationDate
{
  return self->_annotationModificationDate;
}

- (NSString)annotationLocation
{
  return self->_annotationLocation;
}

- (NSString)annotationNote
{
  return self->_annotationNote;
}

- (BOOL)annotationHasNote
{
  return self->_annotationHasNote;
}

- (_NSRange)annotationStorageRange
{
  NSUInteger length = self->_annotationStorageRange.length;
  NSUInteger location = self->_annotationStorageRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (NSString)annotationStorageUID
{
  return self->_annotationStorageUID;
}

- (NSString)annotationContentNodeID
{
  return self->_annotationContentNodeID;
}

- (unint64_t)annotationAbsolutePhysicalPageIndex
{
  return self->_annotationAbsolutePhysicalPageIndex;
}

- (unint64_t)annotationContentNodeRelativePageIndex
{
  return self->_annotationContentNodeRelativePageIndex;
}

- (NSString)annotationBookVersion
{
  return self->_annotationBookVersion;
}

- (NSString)chapterTitle
{
  return self->_chapterTitle;
}

- (NSString)physicalPageNumber
{
  return self->_physicalPageNumber;
}

- (THModelContentNode)contentNode
{
  return self->_contentNode;
}

@end