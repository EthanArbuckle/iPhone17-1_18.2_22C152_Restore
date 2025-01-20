@interface PLSingleQuery
- (BOOL)BOOLValue;
- (BOOL)hasComparator;
- (BOOL)hasFirstValue;
- (BOOL)hasKey;
- (BOOL)hasSecondValue;
- (BOOL)hasUnit;
- (BOOL)hasValueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)firstValue;
- (NSData)secondValue;
- (NSDate)dateValue;
- (NSDate)secondDateValue;
- (NSString)secondStringValue;
- (NSString)stringValue;
- (PLQueryCircularRegion)circularRegionValue;
- (PLQueryCircularRegion)secondCircularRegionValue;
- (double)doubleValue;
- (double)secondDoubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)logDescription;
- (int)comparator;
- (int)key;
- (int)migratedComparator;
- (int)unit;
- (int)valueType;
- (int64_t)integerValue;
- (int64_t)secondIntegerValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setCircularRegionValue:(id)a3;
- (void)setComparator:(int)a3;
- (void)setDateValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setFirstValue:(id)a3;
- (void)setHasComparator:(BOOL)a3;
- (void)setHasKey:(BOOL)a3;
- (void)setHasUnit:(BOOL)a3;
- (void)setHasValueType:(BOOL)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setKey:(int)a3;
- (void)setSecondCircularRegionValue:(id)a3;
- (void)setSecondDateValue:(id)a3;
- (void)setSecondDoubleValue:(double)a3;
- (void)setSecondIntegerValue:(int64_t)a3;
- (void)setSecondStringValue:(id)a3;
- (void)setSecondValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setUnit:(int)a3;
- (void)setValueAndType:(id)a3;
- (void)setValueType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLSingleQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondValue, 0);
  objc_storeStrong((id *)&self->_firstValue, 0);
}

- (int)unit
{
  return self->_unit;
}

- (int)comparator
{
  return self->_comparator;
}

- (void)setSecondValue:(id)a3
{
}

- (NSData)secondValue
{
  return self->_secondValue;
}

- (void)setFirstValue:(id)a3
{
}

- (NSData)firstValue
{
  return self->_firstValue;
}

- (int)valueType
{
  return self->_valueType;
}

- (int)key
{
  return self->_key;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_key = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 48);
  }
  if ((v5 & 8) != 0)
  {
    self->_valueType = *((_DWORD *)v4 + 11);
    *(unsigned char *)&self->_has |= 8u;
  }
  id v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[PLSingleQuery setFirstValue:](self, "setFirstValue:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[PLSingleQuery setSecondValue:](self, "setSecondValue:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 48);
  if (v6)
  {
    self->_comparator = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 48);
  }
  if ((v6 & 4) != 0)
  {
    self->_unit = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_key;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_valueType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSData *)self->_firstValue hash];
  uint64_t v6 = [(NSData *)self->_secondValue hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = 2654435761 * self->_comparator;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_unit;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_key != *((_DWORD *)v4 + 6)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_25:
    BOOL v7 = 0;
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_valueType != *((_DWORD *)v4 + 11)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_25;
  }
  firstValue = self->_firstValue;
  if ((unint64_t)firstValue | *((void *)v4 + 2) && !-[NSData isEqual:](firstValue, "isEqual:")) {
    goto LABEL_25;
  }
  secondValue = self->_secondValue;
  if ((unint64_t)secondValue | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](secondValue, "isEqual:")) {
      goto LABEL_25;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_comparator != *((_DWORD *)v4 + 2)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_25;
  }
  BOOL v7 = (*((unsigned char *)v4 + 48) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_unit != *((_DWORD *)v4 + 10)) {
      goto LABEL_25;
    }
    BOOL v7 = 1;
  }
