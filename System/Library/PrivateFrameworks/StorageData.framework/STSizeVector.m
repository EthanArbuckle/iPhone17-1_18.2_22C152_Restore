@interface STSizeVector
+ (BOOL)supportsSecureCoding;
+ (id)docsAndData:(int64_t)a3;
+ (id)docsAndData:(int64_t)a3 purgeable:(int64_t)a4;
+ (id)dynamic:(int64_t)a3 purgeable:(int64_t)a4;
+ (id)fixed:(int64_t)a3;
+ (id)fixed:(int64_t)a3 docsAndData:(int64_t)a4;
+ (id)fixed:(int64_t)a3 docsAndData:(int64_t)a4 purgeable:(int64_t)a5;
+ (id)fixed:(int64_t)a3 dynamic:(int64_t)a4 purgeable:(int64_t)a5;
+ (id)fixed:(int64_t)a3 purgeable:(int64_t)a4;
+ (id)purgeable:(int64_t)a3;
+ (id)zero;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSizeVector:(id)a3;
- (BOOL)isZero;
- (STSizeVector)initWithCoder:(id)a3;
- (STSizeVector)initWithFixed:(int64_t)a3 docsAndData:(int64_t)a4 purgeable:(int64_t)a5;
- (id)plus:(id)a3;
- (int64_t)docsAndData;
- (int64_t)dynamic;
- (int64_t)fixed;
- (int64_t)purgeable;
- (int64_t)userTotal;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STSizeVector

- (BOOL)isEqual:(id)a3
{
  v4 = (STSizeVector *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(STSizeVector *)self isEqualToSizeVector:v4];
  }

  return v5;
}

- (BOOL)isEqualToSizeVector:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4
    && (int64_t docsAndData = self->_docsAndData, docsAndData == [v4 docsAndData])
    && (int64_t fixed = self->_fixed, fixed == [v5 fixed]))
  {
    int64_t purgeable = self->_purgeable;
    BOOL v9 = purgeable == [v5 purgeable];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return self->_docsAndData + 13 * self->_fixed + 65 * self->_purgeable;
}

- (BOOL)isZero
{
  return !self->_docsAndData && !self->_purgeable && self->_fixed == 0;
}

- (int64_t)dynamic
{
  return self->_purgeable + self->_docsAndData;
}

- (int64_t)userTotal
{
  return self->_fixed + self->_docsAndData;
}

+ (id)zero
{
  if (zero_onceToken != -1) {
    dispatch_once(&zero_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)zero;

  return v2;
}

uint64_t __20__STSizeVector_zero__block_invoke()
{
  zero = +[STSizeVector fixed:0];

  return MEMORY[0x270F9A758]();
}

- (id)plus:(id)a3
{
  id v4 = a3;
  BOOL v5 = [STSizeVector alloc];
  int64_t fixed = self->_fixed;
  uint64_t v7 = [v4 fixed] + fixed;
  int64_t docsAndData = self->_docsAndData;
  uint64_t v9 = [v4 docsAndData] + docsAndData;
  int64_t purgeable = self->_purgeable;
  uint64_t v11 = [v4 purgeable];

  v12 = [(STSizeVector *)v5 initWithFixed:v7 docsAndData:v9 purgeable:v11 + purgeable];

  return v12;
}

- (STSizeVector)initWithFixed:(int64_t)a3 docsAndData:(int64_t)a4 purgeable:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)STSizeVector;
  result = [(STSizeVector *)&v9 init];
  if (result)
  {
    result->_int64_t fixed = a3;
    result->_int64_t docsAndData = a4;
    result->_int64_t purgeable = a5;
  }
  return result;
}

+ (id)fixed:(int64_t)a3
{
  return (id)[a1 fixed:a3 docsAndData:0 purgeable:0];
}

+ (id)docsAndData:(int64_t)a3
{
  return (id)[a1 fixed:0 docsAndData:a3 purgeable:0];
}

+ (id)purgeable:(int64_t)a3
{
  return (id)[a1 fixed:0 docsAndData:0 purgeable:a3];
}

+ (id)fixed:(int64_t)a3 docsAndData:(int64_t)a4
{
  return (id)[a1 fixed:a3 docsAndData:a4 purgeable:0];
}

+ (id)fixed:(int64_t)a3 purgeable:(int64_t)a4
{
  return (id)[a1 fixed:a3 docsAndData:0 purgeable:a4];
}

+ (id)docsAndData:(int64_t)a3 purgeable:(int64_t)a4
{
  return (id)[a1 fixed:0 docsAndData:a3 purgeable:a4];
}

+ (id)dynamic:(int64_t)a3 purgeable:(int64_t)a4
{
  return (id)[a1 fixed:0 docsAndData:a3 - a4 purgeable:a4];
}

+ (id)fixed:(int64_t)a3 docsAndData:(int64_t)a4 purgeable:(int64_t)a5
{
  BOOL v5 = (void *)[objc_alloc((Class)a1) initWithFixed:a3 docsAndData:a4 purgeable:a5];

  return v5;
}

+ (id)fixed:(int64_t)a3 dynamic:(int64_t)a4 purgeable:(int64_t)a5
{
  BOOL v5 = (void *)[objc_alloc((Class)a1) initWithFixed:a3 docsAndData:a4 - a5 purgeable:a5];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t fixed = self->_fixed;
  id v5 = a3;
  [v5 encodeInt64:fixed forKey:@"fixed"];
  [v5 encodeInt64:self->_docsAndData forKey:@"docsAndData"];
  [v5 encodeInt64:self->_purgeable forKey:@"purgeable"];
}

- (STSizeVector)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)STSizeVector;
  id v5 = [(STSizeVector *)&v7 init];
  if (v5)
  {
    v5->_int64_t fixed = [v4 decodeInt64ForKey:@"fixed"];
    v5->_int64_t docsAndData = [v4 decodeInt64ForKey:@"docsAndData"];
    v5->_int64_t purgeable = [v4 decodeInt64ForKey:@"purgeable"];
  }

  return v5;
}

- (int64_t)fixed
{
  return self->_fixed;
}

- (int64_t)docsAndData
{
  return self->_docsAndData;
}

- (int64_t)purgeable
{
  return self->_purgeable;
}

@end