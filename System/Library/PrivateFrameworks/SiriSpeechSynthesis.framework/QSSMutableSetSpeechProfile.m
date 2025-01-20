@interface QSSMutableSetSpeechProfile
- (NSString)language;
- (NSString)session_id;
- (NSString)speech_id;
- (QSSMutableSetSpeechProfile)init;
- (QSSUserAcousticProfile)user_acoustic_profile;
- (QSSUserLanguageProfile)user_language_profile;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLanguage:(id)a3;
- (void)setSession_id:(id)a3;
- (void)setSpeech_id:(id)a3;
- (void)setUser_acoustic_profile:(id)a3;
- (void)setUser_language_profile:(id)a3;
@end

@implementation QSSMutableSetSpeechProfile

- (void)setLanguage:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)language
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"language"];
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

- (QSSMutableSetSpeechProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableSetSpeechProfile;
  v2 = [(QSSMutableSetSpeechProfile *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end