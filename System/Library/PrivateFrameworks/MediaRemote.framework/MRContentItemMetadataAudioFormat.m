@interface MRContentItemMetadataAudioFormat
- (BOOL)hasBitDepth;
- (BOOL)hasBitrate;
- (BOOL)hasChannelLayout;
- (BOOL)hasCodec;
- (BOOL)hasMultiChannel;
- (BOOL)hasRenderingMode;
- (BOOL)hasSampleRate;
- (BOOL)hasSpatialized;
- (BOOL)hasTier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultiChannel;
- (BOOL)isSpatialized;
- (MRContentItemMetadataAudioFormat)initWithProtobuf:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSString)audioChannelLayoutDescription;
- (NSString)groupID;
- (NSString)stableVariantID;
- (_MRAudioFormatProtobuf)protobuf;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)bitDepth;
- (int64_t)bitrate;
- (int64_t)renderingMode;
- (int64_t)sampleRate;
- (int64_t)tier;
- (unsigned)channelLayout;
- (unsigned)codec;
- (void)setAudioChannelLayoutDescription:(id)a3;
- (void)setBitDepth:(int64_t)a3;
- (void)setBitrate:(int64_t)a3;
- (void)setChannelLayout:(unsigned int)a3;
- (void)setCodec:(unsigned int)a3;
- (void)setGroupID:(id)a3;
- (void)setMultiChannel:(BOOL)a3;
- (void)setRenderingMode:(int64_t)a3;
- (void)setSampleRate:(int64_t)a3;
- (void)setSpatialized:(BOOL)a3;
- (void)setStableVariantID:(id)a3;
- (void)setTier:(int64_t)a3;
@end

@implementation MRContentItemMetadataAudioFormat

