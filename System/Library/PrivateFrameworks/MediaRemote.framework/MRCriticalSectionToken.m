@interface MRCriticalSectionToken
- (BOOL)invalidated;
- (MRCriticalSectionToken)init;
- (NSUUID)requestID;
- (id)description;
- (void)dealloc;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation MRCriticalSectionToken

- (MRCriticalSectionToken)init
{
  v6.receiver = self;
  v6.super_class = (Class)MRCriticalSectionToken;
  v2 = [(MRCriticalSectionToken *)&v6 init];
  if (v2)
  {
    v3 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    requestID = v2->_requestID;
    v2->_requestID = v3;

    v2->_invalidated = 0;
  }
  return v2;
}

- (void)dealloc
{
  if (![(MRCriticalSectionToken *)self invalidated])
  {
    v3 = [(MRCriticalSectionToken *)self requestID];
    v4 = (void *)[v3 copy];

    +[MRCriticalSectionCoordinator exitCriticalSectionUsingRequestID:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)MRCriticalSectionToken;
  [(MRCriticalSectionToken *)&v5 dealloc];
}

- (id)description
{
  v2 = NSString;
  v3 = [(MRCriticalSectionToken *)self requestID];
  v4 = [v3 UUIDString];
  objc_super v5 = [v2 stringWithFormat:@"requestID: %@", v4];

  return v5;
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
}

@end