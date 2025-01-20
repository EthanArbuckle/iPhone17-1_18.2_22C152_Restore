@interface PXMemoriesInlineProblemReporter
- (NSArray)features;
- (PHMemory)memory;
- (PXMemoriesInlineProblemReporter)initWithMemory:(id)a3 features:(id)a4;
- (id)_disclaimerText;
- (id)_headerText;
- (id)_infoText;
- (id)_reportStringForFeatures;
- (id)feedbackMailViewController;
- (void)setFeatures:(id)a3;
- (void)setMemory:(id)a3;
@end

@implementation PXMemoriesInlineProblemReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_memory, 0);
}

- (void)setFeatures:(id)a3
{
}

- (NSArray)features
{
  return self->_features;
}

- (void)setMemory:(id)a3
{
}

- (PHMemory)memory
{
  return self->_memory;
}

- (id)_headerText
{
  v2 = [(PXMemoriesInlineProblemReporter *)self memory];
  v3 = [v2 localizedTitle];
  v4 = [v3 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F00B0030];

  v5 = [v2 localizedSubtitle];
  v6 = [v5 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F00B0030];

  if (v6)
  {
    uint64_t v7 = [v4 stringByAppendingFormat:@" – %@", v6];

    v4 = (void *)v7;
  }
  v8 = [NSString stringWithFormat:@"Please identify which of the values you think are incorrect for the Memory \"%@\".\n\t\t\tWhat meaning or mood would you have picked?\n\n", v4];

  return v8;
}

- (id)_disclaimerText
{
  return (id)objc_msgSend(@"I agree that Apple and its strategic partners may use, adapt, modify, reproduce, and distribute internally in perpetuity, the metadata (\"time\", \"location\", \"people\", …) that I am providing with this bug report, for the purpose of improving Photos Memories capabilities. Apple may not use the metadata in any other fashion than as provided herein. Please do not provide any metadata of images that contain third parties or for which you do not have sufficient rights.\n\n\t\t\tI represent that the metadata are original to and/or owned by me and that I have the rights necessary to grant to Apple the rights provided herein. I release Apple, its agents, employees, licensees and assigns from any and all claims I may have now or in the future for invasion of privacy, right of publicity, trademark infringement, copyright infringement, defamation or any other cause of action arising out of the use or reproduction of the metadata.\n\n\t\t\tI have read and fully understand the foregoing and hereby acknowledge my agreement to its terms.\n", "uppercaseString");
}

- (id)_infoText
{
  return @"\n\nThank you for feedback.";
}

- (id)_reportStringForFeatures
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(PXMemoriesInlineProblemReporter *)self features];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 localizedTypeStringValue];
        v11 = [v9 localizedTitle];
        [v3 appendFormat:@"- %@: %@\n", v10, v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)feedbackMailViewController
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([getMFMailComposeViewControllerClass_280869() canSendMail])
  {
    id v3 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_280869());
    [v3 setSubject:@"Memories living-on feedback"];
    [v3 setToRecipients:&unk_1F02D5608];
    v4 = [MEMORY[0x1E4F28E78] string];
    uint64_t v5 = [(PXMemoriesInlineProblemReporter *)self _headerText];
    [v4 appendString:v5];

    uint64_t v6 = [(PXMemoriesInlineProblemReporter *)self _reportStringForFeatures];
    [v4 appendString:v6];

    uint64_t v7 = [(PXMemoriesInlineProblemReporter *)self _infoText];
    [v4 appendFormat:@"\n\n%@\n", v7];

    v8 = [(PXMemoriesInlineProblemReporter *)self memory];
    v9 = +[PXMemoriesRelatedDiagnosticsHelper getSummaryFromProviderItem:v8];

    if (v9)
    {
      id v35 = 0;
      v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:200 options:0 error:&v35];
      id v11 = v35;
      if (v10)
      {
        [v3 addAttachmentData:v10 mimeType:@"application/x-plist" fileName:@"results.plist"];
        goto LABEL_12;
      }
    }
    else
    {
      id v11 = 0;
    }
    v12 = NSString;
    long long v13 = [v11 localizedDescription];
    v10 = [v12 stringWithFormat:@"Cannot attach results.plist: %@.", v13];

    [v4 appendFormat:@"%@\n\n", v10];
    long long v14 = PLUIGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v10;
      _os_log_impl(&dword_1A9AE7000, v14, OS_LOG_TYPE_ERROR, "ERROR: %@", buf, 0xCu);
    }

LABEL_12:
    long long v15 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    long long v16 = [v15 urlForApplicationDataFolderIdentifier:1];

    v17 = [v16 URLByAppendingPathComponent:@"Graph.plist"];
    if (!v17)
    {
LABEL_27:
      v29 = [(PXMemoriesInlineProblemReporter *)self _disclaimerText];
      [v4 appendFormat:@"\n\n%@\n", v29];

      [v3 setMessageBody:v4 isHTML:0];
      goto LABEL_28;
    }
    v31 = v9;
    id v34 = v11;
    uint64_t v18 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v17 options:0 error:&v34];
    id v19 = v34;

    if (v18 && !v19)
    {
      v20 = [v17 lastPathComponent];
      [v3 addAttachmentData:v18 mimeType:@"application/octet-stream" fileName:v20];
      id v11 = 0;
LABEL_26:

      v9 = v31;
      goto LABEL_27;
    }

    v21 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v33 = 0;
    v20 = [v21 exportGraphForPurpose:@"default" error:&v33];
    id v11 = v33;

    if (v20 && !v11)
    {
      id v32 = 0;
      v22 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v20 options:0 error:&v32];
      id v11 = v32;

      if (v22 && !v11)
      {
        v23 = [v17 lastPathComponent];
        [v3 addAttachmentData:v22 mimeType:@"application/octet-stream" fileName:v23];

        [v22 writeToURL:v17 atomically:1];
        id v11 = 0;
        uint64_t v18 = v22;
        goto LABEL_26;
      }
      uint64_t v18 = v22;
    }
    if (v11)
    {
      v24 = NSString;
      v25 = [v11 localizedDescription];
      uint64_t v26 = [v24 stringWithFormat:@"Cannot attach graph: \"%@\"", v25];

      v27 = (void *)v26;
      [v4 appendFormat:@"%@\n\n", v26];
      v28 = PLUIGetLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v27;
        _os_log_impl(&dword_1A9AE7000, v28, OS_LOG_TYPE_ERROR, "ERROR: %@", buf, 0xCu);
      }
    }
    goto LABEL_26;
  }
  v4 = PLUIGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Looks like email is not setup on this system.", buf, 2u);
  }
  id v3 = 0;
LABEL_28:

  return v3;
}

- (PXMemoriesInlineProblemReporter)initWithMemory:(id)a3 features:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXMemoriesInlineProblemReporter;
  v9 = [(PXMemoriesInlineProblemReporter *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memory, a3);
    objc_storeStrong((id *)&v10->_features, a4);
  }

  return v10;
}

@end