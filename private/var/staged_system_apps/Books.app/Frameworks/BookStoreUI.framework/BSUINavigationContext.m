@interface BSUINavigationContext
- (BSUINavigationContext)init;
- (BSUINavigationContext)initWithIsInCard:(BOOL)a3 isInModal:(BOOL)a4;
@end

@implementation BSUINavigationContext

- (BSUINavigationContext)initWithIsInCard:(BOOL)a3 isInModal:(BOOL)a4
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BSUINavigationContext_isInCard) = a3;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___BSUINavigationContext_isInModal) = a4;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NavigationContext();
  return [(BSUINavigationContext *)&v5 init];
}

- (BSUINavigationContext)init
{
  result = (BSUINavigationContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end