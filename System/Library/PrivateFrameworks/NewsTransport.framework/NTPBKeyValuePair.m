@interface NTPBKeyValuePair
- (BOOL)hasAppConfigurationResource;
- (BOOL)hasAsset;
- (BOOL)hasAudioPlaylistItem;
- (BOOL)hasAvAsset;
- (BOOL)hasAvAssetKey;
- (BOOL)hasCacheCoordinatorHintsValue;
- (BOOL)hasDataValue;
- (BOOL)hasDateValue;
- (BOOL)hasIssueReadingHistoryItem;
- (BOOL)hasKey;
- (BOOL)hasNetworkSessionList;
- (BOOL)hasPersonalizationLocalData;
- (BOOL)hasPrivateDataControllerSyncState;
- (BOOL)hasReadingHistoryItem;
- (BOOL)hasRecordData;
- (BOOL)hasStringValue;
- (BOOL)hasValueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)dataValue;
- (NSData)recordData;
- (NSString)key;
- (NSString)stringValue;
- (NTPBAVAsset)avAsset;
- (NTPBAVAssetKey)avAssetKey;
- (NTPBAppConfigurationResource)appConfigurationResource;
- (NTPBAsset)asset;
- (NTPBAudioPlaylistItem)audioPlaylistItem;
- (NTPBCacheCoordinatorHints)cacheCoordinatorHintsValue;
- (NTPBDate)dateValue;
- (NTPBIssueReadingHistoryItem)issueReadingHistoryItem;
- (NTPBNetworkSessionList)networkSessionList;
- (NTPBPersonalizationLocalData)personalizationLocalData;
- (NTPBPrivateDataControllerSyncState)privateDataControllerSyncState;
- (NTPBReadingHistoryItem)readingHistoryItem;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)valueType;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppConfigurationResource:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAudioPlaylistItem:(id)a3;
- (void)setAvAsset:(id)a3;
- (void)setAvAssetKey:(id)a3;
- (void)setCacheCoordinatorHintsValue:(id)a3;
- (void)setDataValue:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setHasValueType:(BOOL)a3;
- (void)setIssueReadingHistoryItem:(id)a3;
- (void)setKey:(id)a3;
- (void)setNetworkSessionList:(id)a3;
- (void)setPersonalizationLocalData:(id)a3;
- (void)setPrivateDataControllerSyncState:(id)a3;
- (void)setReadingHistoryItem:(id)a3;
- (void)setRecordData:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setValueType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBKeyValuePair

- (NSString)key
{
  return self->_key;
}

- (NSData)recordData
{
  return self->_recordData;
}

