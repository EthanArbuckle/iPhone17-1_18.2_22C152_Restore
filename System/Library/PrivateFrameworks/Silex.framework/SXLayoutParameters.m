@interface SXLayoutParameters
- (SXLayoutOptions)layoutOptions;
- (SXLayoutParameters)initWithLayoutOptions:(id)a3 layoutType:(unint64_t)a4 expectedDuration:(double)a5;
- (double)expectedDuration;
- (id)description;
- (unint64_t)layoutType;
@end

@implementation SXLayoutParameters

- (SXLayoutParameters)initWithLayoutOptions:(id)a3 layoutType:(unint64_t)a4 expectedDuration:(double)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXLayoutParameters;
  v10 = [(SXLayoutParameters *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_layoutOptions, a3);
    v11->_layoutType = a4;
    v11->_expectedDuration = a5;
  }

  return v11;
}

- (id)description
{
  unint64_t v3 = [(SXLayoutParameters *)self layoutType];
  v4 = @"unknown";
  if (v3 == 2) {
    v4 = @"update";
  }
  if (v3 == 1) {
    v5 = @"new";
  }
  else {
    v5 = v4;
  }
  v6 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; type: %@;", objc_opt_class(), self, v5];
  v7 = [(SXLayoutParameters *)self layoutOptions];
  [v6 appendFormat:@"\noptions: \n%@", v7];

  [(SXLayoutParameters *)self expectedDuration];
  [v6 appendFormat:@"\nexpectedDuration: \n%@", v8];
  [v6 appendFormat:@"\n>"];
  return v6;
}

- (SXLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (double)expectedDuration
{
  return self->_expectedDuration;
}

- (void).cxx_destruct
{
}

@end