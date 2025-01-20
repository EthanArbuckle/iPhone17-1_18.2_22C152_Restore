@interface SRCSSpokenCommand
- (NSArray)strings;
- (NSDictionary)recognizedParameters;
- (NSString)identifier;
- (SRCSSpokenCommand)initWithIdentifier:(id)a3;
- (SRCSSpokenCommand)initWithStrings:(id)a3;
- (id)_initWithSpokenCommand:(id)a3;
- (id)_uniqueCustomCommandIdentifier;
- (id)commandRecognizer;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)fstGrammar;
- (id)languageModelTree;
- (void)_replaceBuiltInIdentiferNodesWithSubTreesInMutableLM:(id)a3;
- (void)setCommandRecognizer:(id)a3;
- (void)setRecognizedParameters:(id)a3;
@end

@implementation SRCSSpokenCommand

- (SRCSSpokenCommand)initWithIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRCSSpokenCommand;
  v6 = [(SRCSSpokenCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_identifier, a3);
  }

  return v7;
}

- (SRCSSpokenCommand)initWithStrings:(id)a3
{
  v4 = (NSArray *)a3;
  id v5 = [(SRCSSpokenCommand *)self _uniqueCustomCommandIdentifier];
  v6 = [(SRCSSpokenCommand *)self initWithIdentifier:v5];

  strings = v6->_strings;
  v6->_strings = v4;

  return v6;
}

- (id)_initWithSpokenCommand:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SRCSSpokenCommand;
  id v5 = [(SRCSSpokenCommand *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 strings];
    strings = v5->_strings;
    v5->_strings = (NSArray *)v8;

    v10 = [v4 commandRecognizer];
    objc_storeWeak((id *)&v5->_commandRecognizer, v10);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 _initWithSpokenCommand:self];
}

- (id)commandRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandRecognizer);
  return WeakRetained;
}

- (void)setCommandRecognizer:(id)a3
{
}

- (NSArray)strings
{
  return self->_strings;
}

- (id)languageModelTree
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_languageModelTree)
  {
    if ([(NSArray *)v2->_strings count])
    {
      v3 = [(NSArray *)v2->_strings componentsJoinedByString:@"|"];
      id v25 = 0;
      id v4 = +[SRCSCommandStringsTable languageModelDictionaryFromCommandText:v3 parsingErrorString:&v25];
      id v5 = v25;

      if (v4 && ![v5 length])
      {
        [v4 setObject:v2->_identifier forKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
        v19 = v4;
        p_super = &v2->_languageModelTree->super.super;
        v2->_languageModelTree = v19;
      }
      else
      {
        p_super = SRCSLogGeneral();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
        {
          identifier = v2->_identifier;
          uint64_t v8 = [(NSArray *)v2->_strings componentsJoinedByString:@"|"];
          *(_DWORD *)buf = 138412802;
          v27 = identifier;
          __int16 v28 = 2112;
          id v29 = v8;
          __int16 v30 = 2112;
          v31 = v5;
          _os_log_impl(&dword_23AB39000, p_super, OS_LOG_TYPE_DEFAULT, "Error found while creating language model for (%@) \"%@\": %@", buf, 0x20u);
        }
      }
    }
    else if ([(NSString *)v2->_identifier length])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v2->_commandRecognizer);
      id v5 = [WeakRetained commandRecognitionSystem];

      v10 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
      v11 = [v5 localeIdentifier];
      objc_super v12 = [v10 commandStringsTableForLocaleIdentifier:v11];

      v13 = v2->_identifier;
      v14 = [v5 targetTypes];
      id v24 = 0;
      v15 = [v12 languageModelDictionaryForCommandIdentifier:v13 targetTypes:v14 parsingErrorString:&v24];
      id v16 = v24;

      if (v15 && ![v16 length])
      {
        [v15 setObject:v2->_identifier forKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
        v21 = v15;
        v17 = &v2->_languageModelTree->super.super;
        v2->_languageModelTree = v21;
      }
      else
      {
        v17 = SRCSLogGeneral();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v2->_identifier;
          *(_DWORD *)buf = 138412546;
          v27 = v18;
          __int16 v28 = 2112;
          id v29 = v16;
          _os_log_impl(&dword_23AB39000, v17, OS_LOG_TYPE_DEFAULT, "Error found while creating language model for %@: %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v5 = SRCSLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v20 = v2->_identifier;
        *(_DWORD *)buf = 138412290;
        v27 = v20;
        _os_log_impl(&dword_23AB39000, v5, OS_LOG_TYPE_DEFAULT, "Error found while creating language model for %@", buf, 0xCu);
      }
    }

    if (v2->_languageModelTree) {
      -[SRCSSpokenCommand _replaceBuiltInIdentiferNodesWithSubTreesInMutableLM:](v2, "_replaceBuiltInIdentiferNodesWithSubTreesInMutableLM:");
    }
  }
  objc_sync_exit(v2);

  languageModelTree = v2->_languageModelTree;
  return languageModelTree;
}

