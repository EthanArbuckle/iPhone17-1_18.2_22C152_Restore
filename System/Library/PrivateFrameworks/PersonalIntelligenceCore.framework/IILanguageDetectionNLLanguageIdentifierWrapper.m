@interface IILanguageDetectionNLLanguageIdentifierWrapper
- (void)dealloc;
@end

@implementation IILanguageDetectionNLLanguageIdentifierWrapper

- (void)dealloc
{
  if (self->_languageIdentifier) {
    NLLanguageIdentifierRelease();
  }
  v3.receiver = self;
  v3.super_class = (Class)IILanguageDetectionNLLanguageIdentifierWrapper;
  [(IILanguageDetectionNLLanguageIdentifierWrapper *)&v3 dealloc];
}

@end