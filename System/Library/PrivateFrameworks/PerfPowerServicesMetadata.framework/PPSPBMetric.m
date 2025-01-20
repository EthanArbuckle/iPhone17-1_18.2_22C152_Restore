@interface PPSPBMetric
- (BOOL)dmaCompliant;
- (BOOL)filterEntryLogging;
- (BOOL)hasAuxiliaryType;
- (BOOL)hasBuild;
- (BOOL)hasCadence;
- (BOOL)hasCategory;
- (BOOL)hasDatatype;
- (BOOL)hasDeviceCapability;
- (BOOL)hasDirectionality;
- (BOOL)hasDmaCompliant;
- (BOOL)hasEnabledPopulation;
- (BOOL)hasEnumMapping;
- (BOOL)hasExampleValue;
- (BOOL)hasFilterEntryLogging;
- (BOOL)hasFixedArraySize;
- (BOOL)hasGroupBy;
- (BOOL)hasMetricDescription;
- (BOOL)hasMetricType;
- (BOOL)hasMode;
- (BOOL)hasName;
- (BOOL)hasObfuscation;
- (BOOL)hasPrivacyClassification;
- (BOOL)hasRounding;
- (BOOL)hasSource;
- (BOOL)hasStorage;
- (BOOL)hasSubsystem;
- (BOOL)hasTimeToLive;
- (BOOL)hasUnit;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)build;
- (NSString)category;
- (NSString)exampleValue;
- (NSString)metricDescription;
- (NSString)name;
- (NSString)subsystem;
- (PPSPBCadence)cadence;
- (PPSPBEnumMapping)enumMapping;
- (PPSPBGroupingDimensions)groupBy;
- (PPSPBMetricType)metricType;
- (PPSPBRounding)rounding;
- (PPSPBSource)source;
- (PPSPBUnit)unit;
- (double)version;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)auxiliaryType;
- (int)datatype;
- (int)deviceCapability;
- (int)directionality;
- (int)enabledPopulation;
- (int)mode;
- (int)obfuscation;
- (int)privacyClassification;
- (int)storage;
- (unint64_t)hash;
- (unsigned)fixedArraySize;
- (unsigned)timeToLive;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAuxiliaryType:(int)a3;
- (void)setBuild:(id)a3;
- (void)setCadence:(id)a3;
- (void)setCategory:(id)a3;
- (void)setDatatype:(int)a3;
- (void)setDeviceCapability:(int)a3;
- (void)setDirectionality:(int)a3;
- (void)setDmaCompliant:(BOOL)a3;
- (void)setEnabledPopulation:(int)a3;
- (void)setEnumMapping:(id)a3;
- (void)setExampleValue:(id)a3;
- (void)setFilterEntryLogging:(BOOL)a3;
- (void)setFixedArraySize:(unsigned int)a3;
- (void)setGroupBy:(id)a3;
- (void)setHasAuxiliaryType:(BOOL)a3;
- (void)setHasDatatype:(BOOL)a3;
- (void)setHasDeviceCapability:(BOOL)a3;
- (void)setHasDirectionality:(BOOL)a3;
- (void)setHasDmaCompliant:(BOOL)a3;
- (void)setHasEnabledPopulation:(BOOL)a3;
- (void)setHasFilterEntryLogging:(BOOL)a3;
- (void)setHasFixedArraySize:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasObfuscation:(BOOL)a3;
- (void)setHasPrivacyClassification:(BOOL)a3;
- (void)setHasStorage:(BOOL)a3;
- (void)setHasTimeToLive:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setMetricDescription:(id)a3;
- (void)setMetricType:(id)a3;
- (void)setMode:(int)a3;
- (void)setName:(id)a3;
- (void)setObfuscation:(int)a3;
- (void)setPrivacyClassification:(int)a3;
- (void)setRounding:(id)a3;
- (void)setSource:(id)a3;
- (void)setStorage:(int)a3;
- (void)setSubsystem:(id)a3;
- (void)setTimeToLive:(unsigned int)a3;
- (void)setUnit:(id)a3;
- (void)setVersion:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPSPBMetric

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasSubsystem
{
  return self->_subsystem != 0;
}

- (BOOL)hasCategory
{
  return self->_category != 0;
}

- (void)setVersion:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasVersion
{
  return *(_WORD *)&self->_has & 1;
}

- (int)datatype
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_datatype;
  }
  else {
    return 0;
  }
}

- (void)setDatatype:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_datatype = a3;
}

- (void)setHasDatatype:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDatatype
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasUnit
{
  return self->_unit != 0;
}

- (BOOL)hasCadence
{
  return self->_cadence != 0;
}

