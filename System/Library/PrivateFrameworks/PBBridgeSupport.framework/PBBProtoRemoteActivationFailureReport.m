@interface PBBProtoRemoteActivationFailureReport
- (BOOL)hasActivationError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)activationError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PBBProtoRemoteActivationFailureReport

- (BOOL)hasActivationError
{
  return self->_activationError != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoRemoteActivationFailureReport;
  v4 = [(PBBProtoRemoteActivationFailureReport *)&v8 description];
  v5 = [(PBBProtoRemoteActivationFailureReport *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  activationError = self->_activationError;
  if (activationError) {
    [v3 setObject:activationError forKey:@"activationError"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoRemoteActivationFailureReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_activationError) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  activationError = self->_activationError;
  if (activationError) {
    [a3 setActivationError:activationError];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_activationError copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    activationError = self->_activationError;
    if ((unint64_t)activationError | v4[1]) {
      char v6 = -[NSData isEqual:](activationError, "isEqual:");
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
  return [(NSData *)self->_activationError hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PBBProtoRemoteActivationFailureReport setActivationError:](self, "setActivationError:");
  }
}

- (NSData)activationError
{
  return self->_activationError;
}

- (void)setActivationError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end