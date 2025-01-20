@interface _ICLLPlaybackControlSettings
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)clearOneofValuesForTrackGenerationSource;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLPlaybackControlSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radio, 0);
  objc_storeStrong((id *)&self->_noGeneration, 0);
  objc_storeStrong((id *)&self->_availability, 0);

  objc_storeStrong((id *)&self->_autoPlay, 0);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_trackGenerationSource;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_shuffleMode;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_repeatMode;
LABEL_8:
  unint64_t v6 = v4 ^ v3 ^ v5 ^ [(_ICLLAvailability *)self->_availability hash];
  unint64_t v7 = [(_ICLLAutoPlaySource *)self->_autoPlay hash];
  unint64_t v8 = v6 ^ v7 ^ [(_ICLLRadioSource *)self->_radio hash];
  return v8 ^ [(_ICLLNoGenerationSource *)self->_noGeneration hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_trackGenerationSource != *((_DWORD *)v4 + 12)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
LABEL_25:
    char v9 = 0;
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_shuffleMode != *((_DWORD *)v4 + 11)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_repeatMode != *((_DWORD *)v4 + 10)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_25;
  }
  availability = self->_availability;
  if ((unint64_t)availability | *((void *)v4 + 2) && !-[_ICLLAvailability isEqual:](availability, "isEqual:")) {
    goto LABEL_25;
  }
  autoPlay = self->_autoPlay;
  if ((unint64_t)autoPlay | *((void *)v4 + 1))
  {
    if (!-[_ICLLAutoPlaySource isEqual:](autoPlay, "isEqual:")) {
      goto LABEL_25;
    }
  }
  radio = self->_radio;
  if ((unint64_t)radio | *((void *)v4 + 4))
  {
    if (!-[_ICLLRadioSource isEqual:](radio, "isEqual:")) {
      goto LABEL_25;
    }
  }
  noGeneration = self->_noGeneration;
  if ((unint64_t)noGeneration | *((void *)v4 + 3)) {
    char v9 = -[_ICLLNoGenerationSource isEqual:](noGeneration, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_26:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 44) = self->_shuffleMode;
    *(unsigned char *)(v5 + 52) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 48) = self->_trackGenerationSource;
  *(unsigned char *)(v5 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_repeatMode;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
LABEL_5:
  id v8 = [(_ICLLAvailability *)self->_availability copyWithZone:a3];
  char v9 = (void *)v6[2];
  v6[2] = v8;

  id v10 = [(_ICLLAutoPlaySource *)self->_autoPlay copyWithZone:a3];
  v11 = (void *)v6[1];
  v6[1] = v10;

  id v12 = [(_ICLLRadioSource *)self->_radio copyWithZone:a3];
  v13 = (void *)v6[4];
  v6[4] = v12;

  id v14 = [(_ICLLNoGenerationSource *)self->_noGeneration copyWithZone:a3];
  v15 = (void *)v6[3];
  v6[3] = v14;

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_availability)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_autoPlay)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_radio)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_noGeneration)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackControlSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)clearOneofValuesForTrackGenerationSource
{
  if (a1)
  {
    *(unsigned char *)(a1 + 52) &= ~4u;
    *(_DWORD *)(a1 + 48) = 0;
    v2 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;

    uint64_t v3 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    id v4 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v5 = [NSNumber numberWithInt:self->_shuffleMode];
    [v3 setObject:v5 forKey:@"shuffleMode"];

    char has = (char)self->_has;
  }
  if (has)
  {
    id v6 = [NSNumber numberWithInt:self->_repeatMode];
    [v3 setObject:v6 forKey:@"repeatMode"];
  }
  availability = self->_availability;
  if (availability)
  {
    id v8 = [(_ICLLAvailability *)availability dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"availability"];
  }
  autoPlay = self->_autoPlay;
  if (autoPlay)
  {
    id v10 = [(_ICLLAutoPlaySource *)autoPlay dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"autoPlay"];
  }
  radio = self->_radio;
  if (radio)
  {
    id v12 = [(_ICLLRadioSource *)radio dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"radio"];
  }
  noGeneration = self->_noGeneration;
  if (noGeneration)
  {
    id v14 = [(_ICLLNoGenerationSource *)noGeneration dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"noGeneration"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v15 = [NSNumber numberWithInt:self->_trackGenerationSource];
    [v3 setObject:v15 forKey:@"trackGenerationSource"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackControlSettings;
  id v4 = [(_ICLLPlaybackControlSettings *)&v8 description];
  uint64_t v5 = [(_ICLLPlaybackControlSettings *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end