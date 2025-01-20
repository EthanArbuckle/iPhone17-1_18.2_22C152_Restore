@interface TMLParser
+ (BOOL)isBuiltinObject:(id)a3;
+ (id)previousNonSpaceToken:(id)a3;
+ (id)transformAccessors:(id)a3;
+ (id)transformBreakpoints:(id)a3 lineNo:(int)a4 filename:(id)a5;
+ (id)transformFunction:(id)a3;
+ (id)transformObjectCreation:(id)a3;
+ (id)unescapeString:(id)a3;
+ (id)varsInCurrentScope:(id)a3;
- (BOOL)consumeToken:(unint64_t)a3 text:(const char *)a4;
- (BOOL)parseFile:(id)a3;
- (BOOL)parseFunctionLookaheadWithFile:(id)a3;
- (BOOL)parseFunctionLookaheadWithString:(id)a3 basePath:(id)a4 filename:(id)a5;
- (BOOL)parseString:(id)a3;
- (BOOL)parseString:(id)a3 basePath:(id)a4;
- (BOOL)parseString:(id)a3 basePath:(id)a4 filename:(id)a5;
- (BOOL)parseTokens:(id)a3 startingLine:(unint64_t)a4;
- (BOOL)strict;
- (NSString)error;
- (TMLParser)initWithContext:(id)a3;
- (id)compileExpression:(id)a3;
- (id)compileFunction:(id)a3 bodyOnly:(BOOL)a4;
- (id)compileFunction:(id)a3 bodyOnly:(BOOL)a4 localVars:(id)a5;
- (unint64_t)blockValueDepth;
- (void)addPreprocessorMacro:(id)a3;
- (void)addToken:(unint64_t)a3 text:(const char *)a4;
- (void)commitFunction;
- (void)commitImplements;
- (void)commitInitializer;
- (void)commitMacro;
- (void)commitMethod;
- (void)commitObject;
- (void)commitPragma;
- (void)commitProperty;
- (void)commitSignal;
- (void)setStrict:(BOOL)a3;
- (void)setup;
- (void)teardown;
@end

@implementation TMLParser

- (TMLParser)initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TMLParser;
  v6 = [(TMLParser *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    v7->_strict = 1;
  }

  return v7;
}

- (void)addPreprocessorMacro:(id)a3
{
  v4 = (const char *)a3;
  preprocessorMacros = self->_preprocessorMacros;
  v12 = (char *)v4;
  if (!preprocessorMacros)
  {
    id v7 = objc_alloc(MEMORY[0x263EFF9C0]);
    v10 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    v11 = self->_preprocessorMacros;
    self->_preprocessorMacros = v10;

    v4 = v12;
    preprocessorMacros = self->_preprocessorMacros;
  }
  objc_msgSend_addObject_(preprocessorMacros, v4, v5, v4);
}

- (BOOL)parseFile:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x23ECA7B30]();
  basePath = self->_basePath;
  id v7 = basePath;
  filename = self->_filename;
  double v9 = filename;
  objc_msgSend_stringByDeletingLastPathComponent(v4, v10, v11);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = self->_basePath;
  self->_basePath = v12;

  objc_msgSend_lastPathComponent(v4, v14, v15);
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  v17 = self->_filename;
  self->_filename = v16;

  if (!self->_lookaheadComplete)
  {
    v20 = [TMLParser alloc];
    v23 = objc_msgSend_initWithContext_(v20, v21, v22, 0);
    objc_msgSend_parseFunctionLookaheadWithFile_(v23, v24, v25, v4);
    uint64_t v28 = v23[16];
    if (v28)
    {
      functionIdentifiers = self->_functionIdentifiers;
      if (!functionIdentifiers)
      {
        objc_msgSend_set(MEMORY[0x263EFF9C0], v26, v27);
        v30 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        v31 = self->_functionIdentifiers;
        self->_functionIdentifiers = v30;

        functionIdentifiers = self->_functionIdentifiers;
        uint64_t v28 = v23[16];
      }
      objc_msgSend_unionSet_(functionIdentifiers, v26, v27, v28);
    }
    self->_lookaheadComplete = 1;
  }
  objc_msgSend_setup(self, v18, v19);
  id v32 = v4;
  v35 = (const char *)objc_msgSend_UTF8String(v32, v33, v34);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = sub_239844EEC;
  v43[3] = &unk_264DAC368;
  v43[4] = self;
  if (sub_239898E14(v35, (uint64_t)v43))
  {
    objc_msgSend_stringWithFormat_(NSString, v36, v37, @"Cannot read file at path %@", v32);
    v38 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    error = self->_error;
    self->_error = v38;

    goto LABEL_10;
  }
  unint64_t state = self->_state;
  if (state && state != 18)
  {
    objc_msgSend_stringWithFormat_(NSString, v36, v37, @"Premature end of file at line %d", self->_lineNo);
    v38 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend_teardown(self, v36, v37);
  objc_storeStrong((id *)&self->_basePath, basePath);
  objc_storeStrong((id *)&self->_filename, filename);

  BOOL v40 = self->_error == 0;

  return v40;
}

- (BOOL)parseString:(id)a3
{
  return ((uint64_t (*)(TMLParser *, char *))MEMORY[0x270F9A6D0])(self, sel_parseString_basePath_);
}

- (BOOL)parseString:(id)a3 basePath:(id)a4
{
  return objc_msgSend_parseString_basePath_filename_(self, a2, v4, a3, a4, 0);
}

- (BOOL)parseString:(id)a3 basePath:(id)a4 filename:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  basePath = self->_basePath;
  v44 = basePath;
  filename = self->_filename;
  v43 = filename;
  double v15 = (NSString *)objc_msgSend_copy(v9, v13, v14);
  v16 = self->_basePath;
  self->_basePath = v15;

  objc_storeStrong((id *)&self->_filename, a5);
  v18 = (void *)MEMORY[0x23ECA7B30]();
  if (!self->_lookaheadComplete)
  {
    v20 = [TMLParser alloc];
    v23 = objc_msgSend_initWithContext_(v20, v21, v22, 0);
    objc_msgSend_parseFunctionLookaheadWithString_basePath_filename_(v23, v24, v25, v8, v9, v10);
    uint64_t v28 = v23[16];
    if (v28)
    {
      functionIdentifiers = self->_functionIdentifiers;
      if (!functionIdentifiers)
      {
        objc_msgSend_set(MEMORY[0x263EFF9C0], v26, v27);
        v30 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
        v31 = self->_functionIdentifiers;
        self->_functionIdentifiers = v30;

        functionIdentifiers = self->_functionIdentifiers;
        uint64_t v28 = v23[16];
      }
      objc_msgSend_unionSet_(functionIdentifiers, v26, v27, v28);
    }
    self->_lookaheadComplete = 1;
  }
  objc_msgSend_setup(self, v17, v19);
  id v32 = v8;
  v35 = (char *)objc_msgSend_UTF8String(v32, v33, v34);
  v45[0] = MEMORY[0x263EF8330];
  v45[1] = 3221225472;
  v45[2] = sub_239845218;
  v45[3] = &unk_264DAC368;
  v45[4] = self;
  sub_239898E98(v35, (uint64_t)v45);
  unint64_t state = self->_state;
  if (state && state != 18)
  {
    objc_msgSend_stringWithFormat_(NSString, v36, v37, @"Premature end of file at line %u", self->_lineNo);
    v39 = (NSString *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v39;
  }
  objc_msgSend_teardown(self, v36, v37);
  objc_storeStrong((id *)&self->_basePath, basePath);
  objc_storeStrong((id *)&self->_filename, filename);
  BOOL v41 = self->_error == 0;

  return v41;
}

- (BOOL)parseFunctionLookaheadWithFile:(id)a3
{
  id v4 = a3;
  basePath = self->_basePath;
  v6 = basePath;
  filename = self->_filename;
  id v8 = filename;
  objc_msgSend_stringByDeletingLastPathComponent(v4, v9, v10);
  double v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  v12 = self->_basePath;
  self->_basePath = v11;

  objc_msgSend_lastPathComponent(v4, v13, v14);
  double v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  v16 = self->_filename;
  self->_filename = v15;

  v17 = (void *)MEMORY[0x23ECA7B30]();
  objc_msgSend_setup(self, v18, v19);
  self->_lookaheadOnly = 1;
  context = self->_context;
  self->_context = 0;
  self->_unint64_t state = 19;

  id v21 = v4;
  v24 = (const char *)objc_msgSend_UTF8String(v21, v22, v23);
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = sub_239845500;
  v32[3] = &unk_264DAC368;
  v32[4] = self;
  if (sub_239898E14(v24, (uint64_t)v32))
  {
    objc_msgSend_stringWithFormat_(NSString, v25, v26, @"Cannot read file at path %@", v21);
    double v27 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    error = self->_error;
    self->_error = v27;

    goto LABEL_6;
  }
  unint64_t state = self->_state;
  if (state > 0x13 || ((1 << state) & 0xC0001) == 0)
  {
    objc_msgSend_stringWithFormat_(NSString, v25, v26, @"Premature end of file at line %d", self->_lineNo);
    double v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
LABEL_6:
  objc_msgSend_teardown(self, v25, v26);
  objc_storeStrong((id *)&self->_basePath, basePath);
  objc_storeStrong((id *)&self->_filename, filename);
  BOOL v30 = self->_error == 0;

  return v30;
}

- (BOOL)parseFunctionLookaheadWithString:(id)a3 basePath:(id)a4 filename:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  basePath = self->_basePath;
  v33 = basePath;
  filename = self->_filename;
  id v32 = filename;
  double v15 = (NSString *)objc_msgSend_copy(v9, v13, v14);
  v16 = self->_basePath;
  self->_basePath = v15;

  objc_storeStrong((id *)&self->_filename, a5);
  v17 = (void *)MEMORY[0x23ECA7B30]();
  objc_msgSend_setup(self, v18, v19);
  self->_lookaheadOnly = 1;
  context = self->_context;
  self->_context = 0;
  self->_unint64_t state = 19;

  id v21 = v8;
  v24 = (char *)objc_msgSend_UTF8String(v21, v22, v23);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = sub_2398457D0;
  v34[3] = &unk_264DAC368;
  v34[4] = self;
  sub_239898E98(v24, (uint64_t)v34);
  unint64_t state = self->_state;
  if (state > 0x13 || ((1 << state) & 0xC0001) == 0)
  {
    objc_msgSend_stringWithFormat_(NSString, v25, v26, @"Premature end of file at line %u", self->_lineNo);
    uint64_t v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v28;
  }
  objc_msgSend_teardown(self, v25, v26);
  objc_storeStrong((id *)&self->_basePath, basePath);
  objc_storeStrong((id *)&self->_filename, filename);
  BOOL v30 = self->_error == 0;

  return v30;
}

- (BOOL)parseTokens:(id)a3 startingLine:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x23ECA7B30]();
  objc_msgSend_setup(self, v8, v9);
  self->_unint64_t state = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = a4;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_239845A20;
  v20[3] = &unk_264DAC390;
  v20[4] = self;
  v20[5] = v21;
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v10, COERCE_DOUBLE(3221225472), v20);
  unint64_t state = self->_state;
  if (state && state != 18)
  {
    objc_msgSend_stringWithFormat_(NSString, v11, v12, @"Premature end of file at line %u", self->_lineNo);
    double v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    self->_error = v14;
  }
  _Block_object_dispose(v21, 8);
  objc_msgSend_teardown(self, v16, v17);
  BOOL v18 = self->_error == 0;

  return v18;
}

- (void)setup
{
  objc_msgSend_teardown(self, a2, v2);
  self->_unint64_t state = 0;
  error = self->_error;
  self->_error = 0;

  self->_lineNo = 0;
  if (!self->_activeTokens)
  {
    id v5 = objc_alloc(MEMORY[0x263EFF980]);
    id v8 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v5, v6, v7, 16);
    activeTokens = self->_activeTokens;
    self->_activeTokens = v8;
  }
  if (!self->_declarationAttributes)
  {
    id v10 = objc_alloc(MEMORY[0x263EFF9C0]);
    v13 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v10, v11, v12, 4);
    declarationAttributes = self->_declarationAttributes;
    self->_declarationAttributes = v13;
  }
  if (!self->_objectStack)
  {
    id v15 = objc_alloc(MEMORY[0x263EFF980]);
    self->_objectStack = (NSMutableArray *)objc_msgSend_initWithCapacity_(v15, v16, v17, 4);
    MEMORY[0x270F9A758]();
  }
}

