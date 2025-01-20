@interface PQLQueryBuilder
- (NSError)lastError;
- (PQLQueryBuilder)init;
- (id)bindBooleanParameter:(BOOL)a3;
- (id)bindCharParameter:(char)a3;
- (id)bindDoubleParameter:(double)a3;
- (id)bindIntegerParameter:(int)a3;
- (id)bindLongParameter:(int64_t)a3;
- (id)bindObjectParameter:(id)a3;
- (id)bindParameter:(id)a3 spec:(unsigned __int8)a4;
- (id)bindShortParameter:(signed __int16)a3;
- (id)bindStringParameter:(id)a3;
- (id)bindUnsignedCharParameter:(unsigned __int8)a3;
- (id)bindUnsignedIntegerParameter:(unsigned int)a3;
- (id)bindUnsignedLongParameter:(unint64_t)a3;
- (id)bindUnsignedShortParameter:(unsigned __int16)a3;
- (void)setLastError:(id)a3;
@end

@implementation PQLQueryBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->lastError, 0);

  objc_storeStrong((id *)&self->_parameters, 0);
}

- (id)bindObjectParameter:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ([v4 conformsToProtocol:&unk_1F3831EB0]) {
      abort();
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = self;
      v7 = v5;
      uint64_t v8 = 9;
    }
    else
    {
      v6 = self;
      v7 = v5;
      uint64_t v8 = 7;
    }
    v10 = [(PQLQueryBuilder *)v6 bindParameter:v7 spec:v8];
  }
  else
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
    v10 = [(PQLQueryBuilder *)self bindParameter:v9 spec:7];
  }

  return v10;
}

- (id)bindLongParameter:(int64_t)a3
{
  id v4 = [NSNumber numberWithLong:a3];
  v5 = [(PQLQueryBuilder *)self bindParameter:v4 spec:2];

  return v5;
}

- (id)bindParameter:(id)a3 spec:(unsigned __int8)a4
{
  id v6 = a3;
  if ((unsigned __int16)self->_specLength >= 0x3E8u) {
    abort();
  }
  v7 = v6;
  [(NSMutableArray *)self->_parameters addObject:v6];
  uint64_t specLength = self->_specLength;
  self->_uint64_t specLength = specLength + 1;
  self->_spec[specLength] = a4;

  return @"?";
}

- (NSError)lastError
{
  return self->lastError;
}

- (PQLQueryBuilder)init
{
  v6.receiver = self;
  v6.super_class = (Class)PQLQueryBuilder;
  v2 = [(PQLQueryBuilder *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    parameters = v2->_parameters;
    v2->_parameters = (NSMutableArray *)v3;
  }
  return v2;
}

- (id)bindStringParameter:(id)a3
{
  return [(PQLQueryBuilder *)self bindParameter:a3 spec:4];
}

- (id)bindDoubleParameter:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  v5 = [(PQLQueryBuilder *)self bindParameter:v4 spec:3];

  return v5;
}

- (id)bindBooleanParameter:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  v5 = [(PQLQueryBuilder *)self bindParameter:v4 spec:0];

  return v5;
}

- (id)bindCharParameter:(char)a3
{
  id v4 = [NSNumber numberWithChar:a3];
  v5 = [(PQLQueryBuilder *)self bindParameter:v4 spec:0];

  return v5;
}

- (id)bindUnsignedCharParameter:(unsigned __int8)a3
{
  id v4 = [NSNumber numberWithUnsignedChar:a3];
  v5 = [(PQLQueryBuilder *)self bindParameter:v4 spec:1];

  return v5;
}

- (id)bindShortParameter:(signed __int16)a3
{
  id v4 = [NSNumber numberWithShort:a3];
  v5 = [(PQLQueryBuilder *)self bindParameter:v4 spec:0];

  return v5;
}

- (id)bindUnsignedShortParameter:(unsigned __int16)a3
{
  id v4 = [NSNumber numberWithUnsignedShort:a3];
  v5 = [(PQLQueryBuilder *)self bindParameter:v4 spec:1];

  return v5;
}

- (id)bindIntegerParameter:(int)a3
{
  id v4 = [NSNumber numberWithInt:*(void *)&a3];
  v5 = [(PQLQueryBuilder *)self bindParameter:v4 spec:0];

  return v5;
}

- (id)bindUnsignedIntegerParameter:(unsigned int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(PQLQueryBuilder *)self bindParameter:v4 spec:1];

  return v5;
}

- (id)bindUnsignedLongParameter:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedLong:a3];
  v5 = [(PQLQueryBuilder *)self bindParameter:v4 spec:2];

  return v5;
}

- (void)setLastError:(id)a3
{
}

@end