@interface NTKProtoPigmentCollectionConfig
+ (Class)defaultGalleryColorNamesType;
+ (Class)exclusionsType;
+ (Class)migrationType;
- (BOOL)excludesDuotone;
- (BOOL)hasCollectionOverride;
- (BOOL)hasDefaultColorOptionName;
- (BOOL)hasDefaultConfigAttributeName;
- (BOOL)hasExcludesDuotone;
- (BOOL)hasFallbackDefaultColorOptionName;
- (BOOL)hasFeatureFlag;
- (BOOL)hasIsAddable;
- (BOOL)hasSensitivity;
- (BOOL)hasSortedByHue;
- (BOOL)hasSupportsSlider;
- (BOOL)isAddable;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)sensitivity;
- (BOOL)sortedByHue;
- (BOOL)supportsSlider;
- (NSMutableArray)defaultGalleryColorNames;
- (NSMutableArray)exclusions;
- (NSMutableArray)migrations;
- (NSString)collectionOverride;
- (NSString)defaultColorOptionName;
- (NSString)defaultConfigAttributeName;
- (NSString)fallbackDefaultColorOptionName;
- (NSString)featureFlag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultGalleryColorNamesAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)exclusionsAtIndex:(unint64_t)a3;
- (id)migrationAtIndex:(unint64_t)a3;
- (unint64_t)defaultGalleryColorNamesCount;
- (unint64_t)exclusionsCount;
- (unint64_t)hash;
- (unint64_t)migrationsCount;
- (void)addDefaultGalleryColorNames:(id)a3;
- (void)addExclusions:(id)a3;
- (void)addMigration:(id)a3;
- (void)clearDefaultGalleryColorNames;
- (void)clearExclusions;
- (void)clearMigrations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCollectionOverride:(id)a3;
- (void)setDefaultColorOptionName:(id)a3;
- (void)setDefaultConfigAttributeName:(id)a3;
- (void)setDefaultGalleryColorNames:(id)a3;
- (void)setExcludesDuotone:(BOOL)a3;
- (void)setExclusions:(id)a3;
- (void)setFallbackDefaultColorOptionName:(id)a3;
- (void)setFeatureFlag:(id)a3;
- (void)setHasExcludesDuotone:(BOOL)a3;
- (void)setHasIsAddable:(BOOL)a3;
- (void)setHasSensitivity:(BOOL)a3;
- (void)setHasSortedByHue:(BOOL)a3;
- (void)setHasSupportsSlider:(BOOL)a3;
- (void)setIsAddable:(BOOL)a3;
- (void)setMigrations:(id)a3;
- (void)setSensitivity:(BOOL)a3;
- (void)setSortedByHue:(BOOL)a3;
- (void)setSupportsSlider:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTKProtoPigmentCollectionConfig

- (BOOL)hasDefaultColorOptionName
{
  return self->_defaultColorOptionName != 0;
}

- (BOOL)hasFallbackDefaultColorOptionName
{
  return self->_fallbackDefaultColorOptionName != 0;
}

- (BOOL)hasDefaultConfigAttributeName
{
  return self->_defaultConfigAttributeName != 0;
}

- (void)clearDefaultGalleryColorNames
{
}

- (void)addDefaultGalleryColorNames:(id)a3
{
  id v4 = a3;
  defaultGalleryColorNames = self->_defaultGalleryColorNames;
  id v8 = v4;
  if (!defaultGalleryColorNames)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_defaultGalleryColorNames;
    self->_defaultGalleryColorNames = v6;

    id v4 = v8;
    defaultGalleryColorNames = self->_defaultGalleryColorNames;
  }
  [(NSMutableArray *)defaultGalleryColorNames addObject:v4];
}

- (unint64_t)defaultGalleryColorNamesCount
{
  return [(NSMutableArray *)self->_defaultGalleryColorNames count];
}

- (id)defaultGalleryColorNamesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_defaultGalleryColorNames objectAtIndex:a3];
}

+ (Class)defaultGalleryColorNamesType
{
  return (Class)objc_opt_class();
}

- (void)setSensitivity:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_sensitivity = a3;
}

- (void)setHasSensitivity:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSensitivity
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsAddable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isAddable = a3;
}

- (void)setHasIsAddable:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsAddable
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSortedByHue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sortedByHue = a3;
}

