@interface ICAppURLUtilities
+ (BOOL)isHTMLFolderEntityURI:(id)a3;
+ (BOOL)isHTMLNoteEntityURI:(id)a3;
+ (BOOL)isLaunchingQuickNoteViaPencil:(id)a3;
+ (BOOL)isModernFolderEntityURI:(id)a3;
+ (BOOL)isModernNoteEntityURI:(id)a3;
+ (BOOL)isNewNoteURL:(id)a3;
+ (BOOL)isQuickNoteModeURL:(id)a3;
+ (BOOL)isShowDefaultFolderURL:(id)a3;
+ (BOOL)isShowFolderListURL:(id)a3;
+ (BOOL)isShowFolderURL:(id)a3;
+ (BOOL)isShowFolderURL:(id)a3 options:(unint64_t)a4;
+ (BOOL)isShowHTMLFolderURL:(id)a3;
+ (BOOL)isShowHTMLFolderURL:(id)a3 options:(unint64_t)a4;
+ (BOOL)isShowHTMLNoteURL:(id)a3;
+ (BOOL)isShowLegacyNoteURL:(id)a3;
+ (BOOL)isShowNoteFocusedInFolderURL:(id)a3;
+ (BOOL)isShowNoteURL:(id)a3;
+ (BOOL)isShowNoteURL:(id)a3 options:(unint64_t)a4;
+ (BOOL)isShowPaperURL:(id)a3;
+ (BOOL)isShowSmartFoldersHelpURL:(id)a3;
+ (BOOL)isSystemPaperURL:(id)a3;
+ (BOOL)isTranscriptionDonationURL:(id)a3;
+ (BOOL)isTranscriptionDonationURLPositive:(id)a3;
+ (BOOL)quickNoteURLIsContinuing:(id)a3;
+ (BOOL)quickNoteURLShouldShowList:(id)a3;
+ (BOOL)quickNoteURLShouldShowShareSheet:(id)a3;
+ (BOOL)quickNoteURLShouldShowiCloudShareSheet:(id)a3;
+ (id)NotesAppIDForNoteMentionedInURL:(id)a3;
+ (id)URLForAttributedString:(id)a3 range:(_NSRange)a4;
+ (id)URLWithSchemeForString:(id)a3;
+ (id)appURLForContainingFolderWithNoteFocused:(id)a3;
+ (id)appURLForDefaultFolder;
+ (id)appURLForFolder:(id)a3;
+ (id)appURLForFolderList;
+ (id)appURLForHTMLFolder:(id)a3;
+ (id)appURLForHTMLNote:(id)a3;
+ (id)appURLForNote:(id)a3;
+ (id)appURLForNote:(id)a3 inFolder:(id)a4;
+ (id)appURLForShowSmartFoldersHelp;
+ (id)appURLForTranscriptionDonationForAttachmentIdentifier:(id)a3 isPositive:(BOOL)a4;
+ (id)attachmentForTranscriptionDonationURL:(id)a3 managedObjectContext:(id)a4;
+ (id)attachmentIdentifierFromQuickNoteURL:(id)a3;
+ (id)contentOffsetFromQuickNoteURL:(id)a3;
+ (id)detectedURLInString:(id)a3 allowNonLinkCharacters:(BOOL)a4;
+ (id)entityURIForNote:(id)a3;
+ (id)firstQueryItemInURL:(id)a3 andHost:(id)a4 andQueryItemName:(id)a5;
+ (id)folderIdentifierForShowNoteURL:(id)a3;
+ (id)modernNoteIdentifierFromEntityURI:(id)a3;
+ (id)noteIdentifierFromNotesAppURL:(id)a3;
+ (id)noteIdentifierFromQuickNoteURL:(id)a3;
+ (id)objectIDForHTMLFolderEntityURI:(id)a3 context:(id)a4;
+ (id)objectIDForHTMLFolderMentionedInURL:(id)a3 context:(id)a4;
+ (id)objectIDForHTMLFolderMentionedInURL:(id)a3 options:(unint64_t)a4 context:(id)a5;
+ (id)objectIDForModernFolderEntityURI:(id)a3 noteContext:(id)a4;
+ (id)objectIDForModernFolderMentionedInURL:(id)a3 noteContext:(id)a4;
+ (id)objectIDForModernFolderMentionedInURL:(id)a3 options:(unint64_t)a4 noteContext:(id)a5;
+ (id)objectIDURIRepresentationForFolderMentionedInLegacyShowFolderURL:(id)a3;
+ (id)objectIDURIRepresentationForFolderMentionedInLegacyShowHTMLFolderURL:(id)a3;
+ (id)objectIDURIRepresentationForHTMLNoteEntityURI:(id)a3 context:(id)a4;
+ (id)objectIDURIRepresentationForHTMLNoteMentionedInURL:(id)a3;
+ (id)predicateForFolderWithNoteFocusedInURL:(id)a3;
+ (id)predicateForNotesMentionedInURL:(id)a3;
+ (id)predicateForNotesMentionedInURL:(id)a3 action:(id)a4;
+ (id)predicateForNotesMentionedInURL:(id)a3 action:(id)a4 queryItemName:(id)a5;
+ (id)predicateForNotesWithIdentifier:(id)a3;
+ (id)predicateForVisibleNotesMentionedInURL:(id)a3;
+ (id)referralURLForSnapshotBackgroundTask;
+ (id)urlForQuickNoteWithOptions:(id)a3;
@end

