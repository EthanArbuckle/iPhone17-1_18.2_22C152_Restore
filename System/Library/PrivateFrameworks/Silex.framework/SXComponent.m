@interface SXComponent
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
+ (id)purgeClassBlockForPropertyWithName:(id)a3;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (BOOL)requiresLinkedContent;
- (NSString)description;
- (SXComponentAnimation)backingAnimation;
- (SXComponentClassification)classification;
- (id)animationWithValue:(id)a3 withType:(int)a4;
- (int)role;
- (unint64_t)contentRelevanceWithValue:(id)a3 withType:(int)a4;
- (unint64_t)traits;
- (void)setBackingAnimation:(id)a3;
@end

@implementation SXComponent

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"behaviors"]
    || [v4 isEqualToString:@"additions"])
  {
    uint64_t v5 = +[SXClassFactory valueClassBlockForBaseClass:objc_opt_class()];
LABEL_4:
    v6 = (void *)v5;
    goto LABEL_5;
  }
  if (([v4 isEqualToString:@"conditional"] & 1) == 0)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SXComponent;
    uint64_t v5 = objc_msgSendSuper2(&v8, sel_valueClassBlockForPropertyWithName_, v4);
    goto LABEL_4;
  }
  v6 = &__block_literal_global_39;
LABEL_5:

  return v6;
}

uint64_t __50__SXComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

+ (id)purgeClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"additions"])
  {
    uint64_t v5 = &__block_literal_global_13;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXComponent;
    uint64_t v5 = objc_msgSendSuper2(&v7, sel_purgeClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

BOOL __50__SXComponent_purgeClassBlockForPropertyWithName___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [v2 objectForKey:@"type"];
    +[SXClassFactory classForBaseClass:objc_opt_class() type:v3];
    uint64_t v4 = objc_opt_class();
    BOOL v5 = v4 == objc_opt_class();
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"anchor"])
  {
    uint64_t v8 = objc_opt_class();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXComponent;
    uint64_t v8 = objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
  }
  v9 = (void *)v8;

  return (Class)v9;
}

- (id)animationWithValue:(id)a3 withType:(int)a4
{
  id v6 = a3;
  uint64_t v7 = [(SXComponent *)self backingAnimation];
  uint64_t v8 = (void *)v7;
  if (a4 == 5 && !v7)
  {
    uint64_t v9 = objc_opt_class();
    v10 = [v6 objectForKey:@"type"];
    objc_super v11 = +[SXClassFactory classForBaseClass:v9 type:v10];

    id v12 = [v11 alloc];
    v13 = [(SXJSONObject *)self specificationVersion];
    uint64_t v8 = (void *)[v12 initWithJSONObject:v6 andVersion:v13];

    [(SXComponent *)self setBackingAnimation:v8];
  }

  return v8;
}

- (unint64_t)contentRelevanceWithValue:(id)a3 withType:(int)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if (a4 == 3)
    {
      if ([v6 isEqualToString:@"low"])
      {
        unint64_t v8 = 1;
      }
      else if ([v7 isEqualToString:@"medium"])
      {
        unint64_t v8 = 0;
      }
      else if ([v7 isEqualToString:@"high"])
      {
        unint64_t v8 = 2;
      }
      else
      {
        unint64_t v8 = 3;
      }
    }
    else
    {
      unint64_t v8 = 3;
    }
  }
  else
  {
    uint64_t v9 = [(SXComponent *)self classification];
    unint64_t v8 = [v9 contentRelevance];
  }
  return v8;
}

- (SXComponentClassification)classification
{
  classification = self->_classification;
  if (!classification)
  {
    uint64_t v4 = [(SXJSONObject *)self valueForLookupKey:@"role"];
    BOOL v5 = [(SXComponent *)self type];
    id v6 = +[SXComponentClassification classificationForComponentWithType:v5 role:v4];
    uint64_t v7 = self->_classification;
    self->_classification = v6;

    classification = self->_classification;
  }
  return classification;
}

- (unint64_t)traits
{
  return 0;
}

- (int)role
{
  id v2 = [(SXComponent *)self classification];
  int v3 = [(id)objc_opt_class() role];

  return v3;
}

- (NSString)description
{
  int v3 = NSString;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(SXComponent *)self identifier];
  id v6 = [v3 stringWithFormat:@"<%@: %p; identifier: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (SXComponentAnimation)backingAnimation
{
  return self->backingAnimation;
}

- (void)setBackingAnimation:(id)a3
{
}

- (BOOL)requiresLinkedContent
{
  return self->requiresLinkedContent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classification, 0);
  objc_storeStrong((id *)&self->backingAnimation, 0);
}

@end