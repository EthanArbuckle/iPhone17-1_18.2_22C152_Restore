@interface SignpostSupportMetadataSegment
- (BOOL)hasPlaceholderToken:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGenerator;
- (BOOL)matchesPlaceholderTokenKey:(id)a3 value:(id)a4;
- (NSArray)placeholderTokens;
- (NSString)stringPrefix;
- (NSString)type;
- (NSString)typeNamespace;
- (SignpostSupportMessageArgument)argument;
- (SignpostSupportMetadataSegment)initWithArgumentObject:(id)a3 typeNamespace:(id)a4 type:(id)a5 tokens:(id)a6 stringPrefix:(id)a7 privacy:(id)a8;
- (SignpostSupportMetadataSegment)initWithDictionary:(id)a3;
- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4 didRedactOut:(BOOL *)a5;
- (id)placeholderTokensForKey:(id)a3;
@end

@implementation SignpostSupportMetadataSegment

- (NSString)typeNamespace
{
  return self->_typeNamespace;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_argument, 0);
  objc_storeStrong((id *)&self->_stringPrefix, 0);
  objc_storeStrong((id *)&self->_placeholderTokens, 0);
  objc_storeStrong((id *)&self->_type, 0);

  objc_storeStrong((id *)&self->_typeNamespace, 0);
}

- (SignpostSupportMetadataSegment)initWithArgumentObject:(id)a3 typeNamespace:(id)a4 type:(id)a5 tokens:(id)a6 stringPrefix:(id)a7 privacy:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v23 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SignpostSupportMetadataSegment;
  v19 = [(SignpostSupportMetadataSegment *)&v24 init];
  if (v19)
  {
    v20 = [[SignpostSupportMessageArgument alloc] initWithArgumentObject:v14 privacy:v18];
    argument = v19->_argument;
    v19->_argument = v20;

    objc_storeStrong((id *)&v19->_typeNamespace, a4);
    objc_storeStrong((id *)&v19->_type, a5);
    objc_storeStrong((id *)&v19->_placeholderTokens, a6);
    objc_storeStrong((id *)&v19->_stringPrefix, a7);
    if ([@"signpost.generator" isEqualToString:v15]) {
      v19->_isGenerator = 1;
    }
  }

  return v19;
}

- (NSArray)placeholderTokens
{
  return self->_placeholderTokens;
}

- (SignpostSupportMessageArgument)argument
{
  return self->_argument;
}

- (BOOL)isGenerator
{
  return self->_isGenerator;
}

- (NSString)stringPrefix
{
  return self->_stringPrefix;
}

