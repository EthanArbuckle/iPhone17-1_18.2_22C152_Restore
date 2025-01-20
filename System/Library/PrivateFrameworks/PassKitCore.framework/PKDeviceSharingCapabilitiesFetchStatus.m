@interface PKDeviceSharingCapabilitiesFetchStatus
- (BOOL)allPossibleCapabilitiesFetched;
- (BOOL)deviceCountFetchInProgress;
- (BOOL)hasDeviceVersionWithOSVersionRequirementRange:(id)a3;
- (NSArray)fetchedCapabilities;
- (NSDate)fetchStartDate;
- (NSError)fetchError;
- (NSString)appleID;
- (PKDeviceSharingCapabilitiesFetchStatus)initWithAppleID:(id)a3 fetchStartDate:(id)a4;
- (id)description;
- (int64_t)maximumPossibleDevices;
- (int64_t)secondsPassedSinceFetchStart;
- (void)addDeviceSharingCapabilities:(id)a3;
- (void)setDeviceCountFetchInProgress:(BOOL)a3;
- (void)setFetchError:(id)a3;
- (void)setMaximumPossibleDevices:(int64_t)a3;
@end

@implementation PKDeviceSharingCapabilitiesFetchStatus

- (PKDeviceSharingCapabilitiesFetchStatus)initWithAppleID:(id)a3 fetchStartDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKDeviceSharingCapabilitiesFetchStatus;
  v9 = [(PKDeviceSharingCapabilitiesFetchStatus *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleID, a3);
    objc_storeStrong((id *)&v10->_fetchStartDate, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    fetchedCapabilities = v10->_fetchedCapabilities;
    v10->_fetchedCapabilities = v11;
  }
  return v10;
}

- (BOOL)hasDeviceVersionWithOSVersionRequirementRange:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v5 = self->_fetchedCapabilities;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (!v6) {
    goto LABEL_32;
  }
  uint64_t v8 = v6;
  uint64_t v9 = *(void *)v33;
  *(void *)&long long v7 = 138412546;
  long long v31 = v7;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v33 != v9) {
        objc_enumerationMutation(v5);
      }
      v11 = objc_msgSend(*(id *)(*((void *)&v32 + 1) + 8 * v10), "fromDeviceVersion", v31, (void)v32);
      v12 = [v11 watch];

      if (v12)
      {
        int v13 = [v4 versionMeetsRequirements:v11 deviceClass:@"Watch"];
        objc_super v14 = PKLogFacilityTypeGetObject(6uLL);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        appleID = self->_appleID;
        v16 = @"NO";
        if (v13) {
          v16 = @"YES";
        }
        *(_DWORD *)buf = v31;
        v37 = v16;
        __int16 v38 = 2112;
        v39 = appleID;
        v17 = v14;
        v18 = "Compared version requirements for watch. Meets requirements %@. For appleID: %@";
        goto LABEL_26;
      }
      v19 = [v11 ipad];

      if (v19)
      {
        int v13 = [v4 versionMeetsRequirements:v11 deviceClass:@"iPad"];
        objc_super v14 = PKLogFacilityTypeGetObject(6uLL);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        v20 = self->_appleID;
        v21 = @"NO";
        if (v13) {
          v21 = @"YES";
        }
        *(_DWORD *)buf = v31;
        v37 = v21;
        __int16 v38 = 2112;
        v39 = v20;
        v17 = v14;
        v18 = "Compared version requirements for ipad. Meets requirements %@. For appleID: %@";
        goto LABEL_26;
      }
      v22 = [v11 iphone];

      if (v22)
      {
        int v13 = [v4 versionMeetsRequirements:v11 deviceClass:@"iPhone"];
        objc_super v14 = PKLogFacilityTypeGetObject(6uLL);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_27;
        }
        v23 = self->_appleID;
        v24 = @"NO";
        if (v13) {
          v24 = @"YES";
        }
        *(_DWORD *)buf = v31;
        v37 = v24;
        __int16 v38 = 2112;
        v39 = v23;
        v17 = v14;
        v18 = "Compared version requirements for iphone. Meets requirements %@. For appleID: %@";
        goto LABEL_26;
      }
      v25 = [v11 vision];

      if (!v25)
      {

        goto LABEL_28;
      }
      int v13 = [v4 versionMeetsRequirements:v11 deviceClass:@"RealityDevice"];
      objc_super v14 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_appleID;
        v27 = @"NO";
        if (v13) {
          v27 = @"YES";
        }
        *(_DWORD *)buf = v31;
        v37 = v27;
        __int16 v38 = 2112;
        v39 = v26;
        v17 = v14;
        v18 = "Compared version requirements for vision. Meets requirements %@. For appleID: %@";
LABEL_26:
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
      }
LABEL_27:

      if (v13)
      {
        BOOL v29 = 1;
        goto LABEL_34;
      }
LABEL_28:
      ++v10;
    }
    while (v8 != v10);
    uint64_t v28 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v32 objects:v40 count:16];
    uint64_t v8 = v28;
  }
  while (v28);
LABEL_32:
  BOOL v29 = 0;
LABEL_34:

  return v29;
}

- (void)addDeviceSharingCapabilities:(id)a3
{
}

- (NSArray)fetchedCapabilities
{
  v2 = (void *)[(NSMutableArray *)self->_fetchedCapabilities copy];
  return (NSArray *)v2;
}

- (BOOL)allPossibleCapabilitiesFetched
{
  return [(NSMutableArray *)self->_fetchedCapabilities count] == self->_maximumPossibleDevices;
}

- (int64_t)secondsPassedSinceFetchStart
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSinceDate:self->_fetchStartDate];
  int64_t v5 = (uint64_t)v4;

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"maximumPossibleDevices: %ld; ", self->_maximumPossibleDevices);
  [v3 appendFormat:@"fetchStartDate: '%@'; ", self->_fetchStartDate];
  [v3 appendFormat:@"fetchError: '%@'; ", self->_fetchError];
  [v3 appendFormat:@"appleID: '%@'; ", self->_appleID];
  [v3 appendFormat:@"fetchedCapabilities: '%@'; ", self->_fetchedCapabilities];
  double v4 = (void *)[v3 copy];

  return v4;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (int64_t)maximumPossibleDevices
{
  return self->_maximumPossibleDevices;
}

- (void)setMaximumPossibleDevices:(int64_t)a3
{
  self->_maximumPossibleDevices = a3;
}

- (NSDate)fetchStartDate
{
  return self->_fetchStartDate;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
}

- (BOOL)deviceCountFetchInProgress
{
  return self->_deviceCountFetchInProgress;
}

- (void)setDeviceCountFetchInProgress:(BOOL)a3
{
  self->_deviceCountFetchInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_fetchStartDate, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_fetchedCapabilities, 0);
}

@end