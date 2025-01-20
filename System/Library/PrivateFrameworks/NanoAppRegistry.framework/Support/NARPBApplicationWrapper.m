@interface NARPBApplicationWrapper
+ (Class)appTagsType;
+ (Class)iTunesPlistKeysType;
+ (Class)iTunesPlistValuesType;
+ (Class)infoPlistLocalizationsType;
- (BOOL)hasAppState;
- (BOOL)hasLaunchServicesBundleType;
- (BOOL)hasSequenceNumber;
- (BOOL)hasSparsePlistData;
- (BOOL)hasSupportsForegroundApplication;
- (BOOL)hasSyncId;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsForegroundApplication;
- (NARPBApplicationStateWrapper)appState;
- (NSData)sparsePlistData;
- (NSMutableArray)appTags;
- (NSMutableArray)iTunesPlistKeys;
- (NSMutableArray)iTunesPlistValues;
- (NSMutableArray)infoPlistLocalizations;
- (NSString)description;
- (NSString)launchServicesBundleType;
- (NSString)objectIdentifier;
- (NSString)sequencer;
- (NSString)syncId;
- (id)appTagsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)iTunesPlistKeysAtIndex:(unint64_t)a3;
- (id)iTunesPlistValuesAtIndex:(unint64_t)a3;
- (id)infoPlistLocalizationsAtIndex:(unint64_t)a3;
- (int64_t)changeType;
- (unint64_t)appTagsCount;
- (unint64_t)hash;
- (unint64_t)iTunesPlistKeysCount;
- (unint64_t)iTunesPlistValuesCount;
- (unint64_t)infoPlistLocalizationsCount;
- (unsigned)sequenceNumber;
- (unsigned)version;
- (void)addAppTags:(id)a3;
- (void)addITunesPlistKeys:(id)a3;
- (void)addITunesPlistValues:(id)a3;
- (void)addInfoPlistLocalizations:(id)a3;
- (void)clearAppTags;
- (void)clearITunesPlistKeys;
- (void)clearITunesPlistValues;
- (void)clearInfoPlistLocalizations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppState:(id)a3;
- (void)setAppTags:(id)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setHasSupportsForegroundApplication:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setITunesPlistKeys:(id)a3;
- (void)setITunesPlistValues:(id)a3;
- (void)setInfoPlistLocalizations:(id)a3;
- (void)setLaunchServicesBundleType:(id)a3;
- (void)setSequenceNumber:(unsigned int)a3;
- (void)setSparsePlistData:(id)a3;
- (void)setSupportsForegroundApplication:(BOOL)a3;
- (void)setSyncId:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NARPBApplicationWrapper

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSyncId
{
  return self->_syncId != 0;
}

- (BOOL)hasSparsePlistData
{
  return self->_sparsePlistData != 0;
}

- (void)clearInfoPlistLocalizations
{
}

- (void)addInfoPlistLocalizations:(id)a3
{
  id v4 = a3;
  infoPlistLocalizations = self->_infoPlistLocalizations;
  id v8 = v4;
  if (!infoPlistLocalizations)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_infoPlistLocalizations;
    self->_infoPlistLocalizations = v6;

    id v4 = v8;
    infoPlistLocalizations = self->_infoPlistLocalizations;
  }
  [(NSMutableArray *)infoPlistLocalizations addObject:v4];
}

- (unint64_t)infoPlistLocalizationsCount
{
  return (unint64_t)[(NSMutableArray *)self->_infoPlistLocalizations count];
}

- (id)infoPlistLocalizationsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_infoPlistLocalizations objectAtIndex:a3];
}

+ (Class)infoPlistLocalizationsType
{
  return (Class)objc_opt_class();
}

- (void)clearITunesPlistKeys
{
}

- (void)addITunesPlistKeys:(id)a3
{
  id v4 = a3;
  iTunesPlistKeys = self->_iTunesPlistKeys;
  id v8 = v4;
  if (!iTunesPlistKeys)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_iTunesPlistKeys;
    self->_iTunesPlistKeys = v6;

    id v4 = v8;
    iTunesPlistKeys = self->_iTunesPlistKeys;
  }
  [(NSMutableArray *)iTunesPlistKeys addObject:v4];
}

