@interface _UIDefinitionValue
- (MAAsset)rawAsset;
- (NSAttributedString)definition;
- (NSString)localizedDictionaryName;
- (NSString)longDefinition;
- (NSString)term;
- (_UIDefinitionValue)initWithLocalizedDictionaryName:(id)a3 term:(id)a4 definition:(id)a5 longDefinition:(id)a6;
- (id)description;
- (void)setRawAsset:(id)a3;
@end

@implementation _UIDefinitionValue

- (_UIDefinitionValue)initWithLocalizedDictionaryName:(id)a3 term:(id)a4 definition:(id)a5 longDefinition:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)_UIDefinitionValue;
  v14 = [(_UIDefinitionValue *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    localizedDictionaryName = v14->_localizedDictionaryName;
    v14->_localizedDictionaryName = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    term = v14->_term;
    v14->_term = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    definition = v14->_definition;
    v14->_definition = (NSAttributedString *)v19;

    uint64_t v21 = [v13 copy];
    longDefinition = v14->_longDefinition;
    v14->_longDefinition = (NSString *)v21;
  }
  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@<%p>: localizedDictionaryName: %@, term: %@, definition: %@", v5, self, self->_localizedDictionaryName, self->_term, self->_definition];

  return v6;
}

- (NSString)localizedDictionaryName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)term
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSAttributedString)definition
{
  return (NSAttributedString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)longDefinition
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (MAAsset)rawAsset
{
  return self->_rawAsset;
}

- (void)setRawAsset:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawAsset, 0);
  objc_storeStrong((id *)&self->_longDefinition, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_term, 0);
  objc_storeStrong((id *)&self->_localizedDictionaryName, 0);
}

@end