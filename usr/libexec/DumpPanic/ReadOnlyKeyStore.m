@interface ReadOnlyKeyStore
- (BOOL)hasMatchingPrivateKey:(int)a3 :(id)a4;
- (BOOL)readKeyFile:(id)a3 :(id *)a4 :(int *)a5 :(id *)a6 :(id *)a7;
- (BOOL)unlock;
- (ReadOnlyKeyStore)initWithKeyStorePath:(id)a3 :(id)a4;
- (ccec_cp)getEccFormat:(int)a3;
- (id)getMatchingPrivateKey:(int)a3 :(id)a4;
- (id)init:(id)a3;
@end

@implementation ReadOnlyKeyStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log_handle, 0);

  objc_storeStrong((id *)&self->_keyStorePath, 0);
}

- (id)getMatchingPrivateKey:(int)a3 :(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  memset(__s2, 0, sizeof(__s2));
  v7 = [(ReadOnlyKeyStore *)self getEccFormat:v4];
  if (!v7)
  {
    id v20 = 0;
    goto LABEL_50;
  }
  p_var0 = &v7->var0;
  int v56 = v4;
  v9 = &v52;
  __chkstk_darwin();
  v11 = (unint64_t **)((char *)&v52 - v10);
  id v12 = [v6 length];
  id v13 = v6;
  int v14 = ccec_x963_import_pub(p_var0, (uint64_t)v12, (unsigned __int8 *)[v13 bytes], v11);
  if (v14)
  {
    int v15 = v14;
    cc_clear(24 * *p_var0 + 16, v11);
    log_handle = self->_log_handle;
    if (!os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR)) {
      goto LABEL_49;
    }
    int v69 = 67109120;
    LODWORD(v70) = v15;
    v17 = "Failed to parse the input public key with the given format. CoreCrypto error %d";
    v18 = log_handle;
    uint32_t v19 = 8;
LABEL_14:
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v69, v19);
    goto LABEL_49;
  }
  BOOL v21 = ccec_validate_pub((uint64_t **)v11);
  cc_clear(24 * *p_var0 + 16, v11);
  if (!v21)
  {
    v24 = self->_log_handle;
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_49;
    }
    LOWORD(v69) = 0;
    v17 = "The input public key did not pass basic validation checks";
    v18 = v24;
    uint32_t v19 = 2;
    goto LABEL_14;
  }
  v22 = ccsha256_di();
  ccdigest((uint64_t)v22, (size_t)[v13 length], (char *)[v13 bytes], (uint64_t)__s2);
  if (os_variant_has_internal_diagnostics()
    && _os_feature_enabled_impl()
    && self->_isDefaultKeyStorePath)
  {
    goto LABEL_49;
  }
  if (self->_singleFileMode)
  {
    v23 = +[NSMutableArray arrayWithCapacity:1];
    [v23 addObject:self->_keyStorePath];
  }
  else
  {
    v25 = +[NSFileManager defaultManager];
    v26 = [v25 contentsOfDirectoryAtPath:self->_keyStorePath error:0];

    if (v26)
    {
      v53 = &v52;
      id v54 = v6;
      v23 = +[NSMutableArray array];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      id v57 = v26;
      id v27 = v26;
      id v28 = [v27 countByEnumeratingWithState:&v65 objects:v72 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v66;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v66 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = +[NSString stringWithFormat:@"%@/%@", self->_keyStorePath, *(void *)(*((void *)&v65 + 1) + 8 * i)];
            [v23 addObject:v32];
          }
          id v29 = [v27 countByEnumeratingWithState:&v65 objects:v72 count:16];
        }
        while (v29);
      }

      v9 = v53;
      id v6 = v54;
      v26 = v57;
    }
    else
    {
      v23 = 0;
    }
  }
  int v33 = v56;
  if (!v23)
  {
    v48 = self->_log_handle;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      keyStorePath = self->_keyStorePath;
      int v69 = 138412290;
      v70 = keyStorePath;
      _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Failed to enumerate the directory at '%@'", (uint8_t *)&v69, 0xCu);
    }
    goto LABEL_48;
  }
  v53 = v9;
  id v54 = v6;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v34 = v23;
  id v57 = [v34 countByEnumeratingWithState:&v61 objects:v71 count:16];
  if (!v57) {
    goto LABEL_45;
  }
  uint64_t v35 = *(void *)v62;
  id v55 = v34;
  while (2)
  {
    for (j = 0; j != v57; j = (char *)j + 1)
    {
      if (*(void *)v62 != v35) {
        objc_enumerationMutation(v34);
      }
      uint64_t v37 = *(void *)(*((void *)&v61 + 1) + 8 * (void)j);
      int v69 = 0;
      id v59 = 0;
      id v60 = 0;
      unsigned int v38 = [(ReadOnlyKeyStore *)self readKeyFile:v37 :0 :&v69 :&v60 :&v59];
      id v39 = v60;
      id v20 = v59;
      if (v38)
      {
        if (v69 != v33)
        {
          v46 = self->_log_handle;
          if (!os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_43;
          }
          v58[0] = 0;
          v44 = v46;
          v45 = "Current key does not match input key format. Skipping";
          goto LABEL_40;
        }
        if ([v39 length] == (id)32)
        {
          id v40 = v39;
          int v41 = memcmp([v40 bytes], __s2, (size_t)[v40 length]);
          v42 = self->_log_handle;
          BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          if (!v41)
          {
            if (v43)
            {
              v58[0] = 0;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Found a matching private key", (uint8_t *)v58, 2u);
            }

            id v50 = v55;
            id v6 = v54;
            goto LABEL_50;
          }
          int v33 = v56;
          id v34 = v55;
          if (v43)
          {
            v58[0] = 0;
            v44 = v42;
            v45 = "Mismatched key hashes. Skipping";
LABEL_40:
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, v45, (uint8_t *)v58, 2u);
          }
        }
        else
        {
          v47 = self->_log_handle;
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            v58[0] = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "Mismatched key hash lengths", (uint8_t *)v58, 2u);
          }
        }
      }
