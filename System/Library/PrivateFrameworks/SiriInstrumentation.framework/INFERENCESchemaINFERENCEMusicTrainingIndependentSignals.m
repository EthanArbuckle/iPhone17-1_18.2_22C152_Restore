@interface INFERENCESchemaINFERENCEMusicTrainingIndependentSignals
- (BOOL)hasAppSelectionUses;
- (BOOL)hasClientDayOfWeek;
- (BOOL)hasCommonForegroundAppRecency;
- (BOOL)hasForegroundBundleRecencyS;
- (BOOL)hasIsClientDaylight;
- (BOOL)hasIsClientNavigating;
- (BOOL)hasIsClientWorkout;
- (BOOL)hasIsContentFree;
- (BOOL)hasIsMediaAlbumPresent;
- (BOOL)hasIsMediaArtistPresent;
- (BOOL)hasIsMediaGenrePresent;
- (BOOL)hasIsMediaMoodPresent;
- (BOOL)hasIsMediaNamePresent;
- (BOOL)hasIsMediaReleaseDatePresent;
- (BOOL)hasIsPireneRequest;
- (BOOL)hasIsUserRecognized;
- (BOOL)hasMediaParsecCategory;
- (BOOL)hasMediaType;
- (BOOL)hasModelVersion;
- (BOOL)hasNowPlayingLastBundleRecencyS;
- (BOOL)hasNowPlayingState;
- (BOOL)hasRawClientHourOfDay;
- (BOOL)hasRawLanguage;
- (BOOL)hasRawLocale;
- (BOOL)hasRawNowPlayingState;
- (BOOL)hasRawRegion;
- (BOOL)hasResolutionType;
- (BOOL)hasServerSearchResultsMediaType;
- (BOOL)hasSirikitResponseCode;
- (BOOL)isClientDaylight;
- (BOOL)isClientNavigating;
- (BOOL)isClientWorkout;
- (BOOL)isContentFree;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMediaAlbumPresent;
- (BOOL)isMediaArtistPresent;
- (BOOL)isMediaGenrePresent;
- (BOOL)isMediaMoodPresent;
- (BOOL)isMediaNamePresent;
- (BOOL)isMediaReleaseDatePresent;
- (BOOL)isPireneRequest;
- (BOOL)isUserRecognized;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEMusicTrainingIndependentSignals)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEMusicTrainingIndependentSignals)initWithJSON:(id)a3;
- (NSData)jsonData;
- (double)foregroundBundleRecencyS;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)appSelectionUses;
- (int)clientDayOfWeek;
- (int)commonForegroundAppRecency;
- (int)mediaParsecCategory;
- (int)mediaType;
- (int)nowPlayingLastBundleRecencyS;
- (int)nowPlayingState;
- (int)rawClientHourOfDay;
- (int)rawNowPlayingState;
- (int)resolutionType;
- (int)serverSearchResultsMediaType;
- (int)sirikitResponseCode;
- (int64_t)rawLanguage;
- (int64_t)rawLocale;
- (int64_t)rawRegion;
- (unint64_t)hash;
- (unsigned)modelVersion;
- (void)deleteAppSelectionUses;
- (void)deleteClientDayOfWeek;
- (void)deleteCommonForegroundAppRecency;
- (void)deleteForegroundBundleRecencyS;
- (void)deleteIsClientDaylight;
- (void)deleteIsClientNavigating;
- (void)deleteIsClientWorkout;
- (void)deleteIsContentFree;
- (void)deleteIsMediaAlbumPresent;
- (void)deleteIsMediaArtistPresent;
- (void)deleteIsMediaGenrePresent;
- (void)deleteIsMediaMoodPresent;
- (void)deleteIsMediaNamePresent;
- (void)deleteIsMediaReleaseDatePresent;
- (void)deleteIsPireneRequest;
- (void)deleteIsUserRecognized;
- (void)deleteMediaParsecCategory;
- (void)deleteMediaType;
- (void)deleteModelVersion;
- (void)deleteNowPlayingLastBundleRecencyS;
- (void)deleteNowPlayingState;
- (void)deleteRawClientHourOfDay;
- (void)deleteRawLanguage;
- (void)deleteRawLocale;
- (void)deleteRawNowPlayingState;
- (void)deleteRawRegion;
- (void)deleteResolutionType;
- (void)deleteServerSearchResultsMediaType;
- (void)deleteSirikitResponseCode;
- (void)setAppSelectionUses:(int)a3;
- (void)setClientDayOfWeek:(int)a3;
- (void)setCommonForegroundAppRecency:(int)a3;
- (void)setForegroundBundleRecencyS:(double)a3;
- (void)setHasAppSelectionUses:(BOOL)a3;
- (void)setHasClientDayOfWeek:(BOOL)a3;
- (void)setHasCommonForegroundAppRecency:(BOOL)a3;
- (void)setHasForegroundBundleRecencyS:(BOOL)a3;
- (void)setHasIsClientDaylight:(BOOL)a3;
- (void)setHasIsClientNavigating:(BOOL)a3;
- (void)setHasIsClientWorkout:(BOOL)a3;
- (void)setHasIsContentFree:(BOOL)a3;
- (void)setHasIsMediaAlbumPresent:(BOOL)a3;
- (void)setHasIsMediaArtistPresent:(BOOL)a3;
- (void)setHasIsMediaGenrePresent:(BOOL)a3;
- (void)setHasIsMediaMoodPresent:(BOOL)a3;
- (void)setHasIsMediaNamePresent:(BOOL)a3;
- (void)setHasIsMediaReleaseDatePresent:(BOOL)a3;
- (void)setHasIsPireneRequest:(BOOL)a3;
- (void)setHasIsUserRecognized:(BOOL)a3;
- (void)setHasMediaParsecCategory:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasModelVersion:(BOOL)a3;
- (void)setHasNowPlayingLastBundleRecencyS:(BOOL)a3;
- (void)setHasNowPlayingState:(BOOL)a3;
- (void)setHasRawClientHourOfDay:(BOOL)a3;
- (void)setHasRawLanguage:(BOOL)a3;
- (void)setHasRawLocale:(BOOL)a3;
- (void)setHasRawNowPlayingState:(BOOL)a3;
- (void)setHasRawRegion:(BOOL)a3;
- (void)setHasResolutionType:(BOOL)a3;
- (void)setHasServerSearchResultsMediaType:(BOOL)a3;
- (void)setHasSirikitResponseCode:(BOOL)a3;
- (void)setIsClientDaylight:(BOOL)a3;
- (void)setIsClientNavigating:(BOOL)a3;
- (void)setIsClientWorkout:(BOOL)a3;
- (void)setIsContentFree:(BOOL)a3;
- (void)setIsMediaAlbumPresent:(BOOL)a3;
- (void)setIsMediaArtistPresent:(BOOL)a3;
- (void)setIsMediaGenrePresent:(BOOL)a3;
- (void)setIsMediaMoodPresent:(BOOL)a3;
- (void)setIsMediaNamePresent:(BOOL)a3;
- (void)setIsMediaReleaseDatePresent:(BOOL)a3;
- (void)setIsPireneRequest:(BOOL)a3;
- (void)setIsUserRecognized:(BOOL)a3;
- (void)setMediaParsecCategory:(int)a3;
- (void)setMediaType:(int)a3;
- (void)setModelVersion:(unsigned int)a3;
- (void)setNowPlayingLastBundleRecencyS:(int)a3;
- (void)setNowPlayingState:(int)a3;
- (void)setRawClientHourOfDay:(int)a3;
- (void)setRawLanguage:(int64_t)a3;
- (void)setRawLocale:(int64_t)a3;
- (void)setRawNowPlayingState:(int)a3;
- (void)setRawRegion:(int64_t)a3;
- (void)setResolutionType:(int)a3;
- (void)setServerSearchResultsMediaType:(int)a3;
- (void)setSirikitResponseCode:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEMusicTrainingIndependentSignals

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)serverSearchResultsMediaType
{
  return self->_serverSearchResultsMediaType;
}

