@interface TTSAssistantAsset
- (BOOL)isCustom;
- (NSArray)supportedLanguages;
- (NSString)description;
- (NSString)identifier;
- (NSString)name;
- (NSString)primaryLanguage;
- (TTSAssistantAsset)init;
- (int64_t)assistantGender;
- (int64_t)assistantOrder;
- (int64_t)gender;
@end

@implementation TTSAssistantAsset

- (NSArray)supportedLanguages
{
  AssistantAsset.supportedLanguages.getter();
  v2 = (void *)sub_19CED5530();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSString)name
{
  return (NSString *)sub_19CE4201C((uint64_t)self, (uint64_t)a2, (void (*)(void))AssistantAsset.name.getter);
}

- (NSString)identifier
{
  return (NSString *)sub_19CE4201C((uint64_t)self, (uint64_t)a2, (void (*)(void))AssistantAsset.identifier.getter);
}

- (int64_t)assistantGender
{
  return AssistantAsset.assistantGender.getter();
}

- (int64_t)assistantOrder
{
  return AssistantAsset.assistantOrder.getter();
}

- (BOOL)isCustom
{
  v2 = self;
  char v3 = sub_19CE41F80();

  return v3 & 1;
}

- (NSString)primaryLanguage
{
  return (NSString *)sub_19CE4201C((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_19CE4206C);
}

- (int64_t)gender
{
  return AssistantAsset.assistantGender.getter();
}

- (NSString)description
{
  v2 = self;
  sub_19CE42148();

  char v3 = (void *)sub_19CED5230();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (TTSAssistantAsset)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end