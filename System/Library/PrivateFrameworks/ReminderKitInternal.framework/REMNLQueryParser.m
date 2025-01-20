@interface REMNLQueryParser
- (NSDate)referenceDate;
- (NSLocale)locale;
- (REMNLQueryParser)initWithLocale:(id)a3 referenceDate:(id)a4 referenceTimeZone:(id)a5 forTesting:(BOOL)a6;
- (id)parseString:(id)a3;
- (id)parserManagerTestOptions;
@end

@implementation REMNLQueryParser

- (REMNLQueryParser)initWithLocale:(id)a3 referenceDate:(id)a4 referenceTimeZone:(id)a5 forTesting:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)REMNLQueryParser;
  v14 = [(REMNLQueryParser *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_timeZone, a5);
    objc_storeStrong((id *)&v15->_locale, a3);
    if (v12)
    {
      v16 = (NSDate *)v12;
    }
    else
    {
      v16 = [MEMORY[0x1E4F1C9C8] date];
    }
    referenceDate = v15->_referenceDate;
    v15->_referenceDate = v16;

    v15->_forTesting = a6;
  }

  return v15;
}

- (id)parseString:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy_;
  v14 = __Block_byref_object_dispose_;
  id v15 = (id)objc_opt_new();
  if (self->_forTesting)
  {
    v5 = [(REMNLQueryParser *)self parserManagerTestOptions];
  }
  else
  {
    v5 = 0;
  }
  v6 = [MEMORY[0x1E4F94558] remindersParserManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __32__REMNLQueryParser_parseString___block_invoke;
  v9[3] = &unk_1E5CC8D00;
  v9[4] = &v10;
  [v6 enumerateParseResultsForString:v4 options:v5 withBlock:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

uint64_t __32__REMNLQueryParser_parseString___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

- (id)parserManagerTestOptions
{
  v15[7] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v4 = *MEMORY[0x1E4F94D68];
  uint64_t v5 = *MEMORY[0x1E4F94590];
  v14[0] = *MEMORY[0x1E4F94588];
  v14[1] = v5;
  v15[0] = v4;
  v15[1] = @"com.apple.reminders.parser";
  uint64_t v6 = *MEMORY[0x1E4F945B0];
  v14[2] = *MEMORY[0x1E4F94598];
  v14[3] = v6;
  referenceDate = self->_referenceDate;
  v15[2] = &unk_1EFCB4D20;
  v15[3] = referenceDate;
  locale = self->_locale;
  uint64_t v9 = *MEMORY[0x1E4F945A0];
  v14[4] = *MEMORY[0x1E4F945A8];
  v14[5] = v9;
  v15[4] = locale;
  v15[5] = MEMORY[0x1E4F1CC38];
  v14[6] = @"forTesting";
  v15[6] = MEMORY[0x1E4F1CC38];
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:7];
  id v11 = [v3 dictionaryWithDictionary:v10];

  timeZone = self->_timeZone;
  if (timeZone) {
    [v11 setObject:timeZone forKeyedSubscript:*MEMORY[0x1E4F945B8]];
  }

  return v11;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

@end