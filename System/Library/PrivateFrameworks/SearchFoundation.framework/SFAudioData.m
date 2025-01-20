@interface SFAudioData
+ (BOOL)supportsSecureCoding;
- (BOOL)hasSampleRate;
- (BOOL)isEqual:(id)a3;
- (NSData)audioBuffer;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)bitsPerChannel;
- (NSNumber)bytesPerFrame;
- (NSNumber)bytesPerPacket;
- (NSNumber)channelsPerFrame;
- (NSNumber)formatFlags;
- (NSNumber)framesPerPacket;
- (NSNumber)reserved;
- (NSString)formatID;
- (SFAudioData)initWithCoder:(id)a3;
- (SFAudioData)initWithProtobuf:(id)a3;
- (double)sampleRate;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioBuffer:(id)a3;
- (void)setBitsPerChannel:(id)a3;
- (void)setBytesPerFrame:(id)a3;
- (void)setBytesPerPacket:(id)a3;
- (void)setChannelsPerFrame:(id)a3;
- (void)setFormatFlags:(id)a3;
- (void)setFormatID:(id)a3;
- (void)setFramesPerPacket:(id)a3;
- (void)setReserved:(id)a3;
- (void)setSampleRate:(double)a3;
@end

@implementation SFAudioData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reserved, 0);
  objc_storeStrong((id *)&self->_framesPerPacket, 0);
  objc_storeStrong((id *)&self->_bytesPerPacket, 0);
  objc_storeStrong((id *)&self->_channelsPerFrame, 0);
  objc_storeStrong((id *)&self->_bytesPerFrame, 0);
  objc_storeStrong((id *)&self->_bitsPerChannel, 0);
  objc_storeStrong((id *)&self->_formatFlags, 0);
  objc_storeStrong((id *)&self->_formatID, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
}

- (void)setReserved:(id)a3
{
}

- (NSNumber)reserved
{
  return self->_reserved;
}

- (void)setFramesPerPacket:(id)a3
{
}

- (NSNumber)framesPerPacket
{
  return self->_framesPerPacket;
}

- (void)setBytesPerPacket:(id)a3
{
}

- (NSNumber)bytesPerPacket
{
  return self->_bytesPerPacket;
}

- (void)setChannelsPerFrame:(id)a3
{
}

- (NSNumber)channelsPerFrame
{
  return self->_channelsPerFrame;
}

- (void)setBytesPerFrame:(id)a3
{
}

- (NSNumber)bytesPerFrame
{
  return self->_bytesPerFrame;
}

- (void)setBitsPerChannel:(id)a3
{
}

