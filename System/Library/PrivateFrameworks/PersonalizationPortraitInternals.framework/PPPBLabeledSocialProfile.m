@interface PPPBLabeledSocialProfile
- (BOOL)hasLabel;
- (BOOL)hasService;
- (BOOL)hasUrlString;
- (BOOL)hasUserIdentifier;
- (BOOL)hasUsername;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)label;
- (NSString)service;
- (NSString)urlString;
- (NSString)userIdentifier;
- (NSString)username;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLabel:(id)a3;
- (void)setService:(id)a3;
- (void)setUrlString:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setUsername:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPPBLabeledSocialProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (void)setService:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUsername:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUrlString:(id)a3
{
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[1]) {
    -[PPPBLabeledSocialProfile setLabel:](self, "setLabel:");
  }
  if (v4[3]) {
    -[PPPBLabeledSocialProfile setUrlString:](self, "setUrlString:");
  }
  if (v4[5]) {
    -[PPPBLabeledSocialProfile setUsername:](self, "setUsername:");
  }
  if (v4[4]) {
    -[PPPBLabeledSocialProfile setUserIdentifier:](self, "setUserIdentifier:");
  }
  if (v4[2]) {
    -[PPPBLabeledSocialProfile setService:](self, "setService:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_label hash];
  NSUInteger v4 = [(NSString *)self->_urlString hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_username hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_userIdentifier hash];
  return v6 ^ [(NSString *)self->_service hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((label = self->_label, !((unint64_t)label | v4[1]))
     || -[NSString isEqual:](label, "isEqual:"))
    && ((urlString = self->_urlString, !((unint64_t)urlString | v4[3]))
     || -[NSString isEqual:](urlString, "isEqual:"))
    && ((username = self->_username, !((unint64_t)username | v4[5]))
     || -[NSString isEqual:](username, "isEqual:"))
    && ((userIdentifier = self->_userIdentifier, !((unint64_t)userIdentifier | v4[4]))
     || -[NSString isEqual:](userIdentifier, "isEqual:")))
  {
    service = self->_service;
    if ((unint64_t)service | v4[2]) {
      char v10 = -[NSString isEqual:](service, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_label copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_urlString copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_username copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  uint64_t v12 = [(NSString *)self->_userIdentifier copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_service copyWithZone:a3];
  v15 = (void *)v5[2];
  v5[2] = v14;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_label)
  {
    objc_msgSend(v4, "setLabel:");
    id v4 = v5;
  }
  if (self->_urlString)
  {
    objc_msgSend(v5, "setUrlString:");
    id v4 = v5;
  }
  if (self->_username)
  {
    objc_msgSend(v5, "setUsername:");
    id v4 = v5;
  }
  if (self->_userIdentifier)
  {
    objc_msgSend(v5, "setUserIdentifier:");
    id v4 = v5;
  }
  if (self->_service)
  {
    objc_msgSend(v5, "setService:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_label)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_urlString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_username)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_service)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPPBLabeledSocialProfileReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"label"];
  }
  urlString = self->_urlString;
  if (urlString) {
    [v4 setObject:urlString forKey:@"urlString"];
  }
  username = self->_username;
  if (username) {
    [v4 setObject:username forKey:@"username"];
  }
  userIdentifier = self->_userIdentifier;
  if (userIdentifier) {
    [v4 setObject:userIdentifier forKey:@"userIdentifier"];
  }
  service = self->_service;
  if (service) {
    [v4 setObject:service forKey:@"service"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPPBLabeledSocialProfile;
  id v4 = [(PPPBLabeledSocialProfile *)&v8 description];
  id v5 = [(PPPBLabeledSocialProfile *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (BOOL)hasUserIdentifier
{
  return self->_userIdentifier != 0;
}

- (BOOL)hasUsername
{
  return self->_username != 0;
}

- (BOOL)hasUrlString
{
  return self->_urlString != 0;
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

@end