@interface CACCachedIdentifierLanguageModelDescriptor
- (BOOL)isCurrent;
- (CACLanguageModel)languageModel;
- (__RXLanguageObject)rxLanguageObject;
- (void)dealloc;
- (void)setIsCurrent:(BOOL)a3;
- (void)setLanguageModel:(id)a3;
- (void)setRxLanguageObject:(__RXLanguageObject *)a3;
@end

@implementation CACCachedIdentifierLanguageModelDescriptor

- (void)dealloc
{
  RXRelease(self->_rxLanguageObject);
  v3.receiver = self;
  v3.super_class = (Class)CACCachedIdentifierLanguageModelDescriptor;
  [(CACCachedIdentifierLanguageModelDescriptor *)&v3 dealloc];
}

- (__RXLanguageObject)rxLanguageObject
{
  return self->_rxLanguageObject;
}

- (void)setRxLanguageObject:(__RXLanguageObject *)a3
{
  rxLanguageObject = self->_rxLanguageObject;
  if (a3) {
    CFRetain(a3);
  }
  self->_rxLanguageObject = a3;
  RXRelease(rxLanguageObject);
}

- (CACLanguageModel)languageModel
{
  return (CACLanguageModel *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLanguageModel:(id)a3
{
}

- (BOOL)isCurrent
{
  return self->_isCurrent;
}

- (void)setIsCurrent:(BOOL)a3
{
  self->_isCurrent = a3;
}

- (void).cxx_destruct
{
}

@end