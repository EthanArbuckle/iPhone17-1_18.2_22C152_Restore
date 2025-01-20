@interface IndexMove
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMove:(id)a3;
- (BOOL)isModified;
- (IndexMove)initWithIndexBeforeMove:(int64_t)a3 indexAfterMove:(int64_t)a4 modified:(BOOL)a5;
- (id)description;
- (int64_t)indexAfterMove;
- (int64_t)indexBeforeMove;
- (unint64_t)hash;
@end

@implementation IndexMove

- (IndexMove)initWithIndexBeforeMove:(int64_t)a3 indexAfterMove:(int64_t)a4 modified:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)IndexMove;
  v8 = [(IndexMove *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_indexBeforeMove = a3;
    v8->_indexAfterMove = a4;
    v8->_modified = a5;
    v10 = v8;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (IndexMove *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(IndexMove *)self isEqualToMove:v4];
  }

  return v5;
}

- (BOOL)isEqualToMove:(id)a3
{
  v4 = (IndexMove *)a3;
  BOOL v5 = v4 == self
    || v4
    && self->_indexBeforeMove == v4->_indexBeforeMove
    && self->_indexAfterMove == v4->_indexAfterMove
    && self->_modified == v4->_modified;

  return v5;
}

- (unint64_t)hash
{
  return self->_indexAfterMove + self->_indexBeforeMove + self->_modified;
}

- (id)description
{
  if (self->_modified) {
    v2 = @"*";
  }
  else {
    v2 = &stru_1F3C268E8;
  }
  return (id)[NSString stringWithFormat:@"[ %ld -> %ld%@ ]", self->_indexBeforeMove, self->_indexAfterMove, v2];
}

- (int64_t)indexBeforeMove
{
  return self->_indexBeforeMove;
}

- (int64_t)indexAfterMove
{
  return self->_indexAfterMove;
}

- (BOOL)isModified
{
  return self->_modified;
}

@end