@interface WFURLParameter
- (Class)singleStateClass;
- (id)autocapitalizationType;
- (id)autocorrectionType;
- (id)keyboardType;
- (id)textContentType;
@end

@implementation WFURLParameter

- (id)textContentType
{
  return (id)*MEMORY[0x1E4FB4E80];
}

- (id)keyboardType
{
  return (id)*MEMORY[0x1E4FB4E38];
}

- (id)autocorrectionType
{
  return (id)*MEMORY[0x1E4FB4E08];
}

- (id)autocapitalizationType
{
  return (id)*MEMORY[0x1E4FB4DF0];
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end