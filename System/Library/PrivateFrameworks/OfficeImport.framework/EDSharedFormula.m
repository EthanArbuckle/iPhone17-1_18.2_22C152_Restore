@interface EDSharedFormula
- (BOOL)convertTokensToShared;
- (BOOL)forceNonBaseFormula;
- (BOOL)isBaseFormula;
- (BOOL)isSharedFormula;
- (EDReference)baseFormulaRange;
- (EDSharedFormula)init;
- (EDSharedFormula)initWithFormula:(id)a3;
- (id)baseFormulaWithRowBlocks:(id)a3;
- (id)description;
- (id)warningWithRowBlocks:(id)a3;
- (int)columnBaseOrOffset;
- (int)rowBaseOrOffset;
- (unint64_t)baseFormulaIndex;
- (void)archiveByAppendingToMutableData:(__CFData *)a3;
- (void)setBaseFormulaIndex:(unint64_t)a3;
- (void)setColumnBaseOrOffset:(int)a3;
- (void)setForceNonBaseFormula:(BOOL)a3;
- (void)setRowBaseOrOffset:(int)a3;
- (void)unarchiveFromData:(__CFData *)a3 offset:(unint64_t *)a4;
- (void)updateBaseFormulaRangeWithRow:(int)a3 column:(int)a4;
@end

@implementation EDSharedFormula

- (EDSharedFormula)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDSharedFormula;
  result = [(EDFormula *)&v3 init];
  if (result)
  {
    result->_baseFormulaIndex = -1;
    result->_rowBaseOrOffset = -1;
    result->_columnBaseOrOffset = -1;
  }
  return result;
}

- (void)setRowBaseOrOffset:(int)a3
{
  self->_rowBaseOrOffset = a3;
}

- (void)setColumnBaseOrOffset:(int)a3
{
  self->_columnBaseOrOffset = a3;
}

- (void)setBaseFormulaIndex:(unint64_t)a3
{
  self->_baseFormulaIndex = a3;
}

- (BOOL)isBaseFormula
{
  return ![(EDSharedFormula *)self forceNonBaseFormula]
      && [(EDSharedFormula *)self baseFormulaIndex] == -1;
}

- (id)warningWithRowBlocks:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDSharedFormula;
  v5 = [(EDFormula *)&v11 warning];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(EDSharedFormula *)self baseFormulaWithRowBlocks:v4];
    v9 = v8;
    if (v8
      && (([v8 isContainsRelativeReferences] & 1) != 0
       || ([v9 isCleanedWithEvaluationStack] & 1) != 0))
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [v9 warning];
    }
  }
  return v7;
}

- (id)baseFormulaWithRowBlocks:(id)a3
{
  id v4 = a3;
  if ([(EDSharedFormula *)self baseFormulaIndex] == -1)
  {
    v6 = 0;
  }
  else
  {
    v5 = [v4 formulas];
    v6 = objc_msgSend(v5, "objectAtIndex:", -[EDSharedFormula baseFormulaIndex](self, "baseFormulaIndex"));
  }
  return v6;
}

- (int)rowBaseOrOffset
{
  return self->_rowBaseOrOffset;
}

- (int)columnBaseOrOffset
{
  return self->_columnBaseOrOffset;
}

- (EDSharedFormula)initWithFormula:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EDSharedFormula;
  result = [(EDFormula *)&v4 initWithFormula:a3];
  if (result)
  {
    result->_baseFormulaIndex = -1;
    result->_rowBaseOrOffset = -1;
    result->_columnBaseOrOffset = -1;
  }
  return result;
}

- (BOOL)convertTokensToShared
{
  uint64_t v3 = [(EDSharedFormula *)self rowBaseOrOffset];
  uint64_t v4 = [(EDSharedFormula *)self columnBaseOrOffset];
  return [(EDFormula *)self convertTokensToSharedAtRow:v3 column:v4];
}

- (BOOL)isSharedFormula
{
  return 1;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDSharedFormula;
  v2 = [(EDFormula *)&v4 description];
  return v2;
}

