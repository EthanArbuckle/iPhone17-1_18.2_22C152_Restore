@interface VHJG14dpou8WUEOf
- (NSMutableDictionary)expressionDictionary;
- (NSMutableDictionary)zKQesNL3BCNYUjZw;
- (VHJG14dpou8WUEOf)initWithZKQesNL3BCNYUjZw:(id)a3;
- (int64_t)Dp2N5iuaONVuK1T4:(id)a3 JMJGqFLtbMZn4EGN:(int64_t)a4 QsX3tfdMvsGwvY0F:(unint64_t)a5 withCompletion:(id)a6;
- (void)setExpressionDictionary:(id)a3;
- (void)setZKQesNL3BCNYUjZw:(id)a3;
@end

@implementation VHJG14dpou8WUEOf

- (VHJG14dpou8WUEOf)initWithZKQesNL3BCNYUjZw:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VHJG14dpou8WUEOf;
  v5 = [(VHJG14dpou8WUEOf *)&v22 init];
  v6 = v5;
  if (v5)
  {
    [(VHJG14dpou8WUEOf *)v5 setZKQesNL3BCNYUjZw:v4];
    v7 = +[NSMutableDictionary dictionary];
    [(VHJG14dpou8WUEOf *)v6 setExpressionDictionary:v7];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = [v8 objectForKeyedSubscript:v13];
        v15 = +[NSExpression expressionWithFormat:v14];

        if (v15)
        {
          v16 = [(VHJG14dpou8WUEOf *)v6 expressionDictionary];
          [v16 setObject:v15 forKeyedSubscript:v13];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }

  return v6;
}

- (int64_t)Dp2N5iuaONVuK1T4:(id)a3 JMJGqFLtbMZn4EGN:(int64_t)a4 QsX3tfdMvsGwvY0F:(unint64_t)a5 withCompletion:(id)a6
{
  id v10 = a3;
  v34 = (void (**)(id, void *))a6;
  uint64_t v11 = +[NSMutableArray arrayWithCapacity:a5];
  v12 = +[PKPassLibrary sharedInstance];
  uint64_t v13 = [v12 passesOfStyles:a4];

  v35 = v10;
  v33 = +[NSPredicate predicateWithFormat:v10];
  v14 = [v13 filteredArrayUsingPredicate:];

  v15 = +[NSSortDescriptor sortDescriptorWithKey:@"anyDate" ascending:0];
  v53 = v15;
  v16 = +[NSArray arrayWithObjects:&v53 count:1];
  v17 = [v14 sortedArrayUsingDescriptors:v16];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v17;
  id v40 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v40)
  {
    uint64_t v37 = *(void *)v48;
    unint64_t v38 = a5;
    v39 = v11;
    while (2)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v48 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v18;
        long long v19 = *(void **)(*((void *)&v47 + 1) + 8 * v18);
        long long v20 = [(VHJG14dpou8WUEOf *)self zKQesNL3BCNYUjZw];
        v42 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v20 count]);

        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v21 = [(VHJG14dpou8WUEOf *)self zKQesNL3BCNYUjZw];
        objc_super v22 = [v21 allKeys];

        id v23 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v44;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v44 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * i);
              v28 = [(NSMutableDictionary *)self->_zKQesNL3BCNYUjZw objectForKeyedSubscript:v27];
              v29 = [(NSMutableDictionary *)self->_expressionDictionary objectForKeyedSubscript:v27];
              v30 = [v19 evaluateWithAttribute:v28 expression:v29];

              if (v30) {
                [v42 setObject:v30 forKeyedSubscript:v27];
              }
            }
            id v24 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v24);
        }

        uint64_t v11 = v39;
        [v39 addObject:v42];
        if (v38 && (unint64_t)[v39 count] >= v38)
        {

          goto LABEL_21;
        }

        uint64_t v18 = v41 + 1;
      }
      while ((id)(v41 + 1) != v40);
      id v40 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v40) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  v31 = +[NSArray arrayWithArray:v11];
  v34[2](v34, v31);

  return 0;
}

- (NSMutableDictionary)zKQesNL3BCNYUjZw
{
  return self->_zKQesNL3BCNYUjZw;
}

- (void)setZKQesNL3BCNYUjZw:(id)a3
{
}

- (NSMutableDictionary)expressionDictionary
{
  return self->_expressionDictionary;
}

- (void)setExpressionDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressionDictionary, 0);

  objc_storeStrong((id *)&self->_zKQesNL3BCNYUjZw, 0);
}

@end