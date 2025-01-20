@interface PREResponsesExperimentSuggestion
+ (BOOL)supportsSecureCoding;
- (BOOL)isDynamicReply;
- (BOOL)isEqual:(id)a3;
- (NSString)title;
- (PREResponsesExperimentSuggestion)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDynamicReply:(BOOL)a3;
- (void)setTitle:(id)a3;
@end

@implementation PREResponsesExperimentSuggestion

- (void).cxx_destruct
{
}

- (void)setDynamicReply:(BOOL)a3
{
  self->_dynamicReply = a3;
}

- (BOOL)isDynamicReply
{
  return self->_dynamicReply;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v2 = [(PREResponsesExperimentSuggestion *)self title];
  unint64_t v3 = [v2 hash] + 31;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PREResponsesExperimentSuggestion *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      unint64_t v8 = [(PREResponsesExperimentSuggestion *)self hash];
      if (v8 == [(PREResponsesExperimentSuggestion *)v7 hash])
      {
        title = self->_title;
        v10 = [(PREResponsesExperimentSuggestion *)v7 title];
        if ([(NSString *)title isEqualToString:v10])
        {
          BOOL dynamicReply = self->_dynamicReply;
          BOOL v6 = dynamicReply == [(PREResponsesExperimentSuggestion *)v7 isDynamicReply];
        }
        else
        {
          BOOL v6 = 0;
        }
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  uint64_t v5 = (void *)[(NSString *)self->_title copy];
  [v4 setTitle:v5];

  [v4 setDynamicReply:self->_dynamicReply];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  title = self->_title;
  id v5 = a3;
  [v5 encodeObject:title forKey:@"title"];
  [v5 encodeBool:self->_dynamicReply forKey:@"dynamicReply"];
}

- (PREResponsesExperimentSuggestion)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PREResponsesExperimentSuggestion;
  id v5 = [(PREResponsesExperimentSuggestion *)&v12 init];
  if (v5)
  {
    BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    uint64_t v7 = [v6 copy];
    unint64_t v8 = (void *)v7;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    else {
      v9 = &stru_1F24E3FB8;
    }
    objc_storeStrong((id *)&v5->_title, v9);

    v5->_BOOL dynamicReply = [v4 decodeBoolForKey:@"dynamicReply"];
    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end