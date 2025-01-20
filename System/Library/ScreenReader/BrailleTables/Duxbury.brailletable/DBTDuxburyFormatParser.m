@interface DBTDuxburyFormatParser
+ (id)allCodeNodes;
- (DBTDuxburyFormatParser)init;
- (NSMutableArray)parserStack;
- (id)LaTeXRepresentationOfString:(id)a3 error:(id *)a4;
- (id)_parseInputString:(id)a3 error:(id *)a4;
- (unint64_t)advanceIndex;
- (unint64_t)startIndex;
- (void)_initState;
- (void)closeENodeIfNeeded;
- (void)setAdvanceIndex:(unint64_t)a3;
- (void)setParserStack:(id)a3;
- (void)setStartIndex:(unint64_t)a3;
@end

@implementation DBTDuxburyFormatParser

+ (id)allCodeNodes
{
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v2 = +[NSArray arrayWithObjects:v4 count:13];

  return v2;
}

- (DBTDuxburyFormatParser)init
{
  v4.receiver = self;
  v4.super_class = (Class)DBTDuxburyFormatParser;
  v2 = [(DBTDuxburyFormatParser *)&v4 init];
  [(DBTDuxburyFormatParser *)v2 _initState];
  return v2;
}

- (void)_initState
{
  v3 = objc_alloc_init(DBTDuxburyFormatRootNode);
  objc_super v4 = +[NSMutableArray arrayWithObject:v3];
  parserStack = self->_parserStack;
  self->_parserStack = v4;

  self->_startIndex = 0;
  self->_advanceIndex = 0;
}

- (id)LaTeXRepresentationOfString:(id)a3 error:(id *)a4
{
  v5 = -[DBTDuxburyFormatParser _parseInputString:error:](self, "_parseInputString:error:", a3);
  v6 = v5;
  if (a4 && *a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v5 LaTeXRepresentation];
  }

  return v7;
}

