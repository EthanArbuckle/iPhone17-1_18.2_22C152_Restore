@interface CKKSZoneChangeFetchDependencyOperation
- (CKKSZoneChangeFetchDependencyOperation)init;
- (CKKSZoneChangeFetcher)owner;
- (id)descriptionError;
- (void)setOwner:(id)a3;
@end

@implementation CKKSZoneChangeFetchDependencyOperation

- (void).cxx_destruct
{
}

- (void)setOwner:(id)a3
{
}

- (CKKSZoneChangeFetcher)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);

  return (CKKSZoneChangeFetcher *)WeakRetained;
}

- (id)descriptionError
{
  v2 = [(CKKSZoneChangeFetchDependencyOperation *)self owner];
  v3 = [v2 lastCKFetchError];
  v4 = +[NSError errorWithDomain:@"CKKSResultOperationDescriptionError" code:2 description:@"Fetch failed" underlying:v3];

  return v4;
}

- (CKKSZoneChangeFetchDependencyOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)CKKSZoneChangeFetchDependencyOperation;
  return [(CKKSResultOperation *)&v3 init];
}

@end