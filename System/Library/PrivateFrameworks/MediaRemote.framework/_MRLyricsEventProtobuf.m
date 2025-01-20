@interface _MRLyricsEventProtobuf
- (BOOL)hasEndTime;
- (BOOL)hasStartTime;
- (BOOL)hasToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRLyricsTokenProtobuf)token;
- (double)endTime;
- (double)startTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEndTime:(double)a3;
- (void)setHasEndTime:(BOOL)a3;
- (void)setHasStartTime:(BOOL)a3;
- (void)setStartTime:(double)a3;
- (void)setToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRLyricsEventProtobuf

- (void)setStartTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStartTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_endTime = a3;
}

- (void)setHasEndTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEndTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasToken
{
  return self->_token != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRLyricsEventProtobuf;
  v4 = [(_MRLyricsEventProtobuf *)&v8 description];
  v5 = [(_MRLyricsEventProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithDouble:self->_startTime];
    [v3 setObject:v5 forKey:@"startTime"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithDouble:self->_endTime];
    [v3 setObject:v6 forKey:@"endTime"];
  }
  token = self->_token;
  if (token)
  {
    objc_super v8 = [(_MRLyricsTokenProtobuf *)token dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"token"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRLyricsEventProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_token)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = *(void *)&self->_startTime;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[1] = *(void *)&self->_endTime;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_token)
  {
    id v6 = v4;
    objc_msgSend(v4, "setToken:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_startTime;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_endTime;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v8 = [(_MRLyricsTokenProtobuf *)self->_token copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_startTime != *((double *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_endTime != *((double *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  token = self->_token;
  if ((unint64_t)token | *((void *)v4 + 3)) {
    char v6 = -[_MRLyricsTokenProtobuf isEqual:](token, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double startTime = self->_startTime;
    double v6 = -startTime;
    if (startTime >= 0.0) {
      double v6 = self->_startTime;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (has)
  {
    double endTime = self->_endTime;
    double v11 = -endTime;
    if (endTime >= 0.0) {
      double v11 = self->_endTime;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  return v9 ^ v4 ^ [(_MRLyricsTokenProtobuf *)self->_token hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 32);
  if ((v6 & 2) != 0)
  {
    self->_double startTime = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 32);
  }
  if (v6)
  {
    self->_double endTime = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  token = self->_token;
  uint64_t v8 = *((void *)v5 + 3);
  if (token)
  {
    if (!v8) {
      goto LABEL_11;
    }
    unint64_t v9 = v5;
    token = (_MRLyricsTokenProtobuf *)-[_MRLyricsTokenProtobuf mergeFrom:](token, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    unint64_t v9 = v5;
    token = (_MRLyricsTokenProtobuf *)-[_MRLyricsEventProtobuf setToken:](self, "setToken:");
  }
  uint64_t v5 = v9;
LABEL_11:

  MEMORY[0x1F41817F8](token, v5);
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (_MRLyricsTokenProtobuf)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end