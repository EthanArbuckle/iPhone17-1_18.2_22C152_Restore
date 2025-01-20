@interface TTRNLTextSlotParser
- (NSLocale)locale;
- (TTRNLTextSlotParser)initWithLocale:(id)a3 now:(id)a4;
- (id)parseString:(id)a3 referenceTimeZone:(id)a4;
- (void)dealloc;
- (void)parser;
- (void)setLocale:(id)a3;
- (void)setParser:(void *)a3;
@end

@implementation TTRNLTextSlotParser

- (TTRNLTextSlotParser)initWithLocale:(id)a3 now:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TTRNLTextSlotParser;
  v9 = [(TTRNLTextSlotParser *)&v15 init];
  if (!v9) {
    goto LABEL_6;
  }
  v10 = [MEMORY[0x1E4F1CA60] dictionary];
  [v10 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F79BD0]];
  if (v8) {
    [v10 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F79B98]];
  }
  uint64_t v14 = 0;
  uint64_t v11 = NLTextSlotParserCreate();
  if (v11)
  {
    objc_storeStrong((id *)&v9->_locale, a3);
    v9->_parser = (void *)v11;

LABEL_6:
    v12 = v9;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[TTRNLTextSlotParser initWithLocale:now:](&v14, (uint64_t)v7);
  }

  v12 = 0;
LABEL_10:

  return v12;
}

- (void)dealloc
{
  CFRelease(self->_parser);
  v3.receiver = self;
  v3.super_class = (Class)TTRNLTextSlotParser;
  [(TTRNLTextSlotParser *)&v3 dealloc];
}

- (id)parseString:(id)a3 referenceTimeZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(TTRNLTextSlotParser *)self parser];
  StructuredEvent = (const void *)NLTextSlotParserCreateStructuredEvent();

  if (StructuredEvent)
  {
    v9 = [[TTRNLTextStructuredEvent alloc] initWithStructuredEvent:StructuredEvent];
    CFRelease(StructuredEvent);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (void)parser
{
  return self->_parser;
}

- (void)setParser:(void *)a3
{
  self->_parser = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithLocale:(uint64_t *)a1 now:(uint64_t)a2 .cold.1(uint64_t *a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A72A1000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot create NLTextSlotParser {error: %@, locale: %@}", (uint8_t *)&v3, 0x16u);
}

@end