@implementation ICAppURLUtilities

+ (BOOL)isLaunchingQuickNoteViaPencil:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isQuickNoteModeURL:v3])
  {
    v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    char v5 = objc_msgSend(v4, "ic_BOOLValueForQueryItemWithKey:", @"launchedByPencil");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)isQuickNoteModeURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    char v5 = [v4 scheme];
    v6 = [v4 host];
    v7 = [v4 scheme];
    if ((ICIsNotesURLScheme(v7) & 1) != 0
      || objc_msgSend(v5, "ic_isCaseInsensitiveEqualToString:", @"mobilenotes-quicknote"))
    {
      char v8 = objc_msgSend(v6, "ic_isCaseInsensitiveEqualToString:", @"quicknote");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)appURLForNote:(id)a3
{
  return (id)[a1 appURLForNote:a3 inFolder:0];
}

+ (id)predicateForVisibleNotesMentionedInURL:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = [a1 predicateForNotesMentionedInURL:a3];
  uint64_t v4 = +[ICCloudSyncingObject predicateForUnmarkedForDeletionObjects];
  char v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = (void *)MEMORY[0x1E4F28BA0];
    v10[0] = v3;
    v10[1] = v4;
    char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    v6 = [v7 andPredicateWithSubpredicates:v8];
  }
  return v6;
}

