@interface EDReference
+ (EDReference)referenceWithAreaReference:(EDAreaReference *)a3;
+ (EDReference)referenceWithFirstRow:(int)a3 lastRow:(int)a4 firstColumn:(int)a5 lastColumn:(int)a6;
+ (EDReference)referenceWithReference:(id)a3;
+ (id)reference;
- (BOOL)containsRow:(int)a3 column:(int)a4;
- (BOOL)fullyAdjacentToReference:(id)a3;
- (BOOL)isCellReference;
- (BOOL)isColumnReference;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReference:(id)a3;
- (BOOL)isRowReference;
- (BOOL)isValidAreaReference;
- (BOOL)isValidCellReference;
- (EDAreaReference)areaReference;
- (EDReference)init;
- (EDReference)initWithAreaReference:(EDAreaReference *)a3;
- (EDReference)initWithFirstRow:(int)a3 lastRow:(int)a4 firstColumn:(int)a5 lastColumn:(int)a6;
- (EDReference)initWithReference:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)firstColumn;
- (int)firstRow;
- (int)lastColumn;
- (int)lastRow;
- (unint64_t)countOfCellsBeingReferenced;
- (unint64_t)hash;
- (void)setFirstColumn:(int)a3;
- (void)setFirstRow:(int)a3;
- (void)setLastColumn:(int)a3;
- (void)setLastRow:(int)a3;
- (void)unionWithFirstRow:(int)a3 lastRow:(int)a4 firstColumn:(int)a5 lastColumn:(int)a6;
- (void)unionWithReference:(id)a3;
- (void)unionWithRow:(int)a3 column:(int)a4;
@end

@implementation EDReference

+ (EDReference)referenceWithFirstRow:(int)a3 lastRow:(int)a4 firstColumn:(int)a5 lastColumn:(int)a6
{
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFirstRow:*(void *)&a3 lastRow:*(void *)&a4 firstColumn:*(void *)&a5 lastColumn:*(void *)&a6];
  return (EDReference *)v6;
}

- (EDReference)initWithFirstRow:(int)a3 lastRow:(int)a4 firstColumn:(int)a5 lastColumn:(int)a6
{
  v11.receiver = self;
  v11.super_class = (Class)EDReference;
  result = [(EDReference *)&v11 init];
  if (result)
  {
    result->mAreaReference.firstRow = a3;
    result->mAreaReference.firstColumn = a5;
    result->mAreaReference.lastRow = a4;
    result->mAreaReference.lastColumn = a6;
  }
  return result;
}

- (int)firstColumn
{
  return self->mAreaReference.firstColumn;
}

- (int)lastColumn
{
  return self->mAreaReference.lastColumn;
}

- (BOOL)isValidAreaReference
{
  unsigned int firstRow = self->mAreaReference.firstRow;
  if ((firstRow & 0x80000000) != 0) {
    return 0;
  }
  unsigned int lastRow = self->mAreaReference.lastRow;
  if ((lastRow & 0x80000000) != 0) {
    return 0;
  }
  int firstColumn = self->mAreaReference.firstColumn;
  if (firstColumn < 0) {
    return 0;
  }
  int lastColumn = self->mAreaReference.lastColumn;
  if (firstRow > lastRow || lastColumn < 0)
  {
    BOOL v9 = 0;
    BOOL v7 = 0;
    BOOL v8 = 0;
  }
  else
  {
    BOOL v9 = __OFSUB__(firstColumn, lastColumn);
    BOOL v7 = firstColumn == lastColumn;
    BOOL v8 = firstColumn - lastColumn < 0;
  }
  return (v8 ^ v9 | v7) != 0;
}

- (int)firstRow
{
  return self->mAreaReference.firstRow;
}

- (int)lastRow
{
  return self->mAreaReference.lastRow;
}

- (BOOL)containsRow:(int)a3 column:(int)a4
{
  return self->mAreaReference.firstRow <= a3
      && self->mAreaReference.lastRow >= a3
      && self->mAreaReference.firstColumn <= a4
      && self->mAreaReference.lastColumn >= a4;
}

- (EDReference)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDReference;
  result = [(EDReference *)&v3 init];
  if (result)
  {
    *(void *)&result->mAreaReference.unsigned int firstRow = -1;
    *(void *)&result->mAreaReference.unsigned int lastRow = -1;
  }
  return result;
}

- (void)unionWithRow:(int)a3 column:(int)a4
{
}

- (void)unionWithFirstRow:(int)a3 lastRow:(int)a4 firstColumn:(int)a5 lastColumn:(int)a6
{
  int32x2_t v6 = *(int32x2_t *)&self->mAreaReference.firstRow;
  int8x8_t v7 = (int8x8_t)vceq_s32(v6, (int32x2_t)-1);
  int8x8_t v8 = vbsl_s8(vbic_s8(vmvn_s8((int8x8_t)vceq_s32((int32x2_t)__PAIR64__(a5, a3), (int32x2_t)-1)), v7), (int8x8_t)vmin_s32(v6, (int32x2_t)__PAIR64__(a5, a3)), vbsl_s8(v7, (int8x8_t)__PAIR64__(a5, a3), (int8x8_t)v6));
  int32x2_t v9 = vmax_s32(*(int32x2_t *)&self->mAreaReference.lastRow, (int32x2_t)__PAIR64__(a6, a4));
  *(int8x8_t *)&self->mAreaReference.unsigned int firstRow = v8;
  *(int32x2_t *)&self->mAreaReference.unsigned int lastRow = v9;
}

