@interface ICUnifiedNoteContext
- (BOOL)resolvedPrefersViewContext;
- (ICLegacyAccount)legacyAccountForLocalAccount;
- (ICNoteContext)modernNoteContext;
- (ICNotesCrossProcessChangeCoordinator)modernCrossProcessChangeCoordinator;
- (ICUnifiedNoteContext)initWithModernNoteContext:(id)a3 htmlNoteContext:(id)a4;
- (ICUnifiedNoteContext)initWithModernNoteContext:(id)a3 htmlNoteContext:(id)a4 options:(unint64_t)a5;
- (NSManagedObjectContext)htmlManagedObjectContext;
- (NSManagedObjectContext)modernManagedObjectContext;
- (NSManagedObjectID)defaultAccountObjectID;
- (NSPersistentStoreCoordinator)htmlStoreCoordinator;
- (NSPersistentStoreCoordinator)modernStoreCoordinator;
- (NoteContext)htmlNoteContext;
- (id)legacyAccountForEmailAddress:(id)a3;
- (id)legacyAttachmentWithIdentifier:(id)a3;
- (id)legacyFolderWithIdentifier:(id)a3;
- (id)legacyNoteWithIdentifier:(id)a3;
- (id)managedObjectContextForObject:(id)a3 error:(id *)a4;
- (id)managedObjectContextForObjectID:(id)a3;
- (id)managedObjectIDForURIRepresentation:(id)a3;
- (id)managedObjectIDForURIString:(id)a3;
- (unint64_t)options;
- (void)enableHTMLContextChangeLogging;
@end

@implementation ICUnifiedNoteContext

- (ICUnifiedNoteContext)initWithModernNoteContext:(id)a3 htmlNoteContext:(id)a4 options:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICUnifiedNoteContext;
  v11 = [(ICUnifiedNoteContext *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_modernNoteContext, a3);
    objc_storeStrong((id *)&v12->_htmlNoteContext, a4);
    v12->_options = a5;
  }

  return v12;
}

- (ICUnifiedNoteContext)initWithModernNoteContext:(id)a3 htmlNoteContext:(id)a4
{
  return [(ICUnifiedNoteContext *)self initWithModernNoteContext:a3 htmlNoteContext:a4 options:3];
}

- (void)enableHTMLContextChangeLogging
{
  objc_opt_class();
  id v4 = [(ICUnifiedNoteContext *)self htmlNoteContext];
  v3 = ICCheckedDynamicCast();
  [v3 enableChangeLogging:1];
}

- (id)managedObjectIDForURIRepresentation:(id)a3
{
  id v4 = a3;
  v5 = [(ICUnifiedNoteContext *)self modernStoreCoordinator];
  v6 = objc_msgSend(v5, "ic_managedObjectIDForURIRepresentation:", v4);
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(ICUnifiedNoteContext *)self htmlStoreCoordinator];
    objc_msgSend(v9, "ic_managedObjectIDForURIRepresentation:", v4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)managedObjectIDForURIString:(id)a3
{
  id v4 = a3;
  v5 = [(ICUnifiedNoteContext *)self modernStoreCoordinator];
  v6 = objc_msgSend(v5, "ic_managedObjectIDForURIString:", v4);
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [(ICUnifiedNoteContext *)self htmlStoreCoordinator];
    objc_msgSend(v9, "ic_managedObjectIDForURIString:", v4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlNoteContext, 0);
  objc_storeStrong((id *)&self->_modernNoteContext, 0);
}

- (ICNoteContext)modernNoteContext
{
  return self->_modernNoteContext;
}

- (NoteContext)htmlNoteContext
{
  return self->_htmlNoteContext;
}

- (NSPersistentStoreCoordinator)modernStoreCoordinator
{
  v2 = [(ICUnifiedNoteContext *)self modernNoteContext];
  v3 = [v2 persistentContainer];
  id v4 = [v3 persistentStoreCoordinator];

  return (NSPersistentStoreCoordinator *)v4;
}

