@interface SecDbKeychainItemV7
+ (id)decryptionOperation;
+ (id)encryptionOperation;
+ (id)keySpecifier;
- (BOOL)deleteWithAcmContext:(id)a3 accessControl:(__SecAccessControl *)a4 callerAccessGroups:(id)a5 keyDiversify:(BOOL)a6 error:(id *)a7;
- (BOOL)encryptMetadataWithKeybag:(int)a3 error:(id *)a4;
- (BOOL)encryptSecretDataWithKeybag:(int)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 error:(id *)a6;
- (SecDbKeychainItemV7)initWithData:(id)a3 decryptionKeybag:(int)a4 error:(id *)a5;
- (SecDbKeychainItemV7)initWithSecretAttributes:(id)a3 metadataAttributes:(id)a4 tamperCheck:(id)a5 keyclass:(int)a6;
- (id)encryptedBlobWithKeybag:(int)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 error:(id *)a6;
- (id)encryptedMetadataBlob;
- (id)encryptedSecretDataBlob;
- (id)metadataAttributesWithError:(id *)a3;
- (id)metadataClassKeyWithKeybag:(int)a3 allowWrites:(BOOL)a4 error:(id *)a5;
- (id)secretAttributesWithAcmContext:(id)a3 accessControl:(__SecAccessControl *)a4 callerAccessGroups:(id)a5 keyDiversify:(BOOL)a6 error:(id *)a7;
- (id)unwrapFromAKS:(id)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 callerAccessGroups:(id)a6 delete:(BOOL)a7 keyDiversify:(BOOL)a8 error:(id *)a9;
- (id)wrapToAKS:(id)a3 withKeybag:(int)a4 accessControl:(__SecAccessControl *)a5 acmContext:(id)a6 error:(id *)a7;
- (int)keyclass;
@end

@implementation SecDbKeychainItemV7

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tamperCheck, 0);
  objc_storeStrong((id *)&self->_metadataAttributes, 0);
  objc_storeStrong((id *)&self->_secretAttributes, 0);
  objc_storeStrong((id *)&self->_encryptedMetadata, 0);

  objc_storeStrong((id *)&self->_encryptedSecretData, 0);
}

- (id)secretAttributesWithAcmContext:(id)a3 accessControl:(__SecAccessControl *)a4 callerAccessGroups:(id)a5 keyDiversify:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  secretAttributes = self->_secretAttributes;
  if (secretAttributes) {
    goto LABEL_15;
  }
  v15 = [(SecDbKeychainSecretData *)self->_encryptedSecretData wrappedKey];
  v16 = [(SecDbKeychainItemV7 *)self unwrapFromAKS:v15 accessControl:a4 acmContext:v12 callerAccessGroups:v13 delete:0 keyDiversify:v8 error:a7];

  if (!v16)
  {
LABEL_14:

    secretAttributes = self->_secretAttributes;
LABEL_15:
    v31 = secretAttributes;
    goto LABEL_16;
  }
  v17 = [(id)objc_opt_class() decryptionOperation];
  v18 = [(SecDbKeychainSecretData *)self->_encryptedSecretData ciphertext];
  id v35 = 0;
  v19 = [v17 decrypt:v18 withKey:v16 error:&v35];
  id v20 = v35;

  if (v19)
  {
    v34 = v20;
    id v21 = v19;
    [v21 subdataWithRange:0, [v21 length] - *((char *)[v21 length] + (void)[v21 bytes] - 1)];
    CFDataRef v22 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    v23 = sub_100014E70(v22);
    id v24 = [v23 mutableCopy];

    v25 = [v24 objectForKeyedSubscript:@"TamperCheck"];
    v26 = [(SecDbKeychainSecretData *)self->_encryptedSecretData tamperCheck];
    unsigned int v27 = [v25 isEqualToString:v26];

    if (v27)
    {
      [v24 removeObjectForKey:@"TamperCheck"];
      v28 = (NSDictionary *)v24;
      p_super = &self->_secretAttributes->super;
      self->_secretAttributes = v28;
    }
    else
    {
      p_super = sub_10000B070("SecError");
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v32 = [(SecDbKeychainMetadata *)self->_encryptedMetadata tamperCheck];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v25;
        __int16 v37 = 2112;
        v38 = v32;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: tamper check failed for secret data decryption, expected %@ found %@", buf, 0x16u);
      }
    }

    goto LABEL_14;
  }
  v30 = sub_10000B070("SecError");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v20;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: error decrypting item secret data contents: %@", buf, 0xCu);
  }

  if (a7)
  {
    *(void *)buf = v20;
    sub_100012A40(-26275, (__CFString **)buf, @"error decrypting item secret data contents");
    *a7 = *(id *)buf;
  }

  v31 = 0;
