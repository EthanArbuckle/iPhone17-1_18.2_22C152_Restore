@interface _UNImageProvider
+ (id)_contactForImageRenderingFromContentURLWithContext:(id)a3 bundleIdentifier:(id)a4;
+ (id)_contactsForImageRenderingFromRecipientsWithContext:(id)a3 bundleIdentifier:(id)a4 descriptorForRequiredKeys:(id)a5;
+ (id)_imageDataFromFileSystemForContactURL:(id)a3;
+ (id)_imageDataFromIntentsForContentURL:(id)a3;
+ (id)generateEphemeralContactsForImageRenderingWithContext:(id)a3 bundleIdentifier:(id)a4 descriptorForRequiredKeys:(id)a5;
+ (id)generateEphemeralContactsForImageRenderingWithContext:(id)a3 descriptorForRequiredKeys:(id)a4;
+ (id)imageDataForContentURL:(id)a3;
@end

@implementation _UNImageProvider

+ (id)imageDataForContentURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  NCRegisterUserNotificationsUILogging();
  if (v4)
  {
    int v5 = [v4 isFileURL];
    if (!v5) {
      goto LABEL_6;
    }
    v6 = [a1 _imageDataFromFileSystemForContactURL:v4];
    v7 = NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136446722;
      v15 = "+[_UNImageProvider imageDataForContentURL:]";
      __int16 v16 = 2114;
      id v17 = v4;
      __int16 v18 = 1026;
      LODWORD(v19) = v6 != 0;
      _os_log_impl(&dword_22012C000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from file system FIRST. Success:%{public}d", (uint8_t *)&v14, 0x1Cu);
    }
    if (!v6)
    {
LABEL_6:
      v6 = [a1 _imageDataFromIntentsForContentURL:v4];
      v8 = NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v9 = @"FIRST";
        int v14 = 136446978;
        v15 = "+[_UNImageProvider imageDataForContentURL:]";
        if (v5) {
          v9 = @"SECOND";
        }
        __int16 v16 = 2114;
        id v17 = v4;
        __int16 v18 = 2114;
        v19 = v9;
        __int16 v20 = 1026;
        BOOL v21 = v6 != 0;
        _os_log_impl(&dword_22012C000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from intents %{public}@. Success:%{public}d", (uint8_t *)&v14, 0x26u);
      }
      if (v6) {
        char v10 = 1;
      }
      else {
        char v10 = v5;
      }
      if ((v10 & 1) == 0)
      {
        v6 = [a1 _imageDataFromFileSystemForContactURL:v4];
        v11 = NCUILogCommunicationNotifications;
        if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136446722;
          v15 = "+[_UNImageProvider imageDataForContentURL:]";
          __int16 v16 = 2114;
          id v17 = v4;
          __int16 v18 = 1026;
          LODWORD(v19) = v6 != 0;
          _os_log_impl(&dword_22012C000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from file system SECOND. Success:%{public}d", (uint8_t *)&v14, 0x1Cu);
        }
      }
    }
  }
  else
  {
    v12 = NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136446210;
      v15 = "+[_UNImageProvider imageDataForContentURL:]";
      _os_log_impl(&dword_22012C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:nil", (uint8_t *)&v14, 0xCu);
    }
    v6 = 0;
  }

  return v6;
}

