@interface APPBAdLayoutData
- (APPBAdLayoutDetails)adLayoutDetails;
- (BOOL)hasAdLayoutDetails;
- (BOOL)hasLocaleIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)localeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdLayoutDetails:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdLayoutData

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (BOOL)hasAdLayoutDetails
{
  return self->_adLayoutDetails != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdLayoutData;
  v3 = [(APPBAdLayoutData *)&v7 description];
  v4 = [(APPBAdLayoutData *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v3 setObject:localeIdentifier forKey:@"localeIdentifier"];
  }
  adLayoutDetails = self->_adLayoutDetails;
  if (adLayoutDetails)
  {
    objc_super v7 = [(APPBAdLayoutDetails *)adLayoutDetails dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"adLayoutDetails"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdLayoutDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_adLayoutDetails)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_localeIdentifier)
  {
    [v4 setLocaleIdentifier:];
    id v4 = v5;
  }
  if (self->_adLayoutDetails)
  {
    [v5 setAdLayoutDetails:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(APPBAdLayoutDetails *)self->_adLayoutDetails copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((localeIdentifier = self->_localeIdentifier, !((unint64_t)localeIdentifier | v4[2]))
     || -[NSString isEqual:](localeIdentifier, "isEqual:")))
  {
    adLayoutDetails = self->_adLayoutDetails;
    if ((unint64_t)adLayoutDetails | v4[1]) {
      unsigned __int8 v7 = -[APPBAdLayoutDetails isEqual:](adLayoutDetails, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_localeIdentifier hash];
  return [(APPBAdLayoutDetails *)self->_adLayoutDetails hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unsigned __int8 v7 = v4;
  if (v4[2])
  {
    -[APPBAdLayoutData setLocaleIdentifier:](self, "setLocaleIdentifier:");
    id v4 = v7;
  }
  adLayoutDetails = self->_adLayoutDetails;
  uint64_t v6 = v4[1];
  if (adLayoutDetails)
  {
    if (v6) {
      -[APPBAdLayoutDetails mergeFrom:](adLayoutDetails, "mergeFrom:");
    }
  }
  else if (v6)
  {
    [(APPBAdLayoutData *)self setAdLayoutDetails:"setAdLayoutDetails:"];
  }

  _objc_release_x1();
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (APPBAdLayoutDetails)adLayoutDetails
{
  return self->_adLayoutDetails;
}

- (void)setAdLayoutDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);

  objc_storeStrong((id *)&self->_adLayoutDetails, 0);
}

@end