LABEL_43:
    }
    id v57 = [v34 countByEnumeratingWithState:&v61 objects:v71 count:16];
    if (v57) {
      continue;
    }
    break;
  }
LABEL_45:

  id v6 = v54;
LABEL_48:

LABEL_49:
  id v20 = 0;
LABEL_50:

  return v20;
}

- (BOOL)readKeyFile:(id)a3 :(id *)a4 :(int *)a5 :(id *)a6 :(id *)a7
{
  id v12 = a3;
  id v13 = +[NSFileManager defaultManager];
  id v61 = 0;
  int v14 = [v13 attributesOfItemAtPath:v12 error:&v61];
  id v15 = v61;

  if (!v14)
  {
    log_handle = self->_log_handle;
    if (os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR))
    {
      uint32_t v19 = log_handle;
      id v20 = [v15 localizedDescription];
      *(_DWORD *)buf = 138412290;
      id v63 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to gather the file attributes for key file. Error: %@", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (a4) {
    *a4 = v14;
  }
  NSFileAttributeType v16 = [v14 fileType];

  if (v16 == NSFileTypeRegular)
  {
    if ((unint64_t)[v14 fileSize] > 0x2000)
    {
      BOOL v21 = self->_log_handle;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "File seems to be too large to be useful. Skipping", buf, 2u);
      }
      goto LABEL_12;
    }
    id v60 = v15;
    v24 = +[NSData dataWithContentsOfFile:v12 options:0 error:&v60];
    id v25 = v60;

    if (!v24)
    {
      v36 = self->_log_handle;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v44 = v36;
        v45 = [v25 localizedDescription];
        *(_DWORD *)buf = 138412290;
        id v63 = v45;
        _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to read the file contents for key file. Error: %@", buf, 0xCu);
      }
      BOOL v22 = 0;
      id v15 = v25;
      goto LABEL_73;
    }
    id v59 = v25;
    v26 = +[NSJSONSerialization JSONObjectWithData:v24 options:0 error:&v59];
    id v58 = v59;

    if (v26)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v57 = v26;
        id v27 = v26;
        id v28 = [v27 objectForKeyedSubscript:@"magic"];
        id v29 = v28;
        if (v28)
        {
          if ([v28 unsignedLongLongValue] == (id)0x4D414749434B4559)
          {
            uint64_t v30 = [v27 objectForKeyedSubscript:@"version"];
            int v56 = v30;
            if (v30)
            {
              if ([v30 unsignedIntValue] == 1)
              {
                v31 = [v27 objectForKeyedSubscript:@"key_format"];
                if (!v31)
                {
                  v47 = 0;
                  v48 = self->_log_handle;
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Misformatted key file. Key format not found", buf, 2u);
                  }
                  BOOL v22 = 0;
                  goto LABEL_69;
                }
                id v55 = v31;
                int v32 = [v31 intValue];
                if (!v32 || v32 >= 2)
                {
                  int v49 = v32;
                  id v50 = self->_log_handle;
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v63) = v49;
                    _os_log_error_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "Unsupported key format in key file: %d", buf, 8u);
                  }
                  goto LABEL_67;
                }
                *a5 = v32;
                if (a6)
                {
                  int v33 = [v27 objectForKeyedSubscript:@"public_key_hash"];
                  if (v33)
                  {
                    id v34 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v33 options:0];
                    *a6 = v34;
                    if (v34)
                    {

                      goto LABEL_28;
                    }
                    v51 = self->_log_handle;
                    if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_66;
                    }
                    *(_WORD *)buf = 0;
                    uint64_t v52 = "Failed to parse the Base64-encoded hash";
                  }
                  else
                  {
                    v51 = self->_log_handle;
                    if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_66;
                    }
                    *(_WORD *)buf = 0;
                    uint64_t v52 = "Misformatted key file. Public key hash not found";
                  }
LABEL_65:
                  _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, v52, buf, 2u);
                  goto LABEL_66;
                }
