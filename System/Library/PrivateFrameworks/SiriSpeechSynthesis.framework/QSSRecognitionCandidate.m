@interface QSSRecognitionCandidate
- (NSString)language;
- (NSString)request_locale;
- (NSString)result_id;
- (NSString)return_str;
- (NSString)session_id;
- (NSString)speech_id;
- (Offset<siri::speech::schema_fb::RecognitionCandidate>)addObjectToBuffer:(void *)a3;
- (QSSAudioAnalytics)audio_analytics;
- (QSSLatnnMitigatorResult)latnn_mitigator_result;
- (QSSRecognitionCandidate)initWithFlatbuffData:(id)a3;
- (QSSRecognitionCandidate)initWithFlatbuffData:(id)a3 root:(const RecognitionCandidate *)a4;
- (QSSRecognitionCandidate)initWithFlatbuffData:(id)a3 root:(const RecognitionCandidate *)a4 verify:(BOOL)a5;
- (QSSRecognitionResult)recognition_result;
- (double)snr;
- (double)watermark_peak_average;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (int)return_code;
- (int64_t)fingerprint_detection;
- (int64_t)watermark_detection;
@end

@implementation QSSRecognitionCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

- (id)flatbuffData
{
  uint64_t v5 = 0;
  char v6 = 0;
  long long v7 = xmmword_22B64D0D0;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v10 = 0;
  uint64_t v11 = 1;
  __int16 v12 = 256;
  uint64_t v13 = 0;
  v2.var0 = [(QSSRecognitionCandidate *)self addObjectToBuffer:&v5];
  flatbuffers::FlatBufferBuilder::Finish((flatbuffers::FlatBufferBuilder *)&v5, v2.var0, v3);
  operator new();
}

flatbuffers::DetachedBuffer *__39__QSSRecognitionCandidate_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(flatbuffers::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    flatbuffers::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x230F4BA00);
  }
  return result;
}

- (Offset<siri::speech::schema_fb::RecognitionCandidate>)addObjectToBuffer:(void *)a3
{
  uint64_t v5 = [(QSSRecognitionCandidate *)self speech_id];
  char v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_26DEBFAF8;
  }
  long long v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  unsigned int String = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v10 = [(QSSRecognitionCandidate *)self session_id];
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = &stru_26DEBFAF8;
  }
  __int16 v12 = (const char *)[(__CFString *)v10 UTF8String];
  size_t v13 = strlen(v12);
  unsigned int v14 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v12, v13);

  int v15 = [(QSSRecognitionCandidate *)self return_code];
  v16 = [(QSSRecognitionCandidate *)self return_str];
  v17 = v16;
  if (!v16) {
    v16 = &stru_26DEBFAF8;
  }
  v18 = (const char *)[(__CFString *)v16 UTF8String];
  size_t v19 = strlen(v18);
  unsigned int v20 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v18, v19);

  v21 = [(QSSRecognitionCandidate *)self recognition_result];
  unsigned int v22 = [v21 addObjectToBuffer:a3];

  v23 = [(QSSRecognitionCandidate *)self result_id];
  v24 = v23;
  if (!v23) {
    v23 = &stru_26DEBFAF8;
  }
  v25 = (const char *)[(__CFString *)v23 UTF8String];
  size_t v26 = strlen(v25);
  unsigned int v50 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v25, v26);
  unsigned int v49 = v22;

  [(QSSRecognitionCandidate *)self snr];
  double v28 = v27;
  LODWORD(v25) = [(QSSRecognitionCandidate *)self fingerprint_detection];
  v29 = [(QSSRecognitionCandidate *)self audio_analytics];
  unsigned int v48 = [v29 addObjectToBuffer:a3];
  int v47 = (int)v25;
  unsigned int v30 = String;

  int v46 = [(QSSRecognitionCandidate *)self watermark_detection];
  [(QSSRecognitionCandidate *)self watermark_peak_average];
  double v32 = v31;
  v33 = [(QSSRecognitionCandidate *)self language];
  v34 = v33;
  if (!v33) {
    v33 = &stru_26DEBFAF8;
  }
  v35 = (const char *)[(__CFString *)v33 UTF8String];
  size_t v36 = strlen(v35);
  unsigned int v37 = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v35, v36);

  v38 = [(QSSRecognitionCandidate *)self latnn_mitigator_result];
  unsigned int v39 = [v38 addObjectToBuffer:a3];

  v40 = [(QSSRecognitionCandidate *)self request_locale];
  v41 = v40;
  if (!v40) {
    v40 = &stru_26DEBFAF8;
  }
  v42 = (const char *)[(__CFString *)v40 UTF8String];
  size_t v43 = strlen(v42);
  LODWORD(v42) = flatbuffers::FlatBufferBuilder::CreateString((flatbuffers::FlatBufferBuilder *)a3, v42, v43);

  flatbuffers::FlatBufferBuilder::NotNested((uint64_t)a3);
  *((unsigned char *)a3 + 70) = 1;
  int v44 = *((_DWORD *)a3 + 8) - *((_DWORD *)a3 + 12) + *((_DWORD *)a3 + 10);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 4, v30);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 6, v14);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 8, v15);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 10, v20);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 12, v49);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 14, v50);
  flatbuffers::FlatBufferBuilder::AddElement<double>((flatbuffers::vector_downward *)a3, 16, v28);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 18, v47);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 20, v48);
  flatbuffers::FlatBufferBuilder::AddElement<unsigned int>((unint64_t)a3, 22, v46);
  flatbuffers::FlatBufferBuilder::AddElement<double>((flatbuffers::vector_downward *)a3, 24, v32);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 26, v37);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 28, v39);
  flatbuffers::FlatBufferBuilder::AddOffset<flatbuffers::Vector<unsigned char>>((flatbuffers::FlatBufferBuilder *)a3, 30, v42);
  return (Offset<siri::speech::schema_fb::RecognitionCandidate>)flatbuffers::FlatBufferBuilder::EndTable((flatbuffers::FlatBufferBuilder *)a3, v44);
}

