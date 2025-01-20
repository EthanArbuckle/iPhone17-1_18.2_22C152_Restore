@interface PKProtobufPaymentSetupRequest
- (BOOL)hasAppName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentSetupRequest

- (BOOL)hasAppName
{
  return self->_appName != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentSetupRequest;
  v4 = [(PKProtobufPaymentSetupRequest *)&v8 description];
  v5 = [(PKProtobufPaymentSetupRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  appName = self->_appName;
  if (appName) {
    [v3 setObject:appName forKey:@"appName"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentSetupRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_appName) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  appName = self->_appName;
  if (appName) {
    [a3 setAppName:appName];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_appName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    appName = self->_appName;
    if ((unint64_t)appName | v4[1]) {
      char v6 = -[NSString isEqual:](appName, "isEqual:");
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
  return [(NSString *)self->_appName hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[PKProtobufPaymentSetupRequest setAppName:](self, "setAppName:");
  }
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end