- (BOOL)fullyAdjacentToReference:(id)a3
{
  v4 = a3;
  if (!v4) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  int firstRow = self->mAreaReference.firstRow;
  int v6 = v4[2];
  if (firstRow != v6 || self->mAreaReference.lastRow != v4[4])
  {
    if (self->mAreaReference.firstColumn == v4[3] && self->mAreaReference.lastColumn == v4[5])
    {
      if (firstRow != v4[4] + 1)
      {
        p_unsigned int lastRow = &self->mAreaReference.lastRow;
        goto LABEL_14;
      }
      goto LABEL_10;
    }
LABEL_11:
    BOOL v8 = 0;
    goto LABEL_12;
  }
  if (self->mAreaReference.firstColumn != v4[5] + 1)
  {
    p_unsigned int lastRow = &self->mAreaReference.lastColumn;
    int v6 = v4[3];
LABEL_14:
    BOOL v8 = *p_lastRow == v6 - 1;
    goto LABEL_12;
  }
LABEL_10:
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

- (BOOL)isEqualToReference:(id)a3
{
  v4 = a3;
  BOOL v5 = self->mAreaReference.firstRow == v4[2]
    && self->mAreaReference.lastRow == v4[4]
    && self->mAreaReference.firstColumn == v4[3]
    && self->mAreaReference.lastColumn == v4[5];

  return v5;
}

- (unint64_t)countOfCellsBeingReferenced
{
  if ([(EDReference *)self isValidCellReference]) {
    return 1;
  }
  if (![(EDReference *)self isValidAreaReference]) {
    return 0;
  }
  int32x2_t v4 = vadd_s32(vsub_s32(*(int32x2_t *)&self->mAreaReference.lastRow, *(int32x2_t *)&self->mAreaReference.firstRow), (int32x2_t)0x100000001);
  return v4.i32[1] * (uint64_t)v4.i32[0];
}

- (BOOL)isValidCellReference
{
  return (self->mAreaReference.firstRow & 0x80000000) == 0
      && self->mAreaReference.lastRow == -1
      && (self->mAreaReference.firstColumn & 0x80000000) == 0
      && self->mAreaReference.lastColumn == -1;
}

+ (EDReference)referenceWithAreaReference:(EDAreaReference *)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAreaReference:a3];
  return (EDReference *)v3;
}

- (EDReference)initWithAreaReference:(EDAreaReference *)a3
{
  return [(EDReference *)self initWithFirstRow:a3->firstRow lastRow:a3->lastRow firstColumn:a3->firstColumn lastColumn:a3->lastColumn];
}

- (unint64_t)hash
{
  return (16 * self->mAreaReference.lastRow) | (self->mAreaReference.firstRow << 6) | (4
                                                                                     * self->mAreaReference.firstColumn) | self->mAreaReference.lastColumn;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  return (id)[v4 initWithAreaReference:&self->mAreaReference];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDReference *)a3;
  BOOL v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDReference *)self isEqualToReference:v5];

  return v6;
}

- (void)setFirstRow:(int)a3
{
  self->mAreaReference.int firstRow = a3;
}

- (void)setFirstColumn:(int)a3
{
  self->mAreaReference.int firstColumn = a3;
}

- (void)setLastRow:(int)a3
{
  self->mAreaReference.unsigned int lastRow = a3;
}

- (void)setLastColumn:(int)a3
{
  self->mAreaReference.int lastColumn = a3;
}

- (void)unionWithReference:(id)a3
{
  id v4 = (unsigned int *)a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(EDReference *)self unionWithFirstRow:v4[2] lastRow:v4[4] firstColumn:v4[3] lastColumn:v4[5]];
    }
  }
}

- (EDReference)initWithReference:(id)a3
{
  id v4 = a3;
  v8[0] = [v4 areaReference];
  v8[1] = v5;
  BOOL v6 = [(EDReference *)self initWithAreaReference:v8];

  return v6;
}

+ (id)reference
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

+ (EDReference)referenceWithReference:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithReference:v3];

  return (EDReference *)v4;
}

- (EDAreaReference)areaReference
{
  uint64_t v2 = *(void *)&self->mAreaReference.lastRow;
  uint64_t v3 = *(void *)&self->mAreaReference.firstRow;
  result.unsigned int lastRow = v2;
  result.int lastColumn = HIDWORD(v2);
  result.int firstRow = v3;
  result.int firstColumn = HIDWORD(v3);
  return result;
}

- (BOOL)isCellReference
{
  return self->mAreaReference.firstRow == self->mAreaReference.lastRow
      && self->mAreaReference.firstColumn == self->mAreaReference.lastColumn;
}

- (BOOL)isRowReference
{
  return !self->mAreaReference.firstColumn && self->mAreaReference.lastColumn > 254;
}

- (BOOL)isColumnReference
{
  return !self->mAreaReference.firstRow && self->mAreaReference.lastRow > 65534;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDReference;
  uint64_t v2 = [(EDReference *)&v4 description];
  return v2;
}

@end