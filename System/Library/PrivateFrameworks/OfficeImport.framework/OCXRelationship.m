@interface OCXRelationship
- (NSString)idString;
- (NSString)target;
- (NSString)type;
- (OCXRelationship)initWithId:(unint64_t)a3 type:(id)a4 target:(id)a5 external:(BOOL)a6;
- (void)writeToStreamWriter:(id)a3;
@end

@implementation OCXRelationship

- (OCXRelationship)initWithId:(unint64_t)a3 type:(id)a4 target:(id)a5 external:(BOOL)a6
{
  id v11 = a4;
  id v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)OCXRelationship;
  v13 = [(OCXRelationship *)&v20 init];
  if (v13)
  {
    v14 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:a3];
    id v15 = [NSString alloc];
    v16 = [v14 stringValue];
    uint64_t v17 = [v15 initWithFormat:@"rId%@", v16];
    mIdString = v13->mIdString;
    v13->mIdString = (NSString *)v17;

    objc_storeStrong((id *)&v13->mType, a4);
    objc_storeStrong((id *)&v13->mTarget, a5);
    v13->mExternal = a6;
  }
  return v13;
}

- (void)writeToStreamWriter:(id)a3
{
  id v4 = a3;
  [v4 startPlainElement:@"Relationship"];
  [v4 writePlainAttribute:@"Id" content:self->mIdString];
  [v4 writePlainAttribute:@"Type" content:self->mType];
  [v4 writePlainAttribute:@"Target" content:self->mTarget];
  if (self->mExternal) {
    [v4 writePlainAttribute:@"TargetMode" content:@"External"];
  }
  [v4 endElement];
}

- (NSString)idString
{
  return self->mIdString;
}

- (NSString)type
{
  return self->mType;
}

- (NSString)target
{
  return self->mTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTarget, 0);
  objc_storeStrong((id *)&self->mType, 0);
  objc_storeStrong((id *)&self->mIdString, 0);
}

@end