- (NSPersistentStoreCoordinator)htmlStoreCoordinator
{
  v2 = [(ICUnifiedNoteContext *)self htmlNoteContext];
  v3 = [v2 persistentStoreCoordinator];

  return (NSPersistentStoreCoordinator *)v3;
}

- (NSManagedObjectContext)modernManagedObjectContext
{
  v2 = self;
  unsigned int v3 = [(ICUnifiedNoteContext *)v2 resolvedPrefersViewContext];
  id v4 = [(ICUnifiedNoteContext *)v2 modernNoteContext];
  v5 = v4;
  v6 = &selRef_managedObjectContext;
  if (!v3) {
    v6 = &selRef_workerManagedObjectContext;
  }
  id v7 = [v4 *v6];

  return (NSManagedObjectContext *)v7;
}

- (ICNotesCrossProcessChangeCoordinator)modernCrossProcessChangeCoordinator
{
  return (ICNotesCrossProcessChangeCoordinator *)sub_1B0B66570(self, (uint64_t)a2, (SEL *)&selRef_modernNoteContext, (SEL *)&selRef_crossProcessChangeCoordinator);
}

- (NSManagedObjectContext)htmlManagedObjectContext
{
  return (NSManagedObjectContext *)sub_1B0B66570(self, (uint64_t)a2, (SEL *)&selRef_htmlNoteContext, (SEL *)&selRef_managedObjectContext);
}

- (id)managedObjectContextForObjectID:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)ICUnifiedNoteContext.managedObjectContext(for:)((NSManagedObjectID)v4);

  return v6;
}

- (id)managedObjectContextForObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  id v7 = sub_1B0B678B0(v5);

  return v7;
}

- (BOOL)resolvedPrefersViewContext
{
  v2 = self;
  unint64_t v3 = [(ICUnifiedNoteContext *)v2 options] & 3;
  if (v3 == 2)
  {

    return 0;
  }
  else if (v3 == 1)
  {

    return 1;
  }
  else
  {
    if (qword_1EBBB50A0 != -1) {
      swift_once();
    }
    sub_1B0B835BC();

    return v5;
  }
}

- (NSManagedObjectID)defaultAccountObjectID
{
  unint64_t v3 = self;
  id v4 = self;
  BOOL v5 = [(ICUnifiedNoteContext *)v4 htmlNoteContext];
  v6 = (ICUnifiedNoteContext *)objc_msgSend(v3, sel_defaultAccountWithHTMLNoteContext_, v5);

  if (v6)
  {
    id v7 = [(ICUnifiedNoteContext *)v6 objectID];

    id v4 = v6;
  }
  else
  {
    id v7 = 0;
  }

  return (NSManagedObjectID *)v7;
}

- (ICLegacyAccount)legacyAccountForLocalAccount
{
  unint64_t v3 = self;
  id v4 = self;
  BOOL v5 = [(ICUnifiedNoteContext *)v4 htmlNoteContext];
  id v6 = objc_msgSend(v3, sel_legacyAccountForLocalAccountWithContext_, v5);

  return (ICLegacyAccount *)v6;
}

- (id)legacyAccountForEmailAddress:(id)a3
{
  sub_1B0B8240C();
  id v4 = self;
  BOOL v5 = self;
  id v6 = (void *)sub_1B0B823CC();
  id v7 = [(ICUnifiedNoteContext *)v5 htmlNoteContext];
  id v8 = objc_msgSend(v4, sel_accountForEmailAddress_context_, v6, v7);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)legacyFolderWithIdentifier:(id)a3
{
  return sub_1B0B67114(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_folderForIdentifier_);
}

- (id)legacyNoteWithIdentifier:(id)a3
{
  return sub_1B0B67114(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_noteForIdentifier_);
}

- (id)legacyAttachmentWithIdentifier:(id)a3
{
  return sub_1B0B67114(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_attachmentForIdentifier_);
}

@end