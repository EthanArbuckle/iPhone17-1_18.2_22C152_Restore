@interface APPBMescalSignSAPSetupRequest
+ (id)options;
- (BOOL)hasBuffer;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)buffer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuffer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBMescalSignSAPSetupRequest

+ (id)options
{
  if (qword_100289900 != -1) {
    dispatch_once(&qword_100289900, &stru_1002355E0);
  }
  v2 = (void *)qword_1002898F8;

  return v2;
}

- (BOOL)hasBuffer
{
  return self->_buffer != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBMescalSignSAPSetupRequest;
  v3 = [(APPBMescalSignSAPSetupRequest *)&v7 description];
  v4 = [(APPBMescalSignSAPSetupRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  buffer = self->_buffer;
  if (buffer) {
    [v3 setObject:buffer forKey:@"buffer"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBMescalSignSAPSetupRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_buffer) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  buffer = self->_buffer;
  if (buffer) {
    [a3 setBuffer:buffer];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_buffer copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    buffer = self->_buffer;
    if ((unint64_t)buffer | v4[1]) {
      unsigned __int8 v6 = -[NSData isEqual:](buffer, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_buffer hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[APPBMescalSignSAPSetupRequest setBuffer:](self, "setBuffer:");
  }
}

- (NSData)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end