- (int)directionality
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_directionality;
  }
  else {
    return 0;
  }
}

- (void)setDirectionality:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_directionality = a3;
}

- (void)setHasDirectionality:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDirectionality
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (int)storage
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_storage;
  }
  else {
    return 0;
  }
}

- (void)setStorage:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_storage = a3;
}

- (void)setHasStorage:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasStorage
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTimeToLive:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_timeToLive = a3;
}

- (void)setHasTimeToLive:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTimeToLive
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)mode
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_mode;
  }
  else {
    return 4;
  }
}

- (void)setMode:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMode
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasSource
{
  return self->_source != 0;
}

- (int)deviceCapability
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_deviceCapability;
  }
  else {
    return 0;
  }
}

- (void)setDeviceCapability:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_deviceCapability = a3;
}

- (void)setHasDeviceCapability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDeviceCapability
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)enabledPopulation
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_enabledPopulation;
  }
  else {
    return 0;
  }
}

- (void)setEnabledPopulation:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_enabledPopulation = a3;
}

- (void)setHasEnabledPopulation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEnabledPopulation
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasRounding
{
  return self->_rounding != 0;
}

- (int)obfuscation
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_obfuscation;
  }
  else {
    return 0;
  }
}

- (void)setObfuscation:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_obfuscation = a3;
}

- (void)setHasObfuscation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasObfuscation
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasMetricDescription
{
  return self->_metricDescription != 0;
}

- (BOOL)hasExampleValue
{
  return self->_exampleValue != 0;
}

- (BOOL)hasBuild
{
  return self->_build != 0;
}

- (int)privacyClassification
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_privacyClassification;
  }
  else {
    return 0;
  }
}

- (void)setPrivacyClassification:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_privacyClassification = a3;
}

- (void)setHasPrivacyClassification:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPrivacyClassification
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasEnumMapping
{
  return self->_enumMapping != 0;
}

- (BOOL)hasGroupBy
{
  return self->_groupBy != 0;
}

- (BOOL)hasMetricType
{
  return self->_metricType != 0;
}

- (int)auxiliaryType
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_auxiliaryType;
  }
  else {
    return 0;
  }
}

- (void)setAuxiliaryType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_auxiliaryType = a3;
}

- (void)setHasAuxiliaryType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAuxiliaryType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFilterEntryLogging:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_filterEntryLogging = a3;
}

- (void)setHasFilterEntryLogging:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasFilterEntryLogging
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setDmaCompliant:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_dmaCompliant = a3;
}

- (void)setHasDmaCompliant:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasDmaCompliant
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setFixedArraySize:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_fixedArraySize = a3;
}

