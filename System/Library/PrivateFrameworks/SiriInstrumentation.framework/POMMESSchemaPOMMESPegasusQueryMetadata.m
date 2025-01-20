@interface POMMESSchemaPOMMESPegasusQueryMetadata
- (BOOL)hasCountryCode;
- (BOOL)hasHasCountryCode;
- (BOOL)hasHasLatitude;
- (BOOL)hasHasLongitude;
- (BOOL)hasHasSiriLocale;
- (BOOL)hasHasStorefront;
- (BOOL)hasHeySiriEnabled;
- (BOOL)hasInstalledAppsSignatureLength;
- (BOOL)hasIsNavigationMode;
- (BOOL)hasLatitude;
- (BOOL)hasLocationAgeInSeconds;
- (BOOL)hasLocationPreciseStatus;
- (BOOL)hasLocationSource;
- (BOOL)hasLongitude;
- (BOOL)hasMeasurementSystem;
- (BOOL)hasSiriLocale;
- (BOOL)hasStorefront;
- (BOOL)hasStorefrontValue;
- (BOOL)hasTemperatureScale;
- (BOOL)hasUiScale;
- (BOOL)heySiriEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNavigationMode;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)storefrontValue;
- (POMMESSchemaPOMMESPegasusQueryMetadata)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusQueryMetadata)initWithJSON:(id)a3;
- (float)uiScale;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)locationPreciseStatus;
- (int)locationSource;
- (int)measurementSystem;
- (int)temperatureScale;
- (unint64_t)hash;
- (unsigned)installedAppsSignatureLength;
- (unsigned)locationAgeInSeconds;
- (void)deleteHasCountryCode;
- (void)deleteHasLatitude;
- (void)deleteHasLongitude;
- (void)deleteHasSiriLocale;
- (void)deleteHasStorefront;
- (void)deleteHeySiriEnabled;
- (void)deleteInstalledAppsSignatureLength;
- (void)deleteIsNavigationMode;
- (void)deleteLocationAgeInSeconds;
- (void)deleteLocationPreciseStatus;
- (void)deleteLocationSource;
- (void)deleteMeasurementSystem;
- (void)deleteStorefrontValue;
- (void)deleteTemperatureScale;
- (void)deleteUiScale;
- (void)setHasCountryCode:(BOOL)a3;
- (void)setHasHasCountryCode:(BOOL)a3;
- (void)setHasHasLatitude:(BOOL)a3;
- (void)setHasHasLongitude:(BOOL)a3;
- (void)setHasHasSiriLocale:(BOOL)a3;
- (void)setHasHasStorefront:(BOOL)a3;
- (void)setHasHeySiriEnabled:(BOOL)a3;
- (void)setHasInstalledAppsSignatureLength:(BOOL)a3;
- (void)setHasIsNavigationMode:(BOOL)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLocationAgeInSeconds:(BOOL)a3;
- (void)setHasLocationPreciseStatus:(BOOL)a3;
- (void)setHasLocationSource:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasMeasurementSystem:(BOOL)a3;
- (void)setHasSiriLocale:(BOOL)a3;
- (void)setHasStorefront:(BOOL)a3;
- (void)setHasStorefrontValue:(BOOL)a3;
- (void)setHasTemperatureScale:(BOOL)a3;
- (void)setHasUiScale:(BOOL)a3;
- (void)setHeySiriEnabled:(BOOL)a3;
- (void)setInstalledAppsSignatureLength:(unsigned int)a3;
- (void)setIsNavigationMode:(BOOL)a3;
- (void)setLocationAgeInSeconds:(unsigned int)a3;
- (void)setLocationPreciseStatus:(int)a3;
- (void)setLocationSource:(int)a3;
- (void)setMeasurementSystem:(int)a3;
- (void)setStorefrontValue:(id)a3;
- (void)setTemperatureScale:(int)a3;
- (void)setUiScale:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusQueryMetadata

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasStorefrontValue:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (int)locationPreciseStatus
{
  return self->_locationPreciseStatus;
}

- (int)locationSource
{
  return self->_locationSource;
}

- (unsigned)locationAgeInSeconds
{
  return self->_locationAgeInSeconds;
}

- (BOOL)heySiriEnabled
{
  return self->_heySiriEnabled;
}

- (void)setStorefrontValue:(id)a3
{
}

- (NSString)storefrontValue
{
  return self->_storefrontValue;
}

