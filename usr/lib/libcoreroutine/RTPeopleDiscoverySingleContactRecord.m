@interface RTPeopleDiscoverySingleContactRecord
+ (BOOL)supportsSecureCoding;
- (NSArray)interactionSessions;
- (NSDate)firstObservation;
- (NSDate)latestAdvertisementDate;
- (NSMutableDictionary)RSSIDistribution;
- (NSString)contactID;
- (RTPeopleDiscoverySingleContactRecord)init;
- (RTPeopleDiscoverySingleContactRecord)initWithCoder:(id)a3;
- (RTPeopleDiscoverySingleContactRecord)initWithContactID:(id)a3 withAdvertisement:(id)a4;
- (double)getTotalInteractionDuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionDictionary;
- (unint64_t)numAdvReceived;
- (void)closeInteractionSession:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)mergeWithAnotherSingleContactRecord:(id)a3;
- (void)setInteractionSessions:(id)a3;
- (void)updateRSSIDistribution:(int64_t)a3;
- (void)updateSingleContactRecordOnAdvReceived:(id)a3;
@end

@implementation RTPeopleDiscoverySingleContactRecord

- (RTPeopleDiscoverySingleContactRecord)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithContactID_withAdvertisement_);
}

- (RTPeopleDiscoverySingleContactRecord)initWithContactID:(id)a3 withAdvertisement:(id)a4
{
  v23[5] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)RTPeopleDiscoverySingleContactRecord;
  v9 = [(RTPeopleDiscoverySingleContactRecord *)&v21 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactID, a3);
    uint64_t v11 = [v8 scanDate];
    firstObservation = v10->_firstObservation;
    v10->_firstObservation = (NSDate *)v11;

    uint64_t v13 = [v8 scanDate];
    latestAdvertisementDate = v10->_latestAdvertisementDate;
    v10->_latestAdvertisementDate = (NSDate *)v13;

    v10->_numAdvReceived = 1;
    v22[0] = &unk_1F3450000;
    v22[1] = &unk_1F3450030;
    v23[0] = &unk_1F3450018;
    v23[1] = &unk_1F3450018;
    v22[2] = &unk_1F3450048;
    v22[3] = &unk_1F3450060;
    v23[2] = &unk_1F3450018;
    v23[3] = &unk_1F3450018;
    v22[4] = &unk_1F3450078;
    v23[4] = &unk_1F3450018;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:5];
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v15];
    RSSIDistribution = v10->_RSSIDistribution;
    v10->_RSSIDistribution = (NSMutableDictionary *)v16;

    -[RTPeopleDiscoverySingleContactRecord updateRSSIDistribution:](v10, "updateRSSIDistribution:", [v8 rssi]);
    v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    interactionSessions = v10->_interactionSessions;
    v10->_interactionSessions = v18;
  }
  return v10;
}

- (void)updateSingleContactRecordOnAdvReceived:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    latestAdvertisementDate = self->_latestAdvertisementDate;
    id v7 = [v4 scanDate];
    uint64_t v8 = [(NSDate *)latestAdvertisementDate compare:v7];

    if (v8 != 1)
    {
      v9 = [v5 scanDate];
      v10 = self->_latestAdvertisementDate;
      self->_latestAdvertisementDate = v9;

      -[RTPeopleDiscoverySingleContactRecord updateRSSIDistribution:](self, "updateRSSIDistribution:", [v5 rssi]);
    }
    ++self->_numAdvReceived;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: advertisement", v12, 2u);
    }
  }
}

- (void)closeInteractionSession:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      contactID = self->_contactID;
      int v15 = 138412290;
      uint64_t v16 = contactID;
      _os_log_debug_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEBUG, "Closing current interaction session for contact %@", (uint8_t *)&v15, 0xCu);
    }

    id v7 = objc_alloc(MEMORY[0x1E4F5CE58]);
    latestAdvertisementDate = self->_latestAdvertisementDate;
    p_latestAdvertisementDate = &self->_latestAdvertisementDate;
    v10 = [v7 initWithFirstObject:*(p_latestAdvertisementDate - 1) secondObject:latestAdvertisementDate];
    uint64_t v11 = (NSDate *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:p_latestAdvertisementDate[3]];
    [(NSDate *)v11 addObject:v10];
    v12 = p_latestAdvertisementDate[3];
    p_latestAdvertisementDate[3] = v11;
    uint64_t v13 = v11;

    objc_storeStrong((id *)p_latestAdvertisementDate - 1, a3);
    objc_storeStrong((id *)p_latestAdvertisementDate, a3);
  }
  else
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: nextSessionStartDate", (uint8_t *)&v15, 2u);
    }
  }
}

- (double)getTotalInteractionDuration
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = self->_interactionSessions;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 secondObject:v15];
        uint64_t v11 = [v9 firstObject];
        [v10 timeIntervalSinceDate:v11];
        double v7 = v7 + v12;
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
  }

  [(NSDate *)self->_latestAdvertisementDate timeIntervalSinceDate:self->_firstObservation];
  return v7 + v13;
}

- (void)updateRSSIDistribution:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = self->_RSSIDistribution;
  uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
      if (objc_msgSend(v10, "integerValue", (void)v15) < a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v11 = v10;

    if (!v11) {
      goto LABEL_12;
    }
    double v12 = [(NSMutableDictionary *)self->_RSSIDistribution objectForKeyedSubscript:v11];
    uint64_t v13 = [v12 integerValue] + 1;

    v14 = [NSNumber numberWithInteger:v13];
    [(NSMutableDictionary *)self->_RSSIDistribution setObject:v14 forKeyedSubscript:v11];
  }
  else
  {
LABEL_9:

LABEL_12:
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v20 = a3;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Update RSSI distribution failed, RSSI: %ld", buf, 0xCu);
    }
  }
}

