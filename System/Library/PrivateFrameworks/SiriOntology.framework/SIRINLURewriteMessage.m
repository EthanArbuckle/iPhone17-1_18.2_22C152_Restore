@interface SIRINLURewriteMessage
+ (BOOL)supportsSecureCoding;
- (NSString)rewrittenUtterance;
- (SIRINLURewriteMessage)initWithCoder:(id)a3;
- (SIRINLURewriteMessage)initWithType:(int)a3 utterance:(id)a4;
- (id)description;
- (int)rewriteType;
- (void)encodeWithCoder:(id)a3;
- (void)setRewriteType:(int)a3;
- (void)setRewrittenUtterance:(id)a3;
@end

@implementation SIRINLURewriteMessage

- (void).cxx_destruct
{
}

- (void)setRewrittenUtterance:(id)a3
{
}

- (NSString)rewrittenUtterance
{
  return self->_rewrittenUtterance;
}

- (void)setRewriteType:(int)a3
{
  self->_rewriteType = a3;
}

- (int)rewriteType
{
  return self->_rewriteType;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{RewriteMessage:\n  rewriteType: %d\n  rewrittenUtterance: %@\n}", self->_rewriteType, self->_rewrittenUtterance];
}

- (SIRINLURewriteMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SIRINLURewriteMessage;
  v5 = [(SIRINLURewriteMessage *)&v9 init];
  if (v5)
  {
    v5->_rewriteType = [v4 decodeIntForKey:@"rewriteType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rewrittenUtterance"];
    rewrittenUtterance = v5->_rewrittenUtterance;
    v5->_rewrittenUtterance = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t rewriteType = self->_rewriteType;
  id v5 = a3;
  [v5 encodeInt:rewriteType forKey:@"rewriteType"];
  [v5 encodeObject:self->_rewrittenUtterance forKey:@"rewrittenUtterance"];
}

- (SIRINLURewriteMessage)initWithType:(int)a3 utterance:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLURewriteMessage;
  v8 = [(SIRINLURewriteMessage *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    v8->_uint64_t rewriteType = a3;
    objc_storeStrong((id *)&v8->_rewrittenUtterance, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end