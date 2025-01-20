@interface CKKSItemEncrypter
+ (id)decryptDictionary:(id)a3 key:(id)a4 authenticatedData:(id)a5 error:(id *)a6;
+ (id)decryptItemToDictionary:(id)a3 keyCache:(id)a4 error:(id *)a5;
+ (id)decryptItemToDictionaryVersion1or2:(id)a3 keyCache:(id)a4 error:(id *)a5;
+ (id)decryptItemToDictionaryVersionNone:(id)a3 error:(id *)a4;
+ (id)encryptCKKSItem:(id)a3 dataDictionary:(id)a4 updatingCKKSItem:(id)a5 parentkey:(id)a6 keyCache:(id)a7 error:(id *)a8;
+ (id)encryptDictionary:(id)a3 key:(id)a4 authenticatedData:(id)a5 error:(id *)a6;
+ (id)padData:(id)a3 blockSize:(unint64_t)a4 additionalBlock:(BOOL)a5;
+ (id)removePaddingFromData:(id)a3;
@end

@implementation CKKSItemEncrypter

+ (id)decryptDictionary:(id)a3 key:(id)a4 authenticatedData:(id)a5 error:(id *)a6
{
  v7 = [a4 decryptData:a3 authenticatedData:a5 error:a6];
  if (v7)
  {
    v8 = +[CKKSItemEncrypter removePaddingFromData:v7];

    if (v8)
    {
      v7 = +[NSPropertyListSerialization propertyListWithData:v8 options:512 format:0 error:a6];
LABEL_6:

      goto LABEL_7;
    }
    if (a6)
    {
      NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
      CFStringRef v11 = @"Could not remove padding from decrypted item: malformed data";
      v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
      +[NSError errorWithDomain:@"securityd" code:-67673 userInfo:v8];
      v7 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    v7 = 0;
  }
LABEL_7:

  return v7;
}

+ (id)encryptDictionary:(id)a3 key:(id)a4 authenticatedData:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:200 options:0 error:a6];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [v9 objectForKeyedSubscript:@"v_Data"];
    v15 = +[CKKSItemEncrypter padData:blockSize:additionalBlock:](CKKSItemEncrypter, "padData:blockSize:additionalBlock:", v13, 20, (unint64_t)[v14 length] < 0x14);

    v16 = [v10 encryptData:v15 authenticatedData:v11 error:a6];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)decryptItemToDictionary:(id)a3 keyCache:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 encver];
  if (v9 == (id)2 || v9 == (id)1)
  {
    id v10 = +[CKKSItemEncrypter decryptItemToDictionaryVersion1or2:v7 keyCache:v8 error:a5];
  }
  else
  {
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    id v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Unrecognized encryption version: %lu", [v7 encver]);
    v21 = v11;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    v13 = +[NSError errorWithDomain:@"securityd" code:1 userInfo:v12];

    v14 = [v7 zoneID];
    v15 = [v14 zoneName];
    v16 = sub_1000CD884(@"item", v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "decryptItemToDictionary failed: %@", buf, 0xCu);
    }

    if (a5) {
      *a5 = v13;
    }

    id v10 = 0;
  }

  return v10;
}

+ (id)decryptItemToDictionaryVersion1or2:(id)a3 keyCache:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 parentKeyUUID];
  id v11 = [v8 contextID];
  uint64_t v12 = [v8 zoneID];
  if (v9) {
    [v9 loadKeyForUUID:v10 contextID:v11 zoneID:v12 error:a5];
  }
  else {
  v13 = +[CKKSKey loadKeyWithUUID:v10 contextID:v11 zoneID:v12 error:a5];
  }

  if (v13
    && ([v8 wrappedkey],
        v14 = objc_claimAutoreleasedReturnValue(),
        [v13 unwrapAESKey:v14 error:a5],
        v15 = objc_claimAutoreleasedReturnValue(),
        v14,
        v15))
  {
    v16 = [v8 makeAuthenticatedDataDictionaryUpdatingCKKSItem:v8 encryptionVersion:[v8 encver]];
    v17 = [v8 encitem];
    v18 = [a1 decryptDictionary:v17 key:v15 authenticatedData:v16 error:a5];

    if (!v18)
    {
      v19 = [v8 zoneID];
      NSErrorUserInfoKey v20 = [v19 zoneName];
      v21 = sub_1000CD884(@"item", v20);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        id v22 = *a5;
        int v24 = 138412290;
        id v25 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "ckks: couldn't decrypt item %@", (uint8_t *)&v24, 0xCu);
      }
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)decryptItemToDictionaryVersionNone:(id)a3 error:(id *)a4
{
  v5 = [a3 encitem];
  v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:512 format:0 error:a4];

  return v6;
}

