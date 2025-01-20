@interface BookkeepingServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate)init;
@end

@implementation BookkeepingServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10000D174((uint64_t)v8, v7);

  return 1;
}

- (_TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate)init
{
}

- (void).cxx_destruct
{
  sub_1000050E0((uint64_t)self+ OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_suggestionsLoggerFactory);
  sub_1000050E0((uint64_t)self+ OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureServiceFactory);
  v3 = (char *)self
     + OBJC_IVAR____TtC33SiriSuggestionsBookkeepingService26BookkeepingServiceDelegate_featureFlagProvider;
  sub_1000050E0((uint64_t)v3);
}

@end