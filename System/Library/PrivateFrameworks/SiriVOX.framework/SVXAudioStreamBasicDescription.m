@interface SVXAudioStreamBasicDescription
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SVXAudioStreamBasicDescription)initWithCoder:(id)a3;
- (SVXAudioStreamBasicDescription)initWithSampleRate:(double)a3 formatID:(unsigned int)a4 formatFlags:(unsigned int)a5 bytesPerPacket:(unsigned int)a6 framesPerPacket:(unsigned int)a7 bytesPerFrame:(unsigned int)a8 channelsPerFrame:(unsigned int)a9 bitsPerChannel:(unsigned int)a10 reserved:(unsigned int)a11;
- (double)sampleRate;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unsigned)bitsPerChannel;
- (unsigned)bytesPerFrame;
- (unsigned)bytesPerPacket;
- (unsigned)channelsPerFrame;
- (unsigned)formatFlags;
- (unsigned)formatID;
- (unsigned)framesPerPacket;
- (unsigned)reserved;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXAudioStreamBasicDescription

- (unsigned)reserved
{
  return self->_reserved;
}

- (unsigned)bitsPerChannel
{
  return self->_bitsPerChannel;
}

- (unsigned)channelsPerFrame
{
  return self->_channelsPerFrame;
}

- (unsigned)bytesPerFrame
{
  return self->_bytesPerFrame;
}

- (unsigned)framesPerPacket
{
  return self->_framesPerPacket;
}

- (unsigned)bytesPerPacket
{
  return self->_bytesPerPacket;
}

- (unsigned)formatFlags
{
  return self->_formatFlags;
}

- (unsigned)formatID
{
  return self->_formatID;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  double sampleRate = self->_sampleRate;
  id v6 = a3;
  v7 = [v4 numberWithDouble:sampleRate];
  [v6 encodeObject:v7 forKey:@"SVXAudioStreamBasicDescription::sampleRate"];

  v8 = [NSNumber numberWithUnsignedInt:self->_formatID];
  [v6 encodeObject:v8 forKey:@"SVXAudioStreamBasicDescription::formatID"];

  v9 = [NSNumber numberWithUnsignedInt:self->_formatFlags];
  [v6 encodeObject:v9 forKey:@"SVXAudioStreamBasicDescription::formatFlags"];

  v10 = [NSNumber numberWithUnsignedInt:self->_bytesPerPacket];
  [v6 encodeObject:v10 forKey:@"SVXAudioStreamBasicDescription::bytesPerPacket"];

  v11 = [NSNumber numberWithUnsignedInt:self->_framesPerPacket];
  [v6 encodeObject:v11 forKey:@"SVXAudioStreamBasicDescription::framesPerPacket"];

  v12 = [NSNumber numberWithUnsignedInt:self->_bytesPerFrame];
  [v6 encodeObject:v12 forKey:@"SVXAudioStreamBasicDescription::bytesPerFrame"];

  v13 = [NSNumber numberWithUnsignedInt:self->_channelsPerFrame];
  [v6 encodeObject:v13 forKey:@"SVXAudioStreamBasicDescription::channelsPerFrame"];

  v14 = [NSNumber numberWithUnsignedInt:self->_bitsPerChannel];
  [v6 encodeObject:v14 forKey:@"SVXAudioStreamBasicDescription::bitsPerChannel"];

  id v15 = [NSNumber numberWithUnsignedInt:self->_reserved];
  [v6 encodeObject:v15 forKey:@"SVXAudioStreamBasicDescription::reserved"];
}

