@interface _WBSParsecArraySchema
- (BOOL)_validateChild:(id)a3 ofParent:(id)a4 withParentAssociatedError:(id)a5 errorHandler:(id)a6;
- (WBSParsecSchema)elementSchema;
- (_WBSParsecArraySchema)initWithElementSchema:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5;
- (void)setElementSchema:(id)a3;
@end

@implementation _WBSParsecArraySchema

- (_WBSParsecArraySchema)initWithElementSchema:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  v15.receiver = self;
  v15.super_class = (Class)_WBSParsecArraySchema;
  v12 = [(WBSParsecSchema *)&v15 _initWithExpectedClass:v11 associatedError:v10 isOptional:v5];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_elementSchema, a3);
    v13 = v12;
  }

  return v12;
}

- (BOOL)_validateChild:(id)a3 ofParent:(id)a4 withParentAssociatedError:(id)a5 errorHandler:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)_WBSParsecArraySchema;
  if ([(WBSParsecSchema *)&v32 _validateChild:v10 ofParent:v11 withParentAssociatedError:v12 errorHandler:v13])
  {
    uint64_t v14 = [(WBSParsecSchema *)self associatedError];
    v25 = (void *)v14;
    id v26 = v12;
    if (v14) {
      objc_super v15 = (void *)v14;
    }
    else {
      objc_super v15 = v12;
    }
    id v16 = v15;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v27 = v10;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      char v21 = 1;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          if (![(WBSParsecSchema *)self->_elementSchema _validateChild:*(void *)(*((void *)&v28 + 1) + 8 * i) ofParent:v17 withParentAssociatedError:v16 errorHandler:v13])
          {
            v23 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349312;
              id v34 = v17;
              __int16 v35 = 2050;
              id v36 = v11;
              _os_log_error_impl(&dword_1A6B5F000, v23, OS_LOG_TYPE_ERROR, "Array element schema validation failed on child %{public}p of parent %{public}p", buf, 0x16u);
            }
            char v21 = 0;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v19);
    }
    else
    {
      char v21 = 1;
    }

    id v12 = v26;
    id v10 = v27;
  }
  else
  {
    char v21 = 0;
  }

  return v21 & 1;
}

- (WBSParsecSchema)elementSchema
{
  return self->_elementSchema;
}

- (void)setElementSchema:(id)a3
{
}

- (void).cxx_destruct
{
}

@end