@interface ICInvitation(UI)
- (BOOL)hasThumbnail;
- (id)contentDescription;
- (id)joinActionTitle;
- (id)joinDescription;
- (id)participantsInfoDescription;
- (id)removeActionTitle;
- (id)thumbnailImageForAppearance:()UI size:;
- (id)typeDescription;
- (void)updateFromShare:()UI;
@end

@implementation ICInvitation(UI)

- (void)updateFromShare:()UI
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F19DD0]];
  v6 = ICDynamicCast();
  [a1 setRootObjectType:v6];

  [a1 setServerShare:v4];
  objc_opt_class();
  v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F19DC8]];
  v8 = ICDynamicCast();
  [a1 setTitle:v8];

  v9 = [v4 creationDate];
  [a1 setCreationDate:v9];

  v10 = [v4 modificationDate];
  [a1 setModificationDate:v10];

  objc_opt_class();
  v11 = [v4 encryptedValues];
  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F831E8]];
  v13 = ICDynamicCast();
  [a1 setSnippet:v13];

  objc_opt_class();
  v14 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F831E0]];
  v15 = ICDynamicCast();
  objc_msgSend(a1, "setSnippetAttachmentType:", (__int16)objc_msgSend(v15, "integerValue"));

  objc_opt_class();
  v16 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F831D8]];
  v17 = ICDynamicCast();
  objc_msgSend(a1, "setSnippetAttachmentCount:", objc_msgSend(v17, "integerValue"));

  v18 = objc_msgSend(v4, "ic_encryptedInlineableDataAssetForKeyPrefix:", *MEMORY[0x1E4F831C0]);
  [a1 setThumbnailDataLight:v18];

  v19 = objc_msgSend(v4, "ic_encryptedInlineableDataAssetForKeyPrefix:", *MEMORY[0x1E4F831B8]);
  [a1 setThumbnailDataDark:v19];

  objc_opt_class();
  v20 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F831A8]];
  v21 = ICDynamicCast();
  objc_msgSend(a1, "setNoteCount:", objc_msgSend(v21, "integerValue"));

  objc_opt_class();
  v22 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F831B0]];
  v23 = ICDynamicCast();
  objc_msgSend(a1, "setNoteCountRecursive:", objc_msgSend(v23, "integerValue"));

  objc_opt_class();
  v24 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F831F0]];
  v25 = ICDynamicCast();
  objc_msgSend(a1, "setSubfolderCount:", objc_msgSend(v25, "integerValue"));

  objc_opt_class();
  id v27 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F831F8]];

  v26 = ICDynamicCast();
  objc_msgSend(a1, "setSubfolderCountRecursive:", objc_msgSend(v26, "integerValue"));
}

- (id)typeDescription
{
  v2 = [a1 rootObjectType];
  int v3 = [v2 isEqualToString:@"com.apple.notes.note"];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F83770];
    v5 = @"Shared Note";
  }
  else
  {
    v6 = [a1 rootObjectType];
    int v7 = [v6 isEqualToString:@"com.apple.notes.folder"];

    id v4 = (void *)MEMORY[0x1E4F83770];
    if (v7) {
      v5 = @"Shared Folder";
    }
    else {
      v5 = @"Shared Item";
    }
  }
  v8 = [v4 localizedFrameworkStringForKey:v5 value:v5 table:0 allowSiri:1];
  return v8;
}

