@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC22TodayFeedConfigDecoder15ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = (id)NDTodayFeedConfigDecodingServiceXPCInterface();
  [v7 setExportedInterface:v9];

  id v10 = [objc_allocWithZone((Class)type metadata accessor for TodayFeedConfigDecodingService()) init];
  [v7 setExportedObject:v10];
  [v7 resume];

  return 1;
}

- (_TtC22TodayFeedConfigDecoder15ServiceDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ServiceDelegate();
  return [(ServiceDelegate *)&v3 init];
}

@end