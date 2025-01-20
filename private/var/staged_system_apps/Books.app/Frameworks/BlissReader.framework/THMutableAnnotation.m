@interface THMutableAnnotation
- (BOOL)annotationHasNote;
- (BOOL)annotationIsUnderline;
- (NSDate)annotationCreationDate;
- (NSDate)annotationModificationDate;
- (NSString)annotationLocation;
- (NSString)annotationNote;
- (NSString)annotationRepresentativeText;
- (NSString)annotationSelectedText;
- (NSString)annotationUuid;
- (NSString)redactedAnnotationLocation;
- (THMutableAnnotation)initWithAEAnnotation:(id)a3;
- (_NSRange)annotationStorageRange;
- (id)annotationStorageUID;
- (int)annotationStyle;
- (int)annotationType;
- (void)dealloc;
- (void)setAnnotationNote:(id)a3;
- (void)setAnnotationStorageRange:(_NSRange)a3;
- (void)setAnnotationStyle:(int)a3;
@end

@implementation THMutableAnnotation

- (THMutableAnnotation)initWithAEAnnotation:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)THMutableAnnotation;
  v4 = [(THMutableAnnotation *)&v6 init];
  if (v4) {
    v4->_annotation = (AEAnnotation *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THMutableAnnotation;
  [(THMutableAnnotation *)&v3 dealloc];
}

- (NSString)annotationUuid
{
  return (NSString *)[(AEAnnotation *)self->_annotation annotationUuid];
}

- (NSDate)annotationCreationDate
{
  return (NSDate *)[(AEAnnotation *)self->_annotation annotationCreationDate];
}

- (NSDate)annotationModificationDate
{
  return (NSDate *)[(AEAnnotation *)self->_annotation annotationModificationDate];
}

- (int)annotationStyle
{
  return [(AEAnnotation *)self->_annotation annotationStyle];
}

- (void)setAnnotationStyle:(int)a3
{
}

- (int)annotationType
{
  return [(AEAnnotation *)self->_annotation annotationType];
}

- (NSString)annotationLocation
{
  return (NSString *)[(AEAnnotation *)self->_annotation annotationLocation];
}

- (NSString)redactedAnnotationLocation
{
  return (NSString *)[(AEAnnotation *)self->_annotation redactedAnnotationLocation];
}

- (NSString)annotationNote
{
  return (NSString *)[(AEAnnotation *)self->_annotation annotationNote];
}

- (void)setAnnotationNote:(id)a3
{
}

- (BOOL)annotationHasNote
{
  return [[(NSString *)[(THMutableAnnotation *)self annotationNote] stringByTrimmingCharactersInSet:+[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] != 0;
}

- (NSString)annotationSelectedText
{
  return (NSString *)[(AEAnnotation *)self->_annotation annotationSelectedText];
}

- (NSString)annotationRepresentativeText
{
  return (NSString *)[(AEAnnotation *)self->_annotation annotationRepresentativeText];
}

- (id)annotationStorageUID
{
  return [(AEAnnotation *)self->_annotation plStorageUUID];
}

- (_NSRange)annotationStorageRange
{
  id v2 = [(AEAnnotation *)self->_annotation annotationStorageRange];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)setAnnotationStorageRange:(_NSRange)a3
{
}

- (BOOL)annotationIsUnderline
{
  return [(AEAnnotation *)self->_annotation annotationIsUnderline];
}

@end