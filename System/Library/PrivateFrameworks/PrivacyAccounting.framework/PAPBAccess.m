@interface PAPBAccess
+ (Class)assetIdentifiersType;
- (BOOL)hasAccessCount;
- (BOOL)hasAccessor;
- (BOOL)hasIdentifier;
- (BOOL)hasKind;
- (BOOL)hasTimestampAdjustment;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)identifier;
- (NSMutableArray)assetIdentifiers;
- (PAPBApplication)accessor;
- (double)timestampAdjustment;
- (id)assetIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)accessCount;
- (int)kind;
- (unint64_t)assetIdentifiersCount;
- (unint64_t)hash;
- (void)addAssetIdentifiers:(id)a3;
- (void)clearAssetIdentifiers;
- (void)mergeFrom:(id)a3;
- (void)setAccessCount:(int)a3;
- (void)setAccessor:(id)a3;
- (void)setAssetIdentifiers:(id)a3;
- (void)setHasAccessCount:(BOOL)a3;
- (void)setHasKind:(BOOL)a3;
- (void)setHasTimestampAdjustment:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setKind:(int)a3;
- (void)setTimestampAdjustment:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PAPBAccess

- (BOOL)hasAccessor
{
  return self->_accessor != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (int)kind
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_kind;
  }
  else {
    return 0;
  }
}

- (void)setKind:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_kind = a3;
}

- (void)setHasKind:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKind
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTimestampAdjustment:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestampAdjustment = a3;
}

- (void)setHasTimestampAdjustment:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampAdjustment
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearAssetIdentifiers
{
}

- (void)addAssetIdentifiers:(id)a3
{
  id v4 = a3;
  assetIdentifiers = self->_assetIdentifiers;
  id v8 = v4;
  if (!assetIdentifiers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_assetIdentifiers;
    self->_assetIdentifiers = v6;

    id v4 = v8;
    assetIdentifiers = self->_assetIdentifiers;
  }
  [(NSMutableArray *)assetIdentifiers addObject:v4];
}

- (unint64_t)assetIdentifiersCount
{
  return [(NSMutableArray *)self->_assetIdentifiers count];
}

- (id)assetIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_assetIdentifiers objectAtIndexedSubscript:a3];
}

+ (Class)assetIdentifiersType
{
  return (Class)objc_opt_class();
}

- (void)setAccessCount:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_accessCount = a3;
}

- (void)setHasAccessCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAccessCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PAPBAccess;
  id v4 = [(PAPBAccess *)&v8 description];
  v5 = [(PAPBAccess *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  accessor = self->_accessor;
  if (accessor)
  {
    v5 = [(PAPBApplication *)accessor dictionaryRepresentation];
    [v3 setObject:v5 forKeyedSubscript:@"accessor"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKeyedSubscript:@"identifier"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_kind];
    [v3 setObject:v8 forKeyedSubscript:@"kind"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_timestampAdjustment];
    [v3 setObject:v9 forKeyedSubscript:@"timestampAdjustment"];
  }
  assetIdentifiers = self->_assetIdentifiers;
  if (assetIdentifiers) {
    [v3 setObject:assetIdentifiers forKeyedSubscript:@"assetIdentifiers"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v11 = [NSNumber numberWithInt:self->_accessCount];
    [v3 setObject:v11 forKeyedSubscript:@"accessCount"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PAPBAccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_accessor) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_identifier) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_assetIdentifiers;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteDataField();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(PAPBApplication *)self->_accessor copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSData *)self->_identifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_kind;
    *(unsigned char *)(v5 + 52) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_timestampAdjustment;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v11 = self->_assetIdentifiers;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addAssetIdentifiers:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_accessCount;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  accessor = self->_accessor;
  if ((unint64_t)accessor | *((void *)v4 + 3))
  {
    if (!-[PAPBApplication isEqual:](accessor, "isEqual:")) {
      goto LABEL_23;
    }
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](identifier, "isEqual:")) {
      goto LABEL_23;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_kind != *((_DWORD *)v4 + 12)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_timestampAdjustment != *((double *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_23;
  }
  assetIdentifiers = self->_assetIdentifiers;
  if ((unint64_t)assetIdentifiers | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](assetIdentifiers, "isEqual:"))
    {
LABEL_23:
      BOOL v9 = 0;
      goto LABEL_24;
    }
    char has = (char)self->_has;
  }
  BOOL v9 = (*((unsigned char *)v4 + 52) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_accessCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_23;
    }
    BOOL v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PAPBApplication *)self->_accessor hash];
  uint64_t v4 = [(NSData *)self->_identifier hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_kind;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timestampAdjustment = self->_timestampAdjustment;
  double v7 = -timestampAdjustment;
  if (timestampAdjustment >= 0.0) {
    double v7 = self->_timestampAdjustment;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  uint64_t v11 = [(NSMutableArray *)self->_assetIdentifiers hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_accessCount;
  }
  else {
    uint64_t v12 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  accessor = self->_accessor;
  uint64_t v6 = *((void *)v4 + 3);
  if (accessor)
  {
    if (v6) {
      -[PAPBApplication mergeFrom:](accessor, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[PAPBAccess setAccessor:](self, "setAccessor:");
  }
  if (*((void *)v4 + 5)) {
    -[PAPBAccess setIdentifier:](self, "setIdentifier:");
  }
  char v7 = *((unsigned char *)v4 + 52);
  if ((v7 & 4) != 0)
  {
    self->_kind = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v4 + 52);
  }
  if (v7)
  {
    self->_double timestampAdjustment = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = *((id *)v4 + 4);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[PAPBAccess addAssetIdentifiers:](self, "addAssetIdentifiers:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    self->_accessCount = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (PAPBApplication)accessor
{
  return self->_accessor;
}

- (void)setAccessor:(id)a3
{
}

- (NSData)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)timestampAdjustment
{
  return self->_timestampAdjustment;
}

- (NSMutableArray)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (void)setAssetIdentifiers:(id)a3
{
}

- (int)accessCount
{
  return self->_accessCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);

  objc_storeStrong((id *)&self->_accessor, 0);
}

@end