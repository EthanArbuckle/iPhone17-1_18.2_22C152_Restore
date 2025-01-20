@interface MOPersonRelationship
+ (BOOL)supportsSecureCoding;
- (MOPersonRelationship)initWithCoder:(id)a3;
- (MOPersonRelationship)initWithRelationship:(unint64_t)a3 score:(double)a4 source:(id)a5;
- (NSString)source;
- (double)score;
- (id)description;
- (unint64_t)relationship;
- (void)encodeWithCoder:(id)a3;
- (void)setRelationship:(unint64_t)a3;
- (void)setSource:(id)a3;
@end

@implementation MOPersonRelationship

- (MOPersonRelationship)initWithRelationship:(unint64_t)a3 score:(double)a4 source:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MOPersonRelationship;
  v9 = [(MOPersonRelationship *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_relationship = a3;
    v9->_score = a4;
    v11 = (NSString *)[v8 copy];
    source = v10->_source;
    v10->_source = v11;
  }
  return v10;
}

- (id)description
{
  unint64_t v3 = [(MOPersonRelationship *)self relationship];
  [(MOPersonRelationship *)self score];
  uint64_t v5 = v4;
  v6 = [(MOPersonRelationship *)self source];
  v7 = +[NSString stringWithFormat:@"<MOPersonRelationship relationship , %lu, score , %.1f, source, %@>", v3, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t relationship = self->_relationship;
  id v5 = a3;
  [v5 encodeInt64:relationship forKey:@"relationship"];
  [v5 encodeDouble:@"score" forKey:self->_score];
  [v5 encodeObject:self->_source forKey:@"source"];
}

- (MOPersonRelationship)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeInt64ForKey:@"relationship"];
  [v4 decodeDoubleForKey:@"score"];
  double v7 = v6;
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];

  v9 = [(MOPersonRelationship *)self initWithRelationship:v5 score:v8 source:v7];
  return v9;
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(unint64_t)a3
{
  self->_unint64_t relationship = a3;
}

- (double)score
{
  return self->_score;
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end