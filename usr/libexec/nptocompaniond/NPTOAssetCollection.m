@interface NPTOAssetCollection
- (BOOL)hasDeprecatedKeyAssetUUIDData;
- (BOOL)hasDeprecatedSubtitle;
- (BOOL)hasTitle;
- (BOOL)hasUuidData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)deprecatedKeyAssetUUIDData;
- (NSData)uuidData;
- (NSString)deprecatedSubtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)localIdentifier;
- (int)assetIndexAtIndex:(unint64_t)a3;
- (int)assetIndexs;
- (unint64_t)assetIndexsCount;
- (unint64_t)hash;
- (void)addAssetIndex:(int)a3;
- (void)clearAssetIndexs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssetIndexs:(int *)a3 count:(unint64_t)a4;
- (void)setDeprecatedKeyAssetUUIDData:(id)a3;
- (void)setDeprecatedSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUuidData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPTOAssetCollection

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NPTOAssetCollection;
  [(NPTOAssetCollection *)&v3 dealloc];
}

- (BOOL)hasUuidData
{
  return self->_uuidData != 0;
}

- (unint64_t)assetIndexsCount
{
  return self->_assetIndexs.count;
}

- (int)assetIndexs
{
  return self->_assetIndexs.list;
}

- (void)clearAssetIndexs
{
}

- (void)addAssetIndex:(int)a3
{
}

- (int)assetIndexAtIndex:(unint64_t)a3
{
  p_assetIndexs = &self->_assetIndexs;
  unint64_t count = self->_assetIndexs.count;
  if (count <= a3)
  {
    v6 = +[NSString stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count];
    v7 = +[NSException exceptionWithName:NSRangeException reason:v6 userInfo:0];
    [v7 raise];
  }
  return p_assetIndexs->list[a3];
}

- (void)setAssetIndexs:(int *)a3 count:(unint64_t)a4
{
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasDeprecatedSubtitle
{
  return self->_deprecatedSubtitle != 0;
}

- (BOOL)hasDeprecatedKeyAssetUUIDData
{
  return self->_deprecatedKeyAssetUUIDData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPTOAssetCollection;
  objc_super v3 = [(NPTOAssetCollection *)&v7 description];
  v4 = [(NPTOAssetCollection *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  objc_super v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  uuidData = self->_uuidData;
  if (uuidData) {
    [v3 setObject:uuidData forKey:@"uuidData"];
  }
  v6 = PBRepeatedInt32NSArray();
  [v4 setObject:v6 forKey:@"assetIndex"];

  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  deprecatedSubtitle = self->_deprecatedSubtitle;
  if (deprecatedSubtitle) {
    [v4 setObject:deprecatedSubtitle forKey:@"deprecated_subtitle"];
  }
  deprecatedKeyAssetUUIDData = self->_deprecatedKeyAssetUUIDData;
  if (deprecatedKeyAssetUUIDData) {
    [v4 setObject:deprecatedKeyAssetUUIDData forKey:@"deprecated_keyAssetUUIDData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPTOAssetCollectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuidData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_assetIndexs.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v6;
      ++v5;
    }
    while (v5 < self->_assetIndexs.count);
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_deprecatedSubtitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_deprecatedKeyAssetUUIDData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if (self->_uuidData) {
    [v8 setUuidData:];
  }
  if ([(NPTOAssetCollection *)self assetIndexsCount])
  {
    [v8 clearAssetIndexs];
    unint64_t v4 = [(NPTOAssetCollection *)self assetIndexsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        [v8 addAssetIndex:-[NPTOAssetCollection assetIndexAtIndex:](self, "assetIndexAtIndex:", i)];
    }
  }
  if (self->_title) {
    [v8 setTitle:];
  }
  objc_super v7 = v8;
  if (self->_deprecatedSubtitle)
  {
    [v8 setDeprecatedSubtitle:];
    objc_super v7 = v8;
  }
  if (self->_deprecatedKeyAssetUUIDData)
  {
    [v8 setDeprecatedKeyAssetUUIDData:];
    objc_super v7 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_uuidData copyWithZone:a3];
  objc_super v7 = (void *)v5[7];
  v5[7] = v6;

  PBRepeatedInt32Copy();
  id v8 = [(NSString *)self->_title copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(NSString *)self->_deprecatedSubtitle copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(NSData *)self->_deprecatedKeyAssetUUIDData copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((uuidData = self->_uuidData, !((unint64_t)uuidData | v4[7]))
     || -[NSData isEqual:](uuidData, "isEqual:"))
    && PBRepeatedInt32IsEqual()
    && ((title = self->_title, !((unint64_t)title | v4[6]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((deprecatedSubtitle = self->_deprecatedSubtitle, !((unint64_t)deprecatedSubtitle | v4[5]))
     || -[NSString isEqual:](deprecatedSubtitle, "isEqual:")))
  {
    deprecatedKeyAssetUUIDData = self->_deprecatedKeyAssetUUIDData;
    if ((unint64_t)deprecatedKeyAssetUUIDData | v4[4]) {
      unsigned __int8 v9 = -[NSData isEqual:](deprecatedKeyAssetUUIDData, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_uuidData hash];
  uint64_t v4 = PBRepeatedInt32Hash() ^ v3;
  NSUInteger v5 = [(NSString *)self->_title hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_deprecatedSubtitle hash];
  return v6 ^ (unint64_t)[(NSData *)self->_deprecatedKeyAssetUUIDData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  unsigned __int8 v9 = v4;
  if (v4[7])
  {
    -[NPTOAssetCollection setUuidData:](self, "setUuidData:");
    uint64_t v4 = v9;
  }
  NSUInteger v5 = (char *)[v4 assetIndexsCount];
  if (v5)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[NPTOAssetCollection addAssetIndex:](self, "addAssetIndex:", [v9 assetIndexAtIndex:i]);
  }
  id v8 = v9;
  if (v9[6])
  {
    -[NPTOAssetCollection setTitle:](self, "setTitle:");
    id v8 = v9;
  }
  if (v8[5])
  {
    -[NPTOAssetCollection setDeprecatedSubtitle:](self, "setDeprecatedSubtitle:");
    id v8 = v9;
  }
  if (v8[4])
  {
    -[NPTOAssetCollection setDeprecatedKeyAssetUUIDData:](self, "setDeprecatedKeyAssetUUIDData:");
    id v8 = v9;
  }
}

- (NSData)uuidData
{
  return self->_uuidData;
}

- (void)setUuidData:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)deprecatedSubtitle
{
  return self->_deprecatedSubtitle;
}

- (void)setDeprecatedSubtitle:(id)a3
{
}

- (NSData)deprecatedKeyAssetUUIDData
{
  return self->_deprecatedKeyAssetUUIDData;
}

- (void)setDeprecatedKeyAssetUUIDData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidData, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_deprecatedSubtitle, 0);

  objc_storeStrong((id *)&self->_deprecatedKeyAssetUUIDData, 0);
}

- (id)localIdentifier
{
  v2 = [(NPTOAssetCollection *)self uuidData];
  unint64_t v3 = [v2 npto_uuid];
  uint64_t v4 = [v3 UUIDString];
  NSUInteger v5 = +[PHAssetCollection localIdentifierWithUUID:v4];

  return v5;
}

@end