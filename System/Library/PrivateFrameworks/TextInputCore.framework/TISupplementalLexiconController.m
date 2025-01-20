@interface TISupplementalLexiconController
- (TISupplementalLexicon)activeLexicon;
- (TISupplementalLexiconController)initWithConnection:(id)a3;
- (TISupplementalLexiconControllerDelegate)delegate;
- (_LXLexicon)activePhraseLexicon;
- (_LXLexicon)activeWordLexicon;
- (id)identifiersOfItemsEqualToMecrabraCandidate:(id)a3;
- (id)lexiconIdentifiers;
- (id)lexiconWithIdentifier:(unint64_t)a3;
- (int)connectionIdentifier;
- (void)_sendActiveLexiconDidChangeNotification;
- (void)addLexicon:(id)a3;
- (void)clearActiveLexicon;
- (void)removeLexiconWithIdentifier:(unint64_t)a3;
- (void)setActiveLexiconWithIdentifier:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TISupplementalLexiconController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_processExitDispatchSource, 0);
  objc_storeStrong((id *)&self->_entityStores, 0);

  objc_storeStrong((id *)&self->_lexicons, 0);
}

- (void)setDelegate:(id)a3
{
}

- (TISupplementalLexiconControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TISupplementalLexiconControllerDelegate *)WeakRetained;
}

- (int)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (id)identifiersOfItemsEqualToMecrabraCandidate:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_activeLexiconIdentifier)
  {
    v5 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    lexicons = self->_lexicons;
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_activeLexiconIdentifier, 0);
    v8 = [(NSMutableDictionary *)lexicons objectForKeyedSubscript:v7];
    v9 = [v8 items];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v14, "core_isEqualToMecabraCandidate:", v4))
          {
            v15 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "identifier"));
            [v5 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }

    v16 = [v5 allObjects];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (id)lexiconWithIdentifier:(unint64_t)a3
{
  lexicons = self->_lexicons;
  id v4 = [NSNumber numberWithUnsignedLongLong:a3];
  v5 = [(NSMutableDictionary *)lexicons objectForKeyedSubscript:v4];

  return v5;
}

- (_LXLexicon)activePhraseLexicon
{
  if (!self->_activeLexiconIdentifier) {
    return 0;
  }
  entityStores = self->_entityStores;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v4 = [(NSMutableDictionary *)entityStores objectForKeyedSubscript:v3];
  v5 = [v4 phraseLexicon];
  v6 = (_LXLexicon *)[v5 getLexiconImplementation];

  return v6;
}

- (_LXLexicon)activeWordLexicon
{
  if (!self->_activeLexiconIdentifier) {
    return 0;
  }
  entityStores = self->_entityStores;
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  id v4 = [(NSMutableDictionary *)entityStores objectForKeyedSubscript:v3];
  v5 = [v4 wordLexicon];
  v6 = (_LXLexicon *)[v5 getLexiconImplementation];

  return v6;
}

- (void)clearActiveLexicon
{
  v3 = TISupplementalLexiconOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_INFO, "Clear active lexicon", v6, 2u);
  }

  id v4 = [(TISupplementalLexiconController *)self activeLexicon];
  self->_activeLexiconIdentifier = 0;
  v5 = [(TISupplementalLexiconController *)self activeLexicon];

  if (v4 != v5) {
    -[TISupplementalLexiconController _sendActiveLexiconDidChangeNotification](self);
  }
}

- (void)_sendActiveLexiconDidChangeNotification
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = TISupplementalLexiconOSLogFacility();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = [a1 activeLexicon];
      *(_DWORD *)buf = 134217984;
      uint64_t v11 = [v3 identifier];
      _os_log_impl(&dword_1E3F0E000, v2, OS_LOG_TYPE_INFO, "Active supplemental lexicon did change (active identifier=%llu)", buf, 0xCu);
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v5 = [a1 activeLexicon];
    if (v5)
    {
      v6 = objc_msgSend(a1, "activeLexicon", @"TIActiveLexiconDidChangeUserInfo_ActiveLexicon");
      v9 = v6;
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
      [v4 postNotificationName:@"TIActiveLexiconDidChangeNotification" object:a1 userInfo:v7];
    }
    else
    {
      [v4 postNotificationName:@"TIActiveLexiconDidChangeNotification" object:a1 userInfo:MEMORY[0x1E4F1CC08]];
    }
  }
}

- (void)setActiveLexiconWithIdentifier:(unint64_t)a3
{
  id v6 = [(TISupplementalLexiconController *)self activeLexicon];
  self->_activeLexiconIdentifier = a3;
  id v5 = [(TISupplementalLexiconController *)self activeLexicon];

  if (v6 != v5) {
    -[TISupplementalLexiconController _sendActiveLexiconDidChangeNotification](self);
  }
}

