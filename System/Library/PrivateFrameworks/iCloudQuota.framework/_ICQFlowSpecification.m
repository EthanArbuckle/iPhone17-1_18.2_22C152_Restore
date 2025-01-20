@interface _ICQFlowSpecification
- (NSDictionary)pagesByIdentifier;
- (_ICQAlertSpecification)startAlert;
- (_ICQFlowSpecification)initWithPages:(id)a3;
- (_ICQPageSpecification)startPage;
- (void)setStartAlert:(id)a3;
@end

@implementation _ICQFlowSpecification

- (_ICQFlowSpecification)initWithPages:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_ICQFlowSpecification;
  v5 = [(_ICQFlowSpecification *)&v23 init];
  if (v5)
  {
    if ([v4 count])
    {
      uint64_t v6 = [v4 objectAtIndexedSubscript:0];
      startPage = v5->_startPage;
      v5->_startPage = (_ICQPageSpecification *)v6;
    }
    else
    {
      startPage = v5->_startPage;
      v5->_startPage = 0;
    }

    v8 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "pageIdentifier", (void)v19);
          [v8 setObject:v14 forKey:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }

    uint64_t v16 = [v8 copy];
    pagesByIdentifier = v5->_pagesByIdentifier;
    v5->_pagesByIdentifier = (NSDictionary *)v16;
  }
  return v5;
}

- (_ICQPageSpecification)startPage
{
  return self->_startPage;
}

- (NSDictionary)pagesByIdentifier
{
  return self->_pagesByIdentifier;
}

- (_ICQAlertSpecification)startAlert
{
  return self->_startAlert;
}

- (void)setStartAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startAlert, 0);
  objc_storeStrong((id *)&self->_pagesByIdentifier, 0);
  objc_storeStrong((id *)&self->_startPage, 0);
}

@end