+ (id)generateEphemeralContactsForImageRenderingWithContext:(id)a3 bundleIdentifier:(id)a4 descriptorForRequiredKeys:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  NCRegisterUserNotificationsUILogging();
  v11 = (void *)NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = [v8 identifier];
    int v14 = objc_msgSend(v13, "un_logDigest");
    *(_DWORD *)buf = 138543874;
    id v34 = v9;
    __int16 v35 = 2082;
    v36 = "+[_UNImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
    __int16 v37 = 2114;
    v38 = v14;
    _os_log_impl(&dword_22012C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Start getting contacts", buf, 0x20u);
  }
  if (!v8)
  {
    BOOL v21 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_15;
  }
  v15 = [a1 _contactForImageRenderingFromContentURLWithContext:v8 bundleIdentifier:v9];
  if (v15)
  {
    __int16 v16 = (void *)NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v16;
      __int16 v18 = [v8 identifier];
      v19 = objc_msgSend(v18, "un_logDigest");
      *(_DWORD *)buf = 138543874;
      id v34 = v9;
      __int16 v35 = 2082;
      v36 = "+[_UNImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
      __int16 v37 = 2114;
      v38 = v19;
      _os_log_impl(&dword_22012C000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Contact created from content URL", buf, 0x20u);
    }
    v32 = v15;
    uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  }
  else
  {
    int v22 = objc_msgSend(v9, "un_isFirstPartyIdentifier");
    v23 = (void *)NCUILogCommunicationNotifications;
    BOOL v24 = os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT);
    if (!v22)
    {
      if (v24)
      {
        v29 = v23;
        v30 = [v8 identifier];
        v31 = objc_msgSend(v30, "un_logDigest");
        *(_DWORD *)buf = 138543874;
        id v34 = v9;
        __int16 v35 = 2082;
        v36 = "+[_UNImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
        __int16 v37 = 2114;
        v38 = v31;
        _os_log_impl(&dword_22012C000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ No contact created because no data found content URL provided", buf, 0x20u);
      }
      BOOL v21 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_14;
    }
    if (v24)
    {
      v25 = v23;
      v26 = [v8 identifier];
      v27 = objc_msgSend(v26, "un_logDigest");
      *(_DWORD *)buf = 138543874;
      id v34 = v9;
      __int16 v35 = 2082;
      v36 = "+[_UNImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
      __int16 v37 = 2114;
      v38 = v27;
      _os_log_impl(&dword_22012C000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Contacts created from recipients for snowglobe (1st party only)", buf, 0x20u);
    }
    uint64_t v20 = [a1 _contactsForImageRenderingFromRecipientsWithContext:v8 bundleIdentifier:v9 descriptorForRequiredKeys:v10];
  }
  BOOL v21 = (void *)v20;
LABEL_14:

LABEL_15:

  return v21;
}

