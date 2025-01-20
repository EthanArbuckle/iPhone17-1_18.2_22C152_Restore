@interface BKBookParser
+ (BOOL)canParse:(id)a3;
+ (id)parserForBook:(id)a3;
- (AEBookInfo)book;
- (BKBookParser)initWithBook:(id)a3;
- (int)parse:(BOOL)a3;
@end

@implementation BKBookParser

+ (BOOL)canParse:(id)a3
{
  v3 = (ITEpubFolder *)a3;
  int v4 = BookFormatByFilePath();
  if (v4) {
    BOOL v6 = (v4 & 0xFFFFFFFD) == 0;
  }
  else {
    BOOL v6 = ITEpubFolder::isMimeCorrect(v3, 0, 0, v5) != 0;
  }

  return v6;
}

+ (id)parserForBook:(id)a3
{
  id v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_10:
    id v7 = 0;
    goto LABEL_14;
  }
  unsigned int v4 = [v3 contentType];
  if (v4)
  {
    if (v4 != 2)
    {
      if (v4 != 3)
      {
        unint64_t v5 = BCIMLog();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          int v10 = 136315650;
          v11 = "+[BKBookParser parserForBook:]";
          __int16 v12 = 2080;
          v13 = "/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/Shared/Models/Parsing/BKBookParser.mm";
          __int16 v14 = 1024;
          int v15 = 56;
          _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v10, 0x1Cu);
        }

        BOOL v6 = BCIMLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v10 = 138412290;
          v11 = (const char *)v3;
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "@\"Unrecognized book content type: %@\"", (uint8_t *)&v10, 0xCu);
        }
      }
      goto LABEL_10;
    }
    v8 = off_1D9C10;
  }
  else
  {
    v8 = off_1D9BF0;
  }
  id v7 = [objc_alloc(*v8) initWithBook:v3];
LABEL_14:

  return v7;
}

- (BKBookParser)initWithBook:(id)a3
{
  id v5 = a3;
  BOOL v6 = [(BKBookParser *)self init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_book, a3);
  }

  return v7;
}

- (int)parse:(BOOL)a3
{
  return -2;
}

- (AEBookInfo)book
{
  return self->_book;
}

- (void).cxx_destruct
{
}

@end