LABEL_26:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_key;
    *(unsigned char *)(v5 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_valueType;
    *(unsigned char *)(v5 + 48) |= 8u;
  }
  uint64_t v8 = [(NSData *)self->_firstValue copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  uint64_t v10 = [(NSData *)self->_secondValue copyWithZone:a3];
  v11 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v10;

  char v12 = (char)self->_has;
  if (v12)
  {
    *(_DWORD *)(v6 + 8) = self->_comparator;
    *(unsigned char *)(v6 + 48) |= 1u;
    char v12 = (char)self->_has;
  }
  if ((v12 & 4) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_unit;
    *(unsigned char *)(v6 + 48) |= 4u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[6] = self->_key;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v4[11] = self->_valueType;
    *((unsigned char *)v4 + 48) |= 8u;
  }
  BOOL v7 = v4;
  if (self->_firstValue)
  {
    objc_msgSend(v4, "setFirstValue:");
    id v4 = v7;
  }
  if (self->_secondValue)
  {
    objc_msgSend(v7, "setSecondValue:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if (v6)
  {
    v4[2] = self->_comparator;
    *((unsigned char *)v4 + 48) |= 1u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[10] = self->_unit;
    *((unsigned char *)v4 + 48) |= 4u;
  }
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_firstValue) {
    PBDataWriterWriteDataField();
  }
  if (self->_secondValue) {
    PBDataWriterWriteDataField();
  }
  char v5 = (char)self->_has;
  if (v5)
  {
    PBDataWriterWriteInt32Field();
    char v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLSingleQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    char v5 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_key];
    [v3 setObject:v5 forKey:@"key"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    id v6 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_valueType];
    [v3 setObject:v6 forKey:@"valueType"];
  }
  firstValue = self->_firstValue;
  if (firstValue) {
    [v3 setObject:firstValue forKey:@"firstValue"];
  }
  secondValue = self->_secondValue;
  if (secondValue) {
    [v3 setObject:secondValue forKey:@"secondValue"];
  }
  char v9 = (char)self->_has;
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_comparator];
    [v3 setObject:v10 forKey:@"comparator"];

    char v9 = (char)self->_has;
  }
  if ((v9 & 4) != 0)
  {
    v11 = [MEMORY[0x1E4F28ED0] numberWithInt:self->_unit];
    [v3 setObject:v11 forKey:@"unit"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PLSingleQuery;
  id v4 = [(PLSingleQuery *)&v8 description];
  char v5 = [(PLSingleQuery *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasUnit
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasUnit:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setUnit:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unit = a3;
}

- (BOOL)hasComparator
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasComparator:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setComparator:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_comparator = a3;
}

- (BOOL)hasSecondValue
{
  return self->_secondValue != 0;
}

- (BOOL)hasFirstValue
{
  return self->_firstValue != 0;
}

- (BOOL)hasValueType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasValueType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setValueType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_valueType = a3;
}

- (BOOL)hasKey
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasKey:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setKey:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_key = a3;
}

- (id)logDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@: %p> {", v5, self];

  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __42__PLSingleQuery_Utilities__logDescription__block_invoke;
  v29[3] = &unk_1E58A1F28;
  v31 = &v32;
  id v6 = v3;
  id v30 = v6;
  BOOL v7 = (void (**)(void))MEMORY[0x19F38F770](v29);
  if ([(PLSingleQuery *)self hasKey])
  {
    objc_super v8 = PLStringFromPLQueryKey([(PLSingleQuery *)self key]);
    [v6 appendFormat:@" key = %@", v8];

    *((unsigned char *)v33 + 24) = 1;
  }
  if ([(PLSingleQuery *)self hasValueType])
  {
    v7[2](v7);
    unsigned int v9 = [(PLSingleQuery *)self valueType] - 1;
    if (v9 > 4) {
      uint64_t v10 = @"kPLQueryValueType_unknown";
    }
    else {
      uint64_t v10 = *(&off_1E58A1318 + v9);
    }
    v11 = v10;
    [v6 appendFormat:@" valueType = %@", v11];

    *((unsigned char *)v33 + 24) = 1;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __42__PLSingleQuery_Utilities__logDescription__block_invoke_2;
  v25[3] = &unk_1E589FC50;
  char v12 = v7;
  id v27 = v12;
  v28 = &v32;
  v25[4] = self;
  id v13 = v6;
  id v26 = v13;
  v14 = (void (**)(void, void, void))MEMORY[0x19F38F770](v25);
  v15 = [(PLSingleQuery *)self firstValue];

  if (v15)
  {
    v16 = [(PLSingleQuery *)self firstValue];
    ((void (**)(void, __CFString *, void *))v14)[2](v14, @"firstValue", v16);
  }
  v17 = [(PLSingleQuery *)self secondValue];

  if (v17)
  {
    v18 = [(PLSingleQuery *)self secondValue];
    ((void (**)(void, __CFString *, void *))v14)[2](v14, @"secondValue", v18);
  }
  if ([(PLSingleQuery *)self hasComparator])
  {
    v12[2](v12);
    v19 = PLStringFromPLQueryComparatorType([(PLSingleQuery *)self comparator]);
    [v13 appendFormat:@" comparator = %@", v19];

    *((unsigned char *)v33 + 24) = 1;
  }
  if ([(PLSingleQuery *)self hasUnit])
  {
    v12[2](v12);
    unsigned int v20 = [(PLSingleQuery *)self unit] - 1;
    if (v20 > 4) {
      v21 = @"kPLQueryUnit_unused";
    }
    else {
      v21 = *(&off_1E58A1340 + v20);
    }
    v22 = v21;
    [v13 appendFormat:@" unit = %@", v22];

    *((unsigned char *)v33 + 24) = 0;
  }
  [v13 appendFormat:@" }"];
  id v23 = v13;

  _Block_object_dispose(&v32, 8);
  return v23;
}

uint64_t __42__PLSingleQuery_Utilities__logDescription__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return [*(id *)(result + 32) appendFormat:@","];
  }
  return result;
}

