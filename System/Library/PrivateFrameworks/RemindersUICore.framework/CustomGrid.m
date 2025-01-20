@interface CustomGrid
- (CGSize)intrinsicContentSize;
- (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB10CustomGrid)initWithArrangedSubviewRows:(id)a3;
- (id)initWithCoder:(uint64_t)a3;
- (id)initWithFrame:(double)a3;
@end

@implementation CustomGrid

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x1E4FB30D8];
  double v3 = *MEMORY[0x1E4FB30D8];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC15RemindersUICoreP33_34792CABF8531B98D43671B0DD1043EB10CustomGrid)initWithArrangedSubviewRows:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EB9ACBC0);
    sub_1B996EE50();
    a3 = (id)sub_1B996EE40();
    swift_bridgeObjectRelease();
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(NUIContainerGridView *)&v8 initWithArrangedSubviewRows:a3];

  return v6;
}

- (id)initWithFrame:(double)a3
{
  v10.receiver = a1;
  v10.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a2, a3, a4, a5);
}

- (id)initWithCoder:(uint64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v5, sel_initWithCoder_, a3);
}

@end