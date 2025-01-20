@interface NotesActivityViewController
- (BOOL)_shouldShowSystemActivityType:(id)a3;
- (NotesDisplayController)displayController;
- (void)_prepareActivity:(id)a3;
- (void)setDisplayController:(id)a3;
@end

@implementation NotesActivityViewController

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:UIActivityTypeMessage] & 1) != 0
    || ([v3 isEqualToString:UIActivityTypeMail] & 1) != 0
    || ([v3 isEqualToString:UIActivityTypePrint] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:UIActivityTypeCopyToPasteboard];
  }

  return v4;
}

- (void)_prepareActivity:(id)a3
{
  id v4 = a3;
  v5 = [(NotesActivityViewController *)self displayController];
  v6 = [v5 note];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v39 = v4;
      v7 = [v4 mailComposeViewController];
      v21 = +[UIColor _systemInteractionTintColor];
      v22 = [v7 view];
      [v22 _setInteractionTintColor:v21];

      v23 = [v6 title];
      [v7 setSubject:v23];

      v24 = [v6 content];
      [v7 setMessageBody:v24 isHTML:[v6 isPlainText] ^ 1];

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      v38 = v6;
      v11 = [v6 attachments];
      id v25 = [v11 countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v25)
      {
        id v26 = v25;
        uint64_t v27 = *(void *)v42;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v42 != v27) {
              objc_enumerationMutation(v11);
            }
            v29 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            id v40 = 0;
            v30 = [v29 attachmentDataWithError:&v40];
            id v31 = v40;
            if (v30)
            {
              v32 = [v29 mimeType];
              v33 = [v29 filename];

              [v7 addAttachmentData:v30 mimeType:v32 fileName:v33];
            }
            else
            {
              v32 = [v29 contentID];
              v33 = [v31 localizedDescription];

              NSLog(@"Couldn't attach data to Mail for contentID: %@, error: %@", v32, v33);
            }
          }
          id v26 = [v11 countByEnumeratingWithState:&v41 objects:v50 count:16];
        }
        while (v26);
      }
      goto LABEL_24;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (![v6 isPlainText])
      {
        v34 = [(NotesActivityViewController *)self displayController];
        [v34 copyNoteHTMLToPasteboard];
        goto LABEL_33;
      }
      v34 = [v6 contentAsPlainTextPreservingNewlines];
      if (!v34)
      {
LABEL_33:

        goto LABEL_34;
      }
      v35 = [v4 pasteboard];
      [v35 setString:v34];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_34;
      }
      v34 = [v4 socialComposeViewController];
      v36 = +[UIColor _systemInteractionTintColor];
      v37 = [v34 view];
      [v37 _setInteractionTintColor:v36];

      v35 = [v6 contentAsPlainTextPreservingNewlines];
      [v34 setInitialText:v35];
    }

    goto LABEL_33;
  }
  id v39 = v4;
  v7 = [v4 messageComposeViewController];
  v8 = +[UIColor _systemInteractionTintColor];
  v9 = [v7 view];
  [v9 _setInteractionTintColor:v8];

  v10 = [v6 contentAsPlainTextPreservingNewlines];
  [v7 setBody:v10];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v38 = v6;
  v11 = [v6 attachments];
  id v12 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v47;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
        id v45 = 0;
        v17 = [v16 attachmentDataWithError:&v45];
        id v18 = v45;
        if (v17)
        {
          v19 = [v16 mimeType];
          v20 = [v16 filename];

          [v7 addAttachmentData:v17 typeIdentifier:v19 filename:v20];
        }
        else
        {
          v19 = [v16 contentID];
          v20 = [v18 localizedDescription];

          NSLog(@"Couldn't attach data to Message for contentID: %@, error: %@", v19, v20);
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v13);
  }
LABEL_24:

  v6 = v38;
  id v4 = v39;
LABEL_34:
}

- (NotesDisplayController)displayController
{
  return self->_displayController;
}

- (void)setDisplayController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end