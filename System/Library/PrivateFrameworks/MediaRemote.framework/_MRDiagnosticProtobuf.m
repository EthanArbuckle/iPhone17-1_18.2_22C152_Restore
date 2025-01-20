@interface _MRDiagnosticProtobuf
- (BOOL)hasDateGenerated;
- (BOOL)hasDiagnosticInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)diagnosticInfo;
- (double)dateGenerated;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateGenerated:(double)a3;
- (void)setDiagnosticInfo:(id)a3;
- (void)setHasDateGenerated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRDiagnosticProtobuf

- (void)setDateGenerated:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dateGenerated = a3;
}

- (void)setHasDateGenerated:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDateGenerated
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDiagnosticInfo
{
  return self->_diagnosticInfo != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRDiagnosticProtobuf;
  v4 = [(_MRDiagnosticProtobuf *)&v8 description];
  v5 = [(_MRDiagnosticProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithDouble:self->_dateGenerated];
    [v3 setObject:v4 forKey:@"dateGenerated"];
  }
  diagnosticInfo = self->_diagnosticInfo;
  if (diagnosticInfo) {
    [v3 setObject:diagnosticInfo forKey:@"diagnosticInfo"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRDiagnosticProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_diagnosticInfo)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = *(void *)&self->_dateGenerated;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_diagnosticInfo)
  {
    id v5 = v4;
    objc_msgSend(v4, "setDiagnosticInfo:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_dateGenerated;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_diagnosticInfo copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_dateGenerated != *((double *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }
  diagnosticInfo = self->_diagnosticInfo;
  if ((unint64_t)diagnosticInfo | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](diagnosticInfo, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    double dateGenerated = self->_dateGenerated;
    double v5 = -dateGenerated;
    if (dateGenerated >= 0.0) {
      double v5 = self->_dateGenerated;
    }
    long double v6 = floor(v5 + 0.5);
    double v7 = (v5 - v6) * 1.84467441e19;
    unint64_t v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0) {
        v3 += (unint64_t)v7;
      }
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    unint64_t v3 = 0;
  }
  return [(NSString *)self->_diagnosticInfo hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (double *)a3;
  if ((_BYTE)v4[3])
  {
    self->_double dateGenerated = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    double v5 = v4;
    -[_MRDiagnosticProtobuf setDiagnosticInfo:](self, "setDiagnosticInfo:");
    id v4 = v5;
  }
}

- (double)dateGenerated
{
  return self->_dateGenerated;
}

- (NSString)diagnosticInfo
{
  return self->_diagnosticInfo;
}

- (void)setDiagnosticInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end