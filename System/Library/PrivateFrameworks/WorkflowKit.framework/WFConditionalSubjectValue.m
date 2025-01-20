@interface WFConditionalSubjectValue
+ (BOOL)supportsSecureCoding;
- (BOOL)isCaseInsensitive;
- (WFConditionalSubjectValue)initWithCoder:(id)a3;
- (WFConditionalSubjectValue)initWithContent:(id)a3 contentType:(int64_t)a4 caseInsensitive:(BOOL)a5 comparableTimeUnits:(unint64_t)a6;
- (WFContentCollection)content;
- (int64_t)contentType;
- (unint64_t)comparableTimeUnits;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFConditionalSubjectValue

- (void).cxx_destruct
{
}

- (unint64_t)comparableTimeUnits
{
  return self->_comparableTimeUnits;
}

- (BOOL)isCaseInsensitive
{
  return self->_caseInsensitive;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (WFContentCollection)content
{
  return self->_content;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(WFConditionalSubjectValue *)self content];
  [v5 encodeObject:v4 forKey:@"content"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[WFConditionalSubjectValue contentType](self, "contentType"), @"contentType");
  objc_msgSend(v5, "encodeBool:forKey:", -[WFConditionalSubjectValue isCaseInsensitive](self, "isCaseInsensitive"), @"caseInsensitive");
  objc_msgSend(v5, "encodeInteger:forKey:", -[WFConditionalSubjectValue comparableTimeUnits](self, "comparableTimeUnits"), @"comparableTimeUnits");
}

- (WFConditionalSubjectValue)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"content"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"contentType"];
  uint64_t v7 = [v4 decodeBoolForKey:@"caseInsensitive"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"comparableTimeUnits"];

  if (v5)
  {
    v9 = [(WFConditionalSubjectValue *)self initWithContent:v5 contentType:v6 caseInsensitive:v7 comparableTimeUnits:v8];
  }
  else
  {
    v10 = objc_opt_new();
    v9 = [(WFConditionalSubjectValue *)self initWithContent:v10 contentType:v6 caseInsensitive:v7 comparableTimeUnits:v8];
  }
  return v9;
}

- (WFConditionalSubjectValue)initWithContent:(id)a3 contentType:(int64_t)a4 caseInsensitive:(BOOL)a5 comparableTimeUnits:(unint64_t)a6
{
  id v12 = a3;
  if (!v12)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFConditionalSubjectParameterState.m", 20, @"Invalid parameter not satisfying: %@", @"content" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFConditionalSubjectValue;
  v13 = [(WFConditionalSubjectValue *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_content, a3);
    v14->_caseInsensitive = a5;
    v14->_contentType = a4;
    v14->_comparableTimeUnits = a6;
    v15 = v14;
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end