- (void)setHasFixedArraySize:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFixedArraySize
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPSPBMetric;
  v4 = [(PPSPBMetric *)&v8 description];
  v5 = [(PPSPBMetric *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  subsystem = self->_subsystem;
  if (subsystem) {
    [v4 setObject:subsystem forKey:@"subsystem"];
  }
  category = self->_category;
  if (category) {
    [v4 setObject:category forKey:@"category"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_version];
    [v4 setObject:v9 forKey:@"version"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    v10 = [NSNumber numberWithInt:self->_datatype];
    [v4 setObject:v10 forKey:@"datatype"];
  }
  unit = self->_unit;
  if (unit)
  {
    v12 = [(PPSPBUnit *)unit dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"unit"];
  }
  cadence = self->_cadence;
  if (cadence)
  {
    v14 = [(PPSPBCadence *)cadence dictionaryRepresentation];
    [v4 setObject:v14 forKey:@"cadence"];
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x10) != 0)
  {
    v38 = [NSNumber numberWithInt:self->_directionality];
    [v4 setObject:v38 forKey:@"directionality"];

    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x400) == 0)
    {
LABEL_17:
      if ((v15 & 0x800) == 0) {
        goto LABEL_18;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_17;
  }
  v39 = [NSNumber numberWithInt:self->_storage];
  [v4 setObject:v39 forKey:@"storage"];

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x800) == 0)
  {
LABEL_18:
    if ((v15 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_54:
  v40 = [NSNumber numberWithUnsignedInt:self->_timeToLive];
  [v4 setObject:v40 forKey:@"timeToLive"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_19:
    v16 = [NSNumber numberWithInt:self->_mode];
    [v4 setObject:v16 forKey:@"mode"];
  }
LABEL_20:
  source = self->_source;
  if (source)
  {
    v18 = [(PPSPBSource *)source dictionaryRepresentation];
    [v4 setObject:v18 forKey:@"source"];
  }
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 8) != 0)
  {
    v20 = [NSNumber numberWithInt:self->_deviceCapability];
    [v4 setObject:v20 forKey:@"deviceCapability"];

    __int16 v19 = (__int16)self->_has;
  }
  if ((v19 & 0x20) != 0)
  {
    v21 = [NSNumber numberWithInt:self->_enabledPopulation];
    [v4 setObject:v21 forKey:@"enabledPopulation"];
  }
  rounding = self->_rounding;
  if (rounding)
  {
    v23 = [(PPSPBRounding *)rounding dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"rounding"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v24 = [NSNumber numberWithInt:self->_obfuscation];
    [v4 setObject:v24 forKey:@"obfuscation"];
  }
  metricDescription = self->_metricDescription;
  if (metricDescription) {
    [v4 setObject:metricDescription forKey:@"metricDescription"];
  }
  exampleValue = self->_exampleValue;
  if (exampleValue) {
    [v4 setObject:exampleValue forKey:@"exampleValue"];
  }
  build = self->_build;
  if (build) {
    [v4 setObject:build forKey:@"build"];
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v28 = [NSNumber numberWithInt:self->_privacyClassification];
    [v4 setObject:v28 forKey:@"privacyClassification"];
  }
  enumMapping = self->_enumMapping;
  if (enumMapping)
  {
    v30 = [(PPSPBEnumMapping *)enumMapping dictionaryRepresentation];
    [v4 setObject:v30 forKey:@"enumMapping"];
  }
  groupBy = self->_groupBy;
  if (groupBy)
  {
    v32 = [(PPSPBGroupingDimensions *)groupBy dictionaryRepresentation];
    [v4 setObject:v32 forKey:@"groupBy"];
  }
  metricType = self->_metricType;
  if (metricType)
  {
    v34 = [(PPSPBMetricType *)metricType dictionaryRepresentation];
    [v4 setObject:v34 forKey:@"metricType"];
  }
  __int16 v35 = (__int16)self->_has;
  if ((v35 & 2) != 0)
  {
    v41 = [NSNumber numberWithInt:self->_auxiliaryType];
    [v4 setObject:v41 forKey:@"auxiliaryType"];

    __int16 v35 = (__int16)self->_has;
    if ((v35 & 0x2000) == 0)
    {
LABEL_46:
      if ((v35 & 0x1000) == 0) {
        goto LABEL_47;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_46;
  }
  v42 = [NSNumber numberWithBool:self->_filterEntryLogging];
  [v4 setObject:v42 forKey:@"filterEntryLogging"];

  __int16 v35 = (__int16)self->_has;
  if ((v35 & 0x1000) == 0)
  {
LABEL_47:
    if ((v35 & 0x40) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_58:
  v43 = [NSNumber numberWithBool:self->_dmaCompliant];
  [v4 setObject:v43 forKey:@"dmaCompliant"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_48:
    v36 = [NSNumber numberWithUnsignedInt:self->_fixedArraySize];
    [v4 setObject:v36 forKey:@"fixedArraySize"];
  }
LABEL_49:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPSPBMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_subsystem)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_category)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v9;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
  if (self->_unit)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  if (self->_cadence)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_17:
      if ((v6 & 0x800) == 0) {
        goto LABEL_18;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v9;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_18:
    if ((v6 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  id v4 = v9;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_19:
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
LABEL_20:
  if (self->_source)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
  if (self->_rounding)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
  if (self->_metricDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_exampleValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_build)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
  if (self->_enumMapping)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  if (self->_groupBy)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  if (self->_metricType)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x2000) == 0)
    {
LABEL_46:
      if ((v8 & 0x1000) == 0) {
        goto LABEL_47;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_46;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x1000) == 0)
  {
LABEL_47:
    if ((v8 & 0x40) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_48:
    PBDataWriterWriteUint32Field();
    id v4 = v9;
  }
LABEL_49:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v9;
  }
  if (self->_subsystem)
  {
    objc_msgSend(v9, "setSubsystem:");
    id v4 = v9;
  }
  if (self->_category)
  {
    objc_msgSend(v9, "setCategory:");
    id v4 = v9;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_version;
    *((_WORD *)v4 + 94) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 12) = self->_datatype;
    *((_WORD *)v4 + 94) |= 4u;
  }
  if (self->_unit)
  {
    objc_msgSend(v9, "setUnit:");
    id v4 = v9;
  }
  if (self->_cadence)
  {
    objc_msgSend(v9, "setCadence:");
    id v4 = v9;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_directionality;
    *((_WORD *)v4 + 94) |= 0x10u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_17:
      if ((v6 & 0x800) == 0) {
        goto LABEL_18;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_17;
  }
  *((_DWORD *)v4 + 38) = self->_storage;
  *((_WORD *)v4 + 94) |= 0x400u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
LABEL_18:
    if ((v6 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_54:
  *((_DWORD *)v4 + 42) = self->_timeToLive;
  *((_WORD *)v4 + 94) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_19:
    *((_DWORD *)v4 + 28) = self->_mode;
    *((_WORD *)v4 + 94) |= 0x80u;
  }
LABEL_20:
  if (self->_source)
  {
    objc_msgSend(v9, "setSource:");
    id v4 = v9;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 8) != 0)
  {
    *((_DWORD *)v4 + 13) = self->_deviceCapability;
    *((_WORD *)v4 + 94) |= 8u;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x20) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_enabledPopulation;
    *((_WORD *)v4 + 94) |= 0x20u;
  }
  if (self->_rounding)
  {
    objc_msgSend(v9, "setRounding:");
    id v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)v4 + 32) = self->_obfuscation;
    *((_WORD *)v4 + 94) |= 0x100u;
  }
  if (self->_metricDescription)
  {
    objc_msgSend(v9, "setMetricDescription:");
    id v4 = v9;
  }
  if (self->_exampleValue)
  {
    objc_msgSend(v9, "setExampleValue:");
    id v4 = v9;
  }
  if (self->_build)
  {
    objc_msgSend(v9, "setBuild:");
    id v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 33) = self->_privacyClassification;
    *((_WORD *)v4 + 94) |= 0x200u;
  }
  if (self->_enumMapping)
  {
    objc_msgSend(v9, "setEnumMapping:");
    id v4 = v9;
  }
  if (self->_groupBy)
  {
    objc_msgSend(v9, "setGroupBy:");
    id v4 = v9;
  }
  if (self->_metricType)
  {
    objc_msgSend(v9, "setMetricType:");
    id v4 = v9;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_auxiliaryType;
    *((_WORD *)v4 + 94) |= 2u;
    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x2000) == 0)
    {
LABEL_46:
      if ((v8 & 0x1000) == 0) {
        goto LABEL_47;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_46;
  }
  *((unsigned char *)v4 + 185) = self->_filterEntryLogging;
  *((_WORD *)v4 + 94) |= 0x2000u;
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x1000) == 0)
  {
LABEL_47:
    if ((v8 & 0x40) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_58:
  *((unsigned char *)v4 + 184) = self->_dmaCompliant;
  *((_WORD *)v4 + 94) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_48:
    *((_DWORD *)v4 + 20) = self->_fixedArraySize;
    *((_WORD *)v4 + 94) |= 0x40u;
  }
LABEL_49:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v6;

  uint64_t v8 = [(NSString *)self->_subsystem copyWithZone:a3];
  id v9 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v8;

  uint64_t v10 = [(NSString *)self->_category copyWithZone:a3];
  v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_version;
    *(_WORD *)(v5 + 188) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_datatype;
    *(_WORD *)(v5 + 188) |= 4u;
  }
  id v13 = [(PPSPBUnit *)self->_unit copyWithZone:a3];
  v14 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v13;

  id v15 = [(PPSPBCadence *)self->_cadence copyWithZone:a3];
  v16 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_directionality;
    *(_WORD *)(v5 + 188) |= 0x10u;
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 0x400) == 0)
    {
LABEL_7:
      if ((v17 & 0x800) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 152) = self->_storage;
  *(_WORD *)(v5 + 188) |= 0x400u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x800) == 0)
  {
LABEL_8:
    if ((v17 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_26:
  *(_DWORD *)(v5 + 168) = self->_timeToLive;
  *(_WORD *)(v5 + 188) |= 0x800u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 112) = self->_mode;
    *(_WORD *)(v5 + 188) |= 0x80u;
  }
LABEL_10:
  id v18 = [(PPSPBSource *)self->_source copyWithZone:a3];
  __int16 v19 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v18;

  __int16 v20 = (__int16)self->_has;
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_deviceCapability;
    *(_WORD *)(v5 + 188) |= 8u;
    __int16 v20 = (__int16)self->_has;
  }
  if ((v20 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_enabledPopulation;
    *(_WORD *)(v5 + 188) |= 0x20u;
  }
  id v21 = [(PPSPBRounding *)self->_rounding copyWithZone:a3];
  v22 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v21;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_obfuscation;
    *(_WORD *)(v5 + 188) |= 0x100u;
  }
  uint64_t v23 = [(NSString *)self->_metricDescription copyWithZone:a3];
  v24 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v23;

  uint64_t v25 = [(NSString *)self->_exampleValue copyWithZone:a3];
  v26 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v25;

  uint64_t v27 = [(NSString *)self->_build copyWithZone:a3];
  v28 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v27;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_privacyClassification;
    *(_WORD *)(v5 + 188) |= 0x200u;
  }
  id v29 = [(PPSPBEnumMapping *)self->_enumMapping copyWithZone:a3];
  v30 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v29;

  id v31 = [(PPSPBGroupingDimensions *)self->_groupBy copyWithZone:a3];
  v32 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v31;

  id v33 = [(PPSPBMetricType *)self->_metricType copyWithZone:a3];
  v34 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v33;

  __int16 v35 = (__int16)self->_has;
  if ((v35 & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_auxiliaryType;
    *(_WORD *)(v5 + 188) |= 2u;
    __int16 v35 = (__int16)self->_has;
    if ((v35 & 0x2000) == 0)
    {
LABEL_20:
      if ((v35 & 0x1000) == 0) {
        goto LABEL_21;
      }
LABEL_30:
      *(unsigned char *)(v5 + 184) = self->_dmaCompliant;
      *(_WORD *)(v5 + 188) |= 0x1000u;
      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        return (id)v5;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x2000) == 0)
  {
    goto LABEL_20;
  }
  *(unsigned char *)(v5 + 185) = self->_filterEntryLogging;
  *(_WORD *)(v5 + 188) |= 0x2000u;
  __int16 v35 = (__int16)self->_has;
  if ((v35 & 0x1000) != 0) {
    goto LABEL_30;
  }
LABEL_21:
  if ((v35 & 0x40) != 0)
  {
LABEL_22:
    *(_DWORD *)(v5 + 80) = self->_fixedArraySize;
    *(_WORD *)(v5 + 188) |= 0x40u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_106;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_106;
    }
  }
  subsystem = self->_subsystem;
  if ((unint64_t)subsystem | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](subsystem, "isEqual:")) {
      goto LABEL_106;
    }
  }
  category = self->_category;
  if ((unint64_t)category | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](category, "isEqual:")) {
      goto LABEL_106;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v9 = *((_WORD *)v4 + 94);
  if (has)
  {
    if ((v9 & 1) == 0 || self->_version != *((double *)v4 + 1)) {
      goto LABEL_106;
    }
  }
  else if (v9)
  {
    goto LABEL_106;
  }
  if ((has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_datatype != *((_DWORD *)v4 + 12)) {
      goto LABEL_106;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_106;
  }
  unit = self->_unit;
  if ((unint64_t)unit | *((void *)v4 + 22) && !-[PPSPBUnit isEqual:](unit, "isEqual:")) {
    goto LABEL_106;
  }
  cadence = self->_cadence;
  if ((unint64_t)cadence | *((void *)v4 + 4))
  {
    if (!-[PPSPBCadence isEqual:](cadence, "isEqual:")) {
      goto LABEL_106;
    }
  }
  __int16 v12 = (__int16)self->_has;
  __int16 v13 = *((_WORD *)v4 + 94);
  if ((v12 & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_directionality != *((_DWORD *)v4 + 14)) {
      goto LABEL_106;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x400) == 0 || self->_storage != *((_DWORD *)v4 + 38)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x400) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x800) == 0 || self->_timeToLive != *((_DWORD *)v4 + 42)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x800) != 0)
  {
    goto LABEL_106;
  }
  if ((v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_mode != *((_DWORD *)v4 + 28)) {
      goto LABEL_106;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  source = self->_source;
  if ((unint64_t)source | *((void *)v4 + 18))
  {
    if (!-[PPSPBSource isEqual:](source, "isEqual:")) {
      goto LABEL_106;
    }
    __int16 v12 = (__int16)self->_has;
  }
  __int16 v15 = *((_WORD *)v4 + 94);
  if ((v12 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_deviceCapability != *((_DWORD *)v4 + 13)) {
      goto LABEL_106;
    }
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((v12 & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_enabledPopulation != *((_DWORD *)v4 + 15)) {
      goto LABEL_106;
    }
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  rounding = self->_rounding;
  if ((unint64_t)rounding | *((void *)v4 + 17))
  {
    if (!-[PPSPBRounding isEqual:](rounding, "isEqual:")) {
      goto LABEL_106;
    }
    __int16 v12 = (__int16)self->_has;
  }
  if ((v12 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x100) == 0 || self->_obfuscation != *((_DWORD *)v4 + 32)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x100) != 0)
  {
    goto LABEL_106;
  }
  metricDescription = self->_metricDescription;
  if ((unint64_t)metricDescription | *((void *)v4 + 12)
    && !-[NSString isEqual:](metricDescription, "isEqual:"))
  {
    goto LABEL_106;
  }
  exampleValue = self->_exampleValue;
  if ((unint64_t)exampleValue | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](exampleValue, "isEqual:")) {
      goto LABEL_106;
    }
  }
  build = self->_build;
  if ((unint64_t)build | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](build, "isEqual:")) {
      goto LABEL_106;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x200) == 0 || self->_privacyClassification != *((_DWORD *)v4 + 33)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
    goto LABEL_106;
  }
  enumMapping = self->_enumMapping;
  if ((unint64_t)enumMapping | *((void *)v4 + 8) && !-[PPSPBEnumMapping isEqual:](enumMapping, "isEqual:")) {
    goto LABEL_106;
  }
  groupBy = self->_groupBy;
  if ((unint64_t)groupBy | *((void *)v4 + 11))
  {
    if (!-[PPSPBGroupingDimensions isEqual:](groupBy, "isEqual:")) {
      goto LABEL_106;
    }
  }
  metricType = self->_metricType;
  if ((unint64_t)metricType | *((void *)v4 + 13))
  {
    if (!-[PPSPBMetricType isEqual:](metricType, "isEqual:")) {
      goto LABEL_106;
    }
  }
  __int16 v23 = (__int16)self->_has;
  __int16 v24 = *((_WORD *)v4 + 94);
  if ((v23 & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_auxiliaryType != *((_DWORD *)v4 + 4)) {
      goto LABEL_106;
    }
  }
  else if ((v24 & 2) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x2000) == 0) {
      goto LABEL_106;
    }
    if (self->_filterEntryLogging)
    {
      if (!*((unsigned char *)v4 + 185)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 185))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x2000) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x1000) != 0)
    {
      if (self->_dmaCompliant)
      {
        if (!*((unsigned char *)v4 + 184)) {
          goto LABEL_106;
        }
        goto LABEL_101;
      }
      if (!*((unsigned char *)v4 + 184)) {
        goto LABEL_101;
      }
    }
