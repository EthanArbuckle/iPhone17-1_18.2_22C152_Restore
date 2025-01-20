@interface QLTextItemTransformer
+ (id)allowedOutputClasses;
+ (id)attributedStringFromData:(id)a3 encoding:(unint64_t)a4 typeIdentifier:(id)a5 error:(id *)a6;
+ (id)wrapperFromData:(id)a3 encoding:(unint64_t)a4 typeIdentifier:(id)a5 error:(id *)a6;
- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5;
- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5;
@end

@implementation QLTextItemTransformer

+ (id)allowedOutputClasses
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

- (id)transformedContentsFromURL:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  CFStringEncoding v9 = QLGuessEncodingForTextFileAtURL();
  unint64_t v10 = CFStringConvertEncodingToNSStringEncoding(v9);
  v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v8];

  v12 = objc_opt_class();
  v13 = [v7 contentType];

  v14 = [v12 wrapperFromData:v11 encoding:v10 typeIdentifier:v13 error:a5];

  return v14;
}

- (id)transformedContentsFromData:(id)a3 context:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 stringEncoding])
  {
    unint64_t v9 = [v8 stringEncoding];
  }
  else
  {
    CFStringEncoding v10 = QLGuessEncodingForTextFileFromData();
    unint64_t v9 = CFStringConvertEncodingToNSStringEncoding(v10);
  }
  unint64_t v11 = v9;
  v12 = objc_opt_class();
  v13 = [v8 contentType];
  v14 = [v12 wrapperFromData:v7 encoding:v11 typeIdentifier:v13 error:a5];

  return v14;
}

+ (id)attributedStringFromData:(id)a3 encoding:(unint64_t)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  v6 = [a1 wrapperFromData:a3 encoding:a4 typeIdentifier:a5 error:a6];
  id v7 = [v6 string];

  return v7;
}

+ (id)wrapperFromData:(id)a3 encoding:(unint64_t)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v67 = v9;
  if (v9)
  {
    CFStringEncoding v10 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v9];
  }
  else
  {
    CFStringEncoding v10 = 0;
  }
  uint64_t v11 = *MEMORY[0x1E4F444A8];
  v66 = v10;
  if ([v10 conformsToType:*MEMORY[0x1E4F444A8]])
  {
    uint64_t v68 = *MEMORY[0x1E4F42550];
    uint64_t v69 = *MEMORY[0x1E4F424F8];
    v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F42550], 0);
    if (a4)
    {
      v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
      [v12 setObject:v13 forKey:*MEMORY[0x1E4F424E0]];
    }
    id v81 = 0;
    id v82 = 0;
    v59 = v12;
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithData:v8 options:v12 documentAttributes:&v82 error:&v81];
    id v70 = v82;
    id v15 = v81;
    if (v8 && !v14)
    {
      id v16 = v8;
      id v80 = 0;
      v17 = (void *)[objc_alloc(MEMORY[0x1E4F945E0]) initWithData:v16 error:&v80];
      id v58 = v80;
      if (!v58)
      {
        id v57 = v16;
        long long v78 = 0u;
        long long v79 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        v18 = [v17 fileWrapper];
        v19 = [v18 fileWrappers];

        id obj = v19;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v76 objects:v91 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          id v56 = v8;
          uint64_t v22 = *(void *)v77;
          uint64_t v23 = *MEMORY[0x1E4F44468];
          uint64_t v63 = v11;
          v64 = v17;
          uint64_t v61 = *MEMORY[0x1E4F44468];
          uint64_t v62 = *(void *)v77;
          while (2)
          {
            uint64_t v24 = 0;
            uint64_t v65 = v21;
            do
            {
              if (*(void *)v77 != v22) {
                objc_enumerationMutation(obj);
              }
              v25 = *(void **)(*((void *)&v76 + 1) + 8 * v24);
              v26 = [v25 pathExtension];
              if (v26)
              {
                v27 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v26 conformingToType:v23];
                if ([v27 conformsToType:v11])
                {
                  v28 = v15;
                  id v29 = objc_alloc(MEMORY[0x1E4F28B18]);
                  v72 = [v17 fileWrapper];
                  v30 = [v72 fileWrappers];
                  v31 = [v30 objectForKeyedSubscript:v25];
                  v32 = [v31 serializedRepresentation];
                  uint64_t v89 = v69;
                  uint64_t v90 = v68;
                  v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
                  id v75 = v28;
                  v14 = (void *)[v29 initWithData:v32 options:v33 documentAttributes:0 error:&v75];
                  id v15 = v75;

                  if (v14)
                  {

                    id v8 = v56;
                    v17 = v64;
                    goto LABEL_51;
                  }
                  uint64_t v11 = v63;
                  v17 = v64;
                  uint64_t v23 = v61;
                  uint64_t v22 = v62;
                  uint64_t v21 = v65;
                }
                else
                {
                }
              }

              ++v24;
            }
            while (v21 != v24);
            uint64_t v21 = [obj countByEnumeratingWithState:&v76 objects:v91 count:16];
            if (v21) {
              continue;
            }
            break;
          }
          v14 = 0;
          id v8 = v56;
        }
        else
        {
          v14 = 0;
        }
