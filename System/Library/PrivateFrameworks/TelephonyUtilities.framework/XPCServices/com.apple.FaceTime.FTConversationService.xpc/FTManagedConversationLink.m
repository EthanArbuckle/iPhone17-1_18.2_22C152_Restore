@interface FTManagedConversationLink
+ (id)managedConversationLinkForTUConversationLinkDescriptor:(id)a3 inManagedObjectContext:(id)a4;
- (FTManagedConversationLink)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4;
- (NSSet)tuInvitedHandles;
- (TUConversationLinkDescriptor)tuConversationLinkDescriptor;
- (id)description;
- (void)updateWithDescriptor:(id)a3;
@end

@implementation FTManagedConversationLink

+ (id)managedConversationLinkForTUConversationLinkDescriptor:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 persistentStoreCoordinator];
  v8 = [v7 managedObjectModel];

  if (v8)
  {
    v9 = [v8 entitiesByName];
    v10 = [v9 objectForKeyedSubscript:@"ConversationLink"];

    if (v10)
    {
      id v11 = [objc_alloc((Class)objc_opt_class()) initWithEntity:v10 insertIntoManagedObjectContext:v6];
    }
    else
    {
      v13 = FTCServiceLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 138412546;
        CFStringRef v32 = @"ConversationLink";
        __int16 v33 = 2112;
        id v34 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not find entity description with name %@ in managed object context %@. Falling back to convenience initializer.", (uint8_t *)&v31, 0x16u);
      }

      id v11 = [objc_alloc((Class)objc_opt_class()) initWithContext:v6];
    }
    v12 = v11;
    v14 = [v5 invitedHandles];
    if (v14)
    {
      v15 = +[FTManagedHandle managedHandlesForTUHandles:v14 inManagedObjectContext:v6];
    }
    else
    {
      v15 = 0;
    }
    objc_msgSend(v12, "setActivated:", objc_msgSend(v5, "isActivated"));
    v16 = [v5 creationDate];
    [v12 setCreationDate:v16];

    v17 = [v5 deletionDate];
    [v12 setDeletionDate:v17];

    v18 = [v5 expirationDate];
    [v12 setExpirationDate:v18];

    v19 = [v5 groupUUID];
    [v12 setGroupUUID:v19];

    [v12 setInvitedHandles:v15];
    v20 = [v5 originator];
    v21 = [v20 identifier];
    [v12 setOriginatorIdentifier:v21];

    v22 = [v5 originator];
    v23 = [v22 handle];
    v24 = +[FTManagedHandle managedHandleForTUHandle:v23 inManagedObjectContext:v6];
    [v12 setOriginatorHandle:v24];

    v25 = [v5 originator];
    objc_msgSend(v12, "setOriginatorRevision:", objc_msgSend(v25, "revision"));

    v26 = [v5 pseudonym];
    [v12 setPseudonym:v26];

    v27 = [v5 publicKey];
    [v12 setPublicKey:v27];

    v28 = [v5 privateKey];
    [v12 setPrivateKey:v28];

    v29 = [v5 name];
    [v12 setName:v29];

    objc_msgSend(v12, "setLifetimeType:", objc_msgSend(v5, "linkLifetimeScope"));
    objc_msgSend(v12, "setDeleteReason:", (__int16)objc_msgSend(v5, "deleteReason"));
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = +[NSMutableString stringWithFormat:@"<%@ %p ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" isActivated=%d", -[FTManagedConversationLink activated](self, "activated"));
  v4 = self;
  id v5 = [v4 pseudonym];

  if (v5)
  {
    id v6 = self;
    v7 = [v6 pseudonym];
    [v3 appendFormat:@" self.pseudonym=%@", v7];
  }
  v8 = self;
  v9 = [v8 creationDate];

  if (v9)
  {
    v10 = self;
    id v11 = [v10 creationDate];
    [v3 appendFormat:@" self.creationDate=%@", v11];
  }
  v12 = self;
  v13 = [v12 deletionDate];

  if (v13)
  {
    v14 = self;
    v15 = [v14 deletionDate];
    [v3 appendFormat:@" self.deletionDate=%@", v15];
  }
  v16 = self;
  v17 = [v16 privateKey];

  if (v17)
  {
    v18 = self;
    v19 = [v18 privateKey];
    [v3 appendFormat:@" self.privateKey=%@", v19];
  }
  v20 = self;
  v21 = [v20 expirationDate];

  if (v21)
  {
    v22 = self;
    v23 = [v22 expirationDate];
    [v3 appendFormat:@" self.expirationDate=%@", v23];
  }
  v24 = [(FTManagedConversationLink *)self groupUUID];
  [v3 appendFormat:@" groupUUID=%@", v24];

  v25 = [(FTManagedConversationLink *)self originatorIdentifier];
  [v3 appendFormat:@" originatorIdentifier=%@", v25];

  v26 = self;
  v27 = [v26 name];

  if (v27)
  {
    v28 = self;
    v29 = [v28 name];
    [v3 appendFormat:@" self.name=%@", v29];
  }
  objc_msgSend(v3, "appendFormat:", @" deleteReason=%hd", (int)-[FTManagedConversationLink deleteReason](self, "deleteReason"));
  [v3 appendString:@">"];
  id v30 = [v3 copy];

  return v30;
}