- (SVXAudioStreamBasicDescription)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXAudioStreamBasicDescription::sampleRate"];
  [v4 doubleValue];
  double v6 = v5;

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXAudioStreamBasicDescription::formatID"];
  uint64_t v8 = [v7 unsignedIntValue];

  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXAudioStreamBasicDescription::formatFlags"];
  uint64_t v10 = [v9 unsignedIntValue];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXAudioStreamBasicDescription::bytesPerPacket"];
  uint64_t v12 = [v11 unsignedIntValue];

  v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXAudioStreamBasicDescription::framesPerPacket"];
  uint64_t v14 = [v13 unsignedIntValue];

  id v15 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXAudioStreamBasicDescription::bytesPerFrame"];
  uint64_t v16 = [v15 unsignedIntValue];

  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXAudioStreamBasicDescription::channelsPerFrame"];
  uint64_t v18 = [v17 unsignedIntValue];

  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXAudioStreamBasicDescription::bitsPerChannel"];
  unsigned int v20 = [v19 unsignedIntValue];

  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SVXAudioStreamBasicDescription::reserved"];

  LODWORD(v3) = [v21 unsignedIntValue];
  return -[SVXAudioStreamBasicDescription initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:](self, "initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:", v8, v10, v12, v14, v16, v18, v6, __PAIR64__(v3, v20));
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SVXAudioStreamBasicDescription *)a3;
  if (self == v4)
  {
    BOOL v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      double sampleRate = self->_sampleRate;
      [(SVXAudioStreamBasicDescription *)v5 sampleRate];
      if (sampleRate == v7
        && (unsigned int formatID = self->_formatID, formatID == [(SVXAudioStreamBasicDescription *)v5 formatID])
        && (unsigned int formatFlags = self->_formatFlags,
            formatFlags == [(SVXAudioStreamBasicDescription *)v5 formatFlags])
        && (unsigned int bytesPerPacket = self->_bytesPerPacket,
            bytesPerPacket == [(SVXAudioStreamBasicDescription *)v5 bytesPerPacket])
        && (unsigned int framesPerPacket = self->_framesPerPacket,
            framesPerPacket == [(SVXAudioStreamBasicDescription *)v5 framesPerPacket])
        && (unsigned int bytesPerFrame = self->_bytesPerFrame,
            bytesPerFrame == [(SVXAudioStreamBasicDescription *)v5 bytesPerFrame])
        && (unsigned int channelsPerFrame = self->_channelsPerFrame,
            channelsPerFrame == [(SVXAudioStreamBasicDescription *)v5 channelsPerFrame])
        && (unsigned int bitsPerChannel = self->_bitsPerChannel,
            bitsPerChannel == [(SVXAudioStreamBasicDescription *)v5 bitsPerChannel]))
      {
        unsigned int reserved = self->_reserved;
        BOOL v16 = reserved == [(SVXAudioStreamBasicDescription *)v5 reserved];
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  v21 = [NSNumber numberWithDouble:self->_sampleRate];
  uint64_t v3 = [v21 hash];
  unsigned int v20 = [NSNumber numberWithUnsignedInt:self->_formatID];
  uint64_t v4 = [v20 hash] ^ v3;
  double v5 = [NSNumber numberWithUnsignedInt:self->_formatFlags];
  uint64_t v6 = [v5 hash];
  double v7 = [NSNumber numberWithUnsignedInt:self->_bytesPerPacket];
  uint64_t v8 = v4 ^ v6 ^ [v7 hash];
  v9 = [NSNumber numberWithUnsignedInt:self->_framesPerPacket];
  uint64_t v10 = [v9 hash];
  v11 = [NSNumber numberWithUnsignedInt:self->_bytesPerFrame];
  uint64_t v12 = v10 ^ [v11 hash];
  v13 = [NSNumber numberWithUnsignedInt:self->_channelsPerFrame];
  uint64_t v14 = v8 ^ v12 ^ [v13 hash];
  id v15 = [NSNumber numberWithUnsignedInt:self->_bitsPerChannel];
  uint64_t v16 = [v15 hash];
  v17 = [NSNumber numberWithUnsignedInt:self->_reserved];
  unint64_t v18 = v14 ^ v16 ^ [v17 hash];

  return v18;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SVXAudioStreamBasicDescription;
  double v5 = [(SVXAudioStreamBasicDescription *)&v8 description];
  v6 = (void *)[v4 initWithFormat:@"%@ {double sampleRate = %f, formatID = %u, formatFlags = %u, bytesPerPacket = %u, framesPerPacket = %u, bytesPerFrame = %u, channelsPerFrame = %u, bitsPerChannel = %u, reserved = %u}", v5, *(void *)&self->_sampleRate, self->_formatID, self->_formatFlags, self->_bytesPerPacket, self->_framesPerPacket, self->_bytesPerFrame, self->_channelsPerFrame, self->_bitsPerChannel, self->_reserved];

  return v6;
}

- (id)description
{
  return [(SVXAudioStreamBasicDescription *)self _descriptionWithIndent:0];
}

- (SVXAudioStreamBasicDescription)initWithSampleRate:(double)a3 formatID:(unsigned int)a4 formatFlags:(unsigned int)a5 bytesPerPacket:(unsigned int)a6 framesPerPacket:(unsigned int)a7 bytesPerFrame:(unsigned int)a8 channelsPerFrame:(unsigned int)a9 bitsPerChannel:(unsigned int)a10 reserved:(unsigned int)a11
{
  v19.receiver = self;
  v19.super_class = (Class)SVXAudioStreamBasicDescription;
  result = [(SVXAudioStreamBasicDescription *)&v19 init];
  if (result)
  {
    result->_double sampleRate = a3;
    result->_unsigned int formatID = a4;
    result->_unsigned int formatFlags = a5;
    result->_unsigned int bytesPerPacket = a6;
    result->_unsigned int framesPerPacket = a7;
    result->_unsigned int bytesPerFrame = a8;
    result->_unsigned int channelsPerFrame = a9;
    result->_unsigned int bitsPerChannel = a10;
    result->_unsigned int reserved = a11;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXAudioStreamBasicDescriptionMutation *))a3;
  if (v4)
  {
    double v5 = [[_SVXAudioStreamBasicDescriptionMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    uint64_t v6 = [(_SVXAudioStreamBasicDescriptionMutation *)v5 generate];
  }
  else
  {
    uint64_t v6 = (void *)[(SVXAudioStreamBasicDescription *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  uint64_t v3 = (void (**)(id, _SVXAudioStreamBasicDescriptionMutation *))a3;
  id v4 = objc_alloc_init(_SVXAudioStreamBasicDescriptionMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  double v5 = [(_SVXAudioStreamBasicDescriptionMutation *)v4 generate];

  return v5;
}

@end