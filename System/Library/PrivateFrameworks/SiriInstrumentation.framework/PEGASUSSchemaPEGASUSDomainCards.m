@interface PEGASUSSchemaPEGASUSDomainCards
- (BOOL)hasAmpMusicCount;
- (BOOL)hasAmpVideoCount;
- (BOOL)hasAppsCount;
- (BOOL)hasClockCount;
- (BOOL)hasConversionsCount;
- (BOOL)hasDictionaryCount;
- (BOOL)hasEdutainmentCount;
- (BOOL)hasFlightsCount;
- (BOOL)hasKgCount;
- (BOOL)hasKgcnCount;
- (BOOL)hasMapsCount;
- (BOOL)hasMathCount;
- (BOOL)hasMediaCount;
- (BOOL)hasMoviesCount;
- (BOOL)hasNewsCount;
- (BOOL)hasPrecomputedWebanswersCount;
- (BOOL)hasSportsCount;
- (BOOL)hasStocksCount;
- (BOOL)hasTvCount;
- (BOOL)hasVideoCount;
- (BOOL)hasWeatherCount;
- (BOOL)hasWebCount;
- (BOOL)hasWebImagesCount;
- (BOOL)hasWebVideoCount;
- (BOOL)hasWritingsCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSDomainCards)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSDomainCards)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)ampMusicCount;
- (unsigned)ampVideoCount;
- (unsigned)appsCount;
- (unsigned)clockCount;
- (unsigned)conversionsCount;
- (unsigned)dictionaryCount;
- (unsigned)edutainmentCount;
- (unsigned)flightsCount;
- (unsigned)kgCount;
- (unsigned)kgcnCount;
- (unsigned)mapsCount;
- (unsigned)mathCount;
- (unsigned)mediaCount;
- (unsigned)moviesCount;
- (unsigned)newsCount;
- (unsigned)precomputedWebanswersCount;
- (unsigned)sportsCount;
- (unsigned)stocksCount;
- (unsigned)tvCount;
- (unsigned)videoCount;
- (unsigned)weatherCount;
- (unsigned)webCount;
- (unsigned)webImagesCount;
- (unsigned)webVideoCount;
- (unsigned)writingsCount;
- (void)deleteAmpMusicCount;
- (void)deleteAmpVideoCount;
- (void)deleteAppsCount;
- (void)deleteClockCount;
- (void)deleteConversionsCount;
- (void)deleteDictionaryCount;
- (void)deleteEdutainmentCount;
- (void)deleteFlightsCount;
- (void)deleteKgCount;
- (void)deleteKgcnCount;
- (void)deleteMapsCount;
- (void)deleteMathCount;
- (void)deleteMediaCount;
- (void)deleteMoviesCount;
- (void)deleteNewsCount;
- (void)deletePrecomputedWebanswersCount;
- (void)deleteSportsCount;
- (void)deleteStocksCount;
- (void)deleteTvCount;
- (void)deleteVideoCount;
- (void)deleteWeatherCount;
- (void)deleteWebCount;
- (void)deleteWebImagesCount;
- (void)deleteWebVideoCount;
- (void)deleteWritingsCount;
- (void)setAmpMusicCount:(unsigned int)a3;
- (void)setAmpVideoCount:(unsigned int)a3;
- (void)setAppsCount:(unsigned int)a3;
- (void)setClockCount:(unsigned int)a3;
- (void)setConversionsCount:(unsigned int)a3;
- (void)setDictionaryCount:(unsigned int)a3;
- (void)setEdutainmentCount:(unsigned int)a3;
- (void)setFlightsCount:(unsigned int)a3;
- (void)setHasAmpMusicCount:(BOOL)a3;
- (void)setHasAmpVideoCount:(BOOL)a3;
- (void)setHasAppsCount:(BOOL)a3;
- (void)setHasClockCount:(BOOL)a3;
- (void)setHasConversionsCount:(BOOL)a3;
- (void)setHasDictionaryCount:(BOOL)a3;
- (void)setHasEdutainmentCount:(BOOL)a3;
- (void)setHasFlightsCount:(BOOL)a3;
- (void)setHasKgCount:(BOOL)a3;
- (void)setHasKgcnCount:(BOOL)a3;
- (void)setHasMapsCount:(BOOL)a3;
- (void)setHasMathCount:(BOOL)a3;
- (void)setHasMediaCount:(BOOL)a3;
- (void)setHasMoviesCount:(BOOL)a3;
- (void)setHasNewsCount:(BOOL)a3;
- (void)setHasPrecomputedWebanswersCount:(BOOL)a3;
- (void)setHasSportsCount:(BOOL)a3;
- (void)setHasStocksCount:(BOOL)a3;
- (void)setHasTvCount:(BOOL)a3;
- (void)setHasVideoCount:(BOOL)a3;
- (void)setHasWeatherCount:(BOOL)a3;
- (void)setHasWebCount:(BOOL)a3;
- (void)setHasWebImagesCount:(BOOL)a3;
- (void)setHasWebVideoCount:(BOOL)a3;
- (void)setHasWritingsCount:(BOOL)a3;
- (void)setKgCount:(unsigned int)a3;
- (void)setKgcnCount:(unsigned int)a3;
- (void)setMapsCount:(unsigned int)a3;
- (void)setMathCount:(unsigned int)a3;
- (void)setMediaCount:(unsigned int)a3;
- (void)setMoviesCount:(unsigned int)a3;
- (void)setNewsCount:(unsigned int)a3;
- (void)setPrecomputedWebanswersCount:(unsigned int)a3;
- (void)setSportsCount:(unsigned int)a3;
- (void)setStocksCount:(unsigned int)a3;
- (void)setTvCount:(unsigned int)a3;
- (void)setVideoCount:(unsigned int)a3;
- (void)setWeatherCount:(unsigned int)a3;
- (void)setWebCount:(unsigned int)a3;
- (void)setWebImagesCount:(unsigned int)a3;
- (void)setWebVideoCount:(unsigned int)a3;
- (void)setWritingsCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSDomainCards

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (unsigned)ampMusicCount
{
  return self->_ampMusicCount;
}

