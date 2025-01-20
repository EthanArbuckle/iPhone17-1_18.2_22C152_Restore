@interface SocialProfileCollectionViewTableLayout
- (_TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout)init;
- (_TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout)initWithCoder:(id)a3;
- (id)contextualActionForDeletingRowAtIndexPath:(id)a3;
@end

@implementation SocialProfileCollectionViewTableLayout

- (id)contextualActionForDeletingRowAtIndexPath:(id)a3
{
  uint64_t v5 = sub_AB1110();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_AB1080();
  id v9 = a3;
  v10 = self;
  id v11 = sub_1DA120((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

- (_TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SocialProfileCollectionViewTableLayout();
  return [(SocialProfileCollectionViewTableLayout *)&v4 init];
}

- (_TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC16MusicApplicationP33_D07372EB1E7BFF940D6ACB726B7DD12B38SocialProfileCollectionViewTableLayout_delegate] = 0;
  swift_unknownObjectWeakInit();
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SocialProfileCollectionViewTableLayout();
  id v5 = a3;
  uint64_t v6 = [(SocialProfileCollectionViewTableLayout *)&v8 initWithCoder:v5];

  return v6;
}

- (void).cxx_destruct
{
}

@end