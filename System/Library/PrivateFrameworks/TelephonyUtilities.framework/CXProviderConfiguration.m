@interface CXProviderConfiguration
- (NSArray)emergencyTUHandles;
- (NSArray)emergencyTULabeledHandles;
- (NSOrderedSet)prioritizedTUSenderIdentities;
- (NSSet)supportedTUHandleTypes;
@end

@implementation CXProviderConfiguration

- (NSSet)supportedTUHandleTypes
{
  v3 = [(CXProviderConfiguration *)self supportedHandleTypes];
  v4 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v3 count]);

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = [(CXProviderConfiguration *)self supportedHandleTypes];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) integerValue];
        if (v10 == (id)2) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = 1;
        }
        if (v10 == (id)3) {
          uint64_t v12 = 3;
        }
        else {
          uint64_t v12 = v11;
        }
        v13 = +[NSNumber numberWithInteger:v12];
        [v4 addObject:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v14 = [v4 copy];

  return (NSSet *)v14;
}

- (NSArray)emergencyTUHandles
{
  v3 = [(CXProviderConfiguration *)self emergencyHandles];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(CXProviderConfiguration *)self emergencyHandles];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "tuHandle", v16);
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          v13 = sub_100008DCC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Invalid TUHandle generated from CXLabelHandle %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  id v14 = [v4 copy];

  return (NSArray *)v14;
}

- (NSArray)emergencyTULabeledHandles
{
  v3 = [(CXProviderConfiguration *)self emergencyLabeledHandles];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(CXProviderConfiguration *)self emergencyLabeledHandles];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "tuLabeledHandle", v16);
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          v13 = sub_100008DCC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Invalid TULabeledHandle generated from CXLabelHandle %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  id v14 = [v4 copy];

  return (NSArray *)v14;
}

- (NSOrderedSet)prioritizedTUSenderIdentities
{
  v3 = [(CXProviderConfiguration *)self prioritizedSenderIdentities];
  v4 = +[NSMutableOrderedSet orderedSetWithCapacity:](NSMutableOrderedSet, "orderedSetWithCapacity:", [v3 count]);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [(CXProviderConfiguration *)self prioritizedSenderIdentities];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v18;
    *(void *)&long long v7 = 138412290;
    long long v16 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "tuSenderIdentity", v16);
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          v13 = sub_100008DCC();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v22 = v11;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Invalid TUSenderIdentity generated from CXSenderIdentity %@", buf, 0xCu);
          }
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  id v14 = [v4 copy];

  return (NSOrderedSet *)v14;
}

@end