- (TISupplementalLexicon)activeLexicon
{
  if (self->_activeLexiconIdentifier)
  {
    lexicons = self->_lexicons;
    v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
    id v4 = [(NSMutableDictionary *)lexicons objectForKeyedSubscript:v3];
  }
  else
  {
    id v4 = 0;
  }

  return (TISupplementalLexicon *)v4;
}

- (id)lexiconIdentifiers
{
  return (id)[(NSMutableDictionary *)self->_entityStores allKeys];
}

- (void)removeLexiconWithIdentifier:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = TISupplementalLexiconOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    unint64_t v13 = a3;
    _os_log_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_INFO, "Remove supplemental lexicon with identifier=%llu", (uint8_t *)&v12, 0xCu);
  }

  id v6 = [(TISupplementalLexiconController *)self activeLexicon];
  if (self->_activeLexiconIdentifier == a3) {
    self->_activeLexiconIdentifier = 0;
  }
  entityStores = self->_entityStores;
  uint64_t v8 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)entityStores removeObjectForKey:v8];

  lexicons = self->_lexicons;
  uint64_t v10 = [NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableDictionary *)lexicons removeObjectForKey:v10];

  uint64_t v11 = [(TISupplementalLexiconController *)self activeLexicon];

  if (v6 != v11) {
    -[TISupplementalLexiconController _sendActiveLexiconDidChangeNotification](self);
  }
}

- (void)addLexicon:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = TISupplementalLexiconOSLogFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 identifier];
    v7 = [v4 items];
    *(_DWORD *)buf = 134218240;
    uint64_t v17 = v6;
    __int16 v18 = 2048;
    uint64_t v19 = [v7 count];
    _os_log_impl(&dword_1E3F0E000, v5, OS_LOG_TYPE_INFO, "Add supplemental lexicon with identifier=%llu (#items=%lu)", buf, 0x16u);
  }
  uint64_t v8 = [(TISupplementalLexiconController *)self activeLexicon];
  if (self->_needsAtSignSearchPrefixQuirk && ![v4 searchPrefixes]) {
    [v4 setSearchPrefixes:1];
  }
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"Supplemental-%d-%llu", self->_connectionIdentifier, objc_msgSend(v4, "identifier"));
  uint64_t v10 = TICreateNamedEntityStore(v9, v4);
  entityStores = self->_entityStores;
  int v12 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  [(NSMutableDictionary *)entityStores setObject:v10 forKeyedSubscript:v12];

  lexicons = self->_lexicons;
  uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  [(NSMutableDictionary *)lexicons setObject:v4 forKeyedSubscript:v14];

  v15 = [(TISupplementalLexiconController *)self activeLexicon];

  if (v8 != v15) {
    -[TISupplementalLexiconController _sendActiveLexiconDidChangeNotification](self);
  }
}

- (TISupplementalLexiconController)initWithConnection:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TISupplementalLexiconController;
  id v5 = [(TISupplementalLexiconController *)&v24 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    uint64_t v8 = TINSXPCConnectionCodeSigningIdentifier(v4);
    *((unsigned char *)v5 + 40) = [v8 isEqualToString:@"com.apple.MobileSMS"];

    if (v4) {
      [v4 auditToken];
    }
    else {
      memset(&atoken, 0, sizeof(atoken));
    }
    *((_DWORD *)v5 + 11) = audit_token_to_pidversion(&atoken);
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v9;

    if (v4) {
      [v4 auditToken];
    }
    else {
      memset(&v22, 0, sizeof(v22));
    }
    pid_t v11 = audit_token_to_pid(&v22);
    dispatch_source_t v12 = dispatch_source_create(MEMORY[0x1E4F14470], v11, 0x80000000uLL, MEMORY[0x1E4F14428]);
    unint64_t v13 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v12;

    objc_initWeak(&location, v5);
    uint64_t v14 = *((void *)v5 + 4);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __54__TISupplementalLexiconController_initWithConnection___block_invoke;
    handler[3] = &unk_1E6E2BCF8;
    objc_copyWeak(&v20, &location);
    id v15 = v5;
    id v19 = v15;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_resume(*((dispatch_object_t *)v5 + 4));
    id v16 = v15;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return (TISupplementalLexiconController *)v5;
}

void __54__TISupplementalLexiconController_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    dispatch_source_cancel(WeakRetained[4]);
    dispatch_source_t v3 = v6[4];
    v6[4] = 0;

    v6[3] = 0;
    [v6[2] removeAllObjects];
    id v4 = objc_loadWeakRetained((id *)v6 + 6);

    id WeakRetained = v6;
    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)v6 + 6);
      [v5 supplementalLexiconControllerProcessDidTerminate:*(void *)(a1 + 32)];

      id WeakRetained = v6;
    }
  }
}

@end