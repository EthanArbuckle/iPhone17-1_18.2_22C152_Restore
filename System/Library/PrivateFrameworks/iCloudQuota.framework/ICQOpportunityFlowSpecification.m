@interface ICQOpportunityFlowSpecification
- (ICQOpportunityFlowSpecification)initWithServerDictionary:(id)a3;
- (NSArray)actions;
- (NSString)message;
- (NSString)title;
- (_ICQOpportunityBubbleImageDetails)imageDetails;
- (void)makeActionsFromServerDict:(id)a3;
- (void)makeMessageFromServerDict:(id)a3;
- (void)setActions:(id)a3;
- (void)setImageDetails:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation ICQOpportunityFlowSpecification

- (ICQOpportunityFlowSpecification)initWithServerDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICQOpportunityFlowSpecification;
  v5 = [(ICQOpportunityFlowSpecification *)&v19 init];
  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"title"];
  title = v5->_title;
  v5->_title = (NSString *)v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!v5->_title)
    {
LABEL_14:
      v11 = 0;
      goto LABEL_15;
    }
    v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      Name = class_getName(v12);
      v14 = v5->_title;
      *(_DWORD *)buf = 136315394;
      v21 = Name;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
LABEL_13:

    goto LABEL_14;
  }
  v8 = [v4 objectForKeyedSubscript:@"imageDetails"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v8)
    {
      v15 = _ICQGetLogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class();
        v17 = class_getName(v16);
        *(_DWORD *)buf = 136315394;
        v21 = v17;
        __int16 v22 = 2112;
        v23 = v8;
        _os_log_impl(&dword_1D5851000, v15, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
      }
    }
    goto LABEL_13;
  }
  v9 = [[_ICQOpportunityBubbleImageDetails alloc] initWithServerDictionary:v8];
  imageDetails = v5->_imageDetails;
  v5->_imageDetails = v9;

  [(ICQOpportunityFlowSpecification *)v5 makeMessageFromServerDict:v4];
  [(ICQOpportunityFlowSpecification *)v5 makeActionsFromServerDict:v4];

LABEL_5:
  v11 = v5;
LABEL_15:

  return v11;
}

- (void)makeMessageFromServerDict:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"message"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)&self->_message, v5);
  }
  else
  {
    uint64_t v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412546;
      v8 = @"message";
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl(&dword_1D5851000, v6, OS_LOG_TYPE_DEFAULT, "Missing message property %@ in opportunityBubble: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)makeActionsFromServerDict:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"actions"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v27 = self;
    v28 = v5;
    id v29 = v4;
    id v6 = v5;
    int v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v8 = v6;
    uint64_t v33 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v33)
    {
      uint64_t v32 = *(void *)v36;
      v30 = v8;
      v31 = v7;
      while (2)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v36 != v32) {
            objc_enumerationMutation(v8);
          }
          id v10 = *(__CFString **)(*((void *)&v35 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v26 = _ICQGetLogSystem();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v10;
              _os_log_impl(&dword_1D5851000, v26, OS_LOG_TYPE_DEFAULT, "Malformed actions property in opportunityBubble: %@", buf, 0xCu);
            }

            actions = (NSArray *)v8;
            v5 = v28;
            id v4 = v29;
            v25 = v31;
            goto LABEL_28;
          }
          uint64_t v11 = v10;
          v12 = [(__CFString *)v11 objectForKeyedSubscript:@"btnTitle"];
          if (v12)
          {
            v13 = [(__CFString *)v11 objectForKeyedSubscript:@"btnAction"];
            uint64_t v14 = _ICQActionForServerActionString(v13);
            v15 = [(__CFString *)v11 objectForKeyedSubscript:@"btnActParams"];
            v16 = _ICQActionParametersForServerActionParameters(v14, v15, 0);
            v17 = [(__CFString *)v11 objectForKeyedSubscript:@"btnId"];
            v34 = v13;
            if (v17)
            {
              if (v16) {
                v18 = (void *)[v16 mutableCopy];
              }
              else {
                v18 = objc_opt_new();
              }
              v20 = v18;
              [v18 setObject:v17 forKey:@"ServerLinkId"];
              v21 = [(__CFString *)v11 objectForKeyedSubscript:@"btnDefault"];
              if (v21)
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  [v20 setObject:v21 forKeyedSubscript:@"btnDefault"];
                }
              }
              uint64_t v22 = [v20 copy];

              v16 = (void *)v22;
              v8 = v30;
              int v7 = v31;
            }
            objc_super v19 = +[ICQLink linkWithText:v12 options:0 action:v14 parameters:v16];
            [v7 addObject:v19];
          }
          else
          {
            objc_super v19 = _ICQGetLogSystem();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v11;
              _os_log_impl(&dword_1D5851000, v19, OS_LOG_TYPE_DEFAULT, "Missing title from server action dictionary %@", buf, 0xCu);
            }
          }
        }
        uint64_t v33 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }

    uint64_t v23 = [v7 copy];
    actions = v27->_actions;
    v27->_actions = (NSArray *)v23;
    v25 = v7;
    v5 = v28;
    id v4 = v29;
LABEL_28:
  }
  else
  {
    v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v41 = @"actions";
      __int16 v42 = 2112;
      id v43 = v4;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Missing message property %@ in opportunityBubble: %@", buf, 0x16u);
    }
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (_ICQOpportunityBubbleImageDetails)imageDetails
{
  return self->_imageDetails;
}

- (void)setImageDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageDetails, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end