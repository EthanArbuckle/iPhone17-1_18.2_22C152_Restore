@interface DedupeElementCompat
- (BOOL)isDuplicate;
- (DedupeElementCompat)init;
- (DedupeElementCompat)initWithUiObject:(id)a3 isDuplicate:(BOOL)a4 screenID:(id)a5;
- (UIObjectCompat)uiObject;
- (void)setIsDuplicate:(BOOL)a3;
@end

@implementation DedupeElementCompat

- (UIObjectCompat)uiObject
{
  return (UIObjectCompat *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___DedupeElementCompat_uiObject));
}

- (BOOL)isDuplicate
{
  v2 = (BOOL *)self + OBJC_IVAR___DedupeElementCompat_isDuplicate;
  swift_beginAccess();
  return *v2;
}

- (void)setIsDuplicate:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___DedupeElementCompat_isDuplicate;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (DedupeElementCompat)initWithUiObject:(id)a3 isDuplicate:(BOOL)a4 screenID:(id)a5
{
  if (a5)
  {
    uint64_t v8 = sub_2606557B8();
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___DedupeElementCompat_screenID);
  uint64_t *v10 = 0;
  v10[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DedupeElementCompat_uiObject) = (Class)a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___DedupeElementCompat_isDuplicate) = a4;
  uint64_t *v10 = v8;
  v10[1] = v9;
  id v11 = a3;
  swift_bridgeObjectRelease();
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for DedupeElement();
  v12 = [(DedupeElementCompat *)&v14 init];

  return v12;
}

- (DedupeElementCompat)init
{
  result = (DedupeElementCompat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end