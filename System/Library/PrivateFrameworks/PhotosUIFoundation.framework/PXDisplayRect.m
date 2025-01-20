@interface PXDisplayRect
- (BOOL)isEqual:(id)a3;
- (CGRect)rectInCoordinateSpace:(id)a3;
- (PXDisplayRect)init;
- (PXDisplayRect)initWithRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (UICoordinateSpace)coordinateSpace;
- (id)copyWithZone:(void *)a3;
@end

@implementation PXDisplayRect

- (PXDisplayRect)initWithRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  return (PXDisplayRect *)PXDisplayRect.init(rect:in:)();
}

- (UICoordinateSpace)coordinateSpace
{
  v2 = self;
  v3 = (void *)sub_259D24A14();

  return (UICoordinateSpace *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_259D62BA8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = PXDisplayRect.isEqual(_:)((uint64_t)v8);

  sub_259D1BF30((uint64_t)v8, qword_26A3EC4B0);
  return v6 & 1;
}

- (CGRect)rectInCoordinateSpace:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_259D24E10((uint64_t)a3);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)copyWithZone:(void *)a3
{
  sub_259D24F94(v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_259D62ED8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

- (PXDisplayRect)init
{
}

- (void).cxx_destruct
{
}

@end