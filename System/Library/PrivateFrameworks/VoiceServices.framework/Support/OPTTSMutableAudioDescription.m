@interface OPTTSMutableAudioDescription
- (OPTTSMutableAudioDescription)init;
- (double)sample_rate;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)bits_per_channel;
- (unsigned)bytes_per_frame;
- (unsigned)bytes_per_packet;
- (unsigned)channels_per_frame;
- (unsigned)format_flags;
- (unsigned)format_id;
- (unsigned)frames_per_packet;
- (unsigned)reserved;
- (void)setBits_per_channel:(unsigned int)a3;
- (void)setBytes_per_frame:(unsigned int)a3;
- (void)setBytes_per_packet:(unsigned int)a3;
- (void)setChannels_per_frame:(unsigned int)a3;
- (void)setFormat_flags:(unsigned int)a3;
- (void)setFormat_id:(unsigned int)a3;
- (void)setFrames_per_packet:(unsigned int)a3;
- (void)setReserved:(unsigned int)a3;
- (void)setSample_rate:(double)a3;
@end

@implementation OPTTSMutableAudioDescription

- (void)setReserved:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)reserved
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"reserved"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setBits_per_channel:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)bits_per_channel
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"bits_per_channel"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setChannels_per_frame:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)channels_per_frame
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"channels_per_frame"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setBytes_per_frame:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)bytes_per_frame
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"bytes_per_frame"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setFrames_per_packet:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)frames_per_packet
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"frames_per_packet"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setBytes_per_packet:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)bytes_per_packet
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"bytes_per_packet"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setFormat_flags:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)format_flags
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"format_flags"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setFormat_id:(unsigned int)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (unsigned)format_id
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"format_id"];
  unsigned int v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setSample_rate:(double)a3
{
  id v4 = (id)[objc_alloc(NSNumber) initWithDouble:a3];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (double)sample_rate
{
  v2 = [(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"sample_rate"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (OPTTSMutableAudioDescription)init
{
  v6.receiver = self;
  v6.super_class = (Class)OPTTSMutableAudioDescription;
  v2 = [(OPTTSMutableAudioDescription *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end