@interface GQDTFormulaCell
- (id)resultCell;
- (void)dealloc;
- (void)setResultCell:(id)a3;
@end

@implementation GQDTFormulaCell

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)GQDTFormulaCell;
  [(GQDTCell *)&v3 dealloc];
}

- (id)resultCell
{
  return self->mResultCell;
}

- (void)setResultCell:(id)a3
{
  id v5 = a3;

  self->mResultCell = (GQDTCell *)a3;
}

@end