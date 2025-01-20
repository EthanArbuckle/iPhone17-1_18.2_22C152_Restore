@interface _SWCPattern
+ (id)_debug:(BOOL)a3 descriptionOfStorage:(const SWCPatternStorage *)a4 forObject:(id)a5 redacted:(BOOL)a6;
+ (id)_normalizedURLPath:(id)a3;
+ (id)new;
- (BOOL)isBlocking;
- (BOOL)isCaseSensitive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPercentEncoded;
- (NSString)requiredEntitlement;
- (_SWCPattern)init;
- (_SWCPattern)initWithDictionary:(id)a3 defaults:(id)a4;
- (_SWCPattern)initWithPathPattern:(id)a3 defaults:(id)a4;
- (const)storage;
- (id)_initWithPatternStorageNoCopy:(const SWCPatternStorage *)a3 freeWhenDone:(BOOL)a4;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (unint64_t)evaluateWithURLComponents:(id)a3 substitutionVariables:(id)a4 auditToken:(id *)a5;
- (unint64_t)hash;
- (void)dealloc;
- (void)setStorage:(const SWCPatternStorage *)a3;
@end

@implementation _SWCPattern

+ (id)new
{
}

- (_SWCPattern)init
{
}

- (_SWCPattern)initWithDictionary:(id)a3 defaults:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1AD1157F0](self, a2);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if (!_NSIsNSDictionary())
  {
    char v11 = 0;
    goto LABEL_65;
  }
  v9 = [a3 objectForKeyedSubscript:@"/"];
  if (!v9)
  {
    v9 = [a4 objectForKeyedSubscript:@"/"];
    if (!v9)
    {
      id v10 = 0;
      goto LABEL_10;
    }
  }
  if (!_NSIsNSString())
  {
    char v11 = 0;
    id v10 = v9;
    goto LABEL_11;
  }
  id v10 = +[_SWCPattern _normalizedURLPath:v9];

  SWCGetFastUTF8String<1024ul>((uint64_t)&v47, v10, v50);
  if (!v49)
  {
LABEL_10:
    char v11 = 0;
    goto LABEL_11;
  }
  [v8 appendBytes:v47 length:v48];
  [v8 appendBytes:"" length:1];
  char v11 = 2;
LABEL_11:

  v12 = [a3 objectForKeyedSubscript:@"#"];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [a4 objectForKeyedSubscript:@"#"];
  }
  v15 = v14;

  if (v15)
  {
    if (_NSIsNSString())
    {
      SWCGetFastUTF8String<1024ul>((uint64_t)&v47, v15, v50);
      if (v49)
      {
        [v8 appendBytes:v47 length:v48];
        [v8 appendBytes:"" length:1];
        v11 |= 4u;
      }
    }
  }
  v16 = [a3 objectForKeyedSubscript:@"?"];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [a4 objectForKeyedSubscript:@"?"];
  }
  v19 = v18;

  if (v19)
  {
    if (_NSIsNSString())
    {
      SWCGetFastUTF8String<1024ul>((uint64_t)&v47, v19, v50);
      if (v49)
      {
        [v8 appendBytes:v47 length:v48];
        [v8 appendBytes:"" length:1];
        v11 |= 8u;
      }
    }
    else if (_NSIsNSDictionary())
    {
      v20 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v19 options:8 error:0];
      v21 = v20;
      if (v20)
      {
        v22 = objc_msgSend(v20, "subdataWithRange:", 1, objc_msgSend(v20, "length") - 2);

        [v8 appendData:v22];
        [v8 appendBytes:"" length:1];
        v11 |= 0x10u;
      }
      else
      {
        v22 = 0;
      }
    }
  }
  v23 = [a3 objectForKeyedSubscript:@"requiredEntitlement"];
  v24 = v23;
  if (v23)
  {
    id v25 = v23;
  }
  else
  {
    id v25 = [a4 objectForKeyedSubscript:@"requiredEntitlement"];
  }
  v26 = v25;

  if (v26)
  {
    if (_NSIsNSString())
    {
      SWCGetFastUTF8String<1024ul>((uint64_t)&v47, v26, v50);
      if (v49)
      {
        [v8 appendBytes:v47 length:v48];
        [v8 appendBytes:"" length:1];
        v11 |= 0x80u;
      }
    }
  }
  v27 = [a3 objectForKeyedSubscript:@"exclude"];
  v28 = v27;
  if (v27)
  {
    id v29 = v27;
  }
  else
  {
    id v29 = [a4 objectForKeyedSubscript:@"exclude"];
  }
  v30 = v29;

  if (v30)
  {
    if (objc_opt_respondsToSelector()) {
      char v31 = [v30 BOOLValue];
    }
    else {
      char v31 = 0;
    }
    char v11 = v11 & 0xFE | v31;
  }
  v32 = [a3 objectForKeyedSubscript:@"caseSensitive"];
  v33 = v32;
  if (v32)
  {
    id v34 = v32;
  }
  else
  {
    id v34 = [a4 objectForKeyedSubscript:@"caseSensitive"];
  }
  v35 = v34;

  if (v35)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([v35 BOOLValue]) {
        char v36 = 0;
      }
      else {
        char v36 = 32;
      }
    }
    else
    {
      char v36 = 32;
    }
    char v11 = v36 | v11 & 0xDF;
  }
  v37 = [a3 objectForKeyedSubscript:@"percentEncoded"];
  v38 = v37;
  if (v37)
  {
    id v39 = v37;
  }
  else
  {
    id v39 = [a4 objectForKeyedSubscript:@"percentEncoded"];
  }
  v40 = v39;

  if (v40)
  {
    if (objc_opt_respondsToSelector())
    {
      if ([v40 BOOLValue]) {
        char v41 = 0;
      }
      else {
        char v41 = 64;
      }
    }
    else
    {
      char v41 = 64;
    }
    char v11 = v41 | v11 & 0xBF;
  }
