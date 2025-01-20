@interface _SVXAddViewsExpressionParser
- (BOOL)ignoresLocallyParseableExpressions;
- (_SVXAddViewsExpressionParser)initWithParsingService:(id)a3 preferences:(id)a4;
- (id)_parseViews:(id)a3 addViews:(id)a4 aceViewByAceId:(id)a5 aceIdByParseableExpressionIds:(id)a6;
- (id)_prepareParsingModelWithAddViews:(id)a3;
- (void)parseAddViews:(id)a3 reply:(id)a4;
- (void)setIgnoresLocallyParseableExpressions:(BOOL)a3;
@end

@implementation _SVXAddViewsExpressionParser

- (void).cxx_destruct
{
}

- (void)setIgnoresLocallyParseableExpressions:(BOOL)a3
{
  self->_ignoresLocallyParseableExpressions = a3;
}

- (BOOL)ignoresLocallyParseableExpressions
{
  return self->_ignoresLocallyParseableExpressions;
}

- (id)_parseViews:(id)a3 addViews:(id)a4 aceViewByAceId:(id)a5 aceIdByParseableExpressionIds:(id)a6
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v37 = a5;
  id v36 = a6;
  v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v46 = "-[_SVXAddViewsExpressionParser _parseViews:addViews:aceViewByAceId:aceIdByParseableExpressionIds:]";
    __int16 v47 = 2112;
    id v48 = v10;
    __int16 v49 = 2112;
    id v50 = v9;
    _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s Successfully parsed expressions for command: %@\n    Parsed expressions: %@", buf, 0x20u);
  }
  v33 = v10;
  v32 = (void *)[v10 copy];
  v12 = [v32 views];
  v13 = (void *)[v12 mutableCopy];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v9;
  uint64_t v38 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
  if (v38)
  {
    uint64_t v35 = *(void *)v42;
    do
    {
      uint64_t v14 = 0;
      v15 = (os_log_t *)MEMORY[0x263F28348];
      do
      {
        if (*(void *)v42 != v35) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
        v17 = [v16 parseableExpression];
        v18 = [v17 aceId];
        v19 = [v36 objectForKey:v18];
        v20 = [v37 objectForKey:v19];

        v21 = (void *)[v20 copy];
        os_log_t v22 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
        {
          v23 = v22;
          v24 = [v16 description];
          v25 = [v21 description];
          *(_DWORD *)buf = 136316162;
          v46 = "-[_SVXAddViewsExpressionParser _parseViews:addViews:aceViewByAceId:aceIdByParseableExpressionIds:]";
          __int16 v47 = 2112;
          id v48 = v16;
          __int16 v49 = 2112;
          id v50 = v21;
          __int16 v51 = 2112;
          v52 = v24;
          __int16 v53 = 2112;
          v54 = v25;
          _os_log_impl(&dword_220062000, v23, OS_LOG_TYPE_INFO, "%s Applying parsed expression %@ to view %@\n    Parsed expression: %@\n    View: %@", buf, 0x34u);

          v15 = (os_log_t *)MEMORY[0x263F28348];
        }
        objc_msgSend(v21, "svx_applyParsedExpression:", v16);
        v26 = *v15;
        if (os_log_type_enabled(*v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315650;
          v46 = "-[_SVXAddViewsExpressionParser _parseViews:addViews:aceViewByAceId:aceIdByParseableExpressionIds:]";
          __int16 v47 = 2112;
          id v48 = v12;
          __int16 v49 = 2112;
          id v50 = v13;
          _os_log_impl(&dword_220062000, v26, OS_LOG_TYPE_INFO, "%s Splicing in applied parsed expression\n    Original views: %@\n    Updated views: %@", buf, 0x20u);
        }
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __98___SVXAddViewsExpressionParser__parseViews_addViews_aceViewByAceId_aceIdByParseableExpressionIds___block_invoke;
        v39[3] = &unk_264552CE0;
        id v27 = v20;
        id v40 = v27;
        unint64_t v28 = [v12 indexOfObjectPassingTest:v39];
        if (v28 >= [v13 count])
        {
          v29 = *v15;
          if (os_log_type_enabled(*v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            v46 = "-[_SVXAddViewsExpressionParser _parseViews:addViews:aceViewByAceId:aceIdByParseableExpressionIds:]";
            __int16 v47 = 2112;
            id v48 = v21;
            __int16 v49 = 2112;
            id v50 = v27;
            __int16 v51 = 2112;
            v52 = v13;
            _os_log_error_impl(&dword_220062000, v29, OS_LOG_TYPE_ERROR, "%s Failed splicing updated view for view in array\n    Updated ace view: %@\n    Original ace view: %@\n    Updated views array: %@", buf, 0x2Au);
          }
        }
        else
        {
          [v13 replaceObjectAtIndex:v28 withObject:v21];
        }

        ++v14;
      }
      while (v38 != v14);
      uint64_t v38 = [obj countByEnumeratingWithState:&v41 objects:v55 count:16];
    }
    while (v38);
  }

  v30 = (void *)[v13 copy];
  [v32 setViews:v30];

  return v32;
}

- (id)_prepareParsingModelWithAddViews:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v33 = a3;
  v4 = [v33 views];
  uint64_t v42 = [v4 countByEnumeratingWithState:&v44 objects:v52 count:16];
  v5 = 0;
  v6 = 0;
  v7 = 0;
  if (!v42)
  {
    long long v41 = 0;
    goto LABEL_24;
  }
  long long v41 = 0;
  uint64_t v8 = *(void *)v45;
  uint64_t v34 = *MEMORY[0x263F28720];
  uint64_t v35 = v4;
  id v36 = self;
  uint64_t v37 = *(void *)v45;
  do
  {
    for (uint64_t i = 0; i != v42; ++i)
    {
      if (*(void *)v45 != v8) {
        objc_enumerationMutation(v4);
      }
      id v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      v11 = objc_msgSend(v10, "svx_parseableExpression");
      v12 = v11;
      if (v11)
      {
        if (self->_ignoresLocallyParseableExpressions)
        {
          v13 = [v11 expressionString];
          if (![v13 length]) {
            goto LABEL_13;
          }
          uint64_t v38 = v13;
          v39 = v6;
          id v40 = v7;
          uint64_t v14 = v41;
          if (!v41)
          {
            speakableUtteranceParserProvider = v36->_speakableUtteranceParserProvider;
            id v16 = objc_alloc(MEMORY[0x263EFF960]);
            v17 = [(_SVXExpressionParser *)v36 preferences];
            v18 = [v17 languageCode];
            v19 = (void *)[v16 initWithLocaleIdentifier:v18];
            uint64_t v14 = [(SVXAFSpeakableUtteranceParserProvider *)speakableUtteranceParserProvider getWithLocale:v19];
          }
          v20 = [v10 groupIdentifier];
          v21 = +[_SVXSpeakableNamespaceDomainOccurrenceProvider providerForDomain:v20];
          [v14 registerProvider:v21 forNamespace:v34];
          os_log_t v22 = [v12 expressionString];
          id v43 = 0;
          id v23 = (id)[v14 parseStringWithFormat:v22 error:&v43];
          id v24 = v43;

          long long v41 = v14;
          if (v24)
          {
            [v14 registerProvider:0 forNamespace:v34];

            v4 = v35;
            self = v36;
            v7 = v40;
            v13 = v38;
            v6 = v39;
LABEL_13:

            uint64_t v8 = v37;
LABEL_14:
            v25 = *MEMORY[0x263F28348];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              __int16 v49 = "-[_SVXAddViewsExpressionParser _prepareParsingModelWithAddViews:]";
              __int16 v50 = 2112;
              __int16 v51 = v12;
              _os_log_impl(&dword_220062000, v25, OS_LOG_TYPE_INFO, "%s Expression doesn't require remote parse: %@", buf, 0x16u);
            }
            goto LABEL_20;
          }
          uint64_t v26 = [v21 count];
          [v14 registerProvider:0 forNamespace:v34];

          v4 = v35;
          self = v36;
          v7 = v40;
          v6 = v39;
          uint64_t v8 = v37;
          if (!v26) {
            goto LABEL_14;
          }
        }
        if (!v7)
        {
          v7 = objc_opt_new();
          uint64_t v27 = objc_opt_new();

          uint64_t v28 = objc_opt_new();
          v5 = (void *)v28;
          v6 = (void *)v27;
        }
        v29 = [v10 aceId];
        [v5 setObject:v10 forKey:v29];
        v30 = [v12 aceId];
        [v6 setObject:v29 forKey:v30];

        [v7 addObject:v12];
      }
LABEL_20:
    }
    uint64_t v42 = [v4 countByEnumeratingWithState:&v44 objects:v52 count:16];
  }
  while (v42);