LABEL_106:
    BOOL v25 = 0;
    goto LABEL_107;
  }
  if ((*((_WORD *)v4 + 94) & 0x1000) != 0) {
    goto LABEL_106;
  }
LABEL_101:
  if ((v23 & 0x40) != 0)
  {
    if ((v24 & 0x40) == 0 || self->_fixedArraySize != *((_DWORD *)v4 + 20)) {
      goto LABEL_106;
    }
    BOOL v25 = 1;
  }
  else
  {
    BOOL v25 = (v24 & 0x40) == 0;
  }
LABEL_107:

  return v25;
}

- (unint64_t)hash
{
  NSUInteger v39 = [(NSString *)self->_name hash];
  NSUInteger v38 = [(NSString *)self->_subsystem hash];
  NSUInteger v37 = [(NSString *)self->_category hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    double version = self->_version;
    double v6 = -version;
    if (version >= 0.0) {
      double v6 = self->_version;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v36 = v4;
  if ((has & 4) != 0) {
    uint64_t v35 = 2654435761 * self->_datatype;
  }
  else {
    uint64_t v35 = 0;
  }
  unint64_t v34 = [(PPSPBUnit *)self->_unit hash];
  unint64_t v33 = [(PPSPBCadence *)self->_cadence hash];
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x10) != 0)
  {
    uint64_t v32 = 2654435761 * self->_directionality;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_14:
      uint64_t v31 = 2654435761 * self->_storage;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_15;
      }
LABEL_19:
      uint64_t v30 = 0;
      if ((v9 & 0x80) != 0) {
        goto LABEL_16;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v31 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  uint64_t v30 = 2654435761 * self->_timeToLive;
  if ((v9 & 0x80) != 0)
  {
LABEL_16:
    uint64_t v29 = 2654435761 * self->_mode;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v29 = 0;
LABEL_21:
  unint64_t v28 = [(PPSPBSource *)self->_source hash];
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    uint64_t v27 = 2654435761 * self->_deviceCapability;
    if ((v10 & 0x20) != 0) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v27 = 0;
    if ((v10 & 0x20) != 0)
    {
LABEL_23:
      uint64_t v26 = 2654435761 * self->_enabledPopulation;
      goto LABEL_26;
    }
  }
  uint64_t v26 = 0;
LABEL_26:
  unint64_t v25 = [(PPSPBRounding *)self->_rounding hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v11 = 2654435761 * self->_obfuscation;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = [(NSString *)self->_metricDescription hash];
  NSUInteger v13 = [(NSString *)self->_exampleValue hash];
  NSUInteger v14 = [(NSString *)self->_build hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    uint64_t v15 = 2654435761 * self->_privacyClassification;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v16 = [(PPSPBEnumMapping *)self->_enumMapping hash];
  unint64_t v17 = [(PPSPBGroupingDimensions *)self->_groupBy hash];
  unint64_t v18 = [(PPSPBMetricType *)self->_metricType hash];
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 2) != 0)
  {
    uint64_t v20 = 2654435761 * self->_auxiliaryType;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_34:
      uint64_t v21 = 2654435761 * self->_filterEntryLogging;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_35;
      }
LABEL_39:
      uint64_t v22 = 0;
      if ((v19 & 0x40) != 0) {
        goto LABEL_36;
      }
LABEL_40:
      uint64_t v23 = 0;
      return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_34;
    }
  }
  uint64_t v21 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_39;
  }