- (unint64_t)iTunesPlistKeysCount
{
  return (unint64_t)[(NSMutableArray *)self->_iTunesPlistKeys count];
}

- (id)iTunesPlistKeysAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_iTunesPlistKeys objectAtIndex:a3];
}

+ (Class)iTunesPlistKeysType
{
  return (Class)objc_opt_class();
}

- (void)clearITunesPlistValues
{
}

- (void)addITunesPlistValues:(id)a3
{
  id v4 = a3;
  iTunesPlistValues = self->_iTunesPlistValues;
  id v8 = v4;
  if (!iTunesPlistValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_iTunesPlistValues;
    self->_iTunesPlistValues = v6;

    id v4 = v8;
    iTunesPlistValues = self->_iTunesPlistValues;
  }
  [(NSMutableArray *)iTunesPlistValues addObject:v4];
}

- (unint64_t)iTunesPlistValuesCount
{
  return (unint64_t)[(NSMutableArray *)self->_iTunesPlistValues count];
}

- (id)iTunesPlistValuesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_iTunesPlistValues objectAtIndex:a3];
}

+ (Class)iTunesPlistValuesType
{
  return (Class)objc_opt_class();
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequenceNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasLaunchServicesBundleType
{
  return self->_launchServicesBundleType != 0;
}

- (BOOL)hasAppState
{
  return self->_appState != 0;
}

- (void)clearAppTags
{
}

- (void)addAppTags:(id)a3
{
  id v4 = a3;
  appTags = self->_appTags;
  id v8 = v4;
  if (!appTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_appTags;
    self->_appTags = v6;

    id v4 = v8;
    appTags = self->_appTags;
  }
  [(NSMutableArray *)appTags addObject:v4];
}

- (unint64_t)appTagsCount
{
  return (unint64_t)[(NSMutableArray *)self->_appTags count];
}

- (id)appTagsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_appTags objectAtIndex:a3];
}

+ (Class)appTagsType
{
  return (Class)objc_opt_class();
}

- (void)setSupportsForegroundApplication:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportsForegroundApplication = a3;
}