+ (id)_imageDataFromIntentsForContentURL:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF910] now];
  int v5 = NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v29 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
    __int16 v30 = 2114;
    id v31 = v3;
    _os_log_impl(&dword_22012C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Starting Read", buf, 0x16u);
  }
  v6 = [MEMORY[0x263F0FB88] imageWithURL:v3];
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 _imageData];
    if (v8)
    {
LABEL_20:
      uint64_t v20 = objc_msgSend(MEMORY[0x263EFF910], "now", v26);
      [v20 timeIntervalSinceDate:v4];
      uint64_t v22 = v21;
      v23 = NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447491;
        v29 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
        __int16 v30 = 2114;
        id v31 = v3;
        __int16 v32 = 1026;
        *(_DWORD *)v33 = v8 != 0;
        *(_WORD *)&v33[4] = 2160;
        *(void *)&v33[6] = 1752392040;
        *(_WORD *)&v33[14] = 2117;
        *(void *)&v33[16] = v8;
        __int16 v34 = 2050;
        uint64_t v35 = v22;
        _os_log_impl(&dword_22012C000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Ending Read. Success: %{public}d. %{sensitive, mask.hash}@ Finished in: %{public}f milliseconds", buf, 0x3Au);
      }

      goto LABEL_23;
    }
    id v9 = [v7 _uri];
    if ([v9 isFileURL])
    {
      id v10 = v9;
      [v10 fileSystemRepresentation];
      v11 = (const char *)sandbox_extension_issue_file();
      if (!v11)
      {
        v25 = (void *)NCUILogCommunicationNotifications;
        if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR)) {
          +[_UNImageProvider _imageDataFromIntentsForContentURL:v25];
        }
        id v8 = 0;
        goto LABEL_19;
      }
      v12 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v11 length:strlen(v11) + 1 freeWhenDone:1];
      [v7 _setSandboxExtensionData:v12];
    }
    v13 = [MEMORY[0x263F0FB98] sharedConnection];
    id v27 = 0;
    int v14 = objc_msgSend(v13, "loadDataImageFromImage:scaledSize:error:", v7, &v27, *MEMORY[0x263F0F760], *(double *)(MEMORY[0x263F0F760] + 8));
    id v15 = v27;

    if (!v14 || v15)
    {
      v19 = NCUILogCommunicationNotifications;
      if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v29 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
        __int16 v30 = 2114;
        id v31 = v3;
        __int16 v32 = 2114;
        *(void *)v33 = v7;
        *(_WORD *)&v33[8] = 2114;
        *(void *)&v33[10] = v15;
        _os_log_error_impl(&dword_22012C000, v19, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to fetch icon data from INImage %{public}@ with error %{public}@", buf, 0x2Au);
      }
      id v8 = 0;
    }
    else
    {
      id v8 = [v14 _imageData];
      __int16 v16 = (void *)NCUILogClient;
      if (os_log_type_enabled((os_log_t)NCUILogClient, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v16;
        v26 = [v7 _identifier];
        *(_DWORD *)buf = 136446722;
        v29 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
        __int16 v30 = 2114;
        id v31 = v3;
        __int16 v32 = 2114;
        *(void *)v33 = v26;
        _os_log_impl(&dword_22012C000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Successfully fetched identity image with identifier '%{public}@'", buf, 0x20u);
      }
    }

LABEL_19:
    goto LABEL_20;
  }
  __int16 v18 = NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_ERROR)) {
    +[_UNImageProvider _imageDataFromIntentsForContentURL:]((uint64_t)v3, v18);
  }
  id v8 = 0;
LABEL_23:

  return v8;
}

+ (id)_imageDataFromFileSystemForContactURL:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF910] now];
  int v5 = NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v16 = "+[_UNImageProvider _imageDataFromFileSystemForContactURL:]";
    __int16 v17 = 2114;
    id v18 = v3;
    _os_log_impl(&dword_22012C000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Starting Read", buf, 0x16u);
  }
  id v14 = 0;
  v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:1 error:&v14];
  id v7 = v14;
  if (v7)
  {
    id v8 = NCUILogCommunicationNotifications;
    if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v16 = "+[_UNImageProvider _imageDataFromFileSystemForContactURL:]";
      __int16 v17 = 2114;
      id v18 = v3;
      __int16 v19 = 2114;
      v20[0] = v7;
      _os_log_impl(&dword_22012C000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Error reading image data %{public}@", buf, 0x20u);
    }
  }
  id v9 = [MEMORY[0x263EFF910] now];
  [v9 timeIntervalSinceDate:v4];
  uint64_t v11 = v10;
  v12 = NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v16 = "+[_UNImageProvider _imageDataFromFileSystemForContactURL:]";
    __int16 v17 = 2114;
    id v18 = v3;
    __int16 v19 = 1026;
    LODWORD(v20[0]) = v6 != 0;
    WORD2(v20[0]) = 2050;
    *(void *)((char *)v20 + 6) = v11;
    _os_log_impl(&dword_22012C000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Ending Read. Success:%{public}d. Finished in:%{public}f milliseconds", buf, 0x26u);
  }

  return v6;
}