LABEL_16:

  return v31;
}

- (id)metadataAttributesWithError:(id *)a3
{
  p_metadataAttributes = &self->_metadataAttributes;
  metadataAttributes = self->_metadataAttributes;
  if (!metadataAttributes)
  {
    v7 = [(SecDbKeychainItemV7 *)self metadataClassKeyWithKeybag:self->_keybag allowWrites:0 error:a3];
    if (v7)
    {
      BOOL v8 = [(id)objc_opt_class() decryptionOperation];
      v9 = [(SecDbKeychainMetadata *)self->_encryptedMetadata wrappedKey];
      id v37 = 0;
      v10 = [v8 decrypt:v9 withKey:v7 error:&v37];
      id v11 = v37;

      if (!v10)
      {
        v25 = sub_10000B070("SecError");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v26 = [(SecDbKeychainItemV7 *)self keyclass];
          int keybag = self->_keybag;
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = v26;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = keybag;
          *(_WORD *)v39 = 2112;
          *(void *)&v39[2] = v11;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: error unwrapping item metadata key (class %d, bag %d): %@", buf, 0x18u);
        }

        if (a3)
        {
          *(void *)buf = v11;
          sub_100012A40(-26275, (__CFString **)buf, @"failed to unwrap item metadata key");
          *a3 = *(id *)buf;
        }

        goto LABEL_26;
      }
      id v12 = objc_alloc((Class)_SFAESKey);
      id v13 = [(id)objc_opt_class() keySpecifier];
      id v14 = [v12 initWithData:v10 specifier:v13 error:a3];

      if (v14)
      {
        id v35 = v10;
        v15 = [(id)objc_opt_class() decryptionOperation];
        v16 = [(SecDbKeychainMetadata *)self->_encryptedMetadata ciphertext];
        id v36 = v11;
        CFDataRef v17 = [v15 decrypt:v16 withKey:v14 error:&v36];
        id v18 = v36;

        if (v17)
        {
          id v34 = v18;
          CFDataRef v19 = v17;
          id v20 = sub_100014E70(v17);
          id v21 = [v20 mutableCopy];

          CFDataRef v22 = [v21 objectForKeyedSubscript:@"TamperCheck"];
          v23 = [(SecDbKeychainMetadata *)self->_encryptedMetadata tamperCheck];
          unsigned int v24 = [v22 isEqualToString:v23];

          if (v24)
          {
            [v21 removeObjectForKey:@"TamperCheck"];
            objc_storeStrong((id *)p_metadataAttributes, v21);
          }
          else
          {
            v30 = sub_10000B070("SecError");
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              v31 = [(SecDbKeychainMetadata *)self->_encryptedMetadata tamperCheck];
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = v22;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)v39 = v31;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: tamper check failed for metadata decryption, expected %@ found %@", buf, 0x16u);
            }
            if (a3)
            {
              *(void *)buf = 0;
              sub_100012A40(-26275, (__CFString **)buf, @"tamper check failed for metadata decryption");
              *a3 = *(id *)buf;
            }
          }

          int v28 = 0;
          id v18 = v34;
          CFDataRef v17 = v19;
        }
        else
        {
          v29 = sub_10000B070("SecError");
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v18;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: error decrypting metadata content: %@", buf, 0xCu);
          }

          if (a3)
          {
            *(void *)buf = v18;
            sub_100012A40(-26275, (__CFString **)buf, @"failed to decrypt item metadata contents");
            *a3 = *(id *)buf;
          }
          int v28 = 1;
        }

        v10 = v35;
      }
      else
      {
        int v28 = 1;
        id v18 = v11;
      }

      if (v28)
      {
LABEL_26:

        v32 = 0;
        goto LABEL_29;
      }
    }

    metadataAttributes = *p_metadataAttributes;
  }
  v32 = metadataAttributes;