- (NSString)request_locale
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 30].var0;
  if (*(_WORD *)root[-v3 + 30].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  long long v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSLatnnMitigatorResult)latnn_mitigator_result
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"latnn_mitigator_result"];
  if (!v3)
  {
    uint64_t v4 = [QSSLatnnMitigatorResult alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x1Du && (uint64_t v7 = *(unsigned __int16 *)v6[28].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    uint64_t v3 = [(QSSLatnnMitigatorResult *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"latnn_mitigator_result"];
  }
  return v3;
}

- (NSString)language
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 26].var0;
  if (*(_WORD *)root[-v3 + 26].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (double)watermark_peak_average
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x19u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[24].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (int64_t)watermark_detection
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x17u && (uint64_t v4 = *(unsigned __int16 *)v3[22].var0) != 0) {
    return *(unsigned int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (QSSAudioAnalytics)audio_analytics
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"audio_analytics"];
  if (!v3)
  {
    uint64_t v4 = [QSSAudioAnalytics alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0x15u && (uint64_t v7 = *(unsigned __int16 *)v6[20].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    uint64_t v3 = [(QSSAudioAnalytics *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"audio_analytics"];
  }
  return v3;
}

- (int64_t)fingerprint_detection
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x13u && (uint64_t v4 = *(unsigned __int16 *)v3[18].var0) != 0) {
    return *(unsigned int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (double)snr
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  double result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0x11u)
  {
    uint64_t v5 = *(unsigned __int16 *)v3[16].var0;
    if (v5) {
      return *(double *)root[v5].var0;
    }
  }
  return result;
}

- (NSString)result_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 14].var0;
  if (*(_WORD *)root[-v3 + 14].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSRecognitionResult)recognition_result
{
  uint64_t v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"recognition_result"];
  if (!v3)
  {
    uint64_t v4 = [QSSRecognitionResult alloc];
    root = self->_root;
    char v6 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v6->var0 >= 0xDu && (uint64_t v7 = *(unsigned __int16 *)v6[12].var0) != 0) {
      size_t v8 = &root[v7 + *(unsigned int *)root[v7].var0];
    }
    else {
      size_t v8 = 0;
    }
    uint64_t v3 = [(QSSRecognitionResult *)v4 initWithFlatbuffData:self->_data root:v8 verify:0];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"recognition_result"];
  }
  return v3;
}

- (NSString)return_str
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (int)return_code
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (uint64_t v4 = *(unsigned __int16 *)v3[8].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (NSString)speech_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 4].var0;
  if (*(_WORD *)root[-v3 + 4].var0)
  {
    uint64_t v5 = *(unsigned int *)root[v4].var0;
    char v6 = &root[v4 + v5];
  }
  else
  {
    uint64_t v4 = 0;
    char v6 = 0;
    uint64_t v5 = *(unsigned int *)root->var0;
  }
  uint64_t v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (QSSRecognitionCandidate)initWithFlatbuffData:(id)a3 root:(const RecognitionCandidate *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v30.receiver = self;
  v30.super_class = (Class)QSSRecognitionCandidate;
  uint64_t v10 = [(QSSRecognitionCandidate *)&v30 init];
  uint64_t v11 = v10;
  if (v10)
  {
    if (!v9 || ![v9 length]) {
      goto LABEL_16;
    }
    p_data = (id *)&v10->_data;
    objc_storeStrong(p_data, a3);
    if (!a4)
    {
      size_t v13 = (unsigned int *)[*p_data bytes];
      a4 = (const RecognitionCandidate *)v13 + *v13;
    }
    v11->_root = a4;
    if (v5)
    {
      unint64_t v14 = [*p_data bytes];
      uint64_t v15 = [*p_data length];
      unint64_t var0 = (unint64_t)v11->_root->var0;
      if (var0 < v14 || var0 > v14 + v15) {
        goto LABEL_16;
      }
      uint64_t v18 = [*p_data bytes];
      unint64_t v19 = [*p_data length];
      uint64_t v25 = v18;
      unint64_t v26 = v19;
      long long v27 = xmmword_22B64D0E0;
      uint64_t v28 = 0;
      LOBYTE(v29) = 1;
      if (v19 >= 0x7FFFFFFF) {
        __assert_rtn("Verifier", "flatbuffers.h", 2141, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
      }
      root = (siri::speech::schema_fb::RecognitionCandidate *)v11->_root;
      if (root)
      {
        if (!siri::speech::schema_fb::RecognitionCandidate::Verify(root, (flatbuffers::Verifier *)&v25))
        {
LABEL_16:
          v23 = 0;
          goto LABEL_17;
        }
      }
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v25, v26, v27, v28, v29);
    storage = v11->_storage;
    v11->_storage = (NSMutableDictionary *)v21;
  }
  v23 = v11;
LABEL_17:

  return v23;
}

- (QSSRecognitionCandidate)initWithFlatbuffData:(id)a3 root:(const RecognitionCandidate *)a4
{
  return [(QSSRecognitionCandidate *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionCandidate *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (QSSRecognitionCandidate)initWithFlatbuffData:(id)a3
{
  return [(QSSRecognitionCandidate *)self initWithFlatbuffData:a3 root:0 verify:0];
}

@end