- (id)_dictionaryRepresentationWithIsHumanReadable:(BOOL)a3 shouldRedact:(BOOL)a4 didRedactOut:(BOOL *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  v10 = [(SignpostSupportMetadataSegment *)self argument];
  v11 = [v10 argumentObject];

  if (!v11)
  {
    id v15 = 0;
    goto LABEL_24;
  }
  v12 = [(SignpostSupportMetadataSegment *)self argument];
  v13 = v12;
  if (!v7)
  {
    if (!v6)
    {
      id v16 = [v12 argumentObject];

LABEL_21:
      v25 = NSNumber;
      v19 = [(SignpostSupportMetadataSegment *)self argument];
      id v15 = objc_msgSend(v25, "numberWithUnsignedChar:", objc_msgSend(v19, "privacyLevel"));
      id v17 = @"Arg";
      goto LABEL_22;
    }
    int v18 = [v12 type];

    switch(v18)
    {
      case 1:
        v20 = [(SignpostSupportMetadataSegment *)self argument];
        v21 = [v20 argumentObject];
        if (_stringPassesAllowlist_onceToken != -1) {
          dispatch_once(&_stringPassesAllowlist_onceToken, &__block_literal_global_522);
        }
        int v22 = StringPassesSignpostReporterStringAllowlist(v21, (void *)_stringPassesAllowlist_platform);

        if (!v22)
        {
          BOOL v24 = 1;
          id v16 = @"<redacted>";
          goto LABEL_20;
        }
        break;
      case 2:
        id v16 = [MEMORY[0x1E4F1C9B8] data];
        BOOL v24 = 1;
        goto LABEL_20;
      case 3:
        break;
      default:
        id v16 = 0;
LABEL_17:
        BOOL v24 = 0;
LABEL_20:
        *a5 = v24;
        goto LABEL_21;
    }
    id v23 = [(SignpostSupportMetadataSegment *)self argument];
    id v16 = [v23 argumentObject];

    goto LABEL_17;
  }
  int v14 = [v12 type];

  if (v14 != 2)
  {
    v19 = [(SignpostSupportMetadataSegment *)self argument];
    id v16 = [v19 argumentObject];
    id v15 = 0;
    id v17 = @"Argument";
LABEL_22:

    goto LABEL_23;
  }
  id v15 = 0;
  id v16 = @"NSData arguments not supported";
  id v17 = @"Argument";
LABEL_23:
  [v9 setObject:v16 forKeyedSubscript:v17];

LABEL_24:
  v26 = [(SignpostSupportMetadataSegment *)self typeNamespace];

  if (v26)
  {
    v27 = [(SignpostSupportMetadataSegment *)self typeNamespace];
    if (v7) {
      v28 = @"TypeNamespace";
    }
    else {
      v28 = @"TypeName";
    }
    [v9 setObject:v27 forKeyedSubscript:v28];
  }
  v29 = [(SignpostSupportMetadataSegment *)self type];

  if (v29)
  {
    v30 = [(SignpostSupportMetadataSegment *)self type];
    [v9 setObject:v30 forKeyedSubscript:@"Type"];
  }
  v31 = [(SignpostSupportMetadataSegment *)self placeholderTokens];

  if (v31)
  {
    v32 = [(SignpostSupportMetadataSegment *)self placeholderTokens];
    [v9 setObject:v32 forKeyedSubscript:@"Tokens"];
  }
  v33 = [(SignpostSupportMetadataSegment *)self stringPrefix];

  if (v33)
  {
    v34 = [(SignpostSupportMetadataSegment *)self stringPrefix];
    [v9 setObject:v34 forKeyedSubscript:@"Prefix"];
  }
  if (v15)
  {
    if (v7) {
      v35 = @"Privacy";
    }
    else {
      v35 = @"Priv";
    }
    [v9 setObject:v15 forKeyedSubscript:v35];
  }

  return v9;
}

