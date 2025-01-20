@interface SVXUserFeedbackScene
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)nodes;
- (NSString)identifier;
- (SVXUserFeedbackScene)initWithCoder:(id)a3;
- (SVXUserFeedbackScene)initWithIdentifier:(id)a3 duration:(double)a4 nodes:(id)a5;
- (double)duration;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXUserFeedbackScene

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSSet)nodes
{
  return self->_nodes;
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
  [v6 encodeObject:identifier forKey:@"SVXUserFeedbackScene::identifier"];
  v5 = [NSNumber numberWithDouble:self->_duration];
  [v6 encodeObject:v5 forKey:@"SVXUserFeedbackScene::duration"];

  [v6 encodeObject:self->_nodes forKey:@"SVXUserFeedbackScene::nodes"];
}

- (SVXUserFeedbackScene)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackScene::identifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXUserFeedbackScene::duration"];
  [v6 doubleValue];
  double v8 = v7;

  v9 = (void *)MEMORY[0x263EFFA08];
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v12 = [v4 decodeObjectOfClasses:v11 forKey:@"SVXUserFeedbackScene::nodes"];

  v13 = [(SVXUserFeedbackScene *)self initWithIdentifier:v5 duration:v12 nodes:v8];
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXUserFeedbackScene *)a3;
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
      [(SVXUserFeedbackScene *)v5 duration];
      if (duration == v7)
      {
        v9 = [(SVXUserFeedbackScene *)v5 identifier];
        identifier = self->_identifier;
        if (identifier == v9 || [(NSString *)identifier isEqual:v9])
        {
          v11 = [(SVXUserFeedbackScene *)v5 nodes];
          nodes = self->_nodes;
          BOOL v8 = nodes == v11 || [(NSSet *)nodes isEqual:v11];
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
  unint64_t v6 = v5 ^ v3 ^ [(NSSet *)self->_nodes hash];

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)SVXUserFeedbackScene;
  uint64_t v5 = [(SVXUserFeedbackScene *)&v8 description];
  unint64_t v6 = (void *)[v4 initWithFormat:@"%@ {identifier = %@, duration = %f, nodes = %@}", v5, self->_identifier, *(void *)&self->_duration, self->_nodes];

  return v6;
}

- (id)description
{
  return [(SVXUserFeedbackScene *)self _descriptionWithIndent:0];
}

- (SVXUserFeedbackScene)initWithIdentifier:(id)a3 duration:(double)a4 nodes:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SVXUserFeedbackScene;
  uint64_t v10 = [(SVXUserFeedbackScene *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v10->_double duration = a4;
    uint64_t v13 = [v9 copy];
    nodes = v10->_nodes;
    v10->_nodes = (NSSet *)v13;
  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXUserFeedbackSceneMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_SVXUserFeedbackSceneMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    unint64_t v6 = [(_SVXUserFeedbackSceneMutation *)v5 generate];
  }
  else
  {
    unint64_t v6 = (void *)[(SVXUserFeedbackScene *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  NSUInteger v3 = (void (**)(id, _SVXUserFeedbackSceneMutation *))a3;
  id v4 = objc_alloc_init(_SVXUserFeedbackSceneMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  uint64_t v5 = [(_SVXUserFeedbackSceneMutation *)v4 generate];

  return v5;
}

@end