- (void)teardown
{
  declarationType = self->_declarationType;
  self->_declarationType = 0;

  objc_msgSend_removeAllObjects(self->_declarationAttributes, v4, v5);
  methodSelector = self->_methodSelector;
  self->_methodSelector = 0;

  lastIdent = self->_lastIdent;
  self->_lastIdent = 0;

  activeObject = self->_activeObject;
  self->_activeObject = 0;

  objc_msgSend_removeAllObjects(self->_activeTokens, v9, v10);
  objc_msgSend_removeAllObjects(self->_objectStack, v11, v12);
  context = self->_context;
  objc_msgSend_commit(context, v13, v14);
}

- (BOOL)consumeToken:(unint64_t)a3 text:(const char *)a4
{
  if (self->_error) {
    goto LABEL_2;
  }
  switch(self->_state)
  {
    case 0uLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 15)
      {
        switch(a3)
        {
          case 0x10uLL:
            goto LABEL_92;
          case 0x11uLL:
            goto LABEL_107;
          case 0x13uLL:
            goto LABEL_112;
          case 0x14uLL:
            if (objc_msgSend_length(self->_lastIdent, a2, v4)) {
              goto LABEL_2;
            }
            self->_unint64_t state = 14;
            objc_msgSend_removeAllObjects(self->_activeTokens, v103, v104);
            objc_msgSend_consumeToken_text_(self, v105, v106, 20, a4);
            goto LABEL_182;
          default:
            return v5;
        }
      }
      if (a3 < 2) {
        goto LABEL_182;
      }
      if (a3 == 2)
      {
        uint64_t v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
        if (!v5) {
          return v5;
        }
        v107 = [TMLMetaObject alloc];
        v91 = (TMLMetaObject *)objc_msgSend_initWithType_attributes_(v107, v108, v109, self->_lastIdent, self->_declarationAttributes);
LABEL_154:
        activeObject = self->_activeObject;
        self->_activeObject = v91;

        lastIdent = self->_lastIdent;
        self->_lastIdent = 0;

        unint64_t v9 = 1;
      }
      else
      {
        if (a3 != 6) {
          return v5;
        }
        objc_msgSend_removeAllObjects(self->_declarationAttributes, a2, v4);
        unint64_t v9 = 2;
      }
      goto LABEL_104;
    case 1uLL:
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
          if (!objc_msgSend_length(self->_lastIdent, a2, v4)) {
            goto LABEL_182;
          }
          goto LABEL_2;
        case 2uLL:
          uint64_t v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5) {
            return v5;
          }
          if (self->_activeObject) {
            objc_msgSend_addObject_(self->_objectStack, v86, v87);
          }
          v88 = [TMLMetaObject alloc];
          v91 = (TMLMetaObject *)objc_msgSend_initWithType_attributes_(v88, v89, v90, self->_lastIdent, 0);
          goto LABEL_154;
        case 3uLL:
          self->_unint64_t state = 0;
          objc_msgSend_commitObject(self, a2, v4);
          goto LABEL_182;
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 9uLL:
          return v5;
        case 8uLL:
          uint64_t v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5) {
            return v5;
          }
          objc_msgSend_removeAllObjects(self->_activeTokens, v92, v93);
          unint64_t v9 = 3;
          goto LABEL_104;
        case 0xAuLL:
          uint64_t v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5) {
            return v5;
          }
          v96 = self->_lastIdent;
          double v19 = objc_msgSend_stringWithCString_encoding_(NSString, v94, v95, a4, 4);
          objc_msgSend_stringByAppendingString_(v96, v97, v98, v19);
          v99 = (NSString *)objc_claimAutoreleasedReturnValue();
          v100 = self->_lastIdent;
          self->_lastIdent = v99;
          goto LABEL_145;
        default:
          if (a3 != 19) {
            return v5;
          }
          double v19 = objc_msgSend_stringWithCString_encoding_(NSString, a2, v4, a4, 4);
          p_lastIdent = (void **)&self->_lastIdent;
          if (!objc_msgSend_length(self->_lastIdent, v68, v69)
            && objc_msgSend_isEqualToString_(v19, v70, v71, @"property"))
          {
            v72 = self->_lastIdent;
            self->_unint64_t state = 4;
            self->_lastIdent = 0;

            declarationType = self->_declarationType;
            self->_declarationType = 0;

            objc_msgSend_removeAllObjects(self->_declarationAttributes, v74, v75);
            goto LABEL_42;
          }
          if (!objc_msgSend_length(*p_lastIdent, v70, v71)
            && objc_msgSend_isEqualToString_(v19, v112, v113, @"initializer"))
          {
            unint64_t v114 = 12;
LABEL_164:
            v117 = self->_lastIdent;
            self->_unint64_t state = v114;
            self->_lastIdent = 0;

LABEL_178:
            objc_msgSend_removeAllObjects(self->_activeTokens, v118, v119);
            goto LABEL_42;
          }
          if (!objc_msgSend_length(*p_lastIdent, v112, v113)
            && objc_msgSend_isEqualToString_(v19, v115, v116, @"implements"))
          {
            unint64_t v114 = 13;
            goto LABEL_164;
          }
          if (!objc_msgSend_length(*p_lastIdent, v115, v116)
            && objc_msgSend_isEqualToString_(v19, v120, v121, @"signal"))
          {
            v122 = self->_lastIdent;
            self->_unint64_t state = 6;
            self->_lastIdent = 0;

            methodSelector = self->_methodSelector;
            self->_methodSelector = 0;

            goto LABEL_178;
          }
          if (!objc_msgSend_length(*p_lastIdent, v120, v121)
            && ((objc_msgSend_isEqualToString_(v19, v128, v129, @"method") & 1) != 0
             || objc_msgSend_isEqualToString_(v19, v131, v132, @"constructor")))
          {
            v133 = self->_lastIdent;
            self->_unint64_t state = 9;
            self->_lastIdent = 0;

            v134 = self->_declarationType;
            self->_declarationType = 0;

            v135 = self->_methodSelector;
            self->_methodSelector = 0;

            self->_methodDeclaration = objc_msgSend_isEqualToString_(v19, v136, v137, @"method");
            goto LABEL_178;
          }
          if (*p_lastIdent)
          {
            uint64_t v130 = objc_msgSend_stringByAppendingString_(*p_lastIdent, v128, v129, v19);
            v100 = (NSString *)*p_lastIdent;
            *p_lastIdent = (void *)v130;
LABEL_145:
          }
          else
          {
            objc_storeStrong((id *)&self->_lastIdent, v19);
          }
LABEL_42:

          break;
      }
      goto LABEL_182;
    case 2uLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 18) {
        goto LABEL_39;
      }
      if (!a3) {
        goto LABEL_182;
      }
      if (a3 != 7) {
        return v5;
      }
      goto LABEL_59;
    case 3uLL:
      switch(a3)
      {
        case 0uLL:
          if (objc_msgSend_count(self->_activeTokens, a2, v4)) {
            objc_msgSend_addToken_text_(self, v65, v66, 0, a4);
          }
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          if (objc_msgSend_blockValueDepth(self, a2, v4)) {
            goto LABEL_181;
          }
          objc_msgSend_commitProperty(self, a2, v4);
          goto LABEL_53;
        default:
          goto LABEL_181;
      }
    case 4uLL:
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          uint64_t v5 = objc_msgSend_length(self->_declarationType, a2, v4);
          if (!v5) {
            return v5;
          }
          self->_unint64_t state = 3;
          objc_msgSend_consumeToken_text_(self, v12, v13, a3, a4);
          goto LABEL_182;
        case 2uLL:
        case 4uLL:
        case 5uLL:
        case 7uLL:
          return v5;
        case 6uLL:
          if (objc_msgSend_length(self->_declarationType, a2, v4)) {
            goto LABEL_2;
          }
          unint64_t v9 = 5;
          goto LABEL_104;
        case 8uLL:
          uint64_t v5 = objc_msgSend_length(self->_declarationType, a2, v4);
          if (!v5) {
            return v5;
          }
          self->_unint64_t state = 1;
          objc_msgSend_consumeToken_text_(self, v101, v102, 8, a4);
          goto LABEL_182;
        default:
          if (a3 != 19) {
            return v5;
          }
          uint64_t v76 = objc_msgSend_length(self->_declarationType, a2, v4);
          objc_msgSend_stringWithCString_encoding_(NSString, v77, v78, a4, 4);
          v79 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (v76)
          {
            v59 = self->_lastIdent;
            self->_lastIdent = v79;
            goto LABEL_127;
          }
          v61 = self->_declarationType;
          self->_declarationType = v79;
          break;
      }
LABEL_113:

      goto LABEL_182;
    case 5uLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 18) {
        goto LABEL_39;
      }
      if (!a3) {
        goto LABEL_182;
      }
      if (a3 != 7) {
        return v5;
      }
      unint64_t v9 = 4;
      goto LABEL_104;
    case 6uLL:
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          uint64_t v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5) {
            return v5;
          }
          objc_msgSend_commitSignal(self, v14, v15);
          goto LABEL_53;
        case 2uLL:
        case 4uLL:
        case 5uLL:
        case 7uLL:
        case 8uLL:
          return v5;
        case 6uLL:
          if (!objc_msgSend_length(self->_lastIdent, a2, v4))
          {
            unint64_t v124 = 7;
            goto LABEL_170;
          }
          if (objc_msgSend_count(self->_activeTokens, v82, v83)) {
            goto LABEL_2;
          }
          unint64_t v9 = 8;
          break;
        default:
          goto LABEL_86;
      }
      goto LABEL_104;
    case 7uLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 18) {
        goto LABEL_39;
      }
      goto LABEL_32;
    case 8uLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 18) {
        goto LABEL_81;
      }
LABEL_32:
      if (!a3) {
        goto LABEL_182;
      }
      if (a3 != 7) {
        return v5;
      }
      unint64_t v9 = 6;
      goto LABEL_104;
    case 9uLL:
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          uint64_t v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5) {
            return v5;
          }
          objc_msgSend_commitMethod(self, v16, v17);
          goto LABEL_53;
        case 2uLL:
        case 4uLL:
        case 5uLL:
        case 7uLL:
        case 8uLL:
          return v5;
        case 6uLL:
          if (!objc_msgSend_length(self->_lastIdent, a2, v4))
          {
            unint64_t v124 = 10;
LABEL_170:
            self->_unint64_t state = v124;
            v125 = self->_methodSelector;
            self->_methodSelector = 0;

            objc_msgSend_removeAllObjects(self->_declarationAttributes, v126, v127);
            goto LABEL_182;
          }
          if (objc_msgSend_count(self->_activeTokens, v84, v85)) {
            goto LABEL_2;
          }
          unint64_t v9 = 11;
          goto LABEL_104;
        default:
LABEL_86:
          if (a3 != 18)
          {
            if (a3 != 19) {
              return v5;
            }
            if (objc_msgSend_length(self->_lastIdent, a2, v4))
            {
              if (objc_msgSend_length(self->_declarationType, a2, v4)) {
                goto LABEL_2;
              }
              objc_storeStrong((id *)&self->_declarationType, self->_lastIdent);
            }
LABEL_112:
            objc_msgSend_stringWithCString_encoding_(NSString, a2, v4, a4, 4);
            v60 = (NSString *)objc_claimAutoreleasedReturnValue();
            v61 = self->_lastIdent;
            self->_lastIdent = v60;
            goto LABEL_113;
          }
          uint64_t v5 = objc_msgSend_length(self->_lastIdent, a2, v4);
          if (!v5) {
            return v5;
          }
          if (!self->_methodSelector)
          {
            objc_msgSend_stringWithCString_encoding_(NSString, v62, v63, a4, 4);
            v64 = (NSString *)objc_claimAutoreleasedReturnValue();
            v61 = self->_methodSelector;
            self->_methodSelector = v64;
            goto LABEL_113;
          }
          break;
      }
      goto LABEL_2;
    case 0xAuLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 <= 18) {
        goto LABEL_44;
      }
