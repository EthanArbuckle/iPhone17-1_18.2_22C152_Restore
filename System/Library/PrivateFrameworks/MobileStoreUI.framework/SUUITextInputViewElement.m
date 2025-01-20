@interface SUUITextInputViewElement
+ (BOOL)isTextInputType:(id)a3;
+ (id)supportedFeatures;
- (BOOL)isSecure;
- (NSString)placeholderText;
- (SUUIAnimatorDOMFeature)animationInterface;
- (SUUITextInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)keyboardType;
- (int64_t)maximumLength;
- (unint64_t)elementType;
@end

@implementation SUUITextInputViewElement

- (SUUITextInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUITextInputViewElement;
  v9 = [(SUUIInputViewElement *)&v18 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (!v9) {
    goto LABEL_17;
  }
  v10 = [v8 getAttribute:@"type"];
  if ([v10 isEqualToString:@"email"])
  {
    uint64_t v11 = 7;
  }
  else
  {
    if (![v10 isEqualToString:@"number"])
    {
      v9->_keyboardType = 0;
      goto LABEL_8;
    }
    uint64_t v11 = 4;
  }
  v9->_keyboardType = v11;
LABEL_8:
  v12 = [v8 getAttribute:@"maxlength"];
  v13 = v12;
  if (v12) {
    v9->_maximumLength = [v12 integerValue];
  }
  v14 = [v8 getAttribute:@"secure"];
  v15 = v14;
  if (v14)
  {
    v9->_secure = [v14 BOOLValue];
  }
  else if ([v10 isEqualToString:@"password"])
  {
    v9->_secure = 1;
  }
  v16 = [v8 getAttribute:@"placeholdertext"];
  if (v16) {
    objc_storeStrong((id *)&v9->_placeholderText, v16);
  }

LABEL_17:
  return v9;
}

+ (BOOL)isTextInputType:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"number"] & 1) != 0
    || ([v3 isEqualToString:@"email"] & 1) != 0
    || ([v3 isEqualToString:@"password"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"text"];
  }

  return v4;
}

- (SUUIAnimatorDOMFeature)animationInterface
{
  return (SUUIAnimatorDOMFeature *)[(SUUIViewElement *)self featureWithName:0x270508D10];
}

+ (id)supportedFeatures
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0x270508D10;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)applyUpdatesWithElement:(id)a3
{
  char v4 = (SUUITextInputViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUITextInputViewElement;
  v5 = [(SUUIViewElement *)&v8 applyUpdatesWithElement:v4];
  v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_keyboardType = [(SUUITextInputViewElement *)v4 keyboardType];
    self->_maximumLength = [(SUUITextInputViewElement *)v4 maximumLength];
  }

  return v6;
}

- (unint64_t)elementType
{
  return 140;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (int64_t)maximumLength
{
  return self->_maximumLength;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (BOOL)isSecure
{
  return self->_secure;
}

- (void).cxx_destruct
{
}

@end