@interface SOSRecipient
+ (id)handlesFromRecipients:(id)a3;
+ (id)reasonsDictionaryFromRecipients:(id)a3;
- (NSString)handle;
- (id)description;
- (unint64_t)reasons;
- (void)setHandle:(id)a3;
- (void)setReasons:(unint64_t)a3;
@end

@implementation SOSRecipient

+ (id)handlesFromRecipients:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "handle", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v7);
  }

  v11 = sos_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v4;
    _os_log_impl(&dword_1B3A94000, v11, OS_LOG_TYPE_DEFAULT, "sosRecipient handles: %@", buf, 0xCu);
  }

  return v4;
}

+ (id)reasonsDictionaryFromRecipients:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "reasons", (void)v15));
        v12 = [v10 handle];
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v7);
  }

  long long v13 = sos_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v4;
    _os_log_impl(&dword_1B3A94000, v13, OS_LOG_TYPE_DEFAULT, "sosRecipient reasonsDict: %@", buf, 0xCu);
  }

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"SOSRecipient: handle %@ reasons %tu", self->_handle, self->_reasons];
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (unint64_t)reasons
{
  return self->_reasons;
}

- (void)setReasons:(unint64_t)a3
{
  self->_reasons = a3;
}

- (void).cxx_destruct
{
}

@end