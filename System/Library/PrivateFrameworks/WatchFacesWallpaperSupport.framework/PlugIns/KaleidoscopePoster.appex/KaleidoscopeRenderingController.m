@interface KaleidoscopeRenderingController
- (_TtC18KaleidoscopePoster31KaleidoscopeRenderingController)init;
- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4;
- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5;
- (void)rendererDidInvalidate:(id)a3;
@end

@implementation KaleidoscopeRenderingController

- (_TtC18KaleidoscopePoster31KaleidoscopeRenderingController)init
{
  return (_TtC18KaleidoscopePoster31KaleidoscopeRenderingController *)sub_10001554C();
}

- (void).cxx_destruct
{
}

- (void)renderer:(id)a3 didInitializeWithEnvironment:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  sub_1000156EC(v6, a4);

  swift_unknownObjectRelease();
}

- (void)renderer:(id)a3 didUpdateEnvironment:(id)a4 withTransition:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  id v8 = a5;
  v9 = self;
  sub_100015EA4(v7);

  swift_unknownObjectRelease();
}

- (void)rendererDidInvalidate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100015FFC();
}

@end