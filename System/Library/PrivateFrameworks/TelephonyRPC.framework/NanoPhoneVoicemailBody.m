@interface NanoPhoneVoicemailBody
- (BOOL)hasVoicemailRecording;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)voicemailRecording;
- (NanoPhoneVoicemailBody)initWithAudioMessage:(id)a3 voicemailNumber:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)voicemailNumber;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setVoicemailNumber:(int64_t)a3;
- (void)setVoicemailRecording:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NanoPhoneVoicemailBody

- (NanoPhoneVoicemailBody)initWithAudioMessage:(id)a3 voicemailNumber:(unint64_t)a4
{
  v6 = [a3 audioData];
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)NanoPhoneVoicemailBody;
    v7 = [(NanoPhoneVoicemailBody *)&v11 init];
    v8 = v7;
    if (v7)
    {
      [(NanoPhoneVoicemailBody *)v7 setVoicemailNumber:a4];
      [(NanoPhoneVoicemailBody *)v8 setVoicemailRecording:v6];
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasVoicemailRecording
{
  return self->_voicemailRecording != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NanoPhoneVoicemailBody;
  v4 = [(NanoPhoneVoicemailBody *)&v8 description];
  v5 = [(NanoPhoneVoicemailBody *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithLongLong:self->_voicemailNumber];
  [v3 setObject:v4 forKey:@"voicemailNumber"];

  voicemailRecording = self->_voicemailRecording;
  if (voicemailRecording) {
    [v3 setObject:voicemailRecording forKey:@"voicemailRecording"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NanoPhoneVoicemailBodyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt64Field();
  if (self->_voicemailRecording) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = self->_voicemailNumber;
  voicemailRecording = self->_voicemailRecording;
  if (voicemailRecording) {
    [a3 setVoicemailRecording:voicemailRecording];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_voicemailNumber;
  uint64_t v6 = [(NSData *)self->_voicemailRecording copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()] && self->_voicemailNumber == v4[1])
  {
    voicemailRecording = self->_voicemailRecording;
    if ((unint64_t)voicemailRecording | v4[2]) {
      char v6 = -[NSData isEqual:](voicemailRecording, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2 = 2654435761 * self->_voicemailNumber;
  return [(NSData *)self->_voicemailRecording hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  self->_voicemailNumber = *((void *)a3 + 1);
  if (*((void *)a3 + 2)) {
    -[NanoPhoneVoicemailBody setVoicemailRecording:](self, "setVoicemailRecording:");
  }
}

- (int64_t)voicemailNumber
{
  return self->_voicemailNumber;
}

- (void)setVoicemailNumber:(int64_t)a3
{
  self->_voicemailNumber = a3;
}

- (NSData)voicemailRecording
{
  return self->_voicemailRecording;
}

- (void)setVoicemailRecording:(id)a3
{
}

- (void).cxx_destruct
{
}

@end