LABEL_29:

  return v32;
}

+ (id)decryptionOperation
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100117054;
  block[3] = &unk_1003093A8;
  block[4] = a1;
  if (qword_10035CF08 != -1) {
    dispatch_once(&qword_10035CF08, block);
  }
  v2 = (void *)qword_10035CF00;

  return v2;
}

- (id)metadataClassKeyWithKeybag:(int)a3 allowWrites:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  v9 = +[SecDbKeychainMetadataKeyStore sharedStore];
  uint64_t keyclass = self->_keyclass;
  id v11 = [(id)objc_opt_class() keySpecifier];
  id v12 = [v9 keyForKeyclass:keyclass keybag:v7 keySpecifier:v11 allowWrites:v6 error:a5];

  return v12;
}

+ (id)keySpecifier
{
  if (qword_10035CEE8 != -1) {
    dispatch_once(&qword_10035CEE8, &stru_1002FA7F8);
  }
  v2 = (void *)qword_10035CEE0;

  return v2;
}

- (SecDbKeychainItemV7)initWithData:(id)a3 decryptionKeybag:(int)a4 error:(id *)a5
{
  id v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SecDbKeychainItemV7;
  v9 = [(SecDbKeychainItemV7 *)&v26 init];
  if (v9)
  {
    v10 = [[SecDbKeychainSerializedItemV7 alloc] initWithData:v8];
    if (!v10) {
      goto LABEL_8;
    }
    if ((unint64_t)[v8 length] >= 0x959A)
    {
      id v11 = sub_10000B070("SecWarning");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [v8 length];
        *(_DWORD *)buf = 134217984;
        id v30 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: serialized item exceeds reasonable size (%lu bytes)", buf, 0xCu);
      }
    }
    v9->_int keybag = a4;
    id v13 = [SecDbKeychainSecretData alloc];
    id v14 = [(SecDbKeychainSerializedItemV7 *)v10 encryptedSecretData];
    v15 = [(SecDbKeychainSecretData *)v13 initWithData:v14];
    encryptedSecretData = v9->_encryptedSecretData;
    v9->_encryptedSecretData = v15;

    CFDataRef v17 = [SecDbKeychainMetadata alloc];
    id v18 = [(SecDbKeychainSerializedItemV7 *)v10 encryptedMetadata];
    CFDataRef v19 = [(SecDbKeychainMetadata *)v17 initWithData:v18];
    encryptedMetadata = v9->_encryptedMetadata;
    v9->_encryptedMetadata = v19;

    v9->_uint64_t keyclass = [(SecDbKeychainSerializedItemV7 *)v10 keyclass];
    id v21 = [(SecDbKeychainSecretData *)v9->_encryptedSecretData tamperCheck];
    CFDataRef v22 = [(SecDbKeychainMetadata *)v9->_encryptedMetadata tamperCheck];
    unsigned __int8 v23 = [v21 isEqualToString:v22];

    if ((v23 & 1) == 0)
    {
LABEL_8:

      v9 = 0;
    }
  }
  if (a5 && !v9)
  {
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    CFStringRef v28 = @"failed to deserialize keychain item blob";
    unsigned int v24 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    *a5 = +[NSError errorWithDomain:kCFErrorDomainOSStatus code:-26275 userInfo:v24];
  }
  return v9;
}

