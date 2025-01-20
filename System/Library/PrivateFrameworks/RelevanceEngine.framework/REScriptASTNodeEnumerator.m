@interface REScriptASTNodeEnumerator
- (BOOL)buildSymbolTableWithError:(id *)a3;
- (REScriptASTNodeEnumerator)initWithRootNodes:(id)a3 symbolTable:(id)a4;
@end

@implementation REScriptASTNodeEnumerator

- (REScriptASTNodeEnumerator)initWithRootNodes:(id)a3 symbolTable:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REScriptASTNodeEnumerator;
  v9 = [(REScriptASTNodeEnumerator *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nodes, a3);
    objc_storeStrong((id *)&v10->_table, a4);
  }

  return v10;
}

- (BOOL)buildSymbolTableWithError:(id *)a3
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obj = self->_nodes;
  uint64_t v66 = [(NSArray *)obj countByEnumeratingWithState:&v68 objects:v82 count:16];
  if (!v66)
  {
    BOOL v60 = 1;
    goto LABEL_55;
  }
  uint64_t v65 = *(void *)v69;
  do
  {
    uint64_t v5 = 0;
    do
    {
      if (*(void *)v69 != v65) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v68 + 1) + 8 * v5);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v7 = v6;
        id v8 = [v7 type];
        uint64_t v9 = [v8 type];

        uint64_t v10 = v9 - 13;
        if ((unint64_t)(v9 - 13) > 2) {
          goto LABEL_53;
        }
        table = self->_table;
        objc_super v12 = [v7 name];
        v80 = @"REScriptSymbolRuleTypeKey";
        v13 = [NSNumber numberWithUnsignedInteger:v10];
        v81 = v13;
        v14 = [NSDictionary dictionaryWithObjects:&v81 forKeys:&v80 count:1];
        LODWORD(table) = [(REScriptSymbolTable *)table define:v12 type:1 options:v14 error:a3];

        if (!table) {
          goto LABEL_53;
        }
        v15 = self->_table;
        v16 = [v7 name];
        v17 = [v16 value];
        LOBYTE(v15) = [(REScriptSymbolTable *)v15 setNodeValue:v7 forDefinition:v17 error:a3];

        if ((v15 & 1) == 0) {
          goto LABEL_54;
        }
        goto LABEL_41;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v27 = v6;
          v28 = self->_table;
          v29 = [v27 name];
          v78 = @"REScriptSymbolValueTypeKey";
          v30 = [v27 type];
          v31 = [v30 value];
          v79 = v31;
          v32 = [NSDictionary dictionaryWithObjects:&v79 forKeys:&v78 count:1];
          LODWORD(v28) = [(REScriptSymbolTable *)v28 define:v29 type:3 options:v32 error:a3];

          if (!v28) {
            goto LABEL_53;
          }
          v20 = [v27 value];
          if (v20)
          {
            v33 = self->_table;
            v34 = [v27 name];
            v35 = [v34 value];
            LOBYTE(v33) = [(REScriptSymbolTable *)v33 setNodeValue:v20 forDefinition:v35 error:a3];

            if ((v33 & 1) == 0)
            {
LABEL_52:

LABEL_53:
LABEL_54:
              BOOL v60 = 0;
              goto LABEL_55;
            }
          }
          goto LABEL_26;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_41;
        }
        id v36 = v6;
        v37 = [v36 binaryExpressions];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v38 = [v37 expressions];
          id v39 = [v38 firstObject];
        }
        else
        {
          id v39 = v37;
        }
        v40 = [v36 prefixExpression];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            v42 = [v36 prefixExpression];
            v43 = [v42 token];
            v44 = [v43 value];

            uint64_t v67 = 0;
            if ([(REScriptSymbolTable *)self->_table typeForDefinition:v44 type:&v67])
            {
              v45 = [v39 binaryOperator];
              unint64_t v46 = [v45 type];

              if (v67 == 3)
              {
                if (v46 - 29 < 2) {
                  goto LABEL_34;
                }
              }
              else if (!v67 && v46 == 30)
              {
LABEL_34:
                v47 = self->_table;
                v48 = [v36 binaryExpressions];
                LODWORD(v47) = [(REScriptSymbolTable *)v47 setNodeValue:v48 forDefinition:v44 error:a3];

                int v49 = v47 ^ 1;
                goto LABEL_38;
              }
              if (a3)
              {
                v54 = NSString;
                v55 = REDescriptionForTokenType(v46);
                v56 = [v54 stringWithFormat:@"Invalid operator %@. Expecting assignment operator. Did you mean to use \"<-\"?", v55];

                v74 = @"REErrorTokenKey";
                v63 = [v39 expression];
                v57 = [v63 token];
                v75 = v57;
                v58 = [NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
                RECreateErrorWithCodeMessageAndUseInfo(204, v56, v58);
                *a3 = (id)objc_claimAutoreleasedReturnValue();

                int v49 = 1;
                goto LABEL_38;
              }
            }
            else if (a3)
            {
              v76 = @"REErrorTokenKey";
              v62 = [v36 prefixExpression];
              v52 = [v62 token];
              v77 = v52;
              int v49 = 1;
              v53 = [NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
              RECreateErrorWithCodeAndUseInfo(207, v53);
              *a3 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_38;
            }
            int v49 = 1;
LABEL_38:

LABEL_40:
            if (v49) {
              goto LABEL_54;
            }
            goto LABEL_41;
          }
        }
        else
        {
        }
        if (a3)
        {
          v44 = [NSString stringWithFormat:@"Unexpected top level expression."];
          v72 = @"REErrorTokenKey";
          v50 = [v36 binaryExpressions];
          v73 = v50;
          v51 = [NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
          RECreateErrorWithCodeMessageAndUseInfo(209, v44, v51);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          int v49 = 1;
          goto LABEL_38;
        }
        int v49 = 1;
        goto LABEL_40;
      }
      id v18 = v6;
      v19 = [v18 options];
      v20 = REValidatedFeatureOptionsDictionary(v19, a3);

      if (!v20) {
        goto LABEL_52;
      }
      v21 = self->_table;
      v22 = [v18 name];
      LODWORD(v21) = [(REScriptSymbolTable *)v21 define:v22 type:0 options:v20 error:a3];

      if (!v21) {
        goto LABEL_52;
      }
      v23 = [v18 value];
      if (!v23)
      {

LABEL_26:
        goto LABEL_41;
      }
      v24 = self->_table;
      v25 = [v18 name];
      v26 = [v25 value];
      LOBYTE(v24) = [(REScriptSymbolTable *)v24 setNodeValue:v23 forDefinition:v26 error:a3];

      if ((v24 & 1) == 0) {
        goto LABEL_54;
      }
LABEL_41:
      ++v5;
    }
    while (v66 != v5);
    uint64_t v59 = [(NSArray *)obj countByEnumeratingWithState:&v68 objects:v82 count:16];
    BOOL v60 = 1;
    uint64_t v66 = v59;
  }
  while (v59);
LABEL_55:

  return v60;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_table, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end