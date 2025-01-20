@interface _MRTextInputTraitsProtobuf
- (BOOL)autocorrection;
- (BOOL)enablesReturnKeyAutomatically;
- (BOOL)hasAutocapitalizationType;
- (BOOL)hasAutocorrection;
- (BOOL)hasEnablesReturnKeyAutomatically;
- (BOOL)hasKeyboardType;
- (BOOL)hasReturnKeyType;
- (BOOL)hasSecureTextEntry;
- (BOOL)hasSpellchecking;
- (BOOL)hasValidTextRangeLength;
- (BOOL)hasValidTextRangeLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)secureTextEntry;
- (BOOL)spellchecking;
- (id)autocapitalizationTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)keyboardTypeAsString:(int)a3;
- (id)returnKeyTypeAsString:(int)a3;
- (int)StringAsAutocapitalizationType:(id)a3;
- (int)StringAsKeyboardType:(id)a3;
- (int)StringAsReturnKeyType:(id)a3;
- (int)autocapitalizationType;
- (int)keyboardType;
- (int)returnKeyType;
- (unint64_t)hash;
- (unint64_t)pINEntrySeparatorIndexes;
- (unint64_t)pINEntrySeparatorIndexesAtIndex:(unint64_t)a3;
- (unint64_t)pINEntrySeparatorIndexesCount;
- (unint64_t)validTextRangeLength;
- (unint64_t)validTextRangeLocation;
- (void)addPINEntrySeparatorIndexes:(unint64_t)a3;
- (void)clearPINEntrySeparatorIndexes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAutocapitalizationType:(int)a3;
- (void)setAutocorrection:(BOOL)a3;
- (void)setEnablesReturnKeyAutomatically:(BOOL)a3;
- (void)setHasAutocapitalizationType:(BOOL)a3;
- (void)setHasAutocorrection:(BOOL)a3;
- (void)setHasEnablesReturnKeyAutomatically:(BOOL)a3;
- (void)setHasKeyboardType:(BOOL)a3;
- (void)setHasReturnKeyType:(BOOL)a3;
- (void)setHasSecureTextEntry:(BOOL)a3;
- (void)setHasSpellchecking:(BOOL)a3;
- (void)setHasValidTextRangeLength:(BOOL)a3;
- (void)setHasValidTextRangeLocation:(BOOL)a3;
- (void)setKeyboardType:(int)a3;
- (void)setPINEntrySeparatorIndexes:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setReturnKeyType:(int)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSpellchecking:(BOOL)a3;
- (void)setValidTextRangeLength:(unint64_t)a3;
- (void)setValidTextRangeLocation:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRTextInputTraitsProtobuf

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MRTextInputTraitsProtobuf;
  [(_MRTextInputTraitsProtobuf *)&v3 dealloc];
}

- (int)autocapitalizationType
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_autocapitalizationType;
  }
  else {
    return 0;
  }
}

- (void)setAutocapitalizationType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_autocapitalizationType = a3;
}

- (void)setHasAutocapitalizationType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAutocapitalizationType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)autocapitalizationTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E57D0610[a3];
  }

  return v3;
}

- (int)StringAsAutocapitalizationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"None"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Words"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Sentences"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"AllCharacters"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)keyboardType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_keyboardType;
  }
  else {
    return 0;
  }
}

- (void)setKeyboardType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_keyboardType = a3;
}

- (void)setHasKeyboardType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasKeyboardType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)keyboardTypeAsString:(int)a3
{
  if (a3 >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E57D0630[a3];
  }

  return v3;
}

- (int)StringAsKeyboardType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ASCIICapable"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NumbersAndPunctuation"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"URL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NumberPad"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"PhonePad"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NamePhonePad"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"EmailAddress"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DecimalPad"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Twitter"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"WebSearch"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Alphabet"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PasscodePad"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)returnKeyType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_returnKeyType;
  }
  else {
    return 0;
  }
}

- (void)setReturnKeyType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_returnKeyType = a3;
}

