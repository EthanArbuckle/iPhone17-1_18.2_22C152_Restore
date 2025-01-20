@interface RidesharingPartitionedAppSuggestions
- (RidesharingPartitionedAppSuggestions)initWithInstalledSuggestions:(id)a3 notInstalledSuggestions:(id)a4;
- (id)installedSuggestions;
- (id)notInstalledSuggestions;
@end

@implementation RidesharingPartitionedAppSuggestions

- (RidesharingPartitionedAppSuggestions)initWithInstalledSuggestions:(id)a3 notInstalledSuggestions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RidesharingPartitionedAppSuggestions;
  v8 = [(RidesharingPartitionedAppSuggestions *)&v14 init];
  if (v8)
  {
    v9 = (NSArray *)[v6 copy];
    installedSuggestions = v8->_installedSuggestions;
    v8->_installedSuggestions = v9;

    v11 = (NSArray *)[v7 copy];
    notInstalledSuggestions = v8->_notInstalledSuggestions;
    v8->_notInstalledSuggestions = v11;
  }
  return v8;
}

- (id)notInstalledSuggestions
{
  id v3 = [(NSArray *)self->_notInstalledSuggestions copy];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_installedSuggestions;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 iOSBundleIdentifier:(void)v14];
        int v11 = isExtensionHidden();

        if (v11)
        {
          uint64_t v12 = [v3 arrayByAddingObject:v9];

          id v3 = (id)v12;
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)installedSuggestions
{
  id v3 = objc_alloc_init((Class)NSArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_installedSuggestions;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 iOSBundleIdentifier:(void)v14];
        char v11 = isExtensionHidden();

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = [v3 arrayByAddingObject:v9];

          id v3 = (id)v12;
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notInstalledSuggestions, 0);

  objc_storeStrong((id *)&self->_installedSuggestions, 0);
}

@end