LABEL_35:
  uint64_t v22 = 2654435761 * self->_dmaCompliant;
  if ((v19 & 0x40) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v23 = 2654435761 * self->_fixedArraySize;
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v23 = v4;
  if (*((void *)v4 + 15))
  {
    -[PPSPBMetric setName:](self, "setName:");
    id v4 = v23;
  }
  if (*((void *)v4 + 20))
  {
    -[PPSPBMetric setSubsystem:](self, "setSubsystem:");
    id v4 = v23;
  }
  if (*((void *)v4 + 5))
  {
    -[PPSPBMetric setCategory:](self, "setCategory:");
    id v4 = v23;
  }
  __int16 v5 = *((_WORD *)v4 + 94);
  if (v5)
  {
    self->_double version = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 94);
  }
  if ((v5 & 4) != 0)
  {
    self->_datatype = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 4u;
  }
  unit = self->_unit;
  uint64_t v7 = *((void *)v4 + 22);
  if (unit)
  {
    if (!v7) {
      goto LABEL_17;
    }
    -[PPSPBUnit mergeFrom:](unit, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_17;
    }
    -[PPSPBMetric setUnit:](self, "setUnit:");
  }
  id v4 = v23;
LABEL_17:
  cadence = self->_cadence;
  uint64_t v9 = *((void *)v4 + 4);
  if (cadence)
  {
    if (!v9) {
      goto LABEL_23;
    }
    -[PPSPBCadence mergeFrom:](cadence, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_23;
    }
    -[PPSPBMetric setCadence:](self, "setCadence:");
  }
  id v4 = v23;