void __42__PLSingleQuery_Utilities__logDescription__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  switch([*(id *)(a1 + 32) valueType])
  {
    case 1u:
      int v7 = [*(id *)(a1 + 32) key];
      objc_super v8 = *(void **)(a1 + 40);
      if (v7 == 5)
      {
        uint64_t v13 = 0;
        [v6 getBytes:&v13 length:8];
        if ((v13 - 1) > 0x10) {
          unsigned int v9 = @"kPLQueryValue_unknown";
        }
        else {
          unsigned int v9 = *(&off_1E58A1368 + (v13 - 1));
        }
        uint64_t v10 = v9;
        goto LABEL_13;
      }
      uint64_t v13 = 0;
      [v6 getBytes:&v13 length:8];
      [v8 appendFormat:@" %@ = %ld (%@)", v5, v13, v6];
      break;
    case 2u:
      v11 = *(void **)(a1 + 40);
      uint64_t v13 = 0;
      [v6 getBytes:&v13 length:8];
      [v11 appendFormat:@" %@ = %lf (%@)", v5, v13, v6];
      break;
    case 3u:
      objc_super v8 = *(void **)(a1 + 40);
      stringFromData(v6);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 4u:
      objc_super v8 = *(void **)(a1 + 40);
      dateFromData(v6);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 5u:
      objc_super v8 = *(void **)(a1 + 40);
      circularRegionFromData(v6);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      char v12 = v10;
      [v8 appendFormat:@" %@ = %@ (%@)", v5, v10, v6];

      break;
    default:
      break;
  }
}

- (void)setValueAndType:(id)a3
{
  CFNumberRef number = (const __CFNumber *)a3;
  if (![(PLSingleQuery *)self hasValueType])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v4 = CFNumberGetType(number) - 5;
      if (v4 >= 0xC) {
        uint64_t v5 = 1;
      }
      else {
        uint64_t v5 = dword_19BDC7350[v4];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v5 = 3;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v5 = 4;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_13;
          }
          uint64_t v5 = 5;
        }
      }
    }
    [(PLSingleQuery *)self setValueType:v5];
  }
LABEL_13:
  if (![(PLSingleQuery *)self hasValueType]) {
    goto LABEL_19;
  }
  if ([(PLSingleQuery *)self hasFirstValue])
  {
    if ([(PLSingleQuery *)self hasSecondValue]) {
      goto LABEL_19;
    }
    id v6 = convertToData(number);
    [(PLSingleQuery *)self setSecondValue:v6];
  }
  else
  {
    id v6 = convertToData(number);
    [(PLSingleQuery *)self setFirstValue:v6];
  }

LABEL_19:
}

- (int)migratedComparator
{
  int v3 = [(PLSingleQuery *)self comparator];
  int v4 = [(PLSingleQuery *)self key];
  if (v4 > 399)
  {
    if ((v4 - 400) >= 4 && v4 != 550 && v4 != 500) {
      return v3;
    }
LABEL_3:
    BOOL v5 = v3 == 2;
    int v6 = 23;
LABEL_4:
    if (v5) {
      return v6;
    }
    return v3;
  }
  if (v4 > 300)
  {
    if (v4 != 301 && v4 != 305) {
      return v3;
    }
    goto LABEL_3;
  }
  if ((v4 - 200) >= 2)
  {
    if (v3 == 2 || v3 == 50) {
      int v12 = 23;
    }
    else {
      int v12 = v3;
    }
    if (v3 == 51) {
      int v6 = 22;
    }
    else {
      int v6 = v12;
    }
    BOOL v5 = v4 == 100;
    goto LABEL_4;
  }
  int v8 = [(PLSingleQuery *)self valueType];
  if (v3 == 4) {
    int v9 = 41;
  }
  else {
    int v9 = v3;
  }
  if (v3 == 5) {
    int v10 = 40;
  }
  else {
    int v10 = v9;
  }
  if (v8 == 1) {
    return v10;
  }
  return v3;
}

