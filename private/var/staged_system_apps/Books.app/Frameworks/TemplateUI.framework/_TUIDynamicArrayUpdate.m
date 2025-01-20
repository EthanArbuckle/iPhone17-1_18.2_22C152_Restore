@interface _TUIDynamicArrayUpdate
- (id)description;
- (unint64_t)kind;
- (unint64_t)newIndex;
- (unint64_t)oldIndex;
- (void)setKind:(unint64_t)a3;
- (void)setNewIndex:(unint64_t)a3;
- (void)setOldIndex:(unint64_t)a3;
@end

@implementation _TUIDynamicArrayUpdate

- (id)description
{
  p_isa = &self->super.isa;
  switch(self->_kind)
  {
    case 0uLL:
      v3 = +[NSNumber numberWithUnsignedInteger:self->_newIndex];
      +[NSString stringWithFormat:@"insert %@", v3];
      goto LABEL_5;
    case 1uLL:
      v3 = +[NSNumber numberWithUnsignedInteger:self->_oldIndex];
      +[NSString stringWithFormat:@"delete %@", v3];
      goto LABEL_5;
    case 2uLL:
      v3 = +[NSNumber numberWithUnsignedInteger:self->_oldIndex];
      +[NSString stringWithFormat:@"update %@", v3];
      p_isa = LABEL_5:;
      goto LABEL_7;
    case 3uLL:
      v3 = +[NSNumber numberWithUnsignedInteger:self->_oldIndex];
      v4 = +[NSNumber numberWithUnsignedInteger:p_isa[1]];
      p_isa = +[NSString stringWithFormat:@"move %@ -> %@", v3, v4];

LABEL_7:
      break;
    default:
      break;
  }

  return p_isa;
}

- (unint64_t)newIndex
{
  return self->_newIndex;
}

- (void)setNewIndex:(unint64_t)a3
{
  self->_newIndex = a3;
}

- (unint64_t)oldIndex
{
  return self->_oldIndex;
}

- (void)setOldIndex:(unint64_t)a3
{
  self->_oldIndex = a3;
}

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

@end