- (BOOL)isUserRecognized
{
  return self->_isUserRecognized;
}

- (BOOL)isContentFree
{
  return self->_isContentFree;
}

- (int)commonForegroundAppRecency
{
  return self->_commonForegroundAppRecency;
}

- (int)rawNowPlayingState
{
  return self->_rawNowPlayingState;
}

- (int)resolutionType
{
  return self->_resolutionType;
}

- (unsigned)modelVersion
{
  return self->_modelVersion;
}

- (int)appSelectionUses
{
  return self->_appSelectionUses;
}

- (int)sirikitResponseCode
{
  return self->_sirikitResponseCode;
}

- (int)mediaParsecCategory
{
  return self->_mediaParsecCategory;
}

- (double)foregroundBundleRecencyS
{
  return self->_foregroundBundleRecencyS;
}

- (BOOL)isPireneRequest
{
  return self->_isPireneRequest;
}

- (int)nowPlayingState
{
  return self->_nowPlayingState;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (BOOL)isClientWorkout
{
  return self->_isClientWorkout;
}

- (BOOL)isClientNavigating
{
  return self->_isClientNavigating;
}

- (BOOL)isClientDaylight
{
  return self->_isClientDaylight;
}

- (int64_t)rawRegion
{
  return self->_rawRegion;
}

- (int64_t)rawLocale
{
  return self->_rawLocale;
}

- (int64_t)rawLanguage
{
  return self->_rawLanguage;
}

- (int)nowPlayingLastBundleRecencyS
{
  return self->_nowPlayingLastBundleRecencyS;
}

- (BOOL)isMediaReleaseDatePresent
{
  return self->_isMediaReleaseDatePresent;
}

- (BOOL)isMediaNamePresent
{
  return self->_isMediaNamePresent;
}

- (BOOL)isMediaMoodPresent
{
  return self->_isMediaMoodPresent;
}

- (BOOL)isMediaGenrePresent
{
  return self->_isMediaGenrePresent;
}

- (BOOL)isMediaArtistPresent
{
  return self->_isMediaArtistPresent;
}

- (BOOL)isMediaAlbumPresent
{
  return self->_isMediaAlbumPresent;
}

- (int)rawClientHourOfDay
{
  return self->_rawClientHourOfDay;
}

- (int)clientDayOfWeek
{
  return self->_clientDayOfWeek;
}

- (INFERENCESchemaINFERENCEMusicTrainingIndependentSignals)initWithDictionary:(id)a3
{
  id v4 = a3;
  v63.receiver = self;
  v63.super_class = (Class)INFERENCESchemaINFERENCEMusicTrainingIndependentSignals;
  v5 = [(INFERENCESchemaINFERENCEMusicTrainingIndependentSignals *)&v63 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"clientDayOfWeek"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setClientDayOfWeek:](v5, "setClientDayOfWeek:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"rawClientHourOfDay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawClientHourOfDay:](v5, "setRawClientHourOfDay:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isMediaAlbumPresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaAlbumPresent:](v5, "setIsMediaAlbumPresent:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isMediaArtistPresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaArtistPresent:](v5, "setIsMediaArtistPresent:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isMediaGenrePresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaGenrePresent:](v5, "setIsMediaGenrePresent:", [v10 BOOLValue]);
    }
    v50 = v10;
    v11 = [v4 objectForKeyedSubscript:@"isMediaMoodPresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaMoodPresent:](v5, "setIsMediaMoodPresent:", [v11 BOOLValue]);
    }
    v12 = v9;
    v54 = v6;
    v13 = [v4 objectForKeyedSubscript:@"isMediaNamePresent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaNamePresent:](v5, "setIsMediaNamePresent:", [v13 BOOLValue]);
    }
    v14 = v8;
    v15 = [v4 objectForKeyedSubscript:@"isMediaReleaseDatePresent"];
    objc_opt_class();
    v62 = v15;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsMediaReleaseDatePresent:](v5, "setIsMediaReleaseDatePresent:", [v15 BOOLValue]);
    }
    v16 = v7;
    v17 = [v4 objectForKeyedSubscript:@"nowPlayingLastBundleRecencyS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setNowPlayingLastBundleRecencyS:](v5, "setNowPlayingLastBundleRecencyS:", [v17 intValue]);
    }
    v18 = [v4 objectForKeyedSubscript:@"rawLanguage"];
    objc_opt_class();
    v61 = v18;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawLanguage:](v5, "setRawLanguage:", [v18 longLongValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"rawLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawLocale:](v5, "setRawLocale:", [v19 longLongValue]);
    }
    v46 = v19;
    v20 = [v4 objectForKeyedSubscript:@"rawRegion"];
    objc_opt_class();
    v60 = v20;
    v53 = v16;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawRegion:](v5, "setRawRegion:", [v20 longLongValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"isClientDaylight"];
    objc_opt_class();
    v59 = v21;
    v52 = v14;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsClientDaylight:](v5, "setIsClientDaylight:", [v21 BOOLValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"isClientNavigating"];
    objc_opt_class();
    v58 = v22;
    v51 = v12;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsClientNavigating:](v5, "setIsClientNavigating:", [v22 BOOLValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"isClientWorkout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsClientWorkout:](v5, "setIsClientWorkout:", [v23 BOOLValue]);
    }
    v24 = [v4 objectForKeyedSubscript:@"mediaType"];
    objc_opt_class();
    v57 = v24;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setMediaType:](v5, "setMediaType:", [v24 intValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"nowPlayingState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setNowPlayingState:](v5, "setNowPlayingState:", [v25 intValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"isPireneRequest"];
    objc_opt_class();
    v56 = v26;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsPireneRequest:](v5, "setIsPireneRequest:", [v26 BOOLValue]);
    }
    v27 = [v4 objectForKeyedSubscript:@"foregroundBundleRecencyS"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v27 doubleValue];
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setForegroundBundleRecencyS:](v5, "setForegroundBundleRecencyS:");
    }
    v28 = [v4 objectForKeyedSubscript:@"mediaParsecCategory"];
    objc_opt_class();
    v55 = v28;
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setMediaParsecCategory:](v5, "setMediaParsecCategory:", [v28 intValue]);
    }
    v29 = [v4 objectForKeyedSubscript:@"sirikitResponseCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setSirikitResponseCode:](v5, "setSirikitResponseCode:", [v29 intValue]);
    }
    v49 = v11;
    v30 = [v4 objectForKeyedSubscript:@"appSelectionUses"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setAppSelectionUses:](v5, "setAppSelectionUses:", [v30 intValue]);
    }
    v48 = v13;
    v31 = [v4 objectForKeyedSubscript:@"modelVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setModelVersion:](v5, "setModelVersion:", [v31 unsignedIntValue]);
    }
    v41 = v31;
    v47 = v17;
    v32 = [v4 objectForKeyedSubscript:@"resolutionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setResolutionType:](v5, "setResolutionType:", [v32 intValue]);
    }
    v45 = v25;
    v33 = [v4 objectForKeyedSubscript:@"rawNowPlayingState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setRawNowPlayingState:](v5, "setRawNowPlayingState:", [v33 intValue]);
    }
    v44 = v27;
    v34 = [v4 objectForKeyedSubscript:@"commonForegroundAppRecency"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setCommonForegroundAppRecency:](v5, "setCommonForegroundAppRecency:", [v34 intValue]);
    }
    v42 = v30;
    v43 = v29;
    v35 = [v4 objectForKeyedSubscript:@"isContentFree"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsContentFree:](v5, "setIsContentFree:", [v35 BOOLValue]);
    }
    v36 = v23;
    v37 = [v4 objectForKeyedSubscript:@"isUserRecognized"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setIsUserRecognized:](v5, "setIsUserRecognized:", [v37 BOOLValue]);
    }
    v38 = [v4 objectForKeyedSubscript:@"serverSearchResultsMediaType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals setServerSearchResultsMediaType:](v5, "setServerSearchResultsMediaType:", [v38 intValue]);
    }
    v39 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEMusicTrainingIndependentSignals)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEMusicTrainingIndependentSignals *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEMusicTrainingIndependentSignals *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals appSelectionUses](self, "appSelectionUses"));
    [v3 setObject:v7 forKeyedSubscript:@"appSelectionUses"];

    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x2000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals clientDayOfWeek](self, "clientDayOfWeek"));
  [v3 setObject:v8 forKeyedSubscript:@"clientDayOfWeek"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  v9 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals commonForegroundAppRecency](self, "commonForegroundAppRecency"));
  [v3 setObject:v9 forKeyedSubscript:@"commonForegroundAppRecency"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  v10 = NSNumber;
  [(INFERENCESchemaINFERENCEMusicTrainingIndependentSignals *)self foregroundBundleRecencyS];
  v11 = objc_msgSend(v10, "numberWithDouble:");
  [v3 setObject:v11 forKeyedSubscript:@"foregroundBundleRecencyS"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isClientDaylight](self, "isClientDaylight"));
  [v3 setObject:v12 forKeyedSubscript:@"isClientDaylight"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isClientNavigating](self, "isClientNavigating"));
  [v3 setObject:v13 forKeyedSubscript:@"isClientNavigating"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isClientWorkout](self, "isClientWorkout"));
  [v3 setObject:v14 forKeyedSubscript:@"isClientWorkout"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isContentFree](self, "isContentFree"));
  [v3 setObject:v15 forKeyedSubscript:@"isContentFree"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaAlbumPresent](self, "isMediaAlbumPresent"));
  [v3 setObject:v16 forKeyedSubscript:@"isMediaAlbumPresent"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaArtistPresent](self, "isMediaArtistPresent"));
  [v3 setObject:v17 forKeyedSubscript:@"isMediaArtistPresent"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaGenrePresent](self, "isMediaGenrePresent"));
  [v3 setObject:v18 forKeyedSubscript:@"isMediaGenrePresent"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaMoodPresent](self, "isMediaMoodPresent"));
  [v3 setObject:v19 forKeyedSubscript:@"isMediaMoodPresent"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaNamePresent](self, "isMediaNamePresent"));
  [v3 setObject:v20 forKeyedSubscript:@"isMediaNamePresent"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isMediaReleaseDatePresent](self, "isMediaReleaseDatePresent"));
  [v3 setObject:v21 forKeyedSubscript:@"isMediaReleaseDatePresent"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isPireneRequest](self, "isPireneRequest"));
  [v3 setObject:v22 forKeyedSubscript:@"isPireneRequest"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  v23 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals isUserRecognized](self, "isUserRecognized"));
  [v3 setObject:v23 forKeyedSubscript:@"isUserRecognized"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  v24 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals mediaParsecCategory](self, "mediaParsecCategory"));
  [v3 setObject:v24 forKeyedSubscript:@"mediaParsecCategory"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  v25 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals mediaType](self, "mediaType"));
  [v3 setObject:v25 forKeyedSubscript:@"mediaType"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals modelVersion](self, "modelVersion"));
  [v3 setObject:v26 forKeyedSubscript:@"modelVersion"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  v27 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals nowPlayingLastBundleRecencyS](self, "nowPlayingLastBundleRecencyS"));
  [v3 setObject:v27 forKeyedSubscript:@"nowPlayingLastBundleRecencyS"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  v28 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals nowPlayingState](self, "nowPlayingState"));
  [v3 setObject:v28 forKeyedSubscript:@"nowPlayingState"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  v29 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals rawClientHourOfDay](self, "rawClientHourOfDay"));
  [v3 setObject:v29 forKeyedSubscript:@"rawClientHourOfDay"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  v30 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals rawLanguage](self, "rawLanguage"));
  [v3 setObject:v30 forKeyedSubscript:@"rawLanguage"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  v31 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals rawLocale](self, "rawLocale"));
  [v3 setObject:v31 forKeyedSubscript:@"rawLocale"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  v32 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals rawNowPlayingState](self, "rawNowPlayingState"));
  [v3 setObject:v32 forKeyedSubscript:@"rawNowPlayingState"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  v33 = objc_msgSend(NSNumber, "numberWithLongLong:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals rawRegion](self, "rawRegion"));
  [v3 setObject:v33 forKeyedSubscript:@"rawRegion"];

  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_64;
  }
LABEL_60:
  unsigned int v34 = [(INFERENCESchemaINFERENCEMusicTrainingIndependentSignals *)self resolutionType] - 1;
  if (v34 > 9) {
    v35 = @"INFERENCEAPPRESOLUTIONTYPE_UNKNOWN";
  }
  else {
    v35 = off_1E5EB0E78[v34];
  }
  [v3 setObject:v35 forKeyedSubscript:@"resolutionType"];
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_64:
  v36 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals serverSearchResultsMediaType](self, "serverSearchResultsMediaType"));
  [v3 setObject:v36 forKeyedSubscript:@"serverSearchResultsMediaType"];

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_30:
    v5 = objc_msgSend(NSNumber, "numberWithInt:", -[INFERENCESchemaINFERENCEMusicTrainingIndependentSignals sirikitResponseCode](self, "sirikitResponseCode"));
    [v3 setObject:v5 forKeyedSubscript:@"sirikitResponseCode"];
  }
