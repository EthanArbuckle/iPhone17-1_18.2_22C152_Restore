@interface _SAUIElementViewControllerSnapshotAssertion
- (NSString)clientIdentifier;
- (NSString)elementIdentifier;
- (NSString)snapshotReason;
- (_SAUIElementViewControllerSnapshotAssertion)initWithElement:(id)a3 snapshotReason:(id)a4;
- (id)_descriptionConstituents;
@end

@implementation _SAUIElementViewControllerSnapshotAssertion

- (_SAUIElementViewControllerSnapshotAssertion)initWithElement:(id)a3 snapshotReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_SAUIElementViewControllerSnapshotAssertion;
  v8 = [(SAAssertion *)&v18 init];
  if (v8)
  {
    v9 = [v6 clientIdentifier];
    uint64_t v10 = [v9 copy];
    clientIdentifier = v8->_clientIdentifier;
    v8->_clientIdentifier = (NSString *)v10;

    v12 = [v6 elementIdentifier];
    uint64_t v13 = [v12 copy];
    elementIdentifier = v8->_elementIdentifier;
    v8->_elementIdentifier = (NSString *)v13;

    uint64_t v15 = [v7 copy];
    snapshotReason = v8->_snapshotReason;
    v8->_snapshotReason = (NSString *)v15;
  }
  return v8;
}

- (id)_descriptionConstituents
{
  v11[3] = *MEMORY[0x263EF8340];
  clientIdentifier = self->_clientIdentifier;
  v10[0] = @"associatedClientID";
  v10[1] = @"associatedElementID";
  elementIdentifier = self->_elementIdentifier;
  v11[0] = clientIdentifier;
  v11[1] = elementIdentifier;
  v10[2] = @"snapshotReason";
  v11[2] = self->_snapshotReason;
  v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  v9.receiver = self;
  v9.super_class = (Class)_SAUIElementViewControllerSnapshotAssertion;
  id v6 = [(SAAssertion *)&v9 _descriptionConstituents];
  id v7 = [v6 arrayByAddingObject:v5];

  return v7;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (NSString)snapshotReason
{
  return self->_snapshotReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotReason, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end