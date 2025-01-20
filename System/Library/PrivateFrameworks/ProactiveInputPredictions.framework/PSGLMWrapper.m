@interface PSGLMWrapper
- (PSGLMWrapper)initWithLangModel:(void *)a3 lexicon:(void *)a4;
- (void)dealloc;
- (void)langModel;
- (void)lexicon;
@end

@implementation PSGLMWrapper

- (void)dealloc
{
  if (self->_langModel) {
    LMLanguageModelRelease();
  }
  if (self->_lexicon) {
    LMLexiconRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)PSGLMWrapper;
  [(PSGLMWrapper *)&v3 dealloc];
}

- (void)lexicon
{
  return self->_lexicon;
}

- (void)langModel
{
  return self->_langModel;
}

- (PSGLMWrapper)initWithLangModel:(void *)a3 lexicon:(void *)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PSGLMWrapper;
  result = [(PSGLMWrapper *)&v7 init];
  if (result)
  {
    result->_langModel = a3;
    result->_lexicon = a4;
  }
  return result;
}

@end