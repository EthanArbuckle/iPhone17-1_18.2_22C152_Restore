@interface FTMutableResetServerEndpointer
- (FTMutableResetServerEndpointer)init;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)speech_packet_count;
- (void)setSpeech_packet_count:(int64_t)a3;
@end

@implementation FTMutableResetServerEndpointer

- (FTMutableResetServerEndpointer)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableResetServerEndpointer;
  v2 = [(FTMutableResetServerEndpointer *)&v6 init];
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

- (int64_t)speech_packet_count
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_packet_count"];
  int64_t v3 = [v2 longValue];

  return v3;
}

- (void)setSpeech_packet_count:(int64_t)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithLong:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end