- (void)setHasSupportsForegroundApplication:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsForegroundApplication
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)NARPBApplicationWrapper;
  char v3 = [(NARPBApplicationWrapper *)&v7 description];
  id v4 = [(NARPBApplicationWrapper *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSString *)v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = +[NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  syncId = self->_syncId;
  if (syncId) {
    [v3 setObject:syncId forKey:@"syncId"];
  }
  sparsePlistData = self->_sparsePlistData;
  if (sparsePlistData) {
    [v3 setObject:sparsePlistData forKey:@"sparsePlistData"];
  }
  if ([(NSMutableArray *)self->_infoPlistLocalizations count])
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_infoPlistLocalizations, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = self->_infoPlistLocalizations;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"infoPlistLocalizations"];
  }
  iTunesPlistKeys = self->_iTunesPlistKeys;
  if (iTunesPlistKeys) {
    [v3 setObject:iTunesPlistKeys forKey:@"iTunesPlistKeys"];
  }
  iTunesPlistValues = self->_iTunesPlistValues;
  if (iTunesPlistValues) {
    [v3 setObject:iTunesPlistValues forKey:@"iTunesPlistValues"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v16 = +[NSNumber numberWithUnsignedInt:self->_sequenceNumber];
    [v3 setObject:v16 forKey:@"sequenceNumber"];
  }
  launchServicesBundleType = self->_launchServicesBundleType;
  if (launchServicesBundleType) {
    [v3 setObject:launchServicesBundleType forKey:@"launchServicesBundleType"];
  }
  appState = self->_appState;
  if (appState)
  {
    v19 = [(NARPBApplicationStateWrapper *)appState dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"appState"];
  }
  appTags = self->_appTags;
  if (appTags) {
    [v3 setObject:appTags forKey:@"appTags"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v21 = +[NSNumber numberWithBool:self->_supportsForegroundApplication];
    [v3 setObject:v21 forKey:@"supportsForegroundApplication"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000D550((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_syncId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sparsePlistData) {
    PBDataWriterWriteDataField();
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v5 = self->_infoPlistLocalizations;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v38;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v38 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v7);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = self->_iTunesPlistKeys;
  uint64_t v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v12);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v15 = self->_iTunesPlistValues;
  v16 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
  if (v16)
  {
    v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      v17 = (char *)[(NSMutableArray *)v15 countByEnumeratingWithState:&v29 objects:v42 count:16];
    }
    while (v17);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_launchServicesBundleType) {
    PBDataWriterWriteStringField();
  }
  if (self->_appState) {
    PBDataWriterWriteSubmessage();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_appTags;
  v21 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
  if (v21)
  {
    v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      long long v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      v22 = (char *)[(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v41 count:16];
    }
    while (v22);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[20] = self->_version;
    *((unsigned char *)v4 + 88) |= 2u;
  }
  id v21 = v4;
  if (self->_syncId) {
    objc_msgSend(v4, "setSyncId:");
  }
  if (self->_sparsePlistData) {
    objc_msgSend(v21, "setSparsePlistData:");
  }
  if ([(NARPBApplicationWrapper *)self infoPlistLocalizationsCount])
  {
    [v21 clearInfoPlistLocalizations];
    unint64_t v5 = [(NARPBApplicationWrapper *)self infoPlistLocalizationsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(NARPBApplicationWrapper *)self infoPlistLocalizationsAtIndex:i];
        [v21 addInfoPlistLocalizations:v8];
      }
    }
  }
  if ([(NARPBApplicationWrapper *)self iTunesPlistKeysCount])
  {
    [v21 clearITunesPlistKeys];
    unint64_t v9 = [(NARPBApplicationWrapper *)self iTunesPlistKeysCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        v12 = [(NARPBApplicationWrapper *)self iTunesPlistKeysAtIndex:j];
        [v21 addITunesPlistKeys:v12];
      }
    }
  }
  if ([(NARPBApplicationWrapper *)self iTunesPlistValuesCount])
  {
    [v21 clearITunesPlistValues];
    unint64_t v13 = [(NARPBApplicationWrapper *)self iTunesPlistValuesCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        v16 = [(NARPBApplicationWrapper *)self iTunesPlistValuesAtIndex:k];
        [v21 addITunesPlistValues:v16];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v21 + 14) = self->_sequenceNumber;
    *((unsigned char *)v21 + 88) |= 1u;
  }
  if (self->_launchServicesBundleType) {
    objc_msgSend(v21, "setLaunchServicesBundleType:");
  }
  if (self->_appState) {
    objc_msgSend(v21, "setAppState:");
  }
  if ([(NARPBApplicationWrapper *)self appTagsCount])
  {
    [v21 clearAppTags];
    unint64_t v17 = [(NARPBApplicationWrapper *)self appTagsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
      {
        v20 = [(NARPBApplicationWrapper *)self appTagsAtIndex:m];
        [v21 addAppTags:v20];
      }
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v21 + 84) = self->_supportsForegroundApplication;
    *((unsigned char *)v21 + 88) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[20] = self->_version;
    *((unsigned char *)v5 + 88) |= 2u;
  }
  id v7 = [(NSString *)self->_syncId copyWithZone:a3];
  uint64_t v8 = (void *)v6[9];
  v6[9] = v7;

  id v9 = [(NSData *)self->_sparsePlistData copyWithZone:a3];
  unint64_t v10 = (void *)v6[8];
  v6[8] = v9;

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v11 = self->_infoPlistLocalizations;
  id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v52 objects:v59 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v53;
    do
    {
      v15 = 0;
      do
      {
        if (*(void *)v53 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = [*(id *)(*((void *)&v52 + 1) + 8 * (void)v15) copyWithZone:a3];
        [v6 addInfoPlistLocalizations:v16];

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v52 objects:v59 count:16];
    }
    while (v13);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  unint64_t v17 = self->_iTunesPlistKeys;
  id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v49;
    do
    {
      id v21 = 0;
      do
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [*(id *)(*((void *)&v48 + 1) + 8 * (void)v21) copyWithZone:a3];
        [v6 addITunesPlistKeys:v22];

        id v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v48 objects:v58 count:16];
    }
    while (v19);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v23 = self->_iTunesPlistValues;
  id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v44 objects:v57 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v45;
    do
    {
      long long v27 = 0;
      do
      {
        if (*(void *)v45 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = [*(id *)(*((void *)&v44 + 1) + 8 * (void)v27) copyWithZone:a3];
        [v6 addITunesPlistValues:v28];

        long long v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v44 objects:v57 count:16];
    }
    while (v25);
  }

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v6 + 14) = self->_sequenceNumber;
    *((unsigned char *)v6 + 88) |= 1u;
  }
  id v29 = [(NSString *)self->_launchServicesBundleType copyWithZone:a3];
  long long v30 = (void *)v6[6];
  v6[6] = v29;

  id v31 = [(NARPBApplicationStateWrapper *)self->_appState copyWithZone:a3];
  long long v32 = (void *)v6[1];
  v6[1] = v31;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v33 = self->_appTags;
  id v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v56 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v41;
    do
    {
      long long v37 = 0;
      do
      {
        if (*(void *)v41 != v36) {
          objc_enumerationMutation(v33);
        }
        id v38 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * (void)v37), "copyWithZone:", a3, (void)v40);
        [v6 addAppTags:v38];

        long long v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      id v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v40 objects:v56 count:16];
    }
    while (v35);
  }

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((unsigned char *)v6 + 84) = self->_supportsForegroundApplication;
    *((unsigned char *)v6 + 88) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_version != *((_DWORD *)v4 + 20)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_30;
  }
  syncId = self->_syncId;
  if ((unint64_t)syncId | *((void *)v4 + 9) && !-[NSString isEqual:](syncId, "isEqual:")) {
    goto LABEL_30;
  }
  sparsePlistData = self->_sparsePlistData;
  if ((unint64_t)sparsePlistData | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](sparsePlistData, "isEqual:")) {
      goto LABEL_30;
    }
  }
  infoPlistLocalizations = self->_infoPlistLocalizations;
  if ((unint64_t)infoPlistLocalizations | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](infoPlistLocalizations, "isEqual:")) {
      goto LABEL_30;
    }
  }
  iTunesPlistKeys = self->_iTunesPlistKeys;
  if ((unint64_t)iTunesPlistKeys | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](iTunesPlistKeys, "isEqual:")) {
      goto LABEL_30;
    }
  }
  iTunesPlistValues = self->_iTunesPlistValues;
  if ((unint64_t)iTunesPlistValues | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](iTunesPlistValues, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 14)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_30;
  }
  launchServicesBundleType = self->_launchServicesBundleType;
  if ((unint64_t)launchServicesBundleType | *((void *)v4 + 6)
    && !-[NSString isEqual:](launchServicesBundleType, "isEqual:"))
  {
    goto LABEL_30;
  }
  appState = self->_appState;
  if ((unint64_t)appState | *((void *)v4 + 1))
  {
    if (!-[NARPBApplicationStateWrapper isEqual:](appState, "isEqual:")) {
      goto LABEL_30;
    }
  }
  appTags = self->_appTags;
  if ((unint64_t)appTags | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](appTags, "isEqual:")) {
      goto LABEL_30;
    }
  }
  BOOL v13 = (*((unsigned char *)v4 + 88) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 4) == 0)
    {
LABEL_30:
      BOOL v13 = 0;
      goto LABEL_31;
    }
    if (self->_supportsForegroundApplication)
    {
      if (!*((unsigned char *)v4 + 84)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)v4 + 84))
    {
      goto LABEL_30;
    }
    BOOL v13 = 1;
  }
