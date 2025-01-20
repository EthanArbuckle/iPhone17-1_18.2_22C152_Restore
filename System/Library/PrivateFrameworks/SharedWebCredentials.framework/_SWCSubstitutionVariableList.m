@interface _SWCSubstitutionVariableList
+ (BOOL)supportsSecureCoding;
+ (_SWCSubstitutionVariableList)cheapBuiltInSubstitutionVariableList;
+ (_SWCSubstitutionVariableList)expensiveBuiltInSubstitutionVariableList;
+ (_SWCSubstitutionVariableList)substitutionVariableListWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (_SWCSubstitutionVariableList)initWithCoder:(id)a3;
- (id)_descriptionDebug:(BOOL)a3 redacted:(BOOL)a4;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (unint64_t)count;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateSubstitutionVariablesWithBlock:(id)a3;
@end

@implementation _SWCSubstitutionVariableList

+ (_SWCSubstitutionVariableList)cheapBuiltInSubstitutionVariableList
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68___SWCSubstitutionVariableList_cheapBuiltInSubstitutionVariableList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB67B028 != -1) {
    dispatch_once(&qword_1EB67B028, block);
  }
  v2 = (void *)qword_1EB67B020;
  return (_SWCSubstitutionVariableList *)v2;
}

+ (_SWCSubstitutionVariableList)expensiveBuiltInSubstitutionVariableList
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72___SWCSubstitutionVariableList_expensiveBuiltInSubstitutionVariableList__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB67B038 != -1) {
    dispatch_once(&qword_1EB67B038, block);
  }
  v2 = (void *)qword_1EB67B030;
  return (_SWCSubstitutionVariableList *)v2;
}

+ (_SWCSubstitutionVariableList)substitutionVariableListWithDictionary:(id)a3
{
  v5 = (void *)MEMORY[0x1AD1157F0](a1, a2);
  if (_NSIsNSDictionary())
  {
    v6 = [a3 objectForKeyedSubscript:@"substitutionVariables"];
    if (_NSIsNSDictionary())
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __71___SWCSubstitutionVariableList_substitutionVariableListWithDictionary___block_invoke;
      v13[3] = &unk_1E5E51910;
      id v8 = v7;
      id v14 = v8;
      [v6 enumerateKeysAndObjectsUsingBlock:v13];
      if (qword_1EB67B048 != -1) {
        dispatch_once(&qword_1EB67B048, &__block_literal_global_250);
      }
      [v8 appendBytes:&byte_1EB67B019 length:SWCSubstitutionVariable::getSize((SWCSubstitutionVariable *)&byte_1EB67B019)];
      Instance = (char *)class_createInstance((Class)a1, [v8 length]);
      id v10 = v8;
      memcpy(Instance + 8, (const void *)[v10 bytes], objc_msgSend(v10, "length"));
    }
    else
    {
      Instance = 0;
    }

    v11 = Instance;
  }
  else
  {
    v11 = 0;
  }
  return (_SWCSubstitutionVariableList *)v11;
}

- (unint64_t)count
{
  variables = self->_variables;
  if (*(unsigned char *)self->_variables) {
    return 0;
  }
  unint64_t v3 = 0;
  do
  {
    ++v3;
    variables = (SWCSubstitutionVariable *)((char *)variables + SWCSubstitutionVariable::getSize(variables));
  }
  while ((*(unsigned char *)variables & 1) == 0);
  return v3;
}

- (void)enumerateSubstitutionVariablesWithBlock:(id)a3
{
  uint64_t v4 = 0;
  variables = self->_variables;
  char v9 = 0;
  do
  {
    if (*(unsigned char *)variables) {
      break;
    }
    v6 = (void *)MEMORY[0x1AD1157F0]();
    id v7 = SWCSubstitutionVariable::getNameNoCopy(variables);
    id v8 = SWCSubstitutionVariable::getValuesNoCopy(variables);
    (*((void (**)(id, void *, void *, uint64_t, char *))a3 + 2))(a3, v7, v8, v4, &v9);

    ++v4;
    variables = (SWCSubstitutionVariable *)((char *)variables + SWCSubstitutionVariable::getSize(variables));
  }
  while (!v9);
}

- (id)_descriptionDebug:(BOOL)a3 redacted:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v22 = a3;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21 = self;
  char v8 = (char)self->_variables[0];
  variables = self->_variables;
  if ((v8 & 1) == 0)
  {
    if (v22) {
      uint64_t v9 = 11;
    }
    else {
      uint64_t v9 = 10;
    }
    do
    {
      if (v4)
      {
        [v6 addObject:@"<private>"];
      }
      else
      {
        id v10 = (void *)MEMORY[0x1AD1157F0]();
        v11 = SWCSubstitutionVariable::getNameNoCopy(variables);
        v23 = v11;
        v12 = SWCSubstitutionVariable::getValuesNoCopy(variables);
        v24[0] = v12;
        v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];

        id v14 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v13 options:v9 error:0];
        if (v14)
        {
          v15 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
          [v6 addObject:v15];
        }
        else
        {
          [v6 addObject:@"?"];
        }
      }
      variables = (SWCSubstitutionVariable *)((char *)variables + SWCSubstitutionVariable::getSize(variables));
    }
    while ((*(unsigned char *)variables & 1) == 0);
  }
  if (v22)
  {
    id v16 = [NSString alloc];
    uint64_t v17 = objc_opt_class();
    v18 = [v6 componentsJoinedByString:@", "];
    v19 = (void *)[v16 initWithFormat:@"<%@ %p> %@", v17, v21, v18];
  }
  else
  {
    v19 = [v6 componentsJoinedByString:@", "];
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  char v6 = (char)self->_variables[0];
  variables = self->_variables;
  id v7 = (SWCSubstitutionVariable *)((char *)a3 + 8);
  size_t v8 = 0;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = variables;
    do
    {
      uint64_t Size = SWCSubstitutionVariable::getSize(v9);
      v8 += Size;
      uint64_t v9 = (SWCSubstitutionVariable *)((char *)v9 + Size);
    }
    while ((*(unsigned char *)v9 & 1) == 0);
  }
  if (*(unsigned char *)v7)
  {
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 0;
    v12 = v7;
    do
    {
      uint64_t v13 = SWCSubstitutionVariable::getSize(v12);
      v11 += v13;
      v12 = (SWCSubstitutionVariable *)((char *)v12 + v13);
    }
    while ((*(unsigned char *)v12 & 1) == 0);
  }
  return v8 == v11 && memcmp(variables, v7, v8) == 0;
}

