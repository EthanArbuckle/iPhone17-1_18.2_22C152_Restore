@interface ACMExternalAuthContext
- (id)parametersDictionary;
@end

@implementation ACMExternalAuthContext

- (id)parametersDictionary
{
  v5.receiver = self;
  v5.super_class = (Class)ACMExternalAuthContext;
  id v3 = [(ACMAuthContext *)&v5 parametersDictionary];
  [v3 setValue:[NSNumber numberWithInt:0] forKey:@"s"];
  if ([(NSNumber *)[(ACCAuthContext *)self touchIDSupport] BOOLValue]) {
    [v3 setValue:&unk_26F28F7C8 forKey:@"tid"];
  }
  return v3;
}

@end