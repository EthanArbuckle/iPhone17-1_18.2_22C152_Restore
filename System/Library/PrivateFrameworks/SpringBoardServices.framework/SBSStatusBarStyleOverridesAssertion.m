@interface SBSStatusBarStyleOverridesAssertion
+ (id)assertionWithStatusBarStyleOverrides:(unint64_t)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6;
+ (id)backgroundLocationAssertionForPID:(int)a3;
- (SBSStatusBarStyleOverridesAssertion)initWithStatusBarStyleOverrides:(unint64_t)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6;
- (unint64_t)statusBarStyleOverrides;
@end

@implementation SBSStatusBarStyleOverridesAssertion

+ (id)backgroundLocationAssertionForPID:(int)a3
{
  return +[SBSStatusBarStyleOverridesAssertion assertionWithStatusBarStyleOverrides:2048 forPID:*(void *)&a3 exclusive:0 showsWhenForeground:0];
}

+ (id)assertionWithStatusBarStyleOverrides:(unint64_t)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  v6 = [[SBSStatusBarStyleOverridesAssertion alloc] initWithStatusBarStyleOverrides:a3 forPID:*(void *)&a4 exclusive:a5 showsWhenForeground:a6];
  return v6;
}

- (SBSStatusBarStyleOverridesAssertion)initWithStatusBarStyleOverrides:(unint64_t)a3 forPID:(int)a4 exclusive:(BOOL)a5 showsWhenForeground:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  v10 = soft_STUIBackgroundActivityIdentifiersForStyleOverrides(a3);
  v11 = [[SBSBackgroundActivityAssertionData alloc] initWithBackgroundActivityIdentifiers:v10 forPID:v8 exclusive:v7 showsWhenForeground:v6];
  v12 = [(SBSBackgroundActivityAssertion *)self initWithBackgroundActivityAssertionData:v11];

  return v12;
}

- (unint64_t)statusBarStyleOverrides
{
  v2 = [(SBSBackgroundActivityAssertion *)self backgroundActivityIdentifiers];
  return soft_STUIStyleOverridesForBackgroundActivityIdentifiers((uint64_t)v2);
}

@end