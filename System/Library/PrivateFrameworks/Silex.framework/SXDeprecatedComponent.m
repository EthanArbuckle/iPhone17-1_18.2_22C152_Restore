@interface SXDeprecatedComponent
+ (id)deprecatedComponentWithType:(uint64_t)a3 withReplacementClassificationClass:;
- (SXDeprecatedComponent)initWithType:(id)a3 withReplacementClassification:(Class)a4;
@end

@implementation SXDeprecatedComponent

+ (id)deprecatedComponentWithType:(uint64_t)a3 withReplacementClassificationClass:
{
  id v4 = a2;
  v5 = (void *)[objc_alloc((Class)self) initWithType:v4 withReplacementClassification:a3];

  return v5;
}

- (SXDeprecatedComponent)initWithType:(id)a3 withReplacementClassification:(Class)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXDeprecatedComponent;
  v8 = [(SXDeprecatedComponent *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_typeString, a3);
    v10 = (SXComponentClassification *)objc_alloc_init(a4);
    replacementClassification = v9->_replacementClassification;
    v9->_replacementClassification = v10;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementClassification, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
}

@end