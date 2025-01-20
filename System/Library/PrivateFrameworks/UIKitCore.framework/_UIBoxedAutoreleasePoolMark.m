@interface _UIBoxedAutoreleasePoolMark
- (_UIBoxedAutoreleasePoolMark)initWithAutoreleasePoolMark:(void *)a3;
- (void)mark;
- (void)setMark:(void *)a3;
@end

@implementation _UIBoxedAutoreleasePoolMark

- (_UIBoxedAutoreleasePoolMark)initWithAutoreleasePoolMark:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBoxedAutoreleasePoolMark;
  result = [(_UIBoxedAutoreleasePoolMark *)&v5 init];
  if (result) {
    result->_mark = a3;
  }
  return result;
}

- (void)mark
{
  return self->_mark;
}

- (void)setMark:(void *)a3
{
  self->_mark = a3;
}

@end