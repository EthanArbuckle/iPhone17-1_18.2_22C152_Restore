@interface _TUIElementPageControlBuilder
- (unint64_t)kind;
- (void)setKind:(unint64_t)a3;
@end

@implementation _TUIElementPageControlBuilder

- (unint64_t)kind
{
  return self->_kind;
}

- (void)setKind:(unint64_t)a3
{
  self->_kind = a3;
}

@end