@interface QSSMutableTranslationRequest
- (BOOL)disable_log;
- (NSArray)translation_phrase;
- (NSString)app_id;
- (NSString)request_id;
- (NSString)sequence_id;
- (NSString)source_language;
- (NSString)speech_id;
- (NSString)target_language;
- (NSString)task;
- (NSString)use_case;
- (QSSMutableTranslationRequest)init;
- (QSSSiriPayloadTranslationInfo)siri_payload_translation_info;
- (QSSSiriTranslationInfo)siri_translation_info;
- (QSSSpeechTranslationInfo)speech_translation_info;
- (QSSWebTranslationInfo)web_translation_info;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)opt_in_status;
- (void)setApp_id:(id)a3;
- (void)setDisable_log:(BOOL)a3;
- (void)setOpt_in_status:(int64_t)a3;
- (void)setRequest_id:(id)a3;
- (void)setSequence_id:(id)a3;
- (void)setSiri_payload_translation_info:(id)a3;
- (void)setSiri_translation_info:(id)a3;
- (void)setSource_language:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setSpeech_translation_info:(id)a3;
- (void)setTarget_language:(id)a3;
- (void)setTask:(id)a3;
- (void)setTranslation_phrase:(id)a3;
- (void)setUse_case:(id)a3;
- (void)setWeb_translation_info:(id)a3;
@end

@implementation QSSMutableTranslationRequest

- (void)setUse_case:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)use_case
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"use_case"];
}

- (void)setApp_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)app_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"app_id"];
}

- (void)setOpt_in_status:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)opt_in_status
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"opt_in_status"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setDisable_log:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)disable_log
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"disable_log"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setWeb_translation_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSWebTranslationInfo)web_translation_info
{
  return (QSSWebTranslationInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"web_translation_info"];
}

- (void)setSequence_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)sequence_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"sequence_id"];
}

- (void)setSiri_payload_translation_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSSiriPayloadTranslationInfo)siri_payload_translation_info
{
  return (QSSSiriPayloadTranslationInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"siri_payload_translation_info"];
}

- (void)setSpeech_translation_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSSpeechTranslationInfo)speech_translation_info
{
  return (QSSSpeechTranslationInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_translation_info"];
}

- (void)setSiri_translation_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSSiriTranslationInfo)siri_translation_info
{
  return (QSSSiriTranslationInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"siri_translation_info"];
}

- (void)setTranslation_phrase:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)translation_phrase
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translation_phrase"];
}

- (void)setTarget_language:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)target_language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"target_language"];
}

- (void)setSource_language:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)source_language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"source_language"];
}

- (void)setTask:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)task
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"task"];
}

- (void)setRequest_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)request_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_id"];
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

- (QSSMutableTranslationRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTranslationRequest;
  v2 = [(QSSMutableTranslationRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end