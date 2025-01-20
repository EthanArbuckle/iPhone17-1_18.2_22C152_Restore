@interface VMVoicemail
+ (id)messageForRecord:(void *)a3 forContexts:(id)a4 andIsoCodes:(id)a5;
@end

@implementation VMVoicemail

+ (id)messageForRecord:(void *)a3 forContexts:(id)a4 andIsoCodes:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)VMMutableVoicemail);
  if (!v9) {
    goto LABEL_41;
  }
  v10 = +[NSDate dateWithTimeIntervalSince1970:(double)(int)VMStoreRecordGetDate((uint64_t)a3)];
  [v9 setDate:v10];

  [v9 setDuration:(double)(int)VMStoreRecordGetDuration((uint64_t)a3)];
  [v9 setFlags:VMStoreRecordGetFlags((uint64_t)a3)];
  [v9 setIdentifier:(int)VMStoreRecordGetIdentifier(a3)];
  [v9 setRemoteUID:VMStoreRecordGetRemoteUID((uint64_t)a3)];
  v11 = (void *)VMStoreRecordCopyCallbackNumber((uint64_t)a3);
  if (v11)
  {
    [v9 setCallbackDestinationID:v11];
    v12 = (void *)PNCopyBestGuessCountryCodeForNumber();
    [v9 setCallbackISOCountryCode:v12];
  }
  v13 = (void *)VMStoreRecordCopySender((uint64_t)a3);
  if (v13)
  {
    [v9 setSenderDestinationID:v13];
    v14 = (void *)PNCopyBestGuessCountryCodeForNumber();
    [v9 setSenderISOCountryCode:v14];
  }
  v60 = v13;
  v15 = VMStoreRecordGetLabel((uint64_t)a3);
  v16 = [v15 UUIDString];

  if (v16) {
    [v9 setReceiverLabelID:v16];
  }
  if (v7)
  {
    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v17 = v7;
    id v18 = [v17 countByEnumeratingWithState:&v63 objects:v67 count:16];
    if (v18)
    {
      id v19 = v18;
      v54 = v11;
      v56 = v8;
      id v58 = v7;
      uint64_t v20 = *(void *)v64;
LABEL_11:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v64 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v63 + 1) + 8 * v21);
        v23 = [v22 labelID];
        unsigned __int8 v24 = [v23 isEqualToString:v16];

        if (v24) {
          break;
        }
        if (v19 == (id)++v21)
        {
          id v19 = [v17 countByEnumeratingWithState:&v63 objects:v67 count:16];
          if (v19) {
            goto LABEL_11;
          }
          id v25 = 0;
          id v8 = v56;
          id v7 = v58;
          v11 = v54;
          goto LABEL_24;
        }
      }
      id v25 = v22;

      if (!v25)
      {
        id v8 = v56;
        id v7 = v58;
        v11 = v54;
        goto LABEL_26;
      }
      v26 = [v25 phoneNumber];

      id v8 = v56;
      id v7 = v58;
      v11 = v54;
      if (!v26) {
        goto LABEL_26;
      }
      v27 = [v25 phoneNumber];
      [v9 setReceiverDestinationID:v27];

      v28 = [v25 uuid];
      id v17 = [v56 objectForKey:v28];

      if (v17)
      {
        [v9 setReceiverISOCountryCode:v17];
      }
      else
      {
        v48 = [v9 receiverDestinationID];
        id v49 = v25;
        v50 = (void *)PNCopyBestGuessCountryCodeForNumber();
        [v9 setReceiverISOCountryCode:v50];

        id v25 = v49;
      }
    }
    else
    {
      id v25 = 0;
    }
LABEL_24:
  }
  else
  {
    id v25 = 0;
  }
LABEL_26:
  v29 = (void *)VMStoreRecordCopyDataPath();
  if (![v29 length])
  {

    id v44 = 0;
    goto LABEL_42;
  }
  v53 = v25;
  v30 = +[NSURL fileURLWithPath:v29 isDirectory:0];
  [v9 setDataURL:v30];

  v31 = (void *)VMStoreRecordCopyTranscriptionPath();
  if ([v31 length])
  {
    v32 = +[NSURL fileURLWithPath:v31 isDirectory:0];
    [v9 setTranscriptionURL:v32];
  }
  v52 = v31;
  v33 = (void *)VMStoreRecordCopySummarizationPath();
  if (![v33 length])
  {
    v42 = vm_vmd_log();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10008039C(v42);
    }
    goto LABEL_40;
  }
  v55 = v11;
  id v57 = v8;
  id v59 = v7;
  v51 = v33;
  v34 = +[NSURL fileURLWithPath:v33 isDirectory:0];
  [v9 setSummarizationMetaDataURL:v34];

  v35 = [v9 summarizationMetaDataURL];
  id v62 = 0;
  v36 = +[NSData dataWithContentsOfURL:v35 options:1 error:&v62];
  v37 = v62;

  if (!v36)
  {
    v41 = [v37 localizedDescription];
    v43 = +[NSString stringWithFormat:@"%@\n", v41];
    v45 = (const char *)[v43 UTF8String];
    fputs(v45, __stderrp);
    v42 = v37;
LABEL_38:

    goto LABEL_39;
  }
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v38, v39, objc_opt_class(), 0);
  v61 = v37;
  v41 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v40 fromData:v36 error:&v61];
  v42 = v61;

  if (v42)
  {
    v43 = vm_vmd_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      sub_1000803E0((uint64_t)v42, v43);
    }
    goto LABEL_38;
  }
LABEL_39:

  id v8 = v57;
  id v7 = v59;
  v11 = v55;
  v33 = v51;
LABEL_40:

  v46 = VMStoreRecordGetUUID((uint64_t)a3);
  [v9 setUuid:v46];

LABEL_41:
  id v44 = v9;
LABEL_42:

  return v44;
}

@end