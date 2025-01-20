@interface ML3DatabaseCachedRow
- (ML3DatabaseCachedRow)initWithArray:(id)a3;
- (ML3DatabaseCachedRow)initWithParentResult:(id)a3;
- (const)cStringForColumnIndex:(unint64_t)a3;
- (const)cStringForColumnName:(id)a3;
- (double)doubleForColumnIndex:(unint64_t)a3;
- (double)doubleForColumnName:(id)a3;
- (id)_numberOrZeroForColumnIndex:(unint64_t)a3;
- (id)arrayRepresentation;
- (id)dataForColumnName:(id)a3;
- (id)dictionaryRepresentation;
- (id)numberForColumnName:(id)a3;
- (id)stringForColumnName:(id)a3;
- (id)valueForColumnIndex:(unint64_t)a3;
- (id)valueForColumnName:(id)a3;
- (int)intForColumnIndex:(unint64_t)a3;
- (int)intForColumnName:(id)a3;
- (int64_t)int64ForColumnIndex:(unint64_t)a3;
- (int64_t)int64ForColumnName:(id)a3;
- (unint64_t)columnCount;
- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnIndex:(unint64_t)a5;
- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnName:(id)a5;
@end

@implementation ML3DatabaseCachedRow

- (void).cxx_destruct
{
}

- (id)valueForColumnName:(id)a3
{
  return 0;
}

- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnName:(id)a5
{
}

- (id)numberForColumnName:(id)a3
{
  return 0;
}

- (id)stringForColumnName:(id)a3
{
  return 0;
}

- (const)cStringForColumnName:(id)a3
{
  return 0;
}

- (int64_t)int64ForColumnName:(id)a3
{
  return 0;
}

- (int)intForColumnName:(id)a3
{
  return 0;
}

- (double)doubleForColumnName:(id)a3
{
  return 0.0;
}

- (id)dataForColumnName:(id)a3
{
  return 0;
}

- (id)_numberOrZeroForColumnIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_arrayRepresentation objectAtIndex:a3];
  if (!v3
    || ([MEMORY[0x1E4F1CA98] null],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3 == v4))
  {

    v3 = &unk_1F09125B0;
  }

  return v3;
}

- (id)arrayRepresentation
{
  v2 = (void *)[(NSArray *)self->_arrayRepresentation copy];

  return v2;
}

- (id)dictionaryRepresentation
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSArray count](self->_arrayRepresentation, "count"));
  if ([(NSArray *)self->_arrayRepresentation count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [(NSArray *)self->_arrayRepresentation objectAtIndexedSubscript:v4];
      v6 = [NSNumber numberWithUnsignedInteger:v4];
      [v3 setObject:v5 forKey:v6];

      ++v4;
    }
    while (v4 < [(NSArray *)self->_arrayRepresentation count]);
  }

  return v3;
}

- (id)valueForColumnIndex:(unint64_t)a3
{
  v3 = [(NSArray *)self->_arrayRepresentation objectAtIndex:a3];
  unint64_t v4 = [MEMORY[0x1E4F1CA98] null];

  if (v3 == v4)
  {

    v3 = 0;
  }

  return v3;
}

- (void)getBlobBytes:(const void *)a3 outLength:(int *)a4 forColumnIndex:(unint64_t)a5
{
  v9 = [(ML3DatabaseCachedRow *)self dataForColumnIndex:a5];
  if (v9)
  {
    id v11 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2 object:self file:@"ML3DatabaseCachedRow.m" lineNumber:80 description:@"Attempted to read cached blob data from non-NSData type."];
    }
    *a4 = [v11 length];
    v9 = (void *)[v11 bytes];
  }
  else
  {
    *a4 = 0;
  }
  *a3 = v9;

  MEMORY[0x1F41817F8]();
}

- (const)cStringForColumnIndex:(unint64_t)a3
{
  id v3 = [(ML3DatabaseCachedRow *)self valueForColumnIndex:a3];
  unint64_t v4 = (const char *)[v3 UTF8String];

  return v4;
}

- (int64_t)int64ForColumnIndex:(unint64_t)a3
{
  id v3 = [(ML3DatabaseCachedRow *)self _numberOrZeroForColumnIndex:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (int)intForColumnIndex:(unint64_t)a3
{
  id v3 = [(ML3DatabaseCachedRow *)self _numberOrZeroForColumnIndex:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (double)doubleForColumnIndex:(unint64_t)a3
{
  id v3 = [(ML3DatabaseCachedRow *)self _numberOrZeroForColumnIndex:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (unint64_t)columnCount
{
  return [(NSArray *)self->_arrayRepresentation count];
}

- (ML3DatabaseCachedRow)initWithParentResult:(id)a3
{
  return self;
}

- (ML3DatabaseCachedRow)initWithArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ML3DatabaseCachedRow;
  v6 = [(ML3DatabaseRow *)&v9 initWithParentResult:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_arrayRepresentation, a3);
  }

  return v7;
}

@end