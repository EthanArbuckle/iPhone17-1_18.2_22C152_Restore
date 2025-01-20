@interface CSDChannelProviderManagerDataSource
- (BOOL)isProviderInstalled:(id)a3;
- (CSDChannelProviderManagerDataSource)init;
- (CSDChannelProviderManagerDataSourceDelegate)delegate;
- (NSDictionary)providerByIdentifier;
- (NSMutableDictionary)mutableProviderByIdentifier;
- (id)providerForIdentifier:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (void)dealloc;
- (void)notifyDelegateProviderByIdentifierChanged;
- (void)setDelegate:(id)a3;
- (void)setProvider:(id)a3 forIdentifier:(id)a4;
- (void)updateProviderByIdentifier;
@end

@implementation CSDChannelProviderManagerDataSource

- (CSDChannelProviderManagerDataSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSDChannelProviderManagerDataSource;
  v2 = [(CSDChannelProviderManagerDataSource *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mutableProviderByIdentifier = v3->_mutableProviderByIdentifier;
    v3->_mutableProviderByIdentifier = v4;
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];

  v4.receiver = self;
  v4.super_class = (Class)CSDChannelProviderManagerDataSource;
  [(CSDChannelProviderManagerDataSource *)&v4 dealloc];
}

- (NSDictionary)providerByIdentifier
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v4 = [(CSDChannelProviderManagerDataSource *)self mutableProviderByIdentifier];
  id v5 = [v4 copy];

  os_unfair_lock_unlock(p_accessorLock);

  return (NSDictionary *)v5;
}

- (id)providerForIdentifier:(id)a3
{
  id v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  v6 = [(CSDChannelProviderManagerDataSource *)self mutableProviderByIdentifier];
  objc_super v7 = [v6 objectForKeyedSubscript:v4];

  os_unfair_lock_unlock(p_accessorLock);

  return v7;
}

- (void)setProvider:(id)a3 forIdentifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_accessorLock);
  objc_super v7 = [(CSDChannelProviderManagerDataSource *)self mutableProviderByIdentifier];
  v8 = [v7 objectForKeyedSubscript:v6];

  if ((TUObjectsAreEqualOrNil() & 1) == 0)
  {
    v9 = [(CSDChannelProviderManagerDataSource *)self mutableProviderByIdentifier];
    [v9 setObject:v10 forKeyedSubscript:v6];

    [(CSDChannelProviderManagerDataSource *)self notifyDelegateProviderByIdentifierChanged];
  }

  os_unfair_lock_unlock(&self->_accessorLock);
}

- (BOOL)isProviderInstalled:(id)a3
{
  v3 = [a3 bundleURL];
  if (v3)
  {
    id v10 = 0;
    id v4 = [objc_alloc((Class)LSApplicationRecord) initWithURL:v3 allowPlaceholder:1 error:&v10];
    id v5 = v10;
    if (!v4)
    {
      id v6 = sub_100008DCC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1003A6AAC((uint64_t)v3, (uint64_t)v5, v6);
      }
    }
  }
  else
  {
    id v4 = 0;
  }
  objc_super v7 = [v4 applicationState];
  unsigned __int8 v8 = [v7 isInstalled];

  return v8;
}

- (void)notifyDelegateProviderByIdentifierChanged
{
  v3 = dispatch_get_global_queue(21, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018BB8;
  block[3] = &unk_100504EC0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)updateProviderByIdentifier
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id v4 = [(CSDChannelProviderManagerDataSource *)self mutableProviderByIdentifier];
  id v5 = [v4 allValues];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (!-[CSDChannelProviderManagerDataSource isProviderInstalled:](self, "isProviderInstalled:", v10, (void)v16))
        {
          v11 = [(CSDChannelProviderManagerDataSource *)self mutableProviderByIdentifier];
          v12 = [v10 identifier];
          [v11 setObject:0 forKeyedSubscript:v12];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v13 = [(CSDChannelProviderManagerDataSource *)self mutableProviderByIdentifier];
  v14 = [v13 allValues];
  unsigned __int8 v15 = [v6 isEqualToArray:v14];

  if ((v15 & 1) == 0) {
    [(CSDChannelProviderManagerDataSource *)self notifyDelegateProviderByIdentifierChanged];
  }

  os_unfair_lock_unlock(p_accessorLock);
}

- (CSDChannelProviderManagerDataSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSDChannelProviderManagerDataSourceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSMutableDictionary)mutableProviderByIdentifier
{
  return self->_mutableProviderByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableProviderByIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end