@interface FTStartSpeechRequest
- (BOOL)disable_auto_punctuation;
- (BOOL)enable_endpoint_candidate;
- (BOOL)enable_hybrid_endpoint;
- (BOOL)enable_server_side_endpoint;
- (BOOL)enable_utterance_detection;
- (BOOL)is_far_field;
- (BOOL)keyboard_dictation;
- (BOOL)store_audio;
- (BOOL)stream_results;
- (BOOL)stream_unstable_results;
- (BOOL)tandem_mode;
- (FTStartSpeechRequest)initWithFlatbuffData:(id)a3;
- (FTStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechRequest *)a4;
- (FTStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechRequest *)a4 verify:(BOOL)a5;
- (NSArray)multi_user_parameters;
- (NSString)application_name;
- (NSString)client_endpointer_model_version;
- (NSString)device_os;
- (NSString)device_type;
- (NSString)experiment_id;
- (NSString)fork_id;
- (NSString)input_origin;
- (NSString)keyboard_identifier;
- (NSString)language;
- (NSString)metadata;
- (NSString)mic_type;
- (NSString)request_locale;
- (NSString)self_session_id;
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)task_name;
- (NSString)udm_host;
- (Offset<siri::speech::schema_fb::StartSpeechRequest>)addObjectToBuffer:(void *)a3;
- (id)flatbuffData;
- (id)initAndVerifyWithFlatbuffData:(id)a3;
- (id)multi_user_parameters_objectAtIndex:(unint64_t)a3;
- (int)start_audio_bookmark;
- (int)udm_port;
- (int64_t)codec;
- (int64_t)end_point_mode;
- (int64_t)speech_request_source;
- (unint64_t)multi_user_parameters_count;
- (unint64_t)start_endpointing_at;
- (unint64_t)start_recognition_at;
- (unsigned)initial_recognition_candidate_id;
- (unsigned)initial_result_candidate_id;
- (void)multi_user_parameters_enumerateObjectsUsingBlock:(id)a3;
@end

@implementation FTStartSpeechRequest

- (FTStartSpeechRequest)initWithFlatbuffData:(id)a3
{
  return [(FTStartSpeechRequest *)self initWithFlatbuffData:a3 root:0 verify:0];
}

- (id)initAndVerifyWithFlatbuffData:(id)a3
{
  return [(FTStartSpeechRequest *)self initWithFlatbuffData:a3 root:0 verify:1];
}

- (FTStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechRequest *)a4
{
  return [(FTStartSpeechRequest *)self initWithFlatbuffData:a3 root:a4 verify:0];
}

- (FTStartSpeechRequest)initWithFlatbuffData:(id)a3 root:(const StartSpeechRequest *)a4 verify:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)FTStartSpeechRequest;
  v10 = [(FTStartSpeechRequest *)&v26 init];
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
    a4 = (const StartSpeechRequest *)v12 + *v12;
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
  v19 = (siri::speech::schema_fb::StartSpeechRequest *)v10->_root;
  if (!v19) {
    goto LABEL_13;
  }
  if (!siri::speech::schema_fb::StartSpeechRequest::Verify(v19, (apple::aiml::flatbuffers2::Verifier *)v22)) {
LABEL_14:
  }
    v20 = 0;
  else {
LABEL_13:
  }
    v20 = v10;

  return v20;
}

- (NSString)speech_id
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

- (NSString)session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 6].var0;
  if (*(_WORD *)root[-v3 + 6].var0)
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

- (NSString)language
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 8].var0;
  if (*(_WORD *)root[-v3 + 8].var0)
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

- (NSString)task_name
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 10].var0;
  if (*(_WORD *)root[-v3 + 10].var0)
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

- (int64_t)codec
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xDu && (uint64_t v4 = *(unsigned __int16 *)v3[12].var0) != 0) {
    return *(int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (BOOL)stream_results
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xFu && (uint64_t v4 = *(unsigned __int16 *)v3[14].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)enable_server_side_endpoint
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x11u && (uint64_t v4 = *(unsigned __int16 *)v3[16].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)device_type
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 18].var0;
  if (*(_WORD *)root[-v3 + 18].var0)
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

- (NSString)device_os
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 20].var0;
  if (*(_WORD *)root[-v3 + 20].var0)
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