- (MRContentItemMetadataAudioFormat)initWithProtobuf:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)MRContentItemMetadataAudioFormat;
    v5 = [(MRContentItemMetadataAudioFormat *)&v15 init];
    if (v5)
    {
      v5->_tier = (int)[v4 tier];
      v5->_hasTier = [v4 hasTier];
      v5->_bitrate = [v4 bitrate];
      v5->_hasBitrate = [v4 hasBitrate];
      v5->_sampleRate = [v4 sampleRate];
      v5->_hasSampleRate = [v4 hasSampleRate];
      v5->_bitDepth = [v4 bitDepth];
      v5->_hasBitDepth = [v4 hasBitDepth];
      v5->_codec = [v4 codec];
      v5->_hasCodec = [v4 hasCodec];
      v5->_spatialized = [v4 spatialized];
      v5->_hasSpatialized = [v4 hasSpatialized];
      v5->_multiChannel = [v4 multiChannel];
      v5->_hasMultiChannel = [v4 hasMultiChannel];
      v5->_renderingMode = (int)[v4 renderingMode];
      v5->_hasRenderingMode = [v4 hasRenderingMode];
      v5->_channelLayout = [v4 channelLayout];
      v5->_hasChannelLayout = [v4 hasChannelLayout];
      v6 = [v4 audioChannelLayoutDescription];
      uint64_t v7 = [v6 copy];
      audioChannelLayoutDescription = v5->_audioChannelLayoutDescription;
      v5->_audioChannelLayoutDescription = (NSString *)v7;

      uint64_t v9 = [v4 groupID];
      groupID = v5->_groupID;
      v5->_groupID = (NSString *)v9;

      uint64_t v11 = [v4 stableVariantID];
      stableVariantID = v5->_stableVariantID;
      v5->_stableVariantID = (NSString *)v11;
    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (_MRAudioFormatProtobuf)protobuf
{
  v3 = objc_alloc_init(_MRAudioFormatProtobuf);
  v3->_tier = [(MRContentItemMetadataAudioFormat *)self tier];
  if ([(MRContentItemMetadataAudioFormat *)self hasTier]) {
    __int16 v4 = 64;
  }
  else {
    __int16 v4 = 0;
  }
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFBF | v4;
  v3->_bitrate = [(MRContentItemMetadataAudioFormat *)self bitrate];
  if ([(MRContentItemMetadataAudioFormat *)self hasBitrate]) {
    __int16 v5 = 2;
  }
  else {
    __int16 v5 = 0;
  }
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFFD | v5;
  v3->_sampleRate = [(MRContentItemMetadataAudioFormat *)self sampleRate];
  if ([(MRContentItemMetadataAudioFormat *)self hasSampleRate]) {
    __int16 v6 = 4;
  }
  else {
    __int16 v6 = 0;
  }
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFFB | v6;
  v3->_bitDepth = [(MRContentItemMetadataAudioFormat *)self bitDepth];
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFFE | [(MRContentItemMetadataAudioFormat *)self hasBitDepth];
  v3->_codec = [(MRContentItemMetadataAudioFormat *)self codec];
  if ([(MRContentItemMetadataAudioFormat *)self hasCodec]) {
    __int16 v7 = 16;
  }
  else {
    __int16 v7 = 0;
  }
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFEF | v7;
  v3->_spatialized = [(MRContentItemMetadataAudioFormat *)self isSpatialized];
  if ([(MRContentItemMetadataAudioFormat *)self hasSpatialized]) {
    __int16 v8 = 256;
  }
  else {
    __int16 v8 = 0;
  }
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFEFF | v8;
  v3->_multiChannel = [(MRContentItemMetadataAudioFormat *)self isMultiChannel];
  if ([(MRContentItemMetadataAudioFormat *)self hasMultiChannel]) {
    __int16 v9 = 128;
  }
  else {
    __int16 v9 = 0;
  }
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFF7F | v9;
  v3->_renderingMode = [(MRContentItemMetadataAudioFormat *)self renderingMode];
  if ([(MRContentItemMetadataAudioFormat *)self hasRenderingMode]) {
    __int16 v10 = 32;
  }
  else {
    __int16 v10 = 0;
  }
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFDF | v10;
  v3->_channelLayout = [(MRContentItemMetadataAudioFormat *)self channelLayout];
  if ([(MRContentItemMetadataAudioFormat *)self hasChannelLayout]) {
    __int16 v11 = 8;
  }
  else {
    __int16 v11 = 0;
  }
  *(_WORD *)&v3->_has = *(_WORD *)&v3->_has & 0xFFF7 | v11;
  v12 = [(MRContentItemMetadataAudioFormat *)self audioChannelLayoutDescription];
  v13 = (void *)[v12 copy];
  [(_MRAudioFormatProtobuf *)v3 setAudioChannelLayoutDescription:v13];

  v14 = [(MRContentItemMetadataAudioFormat *)self groupID];
  uint64_t v15 = [v14 copy];
  groupID = v3->_groupID;
  v3->_groupID = (NSString *)v15;

  v17 = [(MRContentItemMetadataAudioFormat *)self stableVariantID];
  uint64_t v18 = [v17 copy];
  stableVariantID = v3->_stableVariantID;
  v3->_stableVariantID = (NSString *)v18;

  return v3;
}

- (void)setTier:(int64_t)a3
{
  self->_tier = a3;
  self->_hasTier = 1;
}

- (void)setBitrate:(int64_t)a3
{
  self->_bitrate = a3;
  self->_hasBitrate = 1;
}

- (void)setSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
  self->_hasSampleRate = 1;
}

- (void)setBitDepth:(int64_t)a3
{
  self->_bitDepth = a3;
  self->_hasBitDepth = 1;
}

- (void)setCodec:(unsigned int)a3
{
  self->_codec = a3;
  self->_hasCodec = 1;
}

- (void)setSpatialized:(BOOL)a3
{
  self->_spatialized = a3;
  self->_hasSpatialized = 1;
}

- (void)setMultiChannel:(BOOL)a3
{
  self->_multiChannel = a3;
  self->_hasMultiChannel = 1;
}

- (void)setRenderingMode:(int64_t)a3
{
  self->_renderingMode = a3;
  self->_hasRenderingMode = 1;
}

- (void)setChannelLayout:(unsigned int)a3
{
  self->_channelLayout = a3;
  self->_hasChannelLayout = 1;
}

