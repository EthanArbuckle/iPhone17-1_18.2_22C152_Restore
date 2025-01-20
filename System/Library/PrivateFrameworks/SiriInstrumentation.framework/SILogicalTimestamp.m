@interface SILogicalTimestamp
- (BOOL)isEqual:(id)a3;
- (NSUUID)clockIdentifier;
- (SILogicalTimestamp)initWithClockIdentifier:(id)a3 nanosecondsSinceBoot:(unint64_t)a4;
- (SILogicalTimestamp)initWithInternalType:(id)a3;
- (id)underlying;
- (unint64_t)nanoSecondsSinceBoot;
@end

@implementation SILogicalTimestamp

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SILogicalTimestampInternal *)a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  if (isKindOfClass) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = *(SILogicalTimestampInternal **)v4->_anon_0;
LABEL_5:
    BOOL v7 = self->_underlying == v6;
    goto LABEL_6;
  }
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

- (NSUUID)clockIdentifier
{
  return [(SILogicalTimestampInternal *)self->_underlying clockIdentifier];
}

- (unint64_t)nanoSecondsSinceBoot
{
  return [(SILogicalTimestampInternal *)self->_underlying nanosecondsSinceBoot];
}

- (id)underlying
{
  return self->_underlying;
}

- (SILogicalTimestamp)initWithInternalType:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SILogicalTimestamp;
  v6 = [(SILogicalTimestamp *)&v9 init];
  BOOL v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlying, a3);
  }

  return v7;
}

- (SILogicalTimestamp)initWithClockIdentifier:(id)a3 nanosecondsSinceBoot:(unint64_t)a4
{
  id v6 = a3;
  BOOL v7 = [[SILogicalTimestampInternal alloc] initWithClockIdentifier:v6 nanosecondsSinceBoot:a4];

  v8 = [(SILogicalTimestamp *)self initWithInternalType:v7];
  return v8;
}

@end