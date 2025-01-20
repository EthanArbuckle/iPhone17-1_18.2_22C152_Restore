@interface OTAccountSettings
- (BOOL)hasWalrus;
- (BOOL)hasWebAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (OTWalrus)walrus;
- (OTWebAccess)webAccess;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setWalrus:(id)a3;
- (void)setWebAccess:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTAccountSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webAccess, 0);
  objc_storeStrong((id *)&self->_walrus, 0);
}

- (void)setWebAccess:(id)a3
{
}

- (OTWebAccess)webAccess
{
  return self->_webAccess;
}

- (void)setWalrus:(id)a3
{
}

- (OTWalrus)walrus
{
  return self->_walrus;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  walrus = self->_walrus;
  uint64_t v6 = v4[1];
  v9 = v4;
  if (walrus)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[OTWalrus mergeFrom:](walrus, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[OTAccountSettings setWalrus:](self, "setWalrus:");
  }
  v4 = v9;
LABEL_7:
  webAccess = self->_webAccess;
  uint64_t v8 = v4[2];
  if (webAccess)
  {
    if (v8) {
      -[OTWebAccess mergeFrom:](webAccess, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[OTAccountSettings setWebAccess:](self, "setWebAccess:");
  }
  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  unint64_t v3 = [(OTWalrus *)self->_walrus hash];
  return [(OTWebAccess *)self->_webAccess hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((walrus = self->_walrus, !((unint64_t)walrus | v4[1])) || -[OTWalrus isEqual:](walrus, "isEqual:")))
  {
    webAccess = self->_webAccess;
    if ((unint64_t)webAccess | v4[2]) {
      char v7 = -[OTWebAccess isEqual:](webAccess, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(OTWalrus *)self->_walrus copyWithZone:a3];
  char v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(OTWebAccess *)self->_webAccess copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_walrus)
  {
    objc_msgSend(v4, "setWalrus:");
    id v4 = v5;
  }
  if (self->_webAccess)
  {
    objc_msgSend(v5, "setWebAccess:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_walrus)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_webAccess)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return OTAccountSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  walrus = self->_walrus;
  if (walrus)
  {
    id v5 = [(OTWalrus *)walrus dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"walrus"];
  }
  webAccess = self->_webAccess;
  if (webAccess)
  {
    char v7 = [(OTWebAccess *)webAccess dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"webAccess"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)OTAccountSettings;
  id v4 = [(OTAccountSettings *)&v8 description];
  id v5 = [(OTAccountSettings *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasWebAccess
{
  return self->_webAccess != 0;
}

- (BOOL)hasWalrus
{
  return self->_walrus != 0;
}

@end