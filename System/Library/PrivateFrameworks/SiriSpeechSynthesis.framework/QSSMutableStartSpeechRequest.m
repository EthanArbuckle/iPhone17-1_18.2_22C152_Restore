@interface QSSMutableStartSpeechRequest
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
- (NSString)session_id;
- (NSString)speech_id;
- (NSString)task_name;
- (NSString)udm_host;
- (QSSMutableStartSpeechRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int)start_audio_bookmark;
- (int)udm_port;
- (int64_t)codec;
- (int64_t)end_point_mode;
- (int64_t)speech_request_source;
- (unint64_t)start_endpointing_at;
- (unint64_t)start_recognition_at;
- (unsigned)initial_recognition_candidate_id;
- (void)setApplication_name:(id)a3;
- (void)setClient_endpointer_model_version:(id)a3;
- (void)setCodec:(int64_t)a3;
- (void)setDevice_os:(id)a3;
- (void)setDevice_type:(id)a3;
- (void)setDisable_auto_punctuation:(BOOL)a3;
- (void)setEnable_endpoint_candidate:(BOOL)a3;
- (void)setEnable_hybrid_endpoint:(BOOL)a3;
- (void)setEnable_server_side_endpoint:(BOOL)a3;
- (void)setEnable_utterance_detection:(BOOL)a3;
- (void)setEnd_point_mode:(int64_t)a3;
- (void)setExperiment_id:(id)a3;
- (void)setFork_id:(id)a3;
- (void)setInitial_recognition_candidate_id:(unsigned int)a3;
- (void)setInput_origin:(id)a3;
- (void)setIs_far_field:(BOOL)a3;
- (void)setKeyboard_dictation:(BOOL)a3;
- (void)setKeyboard_identifier:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setMic_type:(id)a3;
- (void)setRequest_locale:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setSpeech_request_source:(int64_t)a3;
- (void)setStart_audio_bookmark:(int)a3;
- (void)setStart_endpointing_at:(unint64_t)a3;
- (void)setStart_recognition_at:(unint64_t)a3;
- (void)setStore_audio:(BOOL)a3;
- (void)setStream_results:(BOOL)a3;
- (void)setStream_unstable_results:(BOOL)a3;
- (void)setTandem_mode:(BOOL)a3;
- (void)setTask_name:(id)a3;
- (void)setUdm_host:(id)a3;
- (void)setUdm_port:(int)a3;
@end

@implementation QSSMutableStartSpeechRequest

- (void)setMetadata:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)metadata
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"metadata"];
}

- (void)setApplication_name:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)application_name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"application_name"];
}

- (void)setFork_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)fork_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"fork_id"];
}

- (void)setSpeech_request_source:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)speech_request_source
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_request_source"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setExperiment_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)experiment_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"experiment_id"];
}

- (void)setKeyboard_dictation:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)keyboard_dictation
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"keyboard_dictation"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDisable_auto_punctuation:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)disable_auto_punctuation
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"disable_auto_punctuation"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setInitial_recognition_candidate_id:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)initial_recognition_candidate_id
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"initial_recognition_candidate_id"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setInput_origin:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)input_origin
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"input_origin"];
}

- (void)setKeyboard_identifier:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)keyboard_identifier
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"keyboard_identifier"];
}

- (void)setClient_endpointer_model_version:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)client_endpointer_model_version
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"client_endpointer_model_version"];
}

- (void)setEnable_hybrid_endpoint:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)enable_hybrid_endpoint
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"enable_hybrid_endpoint"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setStart_endpointing_at:(unint64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedLong:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unint64_t)start_endpointing_at
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"start_endpointing_at"];
  unint64_t v3 = [v2 unsignedLongValue];

  return v3;
}

- (void)setStart_recognition_at:(unint64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedLong:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unint64_t)start_recognition_at
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"start_recognition_at"];
  unint64_t v3 = [v2 unsignedLongValue];

  return v3;
}

- (void)setEnable_endpoint_candidate:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)enable_endpoint_candidate
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"enable_endpoint_candidate"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setEnable_utterance_detection:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)enable_utterance_detection
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"enable_utterance_detection"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIs_far_field:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)is_far_field
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"is_far_field"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setStart_audio_bookmark:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)start_audio_bookmark
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"start_audio_bookmark"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setEnd_point_mode:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)end_point_mode
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"end_point_mode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setRequest_locale:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)request_locale
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_locale"];
}

- (void)setStream_unstable_results:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)stream_unstable_results
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"stream_unstable_results"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setStore_audio:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)store_audio
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"store_audio"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setTandem_mode:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)tandem_mode
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"tandem_mode"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setUdm_port:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)udm_port
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"udm_port"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setUdm_host:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)udm_host
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"udm_host"];
}

- (void)setMic_type:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)mic_type
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"mic_type"];
}

- (void)setDevice_os:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)device_os
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"device_os"];
}

- (void)setDevice_type:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)device_type
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"device_type"];
}

- (void)setEnable_server_side_endpoint:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)enable_server_side_endpoint
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"enable_server_side_endpoint"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setStream_results:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)stream_results
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"stream_results"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setCodec:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)codec
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"codec"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setTask_name:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)task_name
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"task_name"];
}

- (void)setLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language"];
}

- (void)setSession_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"session_id"];
}

- (void)setSpeech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_id"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableStartSpeechRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableStartSpeechRequest;
  v2 = [(QSSMutableStartSpeechRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end