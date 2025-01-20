@interface TTRIInlinePermissionHeaderViewCell
+ (Class)containerViewClass;
- (_TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell)initWithCoder:(id)a3;
- (_TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)prepareForReuse;
@end

@implementation TTRIInlinePermissionHeaderViewCell

+ (Class)containerViewClass
{
  sub_1B90BFD68(0, &qword_1E9F07260);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell *)sub_1B98B7CEC((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B98B5DD4);
}

- (_TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B98B8608();
}

- (void)prepareForReuse
{
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v2 = (char *)v12.receiver;
  [(TTRIInlinePermissionHeaderViewCell *)&v12 prepareForReuse];
  uint64_t v14 = 0;
  memset(v13, 0, sizeof(v13));
  id v3 = &v2[OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration];
  uint64_t v4 = *(void *)&v2[OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration + 16];
  if (v4)
  {
    unint64_t v6 = *((void *)v3 + 5);
    v5 = (void *)*((void *)v3 + 6);
    uint64_t v8 = *((void *)v3 + 3);
    uint64_t v7 = *((void *)v3 + 4);
    v10 = *(void **)v3;
    uint64_t v9 = *((void *)v3 + 1);
    _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
    id v11 = v10;
    _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
    sub_1B974C180(v6, v5);
    sub_1B98B84F8(v10, v9, v4, v8, v7, v6, v5);
    sub_1B98B84F8(0, 0, 0, 0, 0, 0, 0);
    sub_1B98B55E0(v13);
  }
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell____lazy_storage___bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell____lazy_storage___dismissButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration);
  uint64_t v4 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                  + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection
                  + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration);
  unint64_t v8 = *(unint64_t *)((char *)&self->super.super.super._swiftAnimationInfo
                           + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration);
  uint64_t v9 = *(_UITraitChangeRegistry **)((char *)&self->super.super.super._traitChangeRegistry
                                  + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration);

  sub_1B98B84F8(v3, v4, v5, v6, v7, v8, v9);
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v27 = sub_1B98B67FC(&OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell____lazy_storage___titleLabel, 8, (SEL *)&selRef_labelColor);
  objc_msgSend(v27, sel_bounds);
  -[TTRIInlinePermissionHeaderViewCell convertRect:fromCoordinateSpace:](v5, sel_convertRect_fromCoordinateSpace_, v27);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(v27, sel_effectiveAlignmentRectInsets);
  double v16 = UIEdgeInsetsInsetRect(v7, v9, v11, v13, v14, v15);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [(TTRIInlinePermissionHeaderViewCell *)v5 bounds];
  _sSo23NSDirectionalEdgeInsetsV15RemindersUICoreE12forInsetting8toBecome15layoutDirectionABSo6CGRectV_AHSo021UIUserInterfaceLayoutK0VtcfC_0((unint64_t)[(TTRIInlinePermissionHeaderViewCell *)v5 effectiveUserInterfaceLayoutDirection], v23, v24, v25, v26, v16, v18, v20, v22);
  [(TTRIInlinePermissionHeaderViewCell *)v5 setSeparatorInset:0.0];
}

@end