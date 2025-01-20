@interface NRGPBDataHeader
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)checksumData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChecksumData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRGPBDataHeader

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRGPBDataHeader;
  v3 = [(NRGPBDataHeader *)&v7 description];
  v4 = [(NRGPBDataHeader *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  checksumData = self->_checksumData;
  if (checksumData) {
    [v3 setObject:checksumData forKey:@"checksumData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100009CAC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_checksumData) {
    sub_100014C98();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_checksumData copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    checksumData = self->_checksumData;
    if ((unint64_t)checksumData | v4[1]) {
      unsigned __int8 v6 = -[NSData isEqual:](checksumData, "isEqual:");
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
  return (unint64_t)[(NSData *)self->_checksumData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NRGPBDataHeader setChecksumData:](self, "setChecksumData:");
  }
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
}

@end