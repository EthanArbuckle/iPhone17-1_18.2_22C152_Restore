@interface SocialProfileEditorCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SocialProfileEditorCell

- (_TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell *)sub_53BE38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_53D860();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v10 = sub_AB6510();
  unint64_t v12 = v11;
  id v13 = a3;
  id v14 = a5;
  v15 = self;
  LOBYTE(length) = sub_53C200(v13, location, length, v10, v12);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_53C914();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell_customTopSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell_customBottomSeparatorView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplicationP33_73B7D12FF9680D385DB95E0148B1EC6623SocialProfileEditorCell_validationRule);
}

@end