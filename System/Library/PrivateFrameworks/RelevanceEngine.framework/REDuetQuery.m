@interface REDuetQuery
- (_DKQuery)query;
- (id)transformBlock;
- (int64_t)offset;
- (void)setOffset:(int64_t)a3;
- (void)setQuery:(id)a3;
- (void)setTransformBlock:(id)a3;
@end

@implementation REDuetQuery

- (void)setOffset:(int64_t)a3
{
}

- (int64_t)offset
{
  return [(_DKQuery *)self->_query offset];
}

- (id)transformBlock
{
  return self->_transformBlock;
}

- (void)setTransformBlock:(id)a3
{
}

- (_DKQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong(&self->_transformBlock, 0);
}

@end