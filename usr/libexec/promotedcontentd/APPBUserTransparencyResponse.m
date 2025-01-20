@interface APPBUserTransparencyResponse
- (APPBTransparencyDetails)transparencyDetails;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setTransparencyDetails:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBUserTransparencyResponse

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBUserTransparencyResponse;
  v3 = [(APPBUserTransparencyResponse *)&v7 description];
  v4 = [(APPBUserTransparencyResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  transparencyDetails = self->_transparencyDetails;
  if (transparencyDetails)
  {
    v5 = [(APPBTransparencyDetails *)transparencyDetails dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"transparencyDetails"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return APPBUserTransparencyResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_transparencyDetails) {
    sub_10019A658();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(APPBTransparencyDetails *)self->_transparencyDetails copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    transparencyDetails = self->_transparencyDetails;
    if ((unint64_t)transparencyDetails | v4[1]) {
      unsigned __int8 v6 = -[APPBTransparencyDetails isEqual:](transparencyDetails, "isEqual:");
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
  return [(APPBTransparencyDetails *)self->_transparencyDetails hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  transparencyDetails = self->_transparencyDetails;
  uint64_t v6 = v4[1];
  if (transparencyDetails)
  {
    if (v6) {
      -[APPBTransparencyDetails mergeFrom:](transparencyDetails, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[APPBUserTransparencyResponse setTransparencyDetails:](self, "setTransparencyDetails:");
  }

  _objc_release_x1();
}

- (APPBTransparencyDetails)transparencyDetails
{
  return self->_transparencyDetails;
}

- (void)setTransparencyDetails:(id)a3
{
}

- (void).cxx_destruct
{
}

@end