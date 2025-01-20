@interface PUBlockValueFilter
- (double)updatedValue:(double)a3 withTargetValue:(double)a4;
- (id)operationBlock;
- (void)setOperationBlock:(id)a3;
@end

@implementation PUBlockValueFilter

- (void).cxx_destruct
{
}

- (void)setOperationBlock:(id)a3
{
}

- (id)operationBlock
{
  return self->_operationBlock;
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4
{
  v6 = [(PUBlockValueFilter *)self operationBlock];
  double v7 = v6[2](a4, a3);

  return v7;
}

@end