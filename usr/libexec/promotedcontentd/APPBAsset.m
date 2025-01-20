@interface APPBAsset
+ (Class)assetInfoType;
- (BOOL)hasAdamId;
- (BOOL)hasLocation;
- (BOOL)hasName;
- (BOOL)hasTreatment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)assetInfos;
- (NSString)name;
- (NSString)treatment;
- (id)assetInfoAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationAsString:(int)a3;
- (int)StringAsLocation:(id)a3;
- (int)location;
- (unint64_t)adamId;
- (unint64_t)assetInfosCount;
- (unint64_t)hash;
- (void)addAssetInfo:(id)a3;
- (void)clearAssetInfos;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdamId:(unint64_t)a3;
- (void)setAssetInfos:(id)a3;
- (void)setHasAdamId:(BOOL)a3;
- (void)setHasLocation:(BOOL)a3;
- (void)setLocation:(int)a3;
- (void)setName:(id)a3;
- (void)setTreatment:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAsset

- (BOOL)hasName
{
  return self->_name != 0;
}

- (int)location
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_location;
  }
  else {
    return 7500;
  }
}

- (void)setLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_location = a3;
}

- (void)setHasLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)locationAsString:(int)a3
{
  if ((a3 - 7500) >= 3)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_1002351A8 + a3 - 7500);
  }

  return v3;
}

- (int)StringAsLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Left"])
  {
    int v4 = 7500;
  }
  else if ([v3 isEqualToString:@"Center"])
  {
    int v4 = 7501;
  }
  else if ([v3 isEqualToString:@"Right"])
  {
    int v4 = 7502;
  }
  else
  {
    int v4 = 7500;
  }

  return v4;
}

- (void)clearAssetInfos
{
}

- (void)addAssetInfo:(id)a3
{
  id v4 = a3;
  assetInfos = self->_assetInfos;
  id v8 = v4;
  if (!assetInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_assetInfos;
    self->_assetInfos = v6;

    id v4 = v8;
    assetInfos = self->_assetInfos;
  }
  [(NSMutableArray *)assetInfos addObject:v4];
}

- (unint64_t)assetInfosCount
{
  return (unint64_t)[(NSMutableArray *)self->_assetInfos count];
}

- (id)assetInfoAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_assetInfos objectAtIndex:a3];
}

+ (Class)assetInfoType
{
  return (Class)objc_opt_class();
}

- (void)setAdamId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdamId
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTreatment
{
  return self->_treatment != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAsset;
  id v3 = [(APPBAsset *)&v7 description];
  id v4 = [(APPBAsset *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    int v6 = self->_location - 7500;
    if (v6 >= 3)
    {
      objc_super v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_location];
    }
    else
    {
      objc_super v7 = *(&off_1002351A8 + v6);
    }
    [v4 setObject:v7 forKey:@"location"];
  }
  if ([(NSMutableArray *)self->_assetInfos count])
  {
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_assetInfos, "count")];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = self->_assetInfos;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"assetInfo"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v15 = +[NSNumber numberWithUnsignedLongLong:self->_adamId];
    [v4 setObject:v15 forKey:@"adamId"];
  }
  treatment = self->_treatment;
  if (treatment) {
    [v4 setObject:treatment forKey:@"treatment"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_assetInfos;
  int v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_treatment) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_name)
  {
    [v4 setName:];
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_location;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  if ([(APPBAsset *)self assetInfosCount])
  {
    [v10 clearAssetInfos];
    unint64_t v5 = [(APPBAsset *)self assetInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(APPBAsset *)self assetInfoAtIndex:i];
        [v10 addAssetInfo:v8];
      }
    }
  }
  v9 = v10;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v10 + 1) = self->_adamId;
    *((unsigned char *)v10 + 48) |= 1u;
  }
  if (self->_treatment)
  {
    [v10 setTreatment:];
    v9 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_name copyWithZone:a3];
  objc_super v7 = (void *)v5[4];
  v5[4] = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 6) = self->_location;
    *((unsigned char *)v5 + 48) |= 2u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = self->_assetInfos;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      long long v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v12) copyWithZone:a3];
        [v5 addAssetInfo:v13];

        long long v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_adamId;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v14 = -[NSString copyWithZone:](self->_treatment, "copyWithZone:", a3, (void)v17);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_19;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_location != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_19;
  }
  assetInfos = self->_assetInfos;
  if ((unint64_t)assetInfos | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](assetInfos, "isEqual:"))
    {
LABEL_19:
      unsigned __int8 v9 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_adamId != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_19;
  }
  treatment = self->_treatment;
  if ((unint64_t)treatment | *((void *)v4 + 5)) {
    unsigned __int8 v9 = -[NSString isEqual:](treatment, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_location;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_assetInfos hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_adamId;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_treatment hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4)) {
    -[APPBAsset setName:](self, "setName:");
  }
  if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    self->_location = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[APPBAsset addAssetInfo:](self, "addAssetInfo:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 48))
  {
    self->_adamId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5)) {
    -[APPBAsset setTreatment:](self, "setTreatment:");
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSMutableArray)assetInfos
{
  return self->_assetInfos;
}

- (void)setAssetInfos:(id)a3
{
}

- (unint64_t)adamId
{
  return self->_adamId;
}

- (NSString)treatment
{
  return self->_treatment;
}

- (void)setTreatment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_treatment, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_assetInfos, 0);
}

@end