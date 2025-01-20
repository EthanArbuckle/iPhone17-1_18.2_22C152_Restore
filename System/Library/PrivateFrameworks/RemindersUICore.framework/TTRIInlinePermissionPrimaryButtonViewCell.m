@interface TTRIInlinePermissionPrimaryButtonViewCell
+ (Class)containerViewClass;
- (_TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation TTRIInlinePermissionPrimaryButtonViewCell

+ (Class)containerViewClass
{
  sub_1B90BFD68(0, &qword_1E9F07280);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell *)sub_1B98B7CEC((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B98B7ACC);
}

- (_TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell____lazy_storage___primaryButton) = 0;
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  id v6 = a3;

  result = (_TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(TTRIInlinePermissionPrimaryButtonViewCell *)&v3 prepareForReuse];
  if (*(void *)&v2[OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration
                    + 8])
    sub_1B98B76F4(0, 0, 0, 0);
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell____lazy_storage___primaryButton));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration);
  uint64_t v4 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration);
  unint64_t v5 = *(unint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                           + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration);
  id v6 = *(NSMutableArray **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration);

  sub_1B95DC1A4(v3, v4, v5, v6);
}

@end