LABEL_31:

  return v13;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v14 = 2654435761 * self->_version;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_syncId hash];
  unint64_t v3 = (unint64_t)[(NSData *)self->_sparsePlistData hash];
  unint64_t v4 = (unint64_t)[(NSMutableArray *)self->_infoPlistLocalizations hash];
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_iTunesPlistKeys hash];
  unint64_t v6 = (unint64_t)[(NSMutableArray *)self->_iTunesPlistValues hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_sequenceNumber;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_launchServicesBundleType hash];
  unint64_t v9 = [(NARPBApplicationStateWrapper *)self->_appState hash];
  unint64_t v10 = (unint64_t)[(NSMutableArray *)self->_appTags hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_supportsForegroundApplication;
  }
  else {
    uint64_t v11 = 0;
  }
  return v13 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if ((v4[22] & 2) != 0)
  {
    self->_version = v4[20];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 9)) {
    -[NARPBApplicationWrapper setSyncId:](self, "setSyncId:");
  }
  if (*((void *)v5 + 8)) {
    -[NARPBApplicationWrapper setSparsePlistData:](self, "setSparsePlistData:");
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = *((id *)v5 + 5);
  id v7 = [v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NARPBApplicationWrapper *)self addInfoPlistLocalizations:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v8);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = *((id *)v5 + 3);
  id v12 = [v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v13; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v11);
        }
        [(NARPBApplicationWrapper *)self addITunesPlistKeys:*(void *)(*((void *)&v36 + 1) + 8 * (void)j)];
      }
      id v13 = [v11 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v13);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = *((id *)v5 + 4);
  id v17 = [v16 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v18; uint64_t k = (char *)k + 1)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        [(NARPBApplicationWrapper *)self addITunesPlistValues:*(void *)(*((void *)&v32 + 1) + 8 * (void)k)];
      }
      id v18 = [v16 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v18);
  }

  if (*((unsigned char *)v5 + 88))
  {
    self->_sequenceNumber = *((_DWORD *)v5 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 6)) {
    -[NARPBApplicationWrapper setLaunchServicesBundleType:](self, "setLaunchServicesBundleType:");
  }
  appState = self->_appState;
  uint64_t v22 = *((void *)v5 + 1);
  if (appState)
  {
    if (v22) {
      -[NARPBApplicationStateWrapper mergeFrom:](appState, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[NARPBApplicationWrapper setAppState:](self, "setAppState:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v23 = *((id *)v5 + 2);
  id v24 = [v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t m = 0; m != v25; uint64_t m = (char *)m + 1)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v23);
        }
        -[NARPBApplicationWrapper addAppTags:](self, "addAppTags:", *(void *)(*((void *)&v28 + 1) + 8 * (void)m), (void)v28);
      }
      id v25 = [v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
    }
    while (v25);
  }

  if ((*((unsigned char *)v5 + 88) & 4) != 0)
  {
    self->_supportsForegroundApplication = *((unsigned char *)v5 + 84);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)syncId
{
  return self->_syncId;
}

