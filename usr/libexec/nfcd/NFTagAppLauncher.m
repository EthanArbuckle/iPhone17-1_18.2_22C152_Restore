@interface NFTagAppLauncher
- (NFTagAppLauncher)init;
- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6;
@end

@implementation NFTagAppLauncher

- (NFTagAppLauncher)init
{
  v6.receiver = self;
  v6.super_class = (Class)NFTagAppLauncher;
  v2 = [(NFTagAppLauncher *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithObjects:v2];
    tagApps = v2->_tagApps;
    v2->_tagApps = v3;
  }
  return v2;
}

- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6
{
  id v10 = a3;
  *a6 = 0;
  *a4 = 0;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v11 = [v10 records];
  id v12 = [v11 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v12)
  {
    id v13 = v12;
    v38 = self;
    uint64_t v14 = *(void *)v40;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v40 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if ([v16 isURIRecord])
        {
          v17 = [v16 decode];
          uint64_t v18 = +[NSURLComponents componentsWithString:v17];
          if (v18)
          {
            v20 = (void *)v18;
            sel = a2;
            id v21 = v10;
            *a4 = v21;
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            uint64_t Logger = NFLogGetLogger();
            if (Logger)
            {
              v23 = (void (*)(uint64_t, const char *, ...))Logger;
              Class = object_getClass(v38);
              BOOL isMetaClass = class_isMetaClass(Class);
              ClassName = object_getClassName(v38);
              Name = sel_getName(sel);
              v28 = [v20 URL];
              uint64_t v29 = 45;
              if (isMetaClass) {
                uint64_t v29 = 43;
              }
              v23(6, "%c[%{public}s %{public}s]:%i Found App URL: %@, Orig msg: %@", v29, ClassName, Name, 75, v28, v21);
            }
            dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
            v30 = NFSharedLogGetLogger();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = object_getClass(v38);
              if (class_isMetaClass(v31)) {
                int v32 = 43;
              }
              else {
                int v32 = 45;
              }
              v33 = object_getClassName(v38);
              v34 = sel_getName(sel);
              v35 = [v20 URL];
              *(_DWORD *)buf = 67110402;
              int v44 = v32;
              __int16 v45 = 2082;
              v46 = v33;
              __int16 v47 = 2082;
              v48 = v34;
              __int16 v49 = 1024;
              int v50 = 75;
              __int16 v51 = 2112;
              v52 = v35;
              __int16 v53 = 2112;
              id v54 = v21;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found App URL: %@, Orig msg: %@", buf, 0x36u);
            }
            v19 = [v20 URL];

            goto LABEL_22;
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v39 objects:v55 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  v19 = 0;
LABEL_22:

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barcodeParser, 0);

  objc_storeStrong((id *)&self->_tagApps, 0);
}

@end