@interface QSSMutableAudioLimitExceeded
- (QSSMutableAudioLimitExceeded)init;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation QSSMutableAudioLimitExceeded

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableAudioLimitExceeded)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableAudioLimitExceeded;
  v2 = [(QSSMutableAudioLimitExceeded *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end