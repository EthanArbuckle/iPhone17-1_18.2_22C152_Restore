@interface LiveMutableSceneSettings
- (_TtC15SiriInteractive24LiveMutableSceneSettings)init;
- (_TtC15SiriInteractive24LiveMutableSceneSettings)initWithSettings:(id)a3;
- (id)copyWithZone:(void *)a3;
- (id)keyDescriptionForSetting:(int64_t)a3;
@end

@implementation LiveMutableSceneSettings

- (id)copyWithZone:(void *)a3
{
  return (id)sub_25C9A0BD8(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for SnippetSceneSettings);
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  return sub_25C9A0D9C(self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for LiveMutableSceneSettings);
}

- (_TtC15SiriInteractive24LiveMutableSceneSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  return (_TtC15SiriInteractive24LiveMutableSceneSettings *)sub_25C9A0E20(a3, type metadata accessor for LiveMutableSceneSettings);
}

- (_TtC15SiriInteractive24LiveMutableSceneSettings)init
{
  return (_TtC15SiriInteractive24LiveMutableSceneSettings *)sub_25C9A0EB8(type metadata accessor for LiveMutableSceneSettings);
}

@end