- (void)setSecondCircularRegionValue:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    if ([(PLSingleQuery *)self valueType] != 5)
    {
      int v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 308, @"Invalid parameter not satisfying: %@", @"!circularRegionValue || (self.valueType == kPLQueryValueType_isCircularRegion)" object file lineNumber description];
    }
    BOOL v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
  }
  else
  {
    BOOL v5 = 0;
  }
  [(PLSingleQuery *)self setSecondValue:v5];
}

- (PLQueryCircularRegion)secondCircularRegionValue
{
  int v4 = [(PLSingleQuery *)self secondValue];
  if (v4)
  {
    if ([(PLSingleQuery *)self valueType] != 5)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 301, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isCircularRegion" object file lineNumber description];
    }
    BOOL v5 = circularRegionFromData(v4);
  }
  else
  {
    BOOL v5 = 0;
  }

  return (PLQueryCircularRegion *)v5;
}

- (void)setCircularRegionValue:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (v5)
  {
    int v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
  }
  else
  {
    int v6 = 0;
  }
  if ([(PLSingleQuery *)self valueType] != 5)
  {
    if ([(PLSingleQuery *)self hasSecondValue])
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 291, @"Invalid parameter not satisfying: %@", @"!self.hasSecondValue" object file lineNumber description];
    }
    [(PLSingleQuery *)self setValueType:5];
  }
  [(PLSingleQuery *)self setFirstValue:v6];
}

- (PLQueryCircularRegion)circularRegionValue
{
  int v4 = [(PLSingleQuery *)self firstValue];
  if (v4)
  {
    if ([(PLSingleQuery *)self valueType] != 5)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 279, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isCircularRegion" object file lineNumber description];
    }
    id v5 = circularRegionFromData(v4);
  }
  else
  {
    id v5 = 0;
  }

  return (PLQueryCircularRegion *)v5;
}

- (void)setSecondDateValue:(id)a3
{
  id v7 = a3;
  if (v7)
  {
    if ([(PLSingleQuery *)self valueType] != 4)
    {
      int v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 266, @"Invalid parameter not satisfying: %@", @"!dateValue || (self.valueType == kPLQueryValueType_isDate)" object file lineNumber description];
    }
    id v5 = dataFromDate(v7);
  }
  else
  {
    id v5 = 0;
  }
  [(PLSingleQuery *)self setSecondValue:v5];
}

- (NSDate)secondDateValue
{
  int v4 = [(PLSingleQuery *)self secondValue];
  if (v4)
  {
    if ([(PLSingleQuery *)self valueType] != 4)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 259, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isDate" object file lineNumber description];
    }
    id v5 = dateFromData(v4);
  }
  else
  {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setDateValue:(id)a3
{
  id v5 = a3;
  id v8 = v5;
  if (v5)
  {
    int v6 = dataFromDate(v5);
  }
  else
  {
    int v6 = 0;
  }
  if ([(PLSingleQuery *)self valueType] != 4)
  {
    if ([(PLSingleQuery *)self hasSecondValue])
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 248, @"Invalid parameter not satisfying: %@", @"!self.hasSecondValue" object file lineNumber description];
    }
    [(PLSingleQuery *)self setValueType:4];
  }
  [(PLSingleQuery *)self setFirstValue:v6];
}

- (NSDate)dateValue
{
  int v4 = [(PLSingleQuery *)self firstValue];
  if (v4)
  {
    if ([(PLSingleQuery *)self valueType] != 4)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 235, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isDate" object file lineNumber description];
    }
    id v5 = dateFromData(v4);
  }
  else
  {
    id v5 = 0;
  }

  return (NSDate *)v5;
}

- (void)setSecondStringValue:(id)a3
{
  id v7 = a3;
  if (v7 && [(PLSingleQuery *)self valueType] != 3)
  {
    int v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 224, @"Invalid parameter not satisfying: %@", @"!stringValue || (self.valueType == kPLQueryValueType_isString)" object file lineNumber description];
  }
  id v5 = [v7 dataUsingEncoding:4];
  [(PLSingleQuery *)self setSecondValue:v5];
}