LABEL_39:
      if (a3 != 21)
      {
        if (a3 != 19) {
          return v5;
        }
        declarationAttributes = self->_declarationAttributes;
        double v19 = objc_msgSend_stringWithCString_encoding_(NSString, a2, v4, a4, 4);
        objc_msgSend_addObject_(declarationAttributes, v20, v21, v19);
        goto LABEL_42;
      }
      v46 = objc_msgSend_stringWithCString_encoding_(NSString, a2, v4, a4, 4);
      char isEqualToString = objc_msgSend_isEqualToString_(v46, v47, v48, @",");

      if ((isEqualToString & 1) == 0) {
        goto LABEL_2;
      }
      goto LABEL_182;
    case 0xBuLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 <= 18)
      {
LABEL_44:
        if (!a3) {
          goto LABEL_182;
        }
        if (a3 == 7)
        {
          unint64_t v9 = 9;
          goto LABEL_104;
        }
        return v5;
      }
LABEL_81:
      if (a3 != 21)
      {
LABEL_82:
        if (a3 != 19) {
          return v5;
        }
LABEL_83:
        objc_msgSend_addToken_text_(self, a2, v4, 19, a4);
        goto LABEL_182;
      }
      v52 = objc_msgSend_stringWithCString_encoding_(NSString, a2, v4, a4, 4);
      if (objc_msgSend_isEqualToString_(v52, v53, v54, @","))
      {
        objc_msgSend_addToken_text_(self, v55, v56, 21, a4);

        goto LABEL_182;
      }

      goto LABEL_2;
    case 0xCuLL:
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          uint64_t v5 = objc_msgSend_count(self->_activeTokens, a2, v4);
          if (!v5) {
            return v5;
          }
          objc_msgSend_commitInitializer(self, v22, v23);
          break;
        default:
          goto LABEL_181;
      }
      goto LABEL_53;
    case 0xDuLL:
      LOBYTE(v5) = 0;
      switch(a3)
      {
        case 0uLL:
          goto LABEL_182;
        case 1uLL:
        case 3uLL:
        case 9uLL:
          uint64_t v5 = objc_msgSend_count(self->_activeTokens, a2, v4);
          if (!v5) {
            return v5;
          }
          objc_msgSend_commitImplements(self, v24, v25);
          break;
        case 2uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
          return v5;
        default:
          goto LABEL_82;
      }
LABEL_53:
      self->_unint64_t state = 1;
      if (a3 == 3) {
        objc_msgSend_consumeToken_text_(self, v10, v11, 3, a4);
      }
      goto LABEL_182;
    case 0xEuLL:
      if (a3 != 3) {
        goto LABEL_181;
      }
      uint64_t v5 = objc_msgSend_blockValueDepth(self, a2, v4);
      if (!v5) {
        return v5;
      }
      if (v5 != 1) {
        goto LABEL_181;
      }
      objc_msgSend_addToken_text_(self, a2, v4, 3, a4);
      objc_msgSend_commitFunction(self, v26, v27);
LABEL_59:
      self->_unint64_t state = 0;
      goto LABEL_182;
    case 0xFuLL:
      LOBYTE(v5) = 0;
      if ((uint64_t)a3 > 13)
      {
        switch(a3)
        {
          case 0xEuLL:
          case 0x13uLL:
          case 0x15uLL:
            goto LABEL_181;
          case 0x10uLL:
            if (objc_msgSend_count(self->_activeTokens, a2, v4)) {
              goto LABEL_2;
            }
            BOOL v30 = objc_msgSend_stringWithCString_encoding_(NSString, v28, v29, a4, 4);
            if ((objc_msgSend_isEqualToString_(v30, v31, v32, @"@macro") & 1) != 0
              || (objc_msgSend_isEqualToString_(v30, v33, v34, @"@ifdef") & 1) != 0
              || (objc_msgSend_isEqualToString_(v30, v33, v34, @"@ifndef") & 1) != 0)
            {
              objc_msgSend_addToken_text_(self, v33, v34, 16, a4);
              self->_unint64_t state = 16;

              goto LABEL_182;
            }

            break;
          default:
            return v5;
        }
        goto LABEL_181;
      }
      if (!a3) {
        goto LABEL_182;
      }
      if (a3 == 1 || a3 == 9)
      {
LABEL_101:
        objc_msgSend_commitPragma(self, a2, v4);
        goto LABEL_102;
      }
      return v5;
    case 0x10uLL:
      if (a3 != 16) {
        goto LABEL_181;
      }
      v35 = objc_msgSend_stringWithCString_encoding_(NSString, a2, v4, a4, 4);
      int v38 = objc_msgSend_isEqualToString_(v35, v36, v37, @"@end");

      if (!v38) {
        goto LABEL_181;
      }
      objc_msgSend_addToken_text_(self, a2, v4, 16, a4);
      goto LABEL_101;
    case 0x11uLL:
      if ((uint64_t)a3 <= 15)
      {
        if (!a3) {
          goto LABEL_182;
        }
        if (a3 == 1 || a3 == 9)
        {
          objc_msgSend_commitMacro(self, a2, v4);
LABEL_102:
          unint64_t v9 = 19;
          if (!self->_lookaheadOnly) {
            unint64_t v9 = 0;
          }
LABEL_104:
          self->_unint64_t state = v9;
LABEL_182:
          LOBYTE(v5) = self->_error == 0;
          return v5;
        }
LABEL_181:
        objc_msgSend_addToken_text_(self, a2, v4, a3, a4);
        goto LABEL_182;
      }
      LOBYTE(v5) = 0;
      if (a3 != 16 && a3 != 20)
      {
        if (a3 == 17 && objc_msgSend_count(self->_activeTokens, a2, v4))
        {
LABEL_2:
          LOBYTE(v5) = 0;
          return v5;
        }
        goto LABEL_181;
      }
      return v5;
    case 0x13uLL:
      switch(a3)
      {
        case 0x10uLL:
LABEL_92:
          self->_unint64_t state = 15;
          objc_msgSend_removeAllObjects(self->_activeTokens, a2, v4);
          objc_msgSend_consumeToken_text_(self, v50, v51, 16, a4);
          goto LABEL_182;
        case 0x11uLL:
LABEL_107:
          self->_unint64_t state = 17;
          objc_msgSend_removeAllObjects(self->_activeTokens, a2, v4);
          objc_msgSend_consumeToken_text_(self, v57, v58, 17, a4);
          goto LABEL_182;
        case 0x12uLL:
          goto LABEL_181;
        case 0x13uLL:
          if (self->_lookaheadInFunction && !self->_lookaheadCurrentIdent)
          {
            objc_msgSend_stringWithCString_encoding_(NSString, a2, v4, a4, 4);
            v39 = (NSString *)objc_claimAutoreleasedReturnValue();
            lookaheadCurrentIdent = self->_lookaheadCurrentIdent;
            self->_lookaheadCurrentIdent = v39;

            functionIdentifiers = self->_functionIdentifiers;
            if (!functionIdentifiers)
            {
              objc_msgSend_set(MEMORY[0x263EFF9C0], v41, v42);
              v44 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
              v45 = self->_functionIdentifiers;
              self->_functionIdentifiers = v44;

              functionIdentifiers = self->_functionIdentifiers;
            }
            objc_msgSend_addObject_(functionIdentifiers, v41, v42, self->_lookaheadCurrentIdent);
          }
          goto LABEL_83;
        case 0x14uLL:
          if (objc_msgSend_blockValueDepth(self, a2, v4))
          {
            objc_msgSend_addToken_text_(self, v80, v81, 20, a4);
            goto LABEL_182;
          }
          self->_lookaheadInFunction = 1;
          goto LABEL_160;
        default:
          if (a3 != 3) {
            goto LABEL_181;
          }
          if (self->_lookaheadInFunction && objc_msgSend_blockValueDepth(self, a2, v4) == 1)
          {
            self->_lookaheadInFunction = 0;
            v59 = self->_lookaheadCurrentIdent;
            self->_lookaheadCurrentIdent = 0;
LABEL_127:

LABEL_160:
            objc_msgSend_removeAllObjects(self->_activeTokens, v80, v81);
          }
          else
          {
            objc_msgSend_addToken_text_(self, a2, v4, 3, a4);
          }
          break;
      }
      goto LABEL_182;
    default:
      goto LABEL_182;
  }
}

- (void)addToken:(unint64_t)a3 text:(const char *)a4
{
  objc_msgSend_stringWithCString_encoding_(NSString, a2, v4, a4, 4);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  if (a3 == 22)
  {
    unint64_t v9 = objc_msgSend_newlineCharacterSet(MEMORY[0x263F08708], v7, v8);
    uint64_t v12 = objc_msgSend_rangeOfCharacterFromSet_(v28, v10, v11, v9);

    uint64_t v15 = objc_msgSend_length(v28, v13, v14);
    BOOL v18 = objc_msgSend_substringWithRange_(v28, v16, v17, v12 + 1, v15 - 2 * v12 - 2);

    objc_msgSend_stringWithFormat_(NSString, v19, v20, @"'%@'", v18);
    id v28 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 14;
  }
  activeTokens = self->_activeTokens;
  double v22 = [TMLParserToken alloc];
  double v25 = objc_msgSend_initWithToken_text_(v22, v23, v24, a3, v28);
  objc_msgSend_addObject_(activeTokens, v26, v27, v25);
}

