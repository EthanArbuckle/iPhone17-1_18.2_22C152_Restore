@interface QSSMutableTextToSpeechCacheObject
- (NSArray)word_timing_info;
- (NSData)audio;
- (QSSMutableTextToSpeechCacheObject)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)audio:(id)a3;
- (void)setAudio:(id)a3;
- (void)setWord_timing_info:(id)a3;
@end

@implementation QSSMutableTextToSpeechCacheObject

- (void)setWord_timing_info:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)word_timing_info
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"word_timing_info"];
}

- (void)audio:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(QSSMutableTextToSpeechCacheObject *)self audio];
  uint64_t v5 = [v4 bytes];
  v6 = [(QSSMutableTextToSpeechCacheObject *)self audio];
  v7[2](v7, v5, [v6 length]);
}

- (void)setAudio:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSData)audio
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"audio"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableTextToSpeechCacheObject)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableTextToSpeechCacheObject;
  v2 = [(QSSMutableTextToSpeechCacheObject *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end