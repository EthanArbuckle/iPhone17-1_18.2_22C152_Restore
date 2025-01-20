@interface UNSImageProvider
+ (id)_contactForImageRenderingFromContentURLWithContext:(id)a3 bundleIdentifier:(id)a4;
+ (id)_contactsForImageRenderingFromRecipientsWithContext:(id)a3 bundleIdentifier:(id)a4 descriptorForRequiredKeys:(id)a5;
+ (id)_imageDataFromFileSystemForContactURL:(id)a3;
+ (id)_imageDataFromIntentsForContentURL:(id)a3;
+ (id)generateEphemeralContactsForImageRenderingWithContext:(id)a3 bundleIdentifier:(id)a4 descriptorForRequiredKeys:(id)a5;
+ (id)imageDataForContentURL:(id)a3;
@end

@implementation UNSImageProvider

+ (id)imageDataForContentURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v12 = UNSLogImageProvider();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136446210;
      v15 = "+[UNSImageProvider imageDataForContentURL:]";
      _os_log_impl(&dword_260AF7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:nil", (uint8_t *)&v14, 0xCu);
    }
    v7 = 0;
    goto LABEL_19;
  }
  int v6 = [v4 isFileURL];
  if (!v6) {
    goto LABEL_13;
  }
  v7 = [a1 _imageDataFromFileSystemForContactURL:v5];
  v8 = UNSLogImageProvider();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136446722;
    v15 = "+[UNSImageProvider imageDataForContentURL:]";
    __int16 v16 = 2114;
    v17 = v5;
    __int16 v18 = 1026;
    LODWORD(v19) = v7 != 0;
    _os_log_impl(&dword_260AF7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from file system FIRST. Success:%{public}d", (uint8_t *)&v14, 0x1Cu);
  }

  if (!v7)
  {
LABEL_13:
    v7 = [a1 _imageDataFromIntentsForContentURL:v5];
    v9 = UNSLogImageProvider();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = @"FIRST";
      int v14 = 136446978;
      v15 = "+[UNSImageProvider imageDataForContentURL:]";
      if (v6) {
        v10 = @"SECOND";
      }
      __int16 v16 = 2114;
      v17 = v5;
      __int16 v18 = 2114;
      v19 = v10;
      __int16 v20 = 1026;
      BOOL v21 = v7 != 0;
      _os_log_impl(&dword_260AF7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from intents %{public}@. Success:%{public}d", (uint8_t *)&v14, 0x26u);
    }

    char v11 = v7 ? 1 : v6;
    if ((v11 & 1) == 0)
    {
      v7 = [a1 _imageDataFromFileSystemForContactURL:v5];
      v12 = UNSLogImageProvider();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136446722;
        v15 = "+[UNSImageProvider imageDataForContentURL:]";
        __int16 v16 = 2114;
        v17 = v5;
        __int16 v18 = 1026;
        LODWORD(v19) = v7 != 0;
        _os_log_impl(&dword_260AF7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Trying to fetch from file system SECOND. Success:%{public}d", (uint8_t *)&v14, 0x1Cu);
      }
LABEL_19:
    }
  }

  return v7;
}

