@interface FindMyActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
- (FindMyActionHandler)init;
@end

@implementation FindMyActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  sub_10011B194(v5, (uint64_t)a4);

  swift_unknownObjectRelease();
}

- (FindMyActionHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FindMyActionHandler();
  return [(FindMyActionHandler *)&v3 init];
}

@end