@interface SDAirDropHandlerNotes
+ (id)extractNotesURLs:(id)a3;
- (BOOL)canHandleTransfer;
- (SDAirDropHandlerNotes)initWithTransfer:(id)a3;
- (id)createDestination;
- (id)defaultOpenActionBundleID;
- (id)suitableContentsDescription;
- (int64_t)transferTypes;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerNotes

- (SDAirDropHandlerNotes)initWithTransfer:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SDAirDropHandlerNotes;
  v3 = [(SDAirDropHandlerGenericFiles *)&v9 initWithTransfer:a3 bundleIdentifier:@"com.apple.mobilenotes"];
  v4 = v3;
  if (v3)
  {
    v5 = [(SDAirDropHandler *)v3 bundleProxy];

    if (v5)
    {
      v6 = [(SDAirDropHandler *)v4 bundleProxy];
      v10 = v6;
      v7 = +[NSArray arrayWithObjects:&v10 count:1];
      [(SDAirDropHandlerGenericFiles *)v4 setAvailableApplications:v7];
    }
  }
  return v4;
}

- (BOOL)canHandleTransfer
{
  if (![(SDAirDropHandler *)self isJustFiles]) {
    return 0;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(SDAirDropHandler *)self transfer];
  v4 = [v3 metaData];
  v5 = [v4 rawFiles];

  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = kSFOperationFileNameKey;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) objectForKeyedSubscript:v9];
        v12 = [v11 pathExtension];

        LODWORD(v11) = SFIsNote();
        if (!v11)
        {
          BOOL v13 = 0;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerNotes;
  return (unint64_t)[(SDAirDropHandlerGenericFiles *)&v3 transferTypes] | 0x100;
}

- (id)suitableContentsDescription
{
  objc_super v3 = [(SDAirDropHandler *)self senderName];
  unint64_t v4 = [(SDAirDropHandler *)self totalSharedItemsCount];
  CFStringRef v13 = @"NOTE";
  v5 = +[NSNumber numberWithUnsignedInteger:v4];
  v14 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  long long v15 = v6;
  id v7 = +[NSArray arrayWithObjects:&v15 count:1];
  uint64_t v8 = [(SDAirDropHandler *)self alertMessageLocalizedKeyForTypeDicts:v7];

  LODWORD(v6) = [(SDAirDropHandler *)self isModernProgress];
  uint64_t v9 = SFLocalizedStringForKey();
  if (v6) {
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v4, v12);
  }
  else {
  v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v3, v4);
  }

  return v10;
}

- (void)updatePossibleActions
{
  v2.receiver = self;
  v2.super_class = (Class)SDAirDropHandlerNotes;
  [(SDAirDropHandlerGenericFiles *)&v2 updatePossibleActions];
}

- (id)createDestination
{
  objc_super v3 = NSHomeDirectory();
  unint64_t v4 = +[NSURL fileURLWithPath:v3 isDirectory:1];
  id v9 = 0;
  v5 = sub_1001B27DC(v4, &v9);
  id v6 = v9;

  if (!v5)
  {
    id v7 = airdrop_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000C6D64(self, (uint64_t)v6, v7);
    }
  }

  return v5;
}

+ (id)extractNotesURLs:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 136315394;
    long long v19 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = +[NSFileManager defaultManager];
        CFStringRef v13 = [v11 path];
        unsigned int v14 = [v12 fileExistsAtPath:v13];

        if (v14)
        {
          long long v15 = [v11 absoluteString];
          long long v16 = [v15 pathExtension];

          if (SFIsNote())
          {
            [v4 addObject:v11];
          }
          else
          {
            long long v17 = airdrop_log();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              v25 = "+[SDAirDropHandlerNotes extractNotesURLs:]";
              __int16 v26 = 2112;
              v27 = v11;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "### %s - dropped URL:[%@]", buf, 0x16u);
            }
          }
        }
        else
        {
          long long v16 = airdrop_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v19;
            v25 = "+[SDAirDropHandlerNotes extractNotesURLs:]";
            __int16 v26 = 2112;
            v27 = v11;
            _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "### %s -- URL does not exist on filesystem:[%@]", buf, 0x16u);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)defaultOpenActionBundleID
{
  return 0;
}

@end