- (void)setGroupID:(id)a3
{
  self->_groupID = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setStableVariantID:(id)a3
{
  self->_stableVariantID = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init((Class)objc_opt_class());
  if ([(MRContentItemMetadataAudioFormat *)self hasTier]) {
    objc_msgSend(v5, "setTier:", -[MRContentItemMetadataAudioFormat tier](self, "tier"));
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasBitrate]) {
    objc_msgSend(v5, "setBitrate:", -[MRContentItemMetadataAudioFormat bitrate](self, "bitrate"));
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasSampleRate]) {
    objc_msgSend(v5, "setSampleRate:", -[MRContentItemMetadataAudioFormat sampleRate](self, "sampleRate"));
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasBitDepth]) {
    objc_msgSend(v5, "setBitDepth:", -[MRContentItemMetadataAudioFormat bitDepth](self, "bitDepth"));
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasCodec]) {
    objc_msgSend(v5, "setCodec:", -[MRContentItemMetadataAudioFormat codec](self, "codec"));
  }
  __int16 v6 = [(MRContentItemMetadataAudioFormat *)self groupID];
  __int16 v7 = (void *)[v6 copyWithZone:a3];
  [v5 setGroupID:v7];

  __int16 v8 = [(MRContentItemMetadataAudioFormat *)self stableVariantID];
  __int16 v9 = (void *)[v8 copyWithZone:a3];
  [v5 setStableVariantID:v9];

  if ([(MRContentItemMetadataAudioFormat *)self hasSpatialized]) {
    objc_msgSend(v5, "setSpatialized:", -[MRContentItemMetadataAudioFormat isSpatialized](self, "isSpatialized"));
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasMultiChannel]) {
    objc_msgSend(v5, "setMultiChannel:", -[MRContentItemMetadataAudioFormat isMultiChannel](self, "isMultiChannel"));
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasRenderingMode]) {
    objc_msgSend(v5, "setRenderingMode:", -[MRContentItemMetadataAudioFormat renderingMode](self, "renderingMode"));
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasChannelLayout]) {
    objc_msgSend(v5, "setChannelLayout:", -[MRContentItemMetadataAudioFormat channelLayout](self, "channelLayout"));
  }
  __int16 v10 = [(MRContentItemMetadataAudioFormat *)self audioChannelLayoutDescription];
  __int16 v11 = (void *)[v10 copyWithZone:a3];
  [v5 setAudioChannelLayoutDescription:v11];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  __int16 v4 = (MRContentItemMetadataAudioFormat *)a3;
  if (v4 == self)
  {
    char v29 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_46;
    }
    BOOL v5 = [(MRContentItemMetadataAudioFormat *)v4 hasTier];
    if (v5 != [(MRContentItemMetadataAudioFormat *)self hasTier]) {
      goto LABEL_46;
    }
    if ([(MRContentItemMetadataAudioFormat *)v4 hasTier])
    {
      if ([(MRContentItemMetadataAudioFormat *)self hasTier])
      {
        uint64_t v6 = [(MRContentItemMetadataAudioFormat *)v4 tier];
        if (v6 != [(MRContentItemMetadataAudioFormat *)self tier]) {
          goto LABEL_46;
        }
      }
    }
    BOOL v7 = [(MRContentItemMetadataAudioFormat *)v4 hasBitrate];
    if (v7 != [(MRContentItemMetadataAudioFormat *)self hasBitrate]) {
      goto LABEL_46;
    }
    if ([(MRContentItemMetadataAudioFormat *)v4 hasBitrate])
    {
      if ([(MRContentItemMetadataAudioFormat *)self hasBitrate])
      {
        uint64_t v8 = [(MRContentItemMetadataAudioFormat *)v4 bitrate];
        if (v8 != [(MRContentItemMetadataAudioFormat *)self bitrate]) {
          goto LABEL_46;
        }
      }
    }
    BOOL v9 = [(MRContentItemMetadataAudioFormat *)v4 hasSampleRate];
    if (v9 != [(MRContentItemMetadataAudioFormat *)self hasSampleRate]) {
      goto LABEL_46;
    }
    if ([(MRContentItemMetadataAudioFormat *)v4 hasSampleRate])
    {
      if ([(MRContentItemMetadataAudioFormat *)self hasSampleRate])
      {
        uint64_t v10 = [(MRContentItemMetadataAudioFormat *)v4 sampleRate];
        if (v10 != [(MRContentItemMetadataAudioFormat *)self sampleRate]) {
          goto LABEL_46;
        }
      }
    }
    BOOL v11 = [(MRContentItemMetadataAudioFormat *)v4 hasBitDepth];
    if (v11 != [(MRContentItemMetadataAudioFormat *)self hasBitDepth]) {
      goto LABEL_46;
    }
    if ([(MRContentItemMetadataAudioFormat *)v4 hasBitDepth])
    {
      if ([(MRContentItemMetadataAudioFormat *)self hasBitDepth])
      {
        uint64_t v12 = [(MRContentItemMetadataAudioFormat *)v4 bitDepth];
        if (v12 != [(MRContentItemMetadataAudioFormat *)self bitDepth]) {
          goto LABEL_46;
        }
      }
    }
    BOOL v13 = [(MRContentItemMetadataAudioFormat *)v4 hasCodec];
    if (v13 != [(MRContentItemMetadataAudioFormat *)self hasCodec]) {
      goto LABEL_46;
    }
    if ([(MRContentItemMetadataAudioFormat *)v4 hasCodec])
    {
      if ([(MRContentItemMetadataAudioFormat *)self hasCodec])
      {
        unsigned int v14 = [(MRContentItemMetadataAudioFormat *)v4 codec];
        if (v14 != [(MRContentItemMetadataAudioFormat *)self codec]) {
          goto LABEL_46;
        }
      }
    }
    BOOL v15 = [(MRContentItemMetadataAudioFormat *)v4 hasSpatialized];
    if (v15 != [(MRContentItemMetadataAudioFormat *)self hasSpatialized]) {
      goto LABEL_46;
    }
    if ([(MRContentItemMetadataAudioFormat *)v4 hasSpatialized])
    {
      if ([(MRContentItemMetadataAudioFormat *)self hasSpatialized])
      {
        BOOL v16 = [(MRContentItemMetadataAudioFormat *)v4 isSpatialized];
        if (v16 != [(MRContentItemMetadataAudioFormat *)self isSpatialized]) {
          goto LABEL_46;
        }
      }
    }
    BOOL v17 = [(MRContentItemMetadataAudioFormat *)v4 hasMultiChannel];
    if (v17 != [(MRContentItemMetadataAudioFormat *)self hasMultiChannel]) {
      goto LABEL_46;
    }
    if ([(MRContentItemMetadataAudioFormat *)v4 hasMultiChannel])
    {
      if ([(MRContentItemMetadataAudioFormat *)self hasMultiChannel])
      {
        BOOL v18 = [(MRContentItemMetadataAudioFormat *)v4 isMultiChannel];
        if (v18 != [(MRContentItemMetadataAudioFormat *)self isMultiChannel]) {
          goto LABEL_46;
        }
      }
    }
    BOOL v19 = [(MRContentItemMetadataAudioFormat *)v4 hasRenderingMode];
    if (v19 != [(MRContentItemMetadataAudioFormat *)self hasRenderingMode]) {
      goto LABEL_46;
    }
    if ([(MRContentItemMetadataAudioFormat *)v4 hasRenderingMode])
    {
      if ([(MRContentItemMetadataAudioFormat *)self hasRenderingMode])
      {
        uint64_t v20 = [(MRContentItemMetadataAudioFormat *)v4 renderingMode];
        if (v20 != [(MRContentItemMetadataAudioFormat *)self renderingMode]) {
          goto LABEL_46;
        }
      }
    }
    BOOL v21 = [(MRContentItemMetadataAudioFormat *)v4 hasChannelLayout];
    if (v21 != [(MRContentItemMetadataAudioFormat *)self hasChannelLayout]) {
      goto LABEL_46;
    }
    if ([(MRContentItemMetadataAudioFormat *)v4 hasChannelLayout])
    {
      if ([(MRContentItemMetadataAudioFormat *)self hasChannelLayout])
      {
        unsigned int v22 = [(MRContentItemMetadataAudioFormat *)v4 channelLayout];
        if (v22 != [(MRContentItemMetadataAudioFormat *)self channelLayout]) {
          goto LABEL_46;
        }
      }
    }
    v23 = [(MRContentItemMetadataAudioFormat *)v4 audioChannelLayoutDescription];
    uint64_t v24 = [(MRContentItemMetadataAudioFormat *)self audioChannelLayoutDescription];
    if (v23 == (void *)v24)
    {
    }
    else
    {
      v25 = (void *)v24;
      v26 = [(MRContentItemMetadataAudioFormat *)v4 audioChannelLayoutDescription];
      v27 = [(MRContentItemMetadataAudioFormat *)self audioChannelLayoutDescription];
      int v28 = [v26 isEqualToString:v27];

      if (!v28) {
        goto LABEL_46;
      }
    }
    v30 = [(MRContentItemMetadataAudioFormat *)v4 groupID];
    uint64_t v31 = [(MRContentItemMetadataAudioFormat *)self groupID];
    if (v30 == (void *)v31)
    {
    }
    else
    {
      v32 = (void *)v31;
      v33 = [(MRContentItemMetadataAudioFormat *)v4 groupID];
      v34 = [(MRContentItemMetadataAudioFormat *)self groupID];
      int v35 = [v33 isEqualToString:v34];

      if (!v35)
      {
LABEL_46:
        char v29 = 0;
        goto LABEL_47;
      }
    }
    v37 = [(MRContentItemMetadataAudioFormat *)v4 stableVariantID];
    uint64_t v38 = [(MRContentItemMetadataAudioFormat *)self stableVariantID];
    if (v37 == (void *)v38)
    {
      char v29 = 1;
      v39 = v37;
    }
    else
    {
      v39 = (void *)v38;
      v40 = [(MRContentItemMetadataAudioFormat *)v4 stableVariantID];
      v41 = [(MRContentItemMetadataAudioFormat *)self stableVariantID];
      char v29 = [v40 isEqualToString:v41];
    }
  }
