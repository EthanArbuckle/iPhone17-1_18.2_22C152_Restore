@interface SBDodgingModifierEvent
- (id)description;
- (unint64_t)type;
@end

@implementation SBDodgingModifierEvent

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)SBDodgingModifierEvent;
  v3 = [(SBChainableModifierEvent *)&v8 description];
  unint64_t v4 = [(SBDodgingModifierEvent *)self type];
  if (v4 - 1 > 4) {
    v5 = @"Insertion";
  }
  else {
    v5 = off_1E6AFBF58[v4 - 1];
  }
  v6 = [v3 stringByAppendingFormat:@" %@", v5];

  return v6;
}

- (unint64_t)type
{
  return 0;
}

@end