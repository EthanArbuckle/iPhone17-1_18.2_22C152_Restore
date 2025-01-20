@interface PLUSSchemaPLUSRECTIFIPatternItem
- (BOOL)hasCdmMatchingSpanLabel;
- (BOOL)hasItemDomainName;
- (BOOL)hasItemPayload;
- (BOOL)hasItemSource;
- (BOOL)hasItemType;
- (BOOL)hasRelativeTimestampInMs;
- (BOOL)hasUufrSaidDialogIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)cdmMatchingSpanLabel;
- (NSString)itemDomainName;
- (NSString)itemPayload;
- (NSString)uufrSaidDialogIdentifier;
- (PLUSSchemaPLUSRECTIFIPatternItem)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSRECTIFIPatternItem)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)itemSource;
- (int)itemType;
- (unint64_t)hash;
- (unint64_t)relativeTimestampInMs;
- (unint64_t)whichPatternitemcontent;
- (void)deleteCdmMatchingSpanLabel;
- (void)deleteItemDomainName;
- (void)deleteItemPayload;
- (void)deleteItemSource;
- (void)deleteItemType;
- (void)deleteRelativeTimestampInMs;
- (void)deleteUufrSaidDialogIdentifier;
- (void)setCdmMatchingSpanLabel:(id)a3;
- (void)setHasCdmMatchingSpanLabel:(BOOL)a3;
- (void)setHasItemDomainName:(BOOL)a3;
- (void)setHasItemPayload:(BOOL)a3;
- (void)setHasItemSource:(BOOL)a3;
- (void)setHasItemType:(BOOL)a3;
- (void)setHasRelativeTimestampInMs:(BOOL)a3;
- (void)setHasUufrSaidDialogIdentifier:(BOOL)a3;
- (void)setItemDomainName:(id)a3;
- (void)setItemPayload:(id)a3;
- (void)setItemSource:(int)a3;
- (void)setItemType:(int)a3;
- (void)setRelativeTimestampInMs:(unint64_t)a3;
- (void)setUufrSaidDialogIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSRECTIFIPatternItem

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemPayload, 0);
  objc_storeStrong((id *)&self->_itemDomainName, 0);
  objc_storeStrong((id *)&self->_uufrSaidDialogIdentifier, 0);
  objc_storeStrong((id *)&self->_cdmMatchingSpanLabel, 0);
}

- (void)setHasItemPayload:(BOOL)a3
{
  self->_hasCdmMatchingSpanLabel = a3;
}

- (void)setHasItemDomainName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasUufrSaidDialogIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasUufrSaidDialogIdentifier
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasCdmMatchingSpanLabel:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (BOOL)hasCdmMatchingSpanLabel
{
  return *((unsigned char *)&self->_has + 1);
}

- (void)setItemPayload:(id)a3
{
}

- (NSString)itemPayload
{
  return self->_itemPayload;
}

- (void)setItemDomainName:(id)a3
{
}

- (NSString)itemDomainName
{
  return self->_itemDomainName;
}

- (unint64_t)relativeTimestampInMs
{
  return self->_relativeTimestampInMs;
}

- (int)itemType
{
  return self->_itemType;
}

- (int)itemSource
{
  return self->_itemSource;
}

- (unint64_t)whichPatternitemcontent
{
  return self->_whichPatternitemcontent;
}

