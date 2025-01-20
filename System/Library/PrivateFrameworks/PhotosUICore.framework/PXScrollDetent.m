@interface PXScrollDetent
- (BOOL)availableForScrollingGesture;
- (BOOL)isEqual:(id)a3;
- (NSString)debugDescription;
- (NSString)identifier;
- (PXScrollDetent)init;
- (PXScrollDetent)initWithIdentifier:(id)a3 offset:(double)a4 availableForScrollingGesture:(BOOL)a5;
- (double)offset;
@end

@implementation PXScrollDetent

- (NSString)identifier
{
}

- (double)offset
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___PXScrollDetent_offset);
}

- (BOOL)availableForScrollingGesture
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___PXScrollDetent_availableForScrollingGesture);
}

- (PXScrollDetent)initWithIdentifier:(id)a3 offset:(double)a4 availableForScrollingGesture:(BOOL)a5
{
  uint64_t v8 = sub_1AB23A76C();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___PXScrollDetent_identifier);
  uint64_t *v9 = v8;
  v9[1] = v10;
  *(double *)((char *)&self->super.isa + OBJC_IVAR___PXScrollDetent_offset) = a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___PXScrollDetent_availableForScrollingGesture) = a5;
  v12.receiver = self;
  v12.super_class = (Class)PXScrollDetent;
  return [(PXScrollDetent *)&v12 init];
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1AB23BC4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = PXScrollDetent.isEqual(_:)((uint64_t)v8);

  sub_1A9BA860C((uint64_t)v8);
  return v6 & 1;
}

- (NSString)debugDescription
{
  v2 = self;
  PXScrollDetent.debugDescription.getter();
}

- (PXScrollDetent)init
{
  result = (PXScrollDetent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end