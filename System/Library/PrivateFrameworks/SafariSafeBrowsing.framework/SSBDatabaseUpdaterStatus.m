@interface SSBDatabaseUpdaterStatus
- (NSString)provider;
- (id)_initWithDatabaseUpdaterStatus:(DatabaseUpdaterStatus)a3;
- (unint64_t)databaseUpdaterState;
@end

@implementation SSBDatabaseUpdaterStatus

- (id)_initWithDatabaseUpdaterStatus:(DatabaseUpdaterStatus)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SSBDatabaseUpdaterStatus;
  v4 = [(SSBDatabaseUpdaterStatus *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_databaseUpdaterStatus = a3;
    v6 = v4;
  }

  return v5;
}

- (NSString)provider
{
  unsigned int v2 = self->_databaseUpdaterStatus.provider - 1;
  if (v2 <= 2) {
    self = *off_263FCE408[v2];
  }

  return (NSString *)self;
}

- (unint64_t)databaseUpdaterState
{
  return self->_databaseUpdaterStatus.state;
}

@end