- (NSNumber)bitsPerChannel
{
  return self->_bitsPerChannel;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (void)setFormatFlags:(id)a3
{
}

- (NSNumber)formatFlags
{
  return self->_formatFlags;
}

- (void)setFormatID:(id)a3
{
}

- (NSString)formatID
{
  return self->_formatID;
}

- (void)setAudioBuffer:(id)a3
{
}

- (NSData)audioBuffer
{
  return self->_audioBuffer;
}

- (unint64_t)hash
{
  v25 = [(SFAudioData *)self audioBuffer];
  uint64_t v3 = [v25 hash];
  v24 = [(SFAudioData *)self formatID];
  uint64_t v22 = [v24 hash] ^ v3;
  v23 = [(SFAudioData *)self formatFlags];
  uint64_t v21 = [v23 hash];
  [(SFAudioData *)self sampleRate];
  double v5 = -v4;
  if (v4 >= 0.0) {
    double v5 = v4;
  }
  long double v6 = round(v5);
  unint64_t v20 = (unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL);
  v7 = [(SFAudioData *)self bitsPerChannel];
  uint64_t v19 = [v7 hash];
  v8 = [(SFAudioData *)self bytesPerFrame];
  uint64_t v9 = [v8 hash];
  v10 = [(SFAudioData *)self channelsPerFrame];
  uint64_t v11 = [v10 hash];
  v12 = [(SFAudioData *)self bytesPerPacket];
  uint64_t v13 = [v12 hash];
  v14 = [(SFAudioData *)self framesPerPacket];
  uint64_t v15 = [v14 hash];
  v16 = [(SFAudioData *)self reserved];
  unint64_t v17 = v22 ^ v21 ^ v19 ^ v9 ^ v11 ^ v13 ^ v15 ^ [v16 hash] ^ v20;

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (SFAudioData *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFAudioData *)v4 isMemberOfClass:objc_opt_class()])
    {
      double v5 = v4;
      long double v6 = [(SFAudioData *)self audioBuffer];
      v7 = [(SFAudioData *)v5 audioBuffer];
      if ((v6 == 0) == (v7 != 0))
      {
        char v11 = 0;
LABEL_52:

        goto LABEL_53;
      }
      v8 = [(SFAudioData *)self audioBuffer];
      if (v8)
      {
        uint64_t v9 = [(SFAudioData *)self audioBuffer];
        v10 = [(SFAudioData *)v5 audioBuffer];
        if (![v9 isEqual:v10])
        {
          char v11 = 0;
LABEL_50:

          goto LABEL_51;
        }
        v83 = v10;
        v84 = v9;
      }
      v12 = [(SFAudioData *)self formatID];
      uint64_t v13 = [(SFAudioData *)v5 formatID];
      if ((v12 == 0) == (v13 != 0)) {
        goto LABEL_48;
      }
      v14 = [(SFAudioData *)self formatID];
      if (v14)
      {
        uint64_t v15 = [(SFAudioData *)self formatID];
        v80 = [(SFAudioData *)v5 formatID];
        v81 = v15;
        if (![v15 isEqual:v80])
        {
LABEL_46:

LABEL_47:
          goto LABEL_48;
        }
      }
      v82 = v14;
      v16 = [(SFAudioData *)self formatFlags];
      unint64_t v17 = [(SFAudioData *)v5 formatFlags];
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_48:

          char v11 = 0;
          if (!v8)
          {
LABEL_51:

            goto LABEL_52;
          }
          goto LABEL_49;
        }
        goto LABEL_46;
      }
      v77 = v16;
      v78 = v17;
      v79 = [(SFAudioData *)self formatFlags];
      if (v79)
      {
        uint64_t v18 = [(SFAudioData *)self formatFlags];
        uint64_t v19 = [(SFAudioData *)v5 formatFlags];
        v76 = (void *)v18;
        unint64_t v20 = (void *)v18;
        v16 = (void *)v19;
        if (![v20 isEqual:v19]) {
          goto LABEL_27;
        }
      }
      [(SFAudioData *)self sampleRate];
      double v22 = v21;
      [(SFAudioData *)v5 sampleRate];
      if (vabdd_f64(v22, v23) >= 2.22044605e-16)
      {
        if (!v79) {
          goto LABEL_45;
        }
        goto LABEL_27;
      }
      v75 = v16;
      v24 = [(SFAudioData *)self bitsPerChannel];
      v25 = [(SFAudioData *)v5 bitsPerChannel];
      if ((v24 == 0) == (v25 != 0))
      {

        goto LABEL_44;
      }
      v72 = v25;
      v73 = v24;
      v74 = [(SFAudioData *)self bitsPerChannel];
      if (v74)
      {
        v26 = [(SFAudioData *)self bitsPerChannel];
        v70 = [(SFAudioData *)v5 bitsPerChannel];
        v71 = v26;
        if (![v26 isEqual:v70]) {
          goto LABEL_42;
        }
      }
      v27 = [(SFAudioData *)self bytesPerFrame];
      v28 = [(SFAudioData *)v5 bytesPerFrame];
      if ((v27 == 0) == (v28 != 0))
      {

        goto LABEL_41;
      }
      v68 = v27;
      v69 = v28;
      v29 = [(SFAudioData *)self bytesPerFrame];
      if (v29)
      {
        v30 = [(SFAudioData *)self bytesPerFrame];
        v65 = [(SFAudioData *)v5 bytesPerFrame];
        v66 = v30;
        if (!objc_msgSend(v30, "isEqual:"))
        {
LABEL_39:

LABEL_40:
LABEL_41:
          v14 = v82;
          if (!v74)
          {
LABEL_43:

LABEL_44:
            v16 = v75;
            if (!v79)
            {
LABEL_45:

              if (!v14) {
                goto LABEL_48;
              }
              goto LABEL_46;
            }
LABEL_27:

            goto LABEL_45;
          }
LABEL_42:

          goto LABEL_43;
        }
      }
      v67 = v29;
      v31 = [(SFAudioData *)self channelsPerFrame];
      v32 = [(SFAudioData *)v5 channelsPerFrame];
      if ((v31 == 0) == (v32 != 0))
      {

        v29 = v67;
        if (!v67) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
      v63 = v32;
      v64 = [(SFAudioData *)self channelsPerFrame];
      if (v64)
      {
        uint64_t v33 = [(SFAudioData *)self channelsPerFrame];
        v60 = [(SFAudioData *)v5 channelsPerFrame];
        v61 = (void *)v33;
        v34 = (void *)v33;
        v35 = v67;
        if (!objc_msgSend(v34, "isEqual:")) {
          goto LABEL_60;
        }
      }
      v62 = v31;
      v37 = [(SFAudioData *)self bytesPerPacket];
      v38 = [(SFAudioData *)v5 bytesPerPacket];
      if ((v37 == 0) == (v38 != 0))
      {

        v35 = v67;
        v31 = v62;
        if (!v64)
        {
          v42 = v74;
LABEL_61:

          if (v35)
          {
          }
          v14 = v82;
          if (v42)
          {
          }
          if (v79)
          {
          }
          if (!v82) {
            goto LABEL_47;
          }
          goto LABEL_46;
        }
LABEL_60:
        v42 = v74;

        goto LABEL_61;
      }
      v58 = v38;
      v59 = v37;
      uint64_t v57 = [(SFAudioData *)self bytesPerPacket];
      if (v57)
      {
        v39 = [(SFAudioData *)self bytesPerPacket];
        v54 = [(SFAudioData *)v5 bytesPerPacket];
        v55 = v39;
        if (!objc_msgSend(v39, "isEqual:"))
        {
          char v11 = 0;
          v40 = v64;
          v41 = (void *)v57;
LABEL_84:

LABEL_85:
          if (v40)
          {
          }
          if (v67)
          {
          }
          if (v74)
          {
          }
          if (v79)
          {
          }
          if (v82)
          {
          }
          if (!v8) {
            goto LABEL_51;
          }
LABEL_49:
          v10 = v83;
          uint64_t v9 = v84;
          goto LABEL_50;
        }
      }
      v43 = [(SFAudioData *)self framesPerPacket];
      v56 = [(SFAudioData *)v5 framesPerPacket];
      if ((v43 == 0) == (v56 != 0))
      {

        char v11 = 0;
        goto LABEL_83;
      }
      v53 = [(SFAudioData *)self framesPerPacket];
      if (!v53
        || ([(SFAudioData *)self framesPerPacket],
            v44 = objc_claimAutoreleasedReturnValue(),
            [(SFAudioData *)v5 framesPerPacket],
            v51 = objc_claimAutoreleasedReturnValue(),
            v52 = v44,
            objc_msgSend(v44, "isEqual:")))
      {
        v50 = [(SFAudioData *)self reserved];
        v49 = [(SFAudioData *)v5 reserved];
        if ((v50 == 0) == (v49 != 0))
        {

          char v11 = 0;
        }
        else
        {
          uint64_t v45 = [(SFAudioData *)self reserved];
          if (v45)
          {
            v46 = (void *)v45;
            v48 = [(SFAudioData *)self reserved];
            v47 = [(SFAudioData *)v5 reserved];
            char v11 = [v48 isEqual:v47];
          }
          else
          {

            char v11 = 1;
          }
        }
        if (!v53) {
          goto LABEL_82;
        }
      }
      else
      {
        char v11 = 0;
      }

LABEL_82:
LABEL_83:
      v40 = v64;
      v41 = (void *)v57;
      if (!v57) {
        goto LABEL_85;
      }
      goto LABEL_84;
    }
    char v11 = 0;
  }