- (void)updateWithDescriptor:(id)a3
{
  id v32 = a3;
  -[FTManagedConversationLink setActivated:](self, "setActivated:", [v32 isActivated]);
  v4 = [v32 creationDate];
  [(FTManagedConversationLink *)self setCreationDate:v4];

  id v5 = [v32 deletionDate];
  [(FTManagedConversationLink *)self setDeletionDate:v5];

  id v6 = [v32 expirationDate];
  [(FTManagedConversationLink *)self setExpirationDate:v6];

  v7 = [v32 groupUUID];
  [(FTManagedConversationLink *)self setGroupUUID:v7];

  v8 = [v32 originator];
  v9 = [v8 identifier];
  [(FTManagedConversationLink *)self setOriginatorIdentifier:v9];

  v10 = [v32 originator];
  -[FTManagedConversationLink setOriginatorRevision:](self, "setOriginatorRevision:", [v10 revision]);

  id v11 = [v32 pseudonym];
  [(FTManagedConversationLink *)self setPseudonym:v11];

  v12 = [v32 publicKey];
  [(FTManagedConversationLink *)self setPublicKey:v12];

  v13 = [v32 privateKey];
  [(FTManagedConversationLink *)self setPrivateKey:v13];

  v14 = [v32 name];
  [(FTManagedConversationLink *)self setName:v14];

  -[FTManagedConversationLink setLifetimeType:](self, "setLifetimeType:", [v32 linkLifetimeScope]);
  -[FTManagedConversationLink setDeleteReason:](self, "setDeleteReason:", (__int16)[v32 deleteReason]);
  v15 = [v32 originator];
  v16 = [v15 handle];
  v17 = [(FTManagedConversationLink *)self originatorHandle];
  v18 = [v17 tuHandle];
  unsigned __int8 v19 = [v16 isEqualToHandle:v18];

  if ((v19 & 1) == 0)
  {
    v20 = [v32 originator];
    v21 = [v20 handle];
    v22 = [(FTManagedConversationLink *)self managedObjectContext];
    v23 = +[FTManagedHandle managedHandleForTUHandle:v21 inManagedObjectContext:v22];
    [(FTManagedConversationLink *)self setOriginatorHandle:v23];
  }
  uint64_t v24 = [v32 invitedHandles];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [(FTManagedConversationLink *)self tuInvitedHandles];
    v27 = [v32 invitedHandles];
    unsigned __int8 v28 = [v26 isEqualToSet:v27];

    if ((v28 & 1) == 0)
    {
      v29 = [v32 invitedHandles];
      id v30 = [(FTManagedConversationLink *)self managedObjectContext];
      int v31 = +[FTManagedHandle managedHandlesForTUHandles:v29 inManagedObjectContext:v30];

      [(FTManagedConversationLink *)self setInvitedHandles:v31];
    }
  }
}

- (TUConversationLinkDescriptor)tuConversationLinkDescriptor
{
  id v3 = objc_alloc((Class)TUConversationLinkOriginator);
  v4 = [(FTManagedConversationLink *)self originatorIdentifier];
  id v5 = [(FTManagedConversationLink *)self originatorRevision];
  id v6 = [(FTManagedConversationLink *)self originatorHandle];
  v7 = [v6 tuHandle];
  id v8 = [v3 initWithIdentifier:v4 revision:v5 handle:v7];

  id v9 = objc_alloc((Class)TUMutableConversationLinkDescriptor);
  v10 = [(FTManagedConversationLink *)self groupUUID];
  id v11 = [(FTManagedConversationLink *)self pseudonym];
  v12 = [(FTManagedConversationLink *)self publicKey];
  id v13 = [v9 initWithGroupUUID:v10 originator:v8 pseudonym:v11 publicKey:v12];

  objc_msgSend(v13, "setActivated:", -[FTManagedConversationLink activated](self, "activated"));
  v14 = [(FTManagedConversationLink *)self creationDate];
  [v13 setCreationDate:v14];

  v15 = [(FTManagedConversationLink *)self deletionDate];
  [v13 setDeletionDate:v15];

  v16 = [(FTManagedConversationLink *)self expirationDate];
  [v13 setExpirationDate:v16];

  v17 = [(FTManagedConversationLink *)self tuInvitedHandles];
  [v13 setInvitedHandles:v17];

  v18 = [(FTManagedConversationLink *)self name];
  [v13 setName:v18];

  unsigned __int8 v19 = [(FTManagedConversationLink *)self privateKey];
  [v13 setPrivateKey:v19];

  objc_msgSend(v13, "setLinkLifetimeScope:", -[FTManagedConversationLink lifetimeType](self, "lifetimeType"));
  objc_msgSend(v13, "setDeleteReason:", (int)-[FTManagedConversationLink deleteReason](self, "deleteReason"));
  id v20 = [v13 copy];

  return (TUConversationLinkDescriptor *)v20;
}

- (NSSet)tuInvitedHandles
{
  v2 = [(FTManagedConversationLink *)self invitedHandles];
  id v3 = v2;
  if (v2)
  {
    v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v2 count]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "tuHandle", (void)v13);
          if (v10) {
            [v4 addObject:v10];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v4 = 0;
  }
  id v11 = objc_msgSend(v4, "copy", (void)v13);

  return (NSSet *)v11;
}

- (FTManagedConversationLink)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FTManagedConversationLink();
  return [(FTManagedConversationLink *)&v7 initWithEntity:a3 insertIntoManagedObjectContext:a4];
}

@end