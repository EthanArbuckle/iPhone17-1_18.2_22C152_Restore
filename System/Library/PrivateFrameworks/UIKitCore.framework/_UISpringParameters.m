@interface _UISpringParameters
+ (BOOL)supportsSecureCoding;
+ (_UISpringParameters)parametersWithDampingRatio:(double)a3 response:(double)a4;
- (BOOL)isEqual:(id)a3;
- (_UISpringParameters)initWithCoder:(id)a3;
- (_UISpringParameters)initWithDampingRatio:(double)a3 response:(double)a4;
- (double)_dampingRatio;
- (double)_response;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UISpringParameters

+ (_UISpringParameters)parametersWithDampingRatio:(double)a3 response:(double)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithDampingRatio:a3 response:a4];
  return (_UISpringParameters *)v4;
}

- (_UISpringParameters)initWithDampingRatio:(double)a3 response:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UISpringParameters;
  result = [(_UISpringParameters *)&v7 init];
  if (result)
  {
    result->__dampingRatio = a3;
    result->__response = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UISpringParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"_dampingRatio"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"_response"];
  double v8 = v7;

  return [(_UISpringParameters *)self initWithDampingRatio:v6 response:v8];
}

- (void)encodeWithCoder:(id)a3
{
  double dampingRatio = self->__dampingRatio;
  id v5 = a3;
  [v5 encodeDouble:@"_dampingRatio" forKey:dampingRatio];
  [v5 encodeDouble:@"_response" forKey:self->__response];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(_UISpringParameters *)self _dampingRatio];
    double v7 = v6;
    [v5 _dampingRatio];
    if (v7 == v8)
    {
      [(_UISpringParameters *)self _response];
      double v10 = v9;
      [v5 _response];
      BOOL v12 = v10 == v11;
    }
    else
    {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)description
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel__dampingRatio);
  v8[0] = v3;
  id v4 = NSStringFromSelector(sel__response);
  v8[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  double v6 = +[UIDescriptionBuilder descriptionForObject:self keys:v5];

  return v6;
}

- (double)_dampingRatio
{
  return self->__dampingRatio;
}

- (double)_response
{
  return self->__response;
}

@end