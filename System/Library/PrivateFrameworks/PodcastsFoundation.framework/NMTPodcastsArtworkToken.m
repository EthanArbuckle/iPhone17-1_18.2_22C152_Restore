@interface NMTPodcastsArtworkToken
- (CGColor)backgroundColor;
- (NMTPodcastsArtworkToken)init;
- (NMTPodcastsArtworkToken)initWithKey:(id)a3 backgroundColorString:(id)a4;
- (NSString)key;
- (void)setBackgroundColor:(CGColor *)a3;
@end

@implementation NMTPodcastsArtworkToken

- (NSString)key
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGColor)backgroundColor
{
  v2 = self;
  CGColorRef v3 = sub_1ACC14ACC();

  return v3;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  CGColorRef v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NMTPodcastsArtworkToken____lazy_storage___backgroundColor);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NMTPodcastsArtworkToken____lazy_storage___backgroundColor) = a3;
  v4 = a3;
  sub_1ACC14BC0(v3);
}

- (NMTPodcastsArtworkToken)initWithKey:(id)a3 backgroundColorString:(id)a4
{
  uint64_t v6 = sub_1ACE761B8();
  uint64_t v8 = v7;
  if (a4)
  {
    uint64_t v9 = sub_1ACE761B8();
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NMTPodcastsArtworkToken____lazy_storage___backgroundColor) = (Class)1;
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___NMTPodcastsArtworkToken_key);
  uint64_t *v11 = v6;
  v11[1] = v8;
  v12 = (uint64_t *)((char *)self + OBJC_IVAR___NMTPodcastsArtworkToken_backgroundColorString);
  uint64_t *v12 = v9;
  v12[1] = v10;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for NanoPodcastsArtworkToken();
  return [(NMTPodcastsArtworkToken *)&v14 init];
}

- (NMTPodcastsArtworkToken)init
{
  result = (NMTPodcastsArtworkToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1ACC14BC0(*(id *)((char *)&self->super.isa + OBJC_IVAR___NMTPodcastsArtworkToken____lazy_storage___backgroundColor));
  swift_bridgeObjectRelease();
}

@end