- (unint64_t)blockValueDepth
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  activeTokens = self->_activeTokens;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_239846C2C;
  v5[3] = &unk_264DAC3B8;
  v5[4] = &v6;
  objc_msgSend_enumerateObjectsUsingBlock_(activeTokens, a2, COERCE_DOUBLE(3221225472), v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)commitObject
{
  if (objc_msgSend_count(self->_objectStack, a2, v2))
  {
    objc_msgSend_lastObject(self->_objectStack, v4, v5);
    uint64_t v6 = (TMLMetaObject *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeLastObject(self->_objectStack, v7, v8);
    objc_msgSend_addObject_(v6, v9, v10, self->_activeObject);
    self->_unint64_t state = 1;
    activeObject = self->_activeObject;
    self->_activeObject = v6;
LABEL_3:

    return;
  }
  uint64_t v12 = objc_msgSend_identifier(self->_activeObject, v4, v5);
  uint64_t v15 = objc_msgSend_length(v12, v13, v14);

  if (!v15)
  {
    if (self->_strict)
    {
      double v20 = NSString;
      uint64_t v39 = objc_msgSend_type(self->_activeObject, v16, v17);
      objc_msgSend_stringWithFormat_(v20, v21, v22, @"Missing id property for object of type %@ at line %u", v39, self->_lineNo);
      double v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v23;

      activeObject = (TMLMetaObject *)v39;
      goto LABEL_3;
    }
    double v25 = self->_activeObject;
    double v26 = NSString;
    double v27 = objc_msgSend_type(v25, v16, v17);
    BOOL v30 = objc_msgSend_objects(self->_context, v28, v29);
    uint64_t v33 = objc_msgSend_count(v30, v31, v32);
    v36 = objc_msgSend_stringWithFormat_(v26, v34, v35, @"%@-%ld", v27, v33);
    objc_msgSend_addProperty_value_(v25, v37, v38, @"id", v36);
  }
  context = self->_context;
  double v19 = self->_activeObject;
  objc_msgSend_addObject_(context, v16, v17, v19);
}

- (void)commitProperty
{
  uint64_t v165 = *MEMORY[0x263EF8340];
  if (self->_lastIdent)
  {
    double v4 = objc_msgSend_lastObject(self->_activeTokens, a2, v2);
    uint64_t v7 = objc_msgSend_token(v4, v5, v6);

    if (!v7) {
      objc_msgSend_removeLastObject(self->_activeTokens, v8, v9);
    }
    uint64_t v11 = objc_msgSend_length(self->_declarationType, v8, v9);
    BOOL v13 = v11 != 0;
    if (v11)
    {
      objc_msgSend_addPropertyDeclaration_typeName_attributes_(self->_activeObject, v10, v12, self->_lastIdent, self->_declarationType, self->_declarationAttributes);
      declarationType = self->_declarationType;
      self->_declarationType = 0;

      objc_msgSend_removeAllObjects(self->_declarationAttributes, v15, v16);
      goto LABEL_11;
    }
    if (objc_msgSend_count(self->_activeTokens, v10, v12))
    {
LABEL_11:
      uint64_t v25 = objc_msgSend_count(self->_activeTokens, v17, v18);
      activeTokens = self->_activeTokens;
      if (v25 == 1)
      {
        id v28 = objc_msgSend_objectAtIndexedSubscript_(activeTokens, v24, v26, 0);
        lastIdent = 0;
        switch(objc_msgSend_token(v28, v29, v30))
        {
          case 11:
            double v34 = NSNumber;
            double v35 = objc_msgSend_text(v28, v31, v32);
            uint64_t v38 = objc_msgSend_integerValue(v35, v36, v37);
            objc_msgSend_numberWithInteger_(v34, v39, v40, v38);
            id v41 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_36;
          case 12:
            double v116 = NSNumber;
            double v35 = objc_msgSend_text(v28, v31, v32);
            objc_msgSend_floatValue(v35, v117, v118);
            objc_msgSend_numberWithFloat_(v116, v119, v120);
            id v41 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_36;
          case 13:
            double v35 = objc_msgSend_text(v28, v31, v32);
            int v123 = objc_msgSend_BOOLValue(v35, v121, v122);
            unint64_t v124 = (void *)MEMORY[0x263EFFA80];
            if (v123) {
              unint64_t v124 = (void *)MEMORY[0x263EFFA88];
            }
            id v41 = v124;
LABEL_36:
            lastIdent = v41;

            goto LABEL_50;
          case 14:
            v125 = objc_msgSend_text(v28, v31, v32);
            int v128 = objc_msgSend_characterAtIndex_(v125, v126, v127, 0);
            uint64_t v131 = objc_msgSend_length(v125, v129, v130);
            lastIdent = objc_msgSend_substringWithRange_(v125, v132, v133, 1, v131 - 2);

            if (v128 == 34)
            {
              v134 = objc_opt_class();
              uint64_t v137 = objc_msgSend_unescapeString_(v134, v135, v136, lastIdent);

              lastIdent = (void *)v137;
            }
            goto LABEL_50;
          case 15:
            break;
          case 19:
            v138 = objc_msgSend_text(v28, v31, v32);
            int isEqualToString = objc_msgSend_isEqualToString_(v138, v139, v140, @"null");

            if (isEqualToString)
            {
              uint64_t v144 = objc_msgSend_null(MEMORY[0x263EFF9D0], v142, v143);
LABEL_47:
              lastIdent = (void *)v144;
              goto LABEL_50;
            }
            if ((objc_msgSend_isEqualToString_(self->_lastIdent, v142, v143, @"id") & 1) != 0
              || (objc_msgSend_isEqualToString_(self->_lastIdent, v31, v32, @"superclass") & 1) != 0
              || objc_msgSend_isEqualToString_(self->_lastIdent, v31, v32, @"nativeclass"))
            {
              uint64_t v144 = objc_msgSend_text(v28, v31, v32);
              goto LABEL_47;
            }
            break;
          default:
            goto LABEL_50;
        }
      }
      else
      {
        if (!objc_msgSend_count(activeTokens, v24, v26))
        {
          if (v11)
          {
LABEL_53:
            objc_msgSend_removeAllObjects(self->_activeTokens, v42, v43);
            lastIdent = self->_lastIdent;
            self->_lastIdent = 0;
            goto LABEL_55;
          }
LABEL_54:
          v152 = NSString;
          v153 = self->_lastIdent;
          lastIdent = objc_msgSend_type(self->_activeObject, v42, v43);
          objc_msgSend_stringWithFormat_(v152, v154, v155, @"Unrecognized value for '%@' of type %@ at line %d", v153, lastIdent, self->_lineNo);
          v156 = (NSString *)objc_claimAutoreleasedReturnValue();
          error = self->_error;
          self->_error = v156;

          goto LABEL_55;
        }
        if (qword_268A05768 != -1) {
          dispatch_once(&qword_268A05768, &unk_26ECEBED8);
        }
        v44 = (void *)qword_268A05770;
        v45 = self->_lastIdent;
        uint64_t v46 = objc_msgSend_length(v45, v42, v43);
        id v28 = objc_msgSend_firstMatchInString_options_range_(v44, v47, v48, v45, 0, 0, v46);
        if (v28)
        {
          v49 = objc_msgSend_firstObject(self->_activeTokens, v31, v32);
          uint64_t v52 = objc_msgSend_token(v49, v50, v51);

          if (v52 == 2
            || (objc_msgSend_firstObject(self->_activeTokens, v31, v32),
                v53 = objc_claimAutoreleasedReturnValue(),
                objc_msgSend_text(v53, v54, v55),
                double v56 = objc_claimAutoreleasedReturnValue(),
                int v59 = objc_msgSend_isEqualToString_(v56, v57, v58, @"function"),
                v56,
                v53,
                v59))
          {
            v60 = self->_lastIdent;
            uint64_t v61 = objc_msgSend_rangeAtIndex_(v28, v31, v32, 3);
            v64 = objc_msgSend_substringWithRange_(v60, v62, v63, v61, v62);
            v67 = objc_msgSend_substringWithRange_(v64, v65, v66, 0, 1);
            v70 = objc_msgSend_lowercaseString(v67, v68, v69);
            v73 = objc_msgSend_substringFromIndex_(v64, v71, v72, 1);
            uint64_t v76 = objc_msgSend_stringByAppendingString_(v70, v74, v75, v73);

            v77 = self->_lastIdent;
            uint64_t v80 = objc_msgSend_rangeAtIndex_(v28, v78, v79, 1);
            double v83 = objc_msgSend_substringWithRange_(v77, v81, v82, v80, v81);
            v86 = objc_msgSend_stringByAppendingString_(v83, v84, v85, v76);

            v89 = objc_msgSend_signalDeclaration_(self->_activeObject, v87, v88, v86);
            v92 = objc_msgSend_parameters(v89, v90, v91);
            uint64_t v95 = objc_msgSend_count(v92, v93, v94);

            if (v95)
            {
              id v159 = v76;
              double v98 = objc_msgSend_set(MEMORY[0x263EFF9C0], v96, v97);
              long long v160 = 0u;
              long long v161 = 0u;
              long long v162 = 0u;
              long long v163 = 0u;
              v100 = objc_msgSend_parameters(v89, v99, 0.0);
              uint64_t v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v101, v102, &v160, v164, 16);
              if (v103)
              {
                uint64_t v106 = v103;
                uint64_t v107 = *(void *)v161;
                do
                {
                  for (uint64_t i = 0; i != v106; ++i)
                  {
                    if (*(void *)v161 != v107) {
                      objc_enumerationMutation(v100);
                    }
                    double v109 = objc_msgSend_propertyName(*(void **)(*((void *)&v160 + 1) + 8 * i), v104, v105);
                    objc_msgSend_addObject_(v98, v110, v111, v109);
                  }
                  uint64_t v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v104, v105, &v160, v164, 16);
                }
                while (v106);
              }

              uint64_t v76 = v159;
            }
            else
            {
              double v98 = 0;
            }
            v145 = objc_msgSend_compileFunction_bodyOnly_localVars_(self, v96, v97, self->_activeTokens, 0, v98);
            v146 = [TMLSignalHandlerFunction alloc];
            v149 = objc_msgSend_initWithSignalName_functionName_body_(v146, v147, v148, v76, self->_lastIdent, v145);
            objc_msgSend_addSignalHandler_signalTarget_(self->_activeObject, v150, v151, v149, v86);

            lastIdent = 0;
            BOOL v13 = 1;
LABEL_50:

            if (lastIdent)
            {
              objc_msgSend_addProperty_value_(self->_activeObject, v42, v43, self->_lastIdent, lastIdent);

              goto LABEL_53;
            }
            if (v13) {
              goto LABEL_53;
            }
            goto LABEL_54;
          }
        }
      }
      lastIdent = objc_msgSend_compileExpression_(self, v31, v32, self->_activeTokens);
      if (self->_error)
      {

LABEL_55:
        return;
      }
      goto LABEL_50;
    }
    v112 = NSString;
    double v113 = self->_lastIdent;
    objc_msgSend_type(self->_activeObject, v17, v18);
    id v158 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v112, v114, v115, @"Missing value for property '%@' of type %@ at line %d", v113, v158, self->_lineNo);
  }
  else
  {
    double v19 = NSString;
    objc_msgSend_type(self->_activeObject, a2, v2);
    id v158 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v19, v20, v21, @"Missing property name for type %@ at line %d", v158, self->_lineNo);
  }
  double v22 = (NSString *)objc_claimAutoreleasedReturnValue();
  double v23 = self->_error;
  self->_error = v22;
}

- (void)commitInitializer
{
  activeTokens = self->_activeTokens;
  double v4 = [TMLParserToken alloc];
  uint64_t v7 = objc_msgSend_initWithToken_text_(v4, v5, v6, 19, @"$ctor");
  objc_msgSend_insertObject_atIndex_(activeTokens, v8, v9, v7, 0);

  double v10 = self->_activeTokens;
  uint64_t v11 = [TMLParserToken alloc];
  double v14 = objc_msgSend_initWithToken_text_(v11, v12, v13, 10, @".");
  objc_msgSend_insertObject_atIndex_(v10, v15, v16, v14, 1);

  double v19 = objc_msgSend_compileFunction_bodyOnly_(self, v17, v18, self->_activeTokens, 1);
  objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(v19, v20, v21, @"$ctor.$", @"$ctor$", 0, 0, 7);
  id v31 = (id)objc_claimAutoreleasedReturnValue();

  activeObject = self->_activeObject;
  double v23 = [TMLValueExpression alloc];
  double v26 = objc_msgSend_initWithExpressionText_bindings_(v23, v24, v25, v31, &unk_26ED1B3F0);
  objc_msgSend_setInitializer_(activeObject, v27, v28, v26);

  objc_msgSend_removeAllObjects(self->_activeTokens, v29, v30);
}

- (void)commitImplements
{
  activeTokens = self->_activeTokens;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_239847774;
  v6[3] = &unk_264DAC3E0;
  v6[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(activeTokens, a2, COERCE_DOUBLE(3221225472), v6);
  objc_msgSend_removeAllObjects(self->_activeTokens, v4, v5);
}

- (void)commitFunction
{
  if ((unint64_t)objc_msgSend_count(self->_activeTokens, a2, v2) >= 7
    && (objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v4, v5, 2),
        double v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = objc_msgSend_token(v6, v7, v8),
        v6,
        v9 == 19))
  {
    double v10 = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v4, v5, 2);
    uint64_t v25 = objc_msgSend_text(v10, v11, v12);

    uint64_t v15 = objc_msgSend_compileFunction_bodyOnly_(self, v13, v14, self->_activeTokens, 0);
    context = self->_context;
    double v17 = [TMLFunction alloc];
    double v20 = objc_msgSend_initWithName_body_(v17, v18, v19, v25, v15);
    objc_msgSend_addFunction_(context, v21, v22, v20);

    objc_msgSend_removeAllObjects(self->_activeTokens, v23, v24);
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, v4, v5, @"Incomplete function at line %d", self->_lineNo);
    self->_error = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  MEMORY[0x270F9A758]();
}