- (id)unwrapFromAKS:(id)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 callerAccessGroups:(id)a6 delete:(BOOL)a7 keyDiversify:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  id v13 = a9;
  id v14 = a3;
  id v15 = a5;
  v16 = (__CFString *)a6;
  id v65 = [v14 wrappedKey];
  if (v9)
  {
    CFDataRef v17 = [(NSDictionary *)self->_metadataAttributes objectForKeyedSubscript:kSecAttrMultiUser];
    if (sub_100017CB4((const __CFData *)v17))
    {
      id v64 = v14;
      id v18 = v17;
      id v19 = [v18 bytes];
      id v20 = [v18 length];
      id v21 = sub_10000B070("KeyDiversify");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "unwrapFromAKS: Key diversification feature persona(musr) %@ is data separated", buf, 0xCu);
      }

      id v13 = a9;
      id v22 = v19;
      id v14 = v64;
    }
    else
    {
      id v20 = 0;
      id v22 = 0;
    }
  }
  else
  {
    id v20 = 0;
    id v22 = 0;
  }
  if (![v14 type])
  {
    v42 = +[NSMutableData dataWithLength:32];
    v43 = v65;
    if (+[SecAKSObjCWrappers aksDecryptWithKeybag:self->_keybag keyclass:self->_keyclass ciphertext:v65 outKeyclass:&self->_keyclass plaintext:v42 personaId:v22 personaIdLength:v20 error:v13])
    {
      id v44 = objc_alloc((Class)_SFAESKey);
      v45 = [(id)objc_opt_class() keySpecifier];
      id v30 = [v44 initWithData:v42 specifier:v45 error:v13];
    }
    else
    {
      id v30 = 0;
    }

    goto LABEL_45;
  }
  if ([v14 type] == 1)
  {
    v62 = v13;
    unsigned __int8 v23 = v14;
    uint64_t v24 = (uint64_t)v22;
    *(void *)buf = 0;
    int keybag = self->_keybag;
    id v26 = [v23 refKeyBlob];
    id v27 = [v26 bytes];
    [v23 refKeyBlob];
    CFStringRef v28 = v63 = v15;
    int v29 = sub_1000193F8(keybag, v27, (size_t)[v28 length], (uint64_t *)buf);

    id v15 = v63;
    id v30 = 0;
    if (!v29)
    {
      uint64_t v72 = 0;
      v73 = 0;
      uint64_t v31 = sub_10001A208(*(uint64_t *)buf, &v72);
      if (v31)
      {
        CFDictionaryRef theDict = 0;
        sub_10000F124(0, (int)&theDict, (CFTypeRef *)&v73, v31, v31 + v72);
        CFDictionaryRef v32 = theDict;
        if (!theDict) {
          sub_100012A40(-26275, &v73, @"SecDbKeychainItemV7: failed to decode acl dict");
        }
        CFDictionaryGetValue(v32, @"acl");
        SecAccessControlSetConstraints();
        if (v16)
        {
          uint64_t v36 = sub_10000FE8C(v16, (CFTypeRef *)&v73, v33, v34, v35);
          id v37 = [objc_alloc((Class)NSMutableData) initWithLength:v36];
          v38 = (UInt8 *)[v37 mutableBytes];
          id v39 = v37;
          id v40 = [v39 mutableBytes];
          v41 = v38;
          id v15 = v63;
          sub_10000F7B0(v16, (CFTypeRef *)&v73, 0, v41, (unint64_t)v40 + v36);
        }
        else
        {
          id v39 = 0;
        }
        uint64_t v69 = 0;
        v70 = 0;
        v46 = (void **)sub_100018BB8(0);
        v68 = v46;
        if (!v46)
        {
          sub_100019344((uint64_t *)buf);
          id v30 = 0;
LABEL_42:

          goto LABEL_43;
        }
        v47 = v46;
        if (v24)
        {
          sub_100018E2C(v46, 15, v24);
          v47 = v68;
        }
        sub_100018E2C(v47, 1, (uint64_t)[v39 bytes]);
        id v48 = v15;
        id v49 = [v48 bytes];
        [v48 length];
        sub_100018E2C(v68, 3, (uint64_t)v49);
        sub_100018F28(v68, &v70, (size_t *)&v69);
        uint64_t v66 = 0;
        v67 = 0;
        v50 = *(uint64_t **)buf;
        uint64_t v52 = v69;
        v51 = v70;
        id v53 = v65;
        uint64_t v54 = sub_1000194C0(v50, (uint64_t)v51, v52, [v53 bytes], (size_t)[v53 length]);
        if (v54)
        {
          uint64_t v55 = v54;
          v56 = v62;
          if (v48 || v54 != -536363000)
          {
            v57 = (const void *)SecAccessControlCopyData();
            sub_100154CB4(v55, @"od", 0, 0, (uint64_t)v57, (const __CFData *)v48, &v73);
            id v15 = v63;
            if (v57) {
              CFRelease(v57);
            }
            sub_100019344((uint64_t *)buf);
            free(v70);
            v70 = 0;
            sub_100018F2C(&v68);
            v58 = v73;
            if (v62) {
              goto LABEL_40;
            }
            goto LABEL_36;
          }
          sub_100154A3C((CFErrorRef *)&v73, 0);
        }
        else
        {
          v56 = v62;
          sub_100012A40(-26275, &v73, @"SecDbKeychainItemV7: failed to decrypt item, Item can't be decrypted due to failed decode der, so drop the item.");
        }
        sub_100019344((uint64_t *)buf);
        free(v70);
        v70 = 0;
        sub_100018F2C(&v68);
        v58 = v73;
        id v15 = v63;
        if (v56)
        {
LABEL_40:
          v59 = v58;
          v60 = (__CFString **)v56;
          id v30 = 0;
          *v60 = v59;
          v73 = 0;
LABEL_41:
          CFDictionaryRef v32 = theDict;
          goto LABEL_42;
        }
LABEL_36:
        if (v58)
        {
          v73 = 0;
          CFRelease(v58);
        }
        id v30 = 0;
        goto LABEL_41;
      }
      sub_100019344((uint64_t *)buf);
      id v30 = 0;
    }
LABEL_43:
    id v14 = v23;
    goto LABEL_44;
  }
  id v30 = 0;