- (unsigned)flightsCount
{
  return self->_flightsCount;
}

- (unsigned)writingsCount
{
  return self->_writingsCount;
}

- (unsigned)webVideoCount
{
  return self->_webVideoCount;
}

- (unsigned)kgcnCount
{
  return self->_kgcnCount;
}

- (unsigned)edutainmentCount
{
  return self->_edutainmentCount;
}

- (unsigned)conversionsCount
{
  return self->_conversionsCount;
}

- (unsigned)appsCount
{
  return self->_appsCount;
}

- (unsigned)ampVideoCount
{
  return self->_ampVideoCount;
}

- (unsigned)webImagesCount
{
  return self->_webImagesCount;
}

- (unsigned)webCount
{
  return self->_webCount;
}

- (unsigned)weatherCount
{
  return self->_weatherCount;
}

- (unsigned)videoCount
{
  return self->_videoCount;
}

- (unsigned)tvCount
{
  return self->_tvCount;
}

- (unsigned)stocksCount
{
  return self->_stocksCount;
}

- (unsigned)sportsCount
{
  return self->_sportsCount;
}

- (unsigned)precomputedWebanswersCount
{
  return self->_precomputedWebanswersCount;
}

- (unsigned)newsCount
{
  return self->_newsCount;
}

- (unsigned)moviesCount
{
  return self->_moviesCount;
}

- (unsigned)mediaCount
{
  return self->_mediaCount;
}

- (unsigned)mathCount
{
  return self->_mathCount;
}

- (unsigned)mapsCount
{
  return self->_mapsCount;
}

- (unsigned)kgCount
{
  return self->_kgCount;
}

- (unsigned)dictionaryCount
{
  return self->_dictionaryCount;
}

- (unsigned)clockCount
{
  return self->_clockCount;
}