- (NSString)mic_type
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 22].var0;
  if (*(_WORD *)root[-v3 + 22].var0)
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

- (NSString)udm_host
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 24].var0;
  if (*(_WORD *)root[-v3 + 24].var0)
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

- (int)udm_port
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x1Bu && (uint64_t v4 = *(unsigned __int16 *)v3[26].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (BOOL)tandem_mode
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x1Du && (uint64_t v4 = *(unsigned __int16 *)v3[28].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)store_audio
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x1Fu && (uint64_t v4 = *(unsigned __int16 *)v3[30].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)stream_unstable_results
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x21u && (uint64_t v4 = *(unsigned __int16 *)v3[32].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)request_locale
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 34].var0;
  if (*(_WORD *)root[-v3 + 34].var0)
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

- (int64_t)end_point_mode
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x25u && (uint64_t v4 = *(unsigned __int16 *)v3[36].var0) != 0) {
    return *(int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (int)start_audio_bookmark
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x27u && (uint64_t v4 = *(unsigned __int16 *)v3[38].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (BOOL)is_far_field
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x29u && (uint64_t v4 = *(unsigned __int16 *)v3[40].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)enable_utterance_detection
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x2Bu && (uint64_t v4 = *(unsigned __int16 *)v3[42].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)enable_endpoint_candidate
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x2Du && (uint64_t v4 = *(unsigned __int16 *)v3[44].var0) != 0 && root[v4].var0[0] != 0;
}

- (unint64_t)start_recognition_at
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x2Fu && (uint64_t v4 = *(unsigned __int16 *)v3[46].var0) != 0) {
    return *(void *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (unint64_t)start_endpointing_at
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x31u && (uint64_t v4 = *(unsigned __int16 *)v3[48].var0) != 0) {
    return *(void *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (BOOL)enable_hybrid_endpoint
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x33u && (uint64_t v4 = *(unsigned __int16 *)v3[50].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)client_endpointer_model_version
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 52].var0;
  if (*(_WORD *)root[-v3 + 52].var0)
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

- (NSString)keyboard_identifier
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 54].var0;
  if (*(_WORD *)root[-v3 + 54].var0)
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

- (NSString)input_origin
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 56].var0;
  if (*(_WORD *)root[-v3 + 56].var0)
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

- (unsigned)initial_recognition_candidate_id
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x3Bu && (uint64_t v4 = *(unsigned __int16 *)v3[58].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (BOOL)disable_auto_punctuation
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x3Du && (uint64_t v4 = *(unsigned __int16 *)v3[60].var0) != 0 && root[v4].var0[0] != 0;
}

- (BOOL)keyboard_dictation
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  return *(unsigned __int16 *)v3->var0 >= 0x3Fu && (uint64_t v4 = *(unsigned __int16 *)v3[62].var0) != 0 && root[v4].var0[0] != 0;
}

- (NSString)experiment_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 64].var0;
  if (*(_WORD *)root[-v3 + 64].var0)
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

- (int64_t)speech_request_source
{
  root = self->_root;
  uint64_t v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x43u && (uint64_t v4 = *(unsigned __int16 *)v3[66].var0) != 0) {
    return *(int *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)fork_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 68].var0;
  if (*(_WORD *)root[-v3 + 68].var0)
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

- (NSString)application_name
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 70].var0;
  if (*(_WORD *)root[-v3 + 70].var0)
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

- (NSString)metadata
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 72].var0;
  if (*(_WORD *)root[-v3 + 72].var0)
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

- (NSArray)multi_user_parameters
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"multi_user_parameters"];
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF980] array];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__FTStartSpeechRequest_multi_user_parameters__block_invoke;
    v6[3] = &unk_265548F68;
    id v3 = v4;
    id v7 = v3;
    [(FTStartSpeechRequest *)self multi_user_parameters_enumerateObjectsUsingBlock:v6];
    [(NSMutableDictionary *)self->_storage setObject:v3 forKeyedSubscript:@"multi_user_parameters"];
  }
  return (NSArray *)v3;
}

