@interface ATXPBInfoSuggestion
- (BOOL)hasAppBundleIdentifier;
- (BOOL)hasArchivedIntent;
- (BOOL)hasArchivedIntentDescription;
- (BOOL)hasArchivedMetadata;
- (BOOL)hasClientModelId;
- (BOOL)hasConfidenceLevel;
- (BOOL)hasCriterion;
- (BOOL)hasEndDate;
- (BOOL)hasLayouts;
- (BOOL)hasRelevanceScore;
- (BOOL)hasSourceIdentifier;
- (BOOL)hasStartDate;
- (BOOL)hasSuggestionIdentifier;
- (BOOL)hasWidgetBundleIdentifier;
- (BOOL)hasWidgetKind;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)archivedIntent;
- (NSData)archivedIntentDescription;
- (NSData)archivedMetadata;
- (NSString)appBundleIdentifier;
- (NSString)clientModelId;
- (NSString)criterion;
- (NSString)sourceIdentifier;
- (NSString)suggestionIdentifier;
- (NSString)widgetBundleIdentifier;
- (NSString)widgetKind;
- (double)endDate;
- (double)relevanceScore;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)confidenceLevel;
- (int64_t)layouts;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setArchivedIntent:(id)a3;
- (void)setArchivedIntentDescription:(id)a3;
- (void)setArchivedMetadata:(id)a3;
- (void)setClientModelId:(id)a3;
- (void)setConfidenceLevel:(int64_t)a3;
- (void)setCriterion:(id)a3;
- (void)setEndDate:(double)a3;
- (void)setHasConfidenceLevel:(BOOL)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasLayouts:(BOOL)a3;
- (void)setHasRelevanceScore:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setLayouts:(int64_t)a3;
- (void)setRelevanceScore:(double)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setStartDate:(double)a3;
- (void)setSuggestionIdentifier:(id)a3;
- (void)setWidgetBundleIdentifier:(id)a3;
- (void)setWidgetKind:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBInfoSuggestion

- (BOOL)hasAppBundleIdentifier
{
  return self->_appBundleIdentifier != 0;
}

- (BOOL)hasWidgetBundleIdentifier
{
  return self->_widgetBundleIdentifier != 0;
}

- (BOOL)hasWidgetKind
{
  return self->_widgetKind != 0;
}

- (void)setLayouts:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_layouts = a3;
}

- (void)setHasLayouts:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLayouts
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSuggestionIdentifier
{
  return self->_suggestionIdentifier != 0;
}

- (BOOL)hasClientModelId
{
  return self->_clientModelId != 0;
}

- (BOOL)hasArchivedIntent
{
  return self->_archivedIntent != 0;
}

- (BOOL)hasArchivedMetadata
{
  return self->_archivedMetadata != 0;
}

- (BOOL)hasSourceIdentifier
{
  return self->_sourceIdentifier != 0;
}

- (void)setConfidenceLevel:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidenceLevel = a3;
}

- (void)setHasConfidenceLevel:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidenceLevel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRelevanceScore:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_relevanceScore = a3;
}

- (void)setHasRelevanceScore:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasRelevanceScore
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasCriterion
{
  return self->_criterion != 0;
}

