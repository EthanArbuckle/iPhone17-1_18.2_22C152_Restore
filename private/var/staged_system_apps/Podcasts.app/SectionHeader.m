@interface SectionHeader
- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader)initWithCoder:(id)a3;
- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader)initWithReuseIdentifier:(id)a3;
@end

@implementation SectionHeader

- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader)initWithCoder:(id)a3
{
  v4 = (char *)self
     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader_firstContentDataInSection;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader *)sub_10031E2EC(v3, v4);
}

- (void).cxx_destruct
{
  sub_100054B1C((uint64_t)self+ OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader_firstContentDataInSection, &qword_1005FDDA0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader_imageView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2313SectionHeader_podcastTitleLabel);
}

@end