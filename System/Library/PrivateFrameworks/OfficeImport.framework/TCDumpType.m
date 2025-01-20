@interface TCDumpType
- (TCDumpType)init;
- (TCDumpType)initWithName:(id)a3;
- (id)name;
- (void)setName:(id)a3;
@end

@implementation TCDumpType

- (TCDumpType)init
{
  return [(TCDumpType *)self initWithName:0];
}

- (TCDumpType)initWithName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCDumpType;
  v6 = [(TCDumpType *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->mName, a3);
  }

  return v7;
}

- (id)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end