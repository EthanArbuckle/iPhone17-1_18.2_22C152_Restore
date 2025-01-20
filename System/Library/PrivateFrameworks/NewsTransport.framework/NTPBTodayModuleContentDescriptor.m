@interface NTPBTodayModuleContentDescriptor
- (BOOL)hasIdentifier;
- (BOOL)hasRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (NTPBTodayModuleContentRequest)request;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRequest:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayModuleContentDescriptor

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayModuleContentDescriptor;
  v4 = [(NTPBTodayModuleContentDescriptor *)&v8 description];
  v5 = [(NTPBTodayModuleContentDescriptor *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  request = self->_request;
  if (request)
  {
    v7 = [(NTPBTodayModuleContentRequest *)request dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"request"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayModuleContentDescriptorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NTPBTodayModuleContentRequest *)self->_request copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:")))
  {
    request = self->_request;
    if ((unint64_t)request | v4[2]) {
      char v7 = -[NTPBTodayModuleContentRequest isEqual:](request, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NTPBTodayModuleContentRequest *)self->_request hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v7 = v4;
  if (v4[1])
  {
    -[NTPBTodayModuleContentDescriptor setIdentifier:](self, "setIdentifier:");
    id v4 = v7;
  }
  request = self->_request;
  uint64_t v6 = v4[2];
  if (request)
  {
    if (v6) {
      -[NTPBTodayModuleContentRequest mergeFrom:](request, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBTodayModuleContentDescriptor setRequest:](self, "setRequest:");
  }

  MEMORY[0x270F9A758]();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NTPBTodayModuleContentRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end