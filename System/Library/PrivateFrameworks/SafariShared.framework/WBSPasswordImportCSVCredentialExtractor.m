@interface WBSPasswordImportCSVCredentialExtractor
+ (id)credentialExtractionErrorForErrorCode:(int64_t)a3;
- (BOOL)looksLikePasswordsCSVFile;
- (WBSPasswordImportCSVCredentialExtractor)initWithURLforCSVFile:(id)a3;
- (id)_initWithCSVContents:(id)a3;
- (id)extractCredentialsWithError:(id *)a3;
@end

@implementation WBSPasswordImportCSVCredentialExtractor

- (WBSPasswordImportCSVCredentialExtractor)initWithURLforCSVFile:(id)a3
{
  id v4 = a3;
  id v16 = 0;
  v5 = [MEMORY[0x1E4F1C978] arrayWithContentsOfDelimitedURL:v4 options:2 delimiter:44 error:&v16];
  id v6 = v16;
  if (!v5)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordImportCSVCredentialExtractor initWithURLforCSVFile:](v7, v6);
    }
  }
  id v15 = v6;
  v8 = [MEMORY[0x1E4F1C978] arrayWithContentsOfDelimitedURL:v4 options:3 delimiter:44 error:&v15];
  id v9 = v15;

  if (!v8)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WBSPasswordImportCSVCredentialExtractor initWithURLforCSVFile:](v10, v9);
    }
  }
  unint64_t v11 = [v8 count];
  if (v11 <= [v5 count]) {
    v12 = v5;
  }
  else {
    v12 = v8;
  }
  v13 = [(WBSPasswordImportCSVCredentialExtractor *)self _initWithCSVContents:v12];

  return v13;
}

+ (id)credentialExtractionErrorForErrorCode:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.SafariShared.WBSCredentialExtractionErrorDomain", a3, 0, v3);
  }
  return v5;
}

- (BOOL)looksLikePasswordsCSVFile
{
  if (![(NSArray *)self->_csvContents count]) {
    return 0;
  }
  csvHeaderChecker = self->_csvHeaderChecker;
  uint64_t v4 = [(NSArray *)self->_csvContents objectAtIndexedSubscript:0];
  v5 = [(WBSPasswordImportCSVHeaderChecker *)csvHeaderChecker columnIndicesForHeaderFields:v4];

  BOOL v6 = [v5 urlIndex] != 0x7FFFFFFFFFFFFFFFLL
    && [v5 usernameIndex] != 0x7FFFFFFFFFFFFFFFLL
    && [v5 passwordIndex] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

- (id)extractCredentialsWithError:(id *)a3
{
  if (a3)
  {
    *a3 = 0;
    p_csvContents = &self->_csvContents;
    if (![(NSArray *)self->_csvContents count])
    {
      [(id)objc_opt_class() credentialExtractionErrorForErrorCode:3];
      id v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_5:
    csvHeaderChecker = self->_csvHeaderChecker;
    v8 = [(NSArray *)self->_csvContents objectAtIndexedSubscript:0];
    id v9 = [(WBSPasswordImportCSVHeaderChecker *)csvHeaderChecker columnIndicesForHeaderFields:v8];

    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSArray count](*p_csvContents, "count") - 1);
      unint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 1, -[NSArray count](*p_csvContents, "count") - 1);
      v12 = *p_csvContents;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __71__WBSPasswordImportCSVCredentialExtractor_extractCredentialsWithError___block_invoke;
      v16[3] = &unk_1E5C9E7F8;
      id v17 = v9;
      id v13 = v10;
      id v18 = v13;
      [(NSArray *)v12 enumerateObjectsAtIndexes:v11 options:0 usingBlock:v16];
      v14 = v18;
      id v6 = v13;
    }
    else if (a3)
    {
      [(id)objc_opt_class() credentialExtractionErrorForErrorCode:2];
      id v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = 0;
    }

    goto LABEL_12;
  }
  p_csvContents = &self->_csvContents;
  if ([(NSArray *)self->_csvContents count]) {
    goto LABEL_5;
  }
  id v6 = 0;
LABEL_12:
  return v6;
}

