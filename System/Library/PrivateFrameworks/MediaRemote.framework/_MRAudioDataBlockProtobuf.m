@interface _MRAudioDataBlockProtobuf
- (BOOL)hasBuffer;
- (BOOL)hasGain;
- (BOOL)hasTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRAudioBufferProtobuf)buffer;
- (_MRAudioTimeProtobuf)time;
- (double)gain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuffer:(id)a3;
- (void)setGain:(double)a3;
- (void)setHasGain:(BOOL)a3;
- (void)setTime:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRAudioDataBlockProtobuf

- (BOOL)hasBuffer
{
  return self->_buffer != 0;
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (void)setGain:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_gain = a3;
}

- (void)setHasGain:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGain
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRAudioDataBlockProtobuf;
  v4 = [(_MRAudioDataBlockProtobuf *)&v8 description];
  v5 = [(_MRAudioDataBlockProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  buffer = self->_buffer;
  if (buffer)
  {
    v5 = [(_MRAudioBufferProtobuf *)buffer dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"buffer"];
  }
  time = self->_time;
  if (time)
  {
    v7 = [(_MRAudioTimeProtobuf *)time dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"time"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_gain];
    [v3 setObject:v8 forKey:@"gain"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAudioDataBlockProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_buffer)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_time)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_buffer)
  {
    objc_msgSend(v4, "setBuffer:");
    id v4 = v5;
  }
  if (self->_time)
  {
    objc_msgSend(v5, "setTime:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = *(void *)&self->_gain;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRAudioBufferProtobuf *)self->_buffer copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  id v8 = [(_MRAudioTimeProtobuf *)self->_time copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_gain;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  buffer = self->_buffer;
  if ((unint64_t)buffer | *((void *)v4 + 2))
  {
    if (!-[_MRAudioBufferProtobuf isEqual:](buffer, "isEqual:")) {
      goto LABEL_10;
    }
  }
  time = self->_time;
  if ((unint64_t)time | *((void *)v4 + 3))
  {
    if (!-[_MRAudioTimeProtobuf isEqual:](time, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_gain == *((double *)v4 + 1))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(_MRAudioBufferProtobuf *)self->_buffer hash];
  unint64_t v4 = [(_MRAudioTimeProtobuf *)self->_time hash];
  if (*(unsigned char *)&self->_has)
  {
    double gain = self->_gain;
    double v7 = -gain;
    if (gain >= 0.0) {
      double v7 = self->_gain;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  buffer = self->_buffer;
  uint64_t v6 = *((void *)v4 + 2);
  id v9 = v4;
  if (buffer)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRAudioBufferProtobuf mergeFrom:](buffer, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_MRAudioDataBlockProtobuf setBuffer:](self, "setBuffer:");
  }
  id v4 = v9;
LABEL_7:
  time = self->_time;
  uint64_t v8 = *((void *)v4 + 3);
  if (time)
  {
    if (!v8) {
      goto LABEL_13;
    }
    time = (_MRAudioTimeProtobuf *)-[_MRAudioTimeProtobuf mergeFrom:](time, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    time = (_MRAudioTimeProtobuf *)-[_MRAudioDataBlockProtobuf setTime:](self, "setTime:");
  }
  id v4 = v9;
LABEL_13:
  if (*((unsigned char *)v4 + 32))
  {
    self->_double gain = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8](time, v4);
}

- (_MRAudioBufferProtobuf)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (_MRAudioTimeProtobuf)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (double)gain
{
  return self->_gain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);

  objc_storeStrong((id *)&self->_buffer, 0);
}

@end