@interface _SFPBAudioData
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)audioBuffer;
- (NSData)jsonData;
- (NSString)formatID;
- (_SFPBAudioData)initWithDictionary:(id)a3;
- (_SFPBAudioData)initWithFacade:(id)a3;
- (_SFPBAudioData)initWithJSON:(id)a3;
- (double)sampleRate;
- (id)dictionaryRepresentation;
- (int)bitsPerChannel;
- (int)bytesPerFrame;
- (int)bytesPerPacket;
- (int)channelsPerFrame;
- (int)formatFlags;
- (int)framesPerPacket;
- (int)reserved;
- (unint64_t)hash;
- (void)setAudioBuffer:(id)a3;
- (void)setBitsPerChannel:(int)a3;
- (void)setBytesPerFrame:(int)a3;
- (void)setBytesPerPacket:(int)a3;
- (void)setChannelsPerFrame:(int)a3;
- (void)setFormatFlags:(int)a3;
- (void)setFormatID:(id)a3;
- (void)setFramesPerPacket:(int)a3;
- (void)setReserved:(int)a3;
- (void)setSampleRate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBAudioData

- (_SFPBAudioData)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBAudioData *)self init];
  if (v5)
  {
    v6 = [v4 audioBuffer];

    if (v6)
    {
      v7 = [v4 audioBuffer];
      [(_SFPBAudioData *)v5 setAudioBuffer:v7];
    }
    v8 = [v4 formatID];

    if (v8)
    {
      v9 = [v4 formatID];
      [(_SFPBAudioData *)v5 setFormatID:v9];
    }
    v10 = [v4 formatFlags];

    if (v10)
    {
      v11 = [v4 formatFlags];
      -[_SFPBAudioData setFormatFlags:](v5, "setFormatFlags:", [v11 intValue]);
    }
    if ([v4 hasSampleRate])
    {
      [v4 sampleRate];
      -[_SFPBAudioData setSampleRate:](v5, "setSampleRate:");
    }
    v12 = [v4 bitsPerChannel];

    if (v12)
    {
      v13 = [v4 bitsPerChannel];
      -[_SFPBAudioData setBitsPerChannel:](v5, "setBitsPerChannel:", [v13 intValue]);
    }
    v14 = [v4 bytesPerFrame];

    if (v14)
    {
      v15 = [v4 bytesPerFrame];
      -[_SFPBAudioData setBytesPerFrame:](v5, "setBytesPerFrame:", [v15 intValue]);
    }
    v16 = [v4 channelsPerFrame];

    if (v16)
    {
      v17 = [v4 channelsPerFrame];
      -[_SFPBAudioData setChannelsPerFrame:](v5, "setChannelsPerFrame:", [v17 intValue]);
    }
    v18 = [v4 bytesPerPacket];

    if (v18)
    {
      v19 = [v4 bytesPerPacket];
      -[_SFPBAudioData setBytesPerPacket:](v5, "setBytesPerPacket:", [v19 intValue]);
    }
    v20 = [v4 framesPerPacket];

    if (v20)
    {
      v21 = [v4 framesPerPacket];
      -[_SFPBAudioData setFramesPerPacket:](v5, "setFramesPerPacket:", [v21 intValue]);
    }
    v22 = [v4 reserved];

    if (v22)
    {
      v23 = [v4 reserved];
      -[_SFPBAudioData setReserved:](v5, "setReserved:", [v23 intValue]);
    }
    v24 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatID, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
}

- (int)reserved
{
  return self->_reserved;
}

- (int)framesPerPacket
{
  return self->_framesPerPacket;
}

- (int)bytesPerPacket
{
  return self->_bytesPerPacket;
}

- (int)channelsPerFrame
{
  return self->_channelsPerFrame;
}

- (int)bytesPerFrame
{
  return self->_bytesPerFrame;
}

