@interface NSPredicate(TUManagedConversationLinkDescriptor)
+ (id)tu_predicateForConversationLinkDescriptorsIsDeleted:()TUManagedConversationLinkDescriptor;
+ (id)tu_predicateForConversationLinkDescriptorsWithInvitedHandle:()TUManagedConversationLinkDescriptor;
+ (id)tu_predicateForConversationLinkDescriptorsWithOriginatorHandle:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithActivated:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithCreationDate:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithDeletionDate:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithExpirationDate:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithExpirationDateAfter:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithGroupUUID:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithInvitedHandleNormalizedValue:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithInvitedHandleType:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithInvitedHandleValue:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithOriginatorHandleNormalizedValue:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithOriginatorHandleType:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithOriginatorHandleValue:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithPrivateKey:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithPseudonym:()TUManagedConversationLinkDescriptor;
+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithPublicKey:()TUManagedConversationLinkDescriptor;
@end

@implementation NSPredicate(TUManagedConversationLinkDescriptor)

+ (id)tu_predicateForConversationLinkDescriptorsIsDeleted:()TUManagedConversationLinkDescriptor
{
  if (a3) {
    v3 = @"deletionDate != NULL";
  }
  else {
    v3 = @"deletionDate == NULL";
  }
  v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:v3];

  return v4;
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithActivated:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"activated = %d", a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithCreationDate:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate == %@", a3];
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithExpirationDate:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"expirationDate == %@", a3];
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithDeletionDate:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"deletionDate == %@", a3];
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithExpirationDateAfter:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"expirationDate > %@", a3];
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithGroupUUID:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"groupUUID == %@", a3];
}

+ (id)tu_predicateForConversationLinkDescriptorsWithInvitedHandle:()TUManagedConversationLinkDescriptor
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 value];
  v6 = objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithInvitedHandleValue:", v5);

  v7 = [v4 normalizedValue];

  if (v7)
  {
    v8 = [v4 normalizedValue];
    v9 = objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithInvitedHandleNormalizedValue:", v8);
    v17[0] = v9;
    v17[1] = v6;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

    uint64_t v11 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v10];

    v6 = (void *)v11;
  }
  v12 = objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithInvitedHandleType:", objc_msgSend(v4, "type"));
  v16[0] = v12;
  v16[1] = v6;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];

  return v14;
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithInvitedHandleNormalizedValue:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY invitedHandles.normalizedValue ==[c] %@", a3];
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithInvitedHandleType:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"ANY invitedHandles.type = %d", a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithInvitedHandleValue:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY invitedHandles.value ==[c] %@", a3];
}

+ (id)tu_predicateForConversationLinkDescriptorsWithOriginatorHandle:()TUManagedConversationLinkDescriptor
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 value];
  v6 = objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithOriginatorHandleValue:", v5);

  v7 = [v4 normalizedValue];

  if (v7)
  {
    v8 = [v4 normalizedValue];
    v9 = objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithOriginatorHandleNormalizedValue:", v8);
    v17[0] = v9;
    v17[1] = v6;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

    uint64_t v11 = [MEMORY[0x1E4F28BA0] orPredicateWithSubpredicates:v10];

    v6 = (void *)v11;
  }
  v12 = objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithOriginatorHandleType:", objc_msgSend(v4, "type"));
  v16[0] = v12;
  v16[1] = v6;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];

  v14 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v13];

  return v14;
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithOriginatorHandleNormalizedValue:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY originatorHandle.normalizedValue ==[c] %@", a3];
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithOriginatorHandleType:()TUManagedConversationLinkDescriptor
{
  return objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"ANY originatorHandle.type = %d", a3);
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithOriginatorHandleValue:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY originatorHandle.value ==[c] %@", a3];
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithPseudonym:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"pseudonym = %@", a3];
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithPublicKey:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"publicKey = %@", a3];
}

+ (uint64_t)tu_predicateForConversationLinkDescriptorsWithPrivateKey:()TUManagedConversationLinkDescriptor
{
  return [MEMORY[0x1E4F28F60] predicateWithFormat:@"privateKey = %@", a3];
}

@end