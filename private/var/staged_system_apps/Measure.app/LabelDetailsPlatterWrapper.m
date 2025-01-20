@interface LabelDetailsPlatterWrapper
- (void)remakePlatters;
- (void)touchBackgroundFrom:(id)a3;
@end

@implementation LabelDetailsPlatterWrapper

- (void)remakePlatters
{
  v2 = self;
  sub_1000B89E8();
}

- (void)touchBackgroundFrom:(id)a3
{
  v3 = *(char **)((char *)self + qword_1004C9218);
  if (v3)
  {
    v6 = &v3[qword_1004C86F0];
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v7 = *((void *)v6 + 1);
      uint64_t ObjectType = swift_getObjectType();
      v9 = *(void (**)(uint64_t, uint64_t))(v7 + 24);
      id v10 = a3;
      v11 = self;
      v12 = v3;
      v9(ObjectType, v7);

      swift_unknownObjectRelease();
    }
  }
}

@end