@interface STReactorCore
+ (id)_intervalForSchedulingNextBackgroundActivityForDowntimeBiomeDonation:(id)a3 configurations:(id)a4;
+ (id)reactorDirectiveForAskForTimeRequestEvent:(id)a3;
+ (id)reactorDirectiveForAskForTimeResponseEvent:(id)a3;
+ (id)reactorDirectiveForBackgroundActivityOfType:(int64_t)a3;
+ (id)reactorDirectiveForBackgroundActivityResult:(id)a3 activityType:(int64_t)a4 downtimeConfigurationsByUserID:(id)a5;
+ (id)reactorDirectiveForConfigurationChange:(id)a3 targetableFamilyMembers:(id)a4 signedInUserHasMultipleDevices:(BOOL)a5;
+ (id)reactorDirectiveForDeviceStateChange:(id)a3 targetableFamilyMembers:(id)a4 signedInUserHasMultipleDevices:(BOOL)a5;
+ (id)reactorDirectiveForInitialSetupWithTargetableFamilyMembers:(id)a3;
+ (id)reactorDirectiveForMessageTransportMessage:(id)a3 targetableFamilyMembers:(id)a4 communicationConfigurationByUserID:(id)a5 screenTimeCapabilities:(id)a6;
+ (id)reactorDirectiveForReconcilingWithTargetableFamilyMembers:(id)a3 familyMemberGenesisStateItems:(id)a4 localDeviceID:(id)a5 signedInUserHasMultipleDevices:(BOOL)a6;
+ (id)reactorDirectiveForSchedulingNextBackgroundActivityForDowntimeBiomeDonation:(id)a3 configurations:(id)a4;
+ (id)reactorDirectiveForSendingResponseForResult:(id)a3 downtimeConfigurationsByUserID:(id)a4;
+ (id)reactorDirectiveForSentMessageResult:(id)a3;
+ (id)reactorDirectiveForSuccessfulConfigurationWriteResult:(id)a3 configurations:(id)a4;
+ (id)reactorDirectiveForWritingEyeReliefStateChange:(id)a3 targetableFamilyMembers:(id)a4;
+ (id)reactorDirectiveForWritingUserSafetyPolicyChange:(id)a3 targetableFamilyMembers:(id)a4;
+ (id)userToRespondForGivenCheckingInUser:(id)a3 targetableFamilyMembers:(id)a4;
@end

@implementation STReactorCore

+ (id)reactorDirectiveForDeviceStateChange:(id)a3 targetableFamilyMembers:(id)a4 signedInUserHasMultipleDevices:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = +[NSPredicate predicateWithBlock:&stru_1002FDB20];
  v10 = [v8 filteredSetUsingPredicate:v9];
  v11 = [v10 anyObject];

  if (v11)
  {
    if (![v11 isParent])
    {
      v12 = objc_opt_new();
      v13 = [[STDeviceStateChangeContent alloc] initWithDeviceStateChange:v7];
      v14 = +[STSharedReactorCoreComponent buildAddressesFromTargetableFamilyMembers:v8 signedInUserHasMultipleDevices:v5];
      v15 = [[STMessageTransportMessage alloc] initWithIdentifier:v12 content:v13];
      v16 = [[STTransportEnvoyMessageEnvelope alloc] initWithMessage:v15 addresses:v14];
      v17 = [[STReactorDirective alloc] initWithType:2 data:v16];

      goto LABEL_8;
    }
  }
  else
  {
    v18 = +[STLog reactorCore];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_100264350(v18);
    }
  }
  v17 = [[STReactorDirective alloc] initWithType:0 data:0];
LABEL_8:

  return v17;
}