LABEL_65:
  size_t v42 = [v8 length];
  v43 = malloc_type_malloc(v42 + 1, 0x4C357F91uLL);
  v44 = v43;
  if (v43)
  {
    unsigned char *v43 = v11;
    id v45 = v8;
    memcpy(v44 + 1, (const void *)[v45 bytes], v42);

    return (_SWCPattern *)[(_SWCPattern *)self _initWithPatternStorageNoCopy:v44 freeWhenDone:1];
  }
  else
  {

    return 0;
  }
}

- (_SWCPattern)initWithPathPattern:(id)a3 defaults:(id)a4
{
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (_NSIsNSString())
  {
    id v8 = [v6 uppercaseString];
    int v9 = [v8 hasPrefix:@"NOT "];

    if (v9)
    {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"exclude"];
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"caseSensitive"];
      uint64_t v10 = [v6 substringFromIndex:objc_msgSend(@"NOT ", "length")];

      id v6 = (id)v10;
    }
    [v7 setObject:v6 forKeyedSubscript:@"/"];
  }
  char v11 = [(_SWCPattern *)self initWithDictionary:v7 defaults:a4];

  return v11;
}

- (void)dealloc
{
  if (self->_freeWhenDone) {
    free((void *)self->_storage);
  }
  v3.receiver = self;
  v3.super_class = (Class)_SWCPattern;
  [(_SWCPattern *)&v3 dealloc];
}

- (BOOL)isBlocking
{
  v2 = [(_SWCPattern *)self storage];
  if (v2) {
    LOBYTE(v2) = *(unsigned char *)v2 & 1;
  }
  return (char)v2;
}

- (BOOL)isCaseSensitive
{
  v2 = [(_SWCPattern *)self storage];
  if (v2) {
    LOBYTE(v2) = (*(unsigned char *)v2 & 0x20) == 0;
  }
  return (char)v2;
}

- (BOOL)isPercentEncoded
{
  v2 = [(_SWCPattern *)self storage];
  if (v2) {
    LOBYTE(v2) = (*(unsigned char *)v2 & 0x40) == 0;
  }
  return (char)v2;
}

- (NSString)requiredEntitlement
{
  v2 = [(_SWCPattern *)self storage];
  if (v2)
  {
    cStrings = v2->cStrings;
    unsigned int v4 = *(unsigned char *)v2;
    if ((v4 & 2) != 0) {
      cStrings += strlen(v2->cStrings) + 1;
    }
    if ((v4 & 4) != 0) {
      cStrings += strlen(cStrings) + 1;
    }
    if (((v4 >> 3) & 3) - 1 <= 1) {
      cStrings += strlen(cStrings) + 1;
    }
    if ((v4 & 0x80) != 0) {
      v5 = (void *)[[NSString alloc] initWithBytesNoCopy:cStrings length:strlen(cStrings) encoding:4 freeWhenDone:0];
    }
    else {
      v5 = 0;
    }
    id v6 = (void *)[v5 copy];
  }
  else
  {
    id v6 = 0;
  }
  return (NSString *)v6;
}