- (SignpostSupportMetadataSegment)initWithDictionary:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [v4 objectForKeyedSubscript:@"Arg"];
    BOOL v6 = [v4 objectForKeyedSubscript:@"TypeName"];
    BOOL v7 = [v4 objectForKeyedSubscript:@"Type"];
    v8 = [v4 objectForKeyedSubscript:@"Tokens"];
    v9 = [v4 objectForKeyedSubscript:@"Prefix"];
    v10 = [v4 objectForKeyedSubscript:@"Priv"];

    self = [(SignpostSupportMetadataSegment *)self initWithArgumentObject:v5 typeNamespace:v6 type:v7 tokens:v8 stringPrefix:v9 privacy:v10];
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v5 = (SignpostSupportMetadataSegment *)a3;
  if (self == v5)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = v5;
      BOOL v7 = [(SignpostSupportMetadataSegment *)self argument];
      if (v7
        || ([(SignpostSupportMetadataSegment *)v6 argument],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v8 = [(SignpostSupportMetadataSegment *)self argument];
        v9 = [(SignpostSupportMetadataSegment *)v6 argument];
        v10 = v9;
        if (v8 == v9)
        {

          if (v7) {
            id v15 = v7;
          }
          else {
            id v15 = v3;
          }
        }
        else
        {
          v11 = [(SignpostSupportMetadataSegment *)self argument];
          v12 = [(SignpostSupportMetadataSegment *)v6 argument];
          int v13 = [v11 isEqual:v12];

          if (v7)
          {

            if (!v13) {
              goto LABEL_53;
            }
          }
          else
          {

            if ((v13 & 1) == 0) {
              goto LABEL_53;
            }
          }
        }
      }
      id v16 = [(SignpostSupportMetadataSegment *)self typeNamespace];
      if (v16
        || ([(SignpostSupportMetadataSegment *)v6 typeNamespace],
            (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v17 = [(SignpostSupportMetadataSegment *)self typeNamespace];
        int v18 = [(SignpostSupportMetadataSegment *)v6 typeNamespace];
        v19 = v18;
        if (v17 == v18)
        {

          if (v16) {
            id v23 = v16;
          }
          else {
            id v23 = v3;
          }
        }
        else
        {
          v20 = [(SignpostSupportMetadataSegment *)self typeNamespace];
          v21 = [(SignpostSupportMetadataSegment *)v6 typeNamespace];
          int v22 = [v20 isEqual:v21];

          if (v16)
          {

            if (!v22) {
              goto LABEL_53;
            }
          }
          else
          {

            if ((v22 & 1) == 0) {
              goto LABEL_53;
            }
          }
        }
      }
      BOOL v24 = [(SignpostSupportMetadataSegment *)self type];
      if (v24
        || ([(SignpostSupportMetadataSegment *)v6 type], (v3 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v25 = [(SignpostSupportMetadataSegment *)self type];
        v26 = [(SignpostSupportMetadataSegment *)v6 type];
        v27 = v26;
        if (v25 == v26)
        {

          if (v24) {
            v31 = v24;
          }
          else {
            v31 = v3;
          }
        }
        else
        {
          v28 = [(SignpostSupportMetadataSegment *)self type];
          v29 = [(SignpostSupportMetadataSegment *)v6 type];
          int v30 = [v28 isEqual:v29];

          if (v24)
          {

            if (!v30) {
              goto LABEL_53;
            }
          }
          else
          {

            if ((v30 & 1) == 0) {
              goto LABEL_53;
            }
          }
        }
      }
      v32 = [(SignpostSupportMetadataSegment *)self stringPrefix];
      if (!v32)
      {
        v3 = [(SignpostSupportMetadataSegment *)v6 stringPrefix];
        if (!v3) {
          goto LABEL_49;
        }
      }
      v33 = [(SignpostSupportMetadataSegment *)self stringPrefix];
      v34 = [(SignpostSupportMetadataSegment *)v6 stringPrefix];
      v35 = v34;
      if (v33 == v34)
      {

        if (v32) {
          v39 = v32;
        }
        else {
          v39 = v3;
        }

        goto LABEL_49;
      }
      v36 = [(SignpostSupportMetadataSegment *)self stringPrefix];
      v37 = [(SignpostSupportMetadataSegment *)v6 stringPrefix];
      int v38 = [v36 isEqual:v37];

      if (v32)
      {

        if (!v38) {
          goto LABEL_53;
        }
LABEL_49:
        v40 = [(SignpostSupportMetadataSegment *)self placeholderTokens];
        v41 = [(SignpostSupportMetadataSegment *)v6 placeholderTokens];
        id v42 = v40;
        id v43 = v41;
        v44 = v43;
        if (v42)
        {
          if (v42 == v43)
          {
            char v14 = 1;
          }
          else if (v43)
          {
            char v14 = [v42 isEqualToArray:v43];
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = v43 == 0;
        }

        goto LABEL_58;
      }

      if (v38) {
        goto LABEL_49;
      }
LABEL_53:
      char v14 = 0;
LABEL_58:

      goto LABEL_59;
    }
    char v14 = 0;
  }
LABEL_59:

  return v14;
}

- (BOOL)matchesPlaceholderTokenKey:(id)a3 value:(id)a4
{
  BOOL v6 = (objc_class *)NSString;
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithFormat:@"%@=%@", v8, v7];

  LOBYTE(v8) = [(SignpostSupportMetadataSegment *)self hasPlaceholderToken:v9];
  return (char)v8;
}

- (BOOL)hasPlaceholderToken:(id)a3
{
  id v4 = a3;
  v5 = [(SignpostSupportMetadataSegment *)self placeholderTokens];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)placeholderTokensForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = (void *)[[NSString alloc] initWithFormat:@"%@=", v4];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = [(SignpostSupportMetadataSegment *)self placeholderTokens];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if ([v12 hasPrefix:v5])
          {
            int v13 = objc_msgSend(v12, "substringFromIndex:", objc_msgSend(v5, "length"));
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    if ([v6 count]) {
      id v14 = v6;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

@end