- (BOOL)hasArchivedIntentDescription
{
  return self->_archivedIntentDescription != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBInfoSuggestion;
  v4 = [(ATXPBInfoSuggestion *)&v8 description];
  v5 = [(ATXPBInfoSuggestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  appBundleIdentifier = self->_appBundleIdentifier;
  if (appBundleIdentifier) {
    [v3 setObject:appBundleIdentifier forKey:@"appBundleIdentifier"];
  }
  widgetBundleIdentifier = self->_widgetBundleIdentifier;
  if (widgetBundleIdentifier) {
    [v4 setObject:widgetBundleIdentifier forKey:@"widgetBundleIdentifier"];
  }
  widgetKind = self->_widgetKind;
  if (widgetKind) {
    [v4 setObject:widgetKind forKey:@"widgetKind"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_layouts];
    [v4 setObject:v8 forKey:@"layouts"];
  }
  suggestionIdentifier = self->_suggestionIdentifier;
  if (suggestionIdentifier) {
    [v4 setObject:suggestionIdentifier forKey:@"suggestionIdentifier"];
  }
  clientModelId = self->_clientModelId;
  if (clientModelId) {
    [v4 setObject:clientModelId forKey:@"clientModelId"];
  }
  archivedIntent = self->_archivedIntent;
  if (archivedIntent) {
    [v4 setObject:archivedIntent forKey:@"archivedIntent"];
  }
  archivedMetadata = self->_archivedMetadata;
  if (archivedMetadata) {
    [v4 setObject:archivedMetadata forKey:@"archivedMetadata"];
  }
  sourceIdentifier = self->_sourceIdentifier;
  if (sourceIdentifier) {
    [v4 setObject:sourceIdentifier forKey:@"sourceIdentifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v19 = [NSNumber numberWithLongLong:self->_confidenceLevel];
    [v4 setObject:v19 forKey:@"confidenceLevel"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0) {
        goto LABEL_22;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_21;
  }
  v20 = [NSNumber numberWithDouble:self->_relevanceScore];
  [v4 setObject:v20 forKey:@"relevanceScore"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_22:
    if ((has & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_33:
  v21 = [NSNumber numberWithDouble:self->_startDate];
  [v4 setObject:v21 forKey:@"startDate"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_23:
    v15 = [NSNumber numberWithDouble:self->_endDate];
    [v4 setObject:v15 forKey:@"endDate"];
  }
LABEL_24:
  criterion = self->_criterion;
  if (criterion) {
    [v4 setObject:criterion forKey:@"criterion"];
  }
  archivedIntentDescription = self->_archivedIntentDescription;
  if (archivedIntentDescription) {
    [v4 setObject:archivedIntentDescription forKey:@"archivedIntentDescription"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBInfoSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_appBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_widgetBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_widgetKind)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_suggestionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_clientModelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_archivedIntent)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_archivedMetadata)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_sourceIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0) {
        goto LABEL_22;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_22:
    if ((has & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_23:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_24:
  if (self->_criterion)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_archivedIntentDescription)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_appBundleIdentifier)
  {
    objc_msgSend(v4, "setAppBundleIdentifier:");
    id v4 = v6;
  }
  if (self->_widgetBundleIdentifier)
  {
    objc_msgSend(v6, "setWidgetBundleIdentifier:");
    id v4 = v6;
  }
  if (self->_widgetKind)
  {
    objc_msgSend(v6, "setWidgetKind:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_layouts;
    *((unsigned char *)v4 + 128) |= 4u;
  }
  if (self->_suggestionIdentifier)
  {
    objc_msgSend(v6, "setSuggestionIdentifier:");
    id v4 = v6;
  }
  if (self->_clientModelId)
  {
    objc_msgSend(v6, "setClientModelId:");
    id v4 = v6;
  }
  if (self->_archivedIntent)
  {
    objc_msgSend(v6, "setArchivedIntent:");
    id v4 = v6;
  }
  if (self->_archivedMetadata)
  {
    objc_msgSend(v6, "setArchivedMetadata:");
    id v4 = v6;
  }
  if (self->_sourceIdentifier)
  {
    objc_msgSend(v6, "setSourceIdentifier:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_confidenceLevel;
    *((unsigned char *)v4 + 128) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_21:
      if ((has & 0x10) == 0) {
        goto LABEL_22;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_21;
  }
  *((void *)v4 + 4) = *(void *)&self->_relevanceScore;
  *((unsigned char *)v4 + 128) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_22:
    if ((has & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_33:
  *((void *)v4 + 5) = *(void *)&self->_startDate;
  *((unsigned char *)v4 + 128) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_23:
    *((void *)v4 + 2) = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 128) |= 2u;
  }
LABEL_24:
  if (self->_criterion)
  {
    objc_msgSend(v6, "setCriterion:");
    id v4 = v6;
  }
  if (self->_archivedIntentDescription)
  {
    objc_msgSend(v6, "setArchivedIntentDescription:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_appBundleIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_widgetBundleIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v8;

  uint64_t v10 = [(NSString *)self->_widgetKind copyWithZone:a3];
  v11 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v10;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_layouts;
    *(unsigned char *)(v5 + 128) |= 4u;
  }
  uint64_t v12 = [(NSString *)self->_suggestionIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v12;

  uint64_t v14 = [(NSString *)self->_clientModelId copyWithZone:a3];
  v15 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v14;

  uint64_t v16 = [(NSData *)self->_archivedIntent copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  uint64_t v18 = [(NSData *)self->_archivedMetadata copyWithZone:a3];
  v19 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v18;

  uint64_t v20 = [(NSString *)self->_sourceIdentifier copyWithZone:a3];
  v21 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v20;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_confidenceLevel;
    *(unsigned char *)(v5 + 128) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(double *)(v5 + 40) = self->_startDate;
      *(unsigned char *)(v5 + 128) |= 0x10u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 32) = self->_relevanceScore;
  *(unsigned char *)(v5 + 128) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 2) != 0)
  {
LABEL_7:
    *(double *)(v5 + 16) = self->_endDate;
    *(unsigned char *)(v5 + 128) |= 2u;
  }
LABEL_8:
  uint64_t v23 = [(NSString *)self->_criterion copyWithZone:a3];
  v24 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v23;

  uint64_t v25 = [(NSData *)self->_archivedIntentDescription copyWithZone:a3];
  v26 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v25;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:")) {
      goto LABEL_47;
    }
  }
  widgetBundleIdentifier = self->_widgetBundleIdentifier;
  if ((unint64_t)widgetBundleIdentifier | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](widgetBundleIdentifier, "isEqual:")) {
      goto LABEL_47;
    }
  }
  widgetKind = self->_widgetKind;
  if ((unint64_t)widgetKind | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](widgetKind, "isEqual:")) {
      goto LABEL_47;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 4) == 0 || self->_layouts != *((void *)v4 + 3)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 4) != 0)
  {
LABEL_47:
    char v15 = 0;
    goto LABEL_48;
  }
  suggestionIdentifier = self->_suggestionIdentifier;
  if ((unint64_t)suggestionIdentifier | *((void *)v4 + 13)
    && !-[NSString isEqual:](suggestionIdentifier, "isEqual:"))
  {
    goto LABEL_47;
  }
  clientModelId = self->_clientModelId;
  if ((unint64_t)clientModelId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](clientModelId, "isEqual:")) {
      goto LABEL_47;
    }
  }
  archivedIntent = self->_archivedIntent;
  if ((unint64_t)archivedIntent | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](archivedIntent, "isEqual:")) {
      goto LABEL_47;
    }
  }
  archivedMetadata = self->_archivedMetadata;
  if ((unint64_t)archivedMetadata | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](archivedMetadata, "isEqual:")) {
      goto LABEL_47;
    }
  }
  sourceIdentifier = self->_sourceIdentifier;
  if ((unint64_t)sourceIdentifier | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](sourceIdentifier, "isEqual:")) {
      goto LABEL_47;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 128) & 1) == 0 || self->_confidenceLevel != *((void *)v4 + 1)) {
      goto LABEL_47;
    }
  }
  else if (*((unsigned char *)v4 + 128))
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 8) == 0 || self->_relevanceScore != *((double *)v4 + 4)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 8) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 0x10) == 0 || self->_startDate != *((double *)v4 + 5)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 0x10) != 0)
  {
    goto LABEL_47;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 128) & 2) == 0 || self->_endDate != *((double *)v4 + 2)) {
      goto LABEL_47;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 2) != 0)
  {
    goto LABEL_47;
  }
  criterion = self->_criterion;
  if ((unint64_t)criterion | *((void *)v4 + 11) && !-[NSString isEqual:](criterion, "isEqual:")) {
    goto LABEL_47;
  }
  archivedIntentDescription = self->_archivedIntentDescription;
  if ((unint64_t)archivedIntentDescription | *((void *)v4 + 8)) {
    char v15 = -[NSData isEqual:](archivedIntentDescription, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_48:

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v31 = [(NSString *)self->_appBundleIdentifier hash];
  NSUInteger v30 = [(NSString *)self->_widgetBundleIdentifier hash];
  NSUInteger v29 = [(NSString *)self->_widgetKind hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v28 = 2654435761 * self->_layouts;
  }
  else {
    uint64_t v28 = 0;
  }
  NSUInteger v27 = [(NSString *)self->_suggestionIdentifier hash];
  NSUInteger v3 = [(NSString *)self->_clientModelId hash];
  uint64_t v4 = [(NSData *)self->_archivedIntent hash];
  uint64_t v5 = [(NSData *)self->_archivedMetadata hash];
  NSUInteger v6 = [(NSString *)self->_sourceIdentifier hash];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v8 = 2654435761 * self->_confidenceLevel;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    unint64_t v13 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  double relevanceScore = self->_relevanceScore;
  double v10 = -relevanceScore;
  if (relevanceScore >= 0.0) {
    double v10 = self->_relevanceScore;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_14:
  if ((has & 0x10) != 0)
  {
    double startDate = self->_startDate;
    double v16 = -startDate;
    if (startDate >= 0.0) {
      double v16 = self->_startDate;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 2) != 0)
  {
    double endDate = self->_endDate;
    double v21 = -endDate;
    if (endDate >= 0.0) {
      double v21 = self->_endDate;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  NSUInteger v24 = v30 ^ v31 ^ v29 ^ v28 ^ v27 ^ v3 ^ v4 ^ v5 ^ v6 ^ v8 ^ v13;
  NSUInteger v25 = v14 ^ v19 ^ [(NSString *)self->_criterion hash];
  return v24 ^ v25 ^ [(NSData *)self->_archivedIntentDescription hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 6))
  {
    -[ATXPBInfoSuggestion setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 14))
  {
    -[ATXPBInfoSuggestion setWidgetBundleIdentifier:](self, "setWidgetBundleIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 15))
  {
    -[ATXPBInfoSuggestion setWidgetKind:](self, "setWidgetKind:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 128) & 4) != 0)
  {
    self->_layouts = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 13))
  {
    -[ATXPBInfoSuggestion setSuggestionIdentifier:](self, "setSuggestionIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 10))
  {
    -[ATXPBInfoSuggestion setClientModelId:](self, "setClientModelId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[ATXPBInfoSuggestion setArchivedIntent:](self, "setArchivedIntent:");
    id v4 = v6;
  }
  if (*((void *)v4 + 9))
  {
    -[ATXPBInfoSuggestion setArchivedMetadata:](self, "setArchivedMetadata:");
    id v4 = v6;
  }
  if (*((void *)v4 + 12))
  {
    -[ATXPBInfoSuggestion setSourceIdentifier:](self, "setSourceIdentifier:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 128);
  if (v5)
  {
    self->_confidenceLevel = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 128);
    if ((v5 & 8) == 0)
    {
LABEL_21:
      if ((v5 & 0x10) == 0) {
        goto LABEL_22;
      }
      goto LABEL_33;
    }
  }
  else if ((*((unsigned char *)v4 + 128) & 8) == 0)
  {
    goto LABEL_21;
  }
  self->_double relevanceScore = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 128);
  if ((v5 & 0x10) == 0)
  {
LABEL_22:
    if ((v5 & 2) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_33:
  self->_double startDate = *((double *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 128) & 2) != 0)
  {
LABEL_23:
    self->_double endDate = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_24:
  if (*((void *)v4 + 11))
  {
    -[ATXPBInfoSuggestion setCriterion:](self, "setCriterion:");
    id v4 = v6;
  }
  if (*((void *)v4 + 8))
  {
    -[ATXPBInfoSuggestion setArchivedIntentDescription:](self, "setArchivedIntentDescription:");
    id v4 = v6;
  }
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (NSString)widgetBundleIdentifier
{
  return self->_widgetBundleIdentifier;
}

- (void)setWidgetBundleIdentifier:(id)a3
{
}

- (NSString)widgetKind
{
  return self->_widgetKind;
}

- (void)setWidgetKind:(id)a3
{
}

- (int64_t)layouts
{
  return self->_layouts;
}

- (NSString)suggestionIdentifier
{
  return self->_suggestionIdentifier;
}

- (void)setSuggestionIdentifier:(id)a3
{
}

- (NSString)clientModelId
{
  return self->_clientModelId;
}

- (void)setClientModelId:(id)a3
{
}

- (NSData)archivedIntent
{
  return self->_archivedIntent;
}

- (void)setArchivedIntent:(id)a3
{
}

- (NSData)archivedMetadata
{
  return self->_archivedMetadata;
}

- (void)setArchivedMetadata:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (int64_t)confidenceLevel
{
  return self->_confidenceLevel;
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (NSString)criterion
{
  return self->_criterion;
}

- (void)setCriterion:(id)a3
{
}

- (NSData)archivedIntentDescription
{
  return self->_archivedIntentDescription;
}

- (void)setArchivedIntentDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetKind, 0);
  objc_storeStrong((id *)&self->_widgetBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_criterion, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
  objc_storeStrong((id *)&self->_archivedMetadata, 0);
  objc_storeStrong((id *)&self->_archivedIntentDescription, 0);
  objc_storeStrong((id *)&self->_archivedIntent, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end