- (void)mergeWithAnotherSingleContactRecord:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  contactID = self->_contactID;
  uint64_t v6 = [v4 contactID];

  if (contactID == v6)
  {
    self->_numAdvReceived += [v4 numAdvReceived];
    firstObservation = self->_firstObservation;
    uint64_t v8 = [v4 firstObservation];
    uint64_t v9 = [(NSDate *)firstObservation earlierDate:v8];
    v10 = self->_firstObservation;
    self->_firstObservation = v9;

    uint64_t v11 = [v4 latestAdvertisementDate];
    latestAdvertisementDate = self->_latestAdvertisementDate;
    if (v11)
    {
      uint64_t v13 = [v4 latestAdvertisementDate];
      v14 = [(NSDate *)latestAdvertisementDate laterDate:v13];
      long long v15 = self->_latestAdvertisementDate;
      self->_latestAdvertisementDate = v14;
    }
    else
    {
      long long v16 = latestAdvertisementDate;
      uint64_t v13 = self->_latestAdvertisementDate;
      self->_latestAdvertisementDate = v16;
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = [v4 RSSIDistribution];
    uint64_t v17 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v22 = [(NSMutableDictionary *)self->_RSSIDistribution objectForKeyedSubscript:v21];

          if (v22)
          {
            v23 = [(NSMutableDictionary *)self->_RSSIDistribution objectForKeyedSubscript:v21];
            uint64_t v24 = [v23 integerValue];
            [v4 RSSIDistribution];
            v26 = id v25 = v4;
            v27 = [v26 objectForKeyedSubscript:v21];
            uint64_t v28 = [v27 integerValue] + v24;

            id v4 = v25;
            v29 = [NSNumber numberWithInteger:v28];
            [(NSMutableDictionary *)self->_RSSIDistribution setObject:v29 forKeyedSubscript:v21];
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v18);
    }
  }
}

- (id)descriptionDictionary
{
  v12[4] = *MEMORY[0x1E4F143B8];
  contactID = self->_contactID;
  firstObservation = self->_firstObservation;
  v12[0] = contactID;
  v11[0] = @"ContactID";
  v11[1] = @"firstObservation";
  uint64_t v5 = [(NSDate *)firstObservation getFormattedDateString];
  v12[1] = v5;
  v11[2] = @"lastObservation";
  latestAdvertisementDate = self->_latestAdvertisementDate;
  if (latestAdvertisementDate)
  {
    uint64_t v7 = [(NSDate *)self->_latestAdvertisementDate getFormattedDateString];
  }
  else
  {
    uint64_t v7 = @"-";
  }
  v12[2] = v7;
  v11[3] = @"numOfObservations";
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:self->_numAdvReceived];
  v12[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];

  if (latestAdvertisementDate) {

  }
  return v9;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(RTPeopleDiscoverySingleContactRecord *)self descriptionDictionary];
  id v11 = 0;
  v3 = [MEMORY[0x1E4F28D90] JSONStringFromNSDictionary:v2 error:&v11];
  id v4 = v11;
  if (v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGathering);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);
    }
    id v6 = [NSString string];
  }
  else
  {
    id v6 = v3;
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = (void *)[(NSString *)self->_contactID copy];
  id v6 = (void *)[(NSDate *)self->_firstObservation copy];
  uint64_t v7 = (void *)[v4 initWithContactID:v5 withAdvertisement:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDiscoverySingleContactRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RTPeopleDiscoverySingleContactRecord;
  uint64_t v5 = [(RTPeopleDiscoverySingleContactRecord *)&v18 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ContactID"];
    contactID = v5->_contactID;
    v5->_contactID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstObservation"];
    firstObservation = v5->_firstObservation;
    v5->_firstObservation = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastObservation"];
    latestAdvertisementDate = v5->_latestAdvertisementDate;
    v5->_latestAdvertisementDate = (NSDate *)v10;

    v5->_numAdvReceived = [v4 decodeIntegerForKey:@"numOfObservations"];
    double v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    __int16 v14 = [v12 setWithObjects:v13, objc_opt_class(), 0];
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"RSSIDistribution"];
    RSSIDistribution = v5->_RSSIDistribution;
    v5->_RSSIDistribution = (NSMutableDictionary *)v15;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contactID = self->_contactID;
  id v5 = a3;
  [v5 encodeObject:contactID forKey:@"ContactID"];
  [v5 encodeObject:self->_firstObservation forKey:@"firstObservation"];
  [v5 encodeObject:self->_latestAdvertisementDate forKey:@"lastObservation"];
  [v5 encodeInteger:self->_numAdvReceived forKey:@"numOfObservations"];
  [v5 encodeObject:self->_RSSIDistribution forKey:@"RSSIDistribution"];
}

- (NSString)contactID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)firstObservation
{
  return self->_firstObservation;
}

- (NSDate)latestAdvertisementDate
{
  return self->_latestAdvertisementDate;
}

- (NSMutableDictionary)RSSIDistribution
{
  return self->_RSSIDistribution;
}

- (unint64_t)numAdvReceived
{
  return self->_numAdvReceived;
}

- (NSArray)interactionSessions
{
  return self->_interactionSessions;
}

- (void)setInteractionSessions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionSessions, 0);
  objc_storeStrong((id *)&self->_RSSIDistribution, 0);
  objc_storeStrong((id *)&self->_latestAdvertisementDate, 0);
  objc_storeStrong((id *)&self->_firstObservation, 0);

  objc_storeStrong((id *)&self->_contactID, 0);
}

@end