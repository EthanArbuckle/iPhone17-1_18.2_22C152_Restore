@interface SRSSPhoneticVocabularyIPAMappingHelper
+ (id)nvASRFromIPA:(id)a3 locale:(id)a4 separator:(id)a5;
- (_TtC30SpeechRecognitionSharedSupport38SRSSPhoneticVocabularyIPAMappingHelper)init;
@end

@implementation SRSSPhoneticVocabularyIPAMappingHelper

+ (id)nvASRFromIPA:(id)a3 locale:(id)a4 separator:(id)a5
{
  uint64_t v5 = sub_25E339720();
  unint64_t v7 = v6;
  uint64_t v8 = sub_25E339720();
  _s30SpeechRecognitionSharedSupport38SRSSPhoneticVocabularyIPAMappingHelperC5nvASR7fromIPA6locale9separatorS2S_S2StFZ_0(v5, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_25E339710();
  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC30SpeechRecognitionSharedSupport38SRSSPhoneticVocabularyIPAMappingHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SRSSPhoneticVocabularyIPAMappingHelper();
  return [(SRSSPhoneticVocabularyIPAMappingHelper *)&v3 init];
}

@end