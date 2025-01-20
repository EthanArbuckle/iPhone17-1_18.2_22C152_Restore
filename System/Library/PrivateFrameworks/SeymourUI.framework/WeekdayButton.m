@interface WeekdayButton
- (_TtC9SeymourUI13WeekdayButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI13WeekdayButton)initWithFrame:(CGRect)a3;
- (void)buttonTapped:(id)a3;
- (void)updateConfiguration;
@end

@implementation WeekdayButton

- (_TtC9SeymourUI13WeekdayButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13WeekdayButton *)sub_23A3854DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13WeekdayButton)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_onTap);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider;
  id v6 = a3;
  sub_23A386D20(v12);
  uint64_t v7 = v12[1];
  uint64_t v8 = v16;
  *(void *)v5 = v12[0];
  *((void *)v5 + 1) = v7;
  long long v9 = v14;
  *((_OWORD *)v5 + 1) = v13;
  *((_OWORD *)v5 + 2) = v9;
  *((_OWORD *)v5 + 3) = v15;
  *((void *)v5 + 8) = v8;
  *(_OWORD *)(v5 + 72) = v17;
  *((void *)v5 + 11) = 0x4044000000000000;
  v10 = (char *)self + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_item;
  *(void *)v10 = 0;
  *((_WORD *)v10 + 4) = 0;

  result = (_TtC9SeymourUI13WeekdayButton *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_23A385BA4();
}

- (void)buttonTapped:(id)a3
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_item);
  if (v3)
  {
    v5 = *(void (**)(id, uint64_t))((char *)&self->super.super.super.super.super.isa
                                            + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_onTap);
    if (v5)
    {
      uint64_t v6 = *(unsigned __int16 *)((char *)&self->super.super.super.super._responderFlags
                               + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_item);
      id v7 = a3;
      uint64_t v8 = self;
      id v9 = v3;
      sub_239D03E2C((uint64_t)v5);
      v5(v9, v6);
      sub_239C25118((uint64_t)v5);
    }
  }
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_onTap));
  v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  v5 = *(UITraitCollection **)((char *)&self->super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super._swiftAnimationInfo
                  + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super._traitChangeRegistry
                  + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super._layerRetained
                  + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  id v9 = *(UIWindow **)((char *)&self->super.super.super._window + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  v10 = *(NSArray **)((char *)&self->super.super.super._gestureRecognizers
                    + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider));
  sub_239E12CCC(v3, v4, v5, v6, v7, v8);

  v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_item);
}

@end