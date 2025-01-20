@interface CACLanguageModel
- (CACLanguageModel)initWithText:(id)a3 identifier:(id)a4 attributes:(id)a5;
- (NSArray)children;
- (NSMutableDictionary)attributes;
- (NSString)identifier;
- (NSString)text;
- (__RXLanguageObject)createRXLanguageObjectRef;
- (id)_initWithLanguageModel:(id)a3;
- (id)_mutableAttributes;
- (id)_mutableChildren;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForAttribute:(id)a3;
- (void)addChildLanguageModel:(id)a3;
- (void)logTreeDescriptionWithLevel:(int)a3;
- (void)removeAllChildren;
- (void)setIdentifier:(id)a3;
- (void)setObject:(id)a3 forAttribute:(id)a4;
- (void)setText:(id)a3;
@end

@implementation CACLanguageModel

- (CACLanguageModel)initWithText:(id)a3 identifier:(id)a4 attributes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CACLanguageModel *)self init];
  v12 = v11;
  if (v11)
  {
    [(CACLanguageModel *)v11 setText:v8];
    [(CACLanguageModel *)v12 setIdentifier:v9];
    if ([v10 count])
    {
      v13 = [(CACLanguageModel *)v12 _mutableAttributes];
      [v13 addEntriesFromDictionary:v10];
    }
  }

  return v12;
}

- (id)_initWithLanguageModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 text];
  v6 = [v4 identifier];
  v7 = [v4 attributes];

  id v8 = [(CACLanguageModel *)self initWithText:v5 identifier:v6 attributes:v7];
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 _initWithLanguageModel:self];
}

- (id)_mutableAttributes
{
  v2 = self;
  objc_sync_enter(v2);
  attributes = v2->_attributes;
  if (!attributes)
  {
    uint64_t v4 = objc_opt_new();
    v5 = v2->_attributes;
    v2->_attributes = (NSMutableDictionary *)v4;

    attributes = v2->_attributes;
  }
  v6 = attributes;
  objc_sync_exit(v2);

  return v6;
}

- (id)_mutableChildren
{
  v2 = self;
  objc_sync_enter(v2);
  children = v2->_children;
  if (!children)
  {
    uint64_t v4 = objc_opt_new();
    v5 = v2->_children;
    v2->_children = (NSMutableArray *)v4;

    children = v2->_children;
  }
  v6 = children;
  objc_sync_exit(v2);

  return v6;
}

- (void)addChildLanguageModel:(id)a3
{
  id v4 = a3;
  id v5 = [(CACLanguageModel *)self _mutableChildren];
  [v5 addObject:v4];
}

- (void)removeAllChildren
{
}

- (id)objectForAttribute:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_attributes objectForKey:a3];
}

- (void)setObject:(id)a3 forAttribute:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CACLanguageModel *)self _mutableAttributes];
  [v8 setObject:v7 forKey:v6];
}

- (__RXLanguageObject)createRXLanguageObjectRef
{
  v3 = +[CACSpeechSystem speechSystem];
  id v4 = (__RXLanguageObject *)[v3 createRXLanguageObjectRefFromCACLanguageModel:self];

  return v4;
}

- (void)logTreeDescriptionWithLevel:(int)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = objc_opt_new();
  if (a3 >= 1)
  {
    int v6 = a3;
    do
    {
      [v5 appendString:@">"];
      --v6;
    }
    while (v6);
  }
  id v7 = CACLogGeneral();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(CACLanguageModel *)self description];
    *(_DWORD *)buf = 138412546;
    v21 = v5;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_impl(&dword_238377000, v7, OS_LOG_TYPE_DEFAULT, "%@%@", buf, 0x16u);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = self->_children;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    uint64_t v13 = (a3 + 1);
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "logTreeDescriptionWithLevel:", v13, (void)v15);
      }
      while (v11 != v14);
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_children count])
  {
    v3 = objc_opt_new();
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = self->_children;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) description];
          [v3 appendFormat:@"%@\n", v9];
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
  else
  {
    v3 = [NSString stringWithFormat:@"%p '%@' ID: %@ Attributes: %@", self, self->_text, self->_identifier, self->_attributes];
  }
  return v3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setText:(id)a3
{
}

- (NSMutableDictionary)attributes
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)children
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end