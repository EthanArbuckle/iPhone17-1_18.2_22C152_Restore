@interface ICQOpportunitySheetDetailsSpecification
- (NSDictionary)messagesInfo;
- (id)messageForKey:(id)a3;
- (void)makeMessageFromServerDict:(id)a3;
- (void)setMessagesInfo:(id)a3;
@end

@implementation ICQOpportunitySheetDetailsSpecification

- (void)makeMessageFromServerDict:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"message"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v20 = self;
    v21 = v5;
    id v22 = v4;
    id v6 = v5;
    v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "objectForKeyedSubscript:", @"key", v20);
          uint64_t v14 = [v12 objectForKeyedSubscript:@"format"];
          v15 = (void *)v14;
          if (v13) {
            BOOL v16 = v14 == 0;
          }
          else {
            BOOL v16 = 1;
          }
          if (!v16
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            [v23 setObject:v15 forKeyedSubscript:v13];
          }
          else
          {
            v17 = _ICQGetLogSystem();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v30 = (__CFString *)v7;
              _os_log_impl(&dword_1D5851000, v17, OS_LOG_TYPE_DEFAULT, "Malformed key/format properties in message property of opportunitySheet: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    uint64_t v18 = [v23 copy];
    messagesInfo = v20->_messagesInfo;
    v20->_messagesInfo = (NSDictionary *)v18;

    v5 = v21;
    id v4 = v22;
  }
  else
  {
    v7 = _ICQGetLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v30 = @"message";
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_1D5851000, v7, OS_LOG_TYPE_DEFAULT, "Missing message property %@ in opportunityBubble: %@", buf, 0x16u);
    }
  }
}

- (id)messageForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ICQOpportunitySheetDetailsSpecification *)self messagesInfo];
  id v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = [(ICQOpportunitySheetDetailsSpecification *)self messagesInfo];
    id v6 = [v7 objectForKeyedSubscript:@"default"];
  }
  return v6;
}

- (NSDictionary)messagesInfo
{
  return self->_messagesInfo;
}

- (void)setMessagesInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end