+ (id)predicateForNotesMentionedInURL:(id)a3
{
  id v4 = a3;
  char v5 = [v4 scheme];
  int v6 = ICIsNotesURLScheme(v5);

  if (!v6)
  {
    v9 = 0;
    goto LABEL_10;
  }
  v7 = [a1 modernNoteIdentifierFromEntityURI:v4];
  if ([v7 length])
  {
    uint64_t v8 = [a1 predicateForNotesWithIdentifier:v7];
  }
  else
  {
    if (![a1 isShowNoteURL:v4 options:1])
    {
      v9 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = [a1 predicateForNotesMentionedInURL:v4 action:@"showNote"];
  }
  v9 = (void *)v8;
LABEL_9:

LABEL_10:
  return v9;
}

+ (id)predicateForNotesMentionedInURL:(id)a3 action:(id)a4
{
  return (id)[a1 predicateForNotesMentionedInURL:a3 action:a4 queryItemName:@"identifier"];
}

+ (id)predicateForNotesMentionedInURL:(id)a3 action:(id)a4 queryItemName:(id)a5
{
  int v6 = [a1 firstQueryItemInURL:a3 andHost:a4 andQueryItemName:a5];
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 value];
    v9 = [a1 predicateForNotesWithIdentifier:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)predicateForNotesWithIdentifier:(id)a3
{
  id v3 = a3;
  if (isValidIdentifier(v3))
  {
    id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K ==[c] %@", @"identifier", v3];
  }
  else
  {
    char v5 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ICAppURLUtilities predicateForNotesWithIdentifier:]((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }

    id v4 = 0;
  }

  return v4;
}

+ (id)appURLForHTMLNote:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F29088];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    [v5 setScheme:@"applenotes"];
    [v5 setHost:@"showHTMLNote"];
    uint64_t v6 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v7 = [v4 objectID];

    uint64_t v8 = [v7 URIRepresentation];
    uint64_t v9 = [v8 absoluteString];
    uint64_t v10 = [v6 queryItemWithName:@"objectIDURI" value:v9];
    v14[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v5 setQueryItems:v11];

    v12 = [v5 URL];
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)objectIDURIRepresentationForHTMLNoteMentionedInURL:(id)a3
{
  id v4 = a3;
  if ([a1 isShowHTMLNoteURL:v4])
  {
    id v5 = [a1 firstQueryItemInURL:v4 andHost:@"showHTMLNote" andQueryItemName:@"objectIDURI"];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 value];
      uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)appURLForFolder:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 identifier];
  if ([v4 length])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v5 setScheme:@"applenotes"];
    [v5 setHost:@"showFolder"];
    uint64_t v6 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v7 = [v3 objectID];
    uint64_t v8 = [v7 URIRepresentation];
    uint64_t v9 = [v8 absoluteString];
    uint64_t v10 = [v6 queryItemWithName:@"objectIDURI" value:v9];
    v14[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v5 setQueryItems:v11];

    v12 = [v5 URL];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)objectIDForModernFolderMentionedInURL:(id)a3 options:(unint64_t)a4 noteContext:(id)a5
{
  char v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ((v6 & 1) != 0
    || ([a1 objectIDForModernFolderEntityURI:v8 noteContext:v9],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v12 = [a1 objectIDURIRepresentationForFolderMentionedInLegacyShowFolderURL:v8];
    if (v12)
    {
      v13 = [v9 persistentStoreCoordinator];
      uint64_t v11 = [v13 managedObjectIDForURIRepresentation:v12];
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = (void *)v10;
    v12 = 0;
  }

  return v11;
}

+ (id)objectIDForModernFolderMentionedInURL:(id)a3 noteContext:(id)a4
{
  return (id)[a1 objectIDForModernFolderMentionedInURL:a3 options:0 noteContext:a4];
}

+ (id)objectIDURIRepresentationForFolderMentionedInLegacyShowFolderURL:(id)a3
{
  id v4 = a3;
  if ([a1 isShowFolderURL:v4 options:1])
  {
    id v5 = [a1 firstQueryItemInURL:v4 andHost:@"showFolder" andQueryItemName:@"objectIDURI"];
    char v6 = [v5 value];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1E4F1CB10];
      id v9 = [v5 value];
      uint64_t v10 = [v8 URLWithString:v9];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)appURLForHTMLFolder:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = (objc_class *)MEMORY[0x1E4F29088];
    id v4 = a3;
    id v5 = objc_alloc_init(v3);
    [v5 setScheme:@"applenotes"];
    [v5 setHost:@"showHTMLFolder"];
    char v6 = (void *)MEMORY[0x1E4F290C8];
    uint64_t v7 = [v4 objectID];

    id v8 = [v7 URIRepresentation];
    id v9 = [v8 absoluteString];
    uint64_t v10 = [v6 queryItemWithName:@"objectIDURI" value:v9];
    v14[0] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    [v5 setQueryItems:v11];

    v12 = [v5 URL];
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

+ (id)objectIDForHTMLFolderMentionedInURL:(id)a3 options:(unint64_t)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = [a1 objectIDForHTMLFolderEntityURI:v7 context:v8];
  if (!v9)
  {
    uint64_t v10 = [a1 objectIDURIRepresentationForFolderMentionedInLegacyShowHTMLFolderURL:v7];
    if (v10)
    {
      uint64_t v11 = [v8 managedObjectContext];
      v12 = [v11 persistentStoreCoordinator];
      id v9 = [v12 managedObjectIDForURIRepresentation:v10];
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

+ (id)objectIDForHTMLFolderMentionedInURL:(id)a3 context:(id)a4
{
  return (id)[a1 objectIDForHTMLFolderMentionedInURL:a3 options:0 context:a4];
}

+ (id)objectIDURIRepresentationForFolderMentionedInLegacyShowHTMLFolderURL:(id)a3
{
  id v4 = a3;
  if ([a1 isShowHTMLFolderURL:v4 options:1])
  {
    id v5 = [a1 firstQueryItemInURL:v4 andHost:@"showHTMLFolder" andQueryItemName:@"objectIDURI"];
    char v6 = v5;
    if (v5)
    {
      id v7 = [v5 value];
      id v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (id)appURLForDefaultFolder
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v2 setScheme:@"applenotes"];
  [v2 setHost:@"showDefaultFolder"];
  id v3 = [v2 URL];

  return v3;
}

+ (id)appURLForFolderList
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v2 setScheme:@"applenotes"];
  [v2 setHost:@"showFolderList"];
  id v3 = [v2 URL];

  return v3;
}

+ (id)appURLForShowSmartFoldersHelp
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v2 setScheme:@"applenotes"];
  [v2 setHost:@"showSmartFoldersHelp"];
  id v3 = [v2 URL];

  return v3;
}

+ (BOOL)isShowFolderListURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    id v5 = [v4 scheme];
    int v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      id v7 = [v4 host];
      char v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", @"showFolderList");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isShowDefaultFolderURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    id v5 = [v4 scheme];
    int v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      id v7 = [v4 host];
      char v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", @"showDefaultFolder");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isShowFolderURL:(id)a3
{
  return [a1 isShowFolderURL:a3 options:0];
}

+ (BOOL)isShowFolderURL:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if ((v4 & 1) != 0 || ([a1 isModernFolderEntityURI:v6] & 1) == 0)
    {
      char v8 = [MEMORY[0x1E4F29088] componentsWithURL:v6 resolvingAgainstBaseURL:1];
      id v9 = [v8 scheme];
      int v10 = ICIsNotesURLScheme(v9);

      if (v10)
      {
        uint64_t v11 = [v8 host];
        char v7 = objc_msgSend(v11, "ic_isCaseInsensitiveEqualToString:", @"showFolder");
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isShowHTMLFolderURL:(id)a3
{
  return [a1 isShowHTMLFolderURL:a3 options:0];
}

+ (BOOL)isShowHTMLFolderURL:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if ((v4 & 1) != 0 || ([a1 isHTMLFolderEntityURI:v6] & 1) == 0)
    {
      char v8 = [MEMORY[0x1E4F29088] componentsWithURL:v6 resolvingAgainstBaseURL:1];
      id v9 = [v8 scheme];
      int v10 = ICIsNotesURLScheme(v9);

      if (v10)
      {
        uint64_t v11 = [v8 host];
        char v7 = objc_msgSend(v11, "ic_isCaseInsensitiveEqualToString:", @"showHTMLFolder");
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)isShowNoteURL:(id)a3
{
  return [a1 isShowNoteURL:a3 options:0];
}

+ (BOOL)isShowNoteURL:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  id v6 = a3;
  if (v6)
  {
    if ((v4 & 1) != 0 || ([a1 isModernNoteEntityURI:v6] & 1) == 0)
    {
      char v8 = [MEMORY[0x1E4F29088] componentsWithURL:v6 resolvingAgainstBaseURL:1];
      id v9 = [v8 scheme];
      int v10 = ICIsNotesURLScheme(v9);

      if (v10)
      {
        uint64_t v11 = [v8 host];
        char v7 = objc_msgSend(v11, "ic_isCaseInsensitiveEqualToString:", @"showNote");
      }
      else
      {
        char v7 = 0;
      }
    }
    else
    {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)folderIdentifierForShowNoteURL:(id)a3
{
  id v4 = a3;
  if (v4 && [a1 isShowNoteURL:v4])
  {
    id v5 = [a1 firstQueryItemInURL:v4 andHost:@"showNote" andQueryItemName:@"folderIdentifier"];
    id v6 = [v5 value];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)isShowLegacyNoteURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    id v5 = [v4 scheme];
    int v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      char v7 = [v4 host];
      char v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", @"showLegacyNote");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isShowHTMLNoteURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    id v5 = [v4 scheme];
    int v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      char v7 = [v4 host];
      char v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", @"showHTMLNote");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isShowSmartFoldersHelpURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    id v5 = [v4 scheme];
    int v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      char v7 = [v4 host];
      char v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", @"showSmartFoldersHelp");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isSystemPaperURL:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  id v3 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:1];
  id v4 = [v3 scheme];
  int v5 = ICIsNotesURLScheme(v4);

  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v6 = objc_msgSend(v3, "queryItems", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v12 = [v11 name];
          if (objc_msgSend(v12, "ic_isCaseInsensitiveEqualToString:", @"displayMode"))
          {
            v13 = [v11 value];
            char v14 = [v13 containsString:@"paper"];

            if (v14)
            {
              int v5 = 1;
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
    int v5 = 0;
LABEL_16:
  }
  return v5 != 0;
}

+ (BOOL)isNewNoteURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    int v5 = [v4 scheme];
    int v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      uint64_t v7 = [v4 host];
      char v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", @"newNote");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isTranscriptionDonationURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    int v5 = [v4 scheme];
    int v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      uint64_t v7 = [v4 host];
      char v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", @"transcriptionFeedback");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isTranscriptionDonationURLPositive:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    int v5 = [v4 scheme];
    int v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      uint64_t v7 = [v4 host];
      if (objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", @"transcriptionFeedback"))
      {
        long long v22 = 0u;
        long long v23 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        char v8 = [v4 queryItems];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          long long v19 = v7;
          uint64_t v11 = *(void *)v21;
          while (2)
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v21 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
              char v14 = [v13 name];
              char v15 = objc_msgSend(v14, "ic_isCaseInsensitiveEqualToString:", @"isPositive");

              if (v15)
              {
                long long v17 = [v13 value];
                char v16 = [v17 isEqual:@"1"];

                goto LABEL_17;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
            if (v10) {
              continue;
            }
            break;
          }
          char v16 = 0;
LABEL_17:
          uint64_t v7 = v19;
        }
        else
        {
          char v16 = 0;
        }
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

+ (id)attachmentForTranscriptionDonationURL:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F29088] componentsWithURL:v5 resolvingAgainstBaseURL:1];
    char v8 = [v7 scheme];
    int v9 = ICIsNotesURLScheme(v8);

    if (v9)
    {
      uint64_t v10 = [v7 host];
      if (objc_msgSend(v10, "ic_isCaseInsensitiveEqualToString:", @"transcriptionFeedback"))
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v11 = [v7 queryItems];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          long long v22 = v10;
          id v23 = v6;
          uint64_t v14 = *(void *)v25;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              char v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              long long v17 = objc_msgSend(v16, "name", v22);
              char v18 = objc_msgSend(v17, "ic_isCaseInsensitiveEqualToString:", @"attachmentID");

              if (v18)
              {
                long long v20 = [v16 value];
                id v6 = v23;
                long long v19 = +[ICBaseAttachment attachmentWithIdentifier:v20 context:v23];

                goto LABEL_17;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          long long v19 = 0;
          id v6 = v23;
LABEL_17:
          uint64_t v10 = v22;
        }
        else
        {
          long long v19 = 0;
        }
      }
      else
      {
        long long v19 = 0;
      }
    }
    else
    {
      long long v19 = 0;
    }
  }
  else
  {
    long long v19 = 0;
  }

  return v19;
}

+ (id)appURLForTranscriptionDonationForAttachmentIdentifier:(id)a3 isPositive:(BOOL)a4
{
  BOOL v4 = a4;
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F29088];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 setScheme:@"applenotes"];
  [v7 setHost:@"transcriptionFeedback"];
  if (v4) {
    char v8 = @"1";
  }
  else {
    char v8 = @"0";
  }
  int v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"isPositive" value:v8];
  v14[0] = v9;
  uint64_t v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"attachmentID" value:v6];

  v14[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  [v7 setQueryItems:v11];

  uint64_t v12 = [v7 URL];

  return v12;
}

