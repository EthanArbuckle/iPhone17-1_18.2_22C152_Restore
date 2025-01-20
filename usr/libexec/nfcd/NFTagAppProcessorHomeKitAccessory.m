@interface NFTagAppProcessorHomeKitAccessory
- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6;
@end

@implementation NFTagAppProcessorHomeKitAccessory

- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6
{
  id v8 = a5;
  v44 = a6;
  *a6 = 0;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v9 = [a3 records];
  id v10 = [v9 countByEnumeratingWithState:&v52 objects:v69 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v53;
    v13 = &AMFDRSealingMapCopyLocalData_ptr;
    uint64_t v41 = *(void *)v53;
    v42 = v8;
    v45 = v9;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        if ([v15 isURIRecord])
        {
          v47 = [v15 decode];
          v16 = [v13[469] componentsWithString:];
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          id v17 = [&off_100322838 countByEnumeratingWithState:&v48 objects:v68 count:16];
          if (v17)
          {
            id v18 = v17;
            uint64_t v19 = *(void *)v49;
            while (2)
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(void *)v49 != v19) {
                  objc_enumerationMutation(&off_100322838);
                }
                if (v16)
                {
                  uint64_t v21 = *(void *)(*((void *)&v48 + 1) + 8 * (void)j);
                  v22 = [v16 scheme];
                  v23 = [v22 lowercaseString];
                  LODWORD(v21) = [v23 isEqualToString:v21];

                  if (v21)
                  {
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    uint64_t Logger = NFLogGetLogger();
                    id v8 = v42;
                    if (Logger)
                    {
                      v25 = (void (*)(uint64_t, const char *, ...))Logger;
                      Class = object_getClass(self);
                      BOOL isMetaClass = class_isMetaClass(Class);
                      ClassName = object_getClassName(self);
                      Name = sel_getName(a2);
                      v30 = [v42 tagID];
                      uint64_t v31 = 45;
                      if (isMetaClass) {
                        uint64_t v31 = 43;
                      }
                      v25(6, "%c[%{public}s %{public}s]:%i Posting HomeKit Tag notification with UID : %@ for urlText = %@", v31, ClassName, Name, 55, v30, v47);
                    }
                    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                    v32 = NFSharedLogGetLogger();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                    {
                      v33 = object_getClass(self);
                      if (class_isMetaClass(v33)) {
                        int v34 = 43;
                      }
                      else {
                        int v34 = 45;
                      }
                      v35 = object_getClassName(self);
                      v36 = sel_getName(a2);
                      v37 = [v42 tagID];
                      *(_DWORD *)buf = 67110402;
                      int v57 = v34;
                      __int16 v58 = 2082;
                      v59 = v35;
                      __int16 v60 = 2082;
                      v61 = v36;
                      __int16 v62 = 1024;
                      int v63 = 55;
                      __int16 v64 = 2112;
                      v65 = v37;
                      __int16 v66 = 2112;
                      v67 = v47;
                      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Posting HomeKit Tag notification with UID : %@ for urlText = %@", buf, 0x36u);
                    }
                    v38 = NFSharedSignpostLog();
                    if (os_signpost_enabled(v38))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TagAppProcessed", (const char *)&unk_100286819, buf, 2u);
                    }

                    v39 = +[NSDistributedNotificationCenter defaultCenter];
                    [v39 postNotificationName:@"com.apple.nfcd.homekit.proxcard" object:v47 userInfo:0 options:3];

                    [(NFXPCEventPublisher *)self->_eventPublisher sendXpcNotificationEventWithString:v47];
                    BOOL *v44 = 1;

                    v9 = v45;
                    goto LABEL_32;
                  }
                }
              }
              id v18 = [&off_100322838 countByEnumeratingWithState:&v48 objects:v68 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          v9 = v45;
          uint64_t v12 = v41;
          v13 = &AMFDRSealingMapCopyLocalData_ptr;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v52 objects:v69 count:16];
      id v8 = v42;
    }
    while (v11);
  }
LABEL_32:

  return 0;
}

- (void).cxx_destruct
{
}

@end