+ (id)reactorDirectiveForConfigurationChange:(id)a3 targetableFamilyMembers:(id)a4 signedInUserHasMultipleDevices:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_new();
  v10 = [[STOrganizationControllerConfigurationChangeContent alloc] initWithConfigurationChange:v8];
  v11 = [[STMessageTransportMessage alloc] initWithIdentifier:v9 content:v10];
  v12 = [v8 author];
  v13 = [v8 targetUser];

  v14 = +[STConfigurationReactorCoreComponent computeMessageAddressesWithAuthor:v12 targetUser:v13 targetableFamilyMembers:v7 signedInUserHasMultipleDevices:v5];

  if ([v14 count])
  {
    v15 = [[STTransportEnvoyMessageEnvelope alloc] initWithMessage:v11 addresses:v14];
    v16 = [[STReactorDirective alloc] initWithType:2 data:v15];
  }
  else
  {
    v16 = [[STReactorDirective alloc] initWithType:0 data:0];
  }

  return v16;
}

+ (id)reactorDirectiveForSendingResponseForResult:(id)a3 downtimeConfigurationsByUserID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 processedDirective];
  v9 = [[STReactorDirective alloc] initWithType:0 data:0];
  switch((unint64_t)[v8 type])
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
      v10 = +[STLog reactorCore];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v51 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No response needed for result: %{public}@", buf, 0xCu);
      }

      v4 = v9;
      goto LABEL_5;
    case 1uLL:
      goto LABEL_27;
    case 4uLL:
      v12 = [v6 output];
      id v13 = [v12 integerValue];
      if (v13 == (id)1)
      {
        v22 = +[STLog reactorCore];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v51 = v6;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Repair configuration response needed for result: %{public}@", buf, 0xCu);
        }

        v23 = [STReactorDirective alloc];
        v19 = [v6 processedDirective];
        v24 = [v19 data];
        v4 = [(STReactorDirective *)v23 initWithType:5 data:v24];
      }
      else
      {
        if (v13)
        {

LABEL_27:
          id v43 = v7;
          v25 = [v6 output];
          v26 = objc_opt_new();
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v27 = v25;
          id v28 = [v27 countByEnumeratingWithState:&v45 objects:v49 count:16];
          if (v28)
          {
            id v29 = v28;
            uint64_t v30 = *(void *)v46;
            do
            {
              for (i = 0; i != v29; i = (char *)i + 1)
              {
                if (*(void *)v46 != v30) {
                  objc_enumerationMutation(v27);
                }
                v32 = +[STReactorCore reactorDirectiveForSendingResponseForResult:*(void *)(*((void *)&v45 + 1) + 8 * i) downtimeConfigurationsByUserID:0];
                [v26 addObject:v32];
              }
              id v29 = [v27 countByEnumeratingWithState:&v45 objects:v49 count:16];
            }
            while (v29);
          }

          v33 = [STReactorDirective alloc];
          id v34 = [v26 copy];
          v4 = [(STReactorDirective *)v33 initWithType:1 data:v34];

          id v7 = v43;
          goto LABEL_5;
        }
        v14 = +[STLog reactorCore];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v51 = v6;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Check if additional directive is needed for successful configuration write result: %{public}@", buf, 0xCu);
        }

        v15 = [v6 processedDirective];
        v16 = [v15 data];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          v42 = +[NSAssertionHandler currentHandler];
          v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[STReactorCore reactorDirectiveForSendingResponseForResult:downtimeConfigurationsByUserID:]");
          v36 = (objc_class *)objc_opt_class();
          v37 = NSStringFromClass(v36);
          [v6 processedDirective];
          v38 = id v44 = v7;
          v39 = [v38 data];
          v40 = (objc_class *)objc_opt_class();
          v41 = NSStringFromClass(v40);
          [v42 handleFailureInFunction:v35, @"STReactorCore.m", 131, @"expected %@, got %@", v37, v41 file lineNumber description];

          id v7 = v44;
        }
        v18 = [v6 processedDirective];
        v19 = [v18 data];

        v4 = +[STReactorCore reactorDirectiveForSuccessfulConfigurationWriteResult:v19 configurations:v7];
      }

LABEL_25:
LABEL_5:

      return v4;
    case 0xAuLL:
      v12 = [v6 output];
      if (v12)
      {
        v20 = [[STReactorDirective alloc] initWithType:2 data:v12];
      }
      else
      {
        v21 = +[STLog reactorCore];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v51 = v6;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No response needed for result: %{public}@", buf, 0xCu);
        }

        v20 = v9;
      }
      v4 = v20;
      goto LABEL_25;
    default:
      goto LABEL_5;
  }
}