- (void)commitPragma
{
  double v4 = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, a2, v2, 0);
  uint64_t v7 = objc_msgSend_text(v4, v5, v6);

  if (!objc_msgSend_isEqualToString_(v7, v8, v9, @"@include"))
  {
    if (objc_msgSend_isEqualToString_(v7, v10, v11, @"@export"))
    {
      id v16 = objc_alloc(MEMORY[0x263EFF980]);
      double v19 = objc_msgSend_initWithCapacity_(v16, v17, v18, 4);
      objc_msgSend_removeObjectAtIndex_(self->_activeTokens, v20, v21, 0);
      activeTokens = self->_activeTokens;
      v119[0] = MEMORY[0x263EF8330];
      v119[1] = 3221225472;
      v119[2] = sub_239847EAC;
      v119[3] = &unk_264DAC408;
      id v120 = v19;
      double v121 = self;
      id v122 = v7;
      id v23 = v19;
      objc_msgSend_enumerateObjectsUsingBlock_(activeTokens, v24, v25, v119);
      objc_msgSend_addExports_(self->_context, v26, v27, v23);

LABEL_38:
      goto LABEL_39;
    }
    if (objc_msgSend_isEqualToString_(v7, v14, v15, @"@require"))
    {
      objc_msgSend_removeObjectAtIndex_(self->_activeTokens, v42, v43, 0);
      v44 = self->_activeTokens;
      v117[0] = MEMORY[0x263EF8330];
      v117[1] = 3221225472;
      v117[2] = sub_239847F9C;
      v117[3] = &unk_264DAC430;
      v117[4] = self;
      id v118 = v7;
      objc_msgSend_enumerateObjectsUsingBlock_(v44, v45, v46, v117);

LABEL_39:
      objc_msgSend_removeAllObjects(self->_activeTokens, v47, v48);
      goto LABEL_40;
    }
    if ((objc_msgSend_isEqualToString_(v7, v42, v43, @"@macro") & 1) == 0
      && (objc_msgSend_isEqualToString_(v7, v49, v50, @"@ifdef") & 1) == 0
      && !objc_msgSend_isEqualToString_(v7, v49, v50, @"@ifndef"))
    {
      objc_msgSend_stringWithFormat_(NSString, v49, v50, @"Unsupported pragma %@ at line %d", v7, self->_lineNo);
      goto LABEL_29;
    }
    if ((unint64_t)objc_msgSend_count(self->_activeTokens, v49, v50) <= 1)
    {
      objc_msgSend_stringWithFormat_(NSString, v51, v52, @"Missing macro name at line %d", self->_lineNo);
      goto LABEL_29;
    }
    v53 = objc_msgSend_lastObject(self->_activeTokens, v51, v52);
    double v56 = objc_msgSend_text(v53, v54, v55);
    char isEqualToString = objc_msgSend_isEqualToString_(v56, v57, v58, @"@end");

    if ((isEqualToString & 1) == 0)
    {
      objc_msgSend_stringWithFormat_(NSString, v60, v61, @"Missing macro end at line %d", self->_lineNo);
      goto LABEL_29;
    }
    v62 = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v60, v61, 2);
    objc_msgSend_text(v62, v63, v64);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_removeObjectsInRange_(self->_activeTokens, v65, v66, 0, 3);
    objc_msgSend_removeLastObject(self->_activeTokens, v67, v68);
    double v71 = objc_msgSend_firstObject(self->_activeTokens, v69, v70);
    uint64_t v74 = objc_msgSend_token(v71, v72, v73);

    if (v74 == 1) {
      objc_msgSend_removeObjectAtIndex_(self->_activeTokens, v75, v76, 0);
    }
    v77 = objc_msgSend_lastObject(self->_activeTokens, v75, v76);
    uint64_t v80 = objc_msgSend_token(v77, v78, v79);

    if (v80 == 1) {
      objc_msgSend_removeLastObject(self->_activeTokens, v81, v82);
    }
    id v83 = objc_alloc(MEMORY[0x263F089D8]);
    uint64_t v86 = objc_msgSend_count(self->_activeTokens, v84, v85);
    v89 = objc_msgSend_initWithCapacity_(v83, v87, v88, 10 * v86);
    double v90 = self->_activeTokens;
    v115[0] = MEMORY[0x263EF8330];
    v115[1] = 3221225472;
    v115[2] = sub_239848090;
    v115[3] = &unk_264DAC3E0;
    id v91 = v89;
    id v116 = v91;
    objc_msgSend_enumerateObjectsUsingBlock_(v90, v92, v93, v115);
    if (objc_msgSend_isEqualToString_(v7, v94, v95, @"@ifdef"))
    {
      if (objc_msgSend_containsObject_(self->_preprocessorMacros, v96, v97, v23))
      {
        objc_msgSend_removeAllObjects(self->_activeTokens, v98, v99);
        basePath = self->_basePath;
        filename = self->_filename;
        if (self->_lookaheadOnly)
        {
          objc_msgSend_parseFunctionLookaheadWithString_basePath_filename_(self, v100, v101, v91, basePath, filename);
          goto LABEL_37;
        }
LABEL_33:
        objc_msgSend_parseString_basePath_filename_(self, v100, v101, v91, basePath, filename);
      }
    }
    else
    {
      if (!objc_msgSend_isEqualToString_(v7, v96, v97, @"@ifndef"))
      {
        if (!self->_macros)
        {
          v110 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
          macros = self->_macros;
          self->_macros = v110;
        }
        v112 = objc_msgSend_macroTextWithMacroText_basePath_filename_(TMLMacroText, v106, v107, v91, self->_basePath, self->_filename);
        objc_msgSend_setObject_forKeyedSubscript_(self->_macros, v113, v114, v112, v23);

        goto LABEL_37;
      }
      if ((objc_msgSend_containsObject_(self->_preprocessorMacros, v106, v107, v23) & 1) == 0)
      {
        objc_msgSend_removeAllObjects(self->_activeTokens, v108, v109);
        basePath = self->_basePath;
        filename = self->_filename;
        goto LABEL_33;
      }
    }
LABEL_37:

    goto LABEL_38;
  }
  if ((unint64_t)objc_msgSend_count(self->_activeTokens, v10, v11) > 1)
  {
    if (!self->_basePath)
    {
      objc_msgSend_stringWithFormat_(NSString, v12, v13, @"Include pragma is invalid for source at line %d", self->_lineNo);
      goto LABEL_29;
    }
    double v28 = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v12, v13, 1);
    id v31 = objc_msgSend_text(v28, v29, v30);

    uint64_t v34 = objc_msgSend_length(v31, v32, v33);
    double v37 = objc_msgSend_substringWithRange_(v31, v35, v36, 1, v34 - 2);

    objc_msgSend_stringByAppendingPathComponent_(self->_basePath, v38, v39, v37);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_lookaheadOnly) {
      objc_msgSend_parseFunctionLookaheadWithFile_(self, v40, v41, v23);
    }
    else {
      objc_msgSend_parseFile_(self, v40, v41, v23);
    }
    goto LABEL_38;
  }
  objc_msgSend_stringWithFormat_(NSString, v12, v13, @"Missing argument for pragma %@ at line %d", v7, self->_lineNo);
LABEL_29:
  double v104 = (NSString *)objc_claimAutoreleasedReturnValue();
  error = self->_error;
  self->_error = v104;

LABEL_40:
}

- (void)commitMacro
{
  double v4 = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, a2, v2, 0);
  uint64_t v7 = objc_msgSend_text(v4, v5, v6);
  double v10 = objc_msgSend_substringFromIndex_(v7, v8, v9, 1);

  double v13 = objc_msgSend_objectForKeyedSubscript_(self->_macros, v11, v12, v10);
  id v16 = objc_msgSend_macroText(v13, v14, v15);
  double v19 = objc_msgSend_mutableCopy(v16, v17, v18);

  if (v19)
  {
    id v22 = objc_alloc_init(MEMORY[0x263F089D8]);
    uint64_t v70 = 0;
    double v71 = &v70;
    uint64_t v72 = 0x2020000000;
    uint64_t v73 = 0;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2020000000;
    uint64_t v69 = 0;
    objc_msgSend_removeObjectAtIndex_(self->_activeTokens, v23, COERCE_DOUBLE(0x2020000000), 0);
    id v24 = objc_alloc(MEMORY[0x263EFF980]);
    double v27 = objc_msgSend_initWithObjects_(v24, v25, v26, &stru_26ECF02A8, 0);
    activeTokens = self->_activeTokens;
    v61[0] = MEMORY[0x263EF8330];
    v61[1] = 3221225472;
    v61[2] = sub_239848458;
    v61[3] = &unk_264DAC458;
    double v64 = &v70;
    id v29 = v22;
    id v62 = v29;
    v65 = &v66;
    id v30 = v27;
    id v63 = v30;
    objc_msgSend_enumerateObjectsUsingBlock_(activeTokens, v31, v32, v61);
    if (v71[3] || v67[3])
    {
      objc_msgSend_stringWithFormat_(NSString, v33, v34, @"Invalid macro argument %@ at line %d", v10, self->_lineNo);
      double v35 = (NSString *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v35;
    }
    else
    {
      double v39 = objc_msgSend_copy(v29, v33, v34);
      objc_msgSend_addObject_(v30, v40, v41, v39);

      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = sub_2398485C8;
      v59[3] = &unk_264DAC480;
      double v42 = v19;
      v60 = v42;
      objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v30, v43, v44, 2, v59);
      objc_msgSend_removeAllObjects(self->_activeTokens, v45, v46);
      if (self->_lookaheadOnly)
      {
        v49 = objc_msgSend_basePath(v13, v47, v48);
        double v52 = objc_msgSend_filename(v13, v50, v51);
        objc_msgSend_parseFunctionLookaheadWithString_basePath_filename_(self, v53, v54, v42, v49, v52);
      }
      else
      {
        v49 = objc_msgSend_basePath(v13, v47, v48);
        double v52 = objc_msgSend_filename(v13, v55, v56);
        objc_msgSend_parseString_basePath_filename_(self, v57, v58, v42, v49, v52);
      }

      error = v60;
    }

    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(&v70, 8);
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, v20, v21, @"Undeclared macro %@ at line %d", v10, self->_lineNo);
    double v37 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v38 = self->_error;
    self->_error = v37;
  }
}

- (void)commitSignal
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  unint64_t v6 = objc_msgSend_count(self->_activeTokens, v4, v5);
  id v71 = (id)objc_msgSend_initWithCapacity_(v3, v7, v8, v6 >> 1);
  if ((unint64_t)objc_msgSend_count(self->_activeTokens, v9, v10) < 2)
  {
LABEL_10:
    activeObject = self->_activeObject;
    lastIdent = self->_lastIdent;
    if (objc_msgSend_length(self->_declarationType, v11, v12)) {
      declarationType = (__CFString *)self->_declarationType;
    }
    else {
      declarationType = @"void";
    }
    methodSelector = self->_methodSelector;
    uint64_t v57 = objc_msgSend_length(methodSelector, v52, v53);
    v60 = objc_msgSend_substringWithRange_(methodSelector, v58, v59, 10, v57 - 11);
    objc_msgSend_addSignalDeclaration_returnType_parameters_methodSelector_attributes_(activeObject, v61, v62, lastIdent, declarationType, v71, v60, self->_declarationAttributes);

    objc_msgSend_removeAllObjects(self->_activeTokens, v63, v64);
    objc_msgSend_removeAllObjects(self->_declarationAttributes, v65, v66);
    v67 = self->_methodSelector;
    self->_methodSelector = 0;

    uint64_t v68 = self->_lastIdent;
    self->_lastIdent = 0;

    double v14 = self->_declarationType;
    self->_declarationType = 0;
    goto LABEL_17;
  }
  uint64_t v13 = 0;
  while (1)
  {
    double v14 = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v11, v12, v13);
    double v17 = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v15, v16, v13 + 1);
    if (objc_msgSend_token(v14, v18, v19) != 19 || objc_msgSend_token(v17, v20, v21) != 19)
    {
      objc_msgSend_stringWithFormat_(NSString, v20, v21, @"Malformed signal parameters declaration at line %d", self->_lineNo);
      double v55 = (NSString *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v55;
      goto LABEL_16;
    }
    id v22 = [TMLPropertyDescriptor alloc];
    double v25 = objc_msgSend_text(v17, v23, v24);
    double v28 = objc_msgSend_text(v14, v26, v27);
    id v31 = objc_msgSend_initWithName_typeName_attributes_(v22, v29, v30, v25, v28, 0);
    objc_msgSend_addObject_(v71, v32, v33, v31);

    uint64_t v34 = v13 + 2;
    if (v13 + 2 < (unint64_t)objc_msgSend_count(self->_activeTokens, v35, v36)) {
      break;
    }
LABEL_9:

    uint64_t v13 = v34;
    if ((unint64_t)(objc_msgSend_count(self->_activeTokens, v48, v49) - v34) <= 1) {
      goto LABEL_10;
    }
  }
  error = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v37, v38, v13 + 2);
  if (objc_msgSend_token(error, v40, v41) == 21)
  {
    double v44 = objc_msgSend_text(error, v42, v43);
    char isEqualToString = objc_msgSend_isEqualToString_(v44, v45, v46, @",");

    if (isEqualToString)
    {
      uint64_t v34 = v13 + 3;

      goto LABEL_9;
    }
  }
  objc_msgSend_stringWithFormat_(NSString, v42, v43, @"Malformed signal parameters declaration at line %d", self->_lineNo);
  uint64_t v69 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v70 = self->_error;
  self->_error = v69;