- (PLUSSchemaPLUSRECTIFIPatternItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLUSSchemaPLUSRECTIFIPatternItem;
  v5 = [(PLUSSchemaPLUSRECTIFIPatternItem *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"itemSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSRECTIFIPatternItem setItemSource:](v5, "setItemSource:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"itemType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSRECTIFIPatternItem setItemType:](v5, "setItemType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"relativeTimestampInMs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSRECTIFIPatternItem setRelativeTimestampInMs:](v5, "setRelativeTimestampInMs:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"cdmMatchingSpanLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(PLUSSchemaPLUSRECTIFIPatternItem *)v5 setCdmMatchingSpanLabel:v10];
    }
    v11 = [v4 objectForKeyedSubscript:@"uufrSaidDialogIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(PLUSSchemaPLUSRECTIFIPatternItem *)v5 setUufrSaidDialogIdentifier:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"itemDomainName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (void *)[v13 copy];
      [(PLUSSchemaPLUSRECTIFIPatternItem *)v5 setItemDomainName:v14];
    }
    v15 = [v4 objectForKeyedSubscript:@"itemPayload"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = (void *)[v15 copy];
      [(PLUSSchemaPLUSRECTIFIPatternItem *)v5 setItemPayload:v16];
    }
    v17 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSRECTIFIPatternItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSRECTIFIPatternItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self dictionaryRepresentation];
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
  if (self->_cdmMatchingSpanLabel)
  {
    id v4 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self cdmMatchingSpanLabel];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"cdmMatchingSpanLabel"];
  }
  if (self->_itemDomainName)
  {
    v6 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemDomainName];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"itemDomainName"];
  }
  if (self->_itemPayload)
  {
    v8 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemPayload];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"itemPayload"];
  }
  char has = (char)self->_has;
  if (has)
  {
    int v15 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemSource];
    v16 = @"PLUSRECTIFIPATTERNITEMSOURCE_UNKNOWN";
    if (v15 == 1) {
      v16 = @"PLUSRECTIFIPATTERNITEMSOURCE_SIRI";
    }
    if (v15 == 2) {
      v17 = @"PLUSRECTIFIPATTERNITEMSOURCE_APP";
    }
    else {
      v17 = v16;
    }
    [v3 setObject:v17 forKeyedSubscript:@"itemSource"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  unsigned int v18 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemType] - 1;
  if (v18 > 6) {
    objc_super v19 = @"PLUSRECTIFIPATTERNITEMTYPE_UNKNOWN";
  }
  else {
    objc_super v19 = off_1E5EB4180[v18];
  }
  [v3 setObject:v19 forKeyedSubscript:@"itemType"];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_10:
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[PLUSSchemaPLUSRECTIFIPatternItem relativeTimestampInMs](self, "relativeTimestampInMs"));
    [v3 setObject:v11 forKeyedSubscript:@"relativeTimestampInMs"];
  }
LABEL_11:
  if (self->_uufrSaidDialogIdentifier)
  {
    v12 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self uufrSaidDialogIdentifier];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"uufrSaidDialogIdentifier"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v3 = 2654435761 * self->_itemSource;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_itemType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v5 = 2654435761u * self->_relativeTimestampInMs;
LABEL_8:
  NSUInteger v6 = v4 ^ v3 ^ v5 ^ [(NSString *)self->_cdmMatchingSpanLabel hash];
  NSUInteger v7 = [(NSString *)self->_uufrSaidDialogIdentifier hash];
  NSUInteger v8 = v6 ^ v7 ^ [(NSString *)self->_itemDomainName hash];
  return v8 ^ [(NSString *)self->_itemPayload hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_34;
  }
  unint64_t whichPatternitemcontent = self->_whichPatternitemcontent;
  if (whichPatternitemcontent != [v4 whichPatternitemcontent]) {
    goto LABEL_34;
  }
  $9E180F69763847707AE01B8F091C8801 has = self->_has;
  unsigned int v7 = v4[56];
  if ((*(unsigned char *)&has & 1) != (v7 & 1)) {
    goto LABEL_34;
  }
  if (*(unsigned char *)&has)
  {
    int itemSource = self->_itemSource;
    if (itemSource != [v4 itemSource]) {
      goto LABEL_34;
    }
    $9E180F69763847707AE01B8F091C8801 has = self->_has;
    unsigned int v7 = v4[56];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 == ((v7 >> 1) & 1))
  {
    if (v9)
    {
      int itemType = self->_itemType;
      if (itemType != [v4 itemType]) {
        goto LABEL_34;
      }
      $9E180F69763847707AE01B8F091C8801 has = self->_has;
      unsigned int v7 = v4[56];
    }
    int v11 = (*(unsigned int *)&has >> 2) & 1;
    if (v11 != ((v7 >> 2) & 1)) {
      goto LABEL_34;
    }
    if (v11)
    {
      unint64_t relativeTimestampInMs = self->_relativeTimestampInMs;
      if (relativeTimestampInMs != [v4 relativeTimestampInMs]) {
        goto LABEL_34;
      }
    }
    v13 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self cdmMatchingSpanLabel];
    v14 = [v4 cdmMatchingSpanLabel];
    if ((v13 == 0) == (v14 != 0)) {
      goto LABEL_33;
    }
    uint64_t v15 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self cdmMatchingSpanLabel];
    if (v15)
    {
      v16 = (void *)v15;
      v17 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self cdmMatchingSpanLabel];
      unsigned int v18 = [v4 cdmMatchingSpanLabel];
      int v19 = [v17 isEqual:v18];

      if (!v19) {
        goto LABEL_34;
      }
    }
    else
    {
    }
    v13 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self uufrSaidDialogIdentifier];
    v14 = [v4 uufrSaidDialogIdentifier];
    if ((v13 == 0) == (v14 != 0)) {
      goto LABEL_33;
    }
    uint64_t v20 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self uufrSaidDialogIdentifier];
    if (v20)
    {
      v21 = (void *)v20;
      v22 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self uufrSaidDialogIdentifier];
      v23 = [v4 uufrSaidDialogIdentifier];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_34;
      }
    }
    else
    {
    }
    v13 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemDomainName];
    v14 = [v4 itemDomainName];
    if ((v13 == 0) == (v14 != 0)) {
      goto LABEL_33;
    }
    uint64_t v25 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemDomainName];
    if (v25)
    {
      v26 = (void *)v25;
      v27 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemDomainName];
      v28 = [v4 itemDomainName];
      int v29 = [v27 isEqual:v28];

      if (!v29) {
        goto LABEL_34;
      }
    }
    else
    {
    }
    v13 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemPayload];
    v14 = [v4 itemPayload];
    if ((v13 == 0) != (v14 != 0))
    {
      uint64_t v30 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemPayload];
      if (!v30)
      {

LABEL_37:
        BOOL v35 = 1;
        goto LABEL_35;
      }
      v31 = (void *)v30;
      v32 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemPayload];
      v33 = [v4 itemPayload];
      char v34 = [v32 isEqual:v33];

      if (v34) {
        goto LABEL_37;
      }
    }
    else
    {
LABEL_33:
    }
  }