- (void)setHasReturnKeyType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasReturnKeyType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)returnKeyTypeAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_1E57D0698[a3];
  }

  return v3;
}

- (int)StringAsReturnKeyType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Go"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Google"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Join"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Next"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Route"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Search"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Send"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Yahoo"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Done"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EmergencyCall"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Continue"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setAutocorrection:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_autocorrection = a3;
}

- (void)setHasAutocorrection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAutocorrection
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSpellchecking:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_spellchecking = a3;
}

- (void)setHasSpellchecking:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSpellchecking
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setEnablesReturnKeyAutomatically:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_enablesReturnKeyAutomatically = a3;
}

- (void)setHasEnablesReturnKeyAutomatically:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEnablesReturnKeyAutomatically
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_secureTextEntry = a3;
}

- (void)setHasSecureTextEntry:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSecureTextEntry
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setValidTextRangeLocation:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_validTextRangeLocation = a3;
}

- (void)setHasValidTextRangeLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasValidTextRangeLocation
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setValidTextRangeLength:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_validTextRangeLength = a3;
}

- (void)setHasValidTextRangeLength:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasValidTextRangeLength
{
  return *(_WORD *)&self->_has & 1;
}

- (unint64_t)pINEntrySeparatorIndexesCount
{
  return self->_pINEntrySeparatorIndexes.count;
}

- (unint64_t)pINEntrySeparatorIndexes
{
  return self->_pINEntrySeparatorIndexes.list;
}

- (void)clearPINEntrySeparatorIndexes
{
}

- (void)addPINEntrySeparatorIndexes:(unint64_t)a3
{
}

- (unint64_t)pINEntrySeparatorIndexesAtIndex:(unint64_t)a3
{
  p_pINEntrySeparatorIndexes = &self->_pINEntrySeparatorIndexes;
  unint64_t count = self->_pINEntrySeparatorIndexes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_pINEntrySeparatorIndexes->list[a3];
}

- (void)setPINEntrySeparatorIndexes:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRTextInputTraitsProtobuf;
  int v4 = [(_MRTextInputTraitsProtobuf *)&v8 description];
  v5 = [(_MRTextInputTraitsProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t returnKeyType;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t vars8;

  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t autocapitalizationType = self->_autocapitalizationType;
    if (autocapitalizationType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_autocapitalizationType);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E57D0610[autocapitalizationType];
    }
    [v3 setObject:v6 forKey:@"autocapitalizationType"];

    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  uint64_t keyboardType = self->_keyboardType;
  if (keyboardType >= 0xD)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_keyboardType);
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_1E57D0630[keyboardType];
  }
  [v3 setObject:v8 forKey:@"keyboardType"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
LABEL_13:
    returnKeyType = self->_returnKeyType;
    if (returnKeyType >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_returnKeyType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E57D0698[returnKeyType];
    }
    [v3 setObject:v10 forKey:@"returnKeyType"];

    __int16 has = (__int16)self->_has;
  }
LABEL_17:
  if ((has & 0x20) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_autocorrection];
    [v3 setObject:v14 forKey:@"autocorrection"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_19:
      if ((has & 0x40) == 0) {
        goto LABEL_20;
      }
      goto LABEL_29;
    }
  }
  else if ((has & 0x100) == 0)
  {
    goto LABEL_19;
  }
  v15 = [NSNumber numberWithBool:self->_spellchecking];
  [v3 setObject:v15 forKey:@"spellchecking"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_20:
    if ((has & 0x80) == 0) {
      goto LABEL_21;
    }
    goto LABEL_30;
  }
