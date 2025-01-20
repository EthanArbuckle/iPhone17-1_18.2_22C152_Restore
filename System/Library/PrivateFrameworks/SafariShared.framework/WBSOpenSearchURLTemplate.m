@interface WBSOpenSearchURLTemplate
+ (BOOL)supportsSecureCoding;
- (BOOL)includesParameter:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)templateString;
- (WBSOpenSearchURLTemplate)initWithCoder:(id)a3;
- (WBSOpenSearchURLTemplate)initWithString:(id)a3;
- (id)URLWithSearchTerms:(id)a3;
- (id)description;
- (id)templateByAddingParameter:(id)a3 asURLQueryParameter:(id)a4;
- (id)templateBySubstitutingValue:(id)a3 forParameter:(id)a4;
- (id)templateBySubstitutingValues:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSOpenSearchURLTemplate

- (NSString)templateString
{
  return self->_templateString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateString, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_parametersByName, 0);
}

- (id)templateBySubstitutingValues:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E78] string];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v6 = self->_parameters;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v6);
      }
      v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
      v12 = [v11 prefix];
      [v5 appendString:v12];

      v13 = [v11 name];

      if (!v13) {
        break;
      }
      v14 = [v11 name];
      v15 = [v4 objectForKeyedSubscript:v14];

      if (v15)
      {
        [v5 appendString:v15];
      }
      else
      {
        int v16 = [v11 isOptional];
        uint64_t v17 = [v11 name];
        v18 = (void *)v17;
        if (v16) {
          [v5 appendFormat:@"{%@?}", v17];
        }
        else {
          [v5 appendFormat:@"{%@}", v17];
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v19 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v5];
  return v19;
}

- (WBSOpenSearchURLTemplate)initWithString:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)WBSOpenSearchURLTemplate;
  v5 = [(WBSOpenSearchURLTemplate *)&v32 init];
  if (v5 && [v4 length])
  {
    uint64_t v6 = [v4 copy];
    templateString = v5->_templateString;
    v5->_templateString = (NSString *)v6;

    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    parametersByName = v5->_parametersByName;
    v5->_parametersByName = v8;

    uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    parameters = v5->_parameters;
    v5->_parameters = v10;

    uint64_t v12 = [(NSString *)v5->_templateString length];
    uint64_t v13 = [(NSString *)v5->_templateString rangeOfString:@"{", 2, 0, v12 options range];
    id v31 = v4;
    if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v14 = 0;
      if (v12)
      {
LABEL_22:
        v28 = objc_alloc_init(WBSOpenSearchURLTemplateParameter);
        v29 = -[NSString substringWithRange:](v5->_templateString, "substringWithRange:", v14, v12);
        [(WBSOpenSearchURLTemplateParameter *)v28 setPrefix:v29];

        [(NSMutableArray *)v5->_parameters addObject:v28];
      }
    }
    else
    {
      uint64_t v16 = v13;
      uint64_t v14 = 0;
      unint64_t v17 = 0;
      while (1)
      {
        v18 = objc_alloc_init(WBSOpenSearchURLTemplateParameter);
        v19 = -[NSString substringWithRange:](v5->_templateString, "substringWithRange:", v14, v16 - v17);
        [(WBSOpenSearchURLTemplateParameter *)v18 setPrefix:v19];

        uint64_t v20 = v17 - (v16 + 1) + v12;
        unint64_t v21 = [(NSString *)v5->_templateString rangeOfString:@"}", 2, v16 + 1, v20 options range];
        if (v21 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        unint64_t v22 = v21;
        if (v21 <= v16 + 1)
        {
          [(WBSOpenSearchURLTemplateParameter *)v18 setOptional:0];
          uint64_t v24 = -1;
        }
        else
        {
          int v23 = [(NSString *)v5->_templateString characterAtIndex:v21 - 1];
          if (v23 == 63) {
            uint64_t v24 = -2;
          }
          else {
            uint64_t v24 = -1;
          }
          [(WBSOpenSearchURLTemplateParameter *)v18 setOptional:v23 == 63];
        }
        uint64_t v14 = v22 + 1;
        v25 = -[NSString substringWithRange:](v5->_templateString, "substringWithRange:", v16 + 1, v22 - v16 + v24);
        [(WBSOpenSearchURLTemplateParameter *)v18 setName:v25];
        -[WBSOpenSearchURLTemplateParameter setRange:](v18, "setRange:", v16, v22 + 1 - v16);
        [(NSMutableArray *)v5->_parameters addObject:v18];
        uint64_t v26 = [(NSMutableDictionary *)v5->_parametersByName objectForKeyedSubscript:v25];
        if (v26)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v26, v18, 0);
            [(NSMutableDictionary *)v5->_parametersByName setObject:v27 forKeyedSubscript:v25];
          }
          else
          {
            [v26 addObject:v18];
          }
        }
        else
        {
          [(NSMutableDictionary *)v5->_parametersByName setObject:v18 forKeyedSubscript:v25];
        }
        v12 += v17 + ~v22;

        uint64_t v16 = [(NSString *)v5->_templateString rangeOfString:@"{", 2, v22 + 1, v12 options range];
        unint64_t v17 = v22 + 1;
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!v12) {
            goto LABEL_23;
          }
          goto LABEL_22;
        }
      }

      uint64_t v14 = v16 + 1;
      v12 += v17 - (v16 + 1);
      if (v20) {
        goto LABEL_22;
      }
    }
