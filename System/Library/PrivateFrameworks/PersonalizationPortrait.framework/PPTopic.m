@interface PPTopic
+ (BOOL)supportsSecureCoding;
+ (id)clusterIdentifierFromTopicId:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTopic:(id)a3;
- (NSSet)featureNames;
- (NSString)clusterIdentifier;
- (NSString)topicIdentifier;
- (PPTopic)initWithCoder:(id)a3;
- (PPTopic)initWithTopicIdentifier:(id)a3;
- (PPTopic)initWithTopicIdentifier:(id)a3 mostRelevantRecord:(id)a4;
- (PPTopicRecord)mostRelevantRecord;
- (double)sentimentScore;
- (id)description;
- (id)featureValueForName:(id)a3;
- (id)id;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPTopic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterIdentifier, 0);
  objc_storeStrong((id *)&self->_topicIdentifier, 0);
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (NSString)topicIdentifier
{
  return self->_topicIdentifier;
}

- (id)id
{
  return self->_topicIdentifier;
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"topicId"])
  {
    v4 = [MEMORY[0x1E4F1E950] featureValueWithString:self->_topicIdentifier];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken6_8327 != -1) {
    dispatch_once(&featureNames__pasOnceToken6_8327, &__block_literal_global_8328);
  }
  v2 = (void *)featureNames__pasExprOnceResult_8329;
  return (NSSet *)v2;
}

void __23__PPTopic_featureNames__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  v1 = (void *)MEMORY[0x192F97350]();
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"topicId", 0);
  v3 = (void *)featureNames__pasExprOnceResult_8329;
  featureNames__pasExprOnceResult_8329 = v2;
}

- (double)sentimentScore
{
  return 0.0;
}

- (id)description
{
  uint64_t v2 = (void *)[[NSString alloc] initWithFormat:@"<PPTopic i:'%@'>", self->_topicIdentifier];
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPTopic *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PPTopic *)self isEqualToTopic:v4];
  }

  return v5;
}

- (BOOL)isEqualToTopic:(id)a3
{
  v4 = (PPTopic *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else if (v4)
  {
    unint64_t v6 = self->_topicIdentifier;
    uint64_t v7 = [(PPTopic *)v5 topicIdentifier];
    v8 = (void *)v7;
    if (v6 | v7)
    {
      char v9 = 0;
      if (v6 && v7) {
        char v9 = [(id)v6 isEqualToString:v7];
      }
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  return [(NSString *)self->_topicIdentifier hash];
}

- (void)encodeWithCoder:(id)a3
{
  topicIdentifier = self->_topicIdentifier;
  id v5 = a3;
  [v5 encodeObject:topicIdentifier forKey:@"id"];
  id v6 = [(PPTopic *)self mostRelevantRecord];
  [v5 encodeObject:v6 forKey:@"rec"];
}

- (PPTopic)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"id"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rec"];

  if (v5)
  {
    self = [(PPTopic *)self initWithTopicIdentifier:v5 mostRelevantRecord:v6];
    uint64_t v7 = self;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (PPTopicRecord)mostRelevantRecord
{
  return 0;
}

- (PPTopic)initWithTopicIdentifier:(id)a3
{
  return [(PPTopic *)self initWithTopicIdentifier:a3 mostRelevantRecord:0];
}

- (PPTopic)initWithTopicIdentifier:(id)a3 mostRelevantRecord:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
    {
LABEL_3:
      v11 = [[PPTopicWithRecord alloc] initWithTopicIdentifier:v8 mostRelevantRecord:v10];
      goto LABEL_8;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PPTopic.m", 82, @"Invalid parameter not satisfying: %@", @"topicIdentifier" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)PPTopic;
  v13 = [(PPTopic *)&v19 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_topicIdentifier, a3);
    uint64_t v15 = +[PPTopic clusterIdentifierFromTopicId:v8];
    clusterIdentifier = v14->_clusterIdentifier;
    v14->_clusterIdentifier = (NSString *)v15;
  }
  v11 = v14;
  self = &v11->super;
LABEL_8:
  p_super = &v11->super;

  return p_super;
}

+ (id)clusterIdentifierFromTopicId:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x192F97350]();
  id v5 = v3;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end