uint64_t __45__FTStartSpeechRequest_multi_user_parameters__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)multi_user_parameters_objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"multi_user_parameters"];
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 objectAtIndexedSubscript:a3];
LABEL_3:
    v8 = v7;
    goto LABEL_8;
  }
  root = self->_root;
  v10 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v10->var0 >= 0x4Bu)
  {
    uint64_t v11 = *(unsigned __int16 *)v10[74].var0;
    if (v11)
    {
      uint64_t v12 = (uint64_t)&root[4 * a3 + v11 + *(unsigned int *)root[v11].var0];
      id v7 = [[FTUserParameters alloc] initWithFlatbuffData:self->_data root:v12 + 4 + *(unsigned int *)(v12 + 4) verify:0];
      goto LABEL_3;
    }
  }
  v8 = 0;
LABEL_8:

  return v8;
}

- (unint64_t)multi_user_parameters_count
{
  id v3 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"multi_user_parameters"];
  uint64_t v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 count];
  }
  else
  {
    root = self->_root;
    id v7 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v7->var0 >= 0x4Bu && (uint64_t v8 = *(unsigned __int16 *)v7[74].var0) != 0) {
      unint64_t v5 = *(unsigned int *)root[v8 + *(unsigned int *)root[v8].var0].var0;
    }
    else {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

- (void)multi_user_parameters_enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, FTUserParameters *, uint64_t, unsigned __int8 *))a3;
  unint64_t v5 = [(NSMutableDictionary *)self->_storage objectForKeyedSubscript:@"multi_user_parameters"];
  v6 = v5;
  if (v5)
  {
    [v5 enumerateObjectsUsingBlock:v4];
  }
  else
  {
    root = self->_root;
    uint64_t v8 = &root[-*(int *)root->var0];
    if (*(unsigned __int16 *)v8->var0 >= 0x4Bu)
    {
      uint64_t v9 = *(unsigned __int16 *)v8[74].var0;
      if (v9)
      {
        unsigned __int8 v20 = 0;
        v10 = &root[v9];
        uint64_t v11 = *(unsigned int *)v10->var0;
        uint64_t v13 = (uint64_t)&v10[v11 + 4];
        uint64_t v12 = *(unsigned int *)v10[v11].var0;
        if (v12)
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          uint64_t v16 = 4 * v12 - 4;
          do
          {
            uint64_t v17 = [[FTUserParameters alloc] initWithFlatbuffData:self->_data root:v13 + v14 + *(unsigned int *)(v13 + 4 * v15) verify:0];
            v4[2](v4, v17, v15, &v20);
            int v18 = v20;

            if (v18) {
              break;
            }
            ++v15;
            uint64_t v19 = v16;
            v16 -= 4;
            v14 += 4;
          }
          while (v19);
        }
      }
    }
  }
}

- (unsigned)initial_result_candidate_id
{
  root = self->_root;
  id v3 = &root[-*(int *)root->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0x4Du && (uint64_t v4 = *(unsigned __int16 *)v3[76].var0) != 0) {
    return *(_DWORD *)root[v4].var0;
  }
  else {
    return 0;
  }
}

- (NSString)self_session_id
{
  root = self->_root;
  uint64_t v3 = *(int *)root->var0;
  uint64_t v4 = *(unsigned __int16 *)root[-v3 + 78].var0;
  if (*(_WORD *)root[-v3 + 78].var0)
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
  id v7 = (void *)[[NSString alloc] initWithBytes:&v6[4] length:*(unsigned int *)root[v4 + v5].var0 encoding:4];
  return (NSString *)v7;
}

