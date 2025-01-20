@interface QSSMutableCheckForSpeechResponse
- (BOOL)speech_detected;
- (QSSMutableCheckForSpeechResponse)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setSpeech_detected:(BOOL)a3;
@end

@implementation QSSMutableCheckForSpeechResponse

- (void)setSpeech_detected:(BOOL)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithBool:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (BOOL)speech_detected
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"speech_detected"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableCheckForSpeechResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableCheckForSpeechResponse;
  v2 = [(QSSMutableCheckForSpeechResponse *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end