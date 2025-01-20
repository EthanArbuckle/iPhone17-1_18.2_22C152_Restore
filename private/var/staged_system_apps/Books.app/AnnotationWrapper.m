@interface AnnotationWrapper
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
- (_TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper)init;
- (int)annotationStyle;
- (int)annotationType;
- (void)setAnnotationCreationDate:(id)a3;
- (void)setAnnotationLocation:(id)a3;
- (void)setAnnotationModificationDate:(id)a3;
- (void)setAnnotationNote:(id)a3;
- (void)setAnnotationRepresentativeText:(id)a3;
@end

@implementation AnnotationWrapper

- (int)annotationType
{
  return 2;
}

- (NSString)annotationLocation
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationLocation);
}

- (void)setAnnotationLocation:(id)a3
{
}

- (NSString)redactedAnnotationLocation
{
  NSString v2 = *(NSString *)&self->annotationLocation[OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationLocation];
  if (v2)
  {
    v3 = self;
    swift_bridgeObjectRetain();
    sub_1007FDDF0();

    swift_bridgeObjectRelease();
    NSString v2 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }

  return (NSString *)v2;
}

- (NSString)annotationNote
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationNote);
}

- (void)setAnnotationNote:(id)a3
{
}

- (NSString)annotationRepresentativeText
{
  return (NSString *)sub_10000AFB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationRepresentativeText);
}

- (void)setAnnotationRepresentativeText:(id)a3
{
}

- (NSString)annotationSelectedText
{
  if (*(void *)&self->annotationLocation[OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationRepresentativeText])
  {
    swift_bridgeObjectRetain();
    NSString v2 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)annotationUuid
{
  NSString v2 = self;
  id v3 = [(AnnotationWrapper *)v2 description];
  sub_1007FDC70();

  v7._countAndFlagsBits = 1145656661;
  v7._object = (void *)0xE400000000000000;
  sub_1007FDDE0(v7);

  NSString v4 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (NSDate)annotationCreationDate
{
  return (NSDate *)sub_10023DA7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationCreationDate);
}

- (void)setAnnotationCreationDate:(id)a3
{
}

- (NSDate)annotationModificationDate
{
  return (NSDate *)sub_10023DA7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper_annotationModificationDate);
}

- (void)setAnnotationModificationDate:(id)a3
{
}

- (int)annotationStyle
{
  return 3;
}

- (BOOL)annotationIsUnderline
{
  return 0;
}

- (BOOL)annotationHasNote
{
  NSString v2 = self;
  char v3 = sub_10023DD48();

  return v3 & 1;
}

- (_TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper)init
{
  result = (_TtC5BooksP33_68DD4628432DB32CCFA3947CA529962B17AnnotationWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end