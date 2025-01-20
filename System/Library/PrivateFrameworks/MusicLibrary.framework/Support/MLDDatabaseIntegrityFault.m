@interface MLDDatabaseIntegrityFault
- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4;
@end

@implementation MLDDatabaseIntegrityFault

- (BOOL)attemptRecoveryUsingHandle:(sqlite3 *)a3 withError:(id *)a4
{
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  +[NSException raise:NSInternalInconsistencyException, @"%@ is abstract", v5 format];

  return 0;
}

@end