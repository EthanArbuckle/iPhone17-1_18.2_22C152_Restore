@interface TSTTableDataFormulaError
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)initObjectWithFormulaError:(id)a3;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation TSTTableDataFormulaError

- (id)initObjectWithFormulaError:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSTTableDataFormulaError;
  v4 = [(TSTTableDataFormulaError *)&v6 init];
  if (v4)
  {
    v4->mFormulaError = (TSWPStorage *)a3;
    v4->super.mRefCount = 1;
  }
  return v4;
}

- (unint64_t)hash
{
  BOOL v3 = [(TSWPStorage *)self->mFormulaError canBeStoredInAStringValueCell];
  mFormulaError = self->mFormulaError;
  if (v3) {
    mFormulaError = [(TSWPStorage *)mFormulaError string];
  }

  return [(TSWPStorage *)mFormulaError hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  mFormulaError = self->mFormulaError;
  uint64_t v6 = *((void *)a3 + 2);

  return [(TSWPStorage *)mFormulaError isEqual:v6];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"refCount: %d   mFormulaError: %@", self->super.mRefCount, self->mFormulaError];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataFormulaError;
  [(TSTTableDataFormulaError *)&v3 dealloc];
}

@end