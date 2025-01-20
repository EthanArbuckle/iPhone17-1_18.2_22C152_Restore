@interface CRLSEImportItemFactory
- (BOOL)p_file:(id)a3 conformsTo:(id)a4;
- (BOOL)p_stringIsConsideredEmpty:(id)a3;
- (BOOL)p_urlIsValidImage:(id)a3;
- (CRLSEImportItemFactory)init;
- (NSString)defaultImageFileName;
- (id)p_makeEmptyStringCharacterSet;
- (void)createImportItems:(id)a3 skipTextAttachments:(BOOL)a4 completion:(id)a5;
- (void)p_logItemProviderError:(id)a3 error:(id)a4;
- (void)setDefaultImageFileName:(id)a3;
@end

@implementation CRLSEImportItemFactory

- (CRLSEImportItemFactory)init
{
  v7.receiver = self;
  v7.super_class = (Class)CRLSEImportItemFactory;
  v2 = [(CRLSEImportItemFactory *)&v7 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(CRLSEImportItemFactory *)v2 p_makeEmptyStringCharacterSet];
    emptyStringCharacterSet = v3->_emptyStringCharacterSet;
    v3->_emptyStringCharacterSet = (NSCharacterSet *)v4;
  }
  return v3;
}

- (void)createImportItems:(id)a3 skipTextAttachments:(BOOL)a4 completion:(id)a5
{
  id v6 = a3;
  id v38 = a5;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = dispatch_group_create();
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v64;
    v12 = UTTypeURL;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v64 != v11) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v63 + 1) + 8 * (void)v13);
        if (CRLSharingExtensionCat_init_token != -1) {
          dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100071A30);
        }
        v15 = CRLSharingExtensionCat_log_t;
        if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_DEBUG)) {
          sub_10005B198(v67, v15, v14, &v68);
        }
        v16 = [(UTType *)v12 identifier];
        unsigned int v17 = [v14 hasItemConformingToTypeIdentifier:v16];

        if (v17)
        {
          dispatch_group_enter(v8);
          v18 = [(UTType *)v12 identifier];
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = sub_10000B950;
          v60[3] = &unk_100071A58;
          v60[4] = self;
          id v61 = v7;
          v62 = v8;
          [v14 loadItemForTypeIdentifier:v18 options:0 completionHandler:v60];

          v19 = v61;
LABEL_12:

          goto LABEL_21;
        }
        v20 = [UTTypePlainText identifier];
        unsigned int v21 = [v14 hasItemConformingToTypeIdentifier:v20];

        if (v21)
        {
          if (!a4)
          {
            dispatch_group_enter(v8);
            v22 = [UTTypePlainText identifier];
            v57[0] = _NSConcreteStackBlock;
            v57[1] = 3221225472;
            v57[2] = sub_10000B9E8;
            v57[3] = &unk_100071A80;
            v57[4] = self;
            id v58 = v7;
            v59 = v8;
            [v14 loadItemForTypeIdentifier:v22 options:0 completionHandler:v57];

            v19 = v58;
            goto LABEL_12;
          }
        }
        else
        {
          v23 = [UTTypeRAWImage identifier];
          unsigned int v24 = [v14 hasItemConformingToTypeIdentifier:v23];

          if (v24)
          {
            dispatch_group_enter(v8);
            v25 = [UTTypeRAWImage identifier];
            v54[0] = _NSConcreteStackBlock;
            v54[1] = 3221225472;
            v54[2] = sub_10000BACC;
            v54[3] = &unk_100071AE8;
            v54[4] = self;
            v54[5] = v14;
            id v55 = v7;
            v56 = v8;
            [v14 loadItemForTypeIdentifier:v25 options:0 completionHandler:v54];

            v26 = v55;
LABEL_20:

            v12 = UTTypeURL;
            goto LABEL_21;
          }
          v27 = [UTTypeImage identifier];
          unsigned int v28 = [v14 hasItemConformingToTypeIdentifier:v27];

          if (v28)
          {
            dispatch_group_enter(v8);
            v51[0] = _NSConcreteStackBlock;
            v51[1] = 3221225472;
            v51[2] = sub_10000BFE0;
            v51[3] = &unk_100071BC0;
            v51[4] = self;
            v51[5] = v14;
            id v52 = v7;
            v53 = v8;
            id v29 = [v14 loadFileRepresentationForContentType:UTTypeImage openInPlace:0 completionHandler:v51];

            v26 = v52;
            goto LABEL_20;
          }
          v12 = UTTypeURL;
          if (([v14 hasItemConformingToTypeIdentifier:@"com.apple.mapkit.map-item"] & 1) == 0)
          {
            v30 = [UTTypePDF identifier];
            unsigned int v31 = [v14 hasItemConformingToTypeIdentifier:v30];

            dispatch_group_enter(v8);
            if (v31)
            {
              v32 = [UTTypePDF identifier];
              v48[0] = _NSConcreteStackBlock;
              v48[1] = 3221225472;
              v48[2] = sub_10000C730;
              v48[3] = &unk_100071AE8;
              v48[4] = self;
              v48[5] = v14;
              id v49 = v7;
              v50 = v8;
              [v14 loadItemForTypeIdentifier:v32 options:0 completionHandler:v48];

              v19 = v49;
            }
            else
            {
              v33 = [UTTypeData identifier];
              v45[0] = _NSConcreteStackBlock;
              v45[1] = 3221225472;
              v45[2] = sub_10000CACC;
              v45[3] = &unk_100071C48;
              v45[4] = self;
              v45[5] = v14;
              id v46 = v7;
              v47 = v8;
              [v14 loadItemForTypeIdentifier:v33 options:0 completionHandler:v45];

              v19 = v46;
            }
            goto LABEL_12;
          }
        }
