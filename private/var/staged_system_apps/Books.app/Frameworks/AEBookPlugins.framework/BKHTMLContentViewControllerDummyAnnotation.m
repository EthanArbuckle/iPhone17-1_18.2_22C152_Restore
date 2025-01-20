@interface BKHTMLContentViewControllerDummyAnnotation
- (BKEpubCFILocation)dummyLocation2;
- (BKHTMLContentViewControllerDummyAnnotation)init;
- (BKLocation)location;
- (BOOL)annotationHasNote;
- (BOOL)annotationIsUnderline;
- (BOOL)isAnnotationDeleted;
- (BOOL)removed;
- (DOMRange)existingAnnotationDOMRange;
- (NSDate)annotationCreationDate;
- (NSDate)annotationModificationDate;
- (NSString)annotationLocation;
- (NSString)annotationNote;
- (NSString)annotationRepresentativeText;
- (NSString)annotationSelectedText;
- (NSString)annotationUuid;
- (NSString)cfi;
- (NSString)chapterTitle;
- (NSString)redactedAnnotationLocation;
- (_NSRange)annotationSelectedTextRange;
- (int)annotationStyle;
- (int)annotationType;
- (int64_t)ordinal;
- (void)setAnnotationIsUnderline:(BOOL)a3;
- (void)setAnnotationRepresentativeText:(id)a3;
- (void)setAnnotationSelectedTextRange:(_NSRange)a3;
- (void)setAnnotationStyle:(int)a3;
- (void)setCfi:(id)a3;
- (void)setChapterTitle:(id)a3;
- (void)setDummyLocation2:(id)a3;
- (void)setExistingAnnotationDOMRange:(id)a3;
- (void)setRemoved:(BOOL)a3;
@end

@implementation BKHTMLContentViewControllerDummyAnnotation

- (BKHTMLContentViewControllerDummyAnnotation)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKHTMLContentViewControllerDummyAnnotation;
  v2 = [(BKHTMLContentViewControllerDummyAnnotation *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSDate date];
    date = v2->_date;
    v2->_date = (NSDate *)v3;

    v2->_annotationStyle = 3;
    v2->_annotationIsUnderline = 0;
  }
  return v2;
}

- (int)annotationType
{
  return 2;
}

- (NSString)annotationLocation
{
  dummyLocation2 = self->_dummyLocation2;
  if (dummyLocation2)
  {
    v4 = [(BKEpubCFILocation *)dummyLocation2 cfiString];
  }
  else
  {
    v4 = self->_cfi;
  }

  return v4;
}

- (NSString)redactedAnnotationLocation
{
  v2 = [(BKHTMLContentViewControllerDummyAnnotation *)self annotationLocation];
  uint64_t v3 = [v2 bc_redactedCFIString];

  return (NSString *)v3;
}

- (NSString)annotationNote
{
  return 0;
}

- (BOOL)annotationHasNote
{
  v2 = [(BKHTMLContentViewControllerDummyAnnotation *)self annotationNote];
  uint64_t v3 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (NSString)annotationSelectedText
{
  return [(BKHTMLContentViewControllerDummyAnnotation *)self annotationRepresentativeText];
}

- (NSString)annotationUuid
{
  return (NSString *)@"BKHTMLContentViewControllerDummyAnnotationUUID";
}

- (NSDate)annotationCreationDate
{
  return self->_date;
}

- (NSDate)annotationModificationDate
{
  return self->_date;
}

- (BOOL)isAnnotationDeleted
{
  return [(BKHTMLContentViewControllerDummyAnnotation *)self removed];
}

- (BKLocation)location
{
  return (BKLocation *)self->_dummyLocation2;
}

- (int64_t)ordinal
{
  v2 = [(BKHTMLContentViewControllerDummyAnnotation *)self location];
  id v3 = [v2 ordinal];

  return (int64_t)v3;
}

- (BKEpubCFILocation)dummyLocation2
{
  return self->_dummyLocation2;
}

- (void)setDummyLocation2:(id)a3
{
}

- (DOMRange)existingAnnotationDOMRange
{
  return self->_existingAnnotationDOMRange;
}

- (void)setExistingAnnotationDOMRange:(id)a3
{
}

- (int)annotationStyle
{
  return self->_annotationStyle;
}

- (void)setAnnotationStyle:(int)a3
{
  self->_annotationStyle = a3;
}

- (BOOL)annotationIsUnderline
{
  return self->_annotationIsUnderline;
}

- (void)setAnnotationIsUnderline:(BOOL)a3
{
  self->_annotationIsUnderline = a3;
}

- (NSString)chapterTitle
{
  return self->_chapterTitle;
}

- (void)setChapterTitle:(id)a3
{
}

- (NSString)cfi
{
  return self->_cfi;
}

- (void)setCfi:(id)a3
{
}

- (NSString)annotationRepresentativeText
{
  return self->_annotationRepresentativeText;
}

- (void)setAnnotationRepresentativeText:(id)a3
{
}

- (_NSRange)annotationSelectedTextRange
{
  NSUInteger length = self->_annotationSelectedTextRange.length;
  NSUInteger location = self->_annotationSelectedTextRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setAnnotationSelectedTextRange:(_NSRange)a3
{
  self->_annotationSelectedTextRange = a3;
}

- (BOOL)removed
{
  return self->_removed;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationRepresentativeText, 0);
  objc_storeStrong((id *)&self->_cfi, 0);
  objc_storeStrong((id *)&self->_chapterTitle, 0);
  objc_storeStrong((id *)&self->_existingAnnotationDOMRange, 0);
  objc_storeStrong((id *)&self->_dummyLocation2, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end