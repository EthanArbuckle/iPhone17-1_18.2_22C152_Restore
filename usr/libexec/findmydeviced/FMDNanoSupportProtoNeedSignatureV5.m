@interface FMDNanoSupportProtoNeedSignatureV5
- (BOOL)hasActivationLockRequestUUIDString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)requestJsonData;
- (NSString)activationLockRequestUUIDString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivationLockRequestUUIDString:(id)a3;
- (void)setRequestJsonData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FMDNanoSupportProtoNeedSignatureV5

- (BOOL)hasActivationLockRequestUUIDString
{
  return self->_activationLockRequestUUIDString != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)FMDNanoSupportProtoNeedSignatureV5;
  v3 = [(FMDNanoSupportProtoNeedSignatureV5 *)&v7 description];
  v4 = [(FMDNanoSupportProtoNeedSignatureV5 *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  requestJsonData = self->_requestJsonData;
  if (requestJsonData) {
    [v3 setObject:requestJsonData forKey:@"request_json_data"];
  }
  activationLockRequestUUIDString = self->_activationLockRequestUUIDString;
  if (activationLockRequestUUIDString) {
    [v4 setObject:activationLockRequestUUIDString forKey:@"activationLockRequestUUIDString"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoNeedSignatureV5ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestJsonData) {
    sub_100244608();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
  if (self->_activationLockRequestUUIDString) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setRequestJsonData:self->_requestJsonData];
  if (self->_activationLockRequestUUIDString) {
    [v4 setActivationLockRequestUUIDString:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_requestJsonData copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_activationLockRequestUUIDString copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((requestJsonData = self->_requestJsonData, !((unint64_t)requestJsonData | v4[2]))
     || -[NSData isEqual:](requestJsonData, "isEqual:")))
  {
    activationLockRequestUUIDString = self->_activationLockRequestUUIDString;
    if ((unint64_t)activationLockRequestUUIDString | v4[1]) {
      unsigned __int8 v7 = -[NSString isEqual:](activationLockRequestUUIDString, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_requestJsonData hash];
  return [(NSString *)self->_activationLockRequestUUIDString hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[FMDNanoSupportProtoNeedSignatureV5 setRequestJsonData:](self, "setRequestJsonData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[FMDNanoSupportProtoNeedSignatureV5 setActivationLockRequestUUIDString:](self, "setActivationLockRequestUUIDString:");
    id v4 = v5;
  }
}

- (NSData)requestJsonData
{
  return self->_requestJsonData;
}

- (void)setRequestJsonData:(id)a3
{
}

- (NSString)activationLockRequestUUIDString
{
  return self->_activationLockRequestUUIDString;
}

- (void)setActivationLockRequestUUIDString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestJsonData, 0);

  objc_storeStrong((id *)&self->_activationLockRequestUUIDString, 0);
}

@end