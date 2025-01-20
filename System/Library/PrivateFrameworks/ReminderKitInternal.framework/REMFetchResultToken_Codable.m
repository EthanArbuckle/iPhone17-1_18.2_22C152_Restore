@interface REMFetchResultToken_Codable
+ (BOOL)supportsSecureCoding;
- (REMFetchResultToken_Codable)initWithPersistentHistoryTokens:(id)a3;
@end

@implementation REMFetchResultToken_Codable

- (REMFetchResultToken_Codable)initWithPersistentHistoryTokens:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1A72BEFEC(0, &qword_1EB701D30);
  sub_1A75723F0();
  v5 = (void *)sub_1A75723D0();
  swift_bridgeObjectRelease();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(REMFetchResultToken *)&v8 initWithPersistentHistoryTokens:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end