@interface TRISQLiteCKQueryCursor
- (CKQuery)query;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)offset;
- (void)setOffset:(unint64_t)a3;
- (void)setQuery:(id)a3;
@end

@implementation TRISQLiteCKQueryCursor

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(TRISQLiteCKQueryCursor *)self query];
  v6 = (void *)[v5 copy];
  [v4 setQuery:v6];

  objc_msgSend(v4, "setOffset:", -[TRISQLiteCKQueryCursor offset](self, "offset"));
  return v4;
}

- (CKQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (void).cxx_destruct
{
}

@end