- (void)_replaceBuiltInIdentiferNodesWithSubTreesInMutableLM:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 objectForKey:kSRCSCommandParseDictionaryKeyIsBuiltInIdentifier[0]];
  if (![v5 BOOLValue])
  {
LABEL_7:

    goto LABEL_8;
  }
  uint64_t v6 = [v4 objectForKey:kSRCSCommandParseDictionaryKeyChildren[0]];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    uint64_t v8 = [v4 objectForKey:kSRCSCommandParseDictionaryKeyIdentifier[0]];
    if (v8)
    {
      id v5 = (void *)v8;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_commandRecognizer);
      v10 = [WeakRetained commandRecognitionSystem];
      v11 = [v10 languageModelTreeForBuiltInLMIdentifier:v5];

      if (v11)
      {
        [v4 removeAllObjects];
        [v4 addEntriesFromDictionary:v11];
      }

      goto LABEL_7;
    }
  }
LABEL_8:
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  objc_super v12 = objc_msgSend(v4, "objectForKey:", kSRCSCommandParseDictionaryKeyChildren[0], 0);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [(SRCSSpokenCommand *)self _replaceBuiltInIdentiferNodesWithSubTreesInMutableLM:*(void *)(*((void *)&v17 + 1) + 8 * v16++)];
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (id)fstGrammar
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_fstGrammar)
  {
    v3 = [(SRCSSpokenCommand *)v2 languageModelTree];
    if (v3)
    {
      id v4 = [CMDPGrammar alloc];
      id WeakRetained = objc_loadWeakRetained((id *)&v2->_commandRecognizer);
      uint64_t v6 = [WeakRetained commandRecognitionSystem];
      uint64_t v7 = [v6 localeIdentifier];
      uint64_t v8 = [(CMDPGrammar *)v4 initWithCommandTreeDictionary:v3 forLocaleIdentifier:v7];
      id fstGrammar = v2->_fstGrammar;
      v2->_id fstGrammar = (id)v8;
    }
  }
  objc_sync_exit(v2);

  id v10 = v2->_fstGrammar;
  return v10;
}

- (id)_uniqueCustomCommandIdentifier
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Custom.%lf", CFAbsoluteTimeGetCurrent());
}

- (id)description
{
  v3 = NSString;
  id v4 = [(SRCSSpokenCommand *)self identifier];
  id v5 = [(SRCSSpokenCommand *)self strings];
  uint64_t v6 = [v3 stringWithFormat:@"%@, %@, Rec Params: %@", v4, v5, self->_recognizedParameters];

  return v6;
}

- (NSDictionary)recognizedParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRecognizedParameters:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandRecognizer);
  objc_storeStrong(&self->_fstGrammar, 0);
  objc_storeStrong((id *)&self->_languageModelTree, 0);
  objc_storeStrong((id *)&self->_recognizedParameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

@end