@interface NPKProtoSetAccountAttestationAnonymizationSaltRequest
- (BOOL)hasAnonymizationSalt;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)anonymizationSalt;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymizationSalt:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoSetAccountAttestationAnonymizationSaltRequest

- (BOOL)hasAnonymizationSalt
{
  return self->_anonymizationSalt != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSetAccountAttestationAnonymizationSaltRequest;
  v4 = [(NPKProtoSetAccountAttestationAnonymizationSaltRequest *)&v8 description];
  v5 = [(NPKProtoSetAccountAttestationAnonymizationSaltRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  anonymizationSalt = self->_anonymizationSalt;
  if (anonymizationSalt) {
    [v3 setObject:anonymizationSalt forKey:@"anonymizationSalt"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSetAccountAttestationAnonymizationSaltRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_anonymizationSalt) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  anonymizationSalt = self->_anonymizationSalt;
  if (anonymizationSalt) {
    [a3 setAnonymizationSalt:anonymizationSalt];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_anonymizationSalt copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    anonymizationSalt = self->_anonymizationSalt;
    if ((unint64_t)anonymizationSalt | v4[1]) {
      char v6 = -[NSString isEqual:](anonymizationSalt, "isEqual:");
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
  return [(NSString *)self->_anonymizationSalt hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoSetAccountAttestationAnonymizationSaltRequest setAnonymizationSalt:](self, "setAnonymizationSalt:");
  }
}

- (NSString)anonymizationSalt
{
  return self->_anonymizationSalt;
}

- (void)setAnonymizationSalt:(id)a3
{
}

- (void).cxx_destruct
{
}

@end