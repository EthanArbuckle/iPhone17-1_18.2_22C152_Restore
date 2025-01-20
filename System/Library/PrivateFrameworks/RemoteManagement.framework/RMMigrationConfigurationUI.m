@interface RMMigrationConfigurationUI
- (BOOL)executeReturningError:(id *)a3;
- (NSString)identifier;
- (id)_context;
@end

@implementation RMMigrationConfigurationUI

- (NSString)identifier
{
  return (NSString *)@"RMMigrationConfigurationUI";
}

- (BOOL)executeReturningError:(id *)a3
{
  [(RMMigrationConfigurationUI *)self _context];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_100050EDC;
  v15 = sub_100050EEC;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100050EF4;
  v8[3] = &unk_1000C6310;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  v10 = &v11;
  [v4 performBlockAndWait:v8];
  if (a3)
  {
    v5 = (void *)v12[5];
    if (v5) {
      *a3 = v5;
    }
  }
  BOOL v6 = v12[5] == 0;

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)_context
{
  v2 = +[RMPersistentController sharedController];
  v3 = [v2 persistentContainer];

  id v4 = [v3 newBackgroundContext];

  return v4;
}

@end