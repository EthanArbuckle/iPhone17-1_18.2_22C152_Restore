@interface SnippetSceneSettings
- (_TtC15SiriInteractive20SnippetSceneSettings)init;
- (_TtC15SiriInteractive20SnippetSceneSettings)initWithSettings:(id)a3;
- (id)keyDescriptionForSetting:(int64_t)a3;
- (id)mutableCopyWithZone:(void *)a3;
@end

@implementation SnippetSceneSettings

- (id)mutableCopyWithZone:(void *)a3
{
  return (id)sub_25C9A0BD8(self, (uint64_t)a2, (uint64_t)a3, type metadata accessor for LiveMutableSceneSettings);
}

- (id)keyDescriptionForSetting:(int64_t)a3
{
  return sub_25C9A0D9C(self, (uint64_t)a2, a3, (uint64_t (*)(uint64_t))type metadata accessor for SnippetSceneSettings);
}

- (_TtC15SiriInteractive20SnippetSceneSettings)initWithSettings:(id)a3
{
  id v4 = a3;
  return (_TtC15SiriInteractive20SnippetSceneSettings *)sub_25C9A0E20(a3, type metadata accessor for SnippetSceneSettings);
}

- (_TtC15SiriInteractive20SnippetSceneSettings)init
{
  return (_TtC15SiriInteractive20SnippetSceneSettings *)sub_25C9A0EB8(type metadata accessor for SnippetSceneSettings);
}

@end