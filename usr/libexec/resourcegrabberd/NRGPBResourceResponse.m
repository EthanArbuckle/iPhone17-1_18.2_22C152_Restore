@interface NRGPBResourceResponse
- (BOOL)hasChecksumData;
- (BOOL)hasResource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)checksumData;
- (NSData)resource;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChecksumData:(id)a3;
- (void)setResource:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRGPBResourceResponse

- (BOOL)hasResource
{
  return self->_resource != 0;
}

- (BOOL)hasChecksumData
{
  return self->_checksumData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRGPBResourceResponse;
  v3 = [(NRGPBResourceResponse *)&v7 description];
  v4 = [(NRGPBResourceResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  resource = self->_resource;
  if (resource) {
    [v3 setObject:resource forKey:@"resource"];
  }
  checksumData = self->_checksumData;
  if (checksumData) {
    [v4 setObject:checksumData forKey:@"checksumData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100006D24((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_resource)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_checksumData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_resource)
  {
    [v4 setResource:];
    id v4 = v5;
  }
  if (self->_checksumData)
  {
    [v5 setChecksumData:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_resource copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_checksumData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((resource = self->_resource, !((unint64_t)resource | v4[2]))
     || -[NSData isEqual:](resource, "isEqual:")))
  {
    checksumData = self->_checksumData;
    if ((unint64_t)checksumData | v4[1]) {
      unsigned __int8 v7 = -[NSData isEqual:](checksumData, "isEqual:");
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
  unint64_t v3 = (unint64_t)[(NSData *)self->_resource hash];
  return (unint64_t)[(NSData *)self->_checksumData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NRGPBResourceResponse setResource:](self, "setResource:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NRGPBResourceResponse setChecksumData:](self, "setChecksumData:");
    id v4 = v5;
  }
}

- (NSData)resource
{
  return self->_resource;
}

- (void)setResource:(id)a3
{
}

- (NSData)checksumData
{
  return self->_checksumData;
}

- (void)setChecksumData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resource, 0);

  objc_storeStrong((id *)&self->_checksumData, 0);
}

@end