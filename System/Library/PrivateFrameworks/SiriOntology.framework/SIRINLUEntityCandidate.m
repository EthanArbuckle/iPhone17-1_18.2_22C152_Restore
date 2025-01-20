@interface SIRINLUEntityCandidate
+ (BOOL)supportsSecureCoding;
- (NSArray)annotations;
- (NSString)appBundleId;
- (NSString)entityId;
- (SIRINLUEntityCandidate)initWithCoder:(id)a3;
- (SIRINLUEntityCandidate)initWithEntity:(id)a3 score:(double)a4;
- (SIRINLUEntityCandidate)initWithEntity:(id)a3 score:(double)a4 entityId:(id)a5 appBundleId:(id)a6 groupId:(id)a7 annotations:(id)a8;
- (SIRINLURRGroupIdentifier)groupId;
- (USOSerializedGraph)entity;
- (double)score;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setAnnotations:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setEntity:(id)a3;
- (void)setEntityId:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setScore:(double)a3;
@end

@implementation SIRINLUEntityCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_entityId, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

- (void)setAnnotations:(id)a3
{
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setGroupId:(id)a3
{
}

- (SIRINLURRGroupIdentifier)groupId
{
  return self->_groupId;
}

- (void)setAppBundleId:(id)a3
{
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setEntityId:(id)a3
{
}

- (NSString)entityId
{
  return self->_entityId;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setEntity:(id)a3
{
}

- (USOSerializedGraph)entity
{
  return self->_entity;
}

- (id)description
{
  v3 = [(USOSerializedGraph *)self->_entity printedForm];
  v4 = +[SIRINLUPrintUtils indentLines:v3 numSpaces:4];

  v5 = +[SIRINLUPrintUtils indentArray:self->_annotations numSpaces:4];
  v6 = NSString;
  double score = self->_score;
  entityId = self->_entityId;
  appBundleId = self->_appBundleId;
  v10 = [(SIRINLURRGroupIdentifier *)self->_groupId description];
  v11 = [v6 stringWithFormat:@"{EntityCandidate\n  entity: \n%@\n  score: %f\n  entityId: \n%@\n  appBundleId: \n%@\n  groupId: \n%@\n  annotations: \n%@\n}", v4, *(void *)&score, entityId, appBundleId, v10, v5];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SIRINLUEntityCandidate *)self entity];
  [v4 encodeObject:v5 forKey:@"entity"];

  id v6 = [NSNumber numberWithDouble:self->_score];
  [v4 encodeObject:v6 forKey:@"score"];
  [v4 encodeObject:self->_entityId forKey:@"entityId"];
  [v4 encodeObject:self->_appBundleId forKey:@"appBundleId"];
  [v4 encodeObject:self->_groupId forKey:@"groupId"];
  [v4 encodeObject:self->_annotations forKey:@"annotations"];
}

- (SIRINLUEntityCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SIRINLUEntityCandidate;
  v5 = [(SIRINLUEntityCandidate *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entity"];
    entity = v5->_entity;
    v5->_entity = (USOSerializedGraph *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"score"];
    [v8 doubleValue];
    v5->_double score = v9;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityId"];
    entityId = v5->_entityId;
    v5->_entityId = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleId"];
    appBundleId = v5->_appBundleId;
    v5->_appBundleId = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupId"];
    groupId = v5->_groupId;
    v5->_groupId = (SIRINLURRGroupIdentifier *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"annotations"];
    annotations = v5->_annotations;
    v5->_annotations = (NSArray *)v19;
  }
  return v5;
}

- (SIRINLUEntityCandidate)initWithEntity:(id)a3 score:(double)a4 entityId:(id)a5 appBundleId:(id)a6 groupId:(id)a7 annotations:(id)a8
{
  id v22 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)SIRINLUEntityCandidate;
  uint64_t v19 = [(SIRINLUEntityCandidate *)&v23 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_entity, a3);
    v20->_double score = a4;
    objc_storeStrong((id *)&v20->_entityId, a5);
    objc_storeStrong((id *)&v20->_appBundleId, a6);
    objc_storeStrong((id *)&v20->_groupId, a7);
    objc_storeStrong((id *)&v20->_annotations, a8);
  }

  return v20;
}

- (SIRINLUEntityCandidate)initWithEntity:(id)a3 score:(double)a4
{
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SIRINLUEntityCandidate;
  v8 = [(SIRINLUEntityCandidate *)&v15 init];
  double v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_entity, a3);
    v9->_double score = a4;
    entityId = v9->_entityId;
    v9->_entityId = (NSString *)&stru_1F246D8C8;

    appBundleId = v9->_appBundleId;
    v9->_appBundleId = (NSString *)&stru_1F246D8C8;

    groupId = v9->_groupId;
    v9->_groupId = 0;

    annotations = v9->_annotations;
    v9->_annotations = 0;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end