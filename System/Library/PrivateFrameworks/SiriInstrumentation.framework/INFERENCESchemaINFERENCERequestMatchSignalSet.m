@interface INFERENCESchemaINFERENCERequestMatchSignalSet
- (BOOL)areAllPrimaryContactTokensInQuery;
- (BOOL)areAllQueryTokensInContact;
- (BOOL)hasAreAllPrimaryContactTokensInQuery;
- (BOOL)hasAreAllQueryTokensInContact;
- (BOOL)hasIsFamilyNameMatch;
- (BOOL)hasIsGivenNameMatch;
- (BOOL)hasIsHandleQueryLabelNameMatch;
- (BOOL)hasIsHandleQueryMatch;
- (BOOL)hasIsMiddleNameMatch;
- (BOOL)hasIsNamePrefixMatch;
- (BOOL)hasIsNameSuffixMatch;
- (BOOL)hasIsNicknameMatch;
- (BOOL)hasIsOrganizationNameMatch;
- (BOOL)hasIsWeakOrganizationMatch;
- (BOOL)hasNumPrimaryTokens;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamilyNameMatch;
- (BOOL)isGivenNameMatch;
- (BOOL)isHandleQueryLabelNameMatch;
- (BOOL)isHandleQueryMatch;
- (BOOL)isMiddleNameMatch;
- (BOOL)isNamePrefixMatch;
- (BOOL)isNameSuffixMatch;
- (BOOL)isNicknameMatch;
- (BOOL)isOrganizationNameMatch;
- (BOOL)isWeakOrganizationMatch;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCERequestMatchSignalSet)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCERequestMatchSignalSet)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)numPrimaryTokens;
- (void)deleteAreAllPrimaryContactTokensInQuery;
- (void)deleteAreAllQueryTokensInContact;
- (void)deleteIsFamilyNameMatch;
- (void)deleteIsGivenNameMatch;
- (void)deleteIsHandleQueryLabelNameMatch;
- (void)deleteIsHandleQueryMatch;
- (void)deleteIsMiddleNameMatch;
- (void)deleteIsNamePrefixMatch;
- (void)deleteIsNameSuffixMatch;
- (void)deleteIsNicknameMatch;
- (void)deleteIsOrganizationNameMatch;
- (void)deleteIsWeakOrganizationMatch;
- (void)deleteNumPrimaryTokens;
- (void)setAreAllPrimaryContactTokensInQuery:(BOOL)a3;
- (void)setAreAllQueryTokensInContact:(BOOL)a3;
- (void)setHasAreAllPrimaryContactTokensInQuery:(BOOL)a3;
- (void)setHasAreAllQueryTokensInContact:(BOOL)a3;
- (void)setHasIsFamilyNameMatch:(BOOL)a3;
- (void)setHasIsGivenNameMatch:(BOOL)a3;
- (void)setHasIsHandleQueryLabelNameMatch:(BOOL)a3;
- (void)setHasIsHandleQueryMatch:(BOOL)a3;
- (void)setHasIsMiddleNameMatch:(BOOL)a3;
- (void)setHasIsNamePrefixMatch:(BOOL)a3;
- (void)setHasIsNameSuffixMatch:(BOOL)a3;
- (void)setHasIsNicknameMatch:(BOOL)a3;
- (void)setHasIsOrganizationNameMatch:(BOOL)a3;
- (void)setHasIsWeakOrganizationMatch:(BOOL)a3;
- (void)setHasNumPrimaryTokens:(BOOL)a3;
- (void)setIsFamilyNameMatch:(BOOL)a3;
- (void)setIsGivenNameMatch:(BOOL)a3;
- (void)setIsHandleQueryLabelNameMatch:(BOOL)a3;
- (void)setIsHandleQueryMatch:(BOOL)a3;
- (void)setIsMiddleNameMatch:(BOOL)a3;
- (void)setIsNamePrefixMatch:(BOOL)a3;
- (void)setIsNameSuffixMatch:(BOOL)a3;
- (void)setIsNicknameMatch:(BOOL)a3;
- (void)setIsOrganizationNameMatch:(BOOL)a3;
- (void)setIsWeakOrganizationMatch:(BOOL)a3;
- (void)setNumPrimaryTokens:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCERequestMatchSignalSet

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isHandleQueryLabelNameMatch
{
  return self->_isHandleQueryLabelNameMatch;
}

- (BOOL)isHandleQueryMatch
{
  return self->_isHandleQueryMatch;
}

- (BOOL)isNameSuffixMatch
{
  return self->_isNameSuffixMatch;
}