LABEL_47:

  return v29;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([(MRContentItemMetadataAudioFormat *)self hasTier])
  {
    __int16 v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadataAudioFormat tier](self, "tier"));
    [v3 setObject:v4 forKeyedSubscript:@"tier"];
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasBitrate])
  {
    BOOL v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadataAudioFormat bitrate](self, "bitrate"));
    [v3 setObject:v5 forKeyedSubscript:@"bitrate"];
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasSampleRate])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadataAudioFormat sampleRate](self, "sampleRate"));
    [v3 setObject:v6 forKeyedSubscript:@"sampleRate"];
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasBitDepth])
  {
    BOOL v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadataAudioFormat bitDepth](self, "bitDepth"));
    [v3 setObject:v7 forKeyedSubscript:@"bitDepth"];
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasCodec])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MRContentItemMetadataAudioFormat codec](self, "codec"));
    [v3 setObject:v8 forKeyedSubscript:@"codec"];
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasSpatialized])
  {
    BOOL v9 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadataAudioFormat isSpatialized](self, "isSpatialized"));
    [v3 setObject:v9 forKeyedSubscript:@"spatialized"];
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasMultiChannel])
  {
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[MRContentItemMetadataAudioFormat isMultiChannel](self, "isMultiChannel"));
    [v3 setObject:v10 forKeyedSubscript:@"multiChannel"];
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasRenderingMode])
  {
    BOOL v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[MRContentItemMetadataAudioFormat renderingMode](self, "renderingMode"));
    [v3 setObject:v11 forKeyedSubscript:@"renderingMode"];
  }
  if ([(MRContentItemMetadataAudioFormat *)self hasChannelLayout])
  {
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[MRContentItemMetadataAudioFormat channelLayout](self, "channelLayout"));
    [v3 setObject:v12 forKeyedSubscript:@"channelLayout"];
  }
  BOOL v13 = [(MRContentItemMetadataAudioFormat *)self audioChannelLayoutDescription];
  [v3 setObject:v13 forKeyedSubscript:@"audioChannelLayoutDescription"];

  unsigned int v14 = [(MRContentItemMetadataAudioFormat *)self groupID];
  [v3 setObject:v14 forKeyedSubscript:@"groupID"];

  BOOL v15 = [(MRContentItemMetadataAudioFormat *)self stableVariantID];
  [v3 setObject:v15 forKeyedSubscript:@"stableVariantID"];

  return (NSDictionary *)v3;
}

