@interface NTKProtoPigment
- (BOOL)fromStore;
- (BOOL)hasAlternativeLocalizedStringTableName;
- (BOOL)hasBundlePrincipalClassName;
- (BOOL)hasCollectionName;
- (BOOL)hasColorFraction;
- (BOOL)hasFromStore;
- (BOOL)hasIsAddable;
- (BOOL)hasOptionName;
- (BOOL)hasSupportsSlider;
- (BOOL)isAddable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsSlider;
- (NSString)alternativeLocalizedStringTableName;
- (NSString)bundlePrincipalClassName;
- (NSString)collectionName;
- (NSString)optionName;
- (float)colorFraction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlternativeLocalizedStringTableName:(id)a3;
- (void)setBundlePrincipalClassName:(id)a3;
- (void)setCollectionName:(id)a3;
- (void)setColorFraction:(float)a3;
- (void)setFromStore:(BOOL)a3;
- (void)setHasColorFraction:(BOOL)a3;
- (void)setHasFromStore:(BOOL)a3;
- (void)setHasIsAddable:(BOOL)a3;
- (void)setHasSupportsSlider:(BOOL)a3;
- (void)setIsAddable:(BOOL)a3;
- (void)setOptionName:(id)a3;
- (void)setSupportsSlider:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTKProtoPigment

- (BOOL)hasOptionName
{
  return self->_optionName != 0;
}

- (BOOL)hasCollectionName
{
  return self->_collectionName != 0;
}

- (void)setColorFraction:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_colorFraction = a3;
}

- (void)setHasColorFraction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasColorFraction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAddable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isAddable = a3;
}

- (void)setHasIsAddable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsAddable
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSupportsSlider:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_supportsSlider = a3;
}

- (void)setHasSupportsSlider:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsSlider
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasAlternativeLocalizedStringTableName
{
  return self->_alternativeLocalizedStringTableName != 0;
}

- (BOOL)hasBundlePrincipalClassName
{
  return self->_bundlePrincipalClassName != 0;
}

- (void)setFromStore:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_fromStore = a3;
}

- (void)setHasFromStore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFromStore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTKProtoPigment;
  v4 = [(NTKProtoPigment *)&v8 description];
  v5 = [(NTKProtoPigment *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  optionName = self->_optionName;
  if (optionName) {
    [v3 setObject:optionName forKey:@"optionName"];
  }
  collectionName = self->_collectionName;
  if (collectionName) {
    [v5 setObject:collectionName forKey:@"collectionName"];
  }
  char has = (char)self->_has;
  if (has)
  {
    *(float *)&double v4 = self->_colorFraction;
    v14 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v14 forKey:@"colorFraction"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  v15 = [NSNumber numberWithBool:self->_isAddable];
  [v5 setObject:v15 forKey:@"isAddable"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    v9 = [NSNumber numberWithBool:self->_supportsSlider];
    [v5 setObject:v9 forKey:@"supportsSlider"];
  }
LABEL_9:
  alternativeLocalizedStringTableName = self->_alternativeLocalizedStringTableName;
  if (alternativeLocalizedStringTableName) {
    [v5 setObject:alternativeLocalizedStringTableName forKey:@"alternativeLocalizedStringTableName"];
  }
  bundlePrincipalClassName = self->_bundlePrincipalClassName;
  if (bundlePrincipalClassName) {
    [v5 setObject:bundlePrincipalClassName forKey:@"bundlePrincipalClassName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v12 = [NSNumber numberWithBool:self->_fromStore];
    [v5 setObject:v12 forKey:@"fromStore"];
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoPigmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_optionName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_collectionName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteFloatField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_9:
  if (self->_alternativeLocalizedStringTableName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_bundlePrincipalClassName)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_optionName)
  {
    objc_msgSend(v4, "setOptionName:");
    id v4 = v6;
  }
  if (self->_collectionName)
  {
    objc_msgSend(v6, "setCollectionName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 8) = LODWORD(self->_colorFraction);
    *((unsigned char *)v4 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((unsigned char *)v4 + 49) = self->_isAddable;
  *((unsigned char *)v4 + 52) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 50) = self->_supportsSlider;
    *((unsigned char *)v4 + 52) |= 8u;
  }
LABEL_9:
  if (self->_alternativeLocalizedStringTableName)
  {
    objc_msgSend(v6, "setAlternativeLocalizedStringTableName:");
    id v4 = v6;
  }
  if (self->_bundlePrincipalClassName)
  {
    objc_msgSend(v6, "setBundlePrincipalClassName:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_fromStore;
    *((unsigned char *)v4 + 52) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_optionName copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  uint64_t v8 = [(NSString *)self->_collectionName copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  char has = (char)self->_has;
  if (has)
  {
    *(float *)(v5 + 32) = self->_colorFraction;
    *(unsigned char *)(v5 + 52) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 49) = self->_isAddable;
  *(unsigned char *)(v5 + 52) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 50) = self->_supportsSlider;
    *(unsigned char *)(v5 + 52) |= 8u;
  }
LABEL_5:
  uint64_t v11 = [(NSString *)self->_alternativeLocalizedStringTableName copyWithZone:a3];
  v12 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v11;

  uint64_t v13 = [(NSString *)self->_bundlePrincipalClassName copyWithZone:a3];
  v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 48) = self->_fromStore;
    *(unsigned char *)(v5 + 52) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  optionName = self->_optionName;
  if ((unint64_t)optionName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](optionName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  collectionName = self->_collectionName;
  if ((unint64_t)collectionName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](collectionName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_colorFraction != *((float *)v4 + 8)) {
      goto LABEL_33;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0) {
      goto LABEL_33;
    }
    if (self->_isAddable)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_33;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0) {
      goto LABEL_33;
    }
    if (self->_supportsSlider)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_33;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_33;
  }
  alternativeLocalizedStringTableName = self->_alternativeLocalizedStringTableName;
  if ((unint64_t)alternativeLocalizedStringTableName | *((void *)v4 + 1)
    && !-[NSString isEqual:](alternativeLocalizedStringTableName, "isEqual:"))
  {
    goto LABEL_33;
  }
  bundlePrincipalClassName = self->_bundlePrincipalClassName;
  if ((unint64_t)bundlePrincipalClassName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](bundlePrincipalClassName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 52) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) != 0)
    {
      if (self->_fromStore)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_33;
        }
      }
      else if (*((unsigned char *)v4 + 48))
      {
        goto LABEL_33;
      }
      BOOL v9 = 1;
      goto LABEL_34;
    }
