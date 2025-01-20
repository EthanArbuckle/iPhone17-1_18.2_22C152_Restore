@interface TTRBoardColumnItemLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (_TtC15RemindersUICore34TTRBoardColumnItemLayoutAttributes)init;
- (id)copyWithZone:(void *)a3;
@end

@implementation TTRBoardColumnItemLayoutAttributes

- (_TtC15RemindersUICore34TTRBoardColumnItemLayoutAttributes)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore34TTRBoardColumnItemLayoutAttributes_backgroundRoundedCorners) = (Class)15;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(UICollectionViewLayoutAttributes *)&v5 init];
}

- (id)copyWithZone:(void *)a3
{
  v4 = self;
  TTRBoardColumnItemLayoutAttributes.copy(with:)((uint64_t)a3, (uint64_t)v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  objc_super v5 = (void *)sub_1B9970B90();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B9970200();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    objc_super v5 = self;
  }
  BOOL v6 = TTRBoardColumnItemLayoutAttributes.isEqual(_:)((uint64_t)v8);

  sub_1B922A57C((uint64_t)v8);
  return v6;
}

@end