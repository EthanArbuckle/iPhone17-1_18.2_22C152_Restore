@interface CloudLibraryOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)isPersistent;
- (CloudLibraryConnection)connection;
- (CloudLibraryOperation)init;
- (CloudLibraryOperation)initWithCoder:(id)a3;
- (CloudLibraryOperation)initWithConfiguration:(id)a3;
- (CloudLibraryOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4;
- (ICConnectionConfiguration)configuration;
- (ICUserIdentity)userIdentity;
- (ICUserIdentityStore)userIdentityStore;
- (ML3MusicLibrary)musicLibrary;
- (NSError)error;
- (NSString)libraryIdentifier;
- (OS_tcc_identity)clientIdentity;
- (id)description;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setConnection:(id)a3;
- (void)setError:(id)a3;
- (void)setLibraryIdentifier:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation CloudLibraryOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_musicLibrary, 0);
  objc_storeStrong((id *)&self->_userIdentityStore, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)description
{
  return +[NSString stringWithFormat:@"%@ %p", objc_opt_class(), self];
}

- (CloudLibraryOperation)initWithConfiguration:(id)a3 clientIdentity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CloudLibraryOperation;
  v9 = [(CloudLibraryOperation *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    uint64_t v11 = [v7 userIdentity];
    userIdentity = v10->_userIdentity;
    v10->_userIdentity = (ICUserIdentity *)v11;

    uint64_t v13 = [v7 userIdentityStore];
    userIdentityStore = v10->_userIdentityStore;
    v10->_userIdentityStore = (ICUserIdentityStore *)v13;

    objc_storeStrong((id *)&v10->_clientIdentity, a4);
    v15 = [v7 userIdentity];
    uint64_t v16 = +[ML3MusicLibrary musicLibraryForUserAccount:v15];
    musicLibrary = v10->_musicLibrary;
    v10->_musicLibrary = (ML3MusicLibrary *)v16;
  }
  return v10;
}

- (CloudLibraryConnection)connection
{
  return self->_connection;
}

- (ML3MusicLibrary)musicLibrary
{
  return self->_musicLibrary;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setLibraryIdentifier:(id)a3
{
}

- (void)setError:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (OS_tcc_identity)clientIdentity
{
  return self->_clientIdentity;
}

- (BOOL)isPersistent
{
  return self->_persistent;
}

- (ICUserIdentityStore)userIdentityStore
{
  return self->_userIdentityStore;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(CloudLibraryOperation *)self configuration];
  [v5 encodeObject:v4 forKey:@"configuration"];

  [v5 encodeTCCIdentity:self->_clientIdentity forKey:@"clientIdentity"];
}

- (CloudLibraryOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configuration"];
  v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = (id)objc_opt_new();
  }
  id v8 = v7;

  v9 = [v4 decodeTCCIdentityForKey:@"clientIdentity"];
  v10 = [(CloudLibraryOperation *)self initWithConfiguration:v8 clientIdentity:v9];

  return v10;
}

- (CloudLibraryOperation)initWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = MSVTCCIdentityForCurrentProcess();
  v6 = [(CloudLibraryOperation *)self initWithConfiguration:v4 clientIdentity:v5];

  return v6;
}

- (CloudLibraryOperation)init
{
  v3 = objc_opt_new();
  id v4 = [(CloudLibraryOperation *)self initWithConfiguration:v3];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end