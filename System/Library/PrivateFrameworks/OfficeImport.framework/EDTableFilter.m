@interface EDTableFilter
+ (id)edTableFilter;
- (double)filterValue;
- (double)value;
- (id)description;
- (int)operatorType;
- (int)scale;
- (void)setFilterValue:(double)a3;
- (void)setOperatorType:(int)a3;
- (void)setScale:(int)a3;
- (void)setValue:(double)a3;
@end

@implementation EDTableFilter

+ (id)edTableFilter
{
  v2 = objc_alloc_init(EDTableFilter);
  return v2;
}

- (double)value
{
  return self->mValue;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
}

- (double)filterValue
{
  return self->mFilterValue;
}

- (void)setFilterValue:(double)a3
{
  self->mFilterValue = a3;
}

- (int)scale
{
  return self->mScale;
}

- (void)setScale:(int)a3
{
  self->mScale = a3;
}

- (int)operatorType
{
  return self->mOperator;
}

- (void)setOperatorType:(int)a3
{
  self->mOperator = a3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDTableFilter;
  v2 = [(EDTableFilter *)&v4 description];
  return v2;
}

@end