+ (id)_contactForImageRenderingFromContentURLWithContext:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)NCUILogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)NCUILogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = [v6 identifier];
    uint64_t v11 = objc_msgSend(v10, "un_logDigest");
    v12 = [v6 contentURL];
    v13 = [v6 contentURL];
    int v20 = 138544386;
    id v21 = v7;
    __int16 v22 = 2082;
    v23 = "+[_UNImageProvider _contactForImageRenderingFromContentURLWithContext:bundleIdentifier:]";
    __int16 v24 = 2114;
    v25 = v11;
    __int16 v26 = 1026;
    BOOL v27 = v12 != 0;
    __int16 v28 = 2114;
    v29 = v13;
    _os_log_impl(&dword_22012C000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Will attempt to get image data:%{public}d withURL:%{public}@", (uint8_t *)&v20, 0x30u);
  }
  id v14 = [v6 contentURL];
  if (!v14)
  {
    id v15 = 0;
    goto LABEL_9;
  }
  id v15 = [a1 imageDataForContentURL:v14];
  if (!v15)
  {
LABEL_9:
    id v16 = 0;
    goto LABEL_10;
  }
  id v16 = objc_alloc_init(MEMORY[0x263EFEAF0]);
  [v16 setImageData:v15];
  __int16 v17 = [v14 absoluteString];
  if (v17) {
    [v16 setGivenName:v17];
  }
  [v16 setFamilyName:v7];

LABEL_10:
  id v18 = v16;

  return v18;
}

+ (id)_contactsForImageRenderingFromRecipientsWithContext:(id)a3 bundleIdentifier:(id)a4 descriptorForRequiredKeys:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  __int16 v24 = v7;
  uint64_t v11 = [v7 allContacts];
  uint64_t v27 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v27)
  {
    v25 = v11;
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v11);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v14 = [v13 cnContactIdentifier];
        if (!v14) {
          goto LABEL_8;
        }
        id v15 = +[_UNNotificationContactService sharedInstance];
        id v32 = v9;
        id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
        id v17 = [v15 curatedContactForContact:v13 bundleIdentifier:v8 keysToFetch:v16];

        if (!v17)
        {
LABEL_8:
          id v18 = [v13 displayName];
          unint64_t v19 = [v18 rangeOfString:@" "];
          id v17 = objc_alloc_init(MEMORY[0x263EFEAF0]);
          BOOL v20 = (unint64_t)[v18 length] < 3 || v19 == 0;
          if (v20 || v19 >= [v18 length] - 1)
          {
            [v17 setGivenName:v18];
          }
          else
          {
            id v21 = objc_msgSend(v18, "substringWithRange:", 0, v19);
            uint64_t v11 = v25;
            __int16 v22 = objc_msgSend(v18, "substringWithRange:", v19 + 1, objc_msgSend(v18, "length") + ~v19);
            [v17 setGivenName:v21];
            [v17 setFamilyName:v22];
          }
        }
        [v10 addObject:v17];
      }
      uint64_t v27 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v27);
  }

  return v10;
}

+ (id)generateEphemeralContactsForImageRenderingWithContext:(id)a3 descriptorForRequiredKeys:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [v7 bundleIdentifier];
    id v9 = [a1 generateEphemeralContactsForImageRenderingWithContext:v7 bundleIdentifier:v8 descriptorForRequiredKeys:v6];
  }
  else
  {
    id v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

+ (void)_imageDataFromIntentsForContentURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  id v3 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_22012C000, a2, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to create an INIntent from url. Cannot proceed with loading data from INImageServiceConnection.", (uint8_t *)&v2, 0x16u);
}

+ (void)_imageDataFromIntentsForContentURL:(void *)a3 .cold.2(uint64_t a1, id a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = [v5 fileSystemRepresentation];
  int v8 = *__error();
  int v9 = 136446978;
  id v10 = "+[_UNImageProvider _imageDataFromIntentsForContentURL:]";
  __int16 v11 = 2114;
  uint64_t v12 = a1;
  __int16 v13 = 2080;
  uint64_t v14 = v7;
  __int16 v15 = 1026;
  int v16 = v8;
  _os_log_error_impl(&dword_22012C000, v6, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to issue sandbox extension for '%s' with error %{public}d", (uint8_t *)&v9, 0x26u);
}

@end