LABEL_44:
  v43 = v65;
LABEL_45:

  return v30;
}

- (int)keyclass
{
  return self->_keyclass;
}

- (id)wrapToAKS:(id)a3 withKeybag:(int)a4 accessControl:(__SecAccessControl *)a5 acmContext:(id)a6 error:(id *)a7
{
  id v9 = a6;
  v10 = [a3 keyData];
  id v11 = SecAccessControlGetConstraints();
  CFDataRef v12 = [(NSDictionary *)self->_metadataAttributes objectForKeyedSubscript:kSecAttrMultiUser];
  if (!sub_100017CB4(v12))
  {
    id v17 = 0;
    id v16 = 0;
    if (v11) {
      goto LABEL_5;
    }
LABEL_15:
    id v33 = v9;
    id v34 = [objc_alloc((Class)NSMutableData) initWithLength:40];
    if (+[SecAKSObjCWrappers aksEncryptWithKeybag:a4 keyclass:self->_keyclass plaintext:v10 outKeyclass:&self->_keyclass ciphertext:v34 personaId:v16 personaIdLength:v17 error:a7])
    {
      id v35 = [[SecDbKeychainAKSWrappedKey alloc] initRegularWrappedKeyWithData:v34];
    }
    else
    {
      id v35 = 0;
    }

    id v9 = v33;
    goto LABEL_44;
  }
  id v13 = v10;
  id v14 = v9;
  CFDataRef v15 = v12;
  id v16 = [(__CFData *)v15 bytes];
  id v17 = [(__CFData *)v15 length];
  id v18 = sub_10000B070("KeyDiversify");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id v65 = 138412290;
    *(void *)&v65[4] = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "wrapToAKS: Key diversification feature persona(musr) %@ is data separated", v65, 0xCu);
  }

  id v9 = v14;
  v10 = v13;
  if (!v11) {
    goto LABEL_15;
  }
