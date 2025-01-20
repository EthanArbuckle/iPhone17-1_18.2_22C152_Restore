@interface RDAccountInitializer
+ (NSString)DidCompleteInitializeAllAccountsNotification;
- (_TtC7remindd20RDAccountInitializer)init;
@end

@implementation RDAccountInitializer

+ (NSString)DidCompleteInitializeAllAccountsNotification
{
  if (qword_100907568 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100942250;

  return (NSString *)v2;
}

- (_TtC7remindd20RDAccountInitializer)init
{
  result = (_TtC7remindd20RDAccountInitializer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end