- (PEGASUSSchemaPEGASUSDomainCards)initWithDictionary:(id)a3
{
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)PEGASUSSchemaPEGASUSDomainCards;
  v5 = [(PEGASUSSchemaPEGASUSDomainCards *)&v56 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"clockCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setClockCount:](v5, "setClockCount:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"dictionaryCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setDictionaryCount:](v5, "setDictionaryCount:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"kgCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setKgCount:](v5, "setKgCount:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"mapsCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setMapsCount:](v5, "setMapsCount:", [v9 unsignedIntValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"mathCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setMathCount:](v5, "setMathCount:", [v10 unsignedIntValue]);
    }
    v48 = v7;
    v11 = [v4 objectForKeyedSubscript:@"mediaCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setMediaCount:](v5, "setMediaCount:", [v11 unsignedIntValue]);
    }
    v44 = v11;
    v12 = v6;
    v13 = [v4 objectForKeyedSubscript:@"moviesCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setMoviesCount:](v5, "setMoviesCount:", [v13 unsignedIntValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"newsCount"];
    objc_opt_class();
    v55 = v14;
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setNewsCount:](v5, "setNewsCount:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"precomputedWebanswersCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setPrecomputedWebanswersCount:](v5, "setPrecomputedWebanswersCount:", [v15 unsignedIntValue]);
    }
    v42 = v15;
    v16 = [v4 objectForKeyedSubscript:@"sportsCount"];
    objc_opt_class();
    v54 = v16;
    v49 = v12;
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setSportsCount:](v5, "setSportsCount:", [v16 unsignedIntValue]);
    }
    v45 = v10;
    v17 = [v4 objectForKeyedSubscript:@"stocksCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setStocksCount:](v5, "setStocksCount:", [v17 unsignedIntValue]);
    }
    v18 = v9;
    v19 = [v4 objectForKeyedSubscript:@"tvCount"];
    objc_opt_class();
    v53 = v19;
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setTvCount:](v5, "setTvCount:", [v19 unsignedIntValue]);
    }
    v20 = v8;
    v21 = [v4 objectForKeyedSubscript:@"videoCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setVideoCount:](v5, "setVideoCount:", [v21 unsignedIntValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"weatherCount"];
    objc_opt_class();
    v52 = v22;
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setWeatherCount:](v5, "setWeatherCount:", [v22 unsignedIntValue]);
    }
    uint64_t v23 = [v4 objectForKeyedSubscript:@"webCount"];
    objc_opt_class();
    v51 = (void *)v23;
    v24 = v20;
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setWebCount:](v5, "setWebCount:", [v51 unsignedIntValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"webImagesCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setWebImagesCount:](v5, "setWebImagesCount:", [v25 unsignedIntValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"ampVideoCount"];
    objc_opt_class();
    v50 = v26;
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setAmpVideoCount:](v5, "setAmpVideoCount:", [v26 unsignedIntValue]);
    }
    v41 = v17;
    v27 = [v4 objectForKeyedSubscript:@"appsCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setAppsCount:](v5, "setAppsCount:", [v27 unsignedIntValue]);
    }
    v47 = v24;
    v28 = [v4 objectForKeyedSubscript:@"conversionsCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setConversionsCount:](v5, "setConversionsCount:", [v28 unsignedIntValue]);
    }
    v38 = v28;
    v40 = v25;
    v46 = v18;
    v29 = [v4 objectForKeyedSubscript:@"edutainmentCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setEdutainmentCount:](v5, "setEdutainmentCount:", [v29 unsignedIntValue]);
    }
    v30 = [v4 objectForKeyedSubscript:@"kgcnCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setKgcnCount:](v5, "setKgcnCount:", [v30 unsignedIntValue]);
    }
    v31 = [v4 objectForKeyedSubscript:@"webVideoCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setWebVideoCount:](v5, "setWebVideoCount:", [v31 unsignedIntValue]);
    }
    v39 = v27;
    v43 = v13;
    v32 = [v4 objectForKeyedSubscript:@"writingsCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setWritingsCount:](v5, "setWritingsCount:", [v32 unsignedIntValue]);
    }
    v33 = v21;
    v34 = [v4 objectForKeyedSubscript:@"flightsCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setFlightsCount:](v5, "setFlightsCount:", [v34 unsignedIntValue]);
    }
    v35 = [v4 objectForKeyedSubscript:@"ampMusicCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PEGASUSSchemaPEGASUSDomainCards setAmpMusicCount:](v5, "setAmpMusicCount:", [v35 unsignedIntValue]);
    }
    v36 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSDomainCards)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSDomainCards *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSDomainCards *)self dictionaryRepresentation];
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
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards ampMusicCount](self, "ampMusicCount"));
    [v3 setObject:v7 forKeyedSubscript:@"ampMusicCount"];

    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x20000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards ampVideoCount](self, "ampVideoCount"));
  [v3 setObject:v8 forKeyedSubscript:@"ampVideoCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards appsCount](self, "appsCount"));
  [v3 setObject:v9 forKeyedSubscript:@"appsCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards clockCount](self, "clockCount"));
  [v3 setObject:v10 forKeyedSubscript:@"clockCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards conversionsCount](self, "conversionsCount"));
  [v3 setObject:v11 forKeyedSubscript:@"conversionsCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards dictionaryCount](self, "dictionaryCount"));
  [v3 setObject:v12 forKeyedSubscript:@"dictionaryCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards edutainmentCount](self, "edutainmentCount"));
  [v3 setObject:v13 forKeyedSubscript:@"edutainmentCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards flightsCount](self, "flightsCount"));
  [v3 setObject:v14 forKeyedSubscript:@"flightsCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards kgCount](self, "kgCount"));
  [v3 setObject:v15 forKeyedSubscript:@"kgCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards kgcnCount](self, "kgcnCount"));
  [v3 setObject:v16 forKeyedSubscript:@"kgcnCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards mapsCount](self, "mapsCount"));
  [v3 setObject:v17 forKeyedSubscript:@"mapsCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards mathCount](self, "mathCount"));
  [v3 setObject:v18 forKeyedSubscript:@"mathCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  v19 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards mediaCount](self, "mediaCount"));
  [v3 setObject:v19 forKeyedSubscript:@"mediaCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards moviesCount](self, "moviesCount"));
  [v3 setObject:v20 forKeyedSubscript:@"moviesCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards newsCount](self, "newsCount"));
  [v3 setObject:v21 forKeyedSubscript:@"newsCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards precomputedWebanswersCount](self, "precomputedWebanswersCount"));
  [v3 setObject:v22 forKeyedSubscript:@"precomputedWebanswersCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards sportsCount](self, "sportsCount"));
  [v3 setObject:v23 forKeyedSubscript:@"sportsCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_48;
  }
LABEL_47:
  v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards stocksCount](self, "stocksCount"));
  [v3 setObject:v24 forKeyedSubscript:@"stocksCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards tvCount](self, "tvCount"));
  [v3 setObject:v25 forKeyedSubscript:@"tvCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards videoCount](self, "videoCount"));
  [v3 setObject:v26 forKeyedSubscript:@"videoCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards weatherCount](self, "weatherCount"));
  [v3 setObject:v27 forKeyedSubscript:@"weatherCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_51:
  v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards webCount](self, "webCount"));
  [v3 setObject:v28 forKeyedSubscript:@"webCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_52:
  v29 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards webImagesCount](self, "webImagesCount"));
  [v3 setObject:v29 forKeyedSubscript:@"webImagesCount"];

  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_53:
  v30 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards webVideoCount](self, "webVideoCount"));
  [v3 setObject:v30 forKeyedSubscript:@"webVideoCount"];

  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_26:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PEGASUSSchemaPEGASUSDomainCards writingsCount](self, "writingsCount"));
    [v3 setObject:v5 forKeyedSubscript:@"writingsCount"];
  }
LABEL_27:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if (*(unsigned char *)&has)
  {
    uint64_t v3 = 2654435761 * self->_clockCount;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_dictionaryCount;
      if ((*(unsigned char *)&has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_kgCount;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_mapsCount;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_mathCount;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_mediaCount;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_moviesCount;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_newsCount;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v10 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_precomputedWebanswersCount;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v11 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_sportsCount;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v12 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_stocksCount;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v13 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_13:
    uint64_t v14 = 2654435761 * self->_tvCount;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v14 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_14:
    uint64_t v15 = 2654435761 * self->_videoCount;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v15 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v16 = 2654435761 * self->_weatherCount;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v16 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v17 = 2654435761 * self->_webCount;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v18 = 2654435761 * self->_webImagesCount;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_ampVideoCount;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    uint64_t v20 = 2654435761 * self->_appsCount;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_20:
    uint64_t v21 = 2654435761 * self->_conversionsCount;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v21 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_21:
    uint64_t v22 = 2654435761 * self->_edutainmentCount;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_22:
    uint64_t v23 = 2654435761 * self->_kgcnCount;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_23:
    uint64_t v24 = 2654435761 * self->_webVideoCount;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_24:
    uint64_t v25 = 2654435761 * self->_writingsCount;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_25;
    }
LABEL_50:
    uint64_t v26 = 0;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_26;
    }
LABEL_51:
    uint64_t v27 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27;
  }
LABEL_49:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&has & 0x800000) == 0) {
    goto LABEL_50;
  }
LABEL_25:
  uint64_t v26 = 2654435761 * self->_flightsCount;
  if ((*(_DWORD *)&has & 0x1000000) == 0) {
    goto LABEL_51;
  }
LABEL_26:
  uint64_t v27 = 2654435761 * self->_ampMusicCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_102;
  }
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  unsigned int v6 = v4[27];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_102;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int clockCount = self->_clockCount;
    if (clockCount != [v4 clockCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_102;
  }
  if (v8)
  {
    unsigned int dictionaryCount = self->_dictionaryCount;
    if (dictionaryCount != [v4 dictionaryCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_102;
  }
  if (v10)
  {
    unsigned int kgCount = self->_kgCount;
    if (kgCount != [v4 kgCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_102;
  }
  if (v12)
  {
    unsigned int mapsCount = self->_mapsCount;
    if (mapsCount != [v4 mapsCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_102;
  }
  if (v14)
  {
    unsigned int mathCount = self->_mathCount;
    if (mathCount != [v4 mathCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_102;
  }
  if (v16)
  {
    unsigned int mediaCount = self->_mediaCount;
    if (mediaCount != [v4 mediaCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_102;
  }
  if (v18)
  {
    unsigned int moviesCount = self->_moviesCount;
    if (moviesCount != [v4 moviesCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_102;
  }
  if (v20)
  {
    unsigned int newsCount = self->_newsCount;
    if (newsCount != [v4 newsCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_102;
  }
  if (v22)
  {
    unsigned int precomputedWebanswersCount = self->_precomputedWebanswersCount;
    if (precomputedWebanswersCount != [v4 precomputedWebanswersCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_102;
  }
  if (v24)
  {
    unsigned int sportsCount = self->_sportsCount;
    if (sportsCount != [v4 sportsCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1)) {
    goto LABEL_102;
  }
  if (v26)
  {
    unsigned int stocksCount = self->_stocksCount;
    if (stocksCount != [v4 stocksCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1)) {
    goto LABEL_102;
  }
  if (v28)
  {
    unsigned int tvCount = self->_tvCount;
    if (tvCount != [v4 tvCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1)) {
    goto LABEL_102;
  }
  if (v30)
  {
    unsigned int videoCount = self->_videoCount;
    if (videoCount != [v4 videoCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v32 = (*(unsigned int *)&has >> 13) & 1;
  if (v32 != ((v6 >> 13) & 1)) {
    goto LABEL_102;
  }
  if (v32)
  {
    unsigned int weatherCount = self->_weatherCount;
    if (weatherCount != [v4 weatherCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v34 = (*(unsigned int *)&has >> 14) & 1;
  if (v34 != ((v6 >> 14) & 1)) {
    goto LABEL_102;
  }
  if (v34)
  {
    unsigned int webCount = self->_webCount;
    if (webCount != [v4 webCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v36 = (*(unsigned int *)&has >> 15) & 1;
  if (v36 != ((v6 >> 15) & 1)) {
    goto LABEL_102;
  }
  if (v36)
  {
    unsigned int webImagesCount = self->_webImagesCount;
    if (webImagesCount != [v4 webImagesCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v38 = HIWORD(*(unsigned int *)&has) & 1;
  if (v38 != (HIWORD(v6) & 1)) {
    goto LABEL_102;
  }
  if (v38)
  {
    unsigned int ampVideoCount = self->_ampVideoCount;
    if (ampVideoCount != [v4 ampVideoCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v40 = (*(unsigned int *)&has >> 17) & 1;
  if (v40 != ((v6 >> 17) & 1)) {
    goto LABEL_102;
  }
  if (v40)
  {
    unsigned int appsCount = self->_appsCount;
    if (appsCount != [v4 appsCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v42 = (*(unsigned int *)&has >> 18) & 1;
  if (v42 != ((v6 >> 18) & 1)) {
    goto LABEL_102;
  }
  if (v42)
  {
    unsigned int conversionsCount = self->_conversionsCount;
    if (conversionsCount != [v4 conversionsCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v44 = (*(unsigned int *)&has >> 19) & 1;
  if (v44 != ((v6 >> 19) & 1)) {
    goto LABEL_102;
  }
  if (v44)
  {
    unsigned int edutainmentCount = self->_edutainmentCount;
    if (edutainmentCount != [v4 edutainmentCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v46 = (*(unsigned int *)&has >> 20) & 1;
  if (v46 != ((v6 >> 20) & 1)) {
    goto LABEL_102;
  }
  if (v46)
  {
    unsigned int kgcnCount = self->_kgcnCount;
    if (kgcnCount != [v4 kgcnCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v48 = (*(unsigned int *)&has >> 21) & 1;
  if (v48 != ((v6 >> 21) & 1)) {
    goto LABEL_102;
  }
  if (v48)
  {
    unsigned int webVideoCount = self->_webVideoCount;
    if (webVideoCount != [v4 webVideoCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v50 = (*(unsigned int *)&has >> 22) & 1;
  if (v50 != ((v6 >> 22) & 1)) {
    goto LABEL_102;
  }
  if (v50)
  {
    unsigned int writingsCount = self->_writingsCount;
    if (writingsCount != [v4 writingsCount]) {
      goto LABEL_102;
    }
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    unsigned int v6 = v4[27];
  }
  int v52 = (*(unsigned int *)&has >> 23) & 1;
  if (v52 != ((v6 >> 23) & 1)) {
    goto LABEL_102;
  }
  if (v52)
  {
    unsigned int flightsCount = self->_flightsCount;
    if (flightsCount == [v4 flightsCount])
    {
      $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
      unsigned int v6 = v4[27];
      goto LABEL_98;
    }
LABEL_102:
    BOOL v56 = 0;
    goto LABEL_103;
  }
LABEL_98:
  int v54 = HIBYTE(*(unsigned int *)&has) & 1;
  if (v54 != (HIBYTE(v6) & 1)) {
    goto LABEL_102;
  }
  if (v54)
  {
    unsigned int ampMusicCount = self->_ampMusicCount;
    if (ampMusicCount != [v4 ampMusicCount]) {
      goto LABEL_102;
    }
  }
  BOOL v56 = 1;
LABEL_103:

  return v56;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint32Field();
    $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $DF105F87EA65FC492C9EACDF3E8CDA6B has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x1000000) != 0) {
LABEL_26:
  }
    PBDataWriterWriteUint32Field();
LABEL_27:
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSDomainCardsReadFrom(self, (uint64_t)a3);
}

- (void)deleteAmpMusicCount
{
  *(_DWORD *)&self->_has &= ~0x1000000u;
}

- (void)setHasAmpMusicCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasAmpMusicCount
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setAmpMusicCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_unsigned int ampMusicCount = a3;
}

- (void)deleteFlightsCount
{
  *(_DWORD *)&self->_has &= ~0x800000u;
}

- (void)setHasFlightsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasFlightsCount
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setFlightsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_unsigned int flightsCount = a3;
}

- (void)deleteWritingsCount
{
  *(_DWORD *)&self->_has &= ~0x400000u;
}

- (void)setHasWritingsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasWritingsCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setWritingsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_unsigned int writingsCount = a3;
}

- (void)deleteWebVideoCount
{
  *(_DWORD *)&self->_has &= ~0x200000u;
}

- (void)setHasWebVideoCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasWebVideoCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setWebVideoCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_unsigned int webVideoCount = a3;
}

- (void)deleteKgcnCount
{
  *(_DWORD *)&self->_has &= ~0x100000u;
}

- (void)setHasKgcnCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasKgcnCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setKgcnCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_unsigned int kgcnCount = a3;
}

- (void)deleteEdutainmentCount
{
  *(_DWORD *)&self->_has &= ~0x80000u;
}

- (void)setHasEdutainmentCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasEdutainmentCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setEdutainmentCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_unsigned int edutainmentCount = a3;
}

- (void)deleteConversionsCount
{
  *(_DWORD *)&self->_has &= ~0x40000u;
}

- (void)setHasConversionsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasConversionsCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setConversionsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_unsigned int conversionsCount = a3;
}

- (void)deleteAppsCount
{
  *(_DWORD *)&self->_has &= ~0x20000u;
}

- (void)setHasAppsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasAppsCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAppsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_unsigned int appsCount = a3;
}

- (void)deleteAmpVideoCount
{
  *(_DWORD *)&self->_has &= ~0x10000u;
}

- (void)setHasAmpVideoCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasAmpVideoCount
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setAmpVideoCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_unsigned int ampVideoCount = a3;
}

- (void)deleteWebImagesCount
{
  *(_DWORD *)&self->_has &= ~0x8000u;
}

- (void)setHasWebImagesCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasWebImagesCount
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setWebImagesCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_unsigned int webImagesCount = a3;
}

- (void)deleteWebCount
{
  *(_DWORD *)&self->_has &= ~0x4000u;
}

- (void)setHasWebCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasWebCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setWebCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_unsigned int webCount = a3;
}

- (void)deleteWeatherCount
{
  *(_DWORD *)&self->_has &= ~0x2000u;
}

- (void)setHasWeatherCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasWeatherCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setWeatherCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_unsigned int weatherCount = a3;
}

- (void)deleteVideoCount
{
  *(_DWORD *)&self->_has &= ~0x1000u;
}

- (void)setHasVideoCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasVideoCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setVideoCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_unsigned int videoCount = a3;
}

- (void)deleteTvCount
{
  *(_DWORD *)&self->_has &= ~0x800u;
}

- (void)setHasTvCount:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTvCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTvCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_unsigned int tvCount = a3;
}

- (void)deleteStocksCount
{
  *(_DWORD *)&self->_has &= ~0x400u;
}

- (void)setHasStocksCount:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasStocksCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setStocksCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_unsigned int stocksCount = a3;
}

- (void)deleteSportsCount
{
  *(_DWORD *)&self->_has &= ~0x200u;
}

- (void)setHasSportsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasSportsCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSportsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_unsigned int sportsCount = a3;
}

- (void)deletePrecomputedWebanswersCount
{
  *(_DWORD *)&self->_has &= ~0x100u;
}

- (void)setHasPrecomputedWebanswersCount:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPrecomputedWebanswersCount
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setPrecomputedWebanswersCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_unsigned int precomputedWebanswersCount = a3;
}

- (void)deleteNewsCount
{
  *(_DWORD *)&self->_has &= ~0x80u;
}

- (void)setHasNewsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNewsCount
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setNewsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_unsigned int newsCount = a3;
}

- (void)deleteMoviesCount
{
  *(_DWORD *)&self->_has &= ~0x40u;
}

- (void)setHasMoviesCount:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasMoviesCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setMoviesCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_unsigned int moviesCount = a3;
}

- (void)deleteMediaCount
{
  *(_DWORD *)&self->_has &= ~0x20u;
}

- (void)setHasMediaCount:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasMediaCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setMediaCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_unsigned int mediaCount = a3;
}

- (void)deleteMathCount
{
  *(_DWORD *)&self->_has &= ~0x10u;
}

- (void)setHasMathCount:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasMathCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMathCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_unsigned int mathCount = a3;
}

- (void)deleteMapsCount
{
  *(_DWORD *)&self->_has &= ~8u;
}

- (void)setHasMapsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasMapsCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMapsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_unsigned int mapsCount = a3;
}

- (void)deleteKgCount
{
  *(_DWORD *)&self->_has &= ~4u;
}

- (void)setHasKgCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasKgCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setKgCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_unsigned int kgCount = a3;
}

- (void)deleteDictionaryCount
{
  *(_DWORD *)&self->_has &= ~2u;
}

- (void)setHasDictionaryCount:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDictionaryCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDictionaryCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_unsigned int dictionaryCount = a3;
}

- (void)deleteClockCount
{
  *(_DWORD *)&self->_has &= ~1u;
}

- (void)setHasClockCount:(BOOL)a3
{
  self->_$DF105F87EA65FC492C9EACDF3E8CDA6B has = ($DF105F87EA65FC492C9EACDF3E8CDA6B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasClockCount
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setClockCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_unsigned int clockCount = a3;
}

@end