- (id)_parseInputString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(DBTDuxburyFormatParser *)self _initState];
  id v91 = 0;
  v7 = +[NSRegularExpression regularExpressionWithPattern:@"\\x{1c}([a-zA-Z0-9]+)\\x{1f}" options:1 error:&v91];
  id v8 = v91;
  id v90 = v8;
  v77 = +[NSRegularExpression regularExpressionWithPattern:@"[^\\x{1c}]*" options:1 error:&v90];
  id v9 = v90;

  if (v9)
  {
    v10 = 0;
    if (a4) {
      *a4 = v9;
    }
    goto LABEL_67;
  }
  v11 = (char *)[v6 length];
  v75 = v7;
  if (![v6 length])
  {
    v12 = 0;
LABEL_59:
    parserStack = self->_parserStack;
    p_parserStack = &self->_parserStack;
    id v9 = 0;
    if ((unint64_t)[(NSMutableArray *)parserStack count] >= 2)
    {
      do
      {
        v63 = [(NSMutableArray *)*p_parserStack lastObject];
        [(NSMutableArray *)*p_parserStack removeLastObject];
        v64 = [(NSMutableArray *)*p_parserStack lastObject];
        v65 = [v64 children];
        unsigned __int8 v66 = [v65 containsObject:v63];

        if ((v66 & 1) == 0)
        {
          v67 = [(NSMutableArray *)*p_parserStack lastObject];
          [v67 addChild:v63];
        }
      }
      while ((unint64_t)[(NSMutableArray *)*p_parserStack count] > 1);
    }
    v68 = DBTLogFormatParser();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
      -[DBTDuxburyFormatParser _parseInputString:error:]((id *)p_parserStack, v68);
    }

    v10 = [(NSMutableArray *)*p_parserStack lastObject];
    v7 = v75;
    goto LABEL_66;
  }
  v73 = a4;
  v12 = 0;
  unint64_t v13 = 0;
  id v74 = v6;
  while (1)
  {
    v14 = v12;
    v12 = objc_msgSend(v7, "firstMatchInString:options:range:", v6, 4, v13, v11);

    if (v12) {
      break;
    }
    v12 = objc_msgSend(v77, "firstMatchInString:options:range:", v6, 4, v13, v11);
    if (v12)
    {
      [(DBTDuxburyFormatParser *)self closeENodeIfNeeded];
      id v34 = [v12 range];
      v17 = objc_msgSend(v6, "substringWithRange:", v34, v35);
      v36 = [[DBTDuxburyFormatTextNode alloc] initWithText:v17];
      v37 = [(NSMutableArray *)self->_parserStack lastObject];
      [v37 addChild:v36];

      id v38 = [v12 range];
      unint64_t v13 = (unint64_t)v38 + v39;
      [v12 range];
      uint64_t v41 = v40;

LABEL_33:
      v11 -= v41;
    }
LABEL_34:
    if (v13 >= (unint64_t)[v6 length]) {
      goto LABEL_59;
    }
  }
  if ([v12 numberOfRanges] != (char *)&dword_0 + 2) {
    goto LABEL_34;
  }
  v76 = v11;
  id v15 = [v12 rangeAtIndex:1];
  v17 = objc_msgSend(v6, "substringWithRange:", v15, v16);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v18 = [(NSMutableArray *)self->_parserStack reverseObjectEnumerator];
  id v19 = [v18 countByEnumeratingWithState:&v86 objects:v96 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v87;
LABEL_10:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v87 != v21) {
        objc_enumerationMutation(v18);
      }
      v23 = *(void **)(*((void *)&v86 + 1) + 8 * v22);
      v24 = [(id)objc_opt_class() endCode];
      if ([v17 isEqualToString:v24])
      {
        unsigned __int8 v25 = [v23 isClosed];

        if ((v25 & 1) == 0)
        {
          [v23 foundEndCode:v17];
          [(NSMutableArray *)self->_parserStack removeObject:v23];
LABEL_30:
          id v6 = v74;
          v7 = v75;
          v11 = v76;
LABEL_31:

          goto LABEL_32;
        }
      }
      else
      {
      }
      if (v20 == (id)++v22)
      {
        id v20 = [v18 countByEnumeratingWithState:&v86 objects:v96 count:16];
        if (!v20) {
          break;
        }
        goto LABEL_10;
      }
    }
  }

  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  v26 = [(NSMutableArray *)self->_parserStack reverseObjectEnumerator];
  id v27 = [v26 countByEnumeratingWithState:&v82 objects:v95 count:16];
  if (!v27) {
    goto LABEL_27;
  }
  id v28 = v27;
  uint64_t v29 = *(void *)v83;
LABEL_21:
  uint64_t v30 = 0;
  while (1)
  {
    if (*(void *)v83 != v29) {
      objc_enumerationMutation(v26);
    }
    v31 = *(void **)(*((void *)&v82 + 1) + 8 * v30);
    v32 = [(id)objc_opt_class() innerCodes];
    unsigned int v33 = [v32 containsObject:v17];

    if (v33) {
      break;
    }
    if (v28 == (id)++v30)
    {
      id v28 = [v26 countByEnumeratingWithState:&v82 objects:v95 count:16];
      if (!v28)
      {
LABEL_27:

        goto LABEL_40;
      }
      goto LABEL_21;
    }
  }
  unsigned __int8 v45 = [v31 foundInnerCode:v17];
  while (1)
  {
    v46 = [(NSMutableArray *)self->_parserStack lastObject];

    if (v46 == v31) {
      break;
    }
    [(NSMutableArray *)self->_parserStack removeLastObject];
  }

  id v6 = v74;
  v7 = v75;
  v11 = v76;
  if (v45)
  {
LABEL_32:
    id v42 = [v12 range];
    unint64_t v13 = (unint64_t)v42 + v43;
    [v12 range];
    uint64_t v41 = v44;
    goto LABEL_33;
  }
