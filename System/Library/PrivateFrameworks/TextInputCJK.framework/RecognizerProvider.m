@interface RecognizerProvider
- (CHRecognizer)recognizer;
- (NSLocale)recognitionLanguage;
- (RecognizerProvider)initWithRecognitionLanguage:(id)a3 mode:(int)a4;
- (id)recognizerDidLoadBlock;
- (int)recognitionMode;
- (void)dealloc;
- (void)provideRecognizerToBlock:(id)a3;
- (void)setRecognizerDidLoadBlock:(id)a3;
- (void)unloadRecognizer;
@end

@implementation RecognizerProvider

- (void).cxx_destruct
{
  objc_storeStrong(&self->_recognizerDidLoadBlock, 0);
  objc_storeStrong((id *)&self->_recognitionLanguage, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

- (void)setRecognizerDidLoadBlock:(id)a3
{
}

- (id)recognizerDidLoadBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (int)recognitionMode
{
  return self->_recognitionMode;
}

- (NSLocale)recognitionLanguage
{
  return (NSLocale *)objc_getProperty(self, a2, 24, 1);
}

- (void)unloadRecognizer
{
  obj = self;
  objc_sync_enter(obj);
  recognizer = obj->_recognizer;
  obj->_recognizer = 0;

  objc_sync_exit(obj);
}

- (void)provideRecognizerToBlock:(id)a3
{
  if (a3)
  {
    obj = self;
    v4 = (void (**)(id, void))a3;
    objc_sync_enter(obj);
    ((void (**)(id, CHRecognizer *))v4)[2](v4, obj->_recognizer);

    objc_sync_exit(obj);
  }
}

- (CHRecognizer)recognizer
{
  v16[1] = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  recognizer = v2->_recognizer;
  v4 = recognizer;
  if (!recognizer)
  {
    v5 = (void *)MEMORY[0x263F35CC0];
    uint64_t v6 = [(RecognizerProvider *)v2 recognitionMode];
    v7 = [(RecognizerProvider *)v2 recognitionLanguage];
    v16[0] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    v9 = (CHRecognizer *)[v5 newRemoteRecognizerWithMode:v6 locales:v8];

    v10 = v2->_recognizer;
    v2->_recognizer = v9;
    v11 = v9;

    [(CHRecognizer *)v2->_recognizer setMaxRecognitionResultCount:15];
    v4 = v2->_recognizer;
  }
  v12 = v4;
  objc_sync_exit(v2);

  if (!recognizer)
  {
    v13 = [(RecognizerProvider *)v2 recognizerDidLoadBlock];

    if (v13)
    {
      v14 = [(RecognizerProvider *)v2 recognizerDidLoadBlock];
      v14[2]();
    }
  }
  return v12;
}

- (void)dealloc
{
  [(RecognizerProvider *)self unloadRecognizer];
  v3.receiver = self;
  v3.super_class = (Class)RecognizerProvider;
  [(RecognizerProvider *)&v3 dealloc];
}

- (RecognizerProvider)initWithRecognitionLanguage:(id)a3 mode:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RecognizerProvider;
  v8 = [(RecognizerProvider *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_recognitionLanguage, a3);
    v9->_recognitionMode = a4;
  }

  return v9;
}

@end