- (unint64_t)baseFormulaIndex
{
  return self->_baseFormulaIndex;
}

- (BOOL)forceNonBaseFormula
{
  return self->_forceNonBaseFormula;
}

- (void)setForceNonBaseFormula:(BOOL)a3
{
  self->_forceNonBaseFormula = a3;
}

- (EDReference)baseFormulaRange
{
  return self->_baseFormulaRange;
}

- (void).cxx_destruct
{
}

- (void)updateBaseFormulaRangeWithRow:(int)a3 column:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id v7 = [(EDSharedFormula *)self baseFormulaRange];
  if (v7)
  {
  }
  else if ([(EDSharedFormula *)self rowBaseOrOffset] == -1 {
         || [(EDSharedFormula *)self columnBaseOrOffset] == -1)
  }
  {
    objc_super v11 = [[EDReference alloc] initWithFirstRow:v5 lastRow:v5 firstColumn:v4 lastColumn:v4];
    baseFormulaRange = self->_baseFormulaRange;
    self->_baseFormulaRange = v11;
    goto LABEL_9;
  }
  if (!self->_baseFormulaRange)
  {
    v8 = [[EDReference alloc] initWithFirstRow:[(EDSharedFormula *)self rowBaseOrOffset] lastRow:[(EDSharedFormula *)self rowBaseOrOffset] firstColumn:[(EDSharedFormula *)self columnBaseOrOffset] lastColumn:[(EDSharedFormula *)self columnBaseOrOffset]];
    v9 = self->_baseFormulaRange;
    self->_baseFormulaRange = v8;
  }
  v12 = [(EDSharedFormula *)self baseFormulaRange];
  [(EDReference *)v12 unionWithRow:v5 column:v4];
  baseFormulaRange = v12;
LABEL_9:
}

- (void)unarchiveFromData:(__CFData *)a3 offset:(unint64_t *)a4
{
  if (a3)
  {
    v11.receiver = self;
    v11.super_class = (Class)EDSharedFormula;
    -[EDFormula unarchiveFromData:offset:](&v11, sel_unarchiveFromData_offset_);
    unint64_t v7 = *a4;
    v12.location = *a4;
    v12.length = 8;
    CFDataGetBytes(a3, v12, (UInt8 *)&self->_baseFormulaIndex);
    *a4 += 8;
    v13.location = v7 + 8;
    v13.length = 1;
    CFDataGetBytes(a3, v13, (UInt8 *)&self->_forceNonBaseFormula);
    ++*a4;
    v14.location = v7 + 9;
    v14.length = 4;
    CFDataGetBytes(a3, v14, (UInt8 *)&self->_rowBaseOrOffset);
    *a4 += 4;
    v15.location = v7 + 13;
    v15.length = 4;
    CFDataGetBytes(a3, v15, (UInt8 *)&self->_columnBaseOrOffset);
    *a4 += 4;
    v16.location = v7 + 17;
    v16.length = 16;
    CFDataGetBytes(a3, v16, v10);
    *a4 += 16;
    v8 = [[EDReference alloc] initWithAreaReference:v10];
    baseFormulaRange = self->_baseFormulaRange;
    self->_baseFormulaRange = v8;
  }
}

- (void)archiveByAppendingToMutableData:(__CFData *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EDSharedFormula;
  -[EDFormula archiveByAppendingToMutableData:](&v7, sel_archiveByAppendingToMutableData_);
  CFDataAppendBytes(a3, (const UInt8 *)&self->_baseFormulaIndex, 8);
  CFDataAppendBytes(a3, (const UInt8 *)&self->_forceNonBaseFormula, 1);
  CFDataAppendBytes(a3, (const UInt8 *)&self->_rowBaseOrOffset, 4);
  CFDataAppendBytes(a3, (const UInt8 *)&self->_columnBaseOrOffset, 4);
  v6[0] = [(EDReference *)self->_baseFormulaRange areaReference];
  v6[1] = v5;
  CFDataAppendBytes(a3, (const UInt8 *)v6, 16);
}

@end