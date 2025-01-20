@interface ICIAMMessageRule
+ (Class)subrulesType;
- (BOOL)hasIdentifier;
- (BOOL)hasRequiredApplicationContextBundleIdentifier;
- (BOOL)hasRuleOperator;
- (BOOL)hasTriggerCondition;
- (BOOL)hasTriggerEventName;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (ICIAMTriggerCondition)triggerCondition;
- (NSMutableArray)subrules;
- (NSString)identifier;
- (NSString)requiredApplicationContextBundleIdentifier;
- (NSString)triggerEventName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)ruleOperatorAsString:(int)a3;
- (id)subrulesAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsRuleOperator:(id)a3;
- (int)StringAsType:(id)a3;
- (int)ruleOperator;
- (int)type;
- (unint64_t)hash;
- (unint64_t)subrulesCount;
- (void)addSubrules:(id)a3;
- (void)clearSubrules;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasRuleOperator:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setRequiredApplicationContextBundleIdentifier:(id)a3;
- (void)setRuleOperator:(int)a3;
- (void)setSubrules:(id)a3;
- (void)setTriggerCondition:(id)a3;
- (void)setTriggerEventName:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ICIAMMessageRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerEventName, 0);
  objc_storeStrong((id *)&self->_triggerCondition, 0);
  objc_storeStrong((id *)&self->_subrules, 0);
  objc_storeStrong((id *)&self->_requiredApplicationContextBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setRequiredApplicationContextBundleIdentifier:(id)a3
{
}

- (NSString)requiredApplicationContextBundleIdentifier
{
  return self->_requiredApplicationContextBundleIdentifier;
}

- (void)setTriggerEventName:(id)a3
{
}

- (NSString)triggerEventName
{
  return self->_triggerEventName;
}

- (void)setTriggerCondition:(id)a3
{
}

- (ICIAMTriggerCondition)triggerCondition
{
  return self->_triggerCondition;
}

- (void)setSubrules:(id)a3
{
}

- (NSMutableArray)subrules
{
  return self->_subrules;
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[ICIAMMessageRule setIdentifier:](self, "setIdentifier:");
  }
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 60);
  }
  if (v5)
  {
    self->_ruleOperator = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *((id *)v4 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[ICIAMMessageRule addSubrules:](self, "addSubrules:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  triggerCondition = self->_triggerCondition;
  uint64_t v12 = *((void *)v4 + 5);
  if (triggerCondition)
  {
    if (v12) {
      -[ICIAMTriggerCondition mergeFrom:](triggerCondition, "mergeFrom:");
    }
  }
  else if (v12)
  {
    -[ICIAMMessageRule setTriggerCondition:](self, "setTriggerCondition:");
  }
  if (*((void *)v4 + 6)) {
    -[ICIAMMessageRule setTriggerEventName:](self, "setTriggerEventName:");
  }
  if (*((void *)v4 + 2)) {
    -[ICIAMMessageRule setRequiredApplicationContextBundleIdentifier:](self, "setRequiredApplicationContextBundleIdentifier:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_ruleOperator;
LABEL_6:
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_subrules hash];
  unint64_t v7 = [(ICIAMTriggerCondition *)self->_triggerCondition hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_triggerEventName hash];
  return v6 ^ v8 ^ [(NSString *)self->_requiredApplicationContextBundleIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_22;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
LABEL_22:
    char v10 = 0;
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_ruleOperator != *((_DWORD *)v4 + 6)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_22;
  }
  subrules = self->_subrules;
  if ((unint64_t)subrules | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](subrules, "isEqual:"))
  {
    goto LABEL_22;
  }
  triggerCondition = self->_triggerCondition;
  if ((unint64_t)triggerCondition | *((void *)v4 + 5))
  {
    if (!-[ICIAMTriggerCondition isEqual:](triggerCondition, "isEqual:")) {
      goto LABEL_22;
    }
  }
  triggerEventName = self->_triggerEventName;
  if ((unint64_t)triggerEventName | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](triggerEventName, "isEqual:")) {
      goto LABEL_22;
    }
  }
  requiredApplicationContextBundleIdentifier = self->_requiredApplicationContextBundleIdentifier;
  if ((unint64_t)requiredApplicationContextBundleIdentifier | *((void *)v4 + 2)) {
    char v10 = -[NSString isEqual:](requiredApplicationContextBundleIdentifier, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_23:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(unsigned char *)(v5 + 60) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_ruleOperator;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = self->_subrules;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (void)v22);
        [(id)v5 addSubrules:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v15 = [(ICIAMTriggerCondition *)self->_triggerCondition copyWithZone:a3];
  long long v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  uint64_t v17 = [(NSString *)self->_triggerEventName copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v17;

  uint64_t v19 = [(NSString *)self->_requiredApplicationContextBundleIdentifier copyWithZone:a3];
  v20 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v19;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v11;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_type;
    *((unsigned char *)v4 + 60) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_ruleOperator;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  if ([(ICIAMMessageRule *)self subrulesCount])
  {
    [v11 clearSubrules];
    unint64_t v6 = [(ICIAMMessageRule *)self subrulesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(ICIAMMessageRule *)self subrulesAtIndex:i];
        [v11 addSubrules:v9];
      }
    }
  }
  if (self->_triggerCondition) {
    objc_msgSend(v11, "setTriggerCondition:");
  }
  uint64_t v10 = v11;
  if (self->_triggerEventName)
  {
    objc_msgSend(v11, "setTriggerEventName:");
    uint64_t v10 = v11;
  }
  if (self->_requiredApplicationContextBundleIdentifier)
  {
    objc_msgSend(v11, "setRequiredApplicationContextBundleIdentifier:");
    uint64_t v10 = v11;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_subrules;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (self->_triggerCondition) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_triggerEventName) {
    PBDataWriterWriteStringField();
  }
  if (self->_requiredApplicationContextBundleIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMMessageRuleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    int type = self->_type;
    if (type)
    {
      if (type == 1)
      {
        uint64_t v8 = @"Compound";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
        uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v8 = @"Simple";
    }
    [v4 setObject:v8 forKey:@"type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    int ruleOperator = self->_ruleOperator;
    if (ruleOperator)
    {
      if (ruleOperator == 1)
      {
        uint64_t v10 = @"OR";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ruleOperator);
        uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      uint64_t v10 = @"AND";
    }
    [v4 setObject:v10 forKey:@"ruleOperator"];
  }
  if ([(NSMutableArray *)self->_subrules count])
  {
    long long v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_subrules, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v12 = self->_subrules;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = [*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation];
          [v11 addObject:v17];
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    [v4 setObject:v11 forKey:@"subrules"];
  }
  triggerCondition = self->_triggerCondition;
  if (triggerCondition)
  {
    uint64_t v19 = [(ICIAMTriggerCondition *)triggerCondition dictionaryRepresentation];
    [v4 setObject:v19 forKey:@"triggerCondition"];
  }
  triggerEventName = self->_triggerEventName;
  if (triggerEventName) {
    [v4 setObject:triggerEventName forKey:@"triggerEventName"];
  }
  requiredApplicationContextBundleIdentifier = self->_requiredApplicationContextBundleIdentifier;
  if (requiredApplicationContextBundleIdentifier) {
    [v4 setObject:requiredApplicationContextBundleIdentifier forKey:@"requiredApplicationContextBundleIdentifier"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ICIAMMessageRule;
  id v4 = [(ICIAMMessageRule *)&v8 description];
  uint64_t v5 = [(ICIAMMessageRule *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRequiredApplicationContextBundleIdentifier
{
  return self->_requiredApplicationContextBundleIdentifier != 0;
}

- (BOOL)hasTriggerEventName
{
  return self->_triggerEventName != 0;
}

- (BOOL)hasTriggerCondition
{
  return self->_triggerCondition != 0;
}

- (id)subrulesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subrules objectAtIndex:a3];
}

- (unint64_t)subrulesCount
{
  return [(NSMutableArray *)self->_subrules count];
}

- (void)addSubrules:(id)a3
{
  id v4 = a3;
  subrules = self->_subrules;
  id v8 = v4;
  if (!subrules)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_subrules;
    self->_subrules = v6;

    id v4 = v8;
    subrules = self->_subrules;
  }
  [(NSMutableArray *)subrules addObject:v4];
}

- (void)clearSubrules
{
}

- (int)StringAsRuleOperator:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AND"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"OR"];
  }

  return v4;
}

- (id)ruleOperatorAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"OR";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"AND";
  }
  return v4;
}

- (BOOL)hasRuleOperator
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRuleOperator:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRuleOperator:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int ruleOperator = a3;
}

- (int)ruleOperator
{
  if (*(unsigned char *)&self->_has) {
    return self->_ruleOperator;
  }
  else {
    return 0;
  }
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Simple"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Compound"];
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"Compound";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"Simple";
  }
  return v4;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int type = a3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

+ (Class)subrulesType
{
  return (Class)objc_opt_class();
}

@end