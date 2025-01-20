@interface SIRINLURRGroupIdentifier
+ (BOOL)supportsSecureCoding;
- (NSString)groupId;
- (SIRINLURRGroupIdentifier)initWithCoder:(id)a3;
- (SIRINLURRGroupIdentifier)initWithGroupId:(id)a3 seq:(int)a4;
- (id)description;
- (int)seq;
- (void)encodeWithCoder:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setSeq:(int)a3;
@end

@implementation SIRINLURRGroupIdentifier

- (void).cxx_destruct
{
}

- (void)setSeq:(int)a3
{
  self->_seq = a3;
}

- (int)seq
{
  return self->_seq;
}

- (void)setGroupId:(id)a3
{
}

- (NSString)groupId
{
  return self->_groupId;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{RRGroupIdentifier\n  groupId: %@\n  seq: %d\n}", self->_groupId, self->_seq];
}

- (void)encodeWithCoder:(id)a3
{
  groupId = self->_groupId;
  id v5 = a3;
  [v5 encodeObject:groupId forKey:@"groupId"];
  id v6 = [NSNumber numberWithInt:self->_seq];
  [v5 encodeObject:v6 forKey:@"seq"];
}

- (SIRINLURRGroupIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SIRINLURRGroupIdentifier;
  id v5 = [(SIRINLURRGroupIdentifier *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupId"];
    groupId = v5->_groupId;
    v5->_groupId = (NSString *)v6;

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seq"];
    v5->_seq = [v8 intValue];
  }
  return v5;
}

- (SIRINLURRGroupIdentifier)initWithGroupId:(id)a3 seq:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SIRINLURRGroupIdentifier;
  v8 = [(SIRINLURRGroupIdentifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_groupId, a3);
    v9->_seq = a4;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end