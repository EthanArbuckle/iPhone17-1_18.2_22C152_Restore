@interface SSMLParserWrapperInternal
- (SSMLParserWrapperInternal)init;
- (id)generateSSMLFromAVSpeechUtterance:(id)a3;
- (id)generateSSMLFromPlainTalkString:(id)a3;
- (id)generateSSMLFromString:(id)a3;
- (id)parseSSMLToPlainTalk:(id)a3;
- (id)parseSSMLToPlainText:(id)a3;
@end

@implementation SSMLParserWrapperInternal

- (SSMLParserWrapperInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SSMLParserWrapper();
  return [(SSMLParserWrapperInternal *)&v3 init];
}

- (id)generateSSMLFromString:(id)a3
{
  sub_1A6892000();
  id v4 = objc_allocWithZone((Class)SSMLParseResult);
  v5 = self;
  id v6 = objc_msgSend(v4, sel_init);
  TTSMarkup.SpeechDocument.init(_:)((uint64_t (*)(void))sub_1A6861284, v9);
  TTSMarkup.SpeechDocument.asSSML()();
  sub_1A673E7EC((uint64_t)v9);
  v7 = (void *)sub_1A6891FD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setSsmlResult_, v7);

  swift_bridgeObjectRelease();

  return v6;
}

- (id)parseSSMLToPlainText:(id)a3
{
  return sub_1A6860D04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))_s12TextToSpeech17SSMLParserWrapperC016parseSSMLToPlainA0ySo15SSMLParseResultCSSF_0);
}

- (id)generateSSMLFromAVSpeechUtterance:(id)a3
{
  id v5 = objc_allocWithZone((Class)SSMLParseResult);
  id v6 = a3;
  v7 = self;
  id v8 = objc_msgSend(v5, sel_init);
  AVSpeechUtterance.asSpeech.getter(v11);
  TTSMarkup.SpeechDocument.asSSML()();
  sub_1A673E7EC((uint64_t)v11);
  v9 = (void *)sub_1A6891FD0();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setSsmlResult_, v9);

  return v8;
}

- (id)generateSSMLFromPlainTalkString:(id)a3
{
  return sub_1A6860D04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))_s12TextToSpeech17SSMLParserWrapperC12generateSSML19fromPlainTalkStringSo15SSMLParseResultCSS_tF_0);
}

- (id)parseSSMLToPlainTalk:(id)a3
{
  return sub_1A6860D04(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))_s12TextToSpeech17SSMLParserWrapperC20parseSSMLToPlainTalkySo15SSMLParseResultCSSF_0);
}

@end