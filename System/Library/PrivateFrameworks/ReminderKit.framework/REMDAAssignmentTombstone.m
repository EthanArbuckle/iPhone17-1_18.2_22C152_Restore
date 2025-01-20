@interface REMDAAssignmentTombstone
- (NSString)description;
- (NSUUID)objectIdentifier;
- (NSUUID)owningReminderIdentifier;
- (void)setObjectIdentifier:(id)a3;
- (void)setOwningReminderIdentifier:(id)a3;
@end

@implementation REMDAAssignmentTombstone

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMDAAssignmentTombstone *)self objectIdentifier];
  v6 = [(REMDAAssignmentTombstone *)self owningReminderIdentifier];
  v7 = [v3 stringWithFormat:@"<%@: %p objectID: %@, owningReminderIdentifier: %@>", v4, self, v5, v6];

  return (NSString *)v7;
}

- (NSUUID)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
}

- (NSUUID)owningReminderIdentifier
{
  return self->_owningReminderIdentifier;
}

- (void)setOwningReminderIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owningReminderIdentifier, 0);

  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end