@interface MediaIntentHandler
- (_TtC5Music18MediaIntentHandler)init;
- (void)confirmPlayMedia:(id)a3 completion:(id)a4;
- (void)handlePlayMedia:(id)a3 completion:(id)a4;
@end

@implementation MediaIntentHandler

- (void)handlePlayMedia:(id)a3 completion:(id)a4
{
}

- (void)confirmPlayMedia:(id)a3 completion:(id)a4
{
}

- (_TtC5Music18MediaIntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaIntentHandler();
  return [(MediaIntentHandler *)&v3 init];
}

@end