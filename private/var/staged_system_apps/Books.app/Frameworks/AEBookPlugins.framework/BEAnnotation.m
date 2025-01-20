@interface BEAnnotation
- (BEAnnotation)init;
- (NSArray)rects;
- (NSString)cfi;
- (NSString)content;
- (NSString)debugDescription;
- (NSString)description;
- (void)setCfi:(id)a3;
- (void)setContent:(id)a3;
- (void)setRects:(id)a3;
@end

@implementation BEAnnotation

- (NSString)cfi
{
  return (NSString *)sub_12AD4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEAnnotation_cfi);
}

- (void)setCfi:(id)a3
{
}

- (NSArray)rects
{
  swift_beginAccess();
  type metadata accessor for CGRect(0);
  swift_bridgeObjectRetain();
  v2.super.isa = sub_1392E0().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setRects:(id)a3
{
  type metadata accessor for CGRect(0);
  uint64_t v4 = sub_1392F0();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___BEAnnotation_rects);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)content
{
  return (NSString *)sub_12AD4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEAnnotation_content);
}

- (void)setContent:(id)a3
{
}

- (BEAnnotation)init
{
  result = (BEAnnotation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___BEAnnotation_creationDate;
  uint64_t v4 = sub_138D40();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___BEAnnotation_modificationDate, v4);

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_12C0E0(self, (uint64_t)a2, (void (*)(void))Annotation.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_12C0E0(self, (uint64_t)a2, (void (*)(void))Annotation.debugDescription.getter);
}

@end