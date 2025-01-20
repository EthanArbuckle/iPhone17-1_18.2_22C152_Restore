@interface QSSMutableErrorBlamerRequest
- (NSArray)audio_packets;
- (NSArray)contextual_text;
- (NSString)left_context;
- (NSString)ref_transcript;
- (NSString)right_context;
- (QSSMutableErrorBlamerRequest)init;
- (QSSStartSpeechRequest)start_speech_request;
- (QSSUserAcousticProfile)user_acoustic_profile;
- (QSSUserLanguageProfile)user_language_profile;
- (double)latitude;
- (double)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAudio_packets:(id)a3;
- (void)setContextual_text:(id)a3;
- (void)setLatitude:(double)a3;
- (void)setLeft_context:(id)a3;
- (void)setLongitude:(double)a3;
- (void)setRef_transcript:(id)a3;
- (void)setRight_context:(id)a3;
- (void)setStart_speech_request:(id)a3;
- (void)setUser_acoustic_profile:(id)a3;
- (void)setUser_language_profile:(id)a3;
@end

@implementation QSSMutableErrorBlamerRequest

- (void)setRef_transcript:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)ref_transcript
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"ref_transcript"];
}

- (void)setAudio_packets:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)audio_packets
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"audio_packets"];
}

- (void)setLongitude:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)longitude
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"longitude"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setLatitude:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)latitude
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"latitude"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setUser_acoustic_profile:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSUserAcousticProfile)user_acoustic_profile
{
  return (QSSUserAcousticProfile *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_acoustic_profile"];
}

- (void)setUser_language_profile:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSUserLanguageProfile)user_language_profile
{
  return (QSSUserLanguageProfile *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"user_language_profile"];
}

- (void)setRight_context:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)right_context
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"right_context"];
}

- (void)setLeft_context:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)left_context
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"left_context"];
}

- (void)setContextual_text:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)contextual_text
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"contextual_text"];
}

- (void)setStart_speech_request:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSStartSpeechRequest)start_speech_request
{
  return (QSSStartSpeechRequest *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"start_speech_request"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableErrorBlamerRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableErrorBlamerRequest;
  v2 = [(QSSMutableErrorBlamerRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end