- (id)participantsInfoDescription
{
  v2 = [a1 serverShare];
  int v3 = objc_msgSend(v2, "ic_nonCurrentUserAcceptedParticipants");

  id v4 = objc_msgSend(v3, "ic_compactMap:", &__block_literal_global_34);
  v5 = [a1 rootObjectType];
  int v6 = [v5 isEqualToString:@"com.apple.notes.note"];

  if (v6)
  {
    if ([v4 count])
    {
      if ([v4 count] == 1)
      {
        uint64_t v7 = [v3 count];
        v8 = NSString;
        v9 = (void *)MEMORY[0x1E4F83770];
        if (v7 == 1)
        {
          v10 = @"Shared note with %@";
LABEL_15:
          v16 = [v9 localizedFrameworkStringForKey:v10 value:v10 table:0 allowSiri:1];
          v17 = [v4 objectAtIndexedSubscript:0];
          objc_msgSend(v8, "localizedStringWithFormat:", v16, v17, v31);
          v24 = LABEL_34:;
          goto LABEL_35;
        }
        goto LABEL_20;
      }
      uint64_t v21 = [v4 count];
      v8 = NSString;
      v9 = (void *)MEMORY[0x1E4F83770];
      if (v21 != 2)
      {
LABEL_20:
        v23 = @"Shared note with %@ and %lu others";
LABEL_33:
        v16 = [v9 localizedFrameworkStringForKey:v23 value:v23 table:0 allowSiri:1];
        v17 = [v4 objectAtIndexedSubscript:0];
        objc_msgSend(v8, "localizedStringWithFormat:", v16, v17, objc_msgSend(v3, "count") - 1);
        goto LABEL_34;
      }
      v22 = @"Shared note with %@ and %@";
LABEL_30:
      v16 = [v9 localizedFrameworkStringForKey:v22 value:v22 table:0 allowSiri:1];
      v17 = [v4 objectAtIndexedSubscript:0];
      id v27 = [v4 objectAtIndexedSubscript:1];
      v24 = objc_msgSend(v8, "localizedStringWithFormat:", v16, v17, v27);

LABEL_35:
      goto LABEL_36;
    }
    if ([v3 count])
    {
      v18 = NSString;
      v19 = (void *)MEMORY[0x1E4F83770];
      v20 = @"Shared note with %lu people";
LABEL_25:
      v16 = [v19 localizedFrameworkStringForKey:v20 value:v20 table:0 allowSiri:1];
      v24 = objc_msgSend(v18, "localizedStringWithFormat:", v16, objc_msgSend(v3, "count"));
LABEL_36:

      goto LABEL_37;
    }
    v29 = (void *)MEMORY[0x1E4F83770];
    v30 = @"Shared note";
  }
  else
  {
    v11 = [a1 rootObjectType];
    int v12 = [v11 isEqualToString:@"com.apple.notes.folder"];

    uint64_t v13 = [v4 count];
    if (v12)
    {
      if (v13)
      {
        if ([v4 count] == 1)
        {
          uint64_t v14 = [v3 count];
          v8 = NSString;
          v9 = (void *)MEMORY[0x1E4F83770];
          if (v14 == 1)
          {
            v10 = @"Shared folder with %@";
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v25 = [v4 count];
          v8 = NSString;
          v9 = (void *)MEMORY[0x1E4F83770];
          if (v25 == 2)
          {
            v22 = @"Shared folder with %@ and %@";
            goto LABEL_30;
          }
        }
        v23 = @"Shared folder with %@ and %lu others";
        goto LABEL_33;
      }
      if ([v3 count])
      {
        v18 = NSString;
        v19 = (void *)MEMORY[0x1E4F83770];
        v20 = @"Shared folder with %lu people";
        goto LABEL_25;
      }
      v29 = (void *)MEMORY[0x1E4F83770];
      v30 = @"Shared folder";
    }
    else
    {
      if (v13)
      {
        if ([v4 count] == 1)
        {
          uint64_t v15 = [v3 count];
          v8 = NSString;
          v9 = (void *)MEMORY[0x1E4F83770];
          if (v15 == 1)
          {
            v10 = @"With %@";
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v26 = [v4 count];
          v8 = NSString;
          v9 = (void *)MEMORY[0x1E4F83770];
          if (v26 == 2)
          {
            v22 = @"With %@ and %@";
            goto LABEL_30;
          }
        }
        v23 = @"With %@ and %lu others";
        goto LABEL_33;
      }
      if ([v3 count])
      {
        v18 = NSString;
        v19 = (void *)MEMORY[0x1E4F83770];
        v20 = @"With %lu people";
        goto LABEL_25;
      }
      v29 = (void *)MEMORY[0x1E4F83770];
      v30 = @"Shared item";
    }
  }
  v24 = [v29 localizedFrameworkStringForKey:v30 value:v30 table:0 allowSiri:1];
LABEL_37:

  return v24;
}

- (id)contentDescription
{
  v2 = [a1 rootObjectType];
  int v3 = [v2 isEqualToString:@"com.apple.notes.note"];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F83418];
    v5 = [a1 snippet];
    uint64_t v6 = [a1 snippetAttachmentType];
    uint64_t v7 = [a1 snippetAttachmentCount];
    v8 = [a1 account];
    v9 = [v4 contentInfoTextWithSnippet:v5 attachmentContentInfoType:v6 attachmentContentInfoCount:v7 account:v8];
  }
  else
  {
    v10 = [a1 rootObjectType];
    int v11 = [v10 isEqualToString:@"com.apple.notes.folder"];

    if (v11) {
      objc_msgSend(MEMORY[0x1E4F83380], "contentInfoTextWithNoteCount:subfolderCount:", objc_msgSend(a1, "noteCount"), objc_msgSend(a1, "subfolderCount"));
    }
    else {
    int v12 = [a1 snippet];
    }
    v5 = v12;
    if (v12)
    {
      id v13 = v12;
      v5 = v13;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"No contents" value:@"No contents" table:0 allowSiri:1];
    }
    v9 = v13;
  }

  return v9;
}