LABEL_23:
    v15 = v5;
    id v4 = v31;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  if ([v5 allowsKeyedCoding])
  {
    templateString = self->_templateString;
    if (templateString) {
      [v5 encodeObject:templateString forKey:@"templateString"];
    }
  }
}

- (WBSOpenSearchURLTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"templateString"];
    self = [(WBSOpenSearchURLTemplate *)self initWithString:v5];

    uint64_t v6 = self;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)includesParameter:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_parametersByName objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)URLWithSearchTerms:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  BOOL v4 = [MEMORY[0x1E4F28E78] string];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = self->_parameters;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v23;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      uint64_t v12 = [v11 prefix];
      [v4 appendString:v12];

      uint64_t v13 = [v11 name];

      if (!v13)
      {
LABEL_18:

        if (v8) {
          goto LABEL_23;
        }
        goto LABEL_21;
      }
      uint64_t v14 = [v11 name];
      int v15 = [v14 isEqualToString:@"searchTerms"];

      if (v15) {
        break;
      }
      if (([v11 isOptional] & 1) == 0)
      {
        unint64_t v17 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          -[WBSOpenSearchURLTemplate URLWithSearchTerms:](v26, v17, v11, &v27);
        }
        uint64_t v16 = [v11 name];
        [v4 appendFormat:@"{%@}", v16];
        goto LABEL_15;
      }
LABEL_16:
      if (v7 == ++v10)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_18;
      }
    }
    uint64_t v16 = objc_msgSend(v21, "safari_stringEncodedAsURLQueryParameter");
    if (v16) {
      [v4 appendString:v16];
    }
    char v8 = 1;
LABEL_15:

    goto LABEL_16;
  }

LABEL_21:
  v18 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[WBSOpenSearchURLTemplate URLWithSearchTerms:](v18);
  }
LABEL_23:
  v19 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_URLWithUserTypedString:", v4);

  return v19;
}

- (id)templateBySubstitutingValue:(id)a3 forParameter:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(NSMutableDictionary *)self->_parametersByName objectForKeyedSubscript:v7];
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = objc_alloc((Class)objc_opt_class());
      templateString = self->_templateString;
      uint64_t v11 = [v8 range];
      uint64_t v13 = -[NSString stringByReplacingCharactersInRange:withString:](templateString, "stringByReplacingCharactersInRange:withString:", v11, v12, v6);
      uint64_t v14 = (WBSOpenSearchURLTemplate *)[v9 initWithString:v13];
    }
    else
    {
      id v17 = v7;
      v18[0] = v6;
      int v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      uint64_t v14 = [(WBSOpenSearchURLTemplate *)self templateBySubstitutingValues:v15];
    }
  }
  else
  {
    uint64_t v14 = self;
  }

  return v14;
}

- (id)templateByAddingParameter:(id)a3 asURLQueryParameter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSString *)self->_templateString rangeOfString:@"?"];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = [(NSString *)self->_templateString rangeOfString:@"#"];
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [(NSString *)self->_templateString stringByAppendingFormat:@"?%@={%@}", v7, v6];
      goto LABEL_7;
    }
    uint64_t v15 = v9;
    uint64_t v16 = NSString;
    uint64_t v13 = [(NSString *)self->_templateString substringToIndex:v9];
    id v17 = [(NSString *)self->_templateString substringFromIndex:v15];
    uint64_t v10 = [v16 stringWithFormat:@"%@?%@={%@}%@", v13, v7, v6, v17];
  }
  else
  {
    uint64_t v11 = NSString;
    uint64_t v12 = v8 + 1;
    uint64_t v13 = [(NSString *)self->_templateString substringToIndex:v8 + 1];
    uint64_t v14 = [(NSString *)self->_templateString substringFromIndex:v12];
    uint64_t v10 = [v11 stringWithFormat:@"%@%@={%@}&%@", v13, v7, v6, v14];
  }
LABEL_7:
  v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v10];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (WBSOpenSearchURLTemplate *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(NSString *)self->_templateString isEqualToString:v4->_templateString];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_templateString hash];
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p templateString = %@>", v5, self, self->_templateString];;

  return v6;
}

- (void)URLWithSearchTerms:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Template does not include the \"searchTerms\" parameter", v1, 2u);
}

- (void)URLWithSearchTerms:(void *)a3 .cold.2(uint8_t *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  uint64_t v8 = [a3 name];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_error_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_ERROR, "Template contains non-optional parameter \"%@\"", a1, 0xCu);
}

@end