LABEL_5:
  *(void *)id v65 = 0;
  id v62 = 0;
  CFStringRef v63 = @"acl";
  id v64 = v11;
  id v19 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  unsigned __int8 v23 = sub_1000298CC((const __CFString *)v19, (CFTypeRef *)&v62, v20, v21, v22);
  if (!v9 || (SecAccessControlIsBound() & 1) == 0)
  {
    uint64_t v36 = sub_10000B070("SecError");
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: access control error", buf, 2u);
    }

    if (a7)
    {
      id v37 = (const void *)SecAccessControlCopyData();
      SecAccessControlIsBound();
      sub_100154A3C((CFErrorRef *)&v62, (uint64_t)v37);
      if (v37) {
        CFRelease(v37);
      }
      id v35 = 0;
      *a7 = v62;
      id v62 = 0;
      goto LABEL_43;
    }
    id v38 = v62;
    if (!v62) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  id v53 = v9;
  uint64_t v60 = 0;
  *(void *)buf = 0;
  uint64_t v24 = (void **)sub_100018BB8(0);
  v59 = v24;
  if (!v24)
  {
    id v35 = 0;
LABEL_42:
    id v9 = v53;
    goto LABEL_43;
  }
  v25 = v24;
  if (v16) {
    sub_100018E2C(v24, 15, (uint64_t)v16);
  }
  id v26 = v23;
  id v27 = [(__CFData *)v26 bytes];
  [(__CFData *)v26 length];
  sub_100018E2C(v25, 2, (uint64_t)v27);
  id v28 = v53;
  id v29 = [v28 bytes];
  [v28 length];
  sub_100018E2C(v25, 3, (uint64_t)v29);
  sub_100018F28(v25, buf, (size_t *)&v60);
  uint64_t v30 = sub_100018F90(a4, self->_keyclass, 0, *(uint64_t *)buf, v60, (void ***)v65);
  if (v30)
  {
    uint64_t v31 = v30;
    CFDictionaryRef v32 = (const void *)SecAccessControlCopyData();
    sub_100154CB4(v31, @"oe", a4, self->_keyclass, (uint64_t)v32, (const __CFData *)v28, (__CFString **)&v62);
    if (v32) {
      CFRelease(v32);
    }
    free(*(void **)buf);
    *(void *)buf = 0;
  }
  else
  {
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    uint64_t v39 = v60;
    uint64_t v51 = *(void *)buf;
    uint64_t v52 = *(uint64_t **)v65;
    id v40 = v10;
    id v41 = [v40 bytes];
    [v40 length];
    uint64_t v42 = sub_1000191C0(v52, v51, v39, (uint64_t)v41);
    if (!v42)
    {
      free(*(void **)buf);
      *(void *)buf = 0;
      id v45 = v62;
      if (a7)
      {
        *a7 = v62;
        id v62 = 0;
      }
      else if (v62)
      {
        id v62 = 0;
        CFRelease(v45);
      }
      id v46 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v57 length:v58];
      uint64_t v56 = 0;
      uint64_t v47 = sub_10001A1FC(*(uint64_t **)v65, &v56);
      id v48 = objc_alloc((Class)NSData);
      id v49 = [v48 initWithBytes:v47 length:v56];
      sub_100018F2C(&v59);
      sub_100019344((uint64_t *)v65);
      id v35 = [[SecDbKeychainAKSWrappedKey alloc] initRefKeyWrappedKeyWithData:v46 refKeyBlob:v49];

      goto LABEL_42;
    }
    uint64_t v43 = v42;
    id v44 = (const void *)SecAccessControlCopyData();
    sub_100154CB4(v43, @"oe", a4, self->_keyclass, (uint64_t)v44, (const __CFData *)v28, (__CFString **)&v62);
    if (v44) {
      CFRelease(v44);
    }
    free(*(void **)buf);
    *(void *)buf = 0;
    sub_100019344((uint64_t *)v65);
  }
  sub_100018F2C(&v59);
  id v38 = v62;
  if (a7)
  {
    id v35 = 0;
    *a7 = v62;
    id v62 = 0;
    goto LABEL_42;
  }
  id v9 = v53;
  if (v62)
  {
LABEL_26:
    id v62 = 0;
    CFRelease(v38);
  }
LABEL_27:
  id v35 = 0;
LABEL_43:

LABEL_44:

  return v35;
}