- (BOOL)hasTier
{
  return self->_hasTier;
}

- (int64_t)tier
{
  return self->_tier;
}

- (BOOL)hasBitrate
{
  return self->_hasBitrate;
}

- (int64_t)bitrate
{
  return self->_bitrate;
}

- (BOOL)hasSampleRate
{
  return self->_hasSampleRate;
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (BOOL)hasBitDepth
{
  return self->_hasBitDepth;
}

- (int64_t)bitDepth
{
  return self->_bitDepth;
}

- (BOOL)hasCodec
{
  return self->_hasCodec;
}

- (unsigned)codec
{
  return self->_codec;
}

- (BOOL)hasSpatialized
{
  return self->_hasSpatialized;
}

- (BOOL)isSpatialized
{
  return self->_spatialized;
}

- (BOOL)hasMultiChannel
{
  return self->_hasMultiChannel;
}

- (BOOL)isMultiChannel
{
  return self->_multiChannel;
}

- (BOOL)hasRenderingMode
{
  return self->_hasRenderingMode;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (BOOL)hasChannelLayout
{
  return self->_hasChannelLayout;
}

- (unsigned)channelLayout
{
  return self->_channelLayout;
}

- (NSString)audioChannelLayoutDescription
{
  return self->_audioChannelLayoutDescription;
}

- (void)setAudioChannelLayoutDescription:(id)a3
{
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSString)stableVariantID
{
  return self->_stableVariantID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableVariantID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_audioChannelLayoutDescription, 0);
}

@end