LABEL_31:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if (*(unsigned char *)&has)
  {
    uint64_t v4 = 2654435761 * self->_clientDayOfWeek;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_rawClientHourOfDay;
      if ((*(unsigned char *)&has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_isMediaAlbumPresent;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_isMediaArtistPresent;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_isMediaGenrePresent;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_isMediaMoodPresent;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_isMediaNamePresent;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v11 = 2654435761 * self->_isMediaReleaseDatePresent;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v12 = 2654435761 * self->_nowPlayingLastBundleRecencyS;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v13 = 2654435761 * self->_rawLanguage;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    uint64_t v14 = 2654435761 * self->_rawLocale;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    uint64_t v15 = 2654435761 * self->_rawRegion;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v15 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v16 = 2654435761 * self->_isClientDaylight;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v16 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v17 = 2654435761 * self->_isClientNavigating;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v18 = 2654435761 * self->_isClientWorkout;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v52 = 2654435761 * self->_mediaType;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v52 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_18:
    uint64_t v51 = 2654435761 * self->_nowPlayingState;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_19;
    }
LABEL_41:
    uint64_t v50 = 0;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_20;
    }
LABEL_42:
    unint64_t v31 = 0;
    goto LABEL_45;
  }
LABEL_40:
  uint64_t v51 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0) {
    goto LABEL_41;
  }
