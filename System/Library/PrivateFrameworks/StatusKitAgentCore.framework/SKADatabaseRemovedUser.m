@interface SKADatabaseRemovedUser
- (NSDate)dateRemoved;
- (NSString)handle;
- (NSString)presenceIdentifier;
- (NSString)statusTypeIdentifier;
- (SKADatabaseRemovedUser)initWithCoreDataRemovedUser:(id)a3;
- (SKADatabaseRemovedUser)initWithHandle:(id)a3 statusTypeIdentifier:(id)a4 presenceIdentifier:(id)a5 dateRemoved:(id)a6;
@end

@implementation SKADatabaseRemovedUser

- (SKADatabaseRemovedUser)initWithCoreDataRemovedUser:(id)a3
{
  id v4 = a3;
  v5 = [v4 removedHandle];
  v6 = [v4 statusTypeIdentifier];
  v7 = [v4 presenceIdentifier];
  v8 = [v4 dateRemoved];

  v9 = [(SKADatabaseRemovedUser *)self initWithHandle:v5 statusTypeIdentifier:v6 presenceIdentifier:v7 dateRemoved:v8];
  return v9;
}

- (SKADatabaseRemovedUser)initWithHandle:(id)a3 statusTypeIdentifier:(id)a4 presenceIdentifier:(id)a5 dateRemoved:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SKADatabaseRemovedUser;
  v14 = [(SKADatabaseRemovedUser *)&v22 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    handle = v14->_handle;
    v14->_handle = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    statusTypeIdentifier = v14->_statusTypeIdentifier;
    v14->_statusTypeIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    presenceIdentifier = v14->_presenceIdentifier;
    v14->_presenceIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v14->_dateRemoved, a6);
  }

  return v14;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)statusTypeIdentifier
{
  return self->_statusTypeIdentifier;
}

- (NSString)presenceIdentifier
{
  return self->_presenceIdentifier;
}

- (NSDate)dateRemoved
{
  return self->_dateRemoved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRemoved, 0);
  objc_storeStrong((id *)&self->_presenceIdentifier, 0);
  objc_storeStrong((id *)&self->_statusTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end