+ (BOOL)isShowPaperURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    id v5 = [v4 scheme];
    int v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      id v7 = [v4 host];
      char v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", @"showPaper");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (BOOL)isShowNoteFocusedInFolderURL:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    BOOL v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:1];
    id v5 = [v4 scheme];
    int v6 = ICIsNotesURLScheme(v5);

    if (v6)
    {
      id v7 = [v4 host];
      char v8 = objc_msgSend(v7, "ic_isCaseInsensitiveEqualToString:", @"focusNoteInFolder");
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

+ (id)appURLForContainingFolderWithNoteFocused:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 identifier];
  if ([v3 length])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v4 setScheme:@"applenotes"];
    [v4 setHost:@"focusNoteInFolder"];
    id v5 = [MEMORY[0x1E4F290C8] queryItemWithName:@"identifier" value:v3];
    v9[0] = v5;
    int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v4 setQueryItems:v6];

    id v7 = [v4 URL];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)appURLForNote:(id)a3 inFolder:(id)a4
{
  id v5 = a4;
  int v6 = [a3 identifier];
  if ([v6 length])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v7 setScheme:@"applenotes"];
    [v7 setHost:@"showNote"];
    char v8 = [MEMORY[0x1E4F1CA48] array];
    int v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"identifier" value:v6];
    [v8 addObject:v9];

    if (v5)
    {
      uint64_t v10 = [v5 identifier];
      uint64_t v11 = [v10 length];

      if (v11)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F290C8];
        uint64_t v13 = [v5 identifier];
        uint64_t v14 = [v12 queryItemWithName:@"folderIdentifier" value:v13];
        [v8 addObject:v14];
      }
    }
    char v15 = (void *)[v8 copy];
    [v7 setQueryItems:v15];

    char v16 = [v7 URL];
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

