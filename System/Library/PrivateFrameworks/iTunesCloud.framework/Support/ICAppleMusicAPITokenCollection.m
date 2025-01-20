@interface ICAppleMusicAPITokenCollection
- (BOOL)hasDeveloperToken;
- (BOOL)hasUserToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)developerToken;
- (NSString)userToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)privacyConsciousDescription;
- (id)privacyConsciousDictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDeveloperToken:(id)a3;
- (void)setUserToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICAppleMusicAPITokenCollection

- (id)privacyConsciousDescription
{
  v7.receiver = self;
  v7.super_class = (Class)ICAppleMusicAPITokenCollection;
  v3 = [(ICAppleMusicAPITokenCollection *)&v7 description];
  v4 = [(ICAppleMusicAPITokenCollection *)self privacyConsciousDictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)privacyConsciousDictionaryRepresentation
{
  v3 = +[ICDeviceInfo currentDeviceInfo];
  unsigned __int8 v4 = [v3 isInternalBuild];

  v5 = +[NSMutableDictionary dictionary];
  if (![(ICAppleMusicAPITokenCollection *)self hasDeveloperToken])
  {
    if (![(ICAppleMusicAPITokenCollection *)self hasUserToken]) {
      goto LABEL_10;
    }
    if (v4) {
      goto LABEL_7;
    }
LABEL_9:
    [v5 setObject:@"<redacted>" forKey:@"userToken"];
    goto LABEL_10;
  }
  if ((v4 & 1) == 0)
  {
    [v5 setObject:@"<redacted>" forKey:@"developerToken"];
    if (![(ICAppleMusicAPITokenCollection *)self hasUserToken]) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  v6 = [(ICAppleMusicAPITokenCollection *)self developerToken];
  [v5 setObject:v6 forKey:@"developerToken"];

  if ([(ICAppleMusicAPITokenCollection *)self hasUserToken])
  {
LABEL_7:
    objc_super v7 = [(ICAppleMusicAPITokenCollection *)self userToken];
    [v5 setObject:v7 forKey:@"userToken"];
  }
LABEL_10:

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userToken, 0);

  objc_storeStrong((id *)&self->_developerToken, 0);
}

- (void)setUserToken:(id)a3
{
}

- (NSString)userToken
{
  return self->_userToken;
}

- (void)setDeveloperToken:(id)a3
{
}

- (NSString)developerToken
{
  return self->_developerToken;
}

- (void)mergeFrom:(id)a3
{
  unsigned __int8 v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[ICAppleMusicAPITokenCollection setDeveloperToken:](self, "setDeveloperToken:");
    unsigned __int8 v4 = v5;
  }
  if (v4[2])
  {
    -[ICAppleMusicAPITokenCollection setUserToken:](self, "setUserToken:");
    unsigned __int8 v4 = v5;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_developerToken hash];
  return [(NSString *)self->_userToken hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((developerToken = self->_developerToken, !((unint64_t)developerToken | v4[1]))
     || -[NSString isEqual:](developerToken, "isEqual:")))
  {
    userToken = self->_userToken;
    if ((unint64_t)userToken | v4[2]) {
      unsigned __int8 v7 = -[NSString isEqual:](userToken, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_developerToken copyWithZone:a3];
  unsigned __int8 v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_userToken copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_developerToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000DE644((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  developerToken = self->_developerToken;
  if (developerToken) {
    [v3 setObject:developerToken forKey:@"developerToken"];
  }
  userToken = self->_userToken;
  if (userToken) {
    [v4 setObject:userToken forKey:@"userToken"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ICAppleMusicAPITokenCollection;
  NSUInteger v3 = [(ICAppleMusicAPITokenCollection *)&v7 description];
  id v4 = [(ICAppleMusicAPITokenCollection *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasUserToken
{
  return self->_userToken != 0;
}

- (BOOL)hasDeveloperToken
{
  return self->_developerToken != 0;
}

@end