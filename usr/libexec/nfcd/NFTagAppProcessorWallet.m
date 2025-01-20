@interface NFTagAppProcessorWallet
- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6;
@end

@implementation NFTagAppProcessorWallet

- (id)processNDEFMesssage:(id)a3 outputMessage:(id *)a4 tag:(id)a5 stopProcessing:(BOOL *)a6
{
  id v64 = a3;
  id v10 = a5;
  v62 = a6;
  *a6 = 0;
  if (!sub_1001DA6B4()) {
    goto LABEL_28;
  }
  sel = a2;
  v61 = self;
  v63 = v10;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = [v64 records];
  id v11 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (!v11) {
    goto LABEL_27;
  }
  uint64_t v67 = *(void *)v69;
  while (2)
  {
    v12 = 0;
    do
    {
      if (*(void *)v69 != v67) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v68 + 1) + 8 * (void)v12);
      if ([v13 isURIRecord])
      {
        v14 = [v13 decode];
        v15 = +[NSURLComponents componentsWithString:v14];
        v16 = v15;
        if (v15)
        {
          v17 = [v15 scheme];
          v18 = [v17 lowercaseString];
          if ([v18 isEqualToString:@"wallet"])
          {
            v19 = [v16 host];
            v20 = [v19 lowercaseString];
            if ([v20 isEqualToString:@"activate"])
            {
              v65 = [v16 path];
              v21 = [v65 lowercaseString];
              if ([v21 isEqualToString:@"/nfc"])
              {
                v22 = [v16 user];
                if (!v22)
                {
                  v23 = [v16 password];
                  if (!v23)
                  {
                    v24 = [v16 port];
                    if (!v24)
                    {
                      v25 = [v16 fragment];
                      BOOL v26 = v25 == 0;

                      if (v26)
                      {
                        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        uint64_t Logger = NFLogGetLogger();
                        v30 = (void (*)(uint64_t, const char *, ...))Logger;
                        if (Logger)
                        {
                          Class = object_getClass(v61);
                          if (class_isMetaClass(Class)) {
                            uint64_t v32 = 43;
                          }
                          else {
                            uint64_t v32 = 45;
                          }
                          ClassName = object_getClassName(v61);
                          Name = sel_getName(sel);
                          v35 = [v63 tagID];
                          v30(6, "%c[%{public}s %{public}s]:%i Posting Wallet Tag notification with UID : %{public}@", v32, ClassName, Name, 75, v35);
                        }
                        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                        v36 = NFSharedLogGetLogger();
                        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                        {
                          v37 = object_getClass(v61);
                          if (class_isMetaClass(v37)) {
                            int v38 = 43;
                          }
                          else {
                            int v38 = 45;
                          }
                          v39 = object_getClassName(v61);
                          v40 = sel_getName(sel);
                          v41 = [v63 tagID];
                          *(_DWORD *)buf = 67110146;
                          *(_DWORD *)&buf[4] = v38;
                          *(_WORD *)v77 = 2082;
                          *(void *)&v77[2] = v39;
                          *(_WORD *)&v77[10] = 2082;
                          *(void *)&v77[12] = v40;
                          *(_WORD *)&v77[20] = 1024;
                          *(_DWORD *)&v77[22] = 75;
                          *(_WORD *)&v77[26] = 2114;
                          *(void *)&v77[28] = v41;
                          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Posting Wallet Tag notification with UID : %{public}@", buf, 0x2Cu);
                        }
                        v42 = NFSharedSignpostLog();
                        if (os_signpost_enabled(v42))
                        {
                          *(_WORD *)buf = 0;
                          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TagAppProcessed", (const char *)&unk_100286819, buf, 2u);
                        }

                        id v43 = objc_alloc((Class)NSString);
                        v44 = [v63 tagID];
                        v45 = [v44 NF_asHexString];
                        id v46 = [v43 initWithFormat:@"%@?uid=%@", v14, v45];

                        uint64_t v72 = 0;
                        v73 = &v72;
                        uint64_t v74 = 0x2050000000;
                        v47 = (void *)qword_1003475C0;
                        uint64_t v75 = qword_1003475C0;
                        if (!qword_1003475C0)
                        {
                          *(void *)buf = _NSConcreteStackBlock;
                          *(void *)v77 = 3221225472;
                          *(void *)&v77[8] = sub_1001DA7F8;
                          *(void *)&v77[16] = &unk_100301E40;
                          *(void *)&v77[24] = &v72;
                          sub_1001DA7F8(buf);
                          v47 = (void *)v73[3];
                        }
                        v48 = v47;
                        _Block_object_dispose(&v72, 8);
                        id v49 = objc_alloc_init(v48);
                        if (v49)
                        {
                          sub_1001D9B88((uint64_t)v61, v49, v46, 5);
                        }
                        else
                        {
                          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                          v50 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
                          if (v50)
                          {
                            v51 = object_getClass(v61);
                            if (class_isMetaClass(v51)) {
                              uint64_t v52 = 43;
                            }
                            else {
                              uint64_t v52 = 45;
                            }
                            v53 = object_getClassName(v61);
                            v54 = sel_getName(sel);
                            v50(3, "%c[%{public}s %{public}s]:%i Resource error; dropping notification",
                              v52,
                              v53,
                              v54,
                              84);
                          }
                          dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
                          v55 = NFSharedLogGetLogger();
                          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                          {
                            v56 = object_getClass(v61);
                            if (class_isMetaClass(v56)) {
                              int v57 = 43;
                            }
                            else {
                              int v57 = 45;
                            }
                            v58 = object_getClassName(v61);
                            v59 = sel_getName(sel);
                            *(_DWORD *)buf = 67109890;
                            *(_DWORD *)&buf[4] = v57;
                            *(_WORD *)v77 = 2082;
                            *(void *)&v77[2] = v58;
                            *(_WORD *)&v77[10] = 2082;
                            *(void *)&v77[12] = v59;
                            *(_WORD *)&v77[20] = 1024;
                            *(_DWORD *)&v77[22] = 84;
                            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Resource error; dropping notification",
                              buf,
                              0x22u);
                          }
                        }
                        BOOL *v62 = 1;

                        goto LABEL_27;
                      }
                      goto LABEL_21;
                    }

                    v23 = 0;
                  }
                }
              }
            }
          }
        }
LABEL_21:
      }
      v12 = (char *)v12 + 1;
    }
    while (v11 != v12);
    id v27 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
    id v11 = v27;
    if (v27) {
      continue;
    }
    break;
  }
LABEL_27:

  id v10 = v63;
LABEL_28:

  return 0;
}

@end