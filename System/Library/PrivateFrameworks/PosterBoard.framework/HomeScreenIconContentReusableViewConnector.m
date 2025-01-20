@interface HomeScreenIconContentReusableViewConnector
- (_TtC11PosterBoard42HomeScreenIconContentReusableViewConnector)init;
@end

@implementation HomeScreenIconContentReusableViewConnector

- (_TtC11PosterBoard42HomeScreenIconContentReusableViewConnector)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC11PosterBoard42HomeScreenIconContentReusableViewConnector_homeScreenIconContentLayout) = 0;
  uint64_t v3 = OBJC_IVAR____TtC11PosterBoard42HomeScreenIconContentReusableViewConnector_reusableHomeScreenIconContentViews;
  v4 = self;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_strongToStrongObjectsMapTable);
  *(Class *)((char *)&v5->super.isa
           + OBJC_IVAR____TtC11PosterBoard42HomeScreenIconContentReusableViewConnector_maximumNumberOfCachedIconContentViews) = (Class)10;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for HomeScreenIconContentReusableViewConnector();
  return [(HomeScreenIconContentReusableViewConnector *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11PosterBoard42HomeScreenIconContentReusableViewConnector_homeScreenIconContentLayout));
  uint64_t v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11PosterBoard42HomeScreenIconContentReusableViewConnector_reusableHomeScreenIconContentViews);
}

@end