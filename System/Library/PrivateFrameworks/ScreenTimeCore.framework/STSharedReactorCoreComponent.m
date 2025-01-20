@interface STSharedReactorCoreComponent
+ (id)buildAddressesFromTargetableFamilyMembers:(id)a3 signedInUserHasMultipleDevices:(BOOL)a4;
+ (id)buildAddressesOfParentsFromTargetableFamilyMembers:(id)a3;
+ (id)targetableParentsInTargetableFamilyMembers:(id)a3;
@end

@implementation STSharedReactorCoreComponent

+ (id)targetableParentsInTargetableFamilyMembers:(id)a3
{
  id v3 = a3;
  v4 = +[NSPredicate predicateWithFormat:@"%K == YES", @"isParent"];
  v5 = [v3 filteredSetUsingPredicate:v4];

  return v5;
}

+ (id)buildAddressesFromTargetableFamilyMembers:(id)a3 signedInUserHasMultipleDevices:(BOOL)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (![v12 isSignedInMember] || a4)
        {
          v14 = [STMessageTransportMessageAddress alloc];
          v13 = [v12 dsid];
          v15 = [(STMessageTransportMessageAddress *)v14 initWithUserDSID:v13];
          [v6 addObject:v15];
        }
        else
        {
          v13 = +[STLog reactorCore];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v18 = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not including self-address as user only has one device", v18, 2u);
          }
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  id v16 = [v6 copy];
  return v16;
}

+ (id)buildAddressesOfParentsFromTargetableFamilyMembers:(id)a3
{
  id v3 = [a1 targetableParentsInTargetableFamilyMembers:a3];
  v4 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
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
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [STMessageTransportMessageAddress alloc];
        v12 = objc_msgSend(v10, "dsid", (void)v16);
        v13 = [(STMessageTransportMessageAddress *)v11 initWithUserDSID:v12];
        [v4 addObject:v13];
      }
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v14 = [v4 copy];
  return v14;
}

@end