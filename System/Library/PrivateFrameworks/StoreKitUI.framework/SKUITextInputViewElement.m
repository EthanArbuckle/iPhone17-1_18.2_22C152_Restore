@interface SKUITextInputViewElement
+ (BOOL)isTextInputType:(id)a3;
+ (id)supportedFeatures;
+ (void)supportedFeatures;
- (BOOL)isSecure;
- (NSString)placeholderText;
- (SKUIAnimatorDOMFeature)animationInterface;
- (SKUITextInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
- (id)applyUpdatesWithElement:(id)a3;
- (int64_t)keyboardType;
- (int64_t)maximumLength;
- (unint64_t)elementType;
@end

@implementation SKUITextInputViewElement

- (SKUITextInputViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v11 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v11) {
        -[SKUITextInputViewElement initWithDOMElement:parent:elementFactory:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)SKUITextInputViewElement;
  v19 = [(SKUIInputViewElement *)&v28 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v19)
  {
    v20 = [v8 getAttribute:@"type"];
    if ([v20 isEqualToString:@"email"])
    {
      uint64_t v21 = 7;
    }
    else
    {
      if (![v20 isEqualToString:@"number"])
      {
        v19->_keyboardType = 0;
        goto LABEL_12;
      }
      uint64_t v21 = 4;
    }
    v19->_keyboardType = v21;
LABEL_12:
    v22 = [v8 getAttribute:@"maxlength"];
    v23 = v22;
    if (v22) {
      v19->_maximumLength = [v22 integerValue];
    }
    v24 = [v8 getAttribute:@"secure"];
    v25 = v24;
    if (v24)
    {
      v19->_secure = [v24 BOOLValue];
    }
    else if ([v20 isEqualToString:@"password"])
    {
      v19->_secure = 1;
    }
    v26 = [v8 getAttribute:@"placeholdertext"];
    if (v26) {
      objc_storeStrong((id *)&v19->_placeholderText, v26);
    }
  }
  return v19;
}

+ (BOOL)isTextInputType:(id)a3
{
  id v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v4 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v4) {
        +[SKUITextInputViewElement isTextInputType:](v4, v5, v6, v7, v8, v9, v10, v11);
      }
    }
  }
  if (([v3 isEqualToString:@"number"] & 1) != 0
    || ([v3 isEqualToString:@"email"] & 1) != 0
    || ([v3 isEqualToString:@"password"] & 1) != 0)
  {
    char v12 = 1;
  }
  else
  {
    char v12 = [v3 isEqualToString:@"text"];
  }

  return v12;
}

- (SKUIAnimatorDOMFeature)animationInterface
{
  return (SKUIAnimatorDOMFeature *)[(SKUIViewElement *)self featureWithName:0x1F1C90F28];
}

+ (id)supportedFeatures
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v2 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v2) {
        +[SKUITextInputViewElement supportedFeatures];
      }
    }
  }
  v12[0] = 0x1F1C90F28;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  return v10;
}

- (id)applyUpdatesWithElement:(id)a3
{
  uint64_t v4 = (SKUITextInputViewElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SKUITextInputViewElement;
  uint64_t v5 = [(SKUIViewElement *)&v8 applyUpdatesWithElement:v4];
  uint64_t v6 = v5;
  if (v4 != self && v5 == self)
  {
    self->_keyboardType = [(SKUITextInputViewElement *)v4 keyboardType];
    self->_maximumLength = [(SKUITextInputViewElement *)v4 maximumLength];
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

- (void)initWithDOMElement:(uint64_t)a3 parent:(uint64_t)a4 elementFactory:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)isTextInputType:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)supportedFeatures
{
}

@end