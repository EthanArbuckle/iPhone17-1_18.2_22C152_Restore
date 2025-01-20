@interface SUCoreScanResults
- (SUCoreDescriptor)alternateDescriptor;
- (SUCoreDescriptor)preferredDescriptor;
- (SUCoreScanResults)initWithPreferredDescriptor:(id)a3 alternateDescriptor:(id)a4;
- (id)description;
- (id)latestUpdate;
- (void)setAlternateDescriptor:(id)a3;
- (void)setPreferredDescriptor:(id)a3;
@end

@implementation SUCoreScanResults

- (SUCoreScanResults)initWithPreferredDescriptor:(id)a3 alternateDescriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUCoreScanResults;
  v9 = [(SUCoreScanResults *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_preferredDescriptor, a3);
    objc_storeStrong((id *)&v10->_alternateDescriptor, a4);
  }

  return v10;
}

- (id)latestUpdate
{
  v3 = [(SUCoreScanResults *)self preferredDescriptor];
  if (v3
    || ([(SUCoreScanResults *)self alternateDescriptor],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        !v11))
  {
    uint64_t v4 = [(SUCoreScanResults *)self preferredDescriptor];
    if (v4)
    {
      v5 = (void *)v4;
      v6 = [(SUCoreScanResults *)self alternateDescriptor];

      if (v6)
      {
        id v7 = [(SUCoreScanResults *)self preferredDescriptor];
        id v8 = [v7 productBuildVersion];

        v9 = [(SUCoreScanResults *)self alternateDescriptor];
        v10 = [v9 productBuildVersion];

        if ([v8 compare:v10 options:64] == -1) {
          [(SUCoreScanResults *)self alternateDescriptor];
        }
        else {
        uint64_t v12 = [(SUCoreScanResults *)self preferredDescriptor];
        }

        v3 = (void *)v12;
      }
    }
  }
  else
  {
    v3 = [(SUCoreScanResults *)self alternateDescriptor];
  }
  return v3;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"\n            Preferred Descriptor: %@\n            Alternate Descriptor: %@\n", self->_preferredDescriptor, self->_alternateDescriptor];
}

- (SUCoreDescriptor)preferredDescriptor
{
  return self->_preferredDescriptor;
}

- (void)setPreferredDescriptor:(id)a3
{
}

- (SUCoreDescriptor)alternateDescriptor
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