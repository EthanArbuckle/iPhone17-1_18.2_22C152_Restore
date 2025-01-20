@interface MLDDatabaseIntegrityCheck
- (NSArray)faults;
- (NSString)databasePath;
- (void)setDatabasePath:(id)a3;
- (void)setFaults:(id)a3;
@end

@implementation MLDDatabaseIntegrityCheck

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faults, 0);

  objc_storeStrong((id *)&self->_databasePath, 0);
}

- (void)setFaults:(id)a3
{
}

- (NSArray)faults
{
  return self->_faults;
}

- (void)setDatabasePath:(id)a3
{
}

- (NSString)databasePath
{
  return self->_databasePath;
}

@end