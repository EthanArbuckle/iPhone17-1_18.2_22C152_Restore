@interface TTSAssistantVoiceMaps
- (NSDictionary)deprecatedVoicesMap;
- (NSDictionary)identifiersForVoicesMap;
- (NSDictionary)relativeOrderForVoicesMap;
- (NSDictionary)relativePitchOrderForVoicesMap;
- (NSDictionary)voicesForLanguageMap;
- (TTSAssistantVoiceMaps)init;
@end

@implementation TTSAssistantVoiceMaps

- (NSDictionary)voicesForLanguageMap
{
  return (NSDictionary *)sub_19CE42318((uint64_t)self, (uint64_t)a2, (void (*)(void))TTSAsset.AssistantVoiceMaps.voicesForLanguageMap.getter, &qword_1EB533D38);
}

- (NSDictionary)deprecatedVoicesMap
{
  return (NSDictionary *)sub_19CE42318((uint64_t)self, (uint64_t)a2, (void (*)(void))TTSAsset.AssistantVoiceMaps.deprecatedVoicesMap.getter, &qword_1EB534650);
}

- (NSDictionary)relativePitchOrderForVoicesMap
{
  return (NSDictionary *)sub_19CE42410((uint64_t)self, (uint64_t)a2, (void (*)(void))TTSAsset.AssistantVoiceMaps.relativePitchOrderForVoicesMap.getter);
}

- (NSDictionary)relativeOrderForVoicesMap
{
  return (NSDictionary *)sub_19CE42410((uint64_t)self, (uint64_t)a2, (void (*)(void))TTSAsset.AssistantVoiceMaps.relativeOrderForVoicesMap.getter);
}

- (NSDictionary)identifiersForVoicesMap
{
  return (NSDictionary *)sub_19CE42410((uint64_t)self, (uint64_t)a2, (void (*)(void))TTSAsset.AssistantVoiceMaps.identifiersForVoicesMap.getter);
}

- (TTSAssistantVoiceMaps)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end