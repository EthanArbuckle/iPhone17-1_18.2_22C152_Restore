@interface KeyStore
- (void)RotateKeys:(void *)a3;
@end

@implementation KeyStore

- (void)RotateKeys:(void *)a3
{
  if (!self->super.super._singleFileMode)
  {
    keyStorePath = self->super.super._keyStorePath;
    id v108 = 0;
    char v6 = sub_100015090(keyStorePath, &v108, 420);
    id v7 = v108;
    v8 = v7;
    if ((v6 & 1) == 0)
    {
      log_handle = self->super.super._log_handle;
      if (os_log_type_enabled(log_handle, OS_LOG_TYPE_ERROR))
      {
        v111[0] = 138412290;
        *(void *)&v111[1] = v8;
        _os_log_error_impl((void *)&_mh_execute_header, log_handle, OS_LOG_TYPE_ERROR, "Failed to setup the key-store directory.Error: %@", (uint8_t *)v111, 0xCu);
      }
      id v13 = 0;
      goto LABEL_66;
    }
    v87 = (uint64_t (*)(id))a3;
    id v88 = v7;
    v9 = +[NSFileManager defaultManager];
    v10 = [v9 contentsOfDirectoryAtPath:self->super.super._keyStorePath error:0];

    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v11 = v10;
    id v92 = v11;
    v97 = (uint64_t (**)(id))[v11 countByEnumeratingWithState:&v104 objects:v112 count:16];
    if (v97)
    {
      id v91 = 0;
      id v93 = 0;
      id v94 = 0;
      id v13 = 0;
      v14 = *(void **)v105;
      id v95 = 0;
      v96 = v14;
      *(void *)&long long v12 = 138412290;
      long long v90 = v12;
      *(void *)&long long v12 = 138412546;
      long long v89 = v12;
      do
      {
        for (i = 0; i != v97; i = (uint64_t (**)(id))((char *)i + 1))
        {
          if (*(void **)v105 != v96) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v104 + 1) + 8 * i);
          v17 = +[NSString stringWithFormat:@"%@/%@", self->super.super._keyStorePath, v16];
          unsigned int v109 = 0;
          id v103 = 0;
          unsigned __int8 v18 = [(ReadOnlyKeyStore *)self readKeyFile:v17 :&v103 :&v109 :0 :0];
          id v19 = v103;
          v20 = v19;
          if (v18)
          {
            if (v109 == 1)
            {
              v21 = [v19 fileCreationDate];
              if (!v95 || [v93 compare:v21] == (id)1)
              {
                id v22 = v17;

                id v23 = v21;
                id v93 = v23;
                id v95 = v22;
              }
              if (!v94 || [v91 compare:v21] == (id)-1)
              {
                id v24 = v17;

                id v25 = v21;
                id v91 = v25;
                id v94 = v24;
              }
            }
            else
            {
              v31 = self->super.super._log_handle;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v111[0]) = 0;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Current key does not match expected key format. Skipping", (uint8_t *)v111, 2u);
              }
            }
          }
          else
          {
            v26 = self->super.super._log_handle;
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v111[0] = v90;
              *(void *)&v111[1] = v16;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Deleting unparseable file '%@'", (uint8_t *)v111, 0xCu);
            }
            v27 = +[NSFileManager defaultManager];
            id v102 = v13;
            unsigned __int8 v28 = [v27 removeItemAtPath:v16 error:&v102];
            id v29 = v102;

            if ((v28 & 1) == 0)
            {
              v30 = self->super.super._log_handle;
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                v32 = v30;
                v33 = [v29 localizedDescription];
                v111[0] = v89;
                *(void *)&v111[1] = v16;
                LOWORD(v111[3]) = 2112;
                *(void *)((char *)&v111[3] + 2) = v33;
                _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to delete file '%@'. Error: %@", (uint8_t *)v111, 0x16u);
              }
            }
            id v13 = v29;
            id v11 = v92;
          }
        }
        v97 = (uint64_t (**)(id))[v11 countByEnumeratingWithState:&v104 objects:v112 count:16];
      }
      while (v97);

      if (v94)
      {
        [v91 timeIntervalSinceNow];
        BOOL v35 = fabs(v34) > 432000.0;
      }
      else
      {
        BOOL v35 = 1;
      }
      id v37 = v95;
      if (v95 && ([v95 isEqualToString:v94] & 1) == 0)
      {
        id v37 = v95;
        unlink((const char *)[v37 UTF8String]);
        if (v35) {
          goto LABEL_37;
        }
      }
      else if (v35)
      {
        goto LABEL_37;
      }
      v70 = self->super.super._log_handle;
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v111[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "Reusing an existing key file", (uint8_t *)v111, 2u);
      }
      unsigned int v109 = 0;
      id v98 = 0;
      id v99 = 0;
      unsigned __int8 v71 = [(ReadOnlyKeyStore *)self readKeyFile:v94 :0 :&v109 :&v99 :&v98];
      id v72 = v99;
      id v73 = v98;
      if (v71)
      {
        v74 = [(ReadOnlyKeyStore *)self getEccFormat:v109];
        __chkstk_darwin();
        v76 = (char *)&v87 - v75;
        int v77 = ccec_x963_import_priv(&v74->var0, (unint64_t)[v73 length], (unsigned __int8 *)[v73 bytes], (unint64_t **)((char *)&v87 - v75));
        if (v77)
        {
          int v78 = v77;
          cc_clear(24 * v74->var0 + 16, v76);
          v79 = self->super.super._log_handle;
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
          {
            v111[0] = 67109120;
            v111[1] = v78;
            _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Failed to parse the current private key. CoreCrypto error %d", (uint8_t *)v111, 8u);
          }
        }
        else
        {
          id v81 = +[NSMutableData dataWithLength:((unint64_t)(cczp_bitlen((uint64_t)v74) + 7) >> 2) | 1];
          ccec_x963_export(0, (char *)[v81 mutableBytes], (uint64_t *)v76);
          cc_clear(24 * v74->var0 + 16, v76);
          if ((v87(v81) & 1) == 0)
          {
            v82 = self->super.super._log_handle;
            if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v111[0]) = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "Failed to call the new public key callback with an existing key", (uint8_t *)v111, 2u);
            }
          }
        }
      }
      else
      {
        v80 = self->super.super._log_handle;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v111[0]) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "Failed to read existing key file", (uint8_t *)v111, 2u);
        }
      }

      goto LABEL_65;
    }

    id v13 = 0;
    id v37 = 0;
    id v93 = 0;
    id v94 = 0;
    id v91 = 0;
