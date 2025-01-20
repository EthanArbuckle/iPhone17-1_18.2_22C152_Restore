@interface QSSMutableFinalSpeechRecognitionResponse
- (BOOL)has_result;
- (NSString)language;
- (NSString)request_locale;
- (NSString)return_str;
- (NSString)session_id;
- (NSString)speech_id;
- (QSSAudioAnalytics)audio_analytics;
- (QSSLatnnMitigatorResult)latnn_mitigator_result;
- (QSSMutableFinalSpeechRecognitionResponse)init;
- (QSSRecognitionResult)recognition_result;
- (double)watermark_peak_average;
- (id)copyWithZone:(_NSZone *)a3;
- (int)return_code;
- (int64_t)lang_profile_recreate_codes;
- (int64_t)watermark_detection;
- (void)setAudio_analytics:(id)a3;
- (void)setHas_result:(BOOL)a3;
- (void)setLang_profile_recreate_codes:(int64_t)a3;
- (void)setLanguage:(id)a3;
- (void)setLatnn_mitigator_result:(id)a3;
- (void)setRecognition_result:(id)a3;
- (void)setRequest_locale:(id)a3;
- (void)setReturn_code:(int)a3;
- (void)setReturn_str:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setWatermark_detection:(int64_t)a3;
- (void)setWatermark_peak_average:(double)a3;
@end

@implementation QSSMutableFinalSpeechRecognitionResponse

- (void)setHas_result:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)has_result
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"has_result"];
  char v3 = [v2 BOOLValue];

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

- (void)setLatnn_mitigator_result:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSLatnnMitigatorResult)latnn_mitigator_result
{
  return (QSSLatnnMitigatorResult *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"latnn_mitigator_result"];
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

- (void)setWatermark_peak_average:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)watermark_peak_average
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"watermark_peak_average"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setWatermark_detection:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)watermark_detection
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"watermark_detection"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setAudio_analytics:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSAudioAnalytics)audio_analytics
{
  return (QSSAudioAnalytics *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"audio_analytics"];
}

- (void)setLang_profile_recreate_codes:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)lang_profile_recreate_codes
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"lang_profile_recreate_codes"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setRecognition_result:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSRecognitionResult)recognition_result
{
  return (QSSRecognitionResult *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"recognition_result"];
}

- (void)setReturn_str:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)return_str
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"return_str"];
}

- (void)setReturn_code:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)return_code
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"return_code"];
  int v3 = [v2 intValue];

  return v3;
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

- (QSSMutableFinalSpeechRecognitionResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableFinalSpeechRecognitionResponse;
  v2 = [(QSSMutableFinalSpeechRecognitionResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end