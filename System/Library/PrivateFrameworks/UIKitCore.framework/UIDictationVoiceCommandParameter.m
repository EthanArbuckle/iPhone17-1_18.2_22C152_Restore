@interface UIDictationVoiceCommandParameter
+ (BOOL)supportsSecureCoding;
- (NSString)text;
- (UIDictationVoiceCommandParameter)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setText:(id)a3;
@end

@implementation UIDictationVoiceCommandParameter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(UIDictationVoiceCommandParameter *)self text];
  v6 = (void *)[v5 copy];
  [v4 setText:v6];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (UIDictationVoiceCommandParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIDictationVoiceCommandParameter;
  v5 = [(UIDictationVoiceCommandParameter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_text"];
    text = v5->_text;
    v5->_text = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  return self->_text;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end