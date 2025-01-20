@interface OADQuarterEllipseToPathElement
- (BOOL)startsVertical;
- (OADQuarterEllipseToPathElement)initWithToPoint:(OADAdjustPoint)a3 startsVertical:(BOOL)a4;
@end

@implementation OADQuarterEllipseToPathElement

- (OADQuarterEllipseToPathElement)initWithToPoint:(OADAdjustPoint)a3 startsVertical:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)OADQuarterEllipseToPathElement;
  result = -[OADToPointPathElement initWithToPoint:](&v6, sel_initWithToPoint_, *(void *)&a3.x, *(void *)&a3.y);
  if (result) {
    *(&result->super.mRelative + 1) = a4;
  }
  return result;
}

- (BOOL)startsVertical
{
  return *(&self->super.mRelative + 1);
}

@end