+ (id)predicateForFolderWithNoteFocusedInURL:(id)a3
{
  id v4 = a3;
  if ([a1 isShowNoteFocusedInFolderURL:v4])
  {
    id v5 = [a1 predicateForNotesMentionedInURL:v4 action:@"focusNoteInFolder"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)urlForQuickNoteWithOptions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v4 setScheme:@"applenotes"];
  [v4 setHost:@"quicknote"];
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = (void *)MEMORY[0x1E4F290C8];
        uint64_t v13 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v17);
        uint64_t v14 = [v12 queryItemWithName:v11 value:v13];
        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  [v4 setQueryItems:v5];
  char v15 = [v4 URL];

  return v15;
}

+ (BOOL)quickNoteURLShouldShowList:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isQuickNoteModeURL:v3])
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    char v5 = objc_msgSend(v4, "ic_BOOLValueForQueryItemWithKey:", @"showList");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)quickNoteURLShouldShowShareSheet:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isQuickNoteModeURL:v3])
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    char v5 = objc_msgSend(v4, "ic_BOOLValueForQueryItemWithKey:", @"showShareSheet");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (BOOL)quickNoteURLShouldShowiCloudShareSheet:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isQuickNoteModeURL:v3])
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    char v5 = objc_msgSend(v4, "ic_BOOLValueForQueryItemWithKey:", @"showiCloudShareSheet");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)attachmentIdentifierFromQuickNoteURL:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isQuickNoteModeURL:v3])
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    char v5 = objc_msgSend(v4, "ic_stringValueForQueryItemWithKey:", @"attachment");
    if (!isValidIdentifier(v5))
    {

      id v6 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[ICAppURLUtilities attachmentIdentifierFromQuickNoteURL:](v6, v7, v8, v9, v10, v11, v12, v13);
      }

      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)noteIdentifierFromQuickNoteURL:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isQuickNoteModeURL:v3])
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    char v5 = objc_msgSend(v4, "ic_stringValueForQueryItemWithKey:", @"note");
    if (!isValidIdentifier(v5))
    {

      id v6 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[ICAppURLUtilities attachmentIdentifierFromQuickNoteURL:](v6, v7, v8, v9, v10, v11, v12, v13);
      }

      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)contentOffsetFromQuickNoteURL:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isQuickNoteModeURL:v3])
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    char v5 = objc_msgSend(v4, "ic_queryItemWithKey:", @"contentOffsetY");
    id v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 value];
      [v7 doubleValue];
      double v9 = v8;

      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", 0.0, v9);
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (BOOL)quickNoteURLIsContinuing:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() isQuickNoteModeURL:v3])
  {
    id v4 = [MEMORY[0x1E4F29088] componentsWithURL:v3 resolvingAgainstBaseURL:0];
    char v5 = objc_msgSend(v4, "ic_BOOLValueForQueryItemWithKey:", @"continuing");
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (id)firstQueryItemInURL:(id)a3 andHost:(id)a4 andQueryItemName:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  if (a3)
  {
    double v9 = [MEMORY[0x1E4F29088] componentsWithURL:a3 resolvingAgainstBaseURL:1];
    uint64_t v10 = [v9 scheme];
    int v11 = ICIsNotesURLScheme(v10);

    if (v11)
    {
      uint64_t v12 = [v9 host];
      int v13 = objc_msgSend(v12, "ic_isCaseInsensitiveEqualToString:", v7);

      if (v13)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v14 = objc_msgSend(v9, "queryItems", 0);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v26;
LABEL_6:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v26 != v17) {
              objc_enumerationMutation(v14);
            }
            long long v19 = *(void **)(*((void *)&v25 + 1) + 8 * v18);
            long long v20 = [v19 name];
            char v21 = objc_msgSend(v20, "ic_isCaseInsensitiveEqualToString:", v8);

            if (v21) {
              break;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
              if (v16) {
                goto LABEL_6;
              }
              goto LABEL_12;
            }
          }
          id v22 = v19;

          if (v22) {
            goto LABEL_22;
          }
        }
        else
        {
LABEL_12:
        }
        id v23 = os_log_create("com.apple.notes", "Application");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          +[ICAppURLUtilities firstQueryItemInURL:andHost:andQueryItemName:]((uint64_t)v8, v9, v23);
        }
      }
      else
      {
        id v23 = os_log_create("com.apple.notes", "Application");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          +[ICAppURLUtilities firstQueryItemInURL:andHost:andQueryItemName:]((uint64_t)v7, (uint64_t)v9, v23);
        }
      }
    }
    id v22 = 0;