- (Offset<siri::speech::schema_fb::StartSpeechRequest>)addObjectToBuffer:(void *)a3
{
  uint64_t v140 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(FTStartSpeechRequest *)self speech_id];
  v6 = v5;
  if (!v5) {
    uint64_t v5 = &stru_270C008E8;
  }
  id v7 = (const char *)[(__CFString *)v5 UTF8String];
  size_t v8 = strlen(v7);
  int String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v7, v8);

  uint64_t v9 = [(FTStartSpeechRequest *)self session_id];
  v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_270C008E8;
  }
  uint64_t v11 = (const char *)[(__CFString *)v9 UTF8String];
  size_t v12 = strlen(v11);
  int v132 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v11, v12);

  uint64_t v13 = [(FTStartSpeechRequest *)self language];
  uint64_t v14 = v13;
  if (!v13) {
    uint64_t v13 = &stru_270C008E8;
  }
  uint64_t v15 = (const char *)[(__CFString *)v13 UTF8String];
  size_t v16 = strlen(v15);
  int v131 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v15, v16);

  uint64_t v17 = [(FTStartSpeechRequest *)self task_name];
  int v18 = v17;
  if (!v17) {
    uint64_t v17 = &stru_270C008E8;
  }
  uint64_t v19 = (const char *)[(__CFString *)v17 UTF8String];
  size_t v20 = strlen(v19);
  int v130 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v19, v20);

  int v129 = [(FTStartSpeechRequest *)self codec];
  int v128 = [(FTStartSpeechRequest *)self stream_results];
  int v127 = [(FTStartSpeechRequest *)self enable_server_side_endpoint];
  v21 = [(FTStartSpeechRequest *)self device_type];
  v22 = v21;
  if (!v21) {
    v21 = &stru_270C008E8;
  }
  long long v23 = (const char *)[(__CFString *)v21 UTF8String];
  size_t v24 = strlen(v23);
  int v126 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v23, v24);

  char v25 = [(FTStartSpeechRequest *)self device_os];
  objc_super v26 = v25;
  if (!v25) {
    char v25 = &stru_270C008E8;
  }
  v27 = (const char *)[(__CFString *)v25 UTF8String];
  size_t v28 = strlen(v27);
  int v125 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v27, v28);

  v29 = [(FTStartSpeechRequest *)self mic_type];
  v30 = v29;
  if (!v29) {
    v29 = &stru_270C008E8;
  }
  v31 = (const char *)[(__CFString *)v29 UTF8String];
  size_t v32 = strlen(v31);
  int v124 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v31, v32);

  v33 = [(FTStartSpeechRequest *)self udm_host];
  v34 = v33;
  if (!v33) {
    v33 = &stru_270C008E8;
  }
  v35 = (const char *)[(__CFString *)v33 UTF8String];
  size_t v36 = strlen(v35);
  int v123 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v35, v36);

  int v122 = [(FTStartSpeechRequest *)self udm_port];
  int v121 = [(FTStartSpeechRequest *)self tandem_mode];
  int v120 = [(FTStartSpeechRequest *)self store_audio];
  int v119 = [(FTStartSpeechRequest *)self stream_unstable_results];
  v37 = [(FTStartSpeechRequest *)self request_locale];
  v38 = v37;
  if (!v37) {
    v37 = &stru_270C008E8;
  }
  v39 = (const char *)[(__CFString *)v37 UTF8String];
  size_t v40 = strlen(v39);
  int v118 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v39, v40);

  int v117 = [(FTStartSpeechRequest *)self end_point_mode];
  int v116 = [(FTStartSpeechRequest *)self start_audio_bookmark];
  int v114 = [(FTStartSpeechRequest *)self is_far_field];
  int v113 = [(FTStartSpeechRequest *)self enable_utterance_detection];
  int v112 = [(FTStartSpeechRequest *)self enable_endpoint_candidate];
  uint64_t v111 = [(FTStartSpeechRequest *)self start_recognition_at];
  uint64_t v110 = [(FTStartSpeechRequest *)self start_endpointing_at];
  int v109 = [(FTStartSpeechRequest *)self enable_hybrid_endpoint];
  v41 = [(FTStartSpeechRequest *)self client_endpointer_model_version];
  v42 = v41;
  if (!v41) {
    v41 = &stru_270C008E8;
  }
  v43 = (const char *)[(__CFString *)v41 UTF8String];
  size_t v44 = strlen(v43);
  int v108 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v43, v44);

  v45 = [(FTStartSpeechRequest *)self keyboard_identifier];
  v46 = v45;
  if (!v45) {
    v45 = &stru_270C008E8;
  }
  v47 = (const char *)[(__CFString *)v45 UTF8String];
  size_t v48 = strlen(v47);
  int v107 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v47, v48);

  v49 = [(FTStartSpeechRequest *)self input_origin];
  v50 = v49;
  if (!v49) {
    v49 = &stru_270C008E8;
  }
  v51 = (const char *)[(__CFString *)v49 UTF8String];
  size_t v52 = strlen(v51);
  int v106 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v51, v52);

  int v105 = [(FTStartSpeechRequest *)self initial_recognition_candidate_id];
  int v104 = [(FTStartSpeechRequest *)self disable_auto_punctuation];
  int v103 = [(FTStartSpeechRequest *)self keyboard_dictation];
  v53 = [(FTStartSpeechRequest *)self experiment_id];
  v54 = v53;
  if (!v53) {
    v53 = &stru_270C008E8;
  }
  v55 = (const char *)[(__CFString *)v53 UTF8String];
  size_t v56 = strlen(v55);
  int v102 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v55, v56);

  int v101 = [(FTStartSpeechRequest *)self speech_request_source];
  v57 = [(FTStartSpeechRequest *)self fork_id];
  v58 = v57;
  if (!v57) {
    v57 = &stru_270C008E8;
  }
  v59 = (const char *)[(__CFString *)v57 UTF8String];
  size_t v60 = strlen(v59);
  int v100 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v59, v60);

  v61 = [(FTStartSpeechRequest *)self application_name];
  v62 = v61;
  if (!v61) {
    v61 = &stru_270C008E8;
  }
  v63 = (const char *)[(__CFString *)v61 UTF8String];
  size_t v64 = strlen(v63);
  int v99 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v63, v64);

  v65 = [(FTStartSpeechRequest *)self metadata];
  v66 = v65;
  if (!v65) {
    v65 = &stru_270C008E8;
  }
  v67 = (const char *)[(__CFString *)v65 UTF8String];
  size_t v68 = strlen(v67);
  int v98 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v67, v68);

  memset(&v138, 0, sizeof(v138));
  v69 = [(FTStartSpeechRequest *)self multi_user_parameters];
  std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>::reserve(&v138, [v69 count]);

  long long v136 = 0u;
  long long v137 = 0u;
  long long v134 = 0u;
  long long v135 = 0u;
  v70 = [(FTStartSpeechRequest *)self multi_user_parameters];
  v115 = self;
  uint64_t v71 = [v70 countByEnumeratingWithState:&v134 objects:v139 count:16];
  if (v71)
  {
    uint64_t v72 = *(void *)v135;
    do
    {
      for (uint64_t i = 0; i != v71; ++i)
      {
        if (*(void *)v135 != v72) {
          objc_enumerationMutation(v70);
        }
        int v74 = [*(id *)(*((void *)&v134 + 1) + 8 * i) addObjectToBuffer:a3];
        int v75 = v74;
        std::vector<int>::pointer end = v138.__end_;
        if (v138.__end_ >= v138.__end_cap_.__value_)
        {
          std::vector<int>::pointer begin = v138.__begin_;
          int64_t v79 = v138.__end_ - v138.__begin_;
          unint64_t v80 = v79 + 1;
          if ((unint64_t)(v79 + 1) >> 62) {
            std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
          }
          int64_t v81 = (char *)v138.__end_cap_.__value_ - (char *)v138.__begin_;
          if (((char *)v138.__end_cap_.__value_ - (char *)v138.__begin_) >> 1 > v80) {
            unint64_t v80 = v81 >> 1;
          }
          if ((unint64_t)v81 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v82 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v82 = v80;
          }
          if (v82)
          {
            v83 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::RecognitionToken>>>((uint64_t)&v138.__end_cap_, v82);
            std::vector<int>::pointer begin = v138.__begin_;
            std::vector<int>::pointer end = v138.__end_;
          }
          else
          {
            v83 = 0;
          }
          v84 = (int *)&v83[4 * v79];
          int *v84 = v75;
          v77 = v84 + 1;
          while (end != begin)
          {
            int v85 = *--end;
            *--v84 = v85;
          }
          v138.__begin_ = v84;
          v138.__end_ = v77;
          v138.__end_cap_.__value_ = (int *)&v83[4 * v82];
          if (begin) {
            operator delete(begin);
          }
        }
        else
        {
          *v138.__end_ = v74;
          v77 = end + 1;
        }
        v138.__end_ = v77;
      }
      uint64_t v71 = [v70 countByEnumeratingWithState:&v134 objects:v139 count:16];
    }
    while (v71);
  }

  if (v138.__end_ == v138.__begin_) {
    std::vector<int>::pointer v86 = (std::vector<int>::pointer)&apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::UserParameters>,std::allocator<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::UserParameters>>>(std::vector<apple::aiml::flatbuffers2::Offset<siri::speech::schema_fb::UserParameters>> const&)::t;
  }
  else {
    std::vector<int>::pointer v86 = v138.__begin_;
  }
  int v87 = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (uint64_t)v86, v138.__end_ - v138.__begin_);
  int v88 = [(FTStartSpeechRequest *)v115 initial_result_candidate_id];
  v89 = [(FTStartSpeechRequest *)v115 self_session_id];
  v90 = v89;
  if (!v89) {
    v89 = &stru_270C008E8;
  }
  v91 = (const char *)[(__CFString *)v89 UTF8String];
  size_t v92 = strlen(v91);
  LODWORD(v91) = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, v91, v92);

  *((unsigned char *)a3 + 70) = 1;
  int v93 = *((_DWORD *)a3 + 8);
  int v94 = *((_DWORD *)a3 + 12);
  int v95 = *((_DWORD *)a3 + 10);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 4, String);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 6, v132);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 8, v131);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 10, v130);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 12, v129, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 14, v128, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 16, v127, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 18, v126);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 20, v125);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 22, v124);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 24, v123);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 26, v122, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 28, v121, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 30, v120, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 32, v119, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 34, v118);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 36, v117, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 38, v116, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 40, v114, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 42, v113, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 44, v112, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>(a3, 46, v111, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned long long>(a3, 48, v110, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 50, v109, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 52, v108);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 54, v107);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 56, v106);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 58, v105, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 60, v104, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned char>(a3, 62, v103, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 64, v102);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 66, v101, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 68, v100);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 70, v99);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 72, v98);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 74, v87);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddElement<unsigned int>(a3, 76, v88, 0);
  apple::aiml::flatbuffers2::FlatBufferBuilder::AddOffset<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, 78, (int)v91);
  v96.var0 = apple::aiml::flatbuffers2::FlatBufferBuilder::EndTable((apple::aiml::flatbuffers2::FlatBufferBuilder *)a3, (unsigned __int16)v93 - (unsigned __int16)v94 + v95);
  if (v138.__begin_)
  {
    v138.__end_ = v138.__begin_;
    operator delete(v138.__begin_);
  }
  return v96;
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
  apple::aiml::flatbuffers2::FlatBufferBuilder::Finish((apple::aiml::flatbuffers2::FlatBufferBuilder *)&v3, [(FTStartSpeechRequest *)self addObjectToBuffer:&v3], 0, 0);
  operator new();
}

apple::aiml::flatbuffers2::DetachedBuffer *__36__FTStartSpeechRequest_flatbuffData__block_invoke(uint64_t a1)
{
  result = *(apple::aiml::flatbuffers2::DetachedBuffer **)(a1 + 32);
  if (result)
  {
    apple::aiml::flatbuffers2::DetachedBuffer::~DetachedBuffer(result);
    JUMPOUT(0x26120BA10);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end