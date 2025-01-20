@interface SBSAElementSnapshotContextMutator
- (NSString)clientIdentifier;
- (NSString)elementIdentifier;
- (NSString)snapshotReason;
- (SBSAElementSnapshotContext)elementSnapshotContext;
- (SBSAElementSnapshotContextMutator)initWithElementSnapshotContext:(id)a3;
- (id)description;
- (void)setClientIdentifier:(id)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setSnapshotReason:(id)a3;
@end

@implementation SBSAElementSnapshotContextMutator

- (SBSAElementSnapshotContextMutator)initWithElementSnapshotContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAElementSnapshotContextMutator;
  v6 = [(SBSAElementSnapshotContextMutator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_elementSnapshotContext, a3);
  }

  return v7;
}

- (NSString)clientIdentifier
{
  return [(SBSAElementSnapshotContext *)self->_elementSnapshotContext clientIdentifier];
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)elementIdentifier
{
  return [(SBSAElementSnapshotContext *)self->_elementSnapshotContext elementIdentifier];
}

- (void)setElementIdentifier:(id)a3
{
}

- (NSString)snapshotReason
{
  return [(SBSAElementSnapshotContext *)self->_elementSnapshotContext snapshotReason];
}

- (void)setSnapshotReason:(id)a3
{
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; elementSnapshotContext: %@>",
               objc_opt_class(),
               self,
               self->_elementSnapshotContext);
}

- (SBSAElementSnapshotContext)elementSnapshotContext
{
  return self->_elementSnapshotContext;
}

- (void).cxx_destruct
{
}

@end