@interface CRLanguageRecognitionSession
- (CRLanguageRecognitionSession)init;
- (void)completeSession;
- (void)processFeature:(void *)a3 context:;
@end

@implementation CRLanguageRecognitionSession

- (CRLanguageRecognitionSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLanguageRecognitionSession;
  v3 = [(CRLanguageRecognitionSession *)&v5 init];
  if (v3)
  {
    if (qword_1EB58CAC0 != -1) {
      dispatch_once(&qword_1EB58CAC0, &__block_literal_global_11);
    }
    objc_setProperty_atomic(v3, v2, (id)_MergedGlobals_16, 16);
  }
  return v3;
}

void __36__CRLanguageRecognitionSession_init__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = v0;
}

- (void)completeSession
{
  if (self)
  {
    objc_super v5 = objc_getProperty(self, a2, 8, 1);
    id Property = objc_getProperty(self, v3, 16, 1);
    -[CRLanguageRecognitionContext runRecognitionWithRecognizer:force:](v5, Property, 1);
  }
  else
  {
    objc_super v5 = 0;
    -[CRLanguageRecognitionContext runRecognitionWithRecognizer:force:](0, 0, 1);
  }
}

- (void)processFeature:(void *)a3 context:
{
  if (a1)
  {
    id v5 = a3;
    id v8 = a2;
    id Property = objc_getProperty(a1, v6, 16, 1);
    -[CRLanguageRecognitionContext processFeature:recognizer:]((uint64_t)v5, v8, Property);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageRecognizer, 0);
  objc_storeStrong((id *)&self->_latinLanguageRecognitionContext, 0);
}

@end