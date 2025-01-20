@interface TUConversationPresentationContext
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPresentationContext:(id)a3;
- (TUConversationPresentationContext)init;
- (TUConversationPresentationContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)mode;
- (void)encodeWithCoder:(id)a3;
- (void)setMode:(unint64_t)a3;
@end

@implementation TUConversationPresentationContext

- (TUConversationPresentationContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUConversationPresentationContext;
  result = [(TUConversationPresentationContext *)&v3 init];
  if (result) {
    result->_mode = 0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationPresentationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversationPresentationContext;
  v5 = [(TUConversationPresentationContext *)&v8 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_mode);
    v5->_mode = [v4 decodeIntegerForKey:v6];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUConversationPresentationContext *)self mode];
  NSStringFromSelector(sel_mode);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeInteger:v5 forKey:v6];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setMode:", -[TUConversationPresentationContext mode](self, "mode"));
  return v4;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" mode=%zu", -[TUConversationPresentationContext mode](self, "mode"));
  [v3 appendString:@">"];
  id v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TUConversationPresentationContext *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(TUConversationPresentationContext *)self isEqualToPresentationContext:v4];
  }

  return v5;
}

- (BOOL)isEqualToPresentationContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TUConversationPresentationContext *)self mode];
  uint64_t v6 = [v4 mode];

  return v5 == v6;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

@end