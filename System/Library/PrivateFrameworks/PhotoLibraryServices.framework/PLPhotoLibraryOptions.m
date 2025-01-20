@interface PLPhotoLibraryOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)automaticallyMergesContext;
- (BOOL)automaticallyPinToFirstFetch;
- (BOOL)preventsWaitingForRequiredState;
- (BOOL)refreshesAfterSave;
- (BOOL)rollbackOnErrors;
- (PLPhotoLibraryOptions)init;
- (PLPhotoLibraryOptions)initWithCoder:(id)a3;
- (int64_t)requiredState;
- (unint64_t)libraryInitiator;
- (unint64_t)libraryRole;
- (void)encodeWithCoder:(id)a3;
- (void)setAutomaticallyMergesContext:(BOOL)a3;
- (void)setAutomaticallyPinToFirstFetch:(BOOL)a3;
- (void)setLibraryInitiator:(unint64_t)a3;
- (void)setLibraryRole:(unint64_t)a3;
- (void)setPreventsWaitingForRequiredState:(BOOL)a3;
- (void)setRefreshesAfterSave:(BOOL)a3;
- (void)setRequiredState:(int64_t)a3;
- (void)setRollbackOnErrors:(BOOL)a3;
@end

@implementation PLPhotoLibraryOptions

- (void)setLibraryInitiator:(unint64_t)a3
{
  self->_libraryInitiator = a3;
}

- (unint64_t)libraryInitiator
{
  return self->_libraryInitiator;
}

- (void)setPreventsWaitingForRequiredState:(BOOL)a3
{
  self->_preventsWaitingForRequiredState = a3;
}

- (BOOL)preventsWaitingForRequiredState
{
  return self->_preventsWaitingForRequiredState;
}

- (void)setLibraryRole:(unint64_t)a3
{
  self->_libraryRole = a3;
}

- (unint64_t)libraryRole
{
  return self->_libraryRole;
}

- (void)setRequiredState:(int64_t)a3
{
  self->_requiredState = a3;
}

- (int64_t)requiredState
{
  return self->_requiredState;
}

- (void)setRollbackOnErrors:(BOOL)a3
{
  self->_rollbackOnErrors = a3;
}

- (BOOL)rollbackOnErrors
{
  return self->_rollbackOnErrors;
}

- (void)setAutomaticallyPinToFirstFetch:(BOOL)a3
{
  self->_automaticallyPinToFirstFetch = a3;
}

- (BOOL)automaticallyPinToFirstFetch
{
  return self->_automaticallyPinToFirstFetch;
}

- (void)setRefreshesAfterSave:(BOOL)a3
{
  self->_refreshesAfterSave = a3;
}

- (BOOL)refreshesAfterSave
{
  return self->_refreshesAfterSave;
}

- (void)setAutomaticallyMergesContext:(BOOL)a3
{
  self->_automaticallyMergesContext = a3;
}

- (BOOL)automaticallyMergesContext
{
  return self->_automaticallyMergesContext;
}

- (PLPhotoLibraryOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PLPhotoLibraryOptions *)self init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"automaticallyMergesContext"];
    v5->_automaticallyMergesContext = [v6 BOOLValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requiredState"];
    v5->_requiredState = [v7 integerValue];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryRole"];
    v5->_libraryRole = [v8 unsignedIntegerValue];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preventsWaitingForRequiredState"];
    v5->_preventsWaitingForRequiredState = [v9 BOOLValue];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"libraryInitiator"];
    v5->_libraryInitiator = [v10 unsignedIntegerValue];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"refreshesAfterSave"];
    v5->_refreshesAfterSave = [v11 BOOLValue];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"automaticallyPinToFirstFetch"];
    v5->_automaticallyPinToFirstFetch = [v12 BOOLValue];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rollbackOnErrors"];
    v5->_rollbackOnErrors = [v13 BOOLValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  BOOL automaticallyMergesContext = self->_automaticallyMergesContext;
  id v6 = a3;
  v7 = [v4 numberWithBool:automaticallyMergesContext];
  [v6 encodeObject:v7 forKey:@"automaticallyMergesContext"];

  v8 = [NSNumber numberWithInteger:self->_requiredState];
  [v6 encodeObject:v8 forKey:@"requiredState"];

  v9 = [NSNumber numberWithUnsignedInteger:self->_libraryRole];
  [v6 encodeObject:v9 forKey:@"libraryRole"];

  v10 = [NSNumber numberWithBool:self->_preventsWaitingForRequiredState];
  [v6 encodeObject:v10 forKey:@"preventsWaitingForRequiredState"];

  v11 = [NSNumber numberWithUnsignedInteger:self->_libraryInitiator];
  [v6 encodeObject:v11 forKey:@"libraryInitiator"];

  v12 = [NSNumber numberWithBool:self->_refreshesAfterSave];
  [v6 encodeObject:v12 forKey:@"refreshesAfterSave"];

  v13 = [NSNumber numberWithBool:self->_automaticallyPinToFirstFetch];
  [v6 encodeObject:v13 forKey:@"automaticallyPinToFirstFetch"];

  id v14 = [NSNumber numberWithBool:self->_rollbackOnErrors];
  [v6 encodeObject:v14 forKey:@"rollbackOnErrors"];
}

- (PLPhotoLibraryOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)PLPhotoLibraryOptions;
  v2 = [(PLPhotoLibraryOptions *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_refreshesAfterSave = 1;
    if (PLIsAssetsd()) {
      v3->_automaticallyPinToFirstFetch = 1;
    }
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end