- (void)setHasSortedByHue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSortedByHue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSupportsSlider:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_supportsSlider = a3;
}

- (void)setHasSupportsSlider:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSupportsSlider
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasFeatureFlag
{
  return self->_featureFlag != 0;
}

- (void)setExcludesDuotone:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_excludesDuotone = a3;
}

- (void)setHasExcludesDuotone:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExcludesDuotone
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearExclusions
{
}

- (void)addExclusions:(id)a3
{
  id v4 = a3;
  exclusions = self->_exclusions;
  id v8 = v4;
  if (!exclusions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_exclusions;
    self->_exclusions = v6;

    id v4 = v8;
    exclusions = self->_exclusions;
  }
  [(NSMutableArray *)exclusions addObject:v4];
}

- (unint64_t)exclusionsCount
{
  return [(NSMutableArray *)self->_exclusions count];
}

- (id)exclusionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_exclusions objectAtIndex:a3];
}

+ (Class)exclusionsType
{
  return (Class)objc_opt_class();
}

- (void)clearMigrations
{
}

- (void)addMigration:(id)a3
{
  id v4 = a3;
  migrations = self->_migrations;
  id v8 = v4;
  if (!migrations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_migrations;
    self->_migrations = v6;

    id v4 = v8;
    migrations = self->_migrations;
  }
  [(NSMutableArray *)migrations addObject:v4];
}

- (unint64_t)migrationsCount
{
  return [(NSMutableArray *)self->_migrations count];
}

- (id)migrationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_migrations objectAtIndex:a3];
}