LABEL_22:
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

+ (id)referralURLForSnapshotBackgroundTask
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  [v2 setScheme:@"applenotes"];
  [v2 setHost:@"snapshotBackgroundTask"];
  id v3 = [v2 URL];

  return v3;
}

+ (id)URLForAttributedString:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = __Block_byref_object_copy__38;
  long long v25 = __Block_byref_object_dispose__38;
  id v26 = 0;
  if (length)
  {
    uint64_t v8 = *MEMORY[0x1E4FB0720];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __50__ICAppURLUtilities_URLForAttributedString_range___block_invoke;
    v20[3] = &unk_1E64A4AF0;
    v20[4] = &v21;
    objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, location, length, 0, v20);
  }
  else
  {
    if (location < [v6 length])
    {
      uint64_t v9 = [v7 attribute:*MEMORY[0x1E4FB0720] atIndex:location effectiveRange:0];
      uint64_t v10 = (void *)v22[5];
      v22[5] = v9;
    }
    if (v22[5]) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = location == 0;
    }
    if (!v11)
    {
      uint64_t v12 = [v7 attribute:*MEMORY[0x1E4FB0720] atIndex:location - 1 effectiveRange:0];
      int v13 = (void *)v22[5];
      v22[5] = v12;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = (id)v22[5];
LABEL_14:
    uint64_t v15 = v14;
    goto LABEL_20;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = [MEMORY[0x1E4F1CB10] URLWithString:v22[5]];
    goto LABEL_14;
  }
  if (v22[5])
  {
    uint64_t v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      *(_DWORD *)buf = 138412290;
      long long v28 = v18;
      _os_log_impl(&dword_1C3A61000, v16, OS_LOG_TYPE_DEFAULT, "Cannot convert link attribute of type %@ to an NSURL", buf, 0xCu);
    }
  }
  uint64_t v15 = 0;
