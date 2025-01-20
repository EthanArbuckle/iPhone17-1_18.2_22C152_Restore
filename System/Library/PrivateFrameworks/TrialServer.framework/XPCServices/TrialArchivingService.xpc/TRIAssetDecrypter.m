@interface TRIAssetDecrypter
+ (BOOL)decryptAssetWithURL:(id)a3 destinationFileURL:(id)a4 keyFileURL:(id)a5;
@end

@implementation TRIAssetDecrypter

+ (BOOL)decryptAssetWithURL:(id)a3 destinationFileURL:(id)a4 keyFileURL:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = TRILogCategory_Archiving();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v9 path];
    v14 = [v10 path];
    *(_DWORD *)buf = 138412546;
    v74 = v13;
    __int16 v75 = 2112;
    v76 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Decrypting file with URL: %@ to destination: %@", buf, 0x16u);
  }
  v15 = [v11 path];

  id v16 = v15;
  v17 = (const char *)[v16 fileSystemRepresentation];

  int v18 = open(v17, 0);
  int v19 = v18;
  if (v18 < 0)
  {
    v34 = TRILogCategory_Archiving();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v42 = __error();
      v43 = strerror(*v42);
      int v44 = *__error();
      *(_DWORD *)buf = 136315650;
      v74 = v17;
      __int16 v75 = 2080;
      v76 = v43;
      __int16 v77 = 1024;
      int v78 = v44;
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Couldn't open the key file at path \"%s\": %s (%d)", buf, 0x1Cu);
    }
  }
  else
  {
    ssize_t v20 = read(v18, buf, 0x20uLL);
    v21 = TRILogCategory_Archiving();
    v22 = v21;
    if (v20 == 32)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v67 = 136315138;
        v68 = (void *)v17;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Found decryption key file at path: %s", v67, 0xCu);
      }

      close(v19);
      v23 = [v9 path];
      if (!v23)
      {
        v65 = +[NSAssertionHandler currentHandler];
        [v65 handleFailureInMethod:a2, a1, @"TRIAssetDecrypter.m", 52, @"Expression was unexpectedly nil/false: %@", @"assetURL.path" object file lineNumber description];
      }
      id v24 = v23;
      v25 = AAFileStreamOpenWithPath((const char *)[v24 fileSystemRepresentation], 0, 0x1A4u);

      if (!v25)
      {
        v35 = TRILogCategory_Archiving();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v50 = [v9 path];
          v51 = __error();
          v52 = strerror(*v51);
          int v53 = *__error();
          *(_DWORD *)v67 = 138412802;
          v68 = v50;
          __int16 v69 = 2080;
          v70 = v52;
          __int16 v71 = 1024;
          int v72 = v53;
          _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Error reading encrypted file for asset \"%@\": %s (%d)", v67, 0x1Cu);
        }
        BOOL v33 = 0;
        goto LABEL_41;
      }
      v26 = AEAContextCreateWithEncryptedStream(v25);
      v27 = v26;
      if (v26)
      {
        if ((AEAContextSetFieldBlob(v26, 9u, 0, buf, 0x20uLL) & 0x80000000) == 0)
        {
          v28 = AEADecryptionInputStreamOpen(v25, v27, 0x4000000000000000uLL, 0);
          if (v28)
          {
            v29 = [v10 path];
            if (!v29)
            {
              v66 = +[NSAssertionHandler currentHandler];
              [v66 handleFailureInMethod:a2, a1, @"TRIAssetDecrypter.m", 91, @"Expression was unexpectedly nil/false: %@", @"destinationFileURL.path" object file lineNumber description];
            }
            id v30 = v29;
            v31 = (const char *)[v30 fileSystemRepresentation];

            v32 = AAFileStreamOpenWithPath(v31, 513, 0x1A4u);
            BOOL v33 = v32 != 0;
            if (v32)
            {
              AAByteStreamProcess(v28, v32);
            }
            else
            {
              v48 = TRILogCategory_Archiving();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
              {
                v61 = [v10 path];
                v62 = __error();
                v63 = strerror(*v62);
                int v64 = *__error();
                *(_DWORD *)v67 = 138412802;
                v68 = v61;
                __int16 v69 = 2080;
                v70 = v63;
                __int16 v71 = 1024;
                int v72 = v64;
                _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "Error creating destination file \"%@\": %s (%d)", v67, 0x1Cu);
              }
            }
            AAByteStreamClose(v32);
          }
          else
          {
            v41 = TRILogCategory_Archiving();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v57 = [v9 path];
              v58 = __error();
              v59 = strerror(*v58);
              int v60 = *__error();
              *(_DWORD *)v67 = 138412802;
              v68 = v57;
              __int16 v69 = 2080;
              v70 = v59;
              __int16 v71 = 1024;
              int v72 = v60;
              _os_log_error_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Error calling AEADecryptionInputStreamOpen for asset \"%@\": %s (%d)", v67, 0x1Cu);
            }
            BOOL v33 = 0;
          }
          AAByteStreamClose(v28);
          goto LABEL_40;
        }
        v36 = TRILogCategory_Archiving();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v54 = __error();
          v55 = strerror(*v54);
          int v56 = *__error();
          *(_DWORD *)v67 = 136315394;
          v68 = v55;
          __int16 v69 = 1024;
          LODWORD(v70) = v56;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Decryption context setup failed: %s (%d)", v67, 0x12u);
        }
      }
      else
      {
        v36 = TRILogCategory_Archiving();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v37 = [v9 path];
          v38 = __error();
          v39 = strerror(*v38);
          int v40 = *__error();
          *(_DWORD *)v67 = 138412802;
          v68 = v37;
          __int16 v69 = 2080;
          v70 = v39;
          __int16 v71 = 1024;
          int v72 = v40;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Decryption context creation failed for asset \"%@\": %s (%d)", v67, 0x1Cu);
        }
      }

      BOOL v33 = 0;
LABEL_40:
      AEAContextDestroy(v27);
LABEL_41:
      AAByteStreamClose(v25);
      goto LABEL_42;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v45 = __error();
      v46 = strerror(*v45);
      int v47 = *__error();
      *(_DWORD *)v67 = 136315650;
      v68 = (void *)v17;
      __int16 v69 = 2080;
      v70 = v46;
      __int16 v71 = 1024;
      int v72 = v47;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Couldn't read the key file at path \"%s\": %s (%d)", v67, 0x1Cu);
    }
  }
  close(v19);
  BOOL v33 = 0;
LABEL_42:

  return v33;
}

@end