+ (id)reactorDirectiveForWritingEyeReliefStateChange:(id)a3 targetableFamilyMembers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 targetUser];
  id v8 = +[STConfigurationReactorCoreComponent targetableFamilyMemberForUser:v7 inTargetableFamilyMembers:v6];

  if ([v5 configurationType] == (id)1 && objc_msgSend(v8, "isSignedInMember"))
  {
    v9 = [v5 configuration];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"isEyeReliefEnabled"];
    if (v10)
    {
      v11 = (void *)v10;
      v12 = [[STReactorDirective alloc] initWithType:15 data:v10];

      goto LABEL_7;
    }
  }
  v12 = [[STReactorDirective alloc] initWithType:0 data:0];
LABEL_7:

  return v12;
}

+ (id)reactorDirectiveForWritingUserSafetyPolicyChange:(id)a3 targetableFamilyMembers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 targetUser];
  id v8 = +[STConfigurationReactorCoreComponent targetableFamilyMemberForUser:v7 inTargetableFamilyMembers:v6];

  if ([v5 configurationType] == (id)1 && objc_msgSend(v8, "isSignedInMember"))
  {
    v9 = [v5 configuration];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"isCommunicationSafetySendingRestricted"];
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v9 objectForKeyedSubscript:@"isCommunicationSafetyReceivingRestricted"];
    }
    id v13 = v12;

    if ([v13 BOOLValue])
    {
      v14 = +[STFamilyInformationCoreDataTransformerComponent familyMemberTypeForTargetableFamilyMember:v8];
      if ([v14 isEqualToString:STFamilyMemberTypeChild]) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = 2;
      }

      if (v13) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v15 = 0;
      if (v13)
      {
LABEL_11:
        v16 = [STReactorDirective alloc];
        v17 = +[NSNumber numberWithLongLong:v15];
        v18 = [(STReactorDirective *)v16 initWithType:16 data:v17];

        goto LABEL_15;
      }
    }
  }
  v18 = [[STReactorDirective alloc] initWithType:0 data:0];
LABEL_15:

  return v18;
}

+ (id)reactorDirectiveForMessageTransportMessage:(id)a3 targetableFamilyMembers:(id)a4 communicationConfigurationByUserID:(id)a5 screenTimeCapabilities:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v12 contentType];
  v14 = [v12 content];

  uint64_t v15 = +[STMessageReactorCoreComponent reactorDirectiveForMessageContentType:v13 messageContent:v14 targetableFamilyMembers:v11 communicationConfigurationByUserID:v10 screenTimeCapabilities:v9];

  return v15;
}

+ (id)reactorDirectiveForSentMessageResult:(id)a3
{
  v3 = (STReactorDirective *)[a3 type];
  if ((unint64_t)v3 <= 1) {
    v3 = [[STReactorDirective alloc] initWithType:0 data:0];
  }
  return v3;
}

+ (id)reactorDirectiveForBackgroundActivityOfType:(int64_t)a3
{
  v4 = +[STLog reactorCore];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 3) {
      CFStringRef v5 = &stru_10030A6D8;
    }
    else {
      CFStringRef v5 = off_1002FDB40[a3];
    }
    int v10 = 138543362;
    CFStringRef v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "creating directive for background activity: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [STReactorDirective alloc];
  id v7 = +[NSNumber numberWithInteger:a3];
  id v8 = [(STReactorDirective *)v6 initWithType:8 data:v7];

  return v8;
}

+ (id)reactorDirectiveForBackgroundActivityResult:(id)a3 activityType:(int64_t)a4 downtimeConfigurationsByUserID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[STLog reactorCore];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 > 3) {
      CFStringRef v10 = &stru_10030A6D8;
    }
    else {
      CFStringRef v10 = off_1002FDB40[a4];
    }
    int v17 = 138543362;
    CFStringRef v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "creating directive for background activity result from activity of type: %{public}@", (uint8_t *)&v17, 0xCu);
  }

  if (a4 == 3)
  {
    v14 = +[STReactorCore reactorDirectiveForSchedulingNextBackgroundActivityForDowntimeBiomeDonation:0 configurations:v8];
  }
  else
  {
    if (a4 == 2)
    {
      CFStringRef v11 = [v7 output];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v13 = [v7 output];
        [v13 integerValue];
      }
    }
    v14 = [[STReactorDirective alloc] initWithType:0 data:0];
  }
  uint64_t v15 = v14;

  return v15;
}