- (void)setSyncId:(id)a3
{
}

- (NSData)sparsePlistData
{
  return self->_sparsePlistData;
}

- (void)setSparsePlistData:(id)a3
{
}

- (NSMutableArray)infoPlistLocalizations
{
  return self->_infoPlistLocalizations;
}

- (void)setInfoPlistLocalizations:(id)a3
{
}

- (NSMutableArray)iTunesPlistKeys
{
  return self->_iTunesPlistKeys;
}

- (void)setITunesPlistKeys:(id)a3
{
}

- (NSMutableArray)iTunesPlistValues
{
  return self->_iTunesPlistValues;
}

- (void)setITunesPlistValues:(id)a3
{
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (NSString)launchServicesBundleType
{
  return self->_launchServicesBundleType;
}

- (void)setLaunchServicesBundleType:(id)a3
{
}

- (NARPBApplicationStateWrapper)appState
{
  return self->_appState;
}

- (void)setAppState:(id)a3
{
}

- (NSMutableArray)appTags
{
  return self->_appTags;
}

- (void)setAppTags:(id)a3
{
}

- (BOOL)supportsForegroundApplication
{
  return self->_supportsForegroundApplication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncId, 0);
  objc_storeStrong((id *)&self->_sparsePlistData, 0);
  objc_storeStrong((id *)&self->_launchServicesBundleType, 0);
  objc_storeStrong((id *)&self->_infoPlistLocalizations, 0);
  objc_storeStrong((id *)&self->_iTunesPlistValues, 0);
  objc_storeStrong((id *)&self->_iTunesPlistKeys, 0);
  objc_storeStrong((id *)&self->_appTags, 0);

  objc_storeStrong((id *)&self->_appState, 0);
}

- (NSString)objectIdentifier
{
  return [(NARPBApplicationWrapper *)self syncId];
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  return 1;
}

@end