LABEL_23:
  __int16 v10 = *((_WORD *)v4 + 94);
  if ((v10 & 0x10) != 0)
  {
    self->_directionality = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v10 = *((_WORD *)v4 + 94);
    if ((v10 & 0x400) == 0)
    {
LABEL_25:
      if ((v10 & 0x800) == 0) {
        goto LABEL_26;
      }
      goto LABEL_33;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x400) == 0)
  {
    goto LABEL_25;
  }
  self->_storage = *((_DWORD *)v4 + 38);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v10 = *((_WORD *)v4 + 94);
  if ((v10 & 0x800) == 0)
  {
LABEL_26:
    if ((v10 & 0x80) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_33:
  self->_timeToLive = *((_DWORD *)v4 + 42);
  *(_WORD *)&self->_has |= 0x800u;
  if ((*((_WORD *)v4 + 94) & 0x80) != 0)
  {
LABEL_27:
    self->_mode = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_28:
  source = self->_source;
  uint64_t v12 = *((void *)v4 + 18);
  if (source)
  {
    if (!v12) {
      goto LABEL_38;
    }
    -[PPSPBSource mergeFrom:](source, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_38;
    }
    -[PPSPBMetric setSource:](self, "setSource:");
  }
  id v4 = v23;
LABEL_38:
  __int16 v13 = *((_WORD *)v4 + 94);
  if ((v13 & 8) != 0)
  {
    self->_deviceCapability = *((_DWORD *)v4 + 13);
    *(_WORD *)&self->_has |= 8u;
    __int16 v13 = *((_WORD *)v4 + 94);
  }
  if ((v13 & 0x20) != 0)
  {
    self->_enabledPopulation = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 0x20u;
  }
  rounding = self->_rounding;
  uint64_t v15 = *((void *)v4 + 17);
  if (rounding)
  {
    if (!v15) {
      goto LABEL_48;
    }
    -[PPSPBRounding mergeFrom:](rounding, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_48;
    }
    -[PPSPBMetric setRounding:](self, "setRounding:");
  }
  id v4 = v23;
LABEL_48:
  if ((*((_WORD *)v4 + 94) & 0x100) != 0)
  {
    self->_obfuscation = *((_DWORD *)v4 + 32);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 12))
  {
    -[PPSPBMetric setMetricDescription:](self, "setMetricDescription:");
    id v4 = v23;
  }
  if (*((void *)v4 + 9))
  {
    -[PPSPBMetric setExampleValue:](self, "setExampleValue:");
    id v4 = v23;
  }
  if (*((void *)v4 + 3))
  {
    -[PPSPBMetric setBuild:](self, "setBuild:");
    id v4 = v23;
  }
  if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
    self->_privacyClassification = *((_DWORD *)v4 + 33);
    *(_WORD *)&self->_has |= 0x200u;
  }
  enumMapping = self->_enumMapping;
  uint64_t v17 = *((void *)v4 + 8);
  if (enumMapping)
  {
    if (!v17) {
      goto LABEL_64;
    }
    -[PPSPBEnumMapping mergeFrom:](enumMapping, "mergeFrom:");
  }
  else
  {
    if (!v17) {
      goto LABEL_64;
    }
    -[PPSPBMetric setEnumMapping:](self, "setEnumMapping:");
  }
  id v4 = v23;
LABEL_64:
  groupBy = self->_groupBy;
  uint64_t v19 = *((void *)v4 + 11);
  if (groupBy)
  {
    if (!v19) {
      goto LABEL_70;
    }
    -[PPSPBGroupingDimensions mergeFrom:](groupBy, "mergeFrom:");
  }
  else
  {
    if (!v19) {
      goto LABEL_70;
    }
    -[PPSPBMetric setGroupBy:](self, "setGroupBy:");
  }
  id v4 = v23;
LABEL_70:
  metricType = self->_metricType;
  uint64_t v21 = *((void *)v4 + 13);
  if (metricType)
  {
    if (!v21) {
      goto LABEL_76;
    }
    -[PPSPBMetricType mergeFrom:](metricType, "mergeFrom:");
  }
  else
  {
    if (!v21) {
      goto LABEL_76;
    }
    -[PPSPBMetric setMetricType:](self, "setMetricType:");
  }
  id v4 = v23;
LABEL_76:
  __int16 v22 = *((_WORD *)v4 + 94);
  if ((v22 & 2) != 0)
  {
    self->_auxiliaryType = *((_DWORD *)v4 + 4);
    *(_WORD *)&self->_has |= 2u;
    __int16 v22 = *((_WORD *)v4 + 94);
    if ((v22 & 0x2000) == 0)
    {
LABEL_78:
      if ((v22 & 0x1000) == 0) {
        goto LABEL_79;
      }
      goto LABEL_86;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x2000) == 0)
  {
    goto LABEL_78;
  }
  self->_filterEntryLogging = *((unsigned char *)v4 + 185);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v22 = *((_WORD *)v4 + 94);
  if ((v22 & 0x1000) == 0)
  {
LABEL_79:
    if ((v22 & 0x40) == 0) {
      goto LABEL_81;
    }
    goto LABEL_80;
  }
LABEL_86:
  self->_dmaCompliant = *((unsigned char *)v4 + 184);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v4 + 94) & 0x40) != 0)
  {
LABEL_80:
    self->_fixedArraySize = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_81:
  MEMORY[0x270F9A758]();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)subsystem
{
  return self->_subsystem;
}

