@interface TPSContextualEventBuilder
- (NSDictionary)dictionary;
- (NSString)stream;
- (TPSContextualEventBuilder)init;
- (TPSContextualEventBuilder)initWithDictionary:(id)a3;
- (id)contextualEvent;
- (void)setDictionary:(id)a3;
- (void)setStream:(id)a3;
@end

@implementation TPSContextualEventBuilder

- (NSDictionary)dictionary
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (void)setDictionary:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSContextualEventBuilder_dictionary) = (Class)sub_1E451B818();

  swift_bridgeObjectRelease();
}

- (NSString)stream
{
  if (*(void *)&self->dictionary[OBJC_IVAR___TPSContextualEventBuilder_stream])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1E451B858();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setStream:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1E451B868();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___TPSContextualEventBuilder_stream);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (TPSContextualEventBuilder)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1E451B818();
  return (TPSContextualEventBuilder *)sub_1E44FA96C(v3);
}

- (id)contextualEvent
{
  v2 = self;
  id v3 = sub_1E44FAB54();

  return v3;
}

- (TPSContextualEventBuilder)init
{
  result = (TPSContextualEventBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end