LABEL_53:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  double v5 = [(SFAudioData *)self audioBuffer];
  long double v6 = (void *)[v5 copy];
  [v4 setAudioBuffer:v6];

  v7 = [(SFAudioData *)self formatID];
  v8 = (void *)[v7 copy];
  [v4 setFormatID:v8];

  uint64_t v9 = [(SFAudioData *)self formatFlags];
  v10 = (void *)[v9 copy];
  [v4 setFormatFlags:v10];

  [(SFAudioData *)self sampleRate];
  objc_msgSend(v4, "setSampleRate:");
  char v11 = [(SFAudioData *)self bitsPerChannel];
  v12 = (void *)[v11 copy];
  [v4 setBitsPerChannel:v12];

  uint64_t v13 = [(SFAudioData *)self bytesPerFrame];
  v14 = (void *)[v13 copy];
  [v4 setBytesPerFrame:v14];

  uint64_t v15 = [(SFAudioData *)self channelsPerFrame];
  v16 = (void *)[v15 copy];
  [v4 setChannelsPerFrame:v16];

  unint64_t v17 = [(SFAudioData *)self bytesPerPacket];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setBytesPerPacket:v18];

  uint64_t v19 = [(SFAudioData *)self framesPerPacket];
  unint64_t v20 = (void *)[v19 copy];
  [v4 setFramesPerPacket:v20];

  double v21 = [(SFAudioData *)self reserved];
  double v22 = (void *)[v21 copy];
  [v4 setReserved:v22];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBAudioData alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBAudioData *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBAudioData alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBAudioData *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long double v6 = [[_SFPBAudioData alloc] initWithFacade:self];
  double v5 = [(_SFPBAudioData *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFAudioData)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  long double v6 = [[_SFPBAudioData alloc] initWithData:v5];
  v7 = [(SFAudioData *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasSampleRate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSampleRate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sampleRate = a3;
}

- (SFAudioData)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFAudioData;
  double v5 = [(SFAudioData *)&v20 init];
  if (v5)
  {
    long double v6 = [v4 audioBuffer];

    if (v6)
    {
      v7 = [v4 audioBuffer];
      [(SFAudioData *)v5 setAudioBuffer:v7];
    }
    v8 = [v4 formatID];

    if (v8)
    {
      uint64_t v9 = [v4 formatID];
      [(SFAudioData *)v5 setFormatID:v9];
    }
    if ([v4 formatFlags])
    {
      v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "formatFlags"));
      [(SFAudioData *)v5 setFormatFlags:v10];
    }
    [v4 sampleRate];
    if (v11 != 0.0)
    {
      [v4 sampleRate];
      -[SFAudioData setSampleRate:](v5, "setSampleRate:");
    }
    if ([v4 bitsPerChannel])
    {
      v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "bitsPerChannel"));
      [(SFAudioData *)v5 setBitsPerChannel:v12];
    }
    if ([v4 bytesPerFrame])
    {
      uint64_t v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "bytesPerFrame"));
      [(SFAudioData *)v5 setBytesPerFrame:v13];
    }
    if ([v4 channelsPerFrame])
    {
      v14 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "channelsPerFrame"));
      [(SFAudioData *)v5 setChannelsPerFrame:v14];
    }
    if ([v4 bytesPerPacket])
    {
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "bytesPerPacket"));
      [(SFAudioData *)v5 setBytesPerPacket:v15];
    }
    if ([v4 framesPerPacket])
    {
      v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "framesPerPacket"));
      [(SFAudioData *)v5 setFramesPerPacket:v16];
    }
    if ([v4 reserved])
    {
      unint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "reserved"));
      [(SFAudioData *)v5 setReserved:v17];
    }
    uint64_t v18 = v5;
  }

  return v5;
}

@end