LABEL_16:
LABEL_17:
}

- (void)commitMethod
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  unint64_t v6 = objc_msgSend_count(self->_activeTokens, v4, v5);
  id v74 = (id)objc_msgSend_initWithCapacity_(v3, v7, v8, v6 >> 1);
  if ((unint64_t)objc_msgSend_count(self->_activeTokens, v9, v10) >= 2)
  {
    uint64_t v13 = 0;
    do
    {
      declarationType = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v11, v12, v13);
      double v17 = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v15, v16, v13 + 1);
      if (objc_msgSend_token(declarationType, v18, v19) != 19 || objc_msgSend_token(v17, v20, v21) != 19)
      {
        objc_msgSend_stringWithFormat_(NSString, v20, v21, @"Malformed signal parameters declaration at line %d", self->_lineNo);
        double v64 = (NSString *)objc_claimAutoreleasedReturnValue();
        error = self->_error;
        self->_error = v64;
        goto LABEL_19;
      }
      id v22 = [TMLPropertyDescriptor alloc];
      double v25 = objc_msgSend_text(v17, v23, v24);
      double v28 = objc_msgSend_text(declarationType, v26, v27);
      id v31 = objc_msgSend_initWithName_typeName_attributes_(v22, v29, v30, v25, v28, 0);
      objc_msgSend_addObject_(v74, v32, v33, v31);

      uint64_t v34 = v13 + 2;
      if (v13 + 2 < (unint64_t)objc_msgSend_count(self->_activeTokens, v35, v36))
      {
        error = objc_msgSend_objectAtIndexedSubscript_(self->_activeTokens, v37, v38, v13 + 2);
        if (objc_msgSend_token(error, v40, v41) != 21
          || (objc_msgSend_text(error, v42, v43),
              double v44 = objc_claimAutoreleasedReturnValue(),
              char isEqualToString = objc_msgSend_isEqualToString_(v44, v45, v46, @","),
              v44,
              (isEqualToString & 1) == 0))
        {
          objc_msgSend_stringWithFormat_(NSString, v42, v43, @"Malformed signal parameters declaration at line %d", self->_lineNo);
          uint64_t v72 = (NSString *)objc_claimAutoreleasedReturnValue();
          uint64_t v73 = self->_error;
          self->_error = v72;

LABEL_19:
          goto LABEL_20;
        }
        uint64_t v34 = v13 + 3;
      }
      uint64_t v13 = v34;
    }
    while ((unint64_t)(objc_msgSend_count(self->_activeTokens, v48, v49) - v34) > 1);
  }
  methodSelector = self->_methodSelector;
  uint64_t v51 = objc_msgSend_length(methodSelector, v11, v12);
  objc_msgSend_substringWithRange_(methodSelector, v52, v53, 10, v51 - 11);
  double v54 = (NSString *)objc_claimAutoreleasedReturnValue();
  double v55 = self->_methodSelector;
  self->_methodSelector = v54;

  if (self->_methodDeclaration)
  {
    activeObject = self->_activeObject;
    lastIdent = self->_lastIdent;
    if (objc_msgSend_length(self->_declarationType, v56, v57)) {
      objc_msgSend_addMethodDeclaration_returnType_parameters_methodSelector_attributes_(activeObject, v60, v61, lastIdent, self->_declarationType, v74, self->_methodSelector, self->_declarationAttributes);
    }
    else {
      objc_msgSend_addMethodDeclaration_returnType_parameters_methodSelector_attributes_(activeObject, v60, v61, lastIdent, @"void", v74, self->_methodSelector, self->_declarationAttributes);
    }
  }
  else
  {
    if (objc_msgSend_length(self->_declarationType, v56, v57))
    {
      objc_msgSend_stringWithFormat_(NSString, v65, v66, @"Malformed constructor declaration at line %d", self->_lineNo);
      v67 = (NSString *)objc_claimAutoreleasedReturnValue();
      declarationType = self->_error;
      self->_error = v67;
      goto LABEL_20;
    }
    objc_msgSend_addConstructorDeclaration_parameters_methodSelector_attributes_(self->_activeObject, v65, v66, self->_lastIdent, v74, self->_methodSelector, self->_declarationAttributes);
  }
  objc_msgSend_removeAllObjects(self->_activeTokens, v62, v63);
  objc_msgSend_removeAllObjects(self->_declarationAttributes, v68, v69);
  uint64_t v70 = self->_methodSelector;
  self->_methodSelector = 0;

  id v71 = self->_lastIdent;
  self->_lastIdent = 0;

  declarationType = self->_declarationType;
  self->_declarationType = 0;
LABEL_20:
}

- (id)compileExpression:(id)a3
{
  id v4 = a3;
  if ((unint64_t)objc_msgSend_count(v4, v5, v6) >= 3)
  {
    double v9 = objc_msgSend_firstObject(v4, v7, v8);
    if (objc_msgSend_token(v9, v10, v11) == 19)
    {
      double v14 = objc_msgSend_lastObject(v4, v12, v13);
      uint64_t v17 = objc_msgSend_token(v14, v15, v16);

      if (v17 == 3)
      {
        uint64_t v101 = 0;
        double v102 = &v101;
        uint64_t v103 = 0x2020000000;
        char v104 = 0;
        v100[0] = MEMORY[0x263EF8330];
        v100[1] = 3221225472;
        v100[2] = sub_2398490A4;
        v100[3] = &unk_264DAC3B8;
        v100[4] = &v101;
        objc_msgSend_enumerateObjectsUsingBlock_(v4, v18, COERCE_DOUBLE(3221225472), v100);
        if (*((unsigned char *)v102 + 24))
        {
          double v19 = objc_alloc_init(TMLMetaContext);
          id v20 = objc_alloc((Class)objc_opt_class());
          id v23 = objc_msgSend_initWithContext_(v20, v21, v22, v19);
          objc_msgSend_setStrict_(v23, v24, v25, 0);
          if (objc_msgSend_parseTokens_startingLine_(v23, v26, v27, v4, 0))
          {
            double v30 = objc_msgSend_rootObject(v19, v28, v29);
          }
          else
          {
            objc_msgSend_error(v23, v28, v29);
            double v87 = (NSString *)objc_claimAutoreleasedReturnValue();
            error = self->_error;
            self->_error = v87;

            double v30 = 0;
          }

          _Block_object_dispose(&v101, 8);
          goto LABEL_17;
        }
        _Block_object_dispose(&v101, 8);
      }
    }
    else
    {
    }
  }
  id v31 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v34 = objc_msgSend_count(v4, v32, v33);
  double v37 = objc_msgSend_initWithCapacity_(v31, v35, v36, 5 * v34);
  id v38 = objc_alloc(MEMORY[0x263EFF980]);
  double v41 = objc_msgSend_initWithCapacity_(v38, v39, v40, 4);
  id v42 = objc_alloc(MEMORY[0x263F089D8]);
  v45 = objc_msgSend_initWithCapacity_(v42, v43, v44, 64);
  double v46 = objc_opt_class();
  double v49 = objc_msgSend_transformObjectCreation_(v46, v47, v48, v4);

  double v50 = objc_opt_class();
  double v53 = objc_msgSend_transformFunction_(v50, v51, v52, v49);

  double v56 = objc_msgSend_array(MEMORY[0x263EFF980], v54, v55);
  double v57 = objc_alloc_init(TMLJSScope);
  objc_msgSend_setType_(v57, v58, v59, 0);
  objc_msgSend_addObject_(v56, v60, v61, v57);
  uint64_t v101 = 0;
  double v102 = &v101;
  uint64_t v103 = 0x2020000000;
  char v104 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x2020000000;
  char v99 = 0;
  v89[0] = MEMORY[0x263EF8330];
  v89[1] = 3221225472;
  v89[2] = sub_239849150;
  v89[3] = &unk_264DAC4A8;
  id v4 = v53;
  id v90 = v4;
  id v62 = v37;
  id v91 = v62;
  id v63 = v45;
  id v92 = v63;
  double v93 = self;
  v96 = v98;
  id v64 = v56;
  id v94 = v64;
  double v97 = &v101;
  id v65 = v41;
  id v95 = v65;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v66, v67, v89);
  if (objc_msgSend_length(v63, v68, v69))
  {
    uint64_t v72 = objc_msgSend_count(v65, v70, v71);
    objc_msgSend_appendFormat_(v62, v73, v74, @"$(%u)", v72);
    v77 = objc_msgSend_copy(v63, v75, v76);
    objc_msgSend_addObject_(v65, v78, v79, v77);
  }
  if (self->_error)
  {
    double v30 = 0;
  }
  else
  {
    uint64_t v80 = [TMLValueExpression alloc];
    if (objc_msgSend_count(v65, v81, v82)) {
      uint64_t v85 = objc_msgSend_initWithExpressionText_bindings_(v80, v83, v84, v62, v65);
    }
    else {
      uint64_t v85 = objc_msgSend_initWithExpressionText_bindings_(v80, v83, v84, v62, 0);
    }
    double v30 = (void *)v85;
  }

  _Block_object_dispose(v98, 8);
  _Block_object_dispose(&v101, 8);

LABEL_17:
  return v30;
}

