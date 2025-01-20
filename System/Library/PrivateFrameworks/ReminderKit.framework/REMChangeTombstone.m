@interface REMChangeTombstone
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSNumber)daIsEventOnlyContainer;
- (NSString)externalIdentifier;
- (NSString)hashtagName;
- (NSString)shareeAddress;
- (NSString)shareeDisplayName;
- (NSUUID)assignmentOwningReminderIdentifier;
- (NSUUID)dueDateDeltaAlertReminderIdentifier;
- (NSUUID)hashtagLabelUUIDForChangeTracking;
- (NSUUID)hashtagReminderIdentifier;
- (NSUUID)objectIdentifier;
- (NSUUID)remObjectIdentifier;
- (NSUUID)shareeOwningListIdentifier;
- (NSUUID)syncActivityUUIDForChangeTracking;
- (REMChangeTombstone)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMChangeTombstone

- (NSUUID)objectIdentifier
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(a2);
  [v3 raise:v4, @"Abstract method called -[%@ %@]", v5, v6 format];

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  uint64_t v6 = objc_opt_class();
  NSStringFromSelector(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 raise:v5, @"Abstract method called -[%@ %@]", v6, v7 format];
}

- (REMChangeTombstone)initWithCoder:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = objc_opt_class();
  v8 = NSStringFromSelector(a2);
  [v5 raise:v6, @"Abstract method called -[%@ %@]", v7, v8 format];

  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  uint64_t v7 = (REMChangeTombstone *)a3;
  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(a2);
  [v5 raise:v6, @"Abstract method called -[%@ %@]", v8, v9 format];

  return self == v7;
}

- (NSUUID)remObjectIdentifier
{
  return self->_remObjectIdentifier;
}

- (NSString)externalIdentifier
{
  return self->_externalIdentifier;
}

- (NSNumber)daIsEventOnlyContainer
{
  return self->_daIsEventOnlyContainer;
}

- (NSUUID)shareeOwningListIdentifier
{
  return self->_shareeOwningListIdentifier;
}

- (NSString)shareeDisplayName
{
  return self->_shareeDisplayName;
}

- (NSString)shareeAddress
{
  return self->_shareeAddress;
}

- (NSUUID)assignmentOwningReminderIdentifier
{
  return self->_assignmentOwningReminderIdentifier;
}

- (NSString)hashtagName
{
  return self->_hashtagName;
}

- (NSUUID)hashtagReminderIdentifier
{
  return self->_hashtagReminderIdentifier;
}

- (NSUUID)hashtagLabelUUIDForChangeTracking
{
  return self->_hashtagLabelUUIDForChangeTracking;
}

- (NSUUID)syncActivityUUIDForChangeTracking
{
  return self->_syncActivityUUIDForChangeTracking;
}

- (NSUUID)dueDateDeltaAlertReminderIdentifier
{
  return self->_dueDateDeltaAlertReminderIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDateDeltaAlertReminderIdentifier, 0);
  objc_storeStrong((id *)&self->_syncActivityUUIDForChangeTracking, 0);
  objc_storeStrong((id *)&self->_hashtagLabelUUIDForChangeTracking, 0);
  objc_storeStrong((id *)&self->_hashtagReminderIdentifier, 0);
  objc_storeStrong((id *)&self->_hashtagName, 0);
  objc_storeStrong((id *)&self->_assignmentOwningReminderIdentifier, 0);
  objc_storeStrong((id *)&self->_shareeAddress, 0);
  objc_storeStrong((id *)&self->_shareeDisplayName, 0);
  objc_storeStrong((id *)&self->_shareeOwningListIdentifier, 0);
  objc_storeStrong((id *)&self->_daIsEventOnlyContainer, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);

  objc_storeStrong((id *)&self->_remObjectIdentifier, 0);
}

@end