LABEL_20:
  _Block_object_dispose(&v21, 8);

  return v15;
}

void __50__ICAppURLUtilities_URLForAttributedString_range___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  if (v8)
  {
    id v13 = v8;
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v12 = *(void **)(v9 + 40);
    uint64_t v10 = (id *)(v9 + 40);
    BOOL v11 = v12;
    if (v12)
    {
      *uint64_t v10 = 0;

      *a5 = 1;
    }
    else
    {
      objc_storeStrong(v10, a2);
    }
    id v8 = v13;
  }
}

+ (id)URLWithSchemeForString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  char v5 = (void *)[[v3 alloc] initWithString:v4];
  id v6 = [v5 scheme];

  if (v6) {
    [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else {
  id v7 = +[ICAppURLUtilities detectedURLInString:v4 allowNonLinkCharacters:1];
  }

  return v7;
}

+ (id)noteIdentifierFromNotesAppURL:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 scheme],
        char v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = ICIsNotesURLScheme(v5),
        v5,
        v6))
  {
    id v7 = [a1 modernNoteIdentifierFromEntityURI:v4];
    if ([v7 length])
    {
      id v8 = v7;
    }
    else
    {
      NotesAppGUIDForNoteMentionedInURL(v4);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)NotesAppIDForNoteMentionedInURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  if (!ICIsNotesURLScheme(v4)) {
    goto LABEL_12;
  }
  char v5 = [v3 host];
  if (objc_msgSend(v5, "ic_isCaseInsensitiveEqualToString:", @"showNote"))
  {
  }
  else
  {
    int v6 = [v3 host];
    int v7 = objc_msgSend(v6, "ic_isCaseInsensitiveEqualToString:", @"showHTMLNote");

    if (!v7)
    {
      id v13 = 0;
      goto LABEL_17;
    }
  }
  id v8 = [v3 query];
  uint64_t v9 = [v8 componentsSeparatedByString:@"&"];
  id v4 = [v9 lastObject];

  if (v4)
  {
    uint64_t v10 = [v4 componentsSeparatedByString:@"="];
    if ([v10 count] == 2)
    {
      BOOL v11 = [v10 objectAtIndexedSubscript:0];
      int v12 = objc_msgSend(v11, "ic_isCaseInsensitiveEqualToString:", @"identifier");

      id v13 = 0;
      if (v12)
      {
        id v14 = [v10 objectAtIndexedSubscript:1];
        if (isValidIdentifier(v14)) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = 0;
        }
        id v13 = v15;
      }
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
LABEL_12:
    id v13 = 0;
  }

LABEL_17:
  return v13;
}

+ (id)detectedURLInString:(id)a3 allowNonLinkCharacters:(BOOL)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v26 = 0;
  int v6 = [MEMORY[0x1E4F28BE8] dataDetectorWithTypes:32 error:&v26];
  id v7 = v26;
  if (v6)
  {
    uint64_t v8 = objc_msgSend(v5, "ic_range");
    uint64_t v10 = v9;
    objc_msgSend(v6, "matchesInString:options:range:", v5, 0, v8, v9);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    os_log_t v11 = (os_log_t)(id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      id v21 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (!a4 && (v8 != [*(id *)(*((void *)&v22 + 1) + 8 * i) range] || v10 != v17)) {
            continue;
          }
          long long v19 = [v16 URL];
          id v7 = v21;
          goto LABEL_20;
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        long long v19 = 0;
        id v7 = v21;
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      long long v19 = 0;
    }
LABEL_20:
  }
  else
  {
    os_log_t v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[ICAppURLUtilities detectedURLInString:allowNonLinkCharacters:](v11);
    }
    long long v19 = 0;
  }

  return v19;
}

