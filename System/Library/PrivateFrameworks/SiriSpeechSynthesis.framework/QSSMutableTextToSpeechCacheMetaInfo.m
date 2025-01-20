@interface QSSMutableTextToSpeechCacheMetaInfo
- (BOOL)enable_word_timing_info;
- (NSString)original_session_id;
- (NSString)text;
- (QSSAudioDescription)decoder_description;
- (QSSAudioDescription)playback_description;
- (QSSMutableTextToSpeechCacheMetaInfo)init;
- (QSSTextToSpeechMeta)meta_info;
- (id)copyWithZone:(_NSZone *)a3;
- (int)audio_length;
- (int64_t)audio_type;
- (void)setAudio_length:(int)a3;
- (void)setAudio_type:(int64_t)a3;
- (void)setDecoder_description:(id)a3;
- (void)setEnable_word_timing_info:(BOOL)a3;
- (void)setMeta_info:(id)a3;
- (void)setOriginal_session_id:(id)a3;
- (void)setPlayback_description:(id)a3;
- (void)setText:(id)a3;
@end

@implementation QSSMutableTextToSpeechCacheMetaInfo

- (void)setOriginal_session_id:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)original_session_id
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"original_session_id"];
}

- (void)setText:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSString)text
{
  return (NSString *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"text"];
}

- (void)setAudio_length:(int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInt:*(void *)&a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int)audio_length
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"audio_length"];
  int v3 = [v2 intValue];

  return v3;
}

- (void)setPlayback_description:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSAudioDescription)playback_description
{
  return (QSSAudioDescription *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"playback_description"];
}

- (void)setDecoder_description:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSAudioDescription)decoder_description
{
  return (QSSAudioDescription *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"decoder_description"];
}

- (void)setEnable_word_timing_info:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)enable_word_timing_info
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"enable_word_timing_info"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setAudio_type:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (int64_t)audio_type
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"audio_type"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setMeta_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSTextToSpeechMeta)meta_info
{
  return (QSSTextToSpeechMeta *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"meta_info"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTextToSpeechCacheMetaInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechCacheMetaInfo;
  v2 = [(QSSMutableTextToSpeechCacheMetaInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end