void __71__WBSPasswordImportCSVCredentialExtractor_extractCredentialsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v69[1] = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  unint64_t v5 = [*(id *)(a1 + 32) usernameIndex];
  if (v5 >= [v4 count])
  {
    v63 = 0;
  }
  else
  {
    v63 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "usernameIndex"));
  }
  unint64_t v6 = [*(id *)(a1 + 32) passwordIndex];
  if (v6 >= [v4 count])
  {
    v62 = 0;
  }
  else
  {
    v62 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "passwordIndex"));
  }
  unint64_t v7 = [*(id *)(a1 + 32) urlIndex];
  if (v7 >= [v4 count])
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "urlIndex"));
  }
  unint64_t v9 = [*(id *)(a1 + 32) otpAuthURLIndex];
  if (v9 >= [v4 count])
  {
    v10 = 0;
  }
  else
  {
    v10 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "otpAuthURLIndex"));
  }
  unint64_t v11 = [*(id *)(a1 + 32) notesEntryIndex];
  if (v11 >= [v4 count])
  {
    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "notesEntryIndex"));
  }
  unint64_t v13 = [*(id *)(a1 + 32) titleIndex];
  uint64_t v56 = a1;
  if (v13 >= [v4 count])
  {
    v61 = 0;
  }
  else
  {
    v61 = objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "titleIndex"));
  }
  v14 = [v8 componentsSeparatedByString:@","];
  uint64_t v15 = [v14 count];
  unint64_t v16 = 0x1E4F1C000uLL;
  v54 = v4;
  v55 = v8;
  if ((unint64_t)[v14 count] >= 2)
  {
    id v17 = (void *)MEMORY[0x1E4F1CB10];
    id v18 = [v14 firstObject];
    v19 = objc_msgSend(v17, "safari_URLWithUserTypedString:", v18);
    v20 = [v19 scheme];
    id obj = (id)[v20 length];

    if (v15 >= 2)
    {
      uint64_t v21 = 1;
      while (1)
      {
        v22 = *(void **)(v16 + 2832);
        v23 = [v14 objectAtIndexedSubscript:v21];
        v24 = objc_msgSend(v22, "safari_URLWithUserTypedString:", v23);
        v25 = [v24 scheme];
        uint64_t v26 = [v25 length];

        if (!v26) {
          break;
        }
        ++v21;
        unint64_t v16 = 0x1E4F1C000;
        if (v15 == v21) {
          goto LABEL_27;
        }
      }
      if (obj)
      {
        v69[0] = v55;
        uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];

        v14 = (void *)v27;
      }
    }
  }
LABEL_27:
  uint64_t v28 = v56;
  int v29 = objc_msgSend(v14, "safari_containsObjectPassingTest:", &__block_literal_global_89);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id obja = v14;
  uint64_t v30 = [obja countByEnumeratingWithState:&v64 objects:v68 count:16];
  if (!v30) {
    goto LABEL_55;
  }
  uint64_t v31 = v30;
  uint64_t v32 = *(void *)v65;
  uint64_t v60 = a3 + 1;
  do
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v65 != v32) {
        objc_enumerationMutation(obja);
      }
      if (!v29) {
        goto LABEL_35;
      }
      uint64_t v34 = *(void *)(*((void *)&v64 + 1) + 8 * v33);
      v35 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", v34);
      if (objc_msgSend(v35, "safari_hasScheme:", @"app"))
      {

LABEL_35:
        v35 = 0;
        goto LABEL_36;
      }
      v45 = [v35 scheme];

      if (v45)
      {
        v46 = [v35 host];
        v47 = objc_msgSend(v46, "safari_highLevelDomainForPasswordManager");

        if (!v47) {
          goto LABEL_47;
        }
      }
      else
      {
        v48 = (void *)MEMORY[0x1E4F1CB10];
        v49 = [@"https://" stringByAppendingString:v34];
        v50 = objc_msgSend(v48, "safari_URLWithUserTypedString:", v49);

        v51 = [v50 host];
        v52 = objc_msgSend(v51, "safari_highLevelDomainForPasswordManager");

        v35 = v50;
        if (!v52) {
          goto LABEL_47;
        }
      }
LABEL_36:
      if ([v10 length])
      {
        v36 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v10];
        v37 = v36;
        if (!v36
          || ([v36 scheme], v38 = objc_claimAutoreleasedReturnValue(), v38, !v38))
        {
          v39 = (void *)[objc_alloc(MEMORY[0x1E4F97FF8]) initWithBase32EncodedKey:v10];
          v40 = v39;
          if (v39)
          {
            uint64_t v41 = [v39 exportableURL];

            v37 = (void *)v41;
            uint64_t v28 = v56;
          }
        }
      }
      else
      {
        v37 = 0;
      }
      v42 = [WBSPasswordImportedCredential alloc];
      if ([v12 length]) {
        v43 = v12;
      }
      else {
        v43 = 0;
      }
      v44 = [(WBSPasswordImportedCredential *)v42 initWithUser:v63 password:v62 url:v35 otpAuthURL:v37 title:v61 notesEntry:v43 lineNumberFromSourceFile:v60];
      [*(id *)(v28 + 40) addObject:v44];

LABEL_47:
      ++v33;
    }
    while (v31 != v33);
    uint64_t v53 = [obja countByEnumeratingWithState:&v64 objects:v68 count:16];
    uint64_t v31 = v53;
  }
  while (v53);
LABEL_55:
}

BOOL __71__WBSPasswordImportCSVCredentialExtractor_extractCredentialsWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 length] != 0;
}

- (id)_initWithCSVContents:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSPasswordImportCSVCredentialExtractor;
  unint64_t v6 = [(WBSPasswordImportCSVCredentialExtractor *)&v11 init];
  if (v6)
  {
    unint64_t v7 = objc_alloc_init(WBSPasswordImportCSVHeaderChecker);
    csvHeaderChecker = v6->_csvHeaderChecker;
    v6->_csvHeaderChecker = v7;

    objc_storeStrong((id *)&v6->_csvContents, a3);
    unint64_t v9 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csvContents, 0);
  objc_storeStrong((id *)&self->_csvHeaderChecker, 0);
}

- (void)initWithURLforCSVFile:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Extraction from CSV with (CHCSVParserOptionsSanitizesFields | CHCSVParserOptionsRecognizesBackslashesAsEscapes) failed: %@", v7, v8, v9, v10, 2u);
}

- (void)initWithURLforCSVFile:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Extraction from CSV with CHCSVParserOptionsSanitizesFields failed: %@", v7, v8, v9, v10, 2u);
}

@end