- (BOOL)encryptSecretDataWithKeybag:(int)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = objc_alloc((Class)_SFAESKey);
  CFDataRef v12 = [(id)objc_opt_class() keySpecifier];
  id v13 = [v11 initRandomKeyWithSpecifier:v12 error:a6];

  if (v13)
  {
    id v14 = [(id)objc_opt_class() encryptionOperation];
    CFDataRef v15 = (__CFString *)[(NSDictionary *)self->_secretAttributes mutableCopy];
    [(__CFString *)v15 setObject:self->_tamperCheck forKeyedSubscript:@"TamperCheck"];
    id v19 = sub_1000298CC(v15, 0, v16, v17, v18);
    id v20 = [(__CFData *)v19 mutableCopy];

    if ((unint64_t)[v20 length] > 0x8000)
    {
      uint64_t v31 = a4;
      uint64_t v21 = [(NSDictionary *)self->_metadataAttributes objectForKeyedSubscript:kSecAttrAccessGroup];
      uint64_t v22 = sub_10000B070("SecWarning");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        *(void *)&uint8_t buf[4] = [v20 length];
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&unsigned char buf[14] = v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: item's secret data exceeds reasonable size (%lu bytes) (%@)", buf, 0x16u);
      }

      a4 = v31;
    }
    unint64_t v23 = (unint64_t)[v20 length];
    uint64_t v24 = (20 * (v23 / 0x14) - v23 + 20);
    *(void *)buf = 0x101010101010101 * v24;
    *(void *)&uint8_t buf[8] = 0x101010101010101 * v24;
    *(_DWORD *)&buf[16] = 16843009 * v24;
    [v20 appendBytes:buf length:];
    v25 = [v14 encrypt:v20 withKey:v13 error:a6];
    id v26 = [(SecDbKeychainItemV7 *)self wrapToAKS:v13 withKeybag:v8 accessControl:a4 acmContext:v10 error:a6];
    id v27 = [[SecDbKeychainSecretData alloc] initWithCiphertext:v25 wrappedKey:v26 tamperCheck:self->_tamperCheck error:a6];
    encryptedSecretData = self->_encryptedSecretData;
    self->_encryptedSecretData = v27;

    BOOL v29 = self->_encryptedSecretData != 0;
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