- (unsigned)installedAppsSignatureLength
{
  return self->_installedAppsSignatureLength;
}

- (int)measurementSystem
{
  return self->_measurementSystem;
}

- (int)temperatureScale
{
  return self->_temperatureScale;
}

- (BOOL)isNavigationMode
{
  return self->_isNavigationMode;
}

- (float)uiScale
{
  return self->_uiScale;
}

- (BOOL)hasSiriLocale
{
  return self->_hasSiriLocale;
}

- (BOOL)hasStorefront
{
  return self->_hasStorefront;
}

- (BOOL)hasCountryCode
{
  return self->_hasCountryCode;
}

- (BOOL)hasLongitude
{
  return self->_hasLongitude;
}

- (BOOL)hasLatitude
{
  return self->_hasLatitude;
}

- (POMMESSchemaPOMMESPegasusQueryMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)POMMESSchemaPOMMESPegasusQueryMetadata;
  v5 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)&v33 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"hasLatitude"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHasLatitude:](v5, "setHasLatitude:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"hasLongitude"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHasLongitude:](v5, "setHasLongitude:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"hasCountryCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHasCountryCode:](v5, "setHasCountryCode:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"hasStorefront"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHasStorefront:](v5, "setHasStorefront:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"hasSiriLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHasSiriLocale:](v5, "setHasSiriLocale:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"uiScale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v11 floatValue];
      -[POMMESSchemaPOMMESPegasusQueryMetadata setUiScale:](v5, "setUiScale:");
    }
    v12 = [v4 objectForKeyedSubscript:@"isNavigationMode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setIsNavigationMode:](v5, "setIsNavigationMode:", [v12 BOOLValue]);
    }
    v32 = v6;
    v13 = [v4 objectForKeyedSubscript:@"temperatureScale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setTemperatureScale:](v5, "setTemperatureScale:", [v13 intValue]);
    }
    v31 = v7;
    v14 = [v4 objectForKeyedSubscript:@"measurementSystem"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setMeasurementSystem:](v5, "setMeasurementSystem:", [v14 intValue]);
    }
    v29 = v9;
    v30 = v8;
    v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"installedAppsSignatureLength", v14);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setInstalledAppsSignatureLength:](v5, "setInstalledAppsSignatureLength:", [v15 unsignedIntValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"storefrontValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(POMMESSchemaPOMMESPegasusQueryMetadata *)v5 setStorefrontValue:v17];
    }
    v28 = v10;
    v18 = [v4 objectForKeyedSubscript:@"heySiriEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setHeySiriEnabled:](v5, "setHeySiriEnabled:", [v18 BOOLValue]);
    }
    v26 = v13;
    v27 = v11;
    v19 = [v4 objectForKeyedSubscript:@"locationAgeInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setLocationAgeInSeconds:](v5, "setLocationAgeInSeconds:", [v19 unsignedIntValue]);
    }
    v20 = v12;
    v21 = [v4 objectForKeyedSubscript:@"locationSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setLocationSource:](v5, "setLocationSource:", [v21 intValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"locationPreciseStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POMMESSchemaPOMMESPegasusQueryMetadata setLocationPreciseStatus:](v5, "setLocationPreciseStatus:", [v22 intValue]);
    }
    v23 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESPegasusQueryMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self dictionaryRepresentation];
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
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata hasCountryCode](self, "hasCountryCode"));
    [v3 setObject:v5 forKeyedSubscript:@"hasCountryCode"];

    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata hasLatitude](self, "hasLatitude"));
  [v3 setObject:v6 forKeyedSubscript:@"hasLatitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata hasLongitude](self, "hasLongitude"));
  [v3 setObject:v7 forKeyedSubscript:@"hasLongitude"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata hasSiriLocale](self, "hasSiriLocale"));
  [v3 setObject:v8 forKeyedSubscript:@"hasSiriLocale"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x400) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata hasStorefront](self, "hasStorefront"));
  [v3 setObject:v9 forKeyedSubscript:@"hasStorefront"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_7:
    if ((has & 0x200) == 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata heySiriEnabled](self, "heySiriEnabled"));
  [v3 setObject:v10 forKeyedSubscript:@"heySiriEnabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusQueryMetadata installedAppsSignatureLength](self, "installedAppsSignatureLength"));
  [v3 setObject:v11 forKeyedSubscript:@"installedAppsSignatureLength"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[POMMESSchemaPOMMESPegasusQueryMetadata isNavigationMode](self, "isNavigationMode"));
  [v3 setObject:v12 forKeyedSubscript:@"isNavigationMode"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[POMMESSchemaPOMMESPegasusQueryMetadata locationAgeInSeconds](self, "locationAgeInSeconds"));
  [v3 setObject:v13 forKeyedSubscript:@"locationAgeInSeconds"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_11:
    if ((has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_23:
  int v14 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self locationPreciseStatus];
  v15 = @"POMMESPEGASUSREQUESTLOCATIONPRECISESTATUS_UNKNOWN";
  if (v14 == 1) {
    v15 = @"POMMESPEGASUSREQUESTLOCATIONPRECISESTATUS_PRECISE";
  }
  if (v14 == 2) {
    v16 = @"POMMESPEGASUSREQUESTLOCATIONPRECISESTATUS_NOT_PRECISE";
  }
  else {
    v16 = v15;
  }
  [v3 setObject:v16 forKeyedSubscript:@"locationPreciseStatus"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_37;
    }
    goto LABEL_33;
  }
LABEL_29:
  unsigned int v17 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self locationSource] - 1;
  if (v17 > 7) {
    v18 = @"POMMESPEGASUSREQUESTLOCATIONSOURCE_UNKNOWN";
  }
  else {
    v18 = off_1E5EB42A0[v17];
  }
  [v3 setObject:v18 forKeyedSubscript:@"locationSource"];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_33:
    unsigned int v19 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self measurementSystem] - 1;
    if (v19 > 2) {
      v20 = @"MEASUREMENTSYSTEM_UNKNOWN";
    }
    else {
      v20 = off_1E5EB42E0[v19];
    }
    [v3 setObject:v20 forKeyedSubscript:@"measurementSystem"];
  }