+ (id)userToRespondForGivenCheckingInUser:(id)a3 targetableFamilyMembers:(id)a4
{
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v11, "isSignedInMember", (void)v16)
          && ![v11 isParent])
        {
          id v13 = objc_alloc((Class)STUserID);
          v14 = [v11 dsid];
          id v12 = [v13 initWithDSID:v14];

          goto LABEL_12;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  id v12 = v5;
LABEL_12:

  return v12;
}

+ (id)reactorDirectiveForInitialSetupWithTargetableFamilyMembers:(id)a3
{
  id v3 = a3;
  v4 = [STMessageTransportMessage alloc];
  id v5 = objc_opt_new();
  id v6 = objc_opt_new();
  id v7 = [(STMessageTransportMessage *)v4 initWithIdentifier:v5 content:v6];

  id v8 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isSignedInMember", (void)v23) & 1) == 0)
        {
          uint64_t v15 = [STMessageTransportMessageAddress alloc];
          long long v16 = [v14 dsid];
          long long v17 = [(STMessageTransportMessageAddress *)v15 initWithUserDSID:v16];
          [v8 addObject:v17];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  long long v18 = [STTransportEnvoyMessageEnvelope alloc];
  id v19 = [v8 copy];
  v20 = [(STTransportEnvoyMessageEnvelope *)v18 initWithMessage:v7 addresses:v19];

  v21 = [[STReactorDirective alloc] initWithType:2 data:v20];
  return v21;
}

+ (id)reactorDirectiveForReconcilingWithTargetableFamilyMembers:(id)a3 familyMemberGenesisStateItems:(id)a4 localDeviceID:(id)a5 signedInUserHasMultipleDevices:(BOOL)a6
{
  BOOL v37 = a6;
  id v8 = a3;
  id v39 = a4;
  id v9 = a5;
  id v10 = objc_opt_new();
  if ([v8 count])
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v11 = v8;
    id v42 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v42)
    {
      id v36 = v9;
      uint64_t v40 = *(void *)v49;
      v41 = 0;
      id v38 = v11;
      do
      {
        for (i = 0; i != v42; i = (char *)i + 1)
        {
          if (*(void *)v49 != v40) {
            objc_enumerationMutation(v11);
          }
          id v13 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          id v14 = objc_alloc((Class)STUserID);
          uint64_t v15 = [v13 dsid];
          id v16 = [v14 initWithDSID:v15];

          if (![v13 isSignedInMember]
            || (id v17 = v16, v41, v41 = v17, v37))
          {
            id v43 = i;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v18 = v39;
            id v19 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
            if (v19)
            {
              id v20 = v19;
              uint64_t v21 = *(void *)v45;
              do
              {
                for (j = 0; j != v20; j = (char *)j + 1)
                {
                  if (*(void *)v45 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  long long v23 = *(void **)(*((void *)&v44 + 1) + 8 * (void)j);
                  if (![v23 genesisState])
                  {
                    long long v24 = [v23 userID];
                    unsigned int v25 = [v24 isEqualToUserID:v16];

                    if (v25)
                    {
                      long long v26 = [STMessageTransportMessageAddress alloc];
                      id v27 = [v13 dsid];
                      id v28 = [(STMessageTransportMessageAddress *)v26 initWithUserDSID:v27];

                      [v10 addObject:v28];
                    }
                  }
                }
                id v20 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
              }
              while (v20);
            }

            id v11 = v38;
            i = v43;
          }
        }
        id v42 = [v11 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v42);

      id v9 = v36;
      if (v41)
      {
        if ([v10 count])
        {
          id v29 = objc_opt_new();
          uint64_t v30 = [[STCheckinContent alloc] initWithUserID:v41 deviceID:v36];
          v31 = [[STMessageTransportMessage alloc] initWithIdentifier:v29 content:v30];
          v32 = [[STTransportEnvoyMessageEnvelope alloc] initWithMessage:v31 addresses:v10];
          v33 = [[STReactorDirective alloc] initWithType:2 data:v32];
        }
        else
        {
          v33 = [[STReactorDirective alloc] initWithType:0 data:0];
        }

        goto LABEL_33;
      }
    }
    else
    {
    }
    id v34 = +[STLog reactorCore];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      sub_100264394(v34);
    }
  }
  else
  {
    id v34 = +[STLog reactorCore];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "abort: no targetable family members", buf, 2u);
    }
  }

  v33 = [[STReactorDirective alloc] initWithType:0 data:0];