+ (id)generateEphemeralContactsForImageRenderingWithContext:(id)a3 bundleIdentifier:(id)a4 descriptorForRequiredKeys:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = UNSLogImageProvider();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 identifier];
    v13 = objc_msgSend(v12, "un_logDigest");
    *(_DWORD *)buf = 138543874;
    id v30 = v9;
    __int16 v31 = 2082;
    v32 = "+[UNSImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
    __int16 v33 = 2114;
    v34 = v13;
    _os_log_impl(&dword_260AF7000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Start getting contacts", buf, 0x20u);
  }
  if (!v8)
  {
    v19 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_15;
  }
  int v14 = [a1 _contactForImageRenderingFromContentURLWithContext:v8 bundleIdentifier:v9];
  if (v14)
  {
    v15 = UNSLogImageProvider();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [v8 identifier];
      v17 = objc_msgSend(v16, "un_logDigest");
      *(_DWORD *)buf = 138543874;
      id v30 = v9;
      __int16 v31 = 2082;
      v32 = "+[UNSImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
      __int16 v33 = 2114;
      v34 = v17;
      _os_log_impl(&dword_260AF7000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Contact created from content URL", buf, 0x20u);
    }
    v28 = v14;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
  }
  else
  {
    int v20 = objc_msgSend(v9, "un_isFirstPartyIdentifier");
    BOOL v21 = UNSLogImageProvider();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (!v20)
    {
      if (v22)
      {
        v26 = [v8 identifier];
        v27 = objc_msgSend(v26, "un_logDigest");
        *(_DWORD *)buf = 138543874;
        id v30 = v9;
        __int16 v31 = 2082;
        v32 = "+[UNSImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
        __int16 v33 = 2114;
        v34 = v27;
        _os_log_impl(&dword_260AF7000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ No contact created because no data found content URL provided", buf, 0x20u);
      }
      v19 = (void *)MEMORY[0x263EFFA68];
      goto LABEL_14;
    }
    if (v22)
    {
      v23 = [v8 identifier];
      v24 = objc_msgSend(v23, "un_logDigest");
      *(_DWORD *)buf = 138543874;
      id v30 = v9;
      __int16 v31 = 2082;
      v32 = "+[UNSImageProvider generateEphemeralContactsForImageRenderingWithContext:bundleIdentifier:descriptorForRequiredKeys:]";
      __int16 v33 = 2114;
      v34 = v24;
      _os_log_impl(&dword_260AF7000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Contacts created from recipients for snowglobe (1st party only)", buf, 0x20u);
    }
    uint64_t v18 = [a1 _contactsForImageRenderingFromRecipientsWithContext:v8 bundleIdentifier:v9 descriptorForRequiredKeys:v10];
  }
  v19 = (void *)v18;
LABEL_14:

LABEL_15:

  return v19;
}

+ (id)_imageDataFromIntentsForContentURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF910] now];
  v5 = UNSLogImageProvider();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v25 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
    __int16 v26 = 2114;
    id v27 = v3;
    _os_log_impl(&dword_260AF7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Starting Read", buf, 0x16u);
  }

  int v6 = [MEMORY[0x263F0FB88] imageWithURL:v3];
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 _imageData];
    if (v8)
    {
LABEL_20:
      uint64_t v18 = [MEMORY[0x263EFF910] now];
      [v18 timeIntervalSinceDate:v4];
      uint64_t v20 = v19;
      BOOL v21 = UNSLogImageProvider();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446978;
        v25 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
        __int16 v26 = 2114;
        id v27 = v3;
        __int16 v28 = 1026;
        *(_DWORD *)v29 = v8 != 0;
        *(_WORD *)&v29[4] = 2050;
        *(void *)&v29[6] = v20;
        _os_log_impl(&dword_260AF7000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Ending Read. Success:%{public}d. Finished in:%{public}f milliseconds", buf, 0x26u);
      }

      goto LABEL_23;
    }
    id v9 = [v7 _uri];
    if ([v9 isFileURL])
    {
      id v10 = v9;
      [v10 fileSystemRepresentation];
      char v11 = (const char *)sandbox_extension_issue_file();
      if (!v11)
      {
        v15 = UNSLogImageProvider();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          +[UNSImageProvider _imageDataFromIntentsForContentURL:v15];
        }
        id v8 = 0;
        goto LABEL_19;
      }
      v12 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v11 length:strlen(v11) + 1 freeWhenDone:1];
      [v7 _setSandboxExtensionData:v12];
    }
    v13 = [MEMORY[0x263F0FB98] sharedConnection];
    id v23 = 0;
    int v14 = objc_msgSend(v13, "loadDataImageFromImage:scaledSize:error:", v7, &v23, *MEMORY[0x263F0F760], *(double *)(MEMORY[0x263F0F760] + 8));
    v15 = v23;

    if (!v14 || v15)
    {
      __int16 v16 = UNSLogImageProvider();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446978;
        v25 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
        __int16 v26 = 2114;
        id v27 = v3;
        __int16 v28 = 2114;
        *(void *)v29 = v7;
        *(_WORD *)&v29[8] = 2114;
        *(void *)&v29[10] = v15;
        _os_log_error_impl(&dword_260AF7000, v16, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to fetch icon data from INImage %{public}@ with error %{public}@", buf, 0x2Au);
      }
      id v8 = 0;
    }
    else
    {
      id v8 = [v14 _imageData];
      __int16 v16 = UNSLogImageProvider();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [v7 _identifier];
        *(_DWORD *)buf = 136446722;
        v25 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
        __int16 v26 = 2114;
        id v27 = v3;
        __int16 v28 = 2114;
        *(void *)v29 = v17;
        _os_log_impl(&dword_260AF7000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Successfully fetched identity image with identifier '%{public}@'", buf, 0x20u);
      }
    }

