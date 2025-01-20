@interface _SVXAudioStreamBasicDescriptionMutation
- (_SVXAudioStreamBasicDescriptionMutation)init;
- (_SVXAudioStreamBasicDescriptionMutation)initWithBaseModel:(id)a3;
- (id)generate;
- (void)setBitsPerChannel:(unsigned int)a3;
- (void)setBytesPerFrame:(unsigned int)a3;
- (void)setBytesPerPacket:(unsigned int)a3;
- (void)setChannelsPerFrame:(unsigned int)a3;
- (void)setFormatFlags:(unsigned int)a3;
- (void)setFormatID:(unsigned int)a3;
- (void)setFramesPerPacket:(unsigned int)a3;
- (void)setReserved:(unsigned int)a3;
- (void)setSampleRate:(double)a3;
@end

@implementation _SVXAudioStreamBasicDescriptionMutation

- (void).cxx_destruct
{
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel)
  {
    v5 = -[SVXAudioStreamBasicDescription initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:]([SVXAudioStreamBasicDescription alloc], "initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:", self->_formatID, self->_formatFlags, self->_bytesPerPacket, self->_framesPerPacket, self->_bytesPerFrame, self->_channelsPerFrame, self->_sampleRate, *(void *)&self->_bitsPerChannel);
    goto LABEL_25;
  }
  __int16 mutationFlags = (__int16)self->_mutationFlags;
  if ((mutationFlags & 1) == 0)
  {
    v5 = (SVXAudioStreamBasicDescription *)[(SVXAudioStreamBasicDescription *)baseModel copy];
    goto LABEL_25;
  }
  if ((mutationFlags & 2) != 0)
  {
    double sampleRate = self->_sampleRate;
    if ((mutationFlags & 4) != 0)
    {
LABEL_7:
      uint64_t formatID = self->_formatID;
      if ((mutationFlags & 8) != 0) {
        goto LABEL_8;
      }
      goto LABEL_17;
    }
  }
  else
  {
    [(SVXAudioStreamBasicDescription *)baseModel sampleRate];
    double sampleRate = v6;
    __int16 mutationFlags = (__int16)self->_mutationFlags;
    if ((mutationFlags & 4) != 0) {
      goto LABEL_7;
    }
  }
  uint64_t formatID = [(SVXAudioStreamBasicDescription *)self->_baseModel formatID];
  __int16 mutationFlags = (__int16)self->_mutationFlags;
  if ((mutationFlags & 8) != 0)
  {
LABEL_8:
    uint64_t formatFlags = self->_formatFlags;
    if ((mutationFlags & 0x10) != 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t formatFlags = [(SVXAudioStreamBasicDescription *)self->_baseModel formatFlags];
  __int16 mutationFlags = (__int16)self->_mutationFlags;
  if ((mutationFlags & 0x10) != 0)
  {
LABEL_9:
    uint64_t bytesPerPacket = self->_bytesPerPacket;
    if ((mutationFlags & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t bytesPerPacket = [(SVXAudioStreamBasicDescription *)self->_baseModel bytesPerPacket];
  __int16 mutationFlags = (__int16)self->_mutationFlags;
  if ((mutationFlags & 0x20) != 0)
  {
LABEL_10:
    uint64_t framesPerPacket = self->_framesPerPacket;
    if ((mutationFlags & 0x40) != 0) {
      goto LABEL_11;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t framesPerPacket = [(SVXAudioStreamBasicDescription *)self->_baseModel framesPerPacket];
  __int16 mutationFlags = (__int16)self->_mutationFlags;
  if ((mutationFlags & 0x40) != 0)
  {
LABEL_11:
    uint64_t bytesPerFrame = self->_bytesPerFrame;
    if ((mutationFlags & 0x80) != 0) {
      goto LABEL_12;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t bytesPerFrame = [(SVXAudioStreamBasicDescription *)self->_baseModel bytesPerFrame];
  __int16 mutationFlags = (__int16)self->_mutationFlags;
  if ((mutationFlags & 0x80) != 0)
  {
LABEL_12:
    uint64_t channelsPerFrame = self->_channelsPerFrame;
    if ((mutationFlags & 0x100) != 0) {
      goto LABEL_13;
    }
LABEL_22:
    unsigned int bitsPerChannel = [(SVXAudioStreamBasicDescription *)self->_baseModel bitsPerChannel];
    if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0) {
      goto LABEL_14;
    }
LABEL_23:
    unsigned int reserved = [(SVXAudioStreamBasicDescription *)self->_baseModel reserved];
    goto LABEL_24;
  }
LABEL_21:
  uint64_t channelsPerFrame = [(SVXAudioStreamBasicDescription *)self->_baseModel channelsPerFrame];
  __int16 mutationFlags = (__int16)self->_mutationFlags;
  if ((mutationFlags & 0x100) == 0) {
    goto LABEL_22;
  }
LABEL_13:
  unsigned int bitsPerChannel = self->_bitsPerChannel;
  if ((mutationFlags & 0x200) == 0) {
    goto LABEL_23;
  }
LABEL_14:
  unsigned int reserved = self->_reserved;
LABEL_24:
  v5 = -[SVXAudioStreamBasicDescription initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:]([SVXAudioStreamBasicDescription alloc], "initWithSampleRate:formatID:formatFlags:bytesPerPacket:framesPerPacket:bytesPerFrame:channelsPerFrame:bitsPerChannel:reserved:", formatID, formatFlags, bytesPerPacket, framesPerPacket, bytesPerFrame, channelsPerFrame, sampleRate, __PAIR64__(reserved, bitsPerChannel));
LABEL_25:

  return v5;
}

- (void)setReserved:(unsigned int)a3
{
  self->_unsigned int reserved = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (void)setBitsPerChannel:(unsigned int)a3
{
  self->_unsigned int bitsPerChannel = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (void)setChannelsPerFrame:(unsigned int)a3
{
  self->_uint64_t channelsPerFrame = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (void)setBytesPerFrame:(unsigned int)a3
{
  self->_uint64_t bytesPerFrame = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (void)setFramesPerPacket:(unsigned int)a3
{
  self->_uint64_t framesPerPacket = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (void)setBytesPerPacket:(unsigned int)a3
{
  self->_uint64_t bytesPerPacket = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (void)setFormatFlags:(unsigned int)a3
{
  self->_uint64_t formatFlags = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (void)setFormatID:(unsigned int)a3
{
  self->_uint64_t formatID = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (void)setSampleRate:(double)a3
{
  self->_double sampleRate = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (_SVXAudioStreamBasicDescriptionMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SVXAudioStreamBasicDescriptionMutation;
  double v6 = [(_SVXAudioStreamBasicDescriptionMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (_SVXAudioStreamBasicDescriptionMutation)init
{
  return [(_SVXAudioStreamBasicDescriptionMutation *)self initWithBaseModel:0];
}

@end