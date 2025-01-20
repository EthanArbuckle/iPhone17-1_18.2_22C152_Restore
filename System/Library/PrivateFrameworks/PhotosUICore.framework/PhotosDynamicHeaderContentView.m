@interface PhotosDynamicHeaderContentView
- (BOOL)handlePrimaryAction:(id)a3;
- (UIEdgeInsets)safeAreaInsets;
- (_TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PhotosDynamicHeaderContentView

- (_TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AA135EEC();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PhotosDynamicHeaderContentView(0);
  id v2 = v3.receiver;
  [(PhotosDynamicHeaderContentView *)&v3 layoutSubviews];
  sub_1AB230B4C();
}

- (BOOL)handlePrimaryAction:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1AA12CBA8(v4);

  return self & 1;
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  self;
  sub_1AA12CFB4((uint64_t)a3);
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (_TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView)initWithFrame:(CGRect)a3
{
  UIEdgeInsets result = (_TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity
                  + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_configuration);
  uint64_t v4 = *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_configuration);
  unsigned __int8 v5 = *((unsigned char *)&self->super._cachedTraitCollection
       + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_configuration));
  sub_1A9B5371C(v3, v4, v5);
  sub_1AA137C40((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_1B50DC52D4D0467ED56FE78BF1017C3930PhotosDynamicHeaderContentView_insets, (unint64_t *)&unk_1E981CCF0, (uint64_t)&unk_1E981CCE0, (uint64_t)&protocol descriptor for PhotosDynamicHeaderInsets);
  swift_unknownObjectRelease();
  swift_release();
  sub_1AB23496C();
}

@end