LABEL_19:
  uint64_t v50 = 2654435761 * self->_isPireneRequest;
  if ((*(_DWORD *)&has & 0x40000) == 0) {
    goto LABEL_42;
  }
LABEL_20:
  uint64_t v43 = v18;
  uint64_t v44 = v17;
  uint64_t v45 = v16;
  uint64_t v46 = v15;
  uint64_t v47 = v14;
  uint64_t v48 = v13;
  uint64_t v49 = v12;
  uint64_t v19 = v11;
  uint64_t v20 = v10;
  uint64_t v21 = v9;
  uint64_t v22 = v8;
  uint64_t v23 = v7;
  uint64_t v24 = v6;
  uint64_t v25 = v5;
  uint64_t v26 = v4;
  double foregroundBundleRecencyS = self->_foregroundBundleRecencyS;
  double v28 = -foregroundBundleRecencyS;
  if (foregroundBundleRecencyS >= 0.0) {
    double v28 = self->_foregroundBundleRecencyS;
  }
  long double v29 = floor(v28 + 0.5);
  double v30 = (v28 - v29) * 1.84467441e19;
  unint64_t v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    uint64_t v4 = v26;
    uint64_t v5 = v25;
    uint64_t v6 = v24;
    uint64_t v7 = v23;
    uint64_t v8 = v22;
    uint64_t v9 = v21;
    uint64_t v10 = v20;
    uint64_t v11 = v19;
    uint64_t v13 = v48;
    uint64_t v12 = v49;
    uint64_t v15 = v46;
    uint64_t v14 = v47;
    uint64_t v17 = v44;
    uint64_t v16 = v45;
    uint64_t v18 = v43;
    if (v30 > 0.0) {
      v31 += (unint64_t)v30;
    }
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
    uint64_t v4 = v26;
    uint64_t v5 = v25;
    uint64_t v6 = v24;
    uint64_t v7 = v23;
    uint64_t v8 = v22;
    uint64_t v9 = v21;
    uint64_t v10 = v20;
    uint64_t v11 = v19;
    uint64_t v13 = v48;
    uint64_t v12 = v49;
    uint64_t v15 = v46;
    uint64_t v14 = v47;
    uint64_t v17 = v44;
    uint64_t v16 = v45;
    uint64_t v18 = v43;
  }
