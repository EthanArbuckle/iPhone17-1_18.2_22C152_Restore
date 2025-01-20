@interface STProcessFamilySettingsResult
- (NSDictionary)appAndWebsiteActivityStateTransitionsByDSID;
- (NSDictionary)contactManagementStateTransitionsByDSID;
- (NSDictionary)givenChildNamesByDSID;
- (NSDictionary)screenTimeManagementStateTransitionsByDSID;
- (NSDictionary)updatedSettingsByUserDSID;
- (STProcessFamilySettingsResult)initWithScreenTimeManagementStateTransitionsByDSID:(id)a3 appAndWebsiteActivityStateTransitionsByDSID:(id)a4 contactManagementStateTransitionsByDSID:(id)a5 givenChildNamesByDSID:(id)a6 updatedSettingsByUserDSID:(id)a7;
@end

@implementation STProcessFamilySettingsResult

- (STProcessFamilySettingsResult)initWithScreenTimeManagementStateTransitionsByDSID:(id)a3 appAndWebsiteActivityStateTransitionsByDSID:(id)a4 contactManagementStateTransitionsByDSID:(id)a5 givenChildNamesByDSID:(id)a6 updatedSettingsByUserDSID:(id)a7
{
  v28.receiver = self;
  v28.super_class = (Class)STProcessFamilySettingsResult;
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(STProcessFamilySettingsResult *)&v28 init];
  v17 = (NSDictionary *)objc_msgSend(v15, "copy", v28.receiver, v28.super_class);

  screenTimeManagementStateTransitionsByDSID = v16->_screenTimeManagementStateTransitionsByDSID;
  v16->_screenTimeManagementStateTransitionsByDSID = v17;

  v19 = (NSDictionary *)[v14 copy];
  appAndWebsiteActivityStateTransitionsByDSID = v16->_appAndWebsiteActivityStateTransitionsByDSID;
  v16->_appAndWebsiteActivityStateTransitionsByDSID = v19;

  v21 = (NSDictionary *)[v13 copy];
  contactManagementStateTransitionsByDSID = v16->_contactManagementStateTransitionsByDSID;
  v16->_contactManagementStateTransitionsByDSID = v21;

  v23 = (NSDictionary *)[v12 copy];
  givenChildNamesByDSID = v16->_givenChildNamesByDSID;
  v16->_givenChildNamesByDSID = v23;

  v25 = (NSDictionary *)[v11 copy];
  updatedSettingsByUserDSID = v16->_updatedSettingsByUserDSID;
  v16->_updatedSettingsByUserDSID = v25;

  return v16;
}

- (NSDictionary)screenTimeManagementStateTransitionsByDSID
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)appAndWebsiteActivityStateTransitionsByDSID
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)contactManagementStateTransitionsByDSID
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)givenChildNamesByDSID
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)updatedSettingsByUserDSID
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedSettingsByUserDSID, 0);
  objc_storeStrong((id *)&self->_givenChildNamesByDSID, 0);
  objc_storeStrong((id *)&self->_contactManagementStateTransitionsByDSID, 0);
  objc_storeStrong((id *)&self->_appAndWebsiteActivityStateTransitionsByDSID, 0);
  objc_storeStrong((id *)&self->_screenTimeManagementStateTransitionsByDSID, 0);
}

@end