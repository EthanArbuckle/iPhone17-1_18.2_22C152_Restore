@interface SiriCoreSQLiteQueryRange
- (SiriCoreSQLiteQueryRange)initWithLimit:(unint64_t)a3;
- (SiriCoreSQLiteQueryRange)initWithLimit:(unint64_t)a3 offset:(unint64_t)a4;
- (unint64_t)limit;
- (unint64_t)offset;
@end

@implementation SiriCoreSQLiteQueryRange

- (unint64_t)offset
{
  return self->_offset;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (SiriCoreSQLiteQueryRange)initWithLimit:(unint64_t)a3 offset:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SiriCoreSQLiteQueryRange;
  result = [(SiriCoreSQLiteQueryRange *)&v7 init];
  if (result)
  {
    result->_limit = a3;
    result->_offset = a4;
  }
  return result;
}

- (SiriCoreSQLiteQueryRange)initWithLimit:(unint64_t)a3
{
  return [(SiriCoreSQLiteQueryRange *)self initWithLimit:a3 offset:0];
}

@end