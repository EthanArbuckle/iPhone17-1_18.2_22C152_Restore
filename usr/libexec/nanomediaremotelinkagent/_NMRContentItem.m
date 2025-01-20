@interface _NMRContentItem
- (BOOL)hasIdentifier;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)identifier;
- (_NMRContentItemMetadata)metadata;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _NMRContentItem

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)_NMRContentItem;
  v3 = [(_NMRContentItem *)&v7 description];
  v4 = [(_NMRContentItem *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  metadata = self->_metadata;
  if (metadata)
  {
    objc_super v7 = [(_NMRContentItemMetadata *)metadata dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"metadata"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100003F6C((uint64_t)self, (uint64_t)a3);
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
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    [v4 setIdentifier:];
    id v4 = v5;
  }
  if (self->_metadata)
  {
    [v5 setMetadata:];
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_identifier copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(_NMRContentItemMetadata *)self->_metadata copyWithZone:a3];
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
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[2]) {
      unsigned __int8 v7 = -[_NMRContentItemMetadata isEqual:](metadata, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(_NMRContentItemMetadata *)self->_metadata hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  unsigned __int8 v7 = v4;
  if (v4[1])
  {
    -[_NMRContentItem setIdentifier:](self, "setIdentifier:");
    id v4 = v7;
  }
  metadata = self->_metadata;
  uint64_t v6 = v4[2];
  if (metadata)
  {
    if (v6) {
      -[_NMRContentItemMetadata mergeFrom:](metadata, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_NMRContentItem setMetadata:](self, "setMetadata:");
  }

  _objc_release_x1();
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (_NMRContentItemMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end