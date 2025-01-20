@interface MFAuthScheme
+ (id)authSchemesForAccount:(id)a3 connection:(id)a4;
+ (id)knownSchemes;
+ (id)schemeWithName:(id)a3;
+ (void)initialize;
+ (void)registerSchemeClass:(Class)a3;
- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4;
- (BOOL)hasEncryption;
- (BOOL)requiresPassword;
- (Class)authenticatorClass;
- (Class)connectionClassForAccountClass:(Class)a3;
- (id)authenticatorForAccount:(id)a3 connection:(id)a4;
- (id)humanReadableName;
- (id)name;
- (unsigned)defaultPortForAccount:(id)a3;
@end

@implementation MFAuthScheme

+ (void)initialize
{
  if (!_schemesByName)
  {
    uint64_t v3 = 0;
    _schemesByName = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
    do
    {
      Class v4 = NSClassFromString(&initialize_schemes[v3]->isa);
      if (v4) {
        [a1 registerSchemeClass:v4];
      }
      ++v3;
    }
    while (v3 != 4);
  }
}

+ (void)registerSchemeClass:(Class)a3
{
  if (a3)
  {
    id v4 = (id)[objc_allocWithZone(a3) init];
    uint64_t v3 = [v4 name];
    if (v3) {
      [(id)_schemesByName setObject:v4 forKey:v3];
    }
  }
}

+ (id)knownSchemes
{
  return (id)[(id)_schemesByName allValues];
}

+ (id)schemeWithName:(id)a3
{
  return (id)[(id)_schemesByName objectForKey:a3];
}

+ (id)authSchemesForAccount:(id)a3 connection:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[a4 authenticationMechanisms];
  id v15 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(__CFString **)(*((void *)&v16 + 1) + 8 * i);
        if ([@"PLAIN" isEqualToString:v10]) {
          v11 = &stru_1F265CF90;
        }
        else {
          v11 = v10;
        }
        v12 = +[MFAuthScheme schemeWithName:v11];
        if (v12)
        {
          v13 = v12;
          if ([(MFAuthScheme *)v12 canAuthenticateAccountClass:objc_opt_class() connection:a4])
          {
            if ([v15 indexOfObject:v13] == 0x7FFFFFFFFFFFFFFFLL) {
              [v15 addObject:v13];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
  return v15;
}

- (Class)connectionClassForAccountClass:(Class)a3
{
  return 0;
}

- (Class)authenticatorClass
{
  return 0;
}

- (unsigned)defaultPortForAccount:(id)a3
{
  return 0;
}

- (BOOL)hasEncryption
{
  return 0;
}

- (BOOL)canAuthenticateAccountClass:(Class)a3 connection:(id)a4
{
  return [(MFAuthScheme *)self authenticatorClass]
      || [(MFAuthScheme *)self connectionClassForAccountClass:a3] != 0;
}

- (id)authenticatorForAccount:(id)a3 connection:(id)a4
{
  id result = [(MFAuthScheme *)self authenticatorClass];
  if (result)
  {
    uint64_t v8 = (void *)[objc_alloc((Class)result) initWithAuthScheme:self account:a3 connection:a4];
    return v8;
  }
  return result;
}

- (BOOL)requiresPassword
{
  return 1;
}

- (id)name
{
  return 0;
}

- (id)humanReadableName
{
  return 0;
}

@end