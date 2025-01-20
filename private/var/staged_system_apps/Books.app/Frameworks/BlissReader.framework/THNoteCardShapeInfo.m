@interface THNoteCardShapeInfo
- (BOOL)ignoreEquationAlignment;
- (Class)layoutClass;
- (void)setIgnoreEquationAlignment:(BOOL)a3;
@end

@implementation THNoteCardShapeInfo

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (BOOL)ignoreEquationAlignment
{
  return self->_ignoreEquationAlignment;
}

- (void)setIgnoreEquationAlignment:(BOOL)a3
{
  self->_ignoreEquationAlignment = a3;
}

@end