LABEL_37:
  if (self->_storefrontValue)
  {
    v21 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self storefrontValue];
    v22 = (void *)[v21 copy];
    [v3 setObject:v22 forKeyedSubscript:@"storefrontValue"];
  }
  __int16 v23 = (__int16)self->_has;
  if ((v23 & 0x80) != 0)
  {
    int v24 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self temperatureScale];
    v25 = @"TEMPERATURESCALE_UNKNOWN";
    if (v24 == 1) {
      v25 = @"TEMPERATURESCALE_CELSIUS";
    }
    if (v24 == 2) {
      v26 = @"TEMPERATURESCALE_FAHRENHEIT";
    }
    else {
      v26 = v25;
    }
    [v3 setObject:v26 forKeyedSubscript:@"temperatureScale"];
    __int16 v23 = (__int16)self->_has;
  }
  if ((v23 & 0x20) != 0)
  {
    v27 = NSNumber;
    [(POMMESSchemaPOMMESPegasusQueryMetadata *)self uiScale];
    v28 = objc_msgSend(v27, "numberWithFloat:");
    [v3 setObject:v28 forKeyedSubscript:@"uiScale"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v23 = 2654435761 * self->_hasLatitude;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v22 = 2654435761 * self->_hasLongitude;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v23 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v22 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v21 = 2654435761 * self->_hasCountryCode;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v21 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_hasStorefront;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_15:
    uint64_t v5 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
LABEL_16:
    unint64_t v10 = 0;
    goto LABEL_19;
  }
LABEL_14:
  uint64_t v4 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_15;
  }
LABEL_6:
  uint64_t v5 = 2654435761 * self->_hasSiriLocale;
  if ((has & 0x20) == 0) {
    goto LABEL_16;
  }
