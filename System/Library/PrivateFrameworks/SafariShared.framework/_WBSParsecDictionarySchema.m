@interface _WBSParsecDictionarySchema
- (BOOL)_validateChild:(id)a3 ofParent:(id)a4 withParentAssociatedError:(id)a5 errorHandler:(id)a6;
- (NSDictionary)keysToSchemata;
- (_WBSParsecDictionarySchema)initWithSchemaDictionary:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5;
- (void)setKeysToSchemata:(id)a3;
@end

@implementation _WBSParsecDictionarySchema

- (_WBSParsecDictionarySchema)initWithSchemaDictionary:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  v16.receiver = self;
  v16.super_class = (Class)_WBSParsecDictionarySchema;
  v11 = [(WBSParsecSchema *)&v16 _initWithExpectedClass:v10 associatedError:v9 isOptional:v5];

  if (v11)
  {
    uint64_t v12 = [v8 copy];
    keysToSchemata = v11->_keysToSchemata;
    v11->_keysToSchemata = (NSDictionary *)v12;

    v14 = v11;
  }

  return v11;
}

- (BOOL)_validateChild:(id)a3 ofParent:(id)a4 withParentAssociatedError:(id)a5 errorHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v31.receiver = self;
  v31.super_class = (Class)_WBSParsecDictionarySchema;
  if ([(WBSParsecSchema *)&v31 _validateChild:v10 ofParent:v11 withParentAssociatedError:v12 errorHandler:v13])
  {
    if (v10 || ![(WBSParsecSchema *)self isOptional])
    {
      uint64_t v15 = [(WBSParsecSchema *)self associatedError];
      objc_super v16 = (void *)v15;
      if (v15) {
        v17 = (void *)v15;
      }
      else {
        v17 = v12;
      }
      id v18 = v17;
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      char v30 = 1;
      keysToSchemata = self->_keysToSchemata;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __93___WBSParsecDictionarySchema__validateChild_ofParent_withParentAssociatedError_errorHandler___block_invoke;
      v22[3] = &unk_1E5C9E5F8;
      id v23 = v10;
      id v20 = v18;
      id v24 = v20;
      id v25 = v13;
      v26 = &v27;
      [(NSDictionary *)keysToSchemata enumerateKeysAndObjectsUsingBlock:v22];
      BOOL v14 = *((unsigned char *)v28 + 24) != 0;

      _Block_object_dispose(&v27, 8);
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (NSDictionary)keysToSchemata
{
  return self->_keysToSchemata;
}

- (void)setKeysToSchemata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end