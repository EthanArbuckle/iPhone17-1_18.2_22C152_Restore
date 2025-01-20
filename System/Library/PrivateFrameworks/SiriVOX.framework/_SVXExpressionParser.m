@interface _SVXExpressionParser
- (AFPreferences)preferences;
- (SVXExpressionParsingServing)parsingService;
- (_SVXExpressionParser)initWithParsingService:(id)a3 preferences:(id)a4;
@end

@implementation _SVXExpressionParser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);

  objc_storeStrong((id *)&self->_parsingService, 0);
}

- (AFPreferences)preferences
{
  return self->_preferences;
}

- (SVXExpressionParsingServing)parsingService
{
  return self->_parsingService;
}

- (_SVXExpressionParser)initWithParsingService:(id)a3 preferences:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_SVXExpressionParser.m", 14, @"Invalid parameter not satisfying: %@", @"parsingService != nil" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"_SVXExpressionParser.m", 15, @"Invalid parameter not satisfying: %@", @"preferences != nil" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)_SVXExpressionParser;
  v11 = [(_SVXExpressionParser *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_parsingService, a3);
    objc_storeStrong((id *)&v12->_preferences, a4);
  }

  return v12;
}

@end