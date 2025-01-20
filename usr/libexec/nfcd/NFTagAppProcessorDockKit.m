@interface NFTagAppProcessorDockKit
- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6;
@end

@implementation NFTagAppProcessorDockKit

- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6
{
  id v7 = a3;
  v40 = a6;
  *a6 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v42 = v7;
  v8 = [v7 records];
  id v9 = [v8 countByEnumeratingWithState:&v43 objects:v61 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v44;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v44 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if ([v13 isURIRecord])
        {
          v14 = [v13 decode];
          v15 = +[NSURLComponents componentsWithString:v14];
          v16 = v15;
          if (v15)
          {
            v17 = [v15 scheme];
            v18 = [v17 lowercaseString];
            unsigned int v19 = [v18 isEqualToString:@"x-dk"];

            if (v19)
            {
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              uint64_t Logger = NFLogGetLogger();
              if (Logger)
              {
                v21 = (void (*)(uint64_t, const char *, ...))Logger;
                Class = object_getClass(self);
                BOOL isMetaClass = class_isMetaClass(Class);
                ClassName = object_getClassName(self);
                Name = sel_getName(a2);
                v26 = [v16 string];
                uint64_t v27 = 45;
                if (isMetaClass) {
                  uint64_t v27 = 43;
                }
                v21(6, "%c[%{public}s %{public}s]:%i Found DockKit notification with URL: %@, Orig msg: %@", v27, ClassName, Name, 51, v26, v42);
              }
              dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
              v28 = NFSharedLogGetLogger();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v29 = object_getClass(self);
                if (class_isMetaClass(v29)) {
                  int v30 = 43;
                }
                else {
                  int v30 = 45;
                }
                v31 = object_getClassName(self);
                v32 = sel_getName(a2);
                v33 = [v16 string];
                *(_DWORD *)buf = 67110402;
                int v50 = v30;
                __int16 v51 = 2082;
                v52 = v31;
                __int16 v53 = 2082;
                v54 = v32;
                __int16 v55 = 1024;
                int v56 = 51;
                __int16 v57 = 2112;
                v58 = v33;
                __int16 v59 = 2112;
                id v60 = v42;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Found DockKit notification with URL: %@, Orig msg: %@", buf, 0x36u);
              }
              v34 = NFSharedSignpostLog();
              if (os_signpost_enabled(v34))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TagAppProcessed", (const char *)&unk_100286819, buf, 2u);
              }

              eventPublisher = self->_eventPublisher;
              CFStringRef v47 = @"url";
              v36 = [v16 string];
              v48 = v36;
              v37 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
              [(NFXPCEventPublisher *)eventPublisher sendXpcNotificationEventWithDictionary:v37];

              BOOL *v40 = 1;
              goto LABEL_25;
            }
          }
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v43 objects:v61 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_25:

  return 0;
}

- (void).cxx_destruct
{
}

@end