- (unint64_t)hash
{
  variables = self->_variables;
  if (*(unsigned char *)self->_variables) {
    return 0;
  }
  unint64_t v3 = 0;
  do
  {
    unint64_t Size = SWCSubstitutionVariable::getSize(variables);
    v3 ^= std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100]((uint64_t *)variables, Size);
    variables = (SWCSubstitutionVariable *)((char *)variables + Size);
  }
  while ((*(unsigned char *)variables & 1) == 0);
  return v3;
}

- (id)description
{
  return [(_SWCSubstitutionVariableList *)self _descriptionDebug:0 redacted:0];
}

- (id)debugDescription
{
  return [(_SWCSubstitutionVariableList *)self _descriptionDebug:1 redacted:0];
}

- (id)redactedDescription
{
  return [(_SWCSubstitutionVariableList *)self _descriptionDebug:0 redacted:1];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5 = (void *)MEMORY[0x1AD1157F0](self, a2);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v8 = (char)self->_variables[0];
  variables = self->_variables;
  if ((v8 & 1) == 0)
  {
    do
    {
      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:variables length:SWCSubstitutionVariable::getSize(variables) freeWhenDone:0];
      if (v9) {
        [v6 addObject:v9];
      }

      variables = (SWCSubstitutionVariable *)((char *)variables + SWCSubstitutionVariable::getSize(variables));
    }
    while ((*(unsigned char *)variables & 1) == 0);
  }
  id v10 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v6 format:200 options:0 error:0];
  if (v10) {
    [a3 encodeObject:v10 forKey:@"substitutionVariableData"];
  }
}

- (_SWCSubstitutionVariableList)initWithCoder:(id)a3
{
  v29 = self;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD1157F0](self, a2);
  BOOL v4 = objc_msgSend(a3, "swc_decodeObjectOfClass:forKey:", objc_opt_class(), @"substitutionVariableData");
  v5 = v4;
  if (!v4)
  {

    id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
    v36[0] = @"Line";
    v36[1] = @"Function";
    v37[0] = &unk_1F0345848;
    id v27 = [NSString stringWithUTF8String:"-[_SWCSubstitutionVariableList initWithCoder:]"];
    v37[1] = v27;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
    v30 = objc_msgSend(v23, "initWithDomain:code:userInfo:", *MEMORY[0x1E4F281F8], 4865);
    objc_msgSend(a3, "failWithError:");
    BOOL v22 = 0;
LABEL_27:

    goto LABEL_28;
  }
  id v35 = 0;
  id v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v4 options:0 format:0 error:&v35];
  id v27 = v35;
  v28 = v6;
  if (v6)
  {
    if (_NSIsNSArray())
    {
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v42 count:16];
      if (!v8) {
        goto LABEL_22;
      }
      uint64_t v9 = *(void *)v32;
      while (1)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if (_NSIsNSData())
          {
            size_t v12 = [v11 length];
            uint64_t v13 = [v11 bytes];
            if (v12)
            {
              id v14 = (SWCSubstitutionVariable *)v13;
              if (v12 + 2 < 0x401)
              {
                v15 = (SWCSubstitutionVariable *)v43;
              }
              else
              {
                v15 = (SWCSubstitutionVariable *)malloc_type_malloc(v12 + 2, 0x7E3352D0uLL);
                if (!v15) {
                  continue;
                }
              }
              memcpy(v15, v14, v12);
              *(_WORD *)((char *)v15 + v12) = 0;
              uint64_t Size = SWCSubstitutionVariable::getSize(v15);
              if (v15 != (SWCSubstitutionVariable *)v43) {
                free(v15);
              }
              BOOL v17 = Size == v12;
              BOOL v4 = v5;
              if (v17)
              {
                v18 = SWCSubstitutionVariable::getValuesNoCopy(v14);
                v19 = SWCSubstitutionVariable::getNameNoCopy(v14);
                [v30 setObject:v18 forKeyedSubscript:v19];
              }
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v42 count:16];
        if (!v8)
        {
LABEL_22:

          v20 = objc_opt_class();
          v40 = @"substitutionVariables";
          v41 = v30;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          BOOL v22 = [v20 substitutionVariableListWithDictionary:v21];
          goto LABEL_26;
        }
      }
    }

    id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
    v38[0] = @"Line";
    v38[1] = @"Function";
    v39[0] = &unk_1F0345830;
    v30 = [NSString stringWithUTF8String:"-[_SWCSubstitutionVariableList initWithCoder:]"];
    v39[1] = v30;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
    v29 = (_SWCSubstitutionVariableList *)[v24 initWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v21];
    objc_msgSend(a3, "failWithError:");
    BOOL v22 = 0;
LABEL_26:

    goto LABEL_27;
  }

  [a3 failWithError:v27];
  BOOL v22 = 0;

LABEL_28:
  return v22;
}

@end