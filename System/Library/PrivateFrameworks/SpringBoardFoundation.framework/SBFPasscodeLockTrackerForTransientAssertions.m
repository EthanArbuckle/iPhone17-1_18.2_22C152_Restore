@interface SBFPasscodeLockTrackerForTransientAssertions
- (BOOL)isAssertionValid:(id)a3;
- (id)mkbAssertionOptions;
@end

@implementation SBFPasscodeLockTrackerForTransientAssertions

- (id)mkbAssertionOptions
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"SBTransient", @"MKBAssertionKey", 0);
}

- (BOOL)isAssertionValid:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBFPasscodeLockTrackerForTransientAssertions;
  BOOL v4 = [(SBFAuthenticationAssertionTracker *)&v6 isAssertionValid:a3];
  if (v4) {
    LOBYTE(v4) = self->super._mkbAssertion != 0;
  }
  return v4;
}

@end