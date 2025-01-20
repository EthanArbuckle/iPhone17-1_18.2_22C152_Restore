@interface STSetRequest
+ (id)registeredClassName;
+ (id)registeredIdentifier;
+ (id)requestWithUUID:(id)a3 withSyncToken:(id)a4 withDeclarations:(id)a5;
- (BOOL)loadRequestFromDictionary:(id)a3 error:(id *)a4;
- (NSArray)declarations;
- (NSString)syncToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)serialize;
- (void)setDeclarations:(id)a3;
- (void)setSyncToken:(id)a3;
@end

@implementation STSetRequest

+ (id)registeredClassName
{
  return @"Requests";
}

+ (id)registeredIdentifier
{
  return @"Set";
}

+ (id)requestWithUUID:(id)a3 withSyncToken:(id)a4 withDeclarations:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_opt_new();
  [v10 setRequestUUID:v9];

  [v10 setRequestType:@"Set"];
  [v10 setSyncToken:v8];

  [v10 setDeclarations:v7];
  return v10;
}

- (BOOL)loadRequestFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)STSetRequest;
  if ([(STRemoteManagementRequest *)&v16 loadRequestFromDictionary:v6 error:a4])
  {
    id v15 = 0;
    id v7 = [(STSetRequest *)self loadStringFromDictionary:v6 withKey:@"SyncToken" isRequired:1 defaultValue:0 error:&v15];
    id v8 = v15;
    syncToken = self->_syncToken;
    self->_syncToken = v7;

    if (!v8)
    {
      id v14 = 0;
      v10 = [(STSetRequest *)self loadArrayFromDictionary:v6 withKey:@"Declarations" validator:&stru_1002FE418 isRequired:0 defaultValue:0 error:&v14];
      id v8 = v14;
      declarations = self->_declarations;
      self->_declarations = v10;
    }
    BOOL v12 = v8 == 0;
    if (a4 && v8) {
      *a4 = v8;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)serialize
{
  v3 = +[NSMutableDictionary dictionary];
  v7.receiver = self;
  v7.super_class = (Class)STSetRequest;
  v4 = [(STRemoteManagementRequest *)&v7 serialize];
  [v3 addEntriesFromDictionary:v4];

  [(STSetRequest *)self serializeStringIntoDictionary:v3 withKey:@"SyncToken" withValue:self->_syncToken isRequired:1 defaultValue:0];
  [(STSetRequest *)self serializeArrayIntoDictionary:v3 withKey:@"Declarations" withValue:self->_declarations itemSerializer:&stru_1002FE458 isRequired:0 defaultValue:0];
  id v5 = [v3 copy];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)STSetRequest;
  v4 = [(STRemoteManagementRequest *)&v10 copyWithZone:a3];
  id v5 = [(NSString *)self->_syncToken copy];
  id v6 = (void *)v4[4];
  v4[4] = v5;

  id v7 = [(NSArray *)self->_declarations copy];
  id v8 = (void *)v4[5];
  v4[5] = v7;

  return v4;
}

- (NSString)syncToken
{
  return self->_syncToken;
}

- (void)setSyncToken:(id)a3
{
}

- (NSArray)declarations
{
  return self->_declarations;
}

- (void)setDeclarations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_declarations, 0);
  objc_storeStrong((id *)&self->_syncToken, 0);
}

@end