@interface CondensedEditorialSearchResultContentView
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeaderLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC8AppStore41CondensedEditorialSearchResultContentView)initWithCoder:(id)a3;
- (_TtC8AppStore41CondensedEditorialSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CondensedEditorialSearchResultContentView

- (_TtC8AppStore41CondensedEditorialSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore41CondensedEditorialSearchResultContentView *)CondensedEditorialSearchResultContentView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  CondensedEditorialSearchResultContentView.layoutSubviews()();
}

- (_TtC8AppStore41CondensedEditorialSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001D4E50();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  CondensedEditorialSearchResultContentView.traitCollectionDidChange(_:)(v9);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityHeaderLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_headerLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_titleLabel));
}

- (void).cxx_destruct
{
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_itemLayoutContext, &qword_100984EA0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_viewButton));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_configuration;
  uint64_t v4 = type metadata accessor for CondensedSearchResultCardLayout.Configuration();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_iconGrid));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_action));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore41CondensedEditorialSearchResultContentView_buttonHandler);

  sub_10006012C(v5);
}

@end