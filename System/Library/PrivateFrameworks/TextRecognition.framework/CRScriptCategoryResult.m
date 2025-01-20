@interface CRScriptCategoryResult
- (BOOL)valid;
- (CRScriptCategory)scriptCategory;
- (CRScriptCategoryResult)initWithScriptCategory:(id)a3 probability:(float)a4;
- (float)probability;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation CRScriptCategoryResult

- (CRScriptCategoryResult)initWithScriptCategory:(id)a3 probability:(float)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRScriptCategoryResult;
  v8 = [(CRScriptCategoryResult *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_scriptCategory, a3);
    v9->_probability = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [CRScriptCategoryResult alloc];
  v5 = [(CRScriptCategoryResult *)self scriptCategory];
  [(CRScriptCategoryResult *)self probability];
  v6 = -[CRScriptCategoryResult initWithScriptCategory:probability:](v4, "initWithScriptCategory:probability:", v5);

  return v6;
}

- (BOOL)valid
{
  [(CRScriptCategoryResult *)self probability];
  float v4 = v3;
  v5 = [(CRScriptCategoryResult *)self scriptCategory];
  [(id)objc_opt_class() confidenceThreshold];
  BOOL v7 = v4 >= v6;

  return v7;
}

- (CRScriptCategory)scriptCategory
{
  return (CRScriptCategory *)objc_getProperty(self, a2, 16, 1);
}

- (float)probability
{
  return self->_probability;
}

- (void).cxx_destruct
{
}

@end