LABEL_28:
                if (!a7)
                {
LABEL_32:
                  BOOL v22 = 1;
LABEL_68:
                  v47 = v55;
LABEL_69:

                  goto LABEL_70;
                }
                int v33 = [v27 objectForKeyedSubscript:@"full_key"];
                if (v33)
                {
                  id v35 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v33 options:0];
                  *a7 = v35;
                  if (v35)
                  {

                    goto LABEL_32;
                  }
                  v51 = self->_log_handle;
                  if (!os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_66;
                  }
                  *(_WORD *)buf = 0;
                  uint64_t v52 = "Failed to parse the Base64-encoded key";
                  goto LABEL_65;
                }
                v51 = self->_log_handle;
                if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)buf = 0;
                  uint64_t v52 = "Misformatted key file. Full key not found";
                  goto LABEL_65;
                }
LABEL_66:

LABEL_67:
                BOOL v22 = 0;
                goto LABEL_68;
              }
              v46 = self->_log_handle;
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                v53 = v46;
                unsigned int v54 = [v56 intValue];
                *(_DWORD *)buf = 67109120;
                LODWORD(v63) = v54;
                _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Unknown file version %d", buf, 8u);
              }
            }
            else
            {
              BOOL v43 = self->_log_handle;
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Misformatted key file. Version not found", buf, 2u);
              }
            }
            BOOL v22 = 0;
LABEL_70:

            goto LABEL_71;
          }
          int v41 = self->_log_handle;
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
LABEL_44:
            BOOL v22 = 0;
LABEL_71:

            v26 = v57;
            goto LABEL_72;
          }
          *(_WORD *)buf = 0;
          v42 = "Misformatted key file. Mismatched magic";
        }
        else
        {
          int v41 = self->_log_handle;
          if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            goto LABEL_44;
          }
          *(_WORD *)buf = 0;
          v42 = "Not a key file. Magic not found";
        }
        _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, v42, buf, 2u);
        goto LABEL_44;
      }
      id v40 = self->_log_handle;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to parse the file contents as a dictionary", buf, 2u);
      }
    }
    else
    {
      uint64_t v37 = self->_log_handle;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        unsigned int v38 = v37;
        id v39 = [v58 localizedDescription];
        *(_DWORD *)buf = 138412290;
        id v63 = v39;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to parse the file contents as JSON. Error: %@", buf, 0xCu);

        v26 = 0;
      }
    }
    BOOL v22 = 0;
LABEL_72:

    id v15 = v58;
LABEL_73:

    goto LABEL_13;
  }
  v17 = self->_log_handle;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v63 = v12;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Skipping non-file type '%@'", buf, 0xCu);
  }
LABEL_12:
  BOOL v22 = 0;
LABEL_13:

  return v22;
}

- (ccec_cp)getEccFormat:(int)a3
{
  if (a3 == 1)
  {
    return (ccec_cp *)ccec_cp_256(self, a2);
  }
  else
  {
    log_handle = self->_log_handle;
    if (os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_error_impl((void *)&_mh_execute_header, log_handle, OS_LOG_TYPE_ERROR, "Unknown key format %d", (uint8_t *)v6, 8u);
    }
    return 0;
  }
}

- (BOOL)hasMatchingPrivateKey:(int)a3 :(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v8 = [(ReadOnlyKeyStore *)self getMatchingPrivateKey:v4 :v6];
  LOBYTE(v4) = v8 != 0;

  return v4;
}

- (BOOL)unlock
{
  return 1;
}

- (id)init:(id)a3
{
  id v4 = a3;
  v5 = +[NSString stringWithUTF8String:"/private/var/db/DumpPanic/Keys"];
  id v6 = [(ReadOnlyKeyStore *)self initWithKeyStorePath:v5 :v4];

  return v6;
}

- (ReadOnlyKeyStore)initWithKeyStorePath:(id)a3 :(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ReadOnlyKeyStore;
  v9 = [(ReadOnlyKeyStore *)&v18 init];
  uint64_t v10 = v9;
  if (!v9)
  {
LABEL_7:

    return v10;
  }
  if (v8)
  {
    objc_storeStrong((id *)&v9->_log_handle, a4);
    id v11 = v7;
    if (v11)
    {
      id v12 = v11;

      objc_storeStrong((id *)&v10->_keyStorePath, a3);
      v10->_isDefaultKeyStorePath = [v12 isEqualToString:@"/private/var/db/DumpPanic/Keys"];
      char v17 = 0;
      id v13 = +[NSFileManager defaultManager];
      LODWORD(v12) = [v13 fileExistsAtPath:v12 isDirectory:&v17];

      char v14 = v17 ^ 1;
      if (!v12) {
        char v14 = 0;
      }
      v10->_singleFileMode = v14;
      id v15 = v10;
      goto LABEL_7;
    }
  }
  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  _os_assert_log();
  result = (ReadOnlyKeyStore *)_os_crash();
  __break(1u);
  return result;
}

@end