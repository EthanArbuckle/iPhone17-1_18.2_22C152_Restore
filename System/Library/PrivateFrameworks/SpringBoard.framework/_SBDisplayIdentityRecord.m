@interface _SBDisplayIdentityRecord
- (BOOL)didConnectAtInit;
- (BOOL)isValid;
- (FBSDisplayIdentity)displayIdentity;
- (NSString)description;
- (_SBDisplayIdentityRecord)initWithIdentity:(id)a3 connectedAtInit:(BOOL)a4;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _SBDisplayIdentityRecord

- (_SBDisplayIdentityRecord)initWithIdentity:(id)a3 connectedAtInit:(BOOL)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_SBDisplayIdentityRecord;
  v8 = [(_SBDisplayIdentityRecord *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_displayIdentity, a3);
    v9->_connectedAtInit = a4;
    v10 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E4F4F690]);
    invalidationSignal = v9->_invalidationSignal;
    v9->_invalidationSignal = v10;
  }
  return v9;
}

- (void)dealloc
{
  if (([(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled] & 1) == 0)
  {
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"SBDisplayManager.m", 703, @"must invalidate before dealloc: %@", self object file lineNumber description];
  }
  [(BSAtomicSignal *)self->_invalidationSignal signal];
  v5.receiver = self;
  v5.super_class = (Class)_SBDisplayIdentityRecord;
  [(_SBDisplayIdentityRecord *)&v5 dealloc];
}

- (BOOL)isValid
{
  return [(BSAtomicSignal *)self->_invalidationSignal hasBeenSignalled] ^ 1;
}

- (void)invalidate
{
}

- (NSString)description
{
  return (NSString *)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57___SBDisplayIdentityRecord_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  v8 = self;
  id v5 = v4;
  [v5 appendProem:self block:v6];
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (BOOL)didConnectAtInit
{
  return self->_connectedAtInit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_storeStrong((id *)&self->_invalidationSignal, 0);
}

@end