LABEL_37:
    id v95 = v37;
    v38 = self->super.super._log_handle;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v111[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Creating a new key file", (uint8_t *)v111, 2u);
    }
    v39 = [(ReadOnlyKeyStore *)self getEccFormat:1];
    v97 = &v87;
    __chkstk_darwin();
    v41 = (uint64_t **)((char *)&v87 - v40);
    v42 = ccrng(0);
    ccecdh_generate_key((uint64_t *)v39, (uint64_t (**)(void, uint64_t, uint64_t *))v42, v41);
    unint64_t v43 = 3 * ((unint64_t)(cczp_bitlen((uint64_t)v39) + 7) >> 3) + 1;
    unint64_t v44 = ((unint64_t)(cczp_bitlen((uint64_t)v39) + 7) >> 2) | 1;
    v45 = +[NSMutableData dataWithLength:v43];
    v46 = +[NSMutableData dataWithLength:v44];
    id v47 = v45;
    ccec_x963_export(1, (char *)[v47 mutableBytes], (uint64_t *)v41);
    id v48 = v46;
    ccec_x963_export(0, (char *)[v48 mutableBytes], (uint64_t *)v41);
    cc_clear((32 * v39->var0) | 0x10, v41);
    memset(v111, 0, 32);
    v49 = ccsha256_di();
    id v50 = [v48 length];
    id v51 = v48;
    ccdigest((uint64_t)v49, (size_t)v50, (char *)[v51 bytes], (uint64_t)v111);
    v52 = +[NSData dataWithBytes:v111 length:32];
    v53 = +[NSMutableDictionary dictionary];
    v54 = +[NSNumber numberWithUnsignedLongLong:0x4D414749434B4559];
    [v53 setObject:v54 forKeyedSubscript:@"magic"];

    v55 = +[NSNumber numberWithUnsignedInt:1];
    [v53 setObject:v55 forKeyedSubscript:@"version"];

    v56 = +[NSNumber numberWithInt:1];
    [v53 setObject:v56 forKeyedSubscript:@"key_format"];

    v96 = v52;
    v57 = [v52 base64EncodedStringWithOptions:0];
    [v53 setObject:v57 forKeyedSubscript:@"public_key_hash"];

    v58 = [v47 base64EncodedStringWithOptions:0];
    [v53 setObject:v58 forKeyedSubscript:@"full_key"];

    v59 = self->super.super._keyStorePath;
    v60 = +[NSDate date];
    [v60 timeIntervalSince1970];
    v62 = +[NSString stringWithFormat:@"%@/%llu.key", v59, (unint64_t)v61];

    id v101 = v13;
    v63 = +[NSJSONSerialization dataWithJSONObject:v53 options:0 error:&v101];
    id v64 = v101;

    if (v63)
    {
      id v100 = v64;
      unsigned __int8 v65 = [v63 writeToFile:v62 options:0x40000000 error:&v100];
      id v13 = v100;

      if (v65)
      {
        if ((v87(v51) & 1) == 0)
        {
          v66 = self->super.super._log_handle;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v109) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "Failed to call the new public key callback", (uint8_t *)&v109, 2u);
          }
          unlink((const char *)[v62 UTF8String]);
        }
      }
      else
      {
        v68 = self->super.super._log_handle;
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          v85 = v68;
          v86 = [v13 localizedDescription];
          unsigned int v109 = 138412290;
          v110 = v86;
          _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "Failed to write to the new key file. Error: %@", (uint8_t *)&v109, 0xCu);
        }
      }
    }
    else
    {
      v67 = self->super.super._log_handle;
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        v83 = v67;
        v84 = [v64 localizedDescription];
        unsigned int v109 = 138412290;
        v110 = v84;
        _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Failed to generate JSON data for key file. Error: %@", (uint8_t *)&v109, 0xCu);
      }
      id v13 = v64;
    }
    v69 = v96;

    id v11 = v92;
LABEL_65:

    v8 = v88;
LABEL_66:
  }
}

@end