LABEL_51:

        id v16 = v57;
      }

      id v15 = v58;
    }
LABEL_53:

    if (v15)
    {
      v48 = (NSObject **)MEMORY[0x1E4F945F0];
      v49 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        QLSInitLogging();
        v49 = *v48;
      }
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v84 = (unint64_t)v15;
        _os_log_impl(&dword_1E2805000, v49, OS_LOG_TYPE_ERROR, "Error while trying to read string %@ #AnyItemViewController", buf, 0xCu);
      }
      v50 = a6;
      if (a6)
      {
        id v51 = v15;
        id v15 = v51;
LABEL_69:
        v52 = 0;
        id *v50 = v51;
        goto LABEL_72;
      }
      goto LABEL_71;
    }
    goto LABEL_60;
  }
  if ([v10 conformsToType:*MEMORY[0x1E4F444A0]])
  {
    v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F424F8], *MEMORY[0x1E4F42558], 0);
    if (a4)
    {
      v35 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
      [v34 setObject:v35 forKey:*MEMORY[0x1E4F424E0]];
    }
    id v73 = 0;
    id v74 = 0;
    v59 = v34;
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithData:v8 options:v34 documentAttributes:&v74 error:&v73];
    id v70 = v74;
    id v15 = v73;
    goto LABEL_53;
  }
  if (([v10 conformsToType:*MEMORY[0x1E4F44470]] & 1) != 0
    || ([v10 conformsToType:*MEMORY[0x1E4F444F0]] & 1) != 0
    || ([v10 conformsToType:*MEMORY[0x1E4F44488]] & 1) != 0
    || [v10 conformsToType:*MEMORY[0x1E4F44550]])
  {
    if (a4) {
      unint64_t v36 = a4;
    }
    else {
      unint64_t v36 = 4;
    }
    v37 = (void *)[[NSString alloc] initWithData:v8 encoding:v36];
    if ([v8 length] && !v37)
    {
      unint64_t v36 = 1;
      v37 = (void *)[[NSString alloc] initWithData:v8 encoding:1];
    }
    if (v37
      || [v10 conformsToType:*MEMORY[0x1E4F44488]]
      && (v37 = (void *)[[NSString alloc] initWithData:v8 encoding:1]) != 0)
    {
      if ([v10 conformsToType:*MEMORY[0x1E4F444C8]])
      {
        v87[0] = *MEMORY[0x1E4F42508];
        v38 = (void *)MEMORY[0x1E4F42A30];
        [MEMORY[0x1E4F42A30] systemFontSize];
        v39 = objc_msgSend(v38, "monospacedSystemFontOfSize:weight:");
        v87[1] = *MEMORY[0x1E4F42500];
        uint64_t v40 = *MEMORY[0x1E4F42548];
        v88[0] = v39;
        v88[1] = v40;
        v41 = (void *)MEMORY[0x1E4F1C9E8];
        v42 = v88;
        v43 = v87;
      }
      else
      {
        v85[0] = *MEMORY[0x1E4F42508];
        v46 = (void *)MEMORY[0x1E4F42A30];
        [MEMORY[0x1E4F42A30] systemFontSize];
        v39 = objc_msgSend(v46, "systemFontOfSize:");
        v85[1] = *MEMORY[0x1E4F42500];
        v86[0] = v39;
        v86[1] = *MEMORY[0x1E4F42548];
        v41 = (void *)MEMORY[0x1E4F1C9E8];
        v42 = v86;
        v43 = v85;
      }
      uint64_t v47 = [v41 dictionaryWithObjects:v42 forKeys:v43 count:2];

      id v70 = (id)v47;
      v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v37 attributes:v47];
    }
    else
    {
      v44 = (NSObject **)MEMORY[0x1E4F945F0];
      v45 = *MEMORY[0x1E4F945F0];
      if (!*MEMORY[0x1E4F945F0])
      {
        QLSInitLogging();
        v45 = *v44;
      }
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v84 = v36;
        _os_log_impl(&dword_1E2805000, v45, OS_LOG_TYPE_ERROR, "Could not create plain content from data with encoding: %lu #AnyItemViewController", buf, 0xCu);
      }
      v14 = 0;
      id v70 = 0;
    }
LABEL_60:
    if (v14)
    {
      v52 = objc_opt_new();
      [v52 setString:v14];
      [v52 setAttributes:v70];
      id v15 = 0;
      goto LABEL_72;
    }
    goto LABEL_63;
  }
  id v70 = 0;
LABEL_63:
  v53 = (NSObject **)MEMORY[0x1E4F945F0];
  v54 = *MEMORY[0x1E4F945F0];
  if (!*MEMORY[0x1E4F945F0])
  {
    QLSInitLogging();
    v54 = *v53;
  }
  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2805000, v54, OS_LOG_TYPE_ERROR, "Could not create string content for text preview item. #AnyItemViewController", buf, 2u);
  }
  v50 = a6;
  if (a6)
  {
    id v51 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.quicklook.textItemTransformer" code:1 userInfo:0];
    id v15 = 0;
    v14 = 0;
    goto LABEL_69;
  }
  id v15 = 0;
  v14 = 0;
LABEL_71:
  v52 = 0;
LABEL_72:

  return v52;
}

@end