@interface SVXUserFeedbackNode
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)dependentNodes;
- (NSString)identifier;
- (SVXUserFeedback)feedback;
- (SVXUserFeedbackNode)initWithCoder:(id)a3;
- (SVXUserFeedbackNode)initWithIdentifier:(id)a3 duration:(double)a4 feedback:(id)a5 dependentNodes:(id)a6;
- (double)duration;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXUserFeedbackNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentNodes, 0);
  objc_storeStrong((id *)&self->_feedback, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSSet)dependentNodes
{
  return self->_dependentNodes;
}

- (SVXUserFeedback)feedback
{
  return self->_feedback;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"SVXUserFeedbackNode::identifier"];
  v5 = [NSNumber numberWithDouble:self->_duration];
  [v6 encodeObject:v5 forKey:@"SVXUserFeedbackNode::duration"];

  [v6 encodeObject:self->_feedback forKey:@"SVXUserFeedbackNode::feedback"];
  [v6 encodeObject:self->_dependentNodes forKey:@"SVXUserFeedbackNode::dependentNodes"];
}

- (SVXUserFeedbackNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackNode::identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackNode::duration"];
  [v6 doubleValue];
  double v8 = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackNode::feedback"];
  v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v13 = [v4 decodeObjectOfClasses:v12 forKey:@"SVXUserFeedbackNode::dependentNodes"];

  v14 = [(SVXUserFeedbackNode *)self initWithIdentifier:v5 duration:v9 feedback:v13 dependentNodes:v8];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXUserFeedbackNode *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      double duration = self->_duration;
      [(SVXUserFeedbackNode *)v5 duration];
      if (duration == v7)
      {
        v9 = [(SVXUserFeedbackNode *)v5 identifier];
        identifier = self->_identifier;
        if (identifier == v9 || [(NSString *)identifier isEqual:v9])
        {
          uint64_t v11 = [(SVXUserFeedbackNode *)v5 feedback];
          feedback = self->_feedback;
          if (feedback == v11 || [(SVXUserFeedback *)feedback isEqual:v11])
          {
            v13 = [(SVXUserFeedbackNode *)v5 dependentNodes];
            dependentNodes = self->_dependentNodes;
            BOOL v8 = dependentNodes == v13 || [(NSSet *)dependentNodes isEqual:v13];
          }
          else
          {
            BOOL v8 = 0;
          }
        }
        else
        {
          BOOL v8 = 0;
        }
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  id v4 = [NSNumber numberWithDouble:self->_duration];
  uint64_t v5 = [v4 hash];
  unint64_t v6 = v3 ^ [(SVXUserFeedback *)self->_feedback hash];
  unint64_t v7 = v5 ^ v6 ^ [(NSSet *)self->_dependentNodes hash];

  return v7;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SVXUserFeedbackNode;
  uint64_t v5 = [(SVXUserFeedbackNode *)&v8 description];
  unint64_t v6 = (void *)[v4 initWithFormat:@"%@ {identifier = %@, duration = %f, feedback = %@, dependentNodes = %@}", v5, self->_identifier, *(void *)&self->_duration, self->_feedback, self->_dependentNodes];

  return v6;
}

- (id)description
{
  return [(SVXUserFeedbackNode *)self _descriptionWithIndent:0];
}

- (SVXUserFeedbackNode)initWithIdentifier:(id)a3 duration:(double)a4 feedback:(id)a5 dependentNodes:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)SVXUserFeedbackNode;
  v13 = [(SVXUserFeedbackNode *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v13->_double duration = a4;
    uint64_t v16 = [v11 copy];
    feedback = v13->_feedback;
    v13->_feedback = (SVXUserFeedback *)v16;

    uint64_t v18 = [v12 copy];
    dependentNodes = v13->_dependentNodes;
    v13->_dependentNodes = (NSSet *)v18;
  }
  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXUserFeedbackNodeMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SVXUserFeedbackNodeMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    unint64_t v6 = [(_SVXUserFeedbackNodeMutation *)v5 generate];
  }
  else
  {
    unint64_t v6 = (void *)[(SVXUserFeedbackNode *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  NSUInteger v3 = (void (**)(id, _SVXUserFeedbackNodeMutation *))a3;
  id v4 = objc_alloc_init(_SVXUserFeedbackNodeMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  uint64_t v5 = [(_SVXUserFeedbackNodeMutation *)v4 generate];

  return v5;
}

@end