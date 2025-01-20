@interface TPSInclusivityValidation
- (NSArray)excludeValues;
- (NSArray)targetValues;
- (TPSInclusivityValidation)initWithTargetValues:(id)a3 excludeValues:(id)a4;
- (id)description;
- (void)setExcludeValues:(id)a3;
- (void)setTargetValues:(id)a3;
@end

@implementation TPSInclusivityValidation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeValues, 0);

  objc_storeStrong((id *)&self->_targetValues, 0);
}

- (TPSInclusivityValidation)initWithTargetValues:(id)a3 excludeValues:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPSInclusivityValidation;
  v9 = [(TPSInclusivityValidation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetValues, a3);
    objc_storeStrong((id *)&v10->_excludeValues, a4);
  }

  return v10;
}

- (NSArray)targetValues
{
  return self->_targetValues;
}

- (NSArray)excludeValues
{
  return self->_excludeValues;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(TPSInclusivityValidation *)self targetValues];
  id v7 = [(TPSInclusivityValidation *)self excludeValues];
  id v8 = [v3 stringWithFormat:@"<%@: %p include = %@; exclude: %@>", v5, self, v6, v7];;

  return v8;
}

- (void)setTargetValues:(id)a3
{
}

- (void)setExcludeValues:(id)a3
{
}

@end