LABEL_40:
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v18 = [(id)objc_opt_class() allCodeNodes];
  id v47 = [v18 countByEnumeratingWithState:&v78 objects:v94 count:16];
  if (!v47) {
    goto LABEL_70;
  }
  id v48 = v47;
  uint64_t v49 = *(void *)v79;
  while (2)
  {
    uint64_t v50 = 0;
    while (2)
    {
      if (*(void *)v79 != v49) {
        objc_enumerationMutation(v18);
      }
      v51 = *(void **)(*((void *)&v78 + 1) + 8 * v50);
      v52 = [v51 beginCode];
      unsigned int v53 = [v52 isEqualToString:v17];

      if (v53)
      {
        v56 = +[DBTDuxburyFormatENode innerCodes];
        unsigned __int8 v57 = [v56 containsObject:v17];

        if ((v57 & 1) == 0) {
          [(DBTDuxburyFormatParser *)self closeENodeIfNeeded];
        }
        id v58 = objc_alloc_init((Class)v51);
        v59 = [(NSMutableArray *)self->_parserStack lastObject];
        [v59 addChild:v58];

        v60 = [(id)objc_opt_class() endCode];
        id v6 = v74;
        v7 = v75;
        v11 = v76;
        if (v60)
        {
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_56:

            goto LABEL_31;
          }
        }
        [(NSMutableArray *)self->_parserStack addObject:v58];
        goto LABEL_56;
      }
      v54 = [v51 endCode];
      unsigned __int8 v55 = [v54 isEqualToString:v17];

      if (v55) {
        goto LABEL_30;
      }
      if (v48 != (id)++v50) {
        continue;
      }
      break;
    }
    id v48 = [v18 countByEnumeratingWithState:&v78 objects:v94 count:16];
    if (v48) {
      continue;
    }
    break;
  }
LABEL_70:

  if (v73)
  {
    NSErrorUserInfoKey v92 = NSLocalizedDescriptionKey;
    v70 = +[NSString stringWithFormat:@"Found unexpected Duxbury format code: %@", v17];
    v93 = v70;
    v71 = +[NSDictionary dictionaryWithObjects:&v93 forKeys:&v92 count:1];

    id v72 = +[NSError errorWithDomain:@"com.apple.accessibility.duxbury.dbtParserErrorDomain" code:1 userInfo:v71];
    id *v73 = v72;
  }
  v10 = 0;
  id v6 = v74;
  v7 = v75;
  id v9 = 0;
LABEL_66:

LABEL_67:

  return v10;
}

- (void)closeENodeIfNeeded
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(NSMutableArray *)self->_parserStack reverseObjectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;

          if (!(v6 & 1 | (v10 == 0)))
          {
            v11 = [v10 expressionNode];

            if (v11)
            {
              while (1)
              {
                id v12 = [(NSMutableArray *)self->_parserStack lastObject];

                if (v12 == v10) {
                  break;
                }
                [(NSMutableArray *)self->_parserStack removeLastObject];
              }
              [(NSMutableArray *)self->_parserStack removeLastObject];
            }
          }
          goto LABEL_19;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            continue;
          }
        }
        char v6 = 1;
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v10 = 0;
LABEL_19:
}

- (NSMutableArray)parserStack
{
  return self->_parserStack;
}

- (void)setParserStack:(id)a3
{
}

- (unint64_t)startIndex
{
  return self->_startIndex;
}

- (void)setStartIndex:(unint64_t)a3
{
  self->_startIndex = a3;
}

- (unint64_t)advanceIndex
{
  return self->_advanceIndex;
}

- (void)setAdvanceIndex:(unint64_t)a3
{
  self->_advanceIndex = a3;
}

- (void).cxx_destruct
{
}

- (void)_parseInputString:(id *)a1 error:(NSObject *)a2 .cold.1(id *a1, NSObject *a2)
{
  v3 = [*a1 lastObject];
  id v4 = [v3 debugDescription];
  int v5 = 138412290;
  char v6 = v4;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Parsed input to tree:\n%@", (uint8_t *)&v5, 0xCu);
}

@end