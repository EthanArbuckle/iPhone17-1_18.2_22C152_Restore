@interface ICIAMTriggerCondition
- (BOOL)hasBundleIdentifier;
- (BOOL)hasComparisonType;
- (BOOL)hasDataType;
- (BOOL)hasIdentifier;
- (BOOL)hasKind;
- (BOOL)hasTriggerConditionType;
- (BOOL)hasTriggerValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (NSString)triggerValue;
- (id)comparisonTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)kindAsString:(int)a3;
- (id)triggerConditionTypeAsString:(int)a3;
- (int)StringAsComparisonType:(id)a3;
- (int)StringAsDataType:(id)a3;
- (int)StringAsKind:(id)a3;
- (int)StringAsTriggerConditionType:(id)a3;
- (int)comparisonType;
- (int)dataType;
- (int)kind;
- (int)triggerConditionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setComparisonType:(int)a3;
- (void)setDataType:(int)a3;
- (void)setHasComparisonType:(BOOL)a3;
- (void)setHasDataType:(BOOL)a3;
- (void)setHasKind:(BOOL)a3;
- (void)setHasTriggerConditionType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setKind:(int)a3;
- (void)setTriggerConditionType:(int)a3;
- (void)setTriggerValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMTriggerCondition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setTriggerValue:(id)a3
{
}

- (NSString)triggerValue
{
  return self->_triggerValue;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int *)a3;
  v7 = v4;
  if (*((void *)v4 + 3))
  {
    -[ICIAMTriggerCondition setIdentifier:](self, "setIdentifier:");
    v4 = v7;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_dataType = v4[5];
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 48);
  }
  if (v5)
  {
    self->_comparisonType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 5))
  {
    -[ICIAMTriggerCondition setTriggerValue:](self, "setTriggerValue:");
    v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 48);
  if ((v6 & 8) != 0)
  {
    self->_triggerConditionType = v4[9];
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 48);
  }
  if ((v6 & 4) != 0)
  {
    self->_kind = v4[8];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 1))
  {
    -[ICIAMTriggerCondition setBundleIdentifier:](self, "setBundleIdentifier:");
    v4 = v7;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_dataType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_comparisonType;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_triggerValue hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v7 = 2654435761 * self->_triggerConditionType;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_bundleIdentifier hash];
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_kind;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ [(NSString *)self->_bundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_29;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_dataType != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_comparisonType != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_29;
  }
  triggerValue = self->_triggerValue;
  if ((unint64_t)triggerValue | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](triggerValue, "isEqual:"))
    {
LABEL_29:
      char v10 = 0;
      goto LABEL_30;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 48);
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_triggerConditionType != *((_DWORD *)v4 + 9)) {
      goto LABEL_29;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_kind != *((_DWORD *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_29;
  }
  bundleIdentifier = self->_bundleIdentifier;
  if ((unint64_t)bundleIdentifier | *((void *)v4 + 1)) {
    char v10 = -[NSString isEqual:](bundleIdentifier, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_30:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  char v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_dataType;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_comparisonType;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_triggerValue copyWithZone:a3];
  char v10 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v9;

  char v11 = (char)self->_has;
  if ((v11 & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_triggerConditionType;
    *(unsigned char *)(v5 + 48) |= 8u;
    char v11 = (char)self->_has;
  }
  if ((v11 & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_kind;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
  uint64_t v12 = [(NSString *)self->_bundleIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v12;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_dataType;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_comparisonType;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_triggerValue)
  {
    objc_msgSend(v7, "setTriggerValue:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_triggerConditionType;
    *((unsigned char *)v4 + 48) |= 8u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_kind;
    *((unsigned char *)v4 + 48) |= 4u;
  }
  if (self->_bundleIdentifier)
  {
    objc_msgSend(v7, "setBundleIdentifier:");
    id v4 = v7;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_triggerValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_bundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMTriggerConditionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t dataType = self->_dataType;
    if (dataType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_dataType);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E5AC8D90[dataType];
    }
    [v4 setObject:v8 forKey:@"dataType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t comparisonType = self->_comparisonType;
    if (comparisonType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_comparisonType);
      char v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v10 = off_1E5AC8DA8[comparisonType];
    }
    [v4 setObject:v10 forKey:@"comparisonType"];
  }
  triggerValue = self->_triggerValue;
  if (triggerValue) {
    [v4 setObject:triggerValue forKey:@"triggerValue"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 8) != 0)
  {
    int triggerConditionType = self->_triggerConditionType;
    if (triggerConditionType)
    {
      if (triggerConditionType == 1)
      {
        v14 = @"Value";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_triggerConditionType);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v14 = @"Countable";
    }
    [v4 setObject:v14 forKey:@"triggerConditionType"];

    char v12 = (char)self->_has;
  }
  if ((v12 & 4) != 0)
  {
    int kind = self->_kind;
    if (kind)
    {
      if (kind == 1)
      {
        v16 = @"ContextProperty";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_kind);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v16 = @"Event";
    }
    [v4 setObject:v16 forKey:@"kind"];
  }
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier) {
    [v4 setObject:bundleIdentifier forKey:@"bundleIdentifier"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMTriggerCondition;
  id v4 = [(ICIAMTriggerCondition *)&v8 description];
  uint64_t v5 = [(ICIAMTriggerCondition *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasBundleIdentifier
{
  return self->_bundleIdentifier != 0;
}

- (int)StringAsKind:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Event"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"ContextProperty"];
  }

  return v4;
}

- (id)kindAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"ContextProperty";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Event";
  }
  return v4;
}

- (BOOL)hasKind
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasKind:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setKind:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int kind = a3;
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

- (int)StringAsTriggerConditionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Countable"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Value"];
  }

  return v4;
}

- (id)triggerConditionTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Value";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Countable";
  }
  return v4;
}

- (BOOL)hasTriggerConditionType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasTriggerConditionType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setTriggerConditionType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int triggerConditionType = a3;
}

- (int)triggerConditionType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_triggerConditionType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasTriggerValue
{
  return self->_triggerValue != 0;
}

- (int)StringAsComparisonType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Equal"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NotEqual"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LessThan"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LessThanOrEqualTo"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GreaterThan"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GreaterThanOrEqualTo"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)comparisonTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5AC8DA8[a3];
  }

  return v3;
}

- (BOOL)hasComparisonType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasComparisonType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setComparisonType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t comparisonType = a3;
}

- (int)comparisonType
{
  if (*(unsigned char *)&self->_has) {
    return self->_comparisonType;
  }
  else {
    return 0;
  }
}

- (int)StringAsDataType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Boolean"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"String"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Integer"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)dataTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5AC8D90[a3];
  }

  return v3;
}

- (BOOL)hasDataType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDataType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDataType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t dataType = a3;
}

- (int)dataType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_dataType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

@end