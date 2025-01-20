@interface SXTextTangierFlowStorage
- (NSString)flowName;
- (SXTextTangierFlowStorage)initWithContext:(id)a3 string:(id)a4 stylesheet:(id)a5 kind:(int)a6 flowName:(id)a7;
@end

@implementation SXTextTangierFlowStorage

- (SXTextTangierFlowStorage)initWithContext:(id)a3 string:(id)a4 stylesheet:(id)a5 kind:(int)a6 flowName:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)SXTextTangierFlowStorage;
  v14 = [(TSWPStorage *)&v17 initWithContext:a3 string:a4 stylesheet:a5 kind:v8];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_flowName, a7);
  }

  return v15;
}

- (NSString)flowName
{
  return self->_flowName;
}

- (void).cxx_destruct
{
}

@end