- (BOOL)encryptMetadataWithKeybag:(int)a3 error:(id *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc((Class)_SFAESKey);
  uint64_t v8 = [(id)objc_opt_class() keySpecifier];
  id v9 = [v7 initRandomKeyWithSpecifier:v8 error:a4];

  if (v9)
  {
    id v10 = [(id)objc_opt_class() encryptionOperation];
    id v11 = (__CFString *)[(NSDictionary *)self->_metadataAttributes mutableCopy];
    [(__CFString *)v11 setObject:self->_tamperCheck forKeyedSubscript:@"TamperCheck"];
    CFDataRef v15 = sub_1000298CC(v11, 0, v12, v13, v14);
    if ((unint64_t)[(__CFData *)v15 length] >= 0x801)
    {
      uint64_t v16 = [(NSDictionary *)self->_metadataAttributes objectForKeyedSubscript:kSecAttrAccessGroup];
      uint64_t v17 = sub_10000B070("SecWarning");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v26 = 134218242;
        id v27 = [(__CFData *)v15 length];
        __int16 v28 = 2112;
        BOOL v29 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: item's metadata exceeds reasonable size (%lu bytes) (%@)", (uint8_t *)&v26, 0x16u);
      }
    }
    uint64_t v18 = [v10 encrypt:v15 withKey:v9 error:a4];
    id v19 = [(SecDbKeychainItemV7 *)self metadataClassKeyWithKeybag:v5 allowWrites:1 error:a4];
    if (v19)
    {
      id v20 = [v9 keyData];
      uint64_t v21 = [v10 encrypt:v20 withKey:v19 error:a4];

      uint64_t v22 = [[SecDbKeychainMetadata alloc] initWithCiphertext:v18 wrappedKey:v21 tamperCheck:self->_tamperCheck error:a4];
      encryptedMetadata = self->_encryptedMetadata;
      self->_encryptedMetadata = v22;
    }
    BOOL v24 = self->_encryptedMetadata != 0;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (id)encryptedSecretDataBlob
{
  return [(SecDbKeychainSecretData *)self->_encryptedSecretData serializedRepresentation];
}

- (id)encryptedMetadataBlob
{
  return [(SecDbKeychainMetadata *)self->_encryptedMetadata serializedRepresentation];
}

- (id)encryptedBlobWithKeybag:(int)a3 accessControl:(__SecAccessControl *)a4 acmContext:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v20 = 0;
  unsigned int v11 = [(SecDbKeychainItemV7 *)self encryptMetadataWithKeybag:v8 error:&v20];
  id v12 = v20;
  if (v11
    && self->_encryptedMetadata
    && !v12
    && (id v19 = 0,
        v13 = [(SecDbKeychainItemV7 *)self encryptSecretDataWithKeybag:v8 accessControl:a4 acmContext:v10 error:&v19], id v12 = v19, v13)&& self->_encryptedSecretData&& !v12)
  {
    uint64_t v14 = objc_alloc_init(SecDbKeychainSerializedItemV7);
    CFDataRef v15 = [(SecDbKeychainItemV7 *)self encryptedMetadataBlob];
    [(SecDbKeychainSerializedItemV7 *)v14 setEncryptedMetadata:v15];

    uint64_t v16 = [(SecDbKeychainItemV7 *)self encryptedSecretDataBlob];
    [(SecDbKeychainSerializedItemV7 *)v14 setEncryptedSecretData:v16];

    [(SecDbKeychainSerializedItemV7 *)v14 setKeyclass:self->_keyclass];
    uint64_t v17 = [(SecDbKeychainSerializedItemV7 *)v14 data];

    id v12 = 0;
  }
  else if (a6)
  {
    id v12 = v12;
    uint64_t v17 = 0;
    *a6 = v12;
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

- (BOOL)deleteWithAcmContext:(id)a3 accessControl:(__SecAccessControl *)a4 callerAccessGroups:(id)a5 keyDiversify:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  if ((const CFBooleanRef)SecAccessControlGetConstraint() == kCFBooleanTrue)
  {
    id v17 = 0;
    BOOL v15 = 1;
  }
  else
  {
    uint64_t v14 = [(SecDbKeychainSecretData *)self->_encryptedSecretData wrappedKey];
    id v21 = 0;
    BOOL v15 = 1;
    id v16 = [(SecDbKeychainItemV7 *)self unwrapFromAKS:v14 accessControl:a4 acmContext:v12 callerAccessGroups:v13 delete:1 keyDiversify:v8 error:&v21];
    id v17 = v21;

    if (v17)
    {
      uint64_t v18 = sub_10000B070("SecError");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SecDbKeychainItemV7: failed to delete item secret key from aks", buf, 2u);
      }

      if (a7)
      {
        id v17 = v17;
        BOOL v15 = 0;
        *a7 = v17;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
  }

  return v15;
}

- (SecDbKeychainItemV7)initWithSecretAttributes:(id)a3 metadataAttributes:(id)a4 tamperCheck:(id)a5 keyclass:(int)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v13)
  {
    uint64_t v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SecDbKeychainItemV7.m", 362, @"Invalid parameter not satisfying: %@", @"tamperCheck" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)SecDbKeychainItemV7;
  uint64_t v14 = [(SecDbKeychainItemV7 *)&v23 init];
  if (v14)
  {
    if (v11)
    {
      BOOL v15 = (NSDictionary *)[v11 copy];
    }
    else
    {
      BOOL v15 = +[NSDictionary dictionary];
    }
    secretAttributes = v14->_secretAttributes;
    v14->_secretAttributes = v15;

    if (v12)
    {
      id v17 = (NSDictionary *)[v12 copy];
    }
    else
    {
      id v17 = +[NSDictionary dictionary];
    }
    metadataAttributes = v14->_metadataAttributes;
    v14->_metadataAttributes = v17;

    id v19 = (NSString *)[v13 copy];
    tamperCheck = v14->_tamperCheck;
    v14->_tamperCheck = v19;

    v14->_uint64_t keyclass = a6;
  }

  return v14;
}

+ (id)encryptionOperation
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011716C;
  block[3] = &unk_1003093A8;
  block[4] = a1;
  if (qword_10035CEF8 != -1) {
    dispatch_once(&qword_10035CEF8, block);
  }
  v2 = (void *)qword_10035CEF0;

  return v2;
}

@end