LABEL_7:
  float uiScale = self->_uiScale;
  double v7 = uiScale;
  if (uiScale < 0.0) {
    double v7 = -uiScale;
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
LABEL_19:
  if ((has & 0x40) != 0)
  {
    uint64_t v11 = 2654435761 * self->_isNavigationMode;
    if ((has & 0x80) != 0)
    {
LABEL_21:
      uint64_t v12 = 2654435761 * self->_temperatureScale;
      if ((has & 0x100) != 0) {
        goto LABEL_22;
      }
LABEL_26:
      uint64_t v13 = 0;
      if ((has & 0x200) != 0) {
        goto LABEL_23;
      }
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = 0;
  if ((has & 0x100) == 0) {
    goto LABEL_26;
  }
LABEL_22:
  uint64_t v13 = 2654435761 * self->_measurementSystem;
  if ((has & 0x200) != 0)
  {
LABEL_23:
    uint64_t v14 = 2654435761 * self->_installedAppsSignatureLength;
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v14 = 0;
LABEL_28:
  NSUInteger v15 = [(NSString *)self->_storefrontValue hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    uint64_t v16 = 2654435761 * self->_heySiriEnabled;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_30:
      uint64_t v17 = 2654435761 * self->_locationAgeInSeconds;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_31;
      }
LABEL_35:
      uint64_t v18 = 0;
      if ((*(_WORD *)&self->_has & 0x2000) != 0) {
        goto LABEL_32;
      }
LABEL_36:
      uint64_t v19 = 0;
      return v22 ^ v23 ^ v21 ^ v4 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v15;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_30;
    }
  }
  uint64_t v17 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_35;
  }
LABEL_31:
  uint64_t v18 = 2654435761 * self->_locationSource;
  if ((*(_WORD *)&self->_has & 0x2000) == 0) {
    goto LABEL_36;
  }
LABEL_32:
  uint64_t v19 = 2654435761 * self->_locationPreciseStatus;
  return v22 ^ v23 ^ v21 ^ v4 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  $650077331ADD6EB83ECA1302D4436A84 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_63;
  }
  if (*(unsigned char *)&has)
  {
    int hasLatitude = self->_hasLatitude;
    if (hasLatitude != [v4 hasLatitude]) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_63;
  }
  if (v8)
  {
    int hasLongitude = self->_hasLongitude;
    if (hasLongitude != [v4 hasLongitude]) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_63;
  }
  if (v10)
  {
    int hasCountryCode = self->_hasCountryCode;
    if (hasCountryCode != [v4 hasCountryCode]) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_63;
  }
  if (v12)
  {
    int hasStorefront = self->_hasStorefront;
    if (hasStorefront != [v4 hasStorefront]) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_63;
  }
  if (v14)
  {
    int hasSiriLocale = self->_hasSiriLocale;
    if (hasSiriLocale != [v4 hasSiriLocale]) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_63;
  }
  if (v16)
  {
    float uiScale = self->_uiScale;
    [v4 uiScale];
    if (uiScale != v18) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v19 = (*(unsigned int *)&has >> 6) & 1;
  if (v19 != ((v6 >> 6) & 1)) {
    goto LABEL_63;
  }
  if (v19)
  {
    int isNavigationMode = self->_isNavigationMode;
    if (isNavigationMode != [v4 isNavigationMode]) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v21 = (*(unsigned int *)&has >> 7) & 1;
  if (v21 != ((v6 >> 7) & 1)) {
    goto LABEL_63;
  }
  if (v21)
  {
    int temperatureScale = self->_temperatureScale;
    if (temperatureScale != [v4 temperatureScale]) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v23 = (*(unsigned int *)&has >> 8) & 1;
  if (v23 != ((v6 >> 8) & 1)) {
    goto LABEL_63;
  }
  if (v23)
  {
    int measurementSystem = self->_measurementSystem;
    if (measurementSystem != [v4 measurementSystem]) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v25 = (*(unsigned int *)&has >> 9) & 1;
  if (v25 != ((v6 >> 9) & 1)) {
    goto LABEL_63;
  }
  if (v25)
  {
    unsigned int installedAppsSignatureLength = self->_installedAppsSignatureLength;
    if (installedAppsSignatureLength != [v4 installedAppsSignatureLength]) {
      goto LABEL_63;
    }
  }
  v27 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self storefrontValue];
  v28 = [v4 storefrontValue];
  v29 = v28;
  if ((v27 == 0) == (v28 != 0))
  {

    goto LABEL_63;
  }
  uint64_t v30 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self storefrontValue];
  if (v30)
  {
    v31 = (void *)v30;
    v32 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self storefrontValue];
    objc_super v33 = [v4 storefrontValue];
    int v34 = [v32 isEqual:v33];

    if (!v34) {
      goto LABEL_63;
    }
  }
  else
  {
  }
  $650077331ADD6EB83ECA1302D4436A84 v35 = self->_has;
  int v36 = (*(unsigned int *)&v35 >> 10) & 1;
  unsigned int v37 = v4[32];
  if (v36 != ((v37 >> 10) & 1))
  {
LABEL_63:
    BOOL v45 = 0;
    goto LABEL_64;
  }
  if (v36)
  {
    int heySiriEnabled = self->_heySiriEnabled;
    if (heySiriEnabled != [v4 heySiriEnabled]) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 v35 = self->_has;
    unsigned int v37 = v4[32];
  }
  int v39 = (*(unsigned int *)&v35 >> 11) & 1;
  if (v39 != ((v37 >> 11) & 1)) {
    goto LABEL_63;
  }
  if (v39)
  {
    unsigned int locationAgeInSeconds = self->_locationAgeInSeconds;
    if (locationAgeInSeconds != [v4 locationAgeInSeconds]) {
      goto LABEL_63;
    }
    $650077331ADD6EB83ECA1302D4436A84 v35 = self->_has;
    unsigned int v37 = v4[32];
  }
  int v41 = (*(unsigned int *)&v35 >> 12) & 1;
  if (v41 != ((v37 >> 12) & 1)) {
    goto LABEL_63;
  }
  if (v41)
  {
    int locationSource = self->_locationSource;
    if (locationSource == [v4 locationSource])
    {
      $650077331ADD6EB83ECA1302D4436A84 v35 = self->_has;
      unsigned int v37 = v4[32];
      goto LABEL_59;
    }
    goto LABEL_63;
  }
LABEL_59:
  int v43 = (*(unsigned int *)&v35 >> 13) & 1;
  if (v43 != ((v37 >> 13) & 1)) {
    goto LABEL_63;
  }
  if (v43)
  {
    int locationPreciseStatus = self->_locationPreciseStatus;
    if (locationPreciseStatus != [v4 locationPreciseStatus]) {
      goto LABEL_63;
    }
  }
  BOOL v45 = 1;
LABEL_64:

  return v45;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteFloatField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
  uint64_t v5 = [(POMMESSchemaPOMMESPegasusQueryMetadata *)self storefrontValue];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x800) == 0)
    {
LABEL_16:
      if ((v6 & 0x1000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    goto LABEL_16;
  }
  PBDataWriterWriteUint32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_17:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
LABEL_18:
  }
    PBDataWriterWriteInt32Field();
LABEL_19:
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusQueryMetadataReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteLocationPreciseStatus
{
  *(_WORD *)&self->_has &= ~0x2000u;
}

- (void)setHasLocationPreciseStatus:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasLocationPreciseStatus
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setLocationPreciseStatus:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_int locationPreciseStatus = a3;
}