LABEL_29:
  v16 = [NSNumber numberWithBool:self->_enablesReturnKeyAutomatically];
  [v3 setObject:v16 forKey:@"enablesReturnKeyAutomatically"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_21:
    if ((has & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_31;
  }
LABEL_30:
  v17 = [NSNumber numberWithBool:self->_secureTextEntry];
  [v3 setObject:v17 forKey:@"secureTextEntry"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_22:
    if ((has & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_31:
  v18 = [NSNumber numberWithUnsignedLongLong:self->_validTextRangeLocation];
  [v3 setObject:v18 forKey:@"validTextRangeLocation"];

  if (*(_WORD *)&self->_has)
  {
LABEL_23:
    v11 = [NSNumber numberWithUnsignedLongLong:self->_validTextRangeLength];
    [v3 setObject:v11 forKey:@"validTextRangeLength"];
  }
LABEL_24:
  v12 = PBRepeatedUInt64NSArray();
  [v3 setObject:v12 forKey:@"PINEntrySeparatorIndexes"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRTextInputTraitsProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v8 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  id v4 = v8;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  id v4 = v8;
  if (*(_WORD *)&self->_has)
  {
LABEL_10:
    PBDataWriterWriteUint64Field();
    id v4 = v8;
  }
LABEL_11:
  p_pINEntrySeparatorIndexes = &self->_pINEntrySeparatorIndexes;
  if (p_pINEntrySeparatorIndexes->count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < p_pINEntrySeparatorIndexes->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v4[12] = self->_autocapitalizationType;
    *((_WORD *)v4 + 32) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_keyboardType;
  *((_WORD *)v4 + 32) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[14] = self->_returnKeyType;
  *((_WORD *)v4 + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v4 + 60) = self->_autocorrection;
  *((_WORD *)v4 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v4 + 63) = self->_spellchecking;
  *((_WORD *)v4 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)v4 + 61) = self->_enablesReturnKeyAutomatically;
  *((_WORD *)v4 + 32) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
LABEL_25:
    *((void *)v4 + 5) = self->_validTextRangeLocation;
    *((_WORD *)v4 + 32) |= 2u;
    if ((*(_WORD *)&self->_has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_24:
  *((unsigned char *)v4 + 62) = self->_secureTextEntry;
  *((_WORD *)v4 + 32) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_25;
  }
LABEL_9:
  if (has)
  {
LABEL_10:
    *((void *)v4 + 4) = self->_validTextRangeLength;
    *((_WORD *)v4 + 32) |= 1u;
  }
LABEL_11:
  id v9 = v4;
  if ([(_MRTextInputTraitsProtobuf *)self pINEntrySeparatorIndexesCount])
  {
    [v9 clearPINEntrySeparatorIndexes];
    unint64_t v6 = [(_MRTextInputTraitsProtobuf *)self pINEntrySeparatorIndexesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(v9, "addPINEntrySeparatorIndexes:", -[_MRTextInputTraitsProtobuf pINEntrySeparatorIndexesAtIndex:](self, "pINEntrySeparatorIndexesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (void *)v4;
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v4 + 48) = self->_autocapitalizationType;
    *(_WORD *)(v4 + 64) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 52) = self->_keyboardType;
  *(_WORD *)(v4 + 64) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(_DWORD *)(v4 + 56) = self->_returnKeyType;
  *(_WORD *)(v4 + 64) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(unsigned char *)(v4 + 60) = self->_autocorrection;
  *(_WORD *)(v4 + 64) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(unsigned char *)(v4 + 63) = self->_spellchecking;
  *(_WORD *)(v4 + 64) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(unsigned char *)(v4 + 61) = self->_enablesReturnKeyAutomatically;
  *(_WORD *)(v4 + 64) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
LABEL_19:
    *(void *)(v4 + 40) = self->_validTextRangeLocation;
    *(_WORD *)(v4 + 64) |= 2u;
    if ((*(_WORD *)&self->_has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_18:
  *(unsigned char *)(v4 + 62) = self->_secureTextEntry;
  *(_WORD *)(v4 + 64) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_19;
  }
LABEL_9:
  if (has)
  {
LABEL_10:
    *(void *)(v4 + 32) = self->_validTextRangeLength;
    *(_WORD *)(v4 + 64) |= 1u;
  }
LABEL_11:
  PBRepeatedUInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_60;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 32);
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_autocapitalizationType != *((_DWORD *)v4 + 12)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_keyboardType != *((_DWORD *)v4 + 13)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_returnKeyType != *((_DWORD *)v4 + 14)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0) {
      goto LABEL_60;
    }
    if (self->_autocorrection)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_60;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_60;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) == 0) {
      goto LABEL_60;
    }
    if (self->_spellchecking)
    {
      if (!*((unsigned char *)v4 + 63)) {
        goto LABEL_60;
      }
    }
    else if (*((unsigned char *)v4 + 63))
    {
      goto LABEL_60;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x100) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_60;
    }
    if (self->_enablesReturnKeyAutomatically)
    {
      if (!*((unsigned char *)v4 + 61)) {
        goto LABEL_60;
      }
    }
    else if (*((unsigned char *)v4 + 61))
    {
      goto LABEL_60;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_60;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) != 0)
    {
      if (self->_secureTextEntry)
      {
        if (!*((unsigned char *)v4 + 62)) {
          goto LABEL_60;
        }
        goto LABEL_49;
      }
      if (!*((unsigned char *)v4 + 62)) {
        goto LABEL_49;
      }
    }
LABEL_60:
    char IsEqual = 0;
    goto LABEL_61;
  }
  if ((v6 & 0x80) != 0) {
    goto LABEL_60;
  }
LABEL_49:
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_validTextRangeLocation != *((void *)v4 + 5)) {
      goto LABEL_60;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_60;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_validTextRangeLength != *((void *)v4 + 4)) {
      goto LABEL_60;
    }
  }
  else if (v6)
  {
    goto LABEL_60;
  }
  char IsEqual = PBRepeatedUInt64IsEqual();
LABEL_61:

  return IsEqual;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_autocapitalizationType;
    if ((has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_keyboardType;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((has & 8) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_returnKeyType;
    if ((has & 0x20) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v5 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_autocorrection;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_spellchecking;
    if ((has & 0x40) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_enablesReturnKeyAutomatically;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v8 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_secureTextEntry;
    if ((has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    unint64_t v10 = 0;
    if (has) {
      goto LABEL_10;
    }
LABEL_19:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ PBRepeatedUInt64Hash();
  }
LABEL_17:
  uint64_t v9 = 0;
  if ((has & 2) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  unint64_t v10 = 2654435761u * self->_validTextRangeLocation;
  if ((has & 1) == 0) {
    goto LABEL_19;
  }
LABEL_10:
  unint64_t v11 = 2654435761u * self->_validTextRangeLength;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t autocapitalizationType = *((_DWORD *)v4 + 12);
    *(_WORD *)&self->_has |= 4u;
    __int16 v5 = *((_WORD *)v4 + 32);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t keyboardType = *((_DWORD *)v4 + 13);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_returnKeyType = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_autocorrection = *((unsigned char *)v4 + 60);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_spellchecking = *((unsigned char *)v4 + 63);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_enablesReturnKeyAutomatically = *((unsigned char *)v4 + 61);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_secureTextEntry = *((unsigned char *)v4 + 62);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_9:
    if ((v5 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_24:
  self->_validTextRangeLocation = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 2u;
  if (*((_WORD *)v4 + 32))
  {
LABEL_10:
    self->_validTextRangeLength = *((void *)v4 + 4);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_11:
  id v9 = v4;
  uint64_t v6 = [v4 pINEntrySeparatorIndexesCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[_MRTextInputTraitsProtobuf addPINEntrySeparatorIndexes:](self, "addPINEntrySeparatorIndexes:", [v9 pINEntrySeparatorIndexesAtIndex:i]);
  }
}

- (BOOL)autocorrection
{
  return self->_autocorrection;
}

- (BOOL)spellchecking
{
  return self->_spellchecking;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return self->_enablesReturnKeyAutomatically;
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (unint64_t)validTextRangeLocation
{
  return self->_validTextRangeLocation;
}

- (unint64_t)validTextRangeLength
{
  return self->_validTextRangeLength;
}

@end