LABEL_21:
        v13 = (char *)v13 + 1;
      }
      while (v10 != v13);
      id v34 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
      id v10 = v34;
    }
    while (v34);
  }

  v35 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CC14;
  block[3] = &unk_100071C70;
  id v43 = v7;
  id v44 = v38;
  id v36 = v7;
  id v37 = v38;
  dispatch_group_notify(v8, v35, block);
}

- (void)p_logItemProviderError:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (CRLSharingExtensionCat_init_token != -1) {
    dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100071C90);
  }
  id v7 = CRLSharingExtensionCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_ERROR)) {
    sub_10005B5DC(v7, v5, v6);
  }
}

- (BOOL)p_urlIsValidImage:(id)a3
{
  CFStringRef v8 = kCGImageSourceShouldCache;
  id v9 = &__kCFBooleanFalse;
  CFURLRef v3 = (const __CFURL *)a3;
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v5 = CGImageSourceCreateWithURL(v3, v4);

  size_t Count = CGImageSourceGetCount(v5);
  if (v5) {
    CFRelease(v5);
  }

  return Count != 0;
}

- (id)p_makeEmptyStringCharacterSet
{
  __int16 v7 = -4;
  v2 = +[NSString stringWithCharacters:&v7 length:1];
  CFURLRef v3 = +[NSMutableCharacterSet characterSetWithCharactersInString:v2];
  CFDictionaryRef v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  [v3 formUnionWithCharacterSet:v4];

  id v5 = [v3 copy];

  return v5;
}

- (BOOL)p_stringIsConsideredEmpty:(id)a3
{
  CFURLRef v3 = [a3 stringByTrimmingCharactersInSet:self->_emptyStringCharacterSet];
  BOOL v4 = [v3 length] == 0;

  return v4;
}

- (BOOL)p_file:(id)a3 conformsTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isFileURL])
  {
    id v13 = 0;
    id v12 = 0;
    [v5 getResourceValue:&v13 forKey:NSURLContentTypeKey error:&v12];
    id v7 = v13;
    id v8 = v12;
    if (v7)
    {
      unsigned __int8 v9 = [v7 conformsToType:v6];
    }
    else
    {
      if (CRLSharingExtensionCat_init_token != -1) {
        dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100071CB0);
      }
      id v10 = CRLSharingExtensionCat_log_t;
      if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10005B6B0((uint64_t)v5, v10, v8);
      }
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (NSString)defaultImageFileName
{
  return self->_defaultImageFileName;
}

- (void)setDefaultImageFileName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultImageFileName, 0);

  objc_storeStrong((id *)&self->_emptyStringCharacterSet, 0);
}

@end