- (int)bitsPerChannel
{
  return self->_bitsPerChannel;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (int)formatFlags
{
  return self->_formatFlags;
}

- (NSString)formatID
{
  return self->_formatID;
}

- (NSData)audioBuffer
{
  return self->_audioBuffer;
}

- (_SFPBAudioData)initWithDictionary:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_SFPBAudioData;
  v5 = [(_SFPBAudioData *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"audioBuffer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v6 options:0];
      [(_SFPBAudioData *)v5 setAudioBuffer:v7];
    }
    v21 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"formatID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBAudioData *)v5 setFormatID:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"formatFlags"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioData setFormatFlags:](v5, "setFormatFlags:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"sampleRate"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 doubleValue];
      -[_SFPBAudioData setSampleRate:](v5, "setSampleRate:");
    }
    v12 = [v4 objectForKeyedSubscript:@"bitsPerChannel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioData setBitsPerChannel:](v5, "setBitsPerChannel:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"bytesPerFrame"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioData setBytesPerFrame:](v5, "setBytesPerFrame:", [v13 intValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"channelsPerFrame"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioData setChannelsPerFrame:](v5, "setChannelsPerFrame:", [v14 intValue]);
    }
    v20 = v10;
    v15 = [v4 objectForKeyedSubscript:@"bytesPerPacket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioData setBytesPerPacket:](v5, "setBytesPerPacket:", [v15 intValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"framesPerPacket"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioData setFramesPerPacket:](v5, "setFramesPerPacket:", [v16 intValue]);
    }
    v17 = [v4 objectForKeyedSubscript:@"reserved"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBAudioData setReserved:](v5, "setReserved:", [v17 intValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (_SFPBAudioData)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBAudioData *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBAudioData *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_audioBuffer)
  {
    id v4 = [(_SFPBAudioData *)self audioBuffer];
    v5 = [v4 base64EncodedStringWithOptions:0];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"audioBuffer"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"audioBuffer"];
    }
  }
  if (self->_bitsPerChannel)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBAudioData bitsPerChannel](self, "bitsPerChannel"));
    [v3 setObject:v7 forKeyedSubscript:@"bitsPerChannel"];
  }
  if (self->_bytesPerFrame)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBAudioData bytesPerFrame](self, "bytesPerFrame"));
    [v3 setObject:v8 forKeyedSubscript:@"bytesPerFrame"];
  }
  if (self->_bytesPerPacket)
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBAudioData bytesPerPacket](self, "bytesPerPacket"));
    [v3 setObject:v9 forKeyedSubscript:@"bytesPerPacket"];
  }
  if (self->_channelsPerFrame)
  {
    v10 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBAudioData channelsPerFrame](self, "channelsPerFrame"));
    [v3 setObject:v10 forKeyedSubscript:@"channelsPerFrame"];
  }
  if (self->_formatFlags)
  {
    v11 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBAudioData formatFlags](self, "formatFlags"));
    [v3 setObject:v11 forKeyedSubscript:@"formatFlags"];
  }
  if (self->_formatID)
  {
    v12 = [(_SFPBAudioData *)self formatID];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"formatID"];
  }
  if (self->_framesPerPacket)
  {
    v14 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBAudioData framesPerPacket](self, "framesPerPacket"));
    [v3 setObject:v14 forKeyedSubscript:@"framesPerPacket"];
  }
  if (self->_reserved)
  {
    v15 = objc_msgSend(NSNumber, "numberWithInt:", -[_SFPBAudioData reserved](self, "reserved"));
    [v3 setObject:v15 forKeyedSubscript:@"reserved"];
  }
  if (self->_sampleRate != 0.0)
  {
    v16 = NSNumber;
    [(_SFPBAudioData *)self sampleRate];
    v17 = objc_msgSend(v16, "numberWithDouble:");
    [v3 setObject:v17 forKeyedSubscript:@"sampleRate"];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_audioBuffer hash];
  NSUInteger v4 = [(NSString *)self->_formatID hash];
  uint64_t formatFlags = self->_formatFlags;
  double sampleRate = self->_sampleRate;
  if (sampleRate == 0.0)
  {
    unint64_t v10 = 0;
  }
  else
  {
    double v7 = -sampleRate;
    if (sampleRate >= 0.0) {
      double v7 = self->_sampleRate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v10 += (unint64_t)v9;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v9);
    }
  }
  return v4 ^ v3 ^ v10 ^ (2654435761 * formatFlags) ^ (2654435761 * self->_bitsPerChannel) ^ (2654435761
                                                                                                * self->_bytesPerFrame) ^ (2654435761 * self->_channelsPerFrame) ^ (2654435761 * self->_bytesPerPacket) ^ (2654435761 * self->_framesPerPacket) ^ (2654435761 * self->_reserved);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(_SFPBAudioData *)self audioBuffer];
  uint64_t v6 = [v4 audioBuffer];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(_SFPBAudioData *)self audioBuffer];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(_SFPBAudioData *)self audioBuffer];
    unint64_t v10 = [v4 audioBuffer];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(_SFPBAudioData *)self formatID];
  uint64_t v6 = [v4 formatID];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(_SFPBAudioData *)self formatID];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(_SFPBAudioData *)self formatID];
    v15 = [v4 formatID];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  int formatFlags = self->_formatFlags;
  if (formatFlags == [v4 formatFlags])
  {
    double sampleRate = self->_sampleRate;
    [v4 sampleRate];
    if (sampleRate == v21)
    {
      int bitsPerChannel = self->_bitsPerChannel;
      if (bitsPerChannel == [v4 bitsPerChannel])
      {
        int bytesPerFrame = self->_bytesPerFrame;
        if (bytesPerFrame == [v4 bytesPerFrame])
        {
          int channelsPerFrame = self->_channelsPerFrame;
          if (channelsPerFrame == [v4 channelsPerFrame])
          {
            int bytesPerPacket = self->_bytesPerPacket;
            if (bytesPerPacket == [v4 bytesPerPacket])
            {
              int framesPerPacket = self->_framesPerPacket;
              if (framesPerPacket == [v4 framesPerPacket])
              {
                int reserved = self->_reserved;
                BOOL v17 = reserved == [v4 reserved];
                goto LABEL_13;
              }
            }
          }
        }
      }
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  id v4 = [(_SFPBAudioData *)self audioBuffer];
  if (v4) {
    PBDataWriterWriteDataField();
  }

  v5 = [(_SFPBAudioData *)self formatID];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  if ([(_SFPBAudioData *)self formatFlags]) {
    PBDataWriterWriteInt32Field();
  }
  [(_SFPBAudioData *)self sampleRate];
  if (v6 != 0.0) {
    PBDataWriterWriteDoubleField();
  }
  if ([(_SFPBAudioData *)self bitsPerChannel]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBAudioData *)self bytesPerFrame]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBAudioData *)self channelsPerFrame]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBAudioData *)self bytesPerPacket]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_SFPBAudioData *)self framesPerPacket]) {
    PBDataWriterWriteInt32Field();
  }
  int v7 = [(_SFPBAudioData *)self reserved];
  long double v8 = v9;
  if (v7)
  {
    PBDataWriterWriteInt32Field();
    long double v8 = v9;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBAudioDataReadFrom(self, (uint64_t)a3);
}

- (void)setReserved:(int)a3
{
  self->_int reserved = a3;
}

- (void)setFramesPerPacket:(int)a3
{
  self->_int framesPerPacket = a3;
}

- (void)setBytesPerPacket:(int)a3
{
  self->_int bytesPerPacket = a3;
}

- (void)setChannelsPerFrame:(int)a3
{
  self->_int channelsPerFrame = a3;
}

- (void)setBytesPerFrame:(int)a3
{
  self->_int bytesPerFrame = a3;
}

- (void)setBitsPerChannel:(int)a3
{
  self->_int bitsPerChannel = a3;
}

- (void)setSampleRate:(double)a3
{
  self->_double sampleRate = a3;
}

- (void)setFormatFlags:(int)a3
{
  self->_int formatFlags = a3;
}

- (void)setFormatID:(id)a3
{
  self->_formatID = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAudioBuffer:(id)a3
{
  self->_audioBuffer = (NSData *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end