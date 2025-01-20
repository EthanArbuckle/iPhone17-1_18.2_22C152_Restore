@interface SSTokenMatch
- (BOOL)exactMatchAtFirstPosition;
- (NSMutableArray)indexes;
- (unint64_t)type;
- (void)setIndexes:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation SSTokenMatch

- (BOOL)exactMatchAtFirstPosition
{
  if ([(SSTokenMatch *)self type] != 2) {
    return 0;
  }
  v3 = [(SSTokenMatch *)self indexes];
  char v4 = [v3 containsObject:&unk_1F1861928];

  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSMutableArray)indexes
{
  return self->_indexes;
}

- (void)setIndexes:(id)a3
{
}

- (void).cxx_destruct
{
}

@end