+ (Class)migrationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCollectionOverride
{
  return self->_collectionOverride != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTKProtoPigmentCollectionConfig;
  id v4 = [(NTKProtoPigmentCollectionConfig *)&v8 description];
  v5 = [(NTKProtoPigmentCollectionConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  defaultColorOptionName = self->_defaultColorOptionName;
  if (defaultColorOptionName) {
    [v3 setObject:defaultColorOptionName forKey:@"defaultColorOptionName"];
  }
  fallbackDefaultColorOptionName = self->_fallbackDefaultColorOptionName;
  if (fallbackDefaultColorOptionName) {
    [v4 setObject:fallbackDefaultColorOptionName forKey:@"fallbackDefaultColorOptionName"];
  }
  defaultConfigAttributeName = self->_defaultConfigAttributeName;
  if (defaultConfigAttributeName) {
    [v4 setObject:defaultConfigAttributeName forKey:@"defaultConfigAttributeName"];
  }
  defaultGalleryColorNames = self->_defaultGalleryColorNames;
  if (defaultGalleryColorNames) {
    [v4 setObject:defaultGalleryColorNames forKey:@"defaultGalleryColorNames"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v23 = [NSNumber numberWithBool:self->_sensitivity];
    [v4 setObject:v23 forKey:@"sensitivity"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v24 = [NSNumber numberWithBool:self->_isAddable];
  [v4 setObject:v24 forKey:@"isAddable"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_36:
  v25 = [NSNumber numberWithBool:self->_sortedByHue];
  [v4 setObject:v25 forKey:@"sortedByHue"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    v10 = [NSNumber numberWithBool:self->_supportsSlider];
    [v4 setObject:v10 forKey:@"supportsSlider"];
  }
LABEL_14:
  featureFlag = self->_featureFlag;
  if (featureFlag) {
    [v4 setObject:featureFlag forKey:@"featureFlag"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v12 = [NSNumber numberWithBool:self->_excludesDuotone];
    [v4 setObject:v12 forKey:@"excludesDuotone"];
  }
  exclusions = self->_exclusions;
  if (exclusions) {
    [v4 setObject:exclusions forKey:@"exclusions"];
  }
  if ([(NSMutableArray *)self->_migrations count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_migrations, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v15 = self->_migrations;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (void)v26);
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"migration"];
  }
  collectionOverride = self->_collectionOverride;
  if (collectionOverride) {
    [v4 setObject:collectionOverride forKey:@"collectionOverride"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTKProtoPigmentCollectionConfigReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_defaultColorOptionName) {
    PBDataWriterWriteStringField();
  }
  if (self->_fallbackDefaultColorOptionName) {
    PBDataWriterWriteStringField();
  }
  if (self->_defaultConfigAttributeName) {
    PBDataWriterWriteStringField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = self->_defaultGalleryColorNames;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_16:
      if ((has & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_42;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_17:
    if ((has & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_18:
  }
    PBDataWriterWriteBOOLField();
LABEL_19:
  if (self->_featureFlag) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v11 = self->_exclusions;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v16 = self->_migrations;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }

  if (self->_collectionOverride) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v18 = a3;
  if (self->_defaultColorOptionName) {
    objc_msgSend(v18, "setDefaultColorOptionName:");
  }
  if (self->_fallbackDefaultColorOptionName) {
    objc_msgSend(v18, "setFallbackDefaultColorOptionName:");
  }
  if (self->_defaultConfigAttributeName) {
    objc_msgSend(v18, "setDefaultConfigAttributeName:");
  }
  if ([(NTKProtoPigmentCollectionConfig *)self defaultGalleryColorNamesCount])
  {
    [v18 clearDefaultGalleryColorNames];
    unint64_t v4 = [(NTKProtoPigmentCollectionConfig *)self defaultGalleryColorNamesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NTKProtoPigmentCollectionConfig *)self defaultGalleryColorNamesAtIndex:i];
        [v18 addDefaultGalleryColorNames:v7];
      }
    }
  }
  char has = (char)self->_has;
  v9 = v18;
  if ((has & 4) != 0)
  {
    v18[74] = self->_sensitivity;
    v18[80] |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v18[73] = self->_isAddable;
  v18[80] |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_14:
    if ((has & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_35:
  v18[75] = self->_sortedByHue;
  v18[80] |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_15:
    v18[76] = self->_supportsSlider;
    v18[80] |= 0x10u;
  }
LABEL_16:
  if (self->_featureFlag)
  {
    objc_msgSend(v18, "setFeatureFlag:");
    v9 = v18;
  }
  if (*(unsigned char *)&self->_has)
  {
    v9[72] = self->_excludesDuotone;
    v9[80] |= 1u;
  }
  if ([(NTKProtoPigmentCollectionConfig *)self exclusionsCount])
  {
    [v18 clearExclusions];
    unint64_t v10 = [(NTKProtoPigmentCollectionConfig *)self exclusionsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
      {
        uint64_t v13 = [(NTKProtoPigmentCollectionConfig *)self exclusionsAtIndex:j];
        [v18 addExclusions:v13];
      }
    }
  }
  if ([(NTKProtoPigmentCollectionConfig *)self migrationsCount])
  {
    [v18 clearMigrations];
    unint64_t v14 = [(NTKProtoPigmentCollectionConfig *)self migrationsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
      {
        uint64_t v17 = [(NTKProtoPigmentCollectionConfig *)self migrationAtIndex:k];
        [v18 addMigration:v17];
      }
    }
  }
  if (self->_collectionOverride) {
    objc_msgSend(v18, "setCollectionOverride:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_defaultColorOptionName copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_fallbackDefaultColorOptionName copyWithZone:a3];
  v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_defaultConfigAttributeName copyWithZone:a3];
  unint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v12 = self->_defaultGalleryColorNames;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addDefaultGalleryColorNames:v17];
      }
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v14);
  }

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v5 + 74) = self->_sensitivity;
    *(unsigned char *)(v5 + 80) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_10;
  }
  *(unsigned char *)(v5 + 73) = self->_isAddable;
  *(unsigned char *)(v5 + 80) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_32:
  *(unsigned char *)(v5 + 75) = self->_sortedByHue;
  *(unsigned char *)(v5 + 80) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_12:
    *(unsigned char *)(v5 + 76) = self->_supportsSlider;
    *(unsigned char *)(v5 + 80) |= 0x10u;
  }
LABEL_13:
  uint64_t v19 = [(NSString *)self->_featureFlag copyWithZone:a3];
  v20 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v19;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 72) = self->_excludesDuotone;
    *(unsigned char *)(v5 + 80) |= 1u;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v21 = self->_exclusions;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addExclusions:v26];
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v23);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v27 = self->_migrations;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * k), "copyWithZone:", a3, (void)v36);
        [(id)v5 addMigration:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v29);
  }

  uint64_t v33 = [(NSString *)self->_collectionOverride copyWithZone:a3];
  v34 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v33;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_59;
  }
  defaultColorOptionName = self->_defaultColorOptionName;
  if ((unint64_t)defaultColorOptionName | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](defaultColorOptionName, "isEqual:")) {
      goto LABEL_59;
    }
  }
  fallbackDefaultColorOptionName = self->_fallbackDefaultColorOptionName;
  if ((unint64_t)fallbackDefaultColorOptionName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](fallbackDefaultColorOptionName, "isEqual:")) {
      goto LABEL_59;
    }
  }
  defaultConfigAttributeName = self->_defaultConfigAttributeName;
  if ((unint64_t)defaultConfigAttributeName | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](defaultConfigAttributeName, "isEqual:")) {
      goto LABEL_59;
    }
  }
  defaultGalleryColorNames = self->_defaultGalleryColorNames;
  if ((unint64_t)defaultGalleryColorNames | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](defaultGalleryColorNames, "isEqual:")) {
      goto LABEL_59;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0) {
      goto LABEL_59;
    }
    if (self->_sensitivity)
    {
      if (!*((unsigned char *)v4 + 74)) {
        goto LABEL_59;
      }
    }
    else if (*((unsigned char *)v4 + 74))
    {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_59;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0) {
      goto LABEL_59;
    }
    if (self->_isAddable)
    {
      if (!*((unsigned char *)v4 + 73)) {
        goto LABEL_59;
      }
    }
    else if (*((unsigned char *)v4 + 73))
    {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_59;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 8) == 0) {
      goto LABEL_59;
    }
    if (self->_sortedByHue)
    {
      if (!*((unsigned char *)v4 + 75)) {
        goto LABEL_59;
      }
    }
    else if (*((unsigned char *)v4 + 75))
    {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
    goto LABEL_59;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x10) == 0) {
      goto LABEL_59;
    }
    if (self->_supportsSlider)
    {
      if (!*((unsigned char *)v4 + 76)) {
        goto LABEL_59;
      }
    }
    else if (*((unsigned char *)v4 + 76))
    {
      goto LABEL_59;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_59;
  }
  featureFlag = self->_featureFlag;
  if ((unint64_t)featureFlag | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](featureFlag, "isEqual:")) {
      goto LABEL_59;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if (*((unsigned char *)v4 + 80))
    {
      if (self->_excludesDuotone)
      {
        if (!*((unsigned char *)v4 + 72)) {
          goto LABEL_59;
        }
        goto LABEL_53;
      }
      if (!*((unsigned char *)v4 + 72)) {
        goto LABEL_53;
      }
    }
LABEL_59:
    char v14 = 0;
    goto LABEL_60;
  }
  if (*((unsigned char *)v4 + 80)) {
    goto LABEL_59;
  }
