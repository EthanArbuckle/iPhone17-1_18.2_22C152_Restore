@interface SUScanResults
+ (BOOL)supportsSecureCoding;
- (SUDescriptor)alternateDescriptor;
- (SUDescriptor)preferredDescriptor;
- (SUScanResults)initWithCoder:(id)a3;
- (SUScanResults)initWithPreferredDescriptor:(id)a3 alternateDescriptor:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)latestUpdate;
- (void)encodeWithCoder:(id)a3;
- (void)setAlternateDescriptor:(id)a3;
- (void)setPreferredDescriptor:(id)a3;
@end

@implementation SUScanResults

- (SUScanResults)initWithPreferredDescriptor:(id)a3 alternateDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SUScanResults;
  v8 = [(SUScanResults *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(SUScanResults *)v8 setPreferredDescriptor:v6];
    [(SUScanResults *)v9 setAlternateDescriptor:v7];
  }

  return v9;
}

- (id)latestUpdate
{
  v3 = [(SUScanResults *)self preferredDescriptor];
  if (v3
    || ([(SUScanResults *)self alternateDescriptor],
        objc_super v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    uint64_t v4 = [(SUScanResults *)self preferredDescriptor];
    if (v4)
    {
      v5 = (void *)v4;
      id v6 = [(SUScanResults *)self alternateDescriptor];

      if (v6)
      {
        id v7 = [(SUScanResults *)self preferredDescriptor];
        v8 = [v7 productBuildVersion];

        v9 = [(SUScanResults *)self alternateDescriptor];
        v10 = [v9 productBuildVersion];

        if ([v8 compare:v10 options:64] == -1) {
          [(SUScanResults *)self alternateDescriptor];
        }
        else {
        uint64_t v12 = [(SUScanResults *)self preferredDescriptor];
        }

        v3 = (void *)v12;
      }
    }
  }
  else
  {
    v3 = [(SUScanResults *)self alternateDescriptor];
  }
  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"\n            Preferred Descriptor: %@\n            Alternate Descriptor: %@\n", self->_preferredDescriptor, self->_alternateDescriptor];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUScanResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUScanResults;
  v5 = [(SUScanResults *)&v9 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PreferredDescriptor"];
    [(SUScanResults *)v5 setPreferredDescriptor:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AlternateDescriptor"];
    [(SUScanResults *)v5 setAlternateDescriptor:v7];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SUScanResults *)self preferredDescriptor];
  [v4 encodeObject:v5 forKey:@"PreferredDescriptor"];

  id v6 = [(SUScanResults *)self alternateDescriptor];
  [v4 encodeObject:v6 forKey:@"AlternateDescriptor"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(SUScanResults);
  v5 = [(SUScanResults *)self preferredDescriptor];
  [(SUScanResults *)v4 setPreferredDescriptor:v5];

  id v6 = [(SUScanResults *)self alternateDescriptor];
  [(SUScanResults *)v4 setAlternateDescriptor:v6];

  return v4;
}

- (SUDescriptor)preferredDescriptor
{
  return self->_preferredDescriptor;
}

- (void)setPreferredDescriptor:(id)a3
{
}

- (SUDescriptor)alternateDescriptor
{
  return self->_alternateDescriptor;
}

- (void)setAlternateDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDescriptor, 0);
  objc_storeStrong((id *)&self->_preferredDescriptor, 0);
}

@end