LABEL_45:
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    uint64_t v32 = 2654435761 * self->_mediaParsecCategory;
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
LABEL_47:
      uint64_t v33 = 2654435761 * self->_sirikitResponseCode;
      if ((*(_DWORD *)&has & 0x200000) != 0) {
        goto LABEL_48;
      }
      goto LABEL_58;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_47;
    }
  }
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_48:
    uint64_t v34 = 2654435761 * self->_appSelectionUses;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v34 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_49:
    uint64_t v35 = 2654435761 * self->_modelVersion;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_50:
    uint64_t v36 = 2654435761 * self->_resolutionType;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_51:
    uint64_t v37 = 2654435761 * self->_rawNowPlayingState;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_52:
    uint64_t v38 = 2654435761 * self->_commonForegroundAppRecency;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v38 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_53:
    uint64_t v39 = 2654435761 * self->_isContentFree;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_54;
    }
LABEL_64:
    uint64_t v40 = 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_55;
    }
LABEL_65:
    uint64_t v41 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v52 ^ v51 ^ v50 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41;
  }
LABEL_63:
  uint64_t v39 = 0;
  if ((*(_DWORD *)&has & 0x8000000) == 0) {
    goto LABEL_64;
  }
LABEL_54:
  uint64_t v40 = 2654435761 * self->_isUserRecognized;
  if ((*(_DWORD *)&has & 0x10000000) == 0) {
    goto LABEL_65;
  }