LABEL_34:
  BOOL v35 = 0;
LABEL_35:

  return v35;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint64Field();
LABEL_5:
  unint64_t v5 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self cdmMatchingSpanLabel];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v6 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self uufrSaidDialogIdentifier];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  unsigned int v7 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemDomainName];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v8 = [(PLUSSchemaPLUSRECTIFIPatternItem *)self itemPayload];

  int v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    int v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSRECTIFIPatternItemReadFrom(self, (uint64_t)a3);
}

- (void)deleteItemPayload
{
}

- (BOOL)hasItemPayload
{
  return self->_itemPayload != 0;
}

- (void)deleteItemDomainName
{
}

- (BOOL)hasItemDomainName
{
  return self->_itemDomainName != 0;
}

- (void)deleteUufrSaidDialogIdentifier
{
  if (self->_whichPatternitemcontent == 5)
  {
    self->_unint64_t whichPatternitemcontent = 0;
    self->_uufrSaidDialogIdentifier = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)uufrSaidDialogIdentifier
{
  if (self->_whichPatternitemcontent == 5) {
    v2 = self->_uufrSaidDialogIdentifier;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUufrSaidDialogIdentifier:(id)a3
{
  cdmMatchingSpanLabel = self->_cdmMatchingSpanLabel;
  self->_cdmMatchingSpanLabel = 0;
  id v8 = a3;

  unint64_t v5 = 5;
  if (!v8) {
    unint64_t v5 = 0;
  }
  self->_unint64_t whichPatternitemcontent = v5;
  NSUInteger v6 = (NSString *)[v8 copy];
  uufrSaidDialogIdentifier = self->_uufrSaidDialogIdentifier;
  self->_uufrSaidDialogIdentifier = v6;
}

- (void)deleteCdmMatchingSpanLabel
{
  if (self->_whichPatternitemcontent == 4)
  {
    self->_unint64_t whichPatternitemcontent = 0;
    self->_cdmMatchingSpanLabel = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)cdmMatchingSpanLabel
{
  if (self->_whichPatternitemcontent == 4) {
    v2 = self->_cdmMatchingSpanLabel;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCdmMatchingSpanLabel:(id)a3
{
  uufrSaidDialogIdentifier = self->_uufrSaidDialogIdentifier;
  self->_uufrSaidDialogIdentifier = 0;
  id v7 = a3;

  self->_unint64_t whichPatternitemcontent = 4 * (v7 != 0);
  unint64_t v5 = (NSString *)[v7 copy];
  cdmMatchingSpanLabel = self->_cdmMatchingSpanLabel;
  self->_cdmMatchingSpanLabel = v5;
}

- (void)deleteRelativeTimestampInMs
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasRelativeTimestampInMs:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRelativeTimestampInMs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRelativeTimestampInMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unint64_t relativeTimestampInMs = a3;
}

- (void)deleteItemType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasItemType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasItemType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setItemType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int itemType = a3;
}

- (void)deleteItemSource
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasItemSource:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasItemSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setItemSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int itemSource = a3;
}

@end