LABEL_24:

  v31 = [[_SVXExpressionParsingModel alloc] initWithParseableExpressions:v7 aceViewIdByExpressionId:v6 aceViewByAceId:v5];

  return v31;
}

- (void)parseAddViews:(id)a3 reply:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    uint64_t v8 = (os_log_t *)MEMORY[0x263F28348];
    id v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      os_log_t v22 = "-[_SVXAddViewsExpressionParser parseAddViews:reply:]";
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s Looking for parseable expressions in command %@", buf, 0x16u);
    }
    id v10 = [(_SVXAddViewsExpressionParser *)self _prepareParsingModelWithAddViews:v6];
    v11 = [v10 parseableExpressions];
    uint64_t v12 = [v11 count];

    if (v12)
    {
      v13 = [(_SVXExpressionParser *)self parsingService];
      uint64_t v14 = [v10 parseableExpressions];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __52___SVXAddViewsExpressionParser_parseAddViews_reply___block_invoke;
      v17[3] = &unk_264552CB8;
      v17[4] = self;
      id v18 = v6;
      id v19 = v10;
      id v20 = v7;
      [v13 parseExpressions:v14 targetDevice:0 reply:v17];
    }
    else
    {
      v15 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        os_log_t v22 = "-[_SVXAddViewsExpressionParser parseAddViews:reply:]";
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_220062000, v15, OS_LOG_TYPE_INFO, "%s Found no parseable expressions in command %@", buf, 0x16u);
      }
      id v16 = (void *)[v6 copy];
      (*((void (**)(id, uint64_t, void *))v7 + 2))(v7, 1, v16);
    }
  }
}

- (_SVXAddViewsExpressionParser)initWithParsingService:(id)a3 preferences:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_SVXAddViewsExpressionParser;
  v4 = [(_SVXExpressionParser *)&v9 initWithParsingService:a3 preferences:a4];
  v5 = v4;
  if (v4)
  {
    v4->_ignoresLocallyParseableExpressions = 1;
    id v6 = objc_alloc_init(SVXAFSpeakableUtteranceParserProvider);
    speakableUtteranceParserProvider = v5->_speakableUtteranceParserProvider;
    v5->_speakableUtteranceParserProvider = v6;
  }
  return v5;
}

@end