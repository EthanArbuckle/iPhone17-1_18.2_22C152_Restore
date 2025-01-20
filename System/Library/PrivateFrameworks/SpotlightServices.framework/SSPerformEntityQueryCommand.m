@interface SSPerformEntityQueryCommand
+ (BOOL)supportsSecureCoding;
- (BOOL)fromSuggestion;
- (SSPerformEntityQueryCommand)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setFromSuggestion:(BOOL)a3;
@end

@implementation SSPerformEntityQueryCommand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSPerformEntityQueryCommand;
  id v4 = a3;
  [(SSPerformEntityQueryCommand *)&v6 encodeWithCoder:v4];
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SSPerformEntityQueryCommand fromSuggestion](self, "fromSuggestion", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"_fromSuggestion"];
}

- (SSPerformEntityQueryCommand)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SSPerformEntityQueryCommand;
  v5 = [(SSPerformEntityQueryCommand *)&v8 initWithCoder:v4];
  if (v5)
  {
    objc_super v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fromSuggestion"];
    -[SSPerformEntityQueryCommand setFromSuggestion:](v5, "setFromSuggestion:", [v6 BOOLValue]);
  }
  return v5;
}

- (BOOL)fromSuggestion
{
  return self->_fromSuggestion;
}

- (void)setFromSuggestion:(BOOL)a3
{
  self->_fromSuggestion = a3;
}

@end