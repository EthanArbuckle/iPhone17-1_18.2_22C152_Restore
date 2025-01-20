@interface REMDAShareeTombstone
- (NSString)address;
- (NSString)description;
- (NSString)displayName;
- (NSUUID)objectIdentifier;
- (NSUUID)owningListIdentifier;
- (void)setAddress:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setObjectIdentifier:(id)a3;
- (void)setOwningListIdentifier:(id)a3;
@end

@implementation REMDAShareeTombstone

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMDAShareeTombstone *)self objectIdentifier];
  v6 = [(REMDAShareeTombstone *)self owningListIdentifier];
  v7 = [v3 stringWithFormat:@"<%@: %p objectID: %@, owningListIdentifier: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (NSUUID)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
}

- (NSUUID)owningListIdentifier
{
  return self->_owningListIdentifier;
}

- (void)setOwningListIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_owningListIdentifier, 0);

  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end