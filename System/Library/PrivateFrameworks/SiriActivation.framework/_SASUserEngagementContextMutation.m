@interface _SASUserEngagementContextMutation
- (_SASUserEngagementContextMutation)init;
- (_SASUserEngagementContextMutation)initWithBaseModel:(id)a3;
- (id)generate;
@end

@implementation _SASUserEngagementContextMutation

- (_SASUserEngagementContextMutation)init
{
  return [(_SASUserEngagementContextMutation *)self initWithBaseModel:0];
}

- (_SASUserEngagementContextMutation)initWithBaseModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SASUserEngagementContextMutation;
  v6 = [(_SASUserEngagementContextMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_baseModel, a3);
  }

  return v7;
}

- (id)generate
{
  baseModel = self->_baseModel;
  if (!baseModel || (*(unsigned char *)&self->_mutationFlags & 1) != 0) {
    id v4 = [[SASUserEngagementContext alloc] initInternal];
  }
  else {
    id v4 = (id)[(SASUserEngagementContext *)baseModel copy];
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end