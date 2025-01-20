@interface STConfigurationReactorCoreComponent
+ (id)computeMessageAddressesWithAuthor:(id)a3 targetUser:(id)a4 targetableFamilyMembers:(id)a5 signedInUserHasMultipleDevices:(BOOL)a6;
+ (id)targetableFamilyMemberForUser:(id)a3 inTargetableFamilyMembers:(id)a4;
@end

@implementation STConfigurationReactorCoreComponent

+ (id)computeMessageAddressesWithAuthor:(id)a3 targetUser:(id)a4 targetableFamilyMembers:(id)a5 signedInUserHasMultipleDevices:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[STConfigurationReactorCoreComponent targetableFamilyMemberForUser:v10 inTargetableFamilyMembers:v11];
  v13 = v12;
  if (v12)
  {
    if (![v12 isParent])
    {
      if ([v10 isEqualToUserID:v9])
      {
        v16 = +[STSharedReactorCoreComponent targetableParentsInTargetableFamilyMembers:v11];
        id v17 = [v16 mutableCopy];

        [v17 addObject:v13];
        id v18 = [v17 copy];
        v15 = +[STSharedReactorCoreComponent buildAddressesFromTargetableFamilyMembers:v18 signedInUserHasMultipleDevices:v6];
      }
      else
      {
        v19 = [STMessageTransportMessageAddress alloc];
        id v17 = [v10 dsid];
        v20 = [(STMessageTransportMessageAddress *)v19 initWithUserDSID:v17];
        v15 = +[NSSet setWithObject:v20];
      }
      goto LABEL_12;
    }
    v14 = +[STLog reactorCore];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10025D340(v14);
    }
  }
  else
  {
    v14 = +[STLog reactorCore];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10025D2FC(v14);
    }
  }

  v15 = objc_opt_new();
LABEL_12:

  return v15;
}

+ (id)targetableFamilyMemberForUser:(id)a3 inTargetableFamilyMembers:(id)a4
{
  id v5 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = objc_msgSend(v5, "dsid", (void)v15);
        v12 = [v10 dsid];
        unsigned __int8 v13 = [v11 isEqualToNumber:v12];

        if (v13)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

@end