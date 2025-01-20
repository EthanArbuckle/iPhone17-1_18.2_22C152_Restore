@interface FTAudioAnalytics_SpeechRecognitionFeaturesEntry
- (FTAudioAnalytics_SpeechRecognitionFeaturesEntry)initWithFlatbuffData:(id)a3;
- (FTAudioAnalytics_SpeechRecognitionFeaturesEntry)initWithFlatbuffData:(id)a3 root:(const SpeechRecognitionFeaturesEntry *)a4;
- (FTAudioAnalytics_SpeechRecognitionFeaturesEntry)initWithFlatbuffData:(id)a3 root:(const SpeechRecognitionFeaturesEntry *)a4 verify:(BOOL)a5;
- (NSString)key;
- (Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>)addObjectToBuffer:(void *)a3;
- (float)value;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
@end

@implementation FTAudioAnalytics_SpeechRecognitionFeaturesEntry

- (FTAudioAnalytics_SpeechRecognitionFeaturesEntry)initWithFlatbuffData:(id)a3
{
  return [(FTAudioAnalytics_SpeechRecognitionFeaturesEntry *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTAudioAnalytics_SpeechRecognitionFeaturesEntry *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTAudioAnalytics_SpeechRecognitionFeaturesEntry)initWithFlatbuffData:(id)a3 root:(const SpeechRecognitionFeaturesEntry *)a4
{
  return [(FTAudioAnalytics_SpeechRecognitionFeaturesEntry *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTAudioAnalytics_SpeechRecognitionFeaturesEntry)initWithFlatbuffData:(id)a3 root:(const SpeechRecognitionFeaturesEntry *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTAudioAnalytics_SpeechRecognitionFeaturesEntry;
  v10 = [(FTAudioAnalytics_SpeechRecognitionFeaturesEntry *)&v26 init];
  if (!v10) {
    goto LABEL_13;
  }
  if (!v9 || ![v9 length]) {
    goto LABEL_14;
  }
  p_data = (id *)&v10->_data;
  objc_storeStrong((id *)&v10->_data, a3);
  if (!a4)
  {
    v12 = (unsigned int *)[*p_data bytes];
    a4 = (const SpeechRecognitionFeaturesEntry *)v12 + *v12;
  }
  v10->_root = a4;
  if (!v5) {
    goto LABEL_13;
  }
  unint64_t v13 = [*p_data bytes];
  uint64_t v14 = [*p_data length];
  root = v10->_root;
  if ((unint64_t)root < v13 || (unint64_t)root > v13 + v14) {
    goto LABEL_14;
  }
  uint64_t v17 = [*p_data bytes];
  uint64_t v18 = [*p_data length];
  v22[0] = v17;
  v22[1] = v18;
  long long v23 = xmmword_26027B7E0;
  uint64_t v24 = 0;
  char v25 = 1;
  v19 = (siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::FinishAudio_::ServerFeatureLatencyDistributionEntry::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22))LABEL_14:v20 = 0; {
  else
  }
LABEL_13:
    v20 = v10;

  return v20;
}

- (NSString)key
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (float)value
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  float result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 7u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[6].var0;
    if (v5) {
      return *(float *)root[v5].var0;
    }
  }
  return result;
}

- (Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(FTAudioAnalytics_SpeechRecognitionFeaturesEntry *)self key];
  v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_270C008E8;
  }
  v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  LODWORD(v7) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  [(FTAudioAnalytics_SpeechRecognitionFeaturesEntry *)self value];
  float v10 = v9;
  *((unsigned char *)a3 + 70) = 1;
  int v11 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, (int)v7);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<float>(a3, 6, v10, 0.0);
  return (Offset<siri::speech::schema_fb::AudioAnalytics_::SpeechRecognitionFeaturesEntry>)apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11);
}

- (id)flatbuffData
{
  uint64_t v3 = 0;
  char v4 = 0;
  long long v5 = xmmword_26027B7F0;
  long long v6 = 0u;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = 1;
  __int16 v10 = 256;
  uint64_t v11 = 0;
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTAudioAnalytics_SpeechRecognitionFeaturesEntry *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end