LABEL_33:

  return v33;
}

+ (id)reactorDirectiveForAskForTimeRequestEvent:(id)a3
{
  id v3 = a3;
  v4 = [[STReactorDirective alloc] initWithType:13 data:v3];

  return v4;
}

+ (id)reactorDirectiveForAskForTimeResponseEvent:(id)a3
{
  id v3 = a3;
  v4 = [[STReactorDirective alloc] initWithType:14 data:v3];

  return v4;
}

+ (id)reactorDirectiveForSuccessfulConfigurationWriteResult:(id)a3 configurations:(id)a4
{
  v4 = +[STReactorCore reactorDirectiveForSchedulingNextBackgroundActivityForDowntimeBiomeDonation:a3 configurations:a4];
  id v5 = +[STLog reactorCore];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Directive to run for successful remote change: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

+ (id)reactorDirectiveForSchedulingNextBackgroundActivityForDowntimeBiomeDonation:(id)a3 configurations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[STReactorDirective alloc] initWithType:0 data:0];
  if ((!v6 || [v6 configurationType] == (id)2) && v7)
  {
    id v9 = [a1 _intervalForSchedulingNextBackgroundActivityForDowntimeBiomeDonation:v6 configurations:v7];
    if (v9)
    {
      id v10 = +[STLog reactorCore];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        uint64_t v15 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Creating directive for next downtime biome donation to occur at interval %{public}@", (uint8_t *)&v14, 0xCu);
      }

      id v11 = [[STScheduleBackgroundActivityDirectiveData alloc] initWithType:3 interval:v9];
      uint64_t v12 = [[STReactorDirective alloc] initWithType:7 data:v11];
    }
    else
    {
      uint64_t v12 = v8;
    }
  }
  else
  {
    uint64_t v12 = v8;
  }

  return v12;
}

+ (id)_intervalForSchedulingNextBackgroundActivityForDowntimeBiomeDonation:(id)a3 configurations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = &off_10030FED8;
  }
  else
  {
    id v8 = +[NSDate distantFuture];
    [v8 timeIntervalSinceNow];
    id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v11)
    {
      id v12 = v11;
      id v28 = v6;
      id v29 = 0;
      char v13 = 0;
      uint64_t v14 = *(void *)v31;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v10);
          }
          id v16 = objc_msgSend(v10, "objectForKeyedSubscript:", *(void *)(*((void *)&v30 + 1) + 8 * i), v28, v29, (void)v30);
          uint64_t v17 = [v16 nextStateChangeDate];
          if (v17)
          {
            id v18 = (void *)v17;
            id v19 = +[NSCalendar autoupdatingCurrentCalendar];
            id v20 = STLocalDateFromUTCErasedDate();

            [v20 timeIntervalSinceNow];
            uint64_t v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
            if ((int)[v21 intValue] >= 1)
            {
              [v9 doubleValue];
              double v23 = v22;
              [v21 doubleValue];
              if (v23 < v24) {
                double v24 = v23;
              }
              uint64_t v25 = +[NSNumber numberWithDouble:v24];

              char v13 = 1;
              id v9 = (void *)v25;
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v12);

      if (v13) {
        long long v26 = v9;
      }
      else {
        long long v26 = 0;
      }
      id v6 = v28;
      id v5 = v29;
    }
    else
    {

      long long v26 = 0;
    }
    id v7 = v26;
  }
  return v7;
}

@end