- (BOOL)isNamePrefixMatch
{
  return self->_isNamePrefixMatch;
}

- (BOOL)isNicknameMatch
{
  return self->_isNicknameMatch;
}

- (BOOL)isWeakOrganizationMatch
{
  return self->_isWeakOrganizationMatch;
}

- (BOOL)isOrganizationNameMatch
{
  return self->_isOrganizationNameMatch;
}

- (BOOL)isFamilyNameMatch
{
  return self->_isFamilyNameMatch;
}

- (BOOL)isMiddleNameMatch
{
  return self->_isMiddleNameMatch;
}

- (BOOL)isGivenNameMatch
{
  return self->_isGivenNameMatch;
}

- (BOOL)areAllPrimaryContactTokensInQuery
{
  return self->_areAllPrimaryContactTokensInQuery;
}

- (BOOL)areAllQueryTokensInContact
{
  return self->_areAllQueryTokensInContact;
}

- (unsigned)numPrimaryTokens
{
  return self->_numPrimaryTokens;
}

- (INFERENCESchemaINFERENCERequestMatchSignalSet)initWithDictionary:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)INFERENCESchemaINFERENCERequestMatchSignalSet;
  v5 = [(INFERENCESchemaINFERENCERequestMatchSignalSet *)&v28 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"numPrimaryTokens"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setNumPrimaryTokens:](v5, "setNumPrimaryTokens:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"areAllQueryTokensInContact"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setAreAllQueryTokensInContact:](v5, "setAreAllQueryTokensInContact:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"areAllPrimaryContactTokensInQuery"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setAreAllPrimaryContactTokensInQuery:](v5, "setAreAllPrimaryContactTokensInQuery:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isGivenNameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsGivenNameMatch:](v5, "setIsGivenNameMatch:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isMiddleNameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsMiddleNameMatch:](v5, "setIsMiddleNameMatch:", [v10 BOOLValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"isFamilyNameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsFamilyNameMatch:](v5, "setIsFamilyNameMatch:", [v11 BOOLValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"isOrganizationNameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsOrganizationNameMatch:](v5, "setIsOrganizationNameMatch:", [v12 BOOLValue]);
    }
    v27 = v6;
    v13 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isWeakOrganizationMatch", v12);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsWeakOrganizationMatch:](v5, "setIsWeakOrganizationMatch:", [v13 BOOLValue]);
    }
    v26 = v7;
    v14 = [v4 objectForKeyedSubscript:@"isNicknameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsNicknameMatch:](v5, "setIsNicknameMatch:", [v14 BOOLValue]);
    }
    v25 = v8;
    v15 = [v4 objectForKeyedSubscript:@"isNamePrefixMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsNamePrefixMatch:](v5, "setIsNamePrefixMatch:", [v15 BOOLValue]);
    }
    v23 = v11;
    v24 = v9;
    v16 = [v4 objectForKeyedSubscript:@"isNameSuffixMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsNameSuffixMatch:](v5, "setIsNameSuffixMatch:", [v16 BOOLValue]);
    }
    v17 = v10;
    v18 = [v4 objectForKeyedSubscript:@"isHandleQueryMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsHandleQueryMatch:](v5, "setIsHandleQueryMatch:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"isHandleQueryLabelNameMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCERequestMatchSignalSet setIsHandleQueryLabelNameMatch:](v5, "setIsHandleQueryLabelNameMatch:", [v19 BOOLValue]);
    }
    v20 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCERequestMatchSignalSet)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCERequestMatchSignalSet *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCERequestMatchSignalSet *)self dictionaryRepresentation];
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
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet areAllPrimaryContactTokensInQuery](self, "areAllPrimaryContactTokensInQuery"));
    [v3 setObject:v7 forKeyedSubscript:@"areAllPrimaryContactTokensInQuery"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet areAllQueryTokensInContact](self, "areAllQueryTokensInContact"));
  [v3 setObject:v8 forKeyedSubscript:@"areAllQueryTokensInContact"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isFamilyNameMatch](self, "isFamilyNameMatch"));
  [v3 setObject:v9 forKeyedSubscript:@"isFamilyNameMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x1000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isGivenNameMatch](self, "isGivenNameMatch"));
  [v3 setObject:v10 forKeyedSubscript:@"isGivenNameMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isHandleQueryLabelNameMatch](self, "isHandleQueryLabelNameMatch"));
  [v3 setObject:v11 forKeyedSubscript:@"isHandleQueryLabelNameMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isHandleQueryMatch](self, "isHandleQueryMatch"));
  [v3 setObject:v12 forKeyedSubscript:@"isHandleQueryMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isMiddleNameMatch](self, "isMiddleNameMatch"));
  [v3 setObject:v13 forKeyedSubscript:@"isMiddleNameMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isNamePrefixMatch](self, "isNamePrefixMatch"));
  [v3 setObject:v14 forKeyedSubscript:@"isNamePrefixMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isNameSuffixMatch](self, "isNameSuffixMatch"));
  [v3 setObject:v15 forKeyedSubscript:@"isNameSuffixMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isNicknameMatch](self, "isNicknameMatch"));
  [v3 setObject:v16 forKeyedSubscript:@"isNicknameMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isOrganizationNameMatch](self, "isOrganizationNameMatch"));
  [v3 setObject:v17 forKeyedSubscript:@"isOrganizationNameMatch"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCERequestMatchSignalSet isWeakOrganizationMatch](self, "isWeakOrganizationMatch"));
  [v3 setObject:v18 forKeyedSubscript:@"isWeakOrganizationMatch"];

  if (*(_WORD *)&self->_has)
  {
LABEL_14:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[INFERENCESchemaINFERENCERequestMatchSignalSet numPrimaryTokens](self, "numPrimaryTokens"));
    [v3 setObject:v5 forKeyedSubscript:@"numPrimaryTokens"];
  }
LABEL_15:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v3 = 2654435761 * self->_numPrimaryTokens;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_areAllQueryTokensInContact;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_areAllPrimaryContactTokensInQuery;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v5 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_isGivenNameMatch;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v6 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_isMiddleNameMatch;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_isFamilyNameMatch;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_isOrganizationNameMatch;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_isWeakOrganizationMatch;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_isNicknameMatch;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_isNamePrefixMatch;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_isNameSuffixMatch;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v14 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_14;
    }
LABEL_27:
    uint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x800) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_isHandleQueryMatch;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_27;
  }
LABEL_14:
  uint64_t v15 = 2654435761 * self->_isHandleQueryLabelNameMatch;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_54;
  }
  $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
  unsigned int v6 = v4[12];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_54;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int numPrimaryTokens = self->_numPrimaryTokens;
    if (numPrimaryTokens != [v4 numPrimaryTokens]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_54;
  }
  if (v8)
  {
    int areAllQueryTokensInContact = self->_areAllQueryTokensInContact;
    if (areAllQueryTokensInContact != [v4 areAllQueryTokensInContact]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v10 = (*(unsigned int *)&has >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_54;
  }
  if (v10)
  {
    int areAllPrimaryContactTokensInQuery = self->_areAllPrimaryContactTokensInQuery;
    if (areAllPrimaryContactTokensInQuery != [v4 areAllPrimaryContactTokensInQuery]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v12 = (*(unsigned int *)&has >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_54;
  }
  if (v12)
  {
    int isGivenNameMatch = self->_isGivenNameMatch;
    if (isGivenNameMatch != [v4 isGivenNameMatch]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v14 = (*(unsigned int *)&has >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_54;
  }
  if (v14)
  {
    int isMiddleNameMatch = self->_isMiddleNameMatch;
    if (isMiddleNameMatch != [v4 isMiddleNameMatch]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v16 = (*(unsigned int *)&has >> 5) & 1;
  if (v16 != ((v6 >> 5) & 1)) {
    goto LABEL_54;
  }
  if (v16)
  {
    int isFamilyNameMatch = self->_isFamilyNameMatch;
    if (isFamilyNameMatch != [v4 isFamilyNameMatch]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v18 = (*(unsigned int *)&has >> 6) & 1;
  if (v18 != ((v6 >> 6) & 1)) {
    goto LABEL_54;
  }
  if (v18)
  {
    int isOrganizationNameMatch = self->_isOrganizationNameMatch;
    if (isOrganizationNameMatch != [v4 isOrganizationNameMatch]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v20 = (*(unsigned int *)&has >> 7) & 1;
  if (v20 != ((v6 >> 7) & 1)) {
    goto LABEL_54;
  }
  if (v20)
  {
    int isWeakOrganizationMatch = self->_isWeakOrganizationMatch;
    if (isWeakOrganizationMatch != [v4 isWeakOrganizationMatch]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v22 = (*(unsigned int *)&has >> 8) & 1;
  if (v22 != ((v6 >> 8) & 1)) {
    goto LABEL_54;
  }
  if (v22)
  {
    int isNicknameMatch = self->_isNicknameMatch;
    if (isNicknameMatch != [v4 isNicknameMatch]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v24 = (*(unsigned int *)&has >> 9) & 1;
  if (v24 != ((v6 >> 9) & 1)) {
    goto LABEL_54;
  }
  if (v24)
  {
    int isNamePrefixMatch = self->_isNamePrefixMatch;
    if (isNamePrefixMatch != [v4 isNamePrefixMatch]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v26 = (*(unsigned int *)&has >> 10) & 1;
  if (v26 != ((v6 >> 10) & 1)) {
    goto LABEL_54;
  }
  if (v26)
  {
    int isNameSuffixMatch = self->_isNameSuffixMatch;
    if (isNameSuffixMatch != [v4 isNameSuffixMatch]) {
      goto LABEL_54;
    }
    $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
    unsigned int v6 = v4[12];
  }
  int v28 = (*(unsigned int *)&has >> 11) & 1;
  if (v28 != ((v6 >> 11) & 1)) {
    goto LABEL_54;
  }
  if (v28)
  {
    int isHandleQueryMatch = self->_isHandleQueryMatch;
    if (isHandleQueryMatch == [v4 isHandleQueryMatch])
    {
      $2263722ABC7A478F6E4EF28E6FA6E58C has = self->_has;
      unsigned int v6 = v4[12];
      goto LABEL_50;
    }
LABEL_54:
    BOOL v32 = 0;
    goto LABEL_55;
  }
LABEL_50:
  int v30 = (*(unsigned int *)&has >> 12) & 1;
  if (v30 != ((v6 >> 12) & 1)) {
    goto LABEL_54;
  }
  if (v30)
  {
    int isHandleQueryLabelNameMatch = self->_isHandleQueryLabelNameMatch;
    if (isHandleQueryLabelNameMatch != [v4 isHandleQueryLabelNameMatch]) {
      goto LABEL_54;
    }
  }
  BOOL v32 = 1;
LABEL_55:

  return v32;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
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
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_12:
    if ((has & 0x800) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_13:
    if ((has & 0x1000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCERequestMatchSignalSetReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsHandleQueryLabelNameMatch
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasIsHandleQueryLabelNameMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsHandleQueryLabelNameMatch
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setIsHandleQueryLabelNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_int isHandleQueryLabelNameMatch = a3;
}

- (void)deleteIsHandleQueryMatch
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasIsHandleQueryMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsHandleQueryMatch
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setIsHandleQueryMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_int isHandleQueryMatch = a3;
}

- (void)deleteIsNameSuffixMatch
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasIsNameSuffixMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsNameSuffixMatch
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setIsNameSuffixMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_int isNameSuffixMatch = a3;
}

- (void)deleteIsNamePrefixMatch
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasIsNamePrefixMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsNamePrefixMatch
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsNamePrefixMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_int isNamePrefixMatch = a3;
}

- (void)deleteIsNicknameMatch
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasIsNicknameMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsNicknameMatch
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setIsNicknameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_int isNicknameMatch = a3;
}

- (void)deleteIsWeakOrganizationMatch
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasIsWeakOrganizationMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsWeakOrganizationMatch
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setIsWeakOrganizationMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int isWeakOrganizationMatch = a3;
}

- (void)deleteIsOrganizationNameMatch
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasIsOrganizationNameMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsOrganizationNameMatch
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setIsOrganizationNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int isOrganizationNameMatch = a3;
}

- (void)deleteIsFamilyNameMatch
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasIsFamilyNameMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsFamilyNameMatch
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsFamilyNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int isFamilyNameMatch = a3;
}

- (void)deleteIsMiddleNameMatch
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasIsMiddleNameMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsMiddleNameMatch
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsMiddleNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int isMiddleNameMatch = a3;
}

- (void)deleteIsGivenNameMatch
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasIsGivenNameMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasIsGivenNameMatch
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setIsGivenNameMatch:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int isGivenNameMatch = a3;
}

- (void)deleteAreAllPrimaryContactTokensInQuery
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasAreAllPrimaryContactTokensInQuery:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAreAllPrimaryContactTokensInQuery
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setAreAllPrimaryContactTokensInQuery:(BOOL)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int areAllPrimaryContactTokensInQuery = a3;
}

- (void)deleteAreAllQueryTokensInContact
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasAreAllQueryTokensInContact:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAreAllQueryTokensInContact
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAreAllQueryTokensInContact:(BOOL)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int areAllQueryTokensInContact = a3;
}

- (void)deleteNumPrimaryTokens
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasNumPrimaryTokens:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasNumPrimaryTokens
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setNumPrimaryTokens:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_unsigned int numPrimaryTokens = a3;
}

@end