LABEL_19:
    goto LABEL_20;
  }
  uint64_t v18 = UNSLogImageProvider();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    +[UNSImageProvider _imageDataFromIntentsForContentURL:]((uint64_t)v3, v18);
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
  v5 = UNSLogImageProvider();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v16 = "+[UNSImageProvider _imageDataFromFileSystemForContactURL:]";
    __int16 v17 = 2114;
    id v18 = v3;
    _os_log_impl(&dword_260AF7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Starting Read", buf, 0x16u);
  }

  id v14 = 0;
  int v6 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3 options:1 error:&v14];
  id v7 = v14;
  if (v7)
  {
    id v8 = UNSLogImageProvider();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      __int16 v16 = "+[UNSImageProvider _imageDataFromFileSystemForContactURL:]";
      __int16 v17 = 2114;
      id v18 = v3;
      __int16 v19 = 2114;
      v20[0] = v7;
      _os_log_impl(&dword_260AF7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Error reading image data %{public}@", buf, 0x20u);
    }
  }
  id v9 = [MEMORY[0x263EFF910] now];
  [v9 timeIntervalSinceDate:v4];
  uint64_t v11 = v10;
  v12 = UNSLogImageProvider();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    __int16 v16 = "+[UNSImageProvider _imageDataFromFileSystemForContactURL:]";
    __int16 v17 = 2114;
    id v18 = v3;
    __int16 v19 = 1026;
    LODWORD(v20[0]) = v6 != 0;
    WORD2(v20[0]) = 2050;
    *(void *)((char *)v20 + 6) = v11;
    _os_log_impl(&dword_260AF7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: contentURL:%{public}@ Ending Read. Success:%{public}d. Finished in:%{public}f milliseconds", buf, 0x26u);
  }

  return v6;
}

+ (id)_contactForImageRenderingFromContentURLWithContext:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = UNSLogImageProvider();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 identifier];
    uint64_t v10 = objc_msgSend(v9, "un_logDigest");
    uint64_t v11 = [v6 contentURL];
    v12 = [v6 contentURL];
    int v18 = 138544386;
    id v19 = v7;
    __int16 v20 = 2082;
    BOOL v21 = "+[UNSImageProvider _contactForImageRenderingFromContentURLWithContext:bundleIdentifier:]";
    __int16 v22 = 2114;
    id v23 = v10;
    __int16 v24 = 1026;
    BOOL v25 = v11 != 0;
    __int16 v26 = 2114;
    id v27 = v12;
    _os_log_impl(&dword_260AF7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}s: Context identifier:%{public}@ Will attempt to get image data:%{public}d withURL:%{public}@", (uint8_t *)&v18, 0x30u);
  }
  v13 = [v6 contentURL];
  if (!v13)
  {
    id v14 = 0;
    goto LABEL_7;
  }
  id v14 = [a1 imageDataForContentURL:v13];
  if (!v14)
  {
LABEL_7:
    id v15 = 0;
    goto LABEL_8;
  }
  id v15 = objc_alloc_init(MEMORY[0x263EFEAF0]);
  [v15 setImageData:v14];
LABEL_8:
  id v16 = v15;

  return v16;
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
    BOOL v25 = v11;
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
        id v15 = +[UNSNotificationContactService sharedInstance];
        id v32 = v9;
        id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
        id v17 = [v15 curatedContactForContact:v13 bundleIdentifier:v8 keysToFetch:v16];

        if (!v17)
        {
LABEL_8:
          int v18 = [v13 displayName];
          unint64_t v19 = [v18 rangeOfString:@" "];
          id v17 = objc_alloc_init(MEMORY[0x263EFEAF0]);
          BOOL v20 = (unint64_t)[v18 length] < 3 || v19 == 0;
          if (v20 || v19 >= [v18 length] - 1)
          {
            [v17 setGivenName:v18];
          }
          else
          {
            BOOL v21 = objc_msgSend(v18, "substringWithRange:", 0, v19);
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

+ (void)_imageDataFromIntentsForContentURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  id v3 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_260AF7000, a2, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to create an INIntent from url. Cannot proceed with loading data from INImageServiceConnection.", (uint8_t *)&v2, 0x16u);
}

+ (void)_imageDataFromIntentsForContentURL:(NSObject *)a3 .cold.2(uint64_t a1, id a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 fileSystemRepresentation];
  int v6 = *__error();
  int v7 = 136446978;
  id v8 = "+[UNSImageProvider _imageDataFromIntentsForContentURL:]";
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  __int16 v11 = 2080;
  uint64_t v12 = v5;
  __int16 v13 = 1026;
  int v14 = v6;
  _os_log_error_impl(&dword_260AF7000, a3, OS_LOG_TYPE_ERROR, "%{public}s: contentURL:%{public}@ Failed to issue sandbox extension for '%s' with error %{public}d", (uint8_t *)&v7, 0x26u);
}

@end