+ (id)encryptCKKSItem:(id)a3 dataDictionary:(id)a4 updatingCKKSItem:(id)a5 parentkey:(id)a6 keyCache:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v15) {
    goto LABEL_4;
  }
  v18 = +[CKKSItemEncrypter decryptItemToDictionary:v15 keyCache:v17 error:a8];
  id v19 = [v18 mutableCopy];

  if (v19)
  {
    [v19 addEntriesFromDictionary:v14];

    id v14 = v19;
LABEL_4:
    NSErrorUserInfoKey v20 = [v16 getKeychainBackedKey:a8];
    if (v20
      && (+[CKKSKeychainBackedKey randomKeyWrappedByParent:v20 error:a8], (uint64_t v21 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v22 = (void *)v21;
      id v44 = v13;
      id v23 = [[CKKSItem alloc] initCopyingCKKSItem:v13];
      id v43 = v16;
      int v24 = [v16 uuid];
      [v23 setParentKeyUUID:v24];

      id v25 = [v22 wrappedkey];
      [v23 setWrappedkey:v25];

      if (v15) {
        [v15 encver];
      }
      [v23 setEncver:2];
      v26 = [v15 storedCKRecord];

      if (v26)
      {
        v41 = [v15 storedCKRecord];
        v27 = [v15 storedCKRecord];
        [v27 recordID];
        v28 = id v42 = v17;
        v29 = [v28 zoneID];
        v30 = [v23 updateCKRecord:v41 zoneID:v29];
        [v23 setStoredCKRecord:v30];

        id v17 = v42;
      }
      v31 = [v23 makeAuthenticatedDataDictionaryUpdatingCKKSItem:v15 encryptionVersion:[v23 encver]];
      v32 = [v22 aessivkey];
      v33 = +[CKKSItemEncrypter encryptDictionary:v14 key:v32 authenticatedData:v31 error:a8];
      [v23 setEncitem:v33];

      v34 = [v23 encitem];

      if (v34) {
        id v35 = v23;
      }
      else {
        id v35 = 0;
      }

      id v16 = v43;
      id v13 = v44;
    }
    else
    {
      id v35 = 0;
    }

    goto LABEL_22;
  }
  v36 = [v15 zoneID];
  v37 = [v36 zoneName];
  v38 = sub_1000CD884(@"ckme", v37);

  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    if (a8) {
      CFStringRef v39 = (const __CFString *)*a8;
    }
    else {
      CFStringRef v39 = @"null error passed in";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v46 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Couldn't decrypt old CKMirror entry: %@", buf, 0xCu);
  }

  id v35 = 0;
LABEL_22:

  return v35;
}

+ (id)removePaddingFromData:(id)a3
{
  id v3 = a3;
  v4 = (unsigned __int8 *)[v3 length];
  id v5 = v3;
  v6 = (char *)[v5 bytes] - 1;
  while (v4)
  {
    int v7 = (v4--)[(void)v6];
    if (v7)
    {
      if (v7 == 128)
      {
        v4 = [v5 subdataWithRange:0];
      }
      else
      {
        v4 = 0;
      }
      break;
    }
  }

  return v4;
}

+ (id)padData:(id)a3 blockSize:(unint64_t)a4 additionalBlock:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if (!a4)
  {
    id v8 = sub_10000B070("SecWarning");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CKKS padding function received invalid blocksize 0, using 1 instead", v17, 2u);
    }

    a4 = 1;
  }
  id v9 = +[NSMutableData dataWithData:v7];
  unint64_t v10 = (unint64_t)[v9 length];
  if (v5) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = 0;
  }
  unint64_t v12 = a4 + v11 + v10 / a4 * a4 - v10;
  id v13 = +[NSMutableData dataWithLength:v12];
  [v9 appendData:v13];

  id v14 = v9;
  id v15 = [v14 mutableBytes];
  *((unsigned char *)[v14 length] + (void)v15 - v12) = 0x80;

  return v14;
}

@end