- (unint64_t)evaluateWithURLComponents:(id)a3 substitutionVariables:(id)a4 auditToken:(id *)a5
{
  id v8 = [(_SWCPattern *)self storage];
  if (!v8) {
    return 200;
  }
  int v9 = (SWCPatternStorage *)v8;
  v12[0] = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  id v15 = a4;
  int v16 = 0;
  memset(v17, 0, sizeof(v17));
  int v18 = 1065353216;
  char v19 = 0;
  ++_SWCDiagnosticStorage;
  unint64_t v10 = SWCPatternStorage::evaluate(v9, (NSURLComponents *)a3, (const SWCFNMatch *)v12, (const audit_token_t *)a5);
  std::__hash_table<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::__unordered_map_hasher<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::hash<std::string_view>,std::equal_to<std::string_view>,true>,std::__unordered_map_equal<std::string_view,std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>,std::equal_to<std::string_view>,std::hash<std::string_view>,true>,std::allocator<std::__hash_value_type<std::string_view,SWCSubstitutionVariable const*>>>::~__hash_table((uint64_t)v17);

  return v10;
}

- (id)_initWithPatternStorageNoCopy:(const SWCPatternStorage *)a3 freeWhenDone:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_SWCPattern;
  id result = [(_SWCPattern *)&v7 init];
  if (result)
  {
    *((void *)result + 2) = a3;
    *((unsigned char *)result + 8) = a4;
  }
  return result;
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
  v5 = [(_SWCPattern *)self storage];
  uint64_t v6 = [a3 storage];
  BOOL v7 = ((unint64_t)v5 | v6) == 0;
  if (v5)
  {
    id v8 = (SWCPatternStorage *)v6;
    if (v6)
    {
      size_t Size = SWCPatternStorage::getSize(v5);
      if (Size == SWCPatternStorage::getSize(v8)) {
        return memcmp(v5, v8, Size) == 0;
      }
    }
  }
  return v7;
}

- (unint64_t)hash
{
  unint64_t result = [(_SWCPattern *)self storage];
  if (result)
  {
    objc_super v3 = (uint64_t *)result;
    unint64_t Size = SWCPatternStorage::getSize((SWCPatternStorage *)result);
    return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v3, Size);
  }
  return result;
}

- (id)description
{
  id v2 = +[_SWCPattern _debug:0 descriptionOfStorage:[(_SWCPattern *)self storage] forObject:self redacted:0];
  return v2;
}

- (id)debugDescription
{
  id v2 = +[_SWCPattern _debug:1 descriptionOfStorage:[(_SWCPattern *)self storage] forObject:self redacted:0];
  return v2;
}

- (id)redactedDescription
{
  id v2 = +[_SWCPattern _debug:0 descriptionOfStorage:[(_SWCPattern *)self storage] forObject:self redacted:1];
  return v2;
}

- (const)storage
{
  return self->_storage;
}

- (void)setStorage:(const SWCPatternStorage *)a3
{
  self->_storage = a3;
}

+ (id)_normalizedURLPath:(id)a3
{
  uint64_t v6 = (void *)[a3 mutableCopy];
  if (!v6)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"SWCPattern.mm", 979, @"Invalid parameter not satisfying: %@", @"result != nil" object file lineNumber description];
  }
  uint64_t v7 = [a3 length];
  if (!v7)
  {
    [v6 setString:@"/"];
    return v6;
  }
  if (v7 != 1)
  {
    while (1)
    {
      uint64_t v9 = [v6 rangeOfString:@"**"];
      if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      objc_msgSend(v6, "replaceCharactersInRange:withString:", v9, v8, @"*");
    }
    while (1)
    {
      uint64_t v11 = [v6 rangeOfString:@"//"];
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      objc_msgSend(v6, "replaceCharactersInRange:withString:", v11, v10, @"/");
    }
    if ((unint64_t)[v6 length] < 2)
    {
      int v14 = 0;
    }
    else
    {
      int v12 = [v6 hasPrefix:@"*"];
      char v13 = v12;
      if (v12) {
        objc_msgSend(v6, "deleteCharactersInRange:", 0, 1);
      }
      int v14 = [v6 hasSuffix:@"*"];
      if (v14) {
        objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 1, 1);
      }
      if (v13)
      {
        int v15 = 1;
        if (v14)
        {
LABEL_24:
          if (v15) {
            [v6 insertString:@"*" atIndex:0];
          }
          if (v14) {
            [v6 appendString:@"*"];
          }
          return v6;
        }
LABEL_22:
        if (([v6 hasSuffix:@"/"] & 1) == 0) {
          [v6 appendString:@"/"];
        }
        goto LABEL_24;
      }
    }
    if (([v6 hasPrefix:@"/"] & 1) == 0) {
      [v6 insertString:@"/" atIndex:0];
    }
    int v15 = 0;
    if (v14) {
      goto LABEL_24;
    }
    goto LABEL_22;
  }
  return v6;
}

