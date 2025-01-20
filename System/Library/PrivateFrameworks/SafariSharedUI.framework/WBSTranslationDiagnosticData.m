@interface WBSTranslationDiagnosticData
- (NSArray)errors;
- (NSArray)extractedParagraphs;
- (NSArray)translatedParagraphs;
- (NSString)URLString;
- (NSString)errorsAsJSON;
- (NSString)extractedParagraphsAsJSON;
- (NSString)translatedParagraphsAsJSON;
- (WBSTranslationDiagnosticData)init;
- (id)_createFileForContents:(id)a3 fileName:(id)a4 inDirectory:(id)a5;
- (id)_destinationDirectory;
- (id)copyWithZone:(_NSZone *)a3;
- (id)saveDiagnosticDataAsTemporaryFiles;
- (void)addError:(id)a3 forParagraphIdentifier:(id)a4;
- (void)addExtractedParagraphs:(id)a3;
- (void)addTranslatedParagraph:(id)a3;
- (void)setErrorsAsJSON:(id)a3;
- (void)setExtractedParagraphsAsJSON:(id)a3;
- (void)setTranslatedParagraphsAsJSON:(id)a3;
- (void)setURLString:(id)a3;
@end

@implementation WBSTranslationDiagnosticData

- (WBSTranslationDiagnosticData)init
{
  v12.receiver = self;
  v12.super_class = (Class)WBSTranslationDiagnosticData;
  v2 = [(WBSTranslationDiagnosticData *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    extractedParagraphs = v2->_extractedParagraphs;
    v2->_extractedParagraphs = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    translatedParagraphs = v2->_translatedParagraphs;
    v2->_translatedParagraphs = (NSMutableArray *)v5;

    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    errors = v2->_errors;
    v2->_errors = (NSMutableArray *)v7;

    URLString = v2->_URLString;
    v2->_URLString = (NSString *)&stru_1F031A860;

    v10 = v2;
  }

  return v2;
}

- (void)setURLString:(id)a3
{
  uint64_t v4 = [a3 copy];
  id v6 = (id)v4;
  if (v4) {
    uint64_t v5 = (__CFString *)v4;
  }
  else {
    uint64_t v5 = &stru_1F031A860;
  }
  objc_storeStrong((id *)&self->_URLString, v5);
}

- (NSArray)extractedParagraphs
{
  v2 = (void *)[(NSMutableArray *)self->_extractedParagraphs copy];
  return (NSArray *)v2;
}

- (NSArray)translatedParagraphs
{
  v2 = (void *)[(NSMutableArray *)self->_translatedParagraphs copy];
  return (NSArray *)v2;
}

- (void)addExtractedParagraphs:(id)a3
{
  extractedParagraphs = self->_extractedParagraphs;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", &__block_literal_global_54);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)extractedParagraphs addObjectsFromArray:v4];
}

uint64_t __55__WBSTranslationDiagnosticData_addExtractedParagraphs___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_dictionaryRepresentation");
}

- (void)addTranslatedParagraph:(id)a3
{
  translatedParagraphs = self->_translatedParagraphs;
  objc_msgSend(a3, "safari_dictionaryRepresentation");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NSMutableArray *)translatedParagraphs safari_addObjectUnlessNil:v4];
}

- (void)addError:(id)a3 forParagraphIdentifier:(id)a4
{
  v10[2] = *MEMORY[0x1E4F143B8];
  errors = self->_errors;
  v9[0] = @"paragraphIdentifier";
  v9[1] = @"error";
  v10[0] = a4;
  id v6 = a4;
  uint64_t v7 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  v10[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  [(NSMutableArray *)errors addObject:v8];
}

- (id)saveDiagnosticDataAsTemporaryFiles
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(NSString *)self->_URLString length])
  {
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:self->_URLString];
    uint64_t v5 = objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [v5 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

  uint64_t v7 = &stru_1F031A860;
  if (v6) {
    uint64_t v7 = v6;
  }
  v8 = v7;

  v9 = [(WBSTranslationDiagnosticData *)self _destinationDirectory];
  if (self->_extractedParagraphsAsJSON)
  {
    v10 = [NSString stringWithFormat:@"Translation-%@-Extracted.json", v8];
    v11 = [(WBSTranslationDiagnosticData *)self _createFileForContents:self->_extractedParagraphsAsJSON fileName:v10 inDirectory:v9];
    objc_msgSend(v3, "safari_addObjectUnlessNil:", v11);
  }
  if (self->_translatedParagraphsAsJSON)
  {
    objc_super v12 = [NSString stringWithFormat:@"Translation-%@-Translated.json", v8];
    v13 = [(WBSTranslationDiagnosticData *)self _createFileForContents:self->_translatedParagraphsAsJSON fileName:v12 inDirectory:v9];
    objc_msgSend(v3, "safari_addObjectUnlessNil:", v13);
  }
  v14 = (void *)[v3 copy];

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSString *)self->_URLString copy];
  id v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSMutableArray *)self->_extractedParagraphs mutableCopy];
  v8 = (void *)v4[1];
  v4[1] = v7;

  uint64_t v9 = [(NSMutableArray *)self->_translatedParagraphs mutableCopy];
  v10 = (void *)v4[2];
  v4[2] = v9;

  uint64_t v11 = [(NSString *)self->_extractedParagraphsAsJSON copy];
  objc_super v12 = (void *)v4[5];
  v4[5] = v11;

  uint64_t v13 = [(NSString *)self->_translatedParagraphsAsJSON copy];
  v14 = (void *)v4[6];
  v4[6] = v13;

  return v4;
}

- (id)_createFileForContents:(id)a3 fileName:(id)a4 inDirectory:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4F28CB8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v7 defaultManager];
  objc_super v12 = [v8 stringByAppendingPathComponent:v9];

  uint64_t v13 = objc_msgSend(v11, "_web_pathWithUniqueFilenameForPath:", v12);
  v14 = [v10 dataUsingEncoding:4];

  id v19 = 0;
  [v14 writeToFile:v13 options:1 error:&v19];
  id v15 = v19;
  if (v15)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[WBSTranslationDiagnosticData _createFileForContents:fileName:inDirectory:](v16, v15);
    }
    id v17 = 0;
  }
  else
  {
    id v17 = v13;
  }

  return v17;
}

- (id)_destinationDirectory
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v3 = objc_msgSend(v2, "_webkit_createTemporaryDirectoryWithTemplatePrefix:", @"Translation");

  return v3;
}

- (NSString)URLString
{
  return self->_URLString;
}

- (NSArray)errors
{
  return &self->_errors->super;
}

- (NSString)extractedParagraphsAsJSON
{
  return self->_extractedParagraphsAsJSON;
}

- (void)setExtractedParagraphsAsJSON:(id)a3
{
}

- (NSString)translatedParagraphsAsJSON
{
  return self->_translatedParagraphsAsJSON;
}

- (void)setTranslatedParagraphsAsJSON:(id)a3
{
}

- (NSString)errorsAsJSON
{
  return self->_errorsAsJSON;
}

- (void)setErrorsAsJSON:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsAsJSON, 0);
  objc_storeStrong((id *)&self->_translatedParagraphsAsJSON, 0);
  objc_storeStrong((id *)&self->_extractedParagraphsAsJSON, 0);
  objc_storeStrong((id *)&self->_URLString, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_translatedParagraphs, 0);
  objc_storeStrong((id *)&self->_extractedParagraphs, 0);
}

- (void)_createFileForContents:(void *)a1 fileName:(void *)a2 inDirectory:.cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Error writing diagnostic data to disk: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end