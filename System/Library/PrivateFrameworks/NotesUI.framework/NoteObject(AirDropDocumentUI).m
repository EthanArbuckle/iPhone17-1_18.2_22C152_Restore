@interface NoteObject(AirDropDocumentUI)
+ (id)noteByImportingLegacyNoteFromWebArchive:()AirDropDocumentUI withContent:context:styler:attachmentPreviewGenerator:;
+ (uint64_t)newNoteForAirDropDocument:()AirDropDocumentUI context:styler:attachmentPreviewGenerator:;
+ (void)importLegacyNoteFromWebArchive:()AirDropDocumentUI withContent:intoLegacyNote:context:;
@end

@implementation NoteObject(AirDropDocumentUI)

+ (id)noteByImportingLegacyNoteFromWebArchive:()AirDropDocumentUI withContent:context:styler:attachmentPreviewGenerator:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v34 = a4;
  id v12 = a5;
  id v36 = a6;
  id v37 = a7;
  v35 = v12;
  v13 = [v12 managedObjectContext];
  v14 = (void *)MEMORY[0x1E4F83380];
  v15 = [MEMORY[0x1E4F83428] sharedContext];
  v16 = [v15 managedObjectContext];
  v17 = [v14 defaultFolderInContext:v16];

  id v38 = (id)[MEMORY[0x1E4F83418] newEmptyNoteInFolder:v17];
  objc_opt_class();
  v18 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Note" inManagedObjectContext:v13];
  v19 = ICCheckedDynamicCast();

  objc_opt_class();
  v20 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"NoteBody" inManagedObjectContext:v13];
  v21 = ICCheckedDynamicCast();

  [v19 setBody:v21];
  v22 = [MEMORY[0x1E4F82D78] generateGUID];
  [v19 setGuid:v22];

  id v23 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
  [v38 setCreationDate:v23];
  [v38 setModificationDate:v23];
  [a1 importLegacyNoteFromWebArchive:v33 withContent:v34 intoLegacyNote:v19 context:v35];
  +[ICLegacyNoteUtilities copyValuesFromLegacyNote:v19 toNote:v38 styler:v36 attachmentPreviewGenerator:v37];
  v24 = [v19 folder];

  if (v24)
  {
    v25 = (void *)MEMORY[0x1E4F836F8];
    v26 = [v19 identifier];
    [v25 handleFailedAssertWithCondition:"!legacyNote.folder", "+[NoteObject(AirDropDocumentUI) noteByImportingLegacyNoteFromWebArchive:withContent:context:styler:attachmentPreviewGenerator:]", 1, 0, @"Temporary legacyNote should not have a folder %@", v26 functionName simulateCrash showAlert format];
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v27 = [v19 attachments];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v27);
        }
        objc_opt_class();
        v31 = ICCheckedDynamicCast();
        if (v31) {
          [v13 deleteObject:v31];
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v28);
  }

  [v13 deleteObject:v19];
  [v13 deleteObject:v21];

  return v38;
}

+ (void)importLegacyNoteFromWebArchive:()AirDropDocumentUI withContent:intoLegacyNote:context:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v9 = a5;
  id v10 = a6;
  v18 = v9;
  [v9 setContent:a4];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v12 = [v19 subresources];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v12);
        }
        v16 = [MEMORY[0x1E4F833E0] createAttachmentFromWebResource:*(void *)(*((void *)&v20 + 1) + 8 * i) inContext:v10];
        if (v16) {
          [v11 addObject:v16];
        }
        else {
          [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"attachmentObject" functionName:"+[NoteObject(AirDropDocumentUI) importLegacyNoteFromWebArchive:withContent:intoLegacyNote:context:]" simulateCrash:1 showAlert:0 format:@"Failed to create attachmentObject from resource"];
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v11];
  [v18 addAttachments:v17];
}

+ (uint64_t)newNoteForAirDropDocument:()AirDropDocumentUI context:styler:attachmentPreviewGenerator:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  uint64_t v14 = ICCheckedDynamicCast();
  v15 = [v10 webArchiveFromLegacyNoteDocument];
  if (v15)
  {
    id v21 = v13;
    v16 = [MEMORY[0x1E4F833E0] contentStringFromWebArchive:v15];
    if (v16)
    {
      v17 = [v14 defaultStoreForNewNote];
      v18 = [v17 account];
      if ([MEMORY[0x1E4F83288] canAirDropImportIntoAccount:v18 context:v14])
      {
        uint64_t v19 = [v14 newlyCreatedNoteFromDefaultStore];
        [a1 importLegacyNoteFromWebArchive:v15 withContent:v16 intoLegacyNote:v19 context:v14];
      }
      else
      {
        uint64_t v19 = [a1 noteByImportingLegacyNoteFromWebArchive:v15 withContent:v16 context:v14 styler:v12 attachmentPreviewGenerator:v21];
      }
    }
    else
    {
      uint64_t v19 = 0;
    }

    id v13 = v21;
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"webArchive", "+[NoteObject(AirDropDocumentUI) newNoteForAirDropDocument:context:styler:attachmentPreviewGenerator:]", 1, 0, @"Failed to get webArchive from AirDrop document %@", v10 functionName simulateCrash showAlert format];
    uint64_t v19 = 0;
  }

  return v19;
}

@end