+ (id)transformFunction:(id)a3
{
  double v5 = objc_msgSend_mutableCopy(a3, a2, v3);
  if (objc_msgSend_count(v5, v6, v7))
  {
    char v10 = 0;
    for (unint64_t i = 0; i < objc_msgSend_count(v5, v18, v19); ++i)
    {
      double v12 = objc_msgSend_objectAtIndexedSubscript_(v5, v8, v9, i);
      uint64_t v15 = objc_msgSend_token(v12, v13, v14);
      if (!v15)
      {
        if (v10)
        {
          id v20 = objc_msgSend_objectAtIndexedSubscript_(v5, v16, v17, i - 1);
          id v23 = objc_msgSend_text(v20, v21, v22);

          if (i + 1 >= objc_msgSend_count(v5, v24, v25))
          {
            id v31 = 0;
          }
          else
          {
            double v28 = objc_msgSend_objectAtIndexedSubscript_(v5, v26, v27, i + 1);
            id v31 = objc_msgSend_text(v28, v29, v30);
          }
          if ((sub_2398496DC(v23) & 1) == 0 && (sub_2398496DC(v31) & 1) == 0) {
            objc_msgSend_removeObjectAtIndex_(v5, v59, v60, i--);
          }

          char v10 = 1;
        }
        else
        {
          char v10 = 0;
        }
        goto LABEL_7;
      }
      if (v15 != 6)
      {
        if (v15 == 2) {
          char v10 = 1;
        }
        goto LABEL_7;
      }
      if (i >= 3)
      {
        double v32 = objc_msgSend_objectAtIndexedSubscript_(v5, v16, v17, i - 2);
        if (objc_msgSend_token(v32, v33, v34) == 10)
        {
          unint64_t v112 = i - 1;
          double v37 = objc_msgSend_objectAtIndexedSubscript_(v5, v35, v36);
          uint64_t v40 = objc_msgSend_token(v37, v38, v39);

          if (v40 == 19)
          {
            double v43 = objc_msgSend_objectAtIndexedSubscript_(v5, v41, v42, i - 3);
            double v46 = objc_msgSend_text(v43, v44, v45);
            char isBuiltinObject = objc_msgSend_isBuiltinObject_(a1, v47, v48, v46);

            if ((isBuiltinObject & 1) == 0)
            {
              if (objc_msgSend_token(v43, v50, v51) == 19)
              {
                double v54 = objc_msgSend_text(v43, v52, v53);
                if (objc_msgSend_isEqualToString_(v54, v55, v56, @"$ctor"))
                {

                  goto LABEL_27;
                }
                if ((uint64_t)(i - 4) < 0) {
                  goto LABEL_40;
                }
                double v109 = v54;
                id v111 = a1;
                unint64_t v102 = i;
                while (1)
                {
                  uint64_t v103 = v102 - 4;
                  char v104 = objc_msgSend_objectAtIndexedSubscript_(v5, v57, v58, v102 - 4);
                  uint64_t v107 = objc_msgSend_token(v104, v105, v106);

                  if (v107)
                  {
                    if (v107 != 10) {
                      break;
                    }
                  }
                  --v102;
                  if (v103 <= 0)
                  {
                    double v54 = v109;
                    a1 = v111;
                    goto LABEL_40;
                  }
                }
                double v54 = v109;
                a1 = v111;
                if (v107 == 15)
                {

                  if (v102 == 0x8000000000000003) {
                    goto LABEL_41;
                  }
LABEL_27:
                  unint64_t v61 = sub_239849B94(v5, i);
                  if (v61 != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    unint64_t v62 = v61;
                    id v110 = a1;
                    if (v61 != i + 1)
                    {
                      id v63 = [TMLParserToken alloc];
                      double v66 = objc_msgSend_initWithToken_text_(v63, v64, v65, 21, @"]");
                      objc_msgSend_insertObject_atIndex_(v5, v67, v68, v66, v62);

                      double v69 = [TMLParserToken alloc];
                      uint64_t v72 = objc_msgSend_initWithToken_text_(v69, v70, v71, 21, @"[");
                      objc_msgSend_insertObject_atIndex_(v5, v73, v74, v72, i + 1);

                      double v75 = [TMLParserToken alloc];
                      double v78 = objc_msgSend_initWithToken_text_(v75, v76, v77, 21, @",");
                      objc_msgSend_insertObject_atIndex_(v5, v79, v80, v78, i + 1);
                    }
                    double v81 = [TMLParserToken alloc];
                    double v82 = NSString;
                    uint64_t v85 = objc_msgSend_objectAtIndexedSubscript_(v5, v83, v84, v112);
                    double v88 = objc_msgSend_text(v85, v86, v87);
                    id v91 = objc_msgSend_stringWithFormat_(v82, v89, v90, @"'%@'", v88);
                    id v94 = objc_msgSend_initWithToken_text_(v81, v92, v93, 14, v91);
                    objc_msgSend_insertObject_atIndex_(v5, v95, v96, v94, i + 1);

                    double v97 = [TMLParserToken alloc];
                    double v54 = objc_msgSend_initWithToken_text_(v97, v98, v99, 19, @"$");
                    objc_msgSend_replaceObjectAtIndex_withObject_(v5, v100, v101, v112, v54);
                    a1 = v110;
                    goto LABEL_40;
                  }
                }
                else
                {
LABEL_40:
                }
              }
              else if (objc_msgSend_token(v43, v52, v53) == 15)
              {
                goto LABEL_27;
              }
            }
LABEL_41:
          }
        }
        else
        {
        }
      }
LABEL_7:
    }
  }
  return v5;
}

+ (id)transformAccessors:(id)a3
{
  v131[4] = *MEMORY[0x263EF8340];
  id v4 = objc_msgSend_mutableCopy(a3, a2, v3);
  if (objc_msgSend_count(v4, v5, v6))
  {
    char v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      double v12 = objc_msgSend_objectAtIndexedSubscript_(v4, v7, v8, v10);
      uint64_t v15 = objc_msgSend_token(v12, v13, v14);
      if (v15 > 9)
      {
        if (v15 == 10)
        {
          if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v11 = v10;
          }
          goto LABEL_34;
        }
        if (v15 != 19) {
          goto LABEL_19;
        }
        double v18 = objc_msgSend_text(v12, v16, v17);
        if (objc_msgSend_isEqualToString_(v18, v19, v20, @"$"))
        {

LABEL_18:
          v10 -= v11 != 0x7FFFFFFFFFFFFFFFLL;
LABEL_19:
          if (v11 != 0x7FFFFFFFFFFFFFFFLL && v10 - v11 >= 2)
          {
            uint64_t v128 = v11 + 1;
            uint64_t v129 = v10 - v11 - 1;
            double v39 = objc_msgSend_subarrayWithRange_(v4, v16, v17);
            double v42 = objc_msgSend_valueForKey_(v39, v40, v41, @"text");
            double v45 = objc_msgSend_componentsJoinedByString_(v42, v43, v44, &stru_26ECF02A8);

            double v48 = objc_msgSend_objectAtIndexedSubscript_(v4, v46, v47, v11 - 1);
            uint64_t v51 = objc_msgSend_token(v48, v49, v50);

            if (v51 == 15)
            {
              double v127 = v45;
              if (v10 + 2 < objc_msgSend_count(v4, v52, v53))
              {
                double v56 = objc_msgSend_objectAtIndexedSubscript_(v4, v54, v55, v10 + 1);
                double v59 = objc_msgSend_text(v56, v57, v58);
                if (objc_msgSend_isEqualToString_(v59, v60, v61, @"$"))
                {
                  id v64 = objc_msgSend_objectAtIndexedSubscript_(v4, v62, v63, v10 + 2);
                  double v67 = objc_msgSend_text(v64, v65, v66);
                  int isEqualToString = objc_msgSend_isEqualToString_(v67, v68, v69, @"(");

                  if (isEqualToString)
                  {
                    double v71 = [TMLParserToken alloc];
                    v126 = objc_msgSend_initWithToken_text_(v71, v72, v73, 19, @"$$_");
                    v131[0] = v126;
                    double v74 = [TMLParserToken alloc];
                    v125 = objc_msgSend_initWithToken_text_(v74, v75, v76, 21, @"(");
                    v131[1] = v125;
                    double v77 = [TMLParserToken alloc];
                    double v80 = objc_msgSend_stringWithFormat_(NSString, v78, v79, @"'%@'", v127);
                    id v83 = objc_msgSend_initWithToken_text_(v77, v81, v82, 14, v80);
                    v131[2] = v83;
                    double v84 = [TMLParserToken alloc];
                    double v87 = objc_msgSend_initWithToken_text_(v84, v85, v86, 21, @""));
                    v131[3] = v87;
                    double v90 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v88, v89, v131, 4);
                    objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(v4, v91, v92, v128, v129, v90);
                    uint64_t v93 = 6;
                    goto LABEL_38;
                  }
                }
                else
                {
                }
              }
              double v98 = [TMLParserToken alloc];
              v126 = objc_msgSend_initWithToken_text_(v98, v99, v100, 19, @"$$");
              v130[0] = v126;
              double v101 = [TMLParserToken alloc];
              v125 = objc_msgSend_initWithToken_text_(v101, v102, v103, 21, @"(");
              v130[1] = v125;
              char v104 = [TMLParserToken alloc];
              double v80 = objc_msgSend_stringWithFormat_(NSString, v105, v106, @"'%@'", v127);
              id v83 = objc_msgSend_initWithToken_text_(v104, v107, v108, 14, v80);
              v130[2] = v83;
              double v109 = [TMLParserToken alloc];
              double v87 = objc_msgSend_initWithToken_text_(v109, v110, v111, 21, @""));
              v130[3] = v87;
              unint64_t v112 = [TMLParserToken alloc];
              double v90 = objc_msgSend_initWithToken_text_(v112, v113, v114, 10, @".");
              v130[4] = v90;
              double v115 = [TMLParserToken alloc];
              id v118 = objc_msgSend_initWithToken_text_(v115, v116, v117, 19, @"_");
              v130[5] = v118;
              double v121 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v119, v120, v130, 6);
              objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(v4, v122, v123, v128, v129, v121);

              uint64_t v93 = 7;
LABEL_38:

              unint64_t v10 = v11 + v93;
              double v45 = v127;
            }
          }
          uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_34;
        }
        double v35 = objc_msgSend_text(v12, v21, v22);
        int v38 = objc_msgSend_isEqualToString_(v35, v36, v37, @"tmlState");

        if (v38) {
          goto LABEL_18;
        }
      }
      else
      {
        if (v15)
        {
          if (v15 == 2) {
            goto LABEL_33;
          }
          goto LABEL_19;
        }
        if (v9)
        {
          id v23 = objc_msgSend_objectAtIndexedSubscript_(v4, v16, v17, v10 - 1);
          double v26 = objc_msgSend_text(v23, v24, v25);

          if (v10 + 1 >= objc_msgSend_count(v4, v27, v28))
          {
            double v34 = 0;
          }
          else
          {
            id v31 = objc_msgSend_objectAtIndexedSubscript_(v4, v29, v30, v10 + 1);
            double v34 = objc_msgSend_text(v31, v32, v33);
          }
          if ((sub_2398496DC(v26) & 1) == 0 && (sub_2398496DC(v34) & 1) == 0) {
            objc_msgSend_removeObjectAtIndex_(v4, v94, v95, v10--);
          }

LABEL_33:
          char v9 = 1;
          goto LABEL_34;
        }
        char v9 = 0;
      }
LABEL_34:

      ++v10;
    }
    while (v10 < objc_msgSend_count(v4, v96, v97));
  }
  return v4;
}