- (id)joinDescription
{
  v2 = [a1 account];
  int v3 = [v2 fullName];
  uint64_t v4 = objc_msgSend(v3, "ic_localizedNameWithDefaultFormattingStyle");

  v5 = [a1 account];
  uint64_t v6 = [v5 primaryEmail];

  if (v4 && v6)
  {
    uint64_t v7 = NSString;
    v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You will join as %@ (%@)" value:@"You will join as %@ (%@)" table:0 allowSiri:1];
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v4, v6);
    int v11 = LABEL_9:;

    goto LABEL_11;
  }
  if (v4 | v6)
  {
    v9 = NSString;
    v8 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"You will join as %@" value:@"You will join as %@" table:0 allowSiri:1];
    if (v4) {
      uint64_t v10 = v4;
    }
    else {
      uint64_t v10 = v6;
    }
    objc_msgSend(v9, "localizedStringWithFormat:", v8, v10, v13);
    goto LABEL_9;
  }
  int v11 = 0;
LABEL_11:

  return v11;
}

- (id)joinActionTitle
{
  v2 = [a1 rootObjectType];
  int v3 = [v2 isEqualToString:@"com.apple.notes.note"];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F83770];
    v5 = @"View Note";
  }
  else
  {
    uint64_t v6 = [a1 rootObjectType];
    int v7 = [v6 isEqualToString:@"com.apple.notes.folder"];

    uint64_t v4 = (void *)MEMORY[0x1E4F83770];
    if (v7) {
      v5 = @"View Folder";
    }
    else {
      v5 = @"View";
    }
  }
  v8 = [v4 localizedFrameworkStringForKey:v5 value:v5 table:0 allowSiri:1];
  return v8;
}

- (id)removeActionTitle
{
  v2 = [a1 rootObjectType];
  int v3 = [v2 isEqualToString:@"com.apple.notes.note"];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F83770];
    v5 = @"Remove Note";
  }
  else
  {
    uint64_t v6 = [a1 rootObjectType];
    int v7 = [v6 isEqualToString:@"com.apple.notes.folder"];

    uint64_t v4 = (void *)MEMORY[0x1E4F83770];
    if (v7) {
      v5 = @"Remove Folder";
    }
    else {
      v5 = @"Remove";
    }
  }
  v8 = [v4 localizedFrameworkStringForKey:v5 value:v5 table:0 allowSiri:1];
  return v8;
}

- (BOOL)hasThumbnail
{
  v2 = [a1 thumbnailDataLight];
  if (v2)
  {
    int v3 = [a1 thumbnailDataDark];
    BOOL v4 = v3 != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)thumbnailImageForAppearance:()UI size:
{
  uint64_t v9 = [a5 type];
  if (v9 == 1)
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB1818]);
    uint64_t v11 = [a1 thumbnailDataDark];
  }
  else
  {
    if (v9) {
      goto LABEL_6;
    }
    id v10 = objc_alloc(MEMORY[0x1E4FB1818]);
    uint64_t v11 = [a1 thumbnailDataLight];
  }
  int v12 = (void *)v11;
  uint64_t v13 = (void *)[v10 initWithData:v11];
  objc_msgSend(MEMORY[0x1E4FB1BA8], "ic_scale");
  v5 = objc_msgSend(v13, "ic_scaledImageWithSize:scale:", a2, a3, v14);

LABEL_6:
  return v5;
}

@end