- (void)deleteLocationSource
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasLocationSource:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasLocationSource
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setLocationSource:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_int locationSource = a3;
}

- (void)deleteLocationAgeInSeconds
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasLocationAgeInSeconds:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasLocationAgeInSeconds
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setLocationAgeInSeconds:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unsigned int locationAgeInSeconds = a3;
}

- (void)deleteHeySiriEnabled
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasHeySiriEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasHeySiriEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setHeySiriEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int heySiriEnabled = a3;
}

- (void)deleteStorefrontValue
{
}

- (BOOL)hasStorefrontValue
{
  return self->_storefrontValue != 0;
}

- (void)deleteInstalledAppsSignatureLength
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasInstalledAppsSignatureLength:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasInstalledAppsSignatureLength
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setInstalledAppsSignatureLength:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unsigned int installedAppsSignatureLength = a3;
}

- (void)deleteMeasurementSystem
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasMeasurementSystem:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMeasurementSystem
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMeasurementSystem:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int measurementSystem = a3;
}

- (void)deleteTemperatureScale
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasTemperatureScale:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTemperatureScale
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTemperatureScale:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int temperatureScale = a3;
}

- (void)deleteIsNavigationMode
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasIsNavigationMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsNavigationMode
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsNavigationMode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int isNavigationMode = a3;
}

- (void)deleteUiScale
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasUiScale:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasUiScale
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setUiScale:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_float uiScale = a3;
}

- (void)deleteHasSiriLocale
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasHasSiriLocale:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHasSiriLocale
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setHasSiriLocale:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int hasSiriLocale = a3;
}

- (void)deleteHasStorefront
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasHasStorefront:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasHasStorefront
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHasStorefront:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int hasStorefront = a3;
}

- (void)deleteHasCountryCode
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasHasCountryCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHasCountryCode
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setHasCountryCode:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int hasCountryCode = a3;
}

- (void)deleteHasLongitude
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasHasLongitude:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHasLongitude
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setHasLongitude:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int hasLongitude = a3;
}

- (void)deleteHasLatitude
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasHasLatitude:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasHasLatitude
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int hasLatitude = a3;
}

@end