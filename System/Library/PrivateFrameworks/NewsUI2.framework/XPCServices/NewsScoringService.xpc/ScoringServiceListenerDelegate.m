@interface ScoringServiceListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC18NewsScoringService30ScoringServiceListenerDelegate)init;
@end

@implementation ScoringServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = (id)NDScoringServiceXPCInterface();
  [v7 setExportedInterface:v9];

  [v7 setExportedObject:*(Class *)((char *)&v8->super.isa+ OBJC_IVAR____TtC18NewsScoringService30ScoringServiceListenerDelegate_scoringEngine)];
  [v7 resume];

  return 1;
}

- (_TtC18NewsScoringService30ScoringServiceListenerDelegate)init
{
  result = (_TtC18NewsScoringService30ScoringServiceListenerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18NewsScoringService30ScoringServiceListenerDelegate_scoringEngine));
}

@end