@interface CRLWPObjcUserDefaults
+ (_TtC8Freeform21CRLWPObjcUserDefaults)sharedUserDefaults;
- (BOOL)spellCheckingEnabled;
- (_TtC8Freeform21CRLWPObjcUserDefaults)init;
@end

@implementation CRLWPObjcUserDefaults

+ (_TtC8Freeform21CRLWPObjcUserDefaults)sharedUserDefaults
{
  if (qword_10166F930 != -1) {
    swift_once();
  }
  v2 = (void *)static CRLWPObjcUserDefaults.shared;

  return (_TtC8Freeform21CRLWPObjcUserDefaults *)v2;
}

- (BOOL)spellCheckingEnabled
{
  uint64_t v2 = qword_101670290;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  char v4 = sub_100B3428C();

  return (v4 == 2) | v4 & 1;
}

- (_TtC8Freeform21CRLWPObjcUserDefaults)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CRLWPObjcUserDefaults *)&v3 init];
}

@end