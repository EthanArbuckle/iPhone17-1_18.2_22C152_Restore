@interface FTMutableAudioFrame
- (FTMutableAudioFrame)init;
- (NSData)audio_bytes;
- (id)copyWithZone:(_NSZone *)a3;
- (void)audio_bytes:(id)a3;
- (void)setAudio_bytes:(id)a3;
@end

@implementation FTMutableAudioFrame

- (FTMutableAudioFrame)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableAudioFrame;
  v2 = [(FTMutableAudioFrame *)&v6 init];
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

- (NSData)audio_bytes
{
  return (NSData *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"audio_bytes"];
}

- (void)setAudio_bytes:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (void)audio_bytes:(id)a3
{
  v7 = (void (**)(id, uint64_t, uint64_t))a3;
  id v4 = [(FTMutableAudioFrame *)self audio_bytes];
  uint64_t v5 = [v4 bytes];
  objc_super v6 = [(FTMutableAudioFrame *)self audio_bytes];
  v7[2](v7, v5, [v6 length]);
}

@end