- (void)setSubsystem:(id)a3
{
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
}

- (double)version
{
  return self->_version;
}

- (PPSPBUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (PPSPBCadence)cadence
{
  return self->_cadence;
}

- (void)setCadence:(id)a3
{
}

- (unsigned)timeToLive
{
  return self->_timeToLive;
}

- (PPSPBSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (PPSPBRounding)rounding
{
  return self->_rounding;
}

- (void)setRounding:(id)a3
{
}

- (NSString)metricDescription
{
  return self->_metricDescription;
}

- (void)setMetricDescription:(id)a3
{
}

- (NSString)exampleValue
{
  return self->_exampleValue;
}

- (void)setExampleValue:(id)a3
{
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (PPSPBEnumMapping)enumMapping
{
  return self->_enumMapping;
}

- (void)setEnumMapping:(id)a3
{
}

- (PPSPBGroupingDimensions)groupBy
{
  return self->_groupBy;
}

- (void)setGroupBy:(id)a3
{
}

- (PPSPBMetricType)metricType
{
  return self->_metricType;
}

- (void)setMetricType:(id)a3
{
}

- (BOOL)filterEntryLogging
{
  return self->_filterEntryLogging;
}

- (BOOL)dmaCompliant
{
  return self->_dmaCompliant;
}

- (unsigned)fixedArraySize
{
  return self->_fixedArraySize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_rounding, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_metricType, 0);
  objc_storeStrong((id *)&self->_metricDescription, 0);
  objc_storeStrong((id *)&self->_groupBy, 0);
  objc_storeStrong((id *)&self->_exampleValue, 0);
  objc_storeStrong((id *)&self->_enumMapping, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_cadence, 0);
  objc_storeStrong((id *)&self->_build, 0);
}

@end