+ (id)entityURIForNote:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6FC7E0);
  MEMORY[0x1F4188790](v4 - 8);
  int v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = a3;
  static ICAppURLUtilities.entityURI(for:)(v7, v6);

  uint64_t v8 = sub_1C3DB88F8();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    uint64_t v10 = (void *)sub_1C3DB8848();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

+ (BOOL)isHTMLNoteEntityURI:(id)a3
{
  return sub_1C3D15E80((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))_sSo17ICAppURLUtilitiesC11NotesSharedE19isHTMLNoteEntityURIySb10Foundation3URLVFZ_0);
}

+ (BOOL)isModernNoteEntityURI:(id)a3
{
  return sub_1C3D1593C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t *__return_ptr, uint64_t))sub_1C3D12F10);
}

+ (id)objectIDURIRepresentationForHTMLNoteEntityURI:(id)a3 context:(id)a4
{
  uint64_t v5 = sub_1C3DB88F8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6FC7E0);
  MEMORY[0x1F4188790](v9 - 8);
  os_log_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8898();
  swift_unknownObjectRetain();
  static ICAppURLUtilities.objectIDURIRepresentation(forHTMLNoteEntityURI:context:)(a4, (uint64_t)v11);
  swift_unknownObjectRelease();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v6 + 8);
  v12(v8, v5);
  uint64_t v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) != 1)
  {
    uint64_t v13 = (void *)sub_1C3DB8848();
    v12(v11, v5);
  }
  return v13;
}

+ (id)modernNoteIdentifierFromEntityURI:(id)a3
{
  uint64_t v3 = sub_1C3DB88F8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C3DB8898();
  _sSo17ICAppURLUtilitiesC11NotesSharedE20modernNoteIdentifier13fromEntityURISSSg10Foundation3URLV_tFZ_0();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (v8)
  {
    uint64_t v9 = (void *)sub_1C3DB9BF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = 0;
  }
  return v9;
}

+ (BOOL)isHTMLFolderEntityURI:(id)a3
{
  return sub_1C3D15E80((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))_sSo17ICAppURLUtilitiesC11NotesSharedE21isHTMLFolderEntityURIySb10Foundation3URLVFZ_0);
}

+ (BOOL)isModernFolderEntityURI:(id)a3
{
  return sub_1C3D1593C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t *__return_ptr, uint64_t))sub_1C3D120D0);
}

+ (id)objectIDForHTMLFolderEntityURI:(id)a3 context:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6FC7E0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1C3DB8898();
    uint64_t v9 = sub_1C3DB88F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_1C3DB88F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  swift_unknownObjectRetain();
  id v11 = _sSo17ICAppURLUtilitiesC11NotesSharedE8objectID22forHTMLFolderEntityURI7contextSo015NSManagedObjectF0CSg10Foundation3URLVSg_So15ICLegacyContext_ptFZ_0((uint64_t)v8, a4);
  swift_unknownObjectRelease();
  sub_1C3C2A448((uint64_t)v8, (uint64_t *)&unk_1EB6FC7E0);
  return v11;
}

+ (id)objectIDForModernFolderEntityURI:(id)a3 noteContext:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB6FC7E0);
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1C3DB8898();
    uint64_t v9 = sub_1C3DB88F8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_1C3DB88F8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  id v11 = a4;
  id v12 = _sSo17ICAppURLUtilitiesC11NotesSharedE8objectID24forModernFolderEntityURI11noteContextSo015NSManagedObjectF0CSg10Foundation3URLVSg_So06ICNoteM0CtFZ_0((uint64_t)v8, v11);

  sub_1C3C2A448((uint64_t)v8, (uint64_t *)&unk_1EB6FC7E0);
  return v12;
}

+ (void)predicateForNotesWithIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)attachmentIdentifierFromQuickNoteURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)firstQueryItemInURL:(uint64_t)a1 andHost:(void *)a2 andQueryItemName:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a2 query];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_1C3A61000, a3, OS_LOG_TYPE_DEBUG, "Unknown query item %@ in query %@", (uint8_t *)&v6, 0x16u);
}

+ (void)firstQueryItemInURL:(uint64_t)a1 andHost:(uint64_t)a2 andQueryItemName:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Unknown host %@ in url %@", (uint8_t *)&v3, 0x16u);
}

+ (void)detectedURLInString:(os_log_t)log allowNonLinkCharacters:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "Could not create NSDataDetector.", v1, 2u);
}

@end