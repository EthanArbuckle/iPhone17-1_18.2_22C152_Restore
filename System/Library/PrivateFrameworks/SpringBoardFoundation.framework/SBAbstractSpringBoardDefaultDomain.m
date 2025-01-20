@interface SBAbstractSpringBoardDefaultDomain
- (SBAbstractSpringBoardDefaultDomain)init;
@end

@implementation SBAbstractSpringBoardDefaultDomain

- (SBAbstractSpringBoardDefaultDomain)init
{
  return (SBAbstractSpringBoardDefaultDomain *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.springboard"];
}

@end