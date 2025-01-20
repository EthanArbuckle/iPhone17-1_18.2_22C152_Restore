@interface REMDAHashtagTombstone
- (NSString)description;
- (NSString)name;
- (NSUUID)objectIdentifier;
- (NSUUID)reminderIdentifier;
- (void)setName:(id)a3;
- (void)setObjectIdentifier:(id)a3;
- (void)setReminderIdentifier:(id)a3;
@end

@implementation REMDAHashtagTombstone

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(REMDAHashtagTombstone *)self objectIdentifier];
  v6 = [(REMDAHashtagTombstone *)self name];
  v7 = [(REMDAHashtagTombstone *)self reminderIdentifier];
  v8 = [v3 stringWithFormat:@"<%@: %p objectID: %@, name: %@, reminderIdentifier: %@>", v4, self, v5, v6, v7];

  return (NSString *)v8;
}

- (NSUUID)objectIdentifier
{
  return self->_objectIdentifier;
}

- (void)setObjectIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSUUID)reminderIdentifier
{
  return self->_reminderIdentifier;
}

- (void)setReminderIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_objectIdentifier, 0);
}

@end