+ (id)_debug:(BOOL)a3 descriptionOfStorage:(const SWCPatternStorage *)a4 forObject:(id)a5 redacted:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v9 = a3;
  uint64_t v10 = (void *)MEMORY[0x1AD1157F0](a1, a2);
  if (!a4)
  {
    int v16 = @"(null)";
    goto LABEL_40;
  }
  uint64_t v11 = (void *)MEMORY[0x1AD1157F0]();
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  cStrings = a4->cStrings;
  unsigned int v14 = *(unsigned char *)a4;
  LOBYTE(v45) = 0;
  char v47 = 0;
  if ((v14 & 2) != 0)
  {
    id v45 = a4->cStrings;
    size_t v46 = strlen(a4->cStrings);
    char v47 = 1;
    cStrings += v46 + 1;
  }
  LOBYTE(v42) = 0;
  char v44 = 0;
  if ((v14 & 4) != 0)
  {
    size_t v42 = cStrings;
    size_t v43 = strlen(cStrings);
    char v44 = 1;
    cStrings += v43 + 1;
  }
  LOBYTE(v39) = 0;
  char v41 = 0;
  unsigned int v15 = ((v14 >> 3) & 3) - 3;
  if (v15 >= 0xFFFFFFFE)
  {
    id v39 = cStrings;
    size_t v40 = strlen(cStrings);
    char v41 = 1;
    cStrings += v40 + 1;
  }
  LOBYTE(v37[0]) = 0;
  char v38 = 0;
  if ((v14 & 0x80) == 0)
  {
    if ((v14 & 2) == 0) {
      goto LABEL_10;
    }
LABEL_14:
    v17 = SWCGetNSStringFromStringViewNoCopy(&v45);
    [v12 setObject:v17 forKeyedSubscript:@"/"];

    if ((v14 & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v37[0] = cStrings;
  v37[1] = strlen(cStrings);
  char v38 = 1;
  if ((v14 & 2) != 0) {
    goto LABEL_14;
  }
LABEL_10:
  if ((v14 & 4) != 0)
  {
LABEL_15:
    int v18 = SWCGetNSStringFromStringViewNoCopy(&v42);
    [v12 setObject:v18 forKeyedSubscript:@"#"];
  }
LABEL_16:
  if (v15 >= 0xFFFFFFFE)
  {
    int v19 = (*(unsigned char *)a4 >> 3) & 3;
    if (v19 == 1)
    {
      v20 = SWCGetNSStringFromStringViewNoCopy(&v39);
      [v12 setObject:v20 forKeyedSubscript:@"?"];
LABEL_22:

      goto LABEL_23;
    }
    if (v19 == 2)
    {
      v20 = SWCPatternStorage::_ReconstituteQueryJSON(&v39);
      if (v20) {
        [v12 setObject:v20 forKeyedSubscript:@"?"];
      }
      goto LABEL_22;
    }
  }
LABEL_23:
  if ((v14 & 0x80) != 0)
  {
    v21 = SWCGetNSStringFromStringViewNoCopy(v37);
    [v12 setObject:v21 forKeyedSubscript:@"requiredEntitlement"];
  }
  char v22 = *(unsigned char *)a4;
  if (*(unsigned char *)a4)
  {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"exclude"];
    char v22 = *(unsigned char *)a4;
  }
  if ((v22 & 0x20) != 0)
  {
    [v12 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"caseSensitive"];
    char v22 = *(unsigned char *)a4;
  }
  if ((v22 & 0x40) != 0) {
    [v12 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"percentEncoded"];
  }
  v23 = (void *)[v12 copy];

  if (v6)
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v23, "count"));
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __71___SWCPattern_Private___debug_descriptionOfStorage_forObject_redacted___block_invoke;
    v35[3] = &unk_1E5E51938;
    id v25 = v24;
    id v36 = v25;
    [v23 enumerateKeysAndObjectsUsingBlock:v35];
    id v26 = v25;

    v23 = v26;
  }
  if (v9) {
    uint64_t v27 = 11;
  }
  else {
    uint64_t v27 = 10;
  }
  v28 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v23 options:v27 error:0];
  if (v28) {
    int v16 = (__CFString *)[[NSString alloc] initWithData:v28 encoding:4];
  }
  else {
    int v16 = 0;
  }

LABEL_40:
  id v29 = (void *)MEMORY[0x1AD1157F0]();
  if (!v9)
  {
LABEL_44:
    char v31 = v16;
    v32 = v31;
    goto LABEL_45;
  }
  uint64_t v30 = [(__CFString *)v16 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n  "];

  if (!a5)
  {
    int v16 = (__CFString *)v30;
    goto LABEL_44;
  }
  char v31 = (__CFString *)[[NSString alloc] initWithFormat:@"<%@ %p> %@", objc_opt_class(), a5, v30];
  v32 = (void *)v30;
LABEL_45:
  v33 = v31;

  return v33;
}

@end