LABEL_33:
    BOOL v9 = 0;
  }
LABEL_34:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_optionName hash];
  NSUInteger v4 = [(NSString *)self->_collectionName hash];
  char has = (char)self->_has;
  if (has)
  {
    float colorFraction = self->_colorFraction;
    float v8 = -colorFraction;
    if (colorFraction >= 0.0) {
      float v8 = self->_colorFraction;
    }
    float v9 = floorf(v8 + 0.5);
    float v10 = (float)(v8 - v9) * 1.8447e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmodf(v9, 1.8447e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabsf(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_isAddable;
    if ((has & 8) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((has & 8) != 0)
    {
LABEL_11:
      uint64_t v12 = 2654435761 * self->_supportsSlider;
      goto LABEL_14;
    }
  }
  uint64_t v12 = 0;
LABEL_14:
  NSUInteger v13 = [(NSString *)self->_alternativeLocalizedStringTableName hash];
  NSUInteger v14 = [(NSString *)self->_bundlePrincipalClassName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v15 = 2654435761 * self->_fromStore;
  }
  else {
    uint64_t v15 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 5))
  {
    -[NTKProtoPigment setOptionName:](self, "setOptionName:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[NTKProtoPigment setCollectionName:](self, "setCollectionName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if (v5)
  {
    self->_float colorFraction = *((float *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_isAddable = *((unsigned char *)v4 + 49);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
LABEL_8:
    self->_supportsSlider = *((unsigned char *)v4 + 50);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_9:
  if (*((void *)v4 + 1))
  {
    -[NTKProtoPigment setAlternativeLocalizedStringTableName:](self, "setAlternativeLocalizedStringTableName:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[NTKProtoPigment setBundlePrincipalClassName:](self, "setBundlePrincipalClassName:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    self->_fromStore = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)optionName
{
  return self->_optionName;
}

- (void)setOptionName:(id)a3
{
}

- (NSString)collectionName
{
  return self->_collectionName;
}

- (void)setCollectionName:(id)a3
{
}

- (float)colorFraction
{
  return self->_colorFraction;
}

- (BOOL)isAddable
{
  return self->_isAddable;
}

- (BOOL)supportsSlider
{
  return self->_supportsSlider;
}

- (NSString)alternativeLocalizedStringTableName
{
  return self->_alternativeLocalizedStringTableName;
}

- (void)setAlternativeLocalizedStringTableName:(id)a3
{
}

- (NSString)bundlePrincipalClassName
{
  return self->_bundlePrincipalClassName;
}

- (void)setBundlePrincipalClassName:(id)a3
{
}

- (BOOL)fromStore
{
  return self->_fromStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionName, 0);
  objc_storeStrong((id *)&self->_collectionName, 0);
  objc_storeStrong((id *)&self->_bundlePrincipalClassName, 0);

  objc_storeStrong((id *)&self->_alternativeLocalizedStringTableName, 0);
}

@end