LABEL_53:
  exclusions = self->_exclusions;
  if ((unint64_t)exclusions | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](exclusions, "isEqual:"))
  {
    goto LABEL_59;
  }
  migrations = self->_migrations;
  if ((unint64_t)migrations | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](migrations, "isEqual:")) {
      goto LABEL_59;
    }
  }
  collectionOverride = self->_collectionOverride;
  if ((unint64_t)collectionOverride | *((void *)v4 + 1)) {
    char v14 = -[NSString isEqual:](collectionOverride, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_60:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v16 = [(NSString *)self->_defaultColorOptionName hash];
  NSUInteger v3 = [(NSString *)self->_fallbackDefaultColorOptionName hash];
  NSUInteger v4 = [(NSString *)self->_defaultConfigAttributeName hash];
  uint64_t v5 = [(NSMutableArray *)self->_defaultGalleryColorNames hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v6 = 2654435761 * self->_sensitivity;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_isAddable;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_sortedByHue;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v9 = 2654435761 * self->_supportsSlider;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v9 = 0;
LABEL_10:
  NSUInteger v10 = [(NSString *)self->_featureFlag hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_excludesDuotone;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v3 ^ v16 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  uint64_t v13 = [(NSMutableArray *)self->_exclusions hash];
  uint64_t v14 = v13 ^ [(NSMutableArray *)self->_migrations hash];
  return v12 ^ v14 ^ [(NSString *)self->_collectionOverride hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NTKProtoPigmentCollectionConfig setDefaultColorOptionName:](self, "setDefaultColorOptionName:");
  }
  if (*((void *)v4 + 6)) {
    -[NTKProtoPigmentCollectionConfig setFallbackDefaultColorOptionName:](self, "setFallbackDefaultColorOptionName:");
  }
  if (*((void *)v4 + 3)) {
    -[NTKProtoPigmentCollectionConfig setDefaultConfigAttributeName:](self, "setDefaultConfigAttributeName:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v5 = *((id *)v4 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTKProtoPigmentCollectionConfig *)self addDefaultGalleryColorNames:*(void *)(*((void *)&v29 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v7);
  }

  char v10 = *((unsigned char *)v4 + 80);
  if ((v10 & 4) != 0)
  {
    self->_sensitivity = *((unsigned char *)v4 + 74);
    *(unsigned char *)&self->_has |= 4u;
    char v10 = *((unsigned char *)v4 + 80);
    if ((v10 & 2) == 0)
    {
LABEL_16:
      if ((v10 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) == 0)
  {
    goto LABEL_16;
  }
  self->_isAddable = *((unsigned char *)v4 + 73);
  *(unsigned char *)&self->_has |= 2u;
  char v10 = *((unsigned char *)v4 + 80);
  if ((v10 & 8) == 0)
  {
LABEL_17:
    if ((v10 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_42:
  self->_sortedByHue = *((unsigned char *)v4 + 75);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 80) & 0x10) != 0)
  {
LABEL_18:
    self->_supportsSlider = *((unsigned char *)v4 + 76);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_19:
  if (*((void *)v4 + 7)) {
    -[NTKProtoPigmentCollectionConfig setFeatureFlag:](self, "setFeatureFlag:");
  }
  if (*((unsigned char *)v4 + 80))
  {
    self->_excludesDuotone = *((unsigned char *)v4 + 72);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v11 = *((id *)v4 + 5);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        [(NTKProtoPigmentCollectionConfig *)self addExclusions:*(void *)(*((void *)&v25 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v34 count:16];
    }
    while (v13);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v16 = *((id *)v4 + 8);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        -[NTKProtoPigmentCollectionConfig addMigration:](self, "addMigration:", *(void *)(*((void *)&v21 + 1) + 8 * k), (void)v21);
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v33 count:16];
    }
    while (v18);
  }

  if (*((void *)v4 + 1)) {
    -[NTKProtoPigmentCollectionConfig setCollectionOverride:](self, "setCollectionOverride:");
  }
}

- (NSString)defaultColorOptionName
{
  return self->_defaultColorOptionName;
}

- (void)setDefaultColorOptionName:(id)a3
{
}

- (NSString)fallbackDefaultColorOptionName
{
  return self->_fallbackDefaultColorOptionName;
}

- (void)setFallbackDefaultColorOptionName:(id)a3
{
}

- (NSString)defaultConfigAttributeName
{
  return self->_defaultConfigAttributeName;
}

- (void)setDefaultConfigAttributeName:(id)a3
{
}

- (NSMutableArray)defaultGalleryColorNames
{
  return self->_defaultGalleryColorNames;
}

- (void)setDefaultGalleryColorNames:(id)a3
{
}

- (BOOL)sensitivity
{
  return self->_sensitivity;
}

- (BOOL)isAddable
{
  return self->_isAddable;
}

- (BOOL)sortedByHue
{
  return self->_sortedByHue;
}

- (BOOL)supportsSlider
{
  return self->_supportsSlider;
}

- (NSString)featureFlag
{
  return self->_featureFlag;
}

- (void)setFeatureFlag:(id)a3
{
}

- (BOOL)excludesDuotone
{
  return self->_excludesDuotone;
}

- (NSMutableArray)exclusions
{
  return self->_exclusions;
}

- (void)setExclusions:(id)a3
{
}

- (NSMutableArray)migrations
{
  return self->_migrations;
}

- (void)setMigrations:(id)a3
{
}

- (NSString)collectionOverride
{
  return self->_collectionOverride;
}

- (void)setCollectionOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrations, 0);
  objc_storeStrong((id *)&self->_featureFlag, 0);
  objc_storeStrong((id *)&self->_fallbackDefaultColorOptionName, 0);
  objc_storeStrong((id *)&self->_exclusions, 0);
  objc_storeStrong((id *)&self->_defaultGalleryColorNames, 0);
  objc_storeStrong((id *)&self->_defaultConfigAttributeName, 0);
  objc_storeStrong((id *)&self->_defaultColorOptionName, 0);

  objc_storeStrong((id *)&self->_collectionOverride, 0);
}

@end