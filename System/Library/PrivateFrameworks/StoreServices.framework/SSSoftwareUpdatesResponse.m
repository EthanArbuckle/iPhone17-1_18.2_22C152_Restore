@interface SSSoftwareUpdatesResponse
- (BOOL)isFailed;
- (NSArray)updateItems;
- (NSError)error;
- (SSSoftwareUpdatesResponse)initWithError:(id)a3;
- (SSSoftwareUpdatesResponse)initWithXPCEncoding:(id)a3;
- (id)copyUpdateItemDictionaries;
- (id)copyXPCEncoding;
- (id)description;
- (void)dealloc;
- (void)setUpdateItemsWithItemDictionaries:(id)a3;
@end

@implementation SSSoftwareUpdatesResponse

- (SSSoftwareUpdatesResponse)initWithError:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SSSoftwareUpdatesResponse;
  v4 = [(SSSoftwareUpdatesResponse *)&v7 init];
  if (v4)
  {
    v5 = (NSError *)a3;
    v4->_error = v5;
    v4->_failed = v5 != 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSoftwareUpdatesResponse;
  [(SSSoftwareUpdatesResponse *)&v3 dealloc];
}

- (NSError)error
{
  v2 = self->_error;
  return v2;
}

- (BOOL)isFailed
{
  return self->_failed;
}

- (NSArray)updateItems
{
  v2 = self->_updateItems;
  return v2;
}

- (id)description
{
  if (self->_failed)
  {
    v4.receiver = self;
    v4.super_class = (Class)SSSoftwareUpdatesResponse;
    return (id)[NSString stringWithFormat:@"%@: Failed with error: %@", -[SSSoftwareUpdatesResponse description](&v4, sel_description), self->_error];
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)SSSoftwareUpdatesResponse;
    return (id)[NSString stringWithFormat:@"%@: Found %ld updates", -[SSSoftwareUpdatesResponse description](&v3, sel_description), -[NSArray count](self->_updateItems, "count")];
  }
}

- (id)copyUpdateItemDictionaries
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  updateItems = self->_updateItems;
  uint64_t v5 = [(NSArray *)updateItems countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(updateItems);
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "rawItemDictionary"));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)updateItems countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  return v3;
}

- (void)setUpdateItemsWithItemDictionaries:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v11 = [[SSItem alloc] initWithItemDictionary:v10];
          if (v11)
          {
            long long v12 = v11;
            [v5 addObject:v11];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  self->_updateItems = (NSArray *)[v5 copy];
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetCFObject(v3, "0", (__CFString *)self->_error);
  xpc_dictionary_set_BOOL(v3, "1", self->_failed);
  objc_super v4 = [(SSSoftwareUpdatesResponse *)self copyUpdateItemDictionaries];
  SSXPCDictionarySetCFObject(v3, "2", v4);

  return v3;
}

- (SSSoftwareUpdatesResponse)initWithXPCEncoding:(id)a3
{
  if (a3 && MEMORY[0x1A62689E0](a3, a2) == MEMORY[0x1E4F14590])
  {
    v8.receiver = self;
    v8.super_class = (Class)SSSoftwareUpdatesResponse;
    id v5 = [(SSSoftwareUpdatesResponse *)&v8 init];
    if (v5)
    {
      v5->_error = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithXPCEncoding:", xpc_dictionary_get_value(a3, "0"));
      v5->_failed = xpc_dictionary_get_BOOL(a3, "1");
      objc_opt_class();
      CFArrayRef v7 = SSXPCDictionaryCopyCFObjectWithClass(a3, "2");
      [(SSSoftwareUpdatesResponse *)v5 setUpdateItemsWithItemDictionaries:v7];
    }
  }
  else
  {

    return 0;
  }
  return v5;
}

@end