LABEL_55:
  uint64_t v41 = 2654435761 * self->_serverSearchResultsMediaType;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v52 ^ v51 ^ v50 ^ v31 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37 ^ v38 ^ v39 ^ v40 ^ v41;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_118;
  }
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  unsigned int v6 = v4[29];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_118;
  }
  if (*(unsigned char *)&has)
  {
    int clientDayOfWeek = self->_clientDayOfWeek;
    if (clientDayOfWeek != [v4 clientDayOfWeek]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_118;
  }
  if (v8)
  {
    int rawClientHourOfDay = self->_rawClientHourOfDay;
    if (rawClientHourOfDay != [v4 rawClientHourOfDay]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_118;
  }
  if (v10)
  {
    int isMediaAlbumPresent = self->_isMediaAlbumPresent;
    if (isMediaAlbumPresent != [v4 isMediaAlbumPresent]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_118;
  }
  if (v12)
  {
    int isMediaArtistPresent = self->_isMediaArtistPresent;
    if (isMediaArtistPresent != [v4 isMediaArtistPresent]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_118;
  }
  if (v14)
  {
    int isMediaGenrePresent = self->_isMediaGenrePresent;
    if (isMediaGenrePresent != [v4 isMediaGenrePresent]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_118;
  }
  if (v16)
  {
    int isMediaMoodPresent = self->_isMediaMoodPresent;
    if (isMediaMoodPresent != [v4 isMediaMoodPresent]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_118;
  }
  if (v18)
  {
    int isMediaNamePresent = self->_isMediaNamePresent;
    if (isMediaNamePresent != [v4 isMediaNamePresent]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_118;
  }
  if (v20)
  {
    int isMediaReleaseDatePresent = self->_isMediaReleaseDatePresent;
    if (isMediaReleaseDatePresent != [v4 isMediaReleaseDatePresent]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_118;
  }
  if (v22)
  {
    int nowPlayingLastBundleRecencyS = self->_nowPlayingLastBundleRecencyS;
    if (nowPlayingLastBundleRecencyS != [v4 nowPlayingLastBundleRecencyS]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_118;
  }
  if (v24)
  {
    int64_t rawLanguage = self->_rawLanguage;
    if (rawLanguage != [v4 rawLanguage]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1)) {
    goto LABEL_118;
  }
  if (v26)
  {
    int64_t rawLocale = self->_rawLocale;
    if (rawLocale != [v4 rawLocale]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1)) {
    goto LABEL_118;
  }
  if (v28)
  {
    int64_t rawRegion = self->_rawRegion;
    if (rawRegion != [v4 rawRegion]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1)) {
    goto LABEL_118;
  }
  if (v30)
  {
    int isClientDaylight = self->_isClientDaylight;
    if (isClientDaylight != [v4 isClientDaylight]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v32 = (*(unsigned int *)&has >> 13) & 1;
  if (v32 != ((v6 >> 13) & 1)) {
    goto LABEL_118;
  }
  if (v32)
  {
    int isClientNavigating = self->_isClientNavigating;
    if (isClientNavigating != [v4 isClientNavigating]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v34 = (*(unsigned int *)&has >> 14) & 1;
  if (v34 != ((v6 >> 14) & 1)) {
    goto LABEL_118;
  }
  if (v34)
  {
    int isClientWorkout = self->_isClientWorkout;
    if (isClientWorkout != [v4 isClientWorkout]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v36 = (*(unsigned int *)&has >> 15) & 1;
  if (v36 != ((v6 >> 15) & 1)) {
    goto LABEL_118;
  }
  if (v36)
  {
    int mediaType = self->_mediaType;
    if (mediaType != [v4 mediaType]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v38 = HIWORD(*(unsigned int *)&has) & 1;
  if (v38 != (HIWORD(v6) & 1)) {
    goto LABEL_118;
  }
  if (v38)
  {
    int nowPlayingState = self->_nowPlayingState;
    if (nowPlayingState != [v4 nowPlayingState]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v40 = (*(unsigned int *)&has >> 17) & 1;
  if (v40 != ((v6 >> 17) & 1)) {
    goto LABEL_118;
  }
  if (v40)
  {
    int isPireneRequest = self->_isPireneRequest;
    if (isPireneRequest != [v4 isPireneRequest]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v42 = (*(unsigned int *)&has >> 18) & 1;
  if (v42 != ((v6 >> 18) & 1)) {
    goto LABEL_118;
  }
  if (v42)
  {
    double foregroundBundleRecencyS = self->_foregroundBundleRecencyS;
    [v4 foregroundBundleRecencyS];
    if (foregroundBundleRecencyS != v44) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v45 = (*(unsigned int *)&has >> 19) & 1;
  if (v45 != ((v6 >> 19) & 1)) {
    goto LABEL_118;
  }
  if (v45)
  {
    int mediaParsecCategory = self->_mediaParsecCategory;
    if (mediaParsecCategory != [v4 mediaParsecCategory]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v47 = (*(unsigned int *)&has >> 20) & 1;
  if (v47 != ((v6 >> 20) & 1)) {
    goto LABEL_118;
  }
  if (v47)
  {
    int sirikitResponseCode = self->_sirikitResponseCode;
    if (sirikitResponseCode != [v4 sirikitResponseCode]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v49 = (*(unsigned int *)&has >> 21) & 1;
  if (v49 != ((v6 >> 21) & 1)) {
    goto LABEL_118;
  }
  if (v49)
  {
    int appSelectionUses = self->_appSelectionUses;
    if (appSelectionUses != [v4 appSelectionUses]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v51 = (*(unsigned int *)&has >> 22) & 1;
  if (v51 != ((v6 >> 22) & 1)) {
    goto LABEL_118;
  }
  if (v51)
  {
    unsigned int modelVersion = self->_modelVersion;
    if (modelVersion != [v4 modelVersion]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v53 = (*(unsigned int *)&has >> 23) & 1;
  if (v53 != ((v6 >> 23) & 1)) {
    goto LABEL_118;
  }
  if (v53)
  {
    int resolutionType = self->_resolutionType;
    if (resolutionType != [v4 resolutionType]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v55 = HIBYTE(*(unsigned int *)&has) & 1;
  if (v55 != (HIBYTE(v6) & 1)) {
    goto LABEL_118;
  }
  if (v55)
  {
    int rawNowPlayingState = self->_rawNowPlayingState;
    if (rawNowPlayingState != [v4 rawNowPlayingState]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v57 = (*(unsigned int *)&has >> 25) & 1;
  if (v57 != ((v6 >> 25) & 1)) {
    goto LABEL_118;
  }
  if (v57)
  {
    int commonForegroundAppRecency = self->_commonForegroundAppRecency;
    if (commonForegroundAppRecency != [v4 commonForegroundAppRecency]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v59 = (*(unsigned int *)&has >> 26) & 1;
  if (v59 != ((v6 >> 26) & 1)) {
    goto LABEL_118;
  }
  if (v59)
  {
    int isContentFree = self->_isContentFree;
    if (isContentFree != [v4 isContentFree]) {
      goto LABEL_118;
    }
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    unsigned int v6 = v4[29];
  }
  int v61 = (*(unsigned int *)&has >> 27) & 1;
  if (v61 != ((v6 >> 27) & 1)) {
    goto LABEL_118;
  }
  if (v61)
  {
    int isUserRecognized = self->_isUserRecognized;
    if (isUserRecognized == [v4 isUserRecognized])
    {
      $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
      unsigned int v6 = v4[29];
      goto LABEL_114;
    }
LABEL_118:
    BOOL v65 = 0;
    goto LABEL_119;
  }
LABEL_114:
  int v63 = (*(unsigned int *)&has >> 28) & 1;
  if (v63 != ((v6 >> 28) & 1)) {
    goto LABEL_118;
  }
  if (v63)
  {
    int serverSearchResultsMediaType = self->_serverSearchResultsMediaType;
    if (serverSearchResultsMediaType != [v4 serverSearchResultsMediaType]) {
      goto LABEL_118;
    }
  }
  BOOL v65 = 1;
LABEL_119:

  return v65;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteInt32Field();
    $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt64Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteInt64Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteInt64Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteDoubleField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt32Field();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  $E48A4E32ED9D7C9DCFF319009E3B9BE6 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0) {
LABEL_30:
  }
    PBDataWriterWriteInt32Field();
LABEL_31:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEMusicTrainingIndependentSignalsReadFrom(self, (uint64_t)a3);
}

- (void)deleteServerSearchResultsMediaType
{
  *(_DWORD *)&self->_has &= ~0x10000000u;
}

- (void)setHasServerSearchResultsMediaType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasServerSearchResultsMediaType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setServerSearchResultsMediaType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_int serverSearchResultsMediaType = a3;
}

- (void)deleteIsUserRecognized
{
  *(_DWORD *)&self->_has &= ~0x8000000u;
}

- (void)setHasIsUserRecognized:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsUserRecognized
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setIsUserRecognized:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_int isUserRecognized = a3;
}

- (void)deleteIsContentFree
{
  *(_DWORD *)&self->_has &= ~0x4000000u;
}

- (void)setHasIsContentFree:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsContentFree
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsContentFree:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_int isContentFree = a3;
}

- (void)deleteCommonForegroundAppRecency
{
  *(_DWORD *)&self->_has &= ~0x2000000u;
}

- (void)setHasCommonForegroundAppRecency:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasCommonForegroundAppRecency
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCommonForegroundAppRecency:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_int commonForegroundAppRecency = a3;
}

- (void)deleteRawNowPlayingState
{
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (void)setHasRawNowPlayingState:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasRawNowPlayingState
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setRawNowPlayingState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_int rawNowPlayingState = a3;
}

- (void)deleteResolutionType
{
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setHasResolutionType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasResolutionType
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setResolutionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_int resolutionType = a3;
}

- (void)deleteModelVersion
{
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setHasModelVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasModelVersion
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setModelVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_unsigned int modelVersion = a3;
}

- (void)deleteAppSelectionUses
{
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setHasAppSelectionUses:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasAppSelectionUses
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setAppSelectionUses:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_int appSelectionUses = a3;
}

- (void)deleteSirikitResponseCode
{
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setHasSirikitResponseCode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasSirikitResponseCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSirikitResponseCode:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_int sirikitResponseCode = a3;
}

- (void)deleteMediaParsecCategory
{
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setHasMediaParsecCategory:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasMediaParsecCategory
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMediaParsecCategory:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_int mediaParsecCategory = a3;
}

- (void)deleteForegroundBundleRecencyS
{
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setHasForegroundBundleRecencyS:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasForegroundBundleRecencyS
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setForegroundBundleRecencyS:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_double foregroundBundleRecencyS = a3;
}

- (void)deleteIsPireneRequest
{
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setHasIsPireneRequest:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsPireneRequest
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIsPireneRequest:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_int isPireneRequest = a3;
}

- (void)deleteNowPlayingState
{
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setHasNowPlayingState:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasNowPlayingState
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setNowPlayingState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_int nowPlayingState = a3;
}

- (void)deleteMediaType
{
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setHasMediaType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMediaType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMediaType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_int mediaType = a3;
}

- (void)deleteIsClientWorkout
{
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)setHasIsClientWorkout:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsClientWorkout
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsClientWorkout:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_int isClientWorkout = a3;
}

- (void)deleteIsClientNavigating
{
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setHasIsClientNavigating:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsClientNavigating
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsClientNavigating:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_int isClientNavigating = a3;
}

- (void)deleteIsClientDaylight
{
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setHasIsClientDaylight:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsClientDaylight
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIsClientDaylight:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_int isClientDaylight = a3;
}

- (void)deleteRawRegion
{
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setHasRawRegion:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRawRegion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRawRegion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_int64_t rawRegion = a3;
}

- (void)deleteRawLocale
{
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setHasRawLocale:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRawLocale
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRawLocale:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_int64_t rawLocale = a3;
}

- (void)deleteRawLanguage
{
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setHasRawLanguage:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRawLanguage
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRawLanguage:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_int64_t rawLanguage = a3;
}

- (void)deleteNowPlayingLastBundleRecencyS
{
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setHasNowPlayingLastBundleRecencyS:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasNowPlayingLastBundleRecencyS
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setNowPlayingLastBundleRecencyS:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_int nowPlayingLastBundleRecencyS = a3;
}

- (void)deleteIsMediaReleaseDatePresent
{
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setHasIsMediaReleaseDatePresent:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasIsMediaReleaseDatePresent
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setIsMediaReleaseDatePresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_int isMediaReleaseDatePresent = a3;
}

- (void)deleteIsMediaNamePresent
{
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setHasIsMediaNamePresent:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasIsMediaNamePresent
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsMediaNamePresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_int isMediaNamePresent = a3;
}

- (void)deleteIsMediaMoodPresent
{
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setHasIsMediaMoodPresent:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasIsMediaMoodPresent
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsMediaMoodPresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_int isMediaMoodPresent = a3;
}

- (void)deleteIsMediaGenrePresent
{
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setHasIsMediaGenrePresent:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasIsMediaGenrePresent
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsMediaGenrePresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_int isMediaGenrePresent = a3;
}

- (void)deleteIsMediaArtistPresent
{
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setHasIsMediaArtistPresent:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasIsMediaArtistPresent
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsMediaArtistPresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_int isMediaArtistPresent = a3;
}

- (void)deleteIsMediaAlbumPresent
{
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setHasIsMediaAlbumPresent:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasIsMediaAlbumPresent
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsMediaAlbumPresent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_int isMediaAlbumPresent = a3;
}

- (void)deleteRawClientHourOfDay
{
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setHasRawClientHourOfDay:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasRawClientHourOfDay
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRawClientHourOfDay:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_int rawClientHourOfDay = a3;
}

- (void)deleteClientDayOfWeek
{
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setHasClientDayOfWeek:(BOOL)a3
{
  self->_$E48A4E32ED9D7C9DCFF319009E3B9BE6 has = ($E48A4E32ED9D7C9DCFF319009E3B9BE6)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasClientDayOfWeek
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setClientDayOfWeek:(int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_int clientDayOfWeek = a3;
}

@end