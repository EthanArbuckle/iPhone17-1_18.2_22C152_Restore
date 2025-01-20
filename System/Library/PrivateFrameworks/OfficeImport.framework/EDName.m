@interface EDName
+ (id)name;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEDName:(id)a3;
- (BOOL)isEqualToString:(id)a3;
- (BOOL)isInternalFunction;
- (EDFormula)formula;
- (EDName)init;
- (EDString)nameString;
- (NSString)internalFunctionName;
- (OITSUPointerKeyDictionary)maxWorksheetReferences;
- (id)description;
- (id)formulaString;
- (unint64_t)hash;
- (unint64_t)sheetIndex;
- (void)setFormula:(id)a3 workbook:(id)a4;
- (void)setFormulaString:(id)a3 workbook:(id)a4;
- (void)setNameString:(id)a3;
- (void)setSheetIndex:(unint64_t)a3;
@end

@implementation EDName

- (EDName)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDName;
  result = [(EDName *)&v3 init];
  if (result) {
    result->_sheetIndex = 0;
  }
  return result;
}

- (void)setSheetIndex:(unint64_t)a3
{
  self->_sheetIndex = a3;
}

- (void)setNameString:(id)a3
{
}

- (void)setFormula:(id)a3 workbook:(id)a4
{
  v9 = (EDFormula *)a3;
  id v7 = a4;
  if (self->_formula != v9)
  {
    objc_storeStrong((id *)&self->_formula, a3);
    v8 = [v7 processors];
    [v8 markObject:self processor:objc_opt_class()];
  }
}

- (unint64_t)sheetIndex
{
  return self->_sheetIndex;
}

- (EDFormula)formula
{
  return self->_formula;
}

- (EDString)nameString
{
  return self->_nameString;
}

+ (id)name
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (BOOL)isEqualToEDName:(id)a3
{
  id v6 = a3;
  id v7 = [(EDName *)self nameString];
  v8 = [v6 nameString];
  if (v7 != v8)
  {
    objc_super v3 = [(EDName *)self nameString];
    v4 = [v6 nameString];
    if (![v3 isEqual:v4])
    {
      BOOL v9 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  unint64_t v10 = [(EDName *)self sheetIndex];
  BOOL v9 = v10 == [v6 sheetIndex];
  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:

  return v9;
}

- (BOOL)isEqualToString:(id)a3
{
  id v4 = a3;
  v5 = [(EDName *)self nameString];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDName *)a3;
  v5 = v4;
  if (v4 != self)
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v6 = [(EDName *)self isEqualToString:v5];
LABEL_8:
        BOOL v7 = v6;
        goto LABEL_10;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v6 = [(EDName *)self isEqualToEDName:v5];
        goto LABEL_8;
      }
    }
    BOOL v7 = 0;
    goto LABEL_10;
  }
  BOOL v7 = 1;
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  unint64_t sheetIndex = self->_sheetIndex;
  unint64_t v4 = ([(EDString *)self->_nameString hash] << 8) + (sheetIndex << 16);
  return v4 + [(NSString *)self->_formulaString hash];
}

- (BOOL)isInternalFunction
{
  id v2 = [(EDName *)self nameString];
  objc_super v3 = [v2 string];
  char v4 = [v3 hasPrefix:@"_xlfn."];

  return v4;
}

- (NSString)internalFunctionName
{
  BOOL v3 = [(EDName *)self isInternalFunction];
  char v4 = [(EDName *)self nameString];
  [v4 string];
  if (v3) {
    v5 = {;
  }
    BOOL v6 = [v5 substringFromIndex:objc_msgSend(@"_xlfn.", "length")];
  }
  else {
    BOOL v6 = {;
  }
  }

  return (NSString *)v6;
}

- (OITSUPointerKeyDictionary)maxWorksheetReferences
{
  maxWorksheetReferences = self->_maxWorksheetReferences;
  if (!maxWorksheetReferences)
  {
    char v4 = objc_alloc_init(OITSUPointerKeyDictionary);
    v5 = self->_maxWorksheetReferences;
    self->_maxWorksheetReferences = v4;

    maxWorksheetReferences = self->_maxWorksheetReferences;
  }
  return maxWorksheetReferences;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDName;
  id v2 = [(EDName *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formula, 0);
  objc_storeStrong((id *)&self->_nameString, 0);
  objc_storeStrong((id *)&self->_maxWorksheetReferences, 0);
  objc_storeStrong((id *)&self->_formulaString, 0);
}

- (id)formulaString
{
  return self->_formulaString;
}

- (void)setFormulaString:(id)a3 workbook:(id)a4
{
  BOOL v9 = (NSString *)a3;
  id v7 = a4;
  if (self->_formulaString != v9)
  {
    objc_storeStrong((id *)&self->_formulaString, a3);
    if (self->_formulaString)
    {
      v8 = [v7 processors];
      [v8 markObject:self processor:objc_opt_class()];
    }
  }
}

@end