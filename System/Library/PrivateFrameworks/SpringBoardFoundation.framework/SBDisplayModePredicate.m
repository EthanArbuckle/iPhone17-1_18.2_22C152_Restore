@interface SBDisplayModePredicate
+ (id)allDisplays;
+ (id)forDisplay:(id)a3;
+ (id)forDisplaysSimilarToDisplay:(id)a3 useNativeSize:(BOOL)a4;
+ (id)fromDefaultsKey:(id)a3;
- (BOOL)matchesDisplay:(id)a3;
- (id)_init;
- (id)defaultsKeyRepresentation;
- (id)description;
@end

@implementation SBDisplayModePredicate

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)SBDisplayModePredicate;
  return [(SBDisplayModePredicate *)&v3 init];
}

+ (id)allDisplays
{
  return +[_SBAllDisplaysPredicate sharedInstance];
}

+ (id)forDisplaysSimilarToDisplay:(id)a3 useNativeSize:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [[_SBDisplaysWithSizePredicate alloc] initWithDisplay:v5 useNativeSize:v4];

  return v6;
}

+ (id)forDisplay:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[_SBDisplayPredicate alloc] initWithDisplay:v3];

  return v4;
}

- (BOOL)matchesDisplay:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"SBDisplayModePredicate.m" lineNumber:56 description:@"must be overridden"];

  return 0;
}

+ (id)fromDefaultsKey:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[_SBAllDisplaysPredicate fromDefaultsKey:v3];
  if (!v4)
  {
    BOOL v4 = +[_SBDisplayPredicate fromDefaultsKey:v3];
    if (!v4)
    {
      BOOL v4 = +[_SBDisplaysWithSizePredicate fromDefaultsKey:v3];
    }
  }

  return v4;
}

- (id)defaultsKeyRepresentation
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDisplayModePredicate.m" lineNumber:74 description:@"must be overridden"];

  return &stru_1ED879EF8;
}

- (id)description
{
  BOOL v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBDisplayModePredicate.m" lineNumber:79 description:@"invalid predicate"];

  return (id)[NSString stringWithFormat:@"<%@:%p> [invalid]", objc_opt_class(), self];
}

@end