- (NSString)secondStringValue
{
  int v4 = [(PLSingleQuery *)self secondValue];
  if (v4)
  {
    if ([(PLSingleQuery *)self valueType] != 3)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 217, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isString" object file lineNumber description];
    }
    id v5 = stringFromData(v4);
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setStringValue:(id)a3
{
  id v6 = [a3 dataUsingEncoding:4];
  if ([(PLSingleQuery *)self valueType] != 3)
  {
    if ([(PLSingleQuery *)self hasSecondValue])
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 206, @"Invalid parameter not satisfying: %@", @"!self.hasSecondValue" object file lineNumber description];
    }
    [(PLSingleQuery *)self setValueType:3];
  }
  [(PLSingleQuery *)self setFirstValue:v6];
}

- (NSString)stringValue
{
  int v4 = [(PLSingleQuery *)self firstValue];
  if (v4)
  {
    if ([(PLSingleQuery *)self valueType] != 3)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 196, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isString" object file lineNumber description];
    }
    id v5 = stringFromData(v4);
  }
  else
  {
    id v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setBoolValue:(BOOL)a3
{
}

- (BOOL)BOOLValue
{
  return [(PLSingleQuery *)self integerValue] != 0;
}

- (void)setSecondIntegerValue:(int64_t)a3
{
  if ([(PLSingleQuery *)self valueType] != 1)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 176, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isInteger" object file lineNumber description];
  }
  dataFromInteger(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(PLSingleQuery *)self setSecondValue:v7];
}

- (int64_t)secondIntegerValue
{
  int v4 = [(PLSingleQuery *)self secondValue];
  if (v4)
  {
    if ([(PLSingleQuery *)self valueType] != 1)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 169, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isInteger" object file lineNumber description];
    }
    int64_t v8 = 0;
    [v4 getBytes:&v8 length:8];
    int64_t v5 = v8;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)setIntegerValue:(int64_t)a3
{
  dataFromInteger(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([(PLSingleQuery *)self valueType] != 1)
  {
    if ([(PLSingleQuery *)self hasSecondValue])
    {
      int64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 158, @"Invalid parameter not satisfying: %@", @"!self.hasSecondValue" object file lineNumber description];
    }
    [(PLSingleQuery *)self setValueType:1];
  }
  [(PLSingleQuery *)self setFirstValue:v6];
}

- (int64_t)integerValue
{
  int v4 = [(PLSingleQuery *)self firstValue];
  if (v4)
  {
    if ([(PLSingleQuery *)self valueType] != 1)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 148, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isInteger" object file lineNumber description];
    }
    int64_t v8 = 0;
    [v4 getBytes:&v8 length:8];
    int64_t v5 = v8;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)setSecondDoubleValue:(double)a3
{
  if ([(PLSingleQuery *)self valueType] != 2)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 137, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isDouble" object file lineNumber description];
  }
  dataFromDouble(a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(PLSingleQuery *)self setSecondValue:v7];
}

- (double)secondDoubleValue
{
  int v4 = [(PLSingleQuery *)self secondValue];
  if (v4)
  {
    if ([(PLSingleQuery *)self valueType] != 2)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 130, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isDouble" object file lineNumber description];
    }
    double v8 = 0.0;
    [v4 getBytes:&v8 length:8];
    double v5 = v8;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setDoubleValue:(double)a3
{
  dataFromDouble(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if ([(PLSingleQuery *)self valueType] != 2)
  {
    if ([(PLSingleQuery *)self hasSecondValue])
    {
      double v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 119, @"Invalid parameter not satisfying: %@", @"!self.hasSecondValue" object file lineNumber description];
    }
    [(PLSingleQuery *)self setValueType:2];
  }
  [(PLSingleQuery *)self setFirstValue:v6];
}

- (double)doubleValue
{
  int v4 = [(PLSingleQuery *)self firstValue];
  if (v4)
  {
    if ([(PLSingleQuery *)self valueType] != 2)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a2, self, @"PLSingleQuery+Utilities.m", 109, @"Invalid parameter not satisfying: %@", @"self.valueType == kPLQueryValueType_isDouble" object file lineNumber description];
    }
    double v8 = 0.0;
    [v4 getBytes:&v8 length:8];
    double v5 = v8;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

@end