- (void)dealloc
{
  [(NTPBKeyValuePair *)self setKey:0];
  [(NTPBKeyValuePair *)self setDataValue:0];
  [(NTPBKeyValuePair *)self setStringValue:0];
  [(NTPBKeyValuePair *)self setDateValue:0];
  [(NTPBKeyValuePair *)self setCacheCoordinatorHintsValue:0];
  [(NTPBKeyValuePair *)self setRecordData:0];
  [(NTPBKeyValuePair *)self setReadingHistoryItem:0];
  [(NTPBKeyValuePair *)self setNetworkSessionList:0];
  [(NTPBKeyValuePair *)self setPersonalizationLocalData:0];
  [(NTPBKeyValuePair *)self setAppConfigurationResource:0];
  [(NTPBKeyValuePair *)self setPrivateDataControllerSyncState:0];
  [(NTPBKeyValuePair *)self setIssueReadingHistoryItem:0];
  [(NTPBKeyValuePair *)self setAsset:0];
  [(NTPBKeyValuePair *)self setAudioPlaylistItem:0];
  [(NTPBKeyValuePair *)self setAvAsset:0];
  [(NTPBKeyValuePair *)self setAvAssetKey:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBKeyValuePair;
  [(NTPBKeyValuePair *)&v3 dealloc];
}

- (void)setKey:(id)a3
{
}

- (void)setStringValue:(id)a3
{
}

- (void)setDateValue:(id)a3
{
}

- (void)setDataValue:(id)a3
{
}

- (void)setRecordData:(id)a3
{
}

- (void)setReadingHistoryItem:(id)a3
{
}

- (void)setPrivateDataControllerSyncState:(id)a3
{
}

- (void)setPersonalizationLocalData:(id)a3
{
}

- (void)setNetworkSessionList:(id)a3
{
}

- (void)setIssueReadingHistoryItem:(id)a3
{
}

- (void)setCacheCoordinatorHintsValue:(id)a3
{
}

- (void)setAvAssetKey:(id)a3
{
}

- (void)setAvAsset:(id)a3
{
}

- (void)setAudioPlaylistItem:(id)a3
{
}

- (void)setAsset:(id)a3
{
}

- (void)setAppConfigurationResource:(id)a3
{
}

- (int)valueType
{
  if (*(unsigned char *)&self->_has) {
    return self->_valueType;
  }
  else {
    return 0;
  }
}

- (NTPBAsset)asset
{
  return self->_asset;
}

- (NTPBCacheCoordinatorHints)cacheCoordinatorHintsValue
{
  return self->_cacheCoordinatorHintsValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (NSData)dataValue
{
  return self->_dataValue;
}

- (NTPBDate)dateValue
{
  return self->_dateValue;
}

- (void)setValueType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_valueType = a3;
}

- (NTPBNetworkSessionList)networkSessionList
{
  return self->_networkSessionList;
}

- (void)writeTo:(id)a3
{
  if (self->_key) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_dataValue) {
    PBDataWriterWriteDataField();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_dateValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_cacheCoordinatorHintsValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_recordData) {
    PBDataWriterWriteDataField();
  }
  if (self->_readingHistoryItem) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_networkSessionList) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_personalizationLocalData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appConfigurationResource) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_privateDataControllerSyncState) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueReadingHistoryItem) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_asset) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_audioPlaylistItem) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avAsset) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avAssetKey)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setHasValueType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValueType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDataValue
{
  return self->_dataValue != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (BOOL)hasCacheCoordinatorHintsValue
{
  return self->_cacheCoordinatorHintsValue != 0;
}

- (BOOL)hasRecordData
{
  return self->_recordData != 0;
}

- (BOOL)hasReadingHistoryItem
{
  return self->_readingHistoryItem != 0;
}

- (BOOL)hasNetworkSessionList
{
  return self->_networkSessionList != 0;
}

- (BOOL)hasPersonalizationLocalData
{
  return self->_personalizationLocalData != 0;
}

- (BOOL)hasAppConfigurationResource
{
  return self->_appConfigurationResource != 0;
}

- (BOOL)hasPrivateDataControllerSyncState
{
  return self->_privateDataControllerSyncState != 0;
}

- (BOOL)hasIssueReadingHistoryItem
{
  return self->_issueReadingHistoryItem != 0;
}

- (BOOL)hasAsset
{
  return self->_asset != 0;
}

- (BOOL)hasAudioPlaylistItem
{
  return self->_audioPlaylistItem != 0;
}

- (BOOL)hasAvAsset
{
  return self->_avAsset != 0;
}

- (BOOL)hasAvAssetKey
{
  return self->_avAssetKey != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBKeyValuePair;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBKeyValuePair description](&v3, sel_description), -[NTPBKeyValuePair dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_valueType), @"value_type");
  }
  dataValue = self->_dataValue;
  if (dataValue) {
    [v4 setObject:dataValue forKey:@"data_value"];
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    [v4 setObject:stringValue forKey:@"string_value"];
  }
  dateValue = self->_dateValue;
  if (dateValue) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](dateValue, "dictionaryRepresentation"), @"date_value");
  }
  cacheCoordinatorHintsValue = self->_cacheCoordinatorHintsValue;
  if (cacheCoordinatorHintsValue) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBCacheCoordinatorHints dictionaryRepresentation](cacheCoordinatorHintsValue, "dictionaryRepresentation"), @"cache_coordinator_hints_value");
  }
  recordData = self->_recordData;
  if (recordData) {
    [v4 setObject:recordData forKey:@"record_data"];
  }
  readingHistoryItem = self->_readingHistoryItem;
  if (readingHistoryItem) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBReadingHistoryItem dictionaryRepresentation](readingHistoryItem, "dictionaryRepresentation"), @"reading_history_item");
  }
  networkSessionList = self->_networkSessionList;
  if (networkSessionList) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBNetworkSessionList dictionaryRepresentation](networkSessionList, "dictionaryRepresentation"), @"network_session_list");
  }
  personalizationLocalData = self->_personalizationLocalData;
  if (personalizationLocalData) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBPersonalizationLocalData dictionaryRepresentation](personalizationLocalData, "dictionaryRepresentation"), @"personalization_local_data");
  }
  appConfigurationResource = self->_appConfigurationResource;
  if (appConfigurationResource) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBAppConfigurationResource dictionaryRepresentation](appConfigurationResource, "dictionaryRepresentation"), @"app_configuration_resource");
  }
  privateDataControllerSyncState = self->_privateDataControllerSyncState;
  if (privateDataControllerSyncState) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBPrivateDataControllerSyncState dictionaryRepresentation](privateDataControllerSyncState, "dictionaryRepresentation"), @"private_data_controller_sync_state");
  }
  issueReadingHistoryItem = self->_issueReadingHistoryItem;
  if (issueReadingHistoryItem) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBIssueReadingHistoryItem dictionaryRepresentation](issueReadingHistoryItem, "dictionaryRepresentation"), @"issue_reading_history_item");
  }
  asset = self->_asset;
  if (asset) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBAsset dictionaryRepresentation](asset, "dictionaryRepresentation"), @"asset");
  }
  audioPlaylistItem = self->_audioPlaylistItem;
  if (audioPlaylistItem) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBAudioPlaylistItem dictionaryRepresentation](audioPlaylistItem, "dictionaryRepresentation"), @"audio_playlist_item");
  }
  avAsset = self->_avAsset;
  if (avAsset) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBAVAsset dictionaryRepresentation](avAsset, "dictionaryRepresentation"), @"av_asset");
  }
  avAssetKey = self->_avAssetKey;
  if (avAssetKey) {
    objc_msgSend(v4, "setObject:forKey:", -[NTPBAVAssetKey dictionaryRepresentation](avAssetKey, "dictionaryRepresentation"), @"av_asset_key");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBKeyValuePairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 80) = [(NSString *)self->_key copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 136) = self->_valueType;
    *(unsigned char *)(v5 + 140) |= 1u;
  }

  *(void *)(v5 + 56) = [(NSData *)self->_dataValue copyWithZone:a3];
  *(void *)(v5 + 128) = [(NSString *)self->_stringValue copyWithZone:a3];

  *(void *)(v5 + 64) = [(NTPBDate *)self->_dateValue copyWithZone:a3];
  *(void *)(v5 + 48) = [(NTPBCacheCoordinatorHints *)self->_cacheCoordinatorHintsValue copyWithZone:a3];

  *(void *)(v5 + 120) = [(NSData *)self->_recordData copyWithZone:a3];
  *(void *)(v5 + 112) = [(NTPBReadingHistoryItem *)self->_readingHistoryItem copyWithZone:a3];

  *(void *)(v5 + 88) = [(NTPBNetworkSessionList *)self->_networkSessionList copyWithZone:a3];
  *(void *)(v5 + 96) = [(NTPBPersonalizationLocalData *)self->_personalizationLocalData copyWithZone:a3];

  *(void *)(v5 + 8) = [(NTPBAppConfigurationResource *)self->_appConfigurationResource copyWithZone:a3];
  *(void *)(v5 + 104) = [(NTPBPrivateDataControllerSyncState *)self->_privateDataControllerSyncState copyWithZone:a3];

  *(void *)(v5 + 72) = [(NTPBIssueReadingHistoryItem *)self->_issueReadingHistoryItem copyWithZone:a3];
  *(void *)(v5 + 16) = [(NTPBAsset *)self->_asset copyWithZone:a3];

  *(void *)(v5 + 24) = [(NTPBAudioPlaylistItem *)self->_audioPlaylistItem copyWithZone:a3];
  *(void *)(v5 + 32) = [(NTPBAVAsset *)self->_avAsset copyWithZone:a3];

  *(void *)(v5 + 40) = [(NTPBAVAssetKey *)self->_avAssetKey copyWithZone:a3];
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    key = self->_key;
    if (!((unint64_t)key | *((void *)a3 + 10)) || (int v5 = -[NSString isEqual:](key, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 140) & 1) == 0 || self->_valueType != *((_DWORD *)a3 + 34)) {
          goto LABEL_39;
        }
      }
      else if (*((unsigned char *)a3 + 140))
      {
LABEL_39:
        LOBYTE(v5) = 0;
        return v5;
      }
      dataValue = self->_dataValue;
      if (!((unint64_t)dataValue | *((void *)a3 + 7)) || (int v5 = -[NSData isEqual:](dataValue, "isEqual:")) != 0)
      {
        stringValue = self->_stringValue;
        if (!((unint64_t)stringValue | *((void *)a3 + 16))
          || (int v5 = -[NSString isEqual:](stringValue, "isEqual:")) != 0)
        {
          dateValue = self->_dateValue;
          if (!((unint64_t)dateValue | *((void *)a3 + 8))
            || (int v5 = -[NTPBDate isEqual:](dateValue, "isEqual:")) != 0)
          {
            cacheCoordinatorHintsValue = self->_cacheCoordinatorHintsValue;
            if (!((unint64_t)cacheCoordinatorHintsValue | *((void *)a3 + 6))
              || (int v5 = -[NTPBCacheCoordinatorHints isEqual:](cacheCoordinatorHintsValue, "isEqual:")) != 0)
            {
              recordData = self->_recordData;
              if (!((unint64_t)recordData | *((void *)a3 + 15))
                || (int v5 = -[NSData isEqual:](recordData, "isEqual:")) != 0)
              {
                readingHistoryItem = self->_readingHistoryItem;
                if (!((unint64_t)readingHistoryItem | *((void *)a3 + 14))
                  || (int v5 = -[NTPBReadingHistoryItem isEqual:](readingHistoryItem, "isEqual:")) != 0)
                {
                  networkSessionList = self->_networkSessionList;
                  if (!((unint64_t)networkSessionList | *((void *)a3 + 11))
                    || (int v5 = -[NTPBNetworkSessionList isEqual:](networkSessionList, "isEqual:")) != 0)
                  {
                    personalizationLocalData = self->_personalizationLocalData;
                    if (!((unint64_t)personalizationLocalData | *((void *)a3 + 12))
                      || (int v5 = -[NTPBPersonalizationLocalData isEqual:](personalizationLocalData, "isEqual:")) != 0)
                    {
                      appConfigurationResource = self->_appConfigurationResource;
                      if (!((unint64_t)appConfigurationResource | *((void *)a3 + 1))
                        || (int v5 = -[NTPBAppConfigurationResource isEqual:](appConfigurationResource, "isEqual:")) != 0)
                      {
                        privateDataControllerSyncState = self->_privateDataControllerSyncState;
                        if (!((unint64_t)privateDataControllerSyncState | *((void *)a3 + 13))
                          || (int v5 = -[NTPBPrivateDataControllerSyncState isEqual:](privateDataControllerSyncState, "isEqual:")) != 0)
                        {
                          issueReadingHistoryItem = self->_issueReadingHistoryItem;
                          if (!((unint64_t)issueReadingHistoryItem | *((void *)a3 + 9))
                            || (int v5 = -[NTPBIssueReadingHistoryItem isEqual:](issueReadingHistoryItem, "isEqual:")) != 0)
                          {
                            asset = self->_asset;
                            if (!((unint64_t)asset | *((void *)a3 + 2))
                              || (int v5 = -[NTPBAsset isEqual:](asset, "isEqual:")) != 0)
                            {
                              audioPlaylistItem = self->_audioPlaylistItem;
                              if (!((unint64_t)audioPlaylistItem | *((void *)a3 + 3))
                                || (int v5 = -[NTPBAudioPlaylistItem isEqual:](audioPlaylistItem, "isEqual:")) != 0)
                              {
                                avAsset = self->_avAsset;
                                if (!((unint64_t)avAsset | *((void *)a3 + 4))
                                  || (int v5 = -[NTPBAVAsset isEqual:](avAsset, "isEqual:")) != 0)
                                {
                                  avAssetKey = self->_avAssetKey;
                                  if ((unint64_t)avAssetKey | *((void *)a3 + 5))
                                  {
                                    LOBYTE(v5) = -[NTPBAVAssetKey isEqual:](avAssetKey, "isEqual:");
                                  }
                                  else
                                  {
                                    LOBYTE(v5) = 1;
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_valueType;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = v4 ^ v3;
  uint64_t v6 = [(NSData *)self->_dataValue hash];
  NSUInteger v7 = v5 ^ v6 ^ [(NSString *)self->_stringValue hash];
  unint64_t v8 = [(NTPBDate *)self->_dateValue hash];
  unint64_t v9 = v8 ^ [(NTPBCacheCoordinatorHints *)self->_cacheCoordinatorHintsValue hash];
  uint64_t v10 = v7 ^ v9 ^ [(NSData *)self->_recordData hash];
  unint64_t v11 = [(NTPBReadingHistoryItem *)self->_readingHistoryItem hash];
  unint64_t v12 = v11 ^ [(NTPBNetworkSessionList *)self->_networkSessionList hash];
  unint64_t v13 = v12 ^ [(NTPBPersonalizationLocalData *)self->_personalizationLocalData hash];
  unint64_t v14 = v10 ^ v13 ^ [(NTPBAppConfigurationResource *)self->_appConfigurationResource hash];
  unint64_t v15 = [(NTPBPrivateDataControllerSyncState *)self->_privateDataControllerSyncState hash];
  unint64_t v16 = v15 ^ [(NTPBIssueReadingHistoryItem *)self->_issueReadingHistoryItem hash];
  unint64_t v17 = v16 ^ [(NTPBAsset *)self->_asset hash];
  unint64_t v18 = v17 ^ [(NTPBAudioPlaylistItem *)self->_audioPlaylistItem hash];
  unint64_t v19 = v14 ^ v18 ^ [(NTPBAVAsset *)self->_avAsset hash];
  return v19 ^ [(NTPBAVAssetKey *)self->_avAssetKey hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 10)) {
    -[NTPBKeyValuePair setKey:](self, "setKey:");
  }
  if (*((unsigned char *)a3 + 140))
  {
    self->_valueType = *((_DWORD *)a3 + 34);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 7)) {
    -[NTPBKeyValuePair setDataValue:](self, "setDataValue:");
  }
  if (*((void *)a3 + 16)) {
    -[NTPBKeyValuePair setStringValue:](self, "setStringValue:");
  }
  dateValue = self->_dateValue;
  uint64_t v6 = *((void *)a3 + 8);
  if (dateValue)
  {
    if (v6) {
      -[NTPBDate mergeFrom:](dateValue, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBKeyValuePair setDateValue:](self, "setDateValue:");
  }
  cacheCoordinatorHintsValue = self->_cacheCoordinatorHintsValue;
  uint64_t v8 = *((void *)a3 + 6);
  if (cacheCoordinatorHintsValue)
  {
    if (v8) {
      -[NTPBCacheCoordinatorHints mergeFrom:](cacheCoordinatorHintsValue, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBKeyValuePair setCacheCoordinatorHintsValue:](self, "setCacheCoordinatorHintsValue:");
  }
  if (*((void *)a3 + 15)) {
    -[NTPBKeyValuePair setRecordData:](self, "setRecordData:");
  }
  readingHistoryItem = self->_readingHistoryItem;
  uint64_t v10 = *((void *)a3 + 14);
  if (readingHistoryItem)
  {
    if (v10) {
      -[NTPBReadingHistoryItem mergeFrom:](readingHistoryItem, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[NTPBKeyValuePair setReadingHistoryItem:](self, "setReadingHistoryItem:");
  }
  networkSessionList = self->_networkSessionList;
  uint64_t v12 = *((void *)a3 + 11);
  if (networkSessionList)
  {
    if (v12) {
      -[NTPBNetworkSessionList mergeFrom:](networkSessionList, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[NTPBKeyValuePair setNetworkSessionList:](self, "setNetworkSessionList:");
  }
  personalizationLocalData = self->_personalizationLocalData;
  uint64_t v14 = *((void *)a3 + 12);
  if (personalizationLocalData)
  {
    if (v14) {
      -[NTPBPersonalizationLocalData mergeFrom:](personalizationLocalData, "mergeFrom:");
    }
  }
  else if (v14)
  {
    -[NTPBKeyValuePair setPersonalizationLocalData:](self, "setPersonalizationLocalData:");
  }
  appConfigurationResource = self->_appConfigurationResource;
  uint64_t v16 = *((void *)a3 + 1);
  if (appConfigurationResource)
  {
    if (v16) {
      -[NTPBAppConfigurationResource mergeFrom:](appConfigurationResource, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[NTPBKeyValuePair setAppConfigurationResource:](self, "setAppConfigurationResource:");
  }
  privateDataControllerSyncState = self->_privateDataControllerSyncState;
  uint64_t v18 = *((void *)a3 + 13);
  if (privateDataControllerSyncState)
  {
    if (v18) {
      -[NTPBPrivateDataControllerSyncState mergeFrom:](privateDataControllerSyncState, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[NTPBKeyValuePair setPrivateDataControllerSyncState:](self, "setPrivateDataControllerSyncState:");
  }
  issueReadingHistoryItem = self->_issueReadingHistoryItem;
  uint64_t v20 = *((void *)a3 + 9);
  if (issueReadingHistoryItem)
  {
    if (v20) {
      -[NTPBIssueReadingHistoryItem mergeFrom:](issueReadingHistoryItem, "mergeFrom:");
    }
  }
  else if (v20)
  {
    -[NTPBKeyValuePair setIssueReadingHistoryItem:](self, "setIssueReadingHistoryItem:");
  }
  asset = self->_asset;
  uint64_t v22 = *((void *)a3 + 2);
  if (asset)
  {
    if (v22) {
      -[NTPBAsset mergeFrom:](asset, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[NTPBKeyValuePair setAsset:](self, "setAsset:");
  }
  audioPlaylistItem = self->_audioPlaylistItem;
  uint64_t v24 = *((void *)a3 + 3);
  if (audioPlaylistItem)
  {
    if (v24) {
      -[NTPBAudioPlaylistItem mergeFrom:](audioPlaylistItem, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[NTPBKeyValuePair setAudioPlaylistItem:](self, "setAudioPlaylistItem:");
  }
  avAsset = self->_avAsset;
  uint64_t v26 = *((void *)a3 + 4);
  if (avAsset)
  {
    if (v26) {
      -[NTPBAVAsset mergeFrom:](avAsset, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[NTPBKeyValuePair setAvAsset:](self, "setAvAsset:");
  }
  avAssetKey = self->_avAssetKey;
  uint64_t v28 = *((void *)a3 + 5);
  if (avAssetKey)
  {
    if (v28)
    {
      -[NTPBAVAssetKey mergeFrom:](avAssetKey, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[NTPBKeyValuePair setAvAssetKey:](self, "setAvAssetKey:");
  }
}

- (NTPBReadingHistoryItem)readingHistoryItem
{
  return self->_readingHistoryItem;
}

- (NTPBPersonalizationLocalData)personalizationLocalData
{
  return self->_personalizationLocalData;
}

- (NTPBAppConfigurationResource)appConfigurationResource
{
  return self->_appConfigurationResource;
}

- (NTPBPrivateDataControllerSyncState)privateDataControllerSyncState
{
  return self->_privateDataControllerSyncState;
}

- (NTPBIssueReadingHistoryItem)issueReadingHistoryItem
{
  return self->_issueReadingHistoryItem;
}

- (NTPBAudioPlaylistItem)audioPlaylistItem
{
  return self->_audioPlaylistItem;
}

- (NTPBAVAsset)avAsset
{
  return self->_avAsset;
}

- (NTPBAVAssetKey)avAssetKey
{
  return self->_avAssetKey;
}

@end