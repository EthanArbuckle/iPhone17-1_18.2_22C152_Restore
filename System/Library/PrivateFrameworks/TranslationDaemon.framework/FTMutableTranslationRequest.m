@interface FTMutableTranslationRequest
- (BOOL)disable_log;
- (BOOL)is_partial;
- (FTMutableTranslationRequest)init;
- (FTSiriPayloadTranslationInfo)siri_payload_translation_info;
- (FTSiriTranslationInfo)siri_translation_info;
- (FTSpeechTranslationInfo)speech_translation_info;
- (FTTranslationOptions)options;
- (FTWebTranslationInfo)web_translation_info;
- (NSArray)translation_phrase;
- (NSString)app_id;
- (NSString)request_id;
- (NSString)sequence_id;
- (NSString)source_language;
- (NSString)speech_id;
- (NSString)target_language;
- (NSString)task;
- (NSString)use_case;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)opt_in_status;
- (void)setApp_id:(id)a3;
- (void)setDisable_log:(BOOL)a3;
- (void)setIs_partial:(BOOL)a3;
- (void)setOpt_in_status:(int64_t)a3;
- (void)setOptions:(id)a3;
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

@implementation FTMutableTranslationRequest

- (FTMutableTranslationRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableTranslationRequest;
  v2 = [(FTMutableTranslationRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  objc_super v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSString)speech_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_id"];
}

- (void)setSpeech_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)request_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"request_id"];
}

- (void)setRequest_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)task
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"task"];
}

- (void)setTask:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)source_language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"source_language"];
}

- (void)setSource_language:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)target_language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"target_language"];
}

- (void)setTarget_language:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)translation_phrase
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"translation_phrase"];
}

- (void)setTranslation_phrase:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTSiriTranslationInfo)siri_translation_info
{
  return (FTSiriTranslationInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"siri_translation_info"];
}

- (void)setSiri_translation_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTSpeechTranslationInfo)speech_translation_info
{
  return (FTSpeechTranslationInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_translation_info"];
}

- (void)setSpeech_translation_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTSiriPayloadTranslationInfo)siri_payload_translation_info
{
  return (FTSiriPayloadTranslationInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"siri_payload_translation_info"];
}

- (void)setSiri_payload_translation_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)sequence_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"sequence_id"];
}

- (void)setSequence_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTWebTranslationInfo)web_translation_info
{
  return (FTWebTranslationInfo *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"web_translation_info"];
}

- (void)setWeb_translation_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)disable_log
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"disable_log"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setDisable_log:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)opt_in_status
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"opt_in_status"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setOpt_in_status:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)app_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"app_id"];
}

- (void)setApp_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)use_case
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"use_case"];
}

- (void)setUse_case:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTTranslationOptions)options
{
  return (FTTranslationOptions *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"options"];
}

- (void)setOptions:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)is_partial
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"is_partial"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setIs_partial:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end