+ (id)transformObjectCreation:(id)a3
{
  v144[3] = *MEMORY[0x263EF8340];
  id v138 = a3;
  double v5 = objc_msgSend_mutableCopy(v138, v3, v4);
  if (objc_msgSend_count(v5, v6, v7))
  {
    char v10 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    double v13 = 0;
    unint64_t v14 = 0;
    p_vtable = &OBJC_METACLASS___TMLDirectionalEdgeInsets.vtable;
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v137 = v5;
    while (1)
    {
      double v17 = objc_msgSend_objectAtIndexedSubscript_(v5, v8, v9, v14);
      uint64_t v20 = objc_msgSend_token(v17, v18, v19);
      if (v20 == 6)
      {
        if (v10)
        {
          if (!v12)
          {
            uint64_t v79 = v11;
            double v80 = objc_msgSend_objectAtIndexedSubscript_(v5, v21, v22, v14 - 1);
            if (objc_msgSend_token(v80, v81, v82) == 19)
            {
              id v83 = objc_alloc((Class)(p_vtable + 162));
              uint64_t v142 = v16;
              double v140 = objc_msgSend_initWithToken_text_(v83, v84, v85, 21, @",");
              v143[0] = v140;
              id v86 = objc_alloc((Class)(p_vtable + 162));
              double v87 = NSString;
              double v136 = objc_msgSend_text(v80, v88, v89);
              v135 = objc_msgSend_stringWithFormat_(v87, v90, v91, @"'%@'", v136);
              id v94 = objc_msgSend_initWithToken_text_(v86, v92, v93, 14, v135);
              v143[1] = v94;
              id v95 = objc_alloc((Class)(p_vtable + 162));
              double v98 = p_vtable;
              double v99 = objc_msgSend_initWithToken_text_(v95, v96, v97, 21, @",");
              v143[2] = v99;
              id v100 = objc_alloc((Class)(v98 + 162));
              double v103 = objc_msgSend_initWithToken_text_(v100, v101, v102, 4, @"[");
              v143[3] = v103;
              double v106 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v104, v105, v143, 4);
              objc_msgSend_addObjectsFromArray_(v13, v107, v108, v106);

              uint64_t v16 = v142;
              p_vtable = v98;

              uint64_t v79 = 1;
            }

            uint64_t v12 = 1;
            char v10 = 1;
            uint64_t v11 = v79;
            goto LABEL_27;
          }
          ++v12;
LABEL_16:
          objc_msgSend_addObject_(v13, v21, v22, v17);
          goto LABEL_26;
        }
        goto LABEL_20;
      }
      if (v20 == 7) {
        break;
      }
      if (v20 != 23)
      {
        if (v10)
        {
          if (v11)
          {
            objc_msgSend_addObject_(v13, v21, v22, v17);
            uint64_t v11 = 1;
          }
          else
          {
            uint64_t v11 = 0;
          }
          goto LABEL_26;
        }
LABEL_20:
        char v10 = 0;
        goto LABEL_27;
      }
      if ((v10 & 1) == 0)
      {
        uint64_t v139 = v12;
        unsigned int v141 = v11;
        double v41 = objc_msgSend_text(v17, v21, v22);
        double v44 = objc_msgSend_substringFromIndex_(v41, v42, v43, 1);

        if (!v13)
        {
          double v13 = objc_msgSend_array(MEMORY[0x263EFF980], v45, v46);
        }
        id v47 = objc_alloc((Class)(p_vtable + 162));
        double v50 = objc_msgSend_initWithToken_text_(v47, v48, v49, 19, @"$new$");
        v144[0] = v50;
        id v51 = objc_alloc((Class)(p_vtable + 162));
        double v54 = objc_msgSend_initWithToken_text_(v51, v52, v53, 6, @"(");
        v144[1] = v54;
        id v55 = objc_alloc((Class)(p_vtable + 162));
        double v58 = objc_msgSend_stringWithFormat_(NSString, v56, v57, @"'%@'", v44);
        double v61 = objc_msgSend_initWithToken_text_(v55, v59, v60, 14, v58);
        v144[2] = v61;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v62, v63, v144, 3);
        v65 = id v64 = p_vtable;
        objc_msgSend_addObjectsFromArray_(v13, v66, v67, v65);

        p_vtable = v64;
        char v10 = 1;
        uint64_t v16 = v14;
        uint64_t v11 = v141;
        uint64_t v12 = v139;
        double v5 = v137;
        goto LABEL_27;
      }
      unint64_t v23 = sub_239849B94(v138, v14);
      if (v23 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v26 = objc_alloc((Class)(p_vtable + 162));
        double v29 = objc_msgSend_text(v17, v27, v28);
        double v32 = objc_msgSend_initWithToken_text_(v26, v30, v31, 14, v29);
        objc_msgSend_addObject_(v13, v33, v34, v32);

LABEL_26:
        char v10 = 1;
        goto LABEL_27;
      }
      unint64_t v68 = v23;
      double v69 = objc_msgSend_subarrayWithRange_(v5, v24, v25, v14, v23 - v14 + 1);
      uint64_t v70 = objc_opt_class();
      objc_msgSend_transformObjectCreation_(v70, v71, v72, v69);
      v74 = uint64_t v73 = v12;
      objc_msgSend_addObjectsFromArray_(v13, v75, v76, v74);

      uint64_t v12 = v73;
      char v10 = 1;
      unint64_t v14 = v68;
LABEL_27:

      if (++v14 >= objc_msgSend_count(v5, v77, v78)) {
        goto LABEL_35;
      }
    }
    if (v10)
    {
      if (!--v12)
      {
        id v35 = objc_alloc((Class)(p_vtable + 162));
        if (v11)
        {
          uint64_t v38 = objc_msgSend_initWithToken_text_(v35, v36, v37, 5, @"]");
        }
        else
        {
          double v109 = objc_msgSend_initWithToken_text_(v35, v36, v37, 21, @",");
          objc_msgSend_addObject_(v13, v110, v111, v109);

          id v112 = objc_alloc((Class)(p_vtable + 162));
          double v115 = objc_msgSend_initWithToken_text_(v112, v113, v114, 14, @"'init'");
          objc_msgSend_addObject_(v13, v116, v117, v115);

          id v118 = objc_alloc((Class)(p_vtable + 162));
          double v121 = objc_msgSend_initWithToken_text_(v118, v119, v120, 21, @",");
          objc_msgSend_addObject_(v13, v122, v123, v121);

          id v124 = objc_alloc((Class)(p_vtable + 162));
          uint64_t v38 = objc_msgSend_initWithToken_text_(v124, v125, v126, 14, @"nil");
        }
        double v127 = (void *)v38;
        objc_msgSend_addObject_(v13, v39, v40, v38);

        objc_msgSend_addObject_(v13, v128, v129, v17);
        objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(v5, v130, v131, v16, v14 - v16 + 1, v13);
        unint64_t v14 = objc_msgSend_count(v13, v132, v133) + v16;

        double v13 = 0;
        uint64_t v12 = 0;
        uint64_t v11 = 0;
        char v10 = 0;
        uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_27;
      }
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  double v13 = 0;
LABEL_35:

  return v5;
}

+ (id)transformBreakpoints:(id)a3 lineNo:(int)a4 filename:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  char v10 = objc_msgSend_mutableCopy(a3, v8, v9);
  if (objc_msgSend_count(v10, v11, v12))
  {
    for (unint64_t i = 0; i < objc_msgSend_count(v10, v47, v48); ++i)
    {
      uint64_t v16 = objc_msgSend_objectAtIndexedSubscript_(v10, v13, v14, i);
      if (objc_msgSend_token(v16, v17, v18) == 19)
      {
        double v21 = objc_msgSend_text(v16, v19, v20);
        if (objc_msgSend_isEqualToString_(v21, v22, v23, @"breakpoint"))
        {

LABEL_7:
          unint64_t v30 = sub_239849B94(v10, i);
          if (v30 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v33 = v30;
            double v34 = objc_msgSend_stringWithFormat_(NSString, v31, v32, @"'%@:%d'", v7, v5);
            id v35 = [TMLParserToken alloc];
            uint64_t v38 = objc_msgSend_initWithToken_text_(v35, v36, v37, 21, @",");
            objc_msgSend_insertObject_atIndex_(v10, v39, v40, v38, v33);

            double v41 = [TMLParserToken alloc];
            double v44 = objc_msgSend_initWithToken_text_(v41, v42, v43, 14, v34);
            objc_msgSend_insertObject_atIndex_(v10, v45, v46, v44, v33 + 1);

            unint64_t i = v33 + 2;
          }
          goto LABEL_9;
        }
        id v26 = objc_msgSend_text(v16, v24, v25);
        int isEqualToString = objc_msgSend_isEqualToString_(v26, v27, v28, @"nslog");

        if (isEqualToString) {
          goto LABEL_7;
        }
      }
LABEL_9:
    }
  }

  return v10;
}

+ (id)varsInCurrentScope:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  double v6 = objc_msgSend_set(MEMORY[0x263EFF9C0], v4, v5);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v3;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, v9, &v22, v26, 16);
  if (v10)
  {
    uint64_t v13 = v10;
    uint64_t v14 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        double v17 = objc_msgSend_vars(v16, v11, v12, (void)v22);

        if (v17)
        {
          double v18 = objc_msgSend_vars(v16, v11, v12);
          objc_msgSend_unionSet_(v6, v19, v20, v18);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v11, v12, &v22, v26, 16);
    }
    while (v13);
  }

  return v6;
}

- (id)compileFunction:(id)a3 bodyOnly:(BOOL)a4
{
  return (id)objc_msgSend_compileFunction_bodyOnly_localVars_(self, a2, v4, a3, a4, 0);
}

- (id)compileFunction:(id)a3 bodyOnly:(BOOL)a4 localVars:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  uint64_t v13 = objc_msgSend_transformObjectCreation_(v10, v11, v12, v9);

  uint64_t v14 = objc_opt_class();
  double v17 = objc_msgSend_transformFunction_(v14, v15, v16, v13);

  double v18 = objc_opt_class();
  double v21 = objc_msgSend_transformAccessors_(v18, v19, v20, v17);

  long long v22 = objc_opt_class();
  long long v25 = objc_msgSend_transformBreakpoints_lineNo_filename_(v22, v23, v24, v21, self->_lineNo, self->_filename);

  id v26 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v29 = objc_msgSend_count(v25, v27, v28);
  double v32 = objc_msgSend_initWithCapacity_(v26, v30, v31, 5 * v29);
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  char v68 = 0;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  BOOL v66 = a4;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  char v64 = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  char v62 = 0;
  id v33 = objc_alloc(MEMORY[0x263EFF9C0]);
  double v36 = objc_msgSend_initWithCapacity_(v33, v34, v35, 4);
  double v39 = objc_msgSend_array(MEMORY[0x263EFF980], v37, v38);
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = sub_23984AD74;
  v50[3] = &unk_264DAC4D0;
  double v57 = v65;
  id v40 = v36;
  double v58 = v67;
  id v51 = v40;
  double v52 = self;
  id v41 = v25;
  id v53 = v41;
  id v42 = v32;
  id v54 = v42;
  double v59 = v61;
  id v43 = v39;
  id v55 = v43;
  double v60 = v63;
  id v44 = v8;
  id v56 = v44;
  objc_msgSend_enumerateObjectsUsingBlock_(v41, v45, v46, v50);
  id v47 = v56;
  id v48 = v42;

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);
  _Block_object_dispose(v67, 8);

  return v48;
}

+ (id)previousNonSpaceToken:(id)a3
{
  double v4 = objc_msgSend_reverseObjectEnumerator(a3, a2, v3);
  id v8 = objc_msgSend_nextObject(v4, v5, v6);
  if (v8)
  {
    do
    {
      if (objc_msgSend_token(v8, v7, v9) && objc_msgSend_token(v8, v10, v11) != 1) {
        break;
      }
      uint64_t v12 = objc_msgSend_nextObject(v4, v10, v11);

      id v8 = (void *)v12;
    }
    while (v12);
  }

  return v8;
}

+ (id)unescapeString:(id)a3
{
  double v4 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(a3, a2, v3, @"\\n", @"\n");
  id v7 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v4, v5, v6, @"\\t", @"\t");

  uint64_t v10 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v7, v8, v9, @"\\\\", @"\\");

  uint64_t v13 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v10, v11, v12, @"\\\", @"\");

  double v16 = (__CFString *)objc_msgSend_mutableCopy(v13, v14, v15);
  if (CFStringTransform(v16, 0, @"Any-Hex/Java", 1u))
  {
    uint64_t v19 = objc_msgSend_copy(v16, v17, v18);

    uint64_t v13 = (void *)v19;
  }

  return v13;
}

+ (BOOL)isBuiltinObject:(id)a3
{
  uint64_t v3 = qword_268A05780;
  id v5 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_268A05780, &unk_26ECEBEF8);
  }
  char v7 = objc_msgSend_containsObject_((void *)qword_268A05778, v4, v6, v5);

  return v7;
}

- (NSString)error
{
  return self->_error;
}

- (BOOL)strict
{
  return self->_strict;
}

- (void)setStrict:(BOOL)a3
{
  self->_strict = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lookaheadCurrentIdent, 0);
  objc_storeStrong((id *)&self->_functionIdentifiers, 0);
  objc_storeStrong((id *)&self->_preprocessorMacros, 0);
  objc_storeStrong((id *)&self->_macros, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_objectStack, 0);
  objc_storeStrong((id *)&self->_activeObject, 0);
  objc_storeStrong((id *)&self->_activeTokens, 0);
  objc_storeStrong((id *)&self->_methodSelector, 0);
  objc_storeStrong((id *)&self->_declarationAttributes, 0);
  objc_storeStrong((id *)&self->_declarationType, 0);
  objc_storeStrong((id *)&self->_lastIdent, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end