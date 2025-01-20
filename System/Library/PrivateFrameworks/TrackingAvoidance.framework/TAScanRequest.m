@interface TAScanRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldScanOnAdvertisement:(id)a3 withDeviceRecord:(id)a4;
- (NSDate)lastScanRequestedDate;
- (NSDate)scheduledScanRequest;
- (TAScanRequest)initWithCoder:(id)a3;
- (TAScanRequest)initWithSettings:(id)a3;
- (TAScanRequestSettings)settings;
- (id)evaluateInterVisitAfterVisitExit:(id)a3 displayEvents:(id)a4 advertisements:(id)a5 deviceRecord:(id)a6 clock:(id)a7;
- (id)evaluateVisitEntry:(id)a3 clock:(id)a4;
- (id)evictScheduledInterVisitScanWithClock:(id)a3;
- (unint64_t)interVisitScanCount;
- (void)encodeWithCoder:(id)a3;
- (void)scheduleInterVisitScanForAdvertisement:(id)a3 deviceRecord:(id)a4 clock:(id)a5;
- (void)setInterVisitScanCount:(unint64_t)a3;
- (void)setLastScanRequestedDate:(id)a3;
@end

@implementation TAScanRequest

- (id)evictScheduledInterVisitScanWithClock:(id)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  scheduledScanRequest = self->_scheduledScanRequest;
  if (!scheduledScanRequest || [(NSDate *)scheduledScanRequest compare:v4] == NSOrderedDescending) {
    goto LABEL_8;
  }
  if (self->_lastScanRequestedDate)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:");
    double v7 = v6;
    [(TAScanRequestSettings *)self->_settings interVisitScanDelay];
    if (v7 <= v8)
    {
      v15 = self->_scheduledScanRequest;
      self->_scheduledScanRequest = 0;

LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
  }
  unint64_t interVisitScanCount = self->_interVisitScanCount;
  unint64_t v10 = [(TAScanRequestSettings *)self->_settings maxInterVisitScanRequests];
  v11 = self->_scheduledScanRequest;
  self->_scheduledScanRequest = 0;

  v12 = 0;
  if (interVisitScanCount < v10)
  {
    ++self->_interVisitScanCount;
    v13 = [TAOutgoingRequests alloc];
    v17 = @"ScanRequestReason";
    v18[0] = @"InterVisitScheduled";
    v14 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
    v12 = [(TAOutgoingRequests *)v13 initWithRequestKey:@"RequestingAdditionalScans" additionalInformation:v14 date:v4];
  }
LABEL_9:

  return v12;
}

- (TAScanRequest)initWithSettings:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TAScanRequest;
  double v6 = [(TAScanRequest *)&v11 init];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_settings, a3);
    lastScanRequestedDate = v7->_lastScanRequestedDate;
    v7->_lastScanRequestedDate = 0;

    v7->_unint64_t interVisitScanCount = 0;
    scheduledScanRequest = v7->_scheduledScanRequest;
    v7->_scheduledScanRequest = 0;
  }
  return v7;
}

- (id)evaluateVisitEntry:(id)a3 clock:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  self->_unint64_t interVisitScanCount = 0;
  scheduledScanRequest = self->_scheduledScanRequest;
  self->_scheduledScanRequest = 0;

  v9 = 0;
  if (([v6 isClosed] & 1) == 0)
  {
    [v6 getDisplayOnTimeUntilEndDate:v7];
    double v11 = v10;
    [(TAScanRequestSettings *)self->_settings minVisitEntryDisplayOnDuration];
    if (v11 >= v12) {
      goto LABEL_5;
    }
    lastScanRequestedDate = self->_lastScanRequestedDate;
    if (!lastScanRequestedDate
      || ([v6 representativeVisit],
          v14 = objc_claimAutoreleasedReturnValue(),
          [v14 arrivalDate],
          v15 = objc_claimAutoreleasedReturnValue(),
          uint64_t v16 = [(NSDate *)lastScanRequestedDate compare:v15],
          v15,
          v14,
          v16 == -1))
    {
      v17 = [TAOutgoingRequests alloc];
      v20 = @"ScanRequestReason";
      v21[0] = @"VisitEntry";
      v18 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
      v9 = [(TAOutgoingRequests *)v17 initWithRequestKey:@"RequestingAdditionalScans" additionalInformation:v18 date:v7];
    }
    else
    {
LABEL_5:
      v9 = 0;
    }
  }

  return v9;
}

- (id)evaluateInterVisitAfterVisitExit:(id)a3 displayEvents:(id)a4 advertisements:(id)a5 deviceRecord:(id)a6 clock:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  self->_unint64_t interVisitScanCount = 0;
  scheduledScanRequest = self->_scheduledScanRequest;
  self->_scheduledScanRequest = 0;

  if ([v12 isClosed])
  {
    v18 = [TADisplayOnCalculator alloc];
    v19 = [v12 representativeVisit];
    v20 = [v19 departureDate];
    v21 = [(TADisplayOnCalculator *)v18 initWithStartTime:v20];

    [(TADisplayOnCalculator *)v21 calculateDisplayOnWithEvents:v13 advertisements:v14 endDate:v16];
    double v23 = v22;
    [(TAScanRequestSettings *)self->_settings minInterVisitDisplayOnDuration];
    if (v23 >= v24)
    {
      if (![v14 count])
      {
        v27 = 0;
LABEL_22:

        goto LABEL_23;
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v26 = v14;
      uint64_t v29 = [v26 countByEnumeratingWithState:&v37 objects:v43 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        v35 = v21;
        id v36 = v13;
        uint64_t v31 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v38 != v31) {
              objc_enumerationMutation(v26);
            }
            uint64_t v33 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            if (-[TAScanRequest shouldScanOnAdvertisement:withDeviceRecord:](self, "shouldScanOnAdvertisement:withDeviceRecord:", v33, v15, v35, v36, (void)v37))
            {
              [(TAScanRequest *)self scheduleInterVisitScanForAdvertisement:v33 deviceRecord:v15 clock:v16];
              goto LABEL_18;
            }
          }
          uint64_t v30 = [v26 countByEnumeratingWithState:&v37 objects:v43 count:16];
          if (v30) {
            continue;
          }
          break;
        }
LABEL_18:
        v27 = 0;
        v21 = v35;
        id v13 = v36;
      }
      else
      {
        v27 = 0;
      }
    }
    else
    {
      ++self->_interVisitScanCount;
      v25 = [TAOutgoingRequests alloc];
      v41 = @"ScanRequestReason";
      v42 = @"InterVisitImmediate";
      id v26 = [NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      v27 = [(TAOutgoingRequests *)v25 initWithRequestKey:@"RequestingAdditionalScans" additionalInformation:v26 date:v16];
    }

    goto LABEL_22;
  }
  v28 = TAStatusLog;
  if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR)) {
    -[TAScanRequest evaluateInterVisitAfterVisitExit:displayEvents:advertisements:deviceRecord:clock:](v28);
  }
  v27 = 0;
LABEL_23:

  return v27;
}

- (void)scheduleInterVisitScanForAdvertisement:(id)a3 deviceRecord:(id)a4 clock:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  unint64_t interVisitScanCount = self->_interVisitScanCount;
  if (interVisitScanCount < [(TAScanRequestSettings *)self->_settings maxInterVisitScanRequests]&& v12&& !self->_scheduledScanRequest&& [(TAScanRequest *)self shouldScanOnAdvertisement:v12 withDeviceRecord:v7])
  {
    v9 = [v12 scanDate];
    [(TAScanRequestSettings *)self->_settings interVisitScanDelay];
    objc_msgSend(v9, "dateByAddingTimeInterval:");
    double v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
    scheduledScanRequest = self->_scheduledScanRequest;
    self->_scheduledScanRequest = v10;
  }
}

- (BOOL)shouldScanOnAdvertisement:(id)a3 withDeviceRecord:(id)a4
{
  id v5 = a4;
  id v6 = [a3 address];
  char v7 = [v5 isKnownDevice:v6];

  return v7 ^ 1;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = (TAScanRequest *)a3;
  if (self == v6)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v7 = v6;
      double v8 = [(TAScanRequest *)self lastScanRequestedDate];
      v9 = [(TAScanRequest *)v7 lastScanRequestedDate];
      if (v8 != v9)
      {
        v3 = [(TAScanRequest *)self lastScanRequestedDate];
        id v4 = [(TAScanRequest *)v7 lastScanRequestedDate];
        if (![v3 isEqual:v4])
        {
          char v10 = 0;
          goto LABEL_22;
        }
      }
      unint64_t v11 = [(TAScanRequest *)self interVisitScanCount];
      if (v11 != [(TAScanRequest *)v7 interVisitScanCount])
      {
        char v10 = 0;
        goto LABEL_21;
      }
      id v12 = [(TAScanRequest *)self settings];
      uint64_t v13 = [(TAScanRequest *)v7 settings];
      id v14 = (void *)v13;
      if (v12 == (void *)v13)
      {
        id v26 = (void *)v13;
      }
      else
      {
        id v15 = [(TAScanRequest *)self settings];
        v27 = [(TAScanRequest *)v7 settings];
        if (!objc_msgSend(v15, "isEqual:"))
        {
          char v10 = 0;
LABEL_19:

LABEL_20:
LABEL_21:
          if (v8 == v9)
          {
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:

          goto LABEL_23;
        }
        v25 = v15;
        id v26 = v14;
      }
      id v16 = [(TAScanRequest *)self scheduledScanRequest];
      uint64_t v17 = [(TAScanRequest *)v7 scheduledScanRequest];
      if (v16 == (void *)v17)
      {

        char v10 = 1;
      }
      else
      {
        v18 = (void *)v17;
        [(TAScanRequest *)self scheduledScanRequest];
        v19 = double v24 = v3;
        [(TAScanRequest *)v7 scheduledScanRequest];
        double v23 = v12;
        v21 = v20 = v4;
        char v10 = [v19 isEqual:v21];

        id v4 = v20;
        id v12 = v23;

        v3 = v24;
      }
      id v15 = v25;
      id v14 = v26;
      if (v12 == v26) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    char v10 = 0;
  }
LABEL_24:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAScanRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TAScanRequest;
  id v5 = [(TAScanRequest *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Settings"];
    settings = v5->_settings;
    v5->_settings = (TAScanRequestSettings *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"LastScan"];
    lastScanRequestedDate = v5->_lastScanRequestedDate;
    v5->_lastScanRequestedDate = (NSDate *)v8;

    v5->_unint64_t interVisitScanCount = [v4 decodeIntegerForKey:@"InterScanCount"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ScanSchedule"];
    scheduledScanRequest = v5->_scheduledScanRequest;
    v5->_scheduledScanRequest = (NSDate *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  settings = self->_settings;
  id v5 = a3;
  [v5 encodeObject:settings forKey:@"Settings"];
  [v5 encodeObject:self->_lastScanRequestedDate forKey:@"LastScan"];
  [v5 encodeInteger:self->_interVisitScanCount forKey:@"InterScanCount"];
  [v5 encodeObject:self->_scheduledScanRequest forKey:@"ScanSchedule"];
}

- (TAScanRequestSettings)settings
{
  return self->_settings;
}

- (NSDate)scheduledScanRequest
{
  return self->_scheduledScanRequest;
}

- (NSDate)lastScanRequestedDate
{
  return self->_lastScanRequestedDate;
}

- (void)setLastScanRequestedDate:(id)a3
{
}

- (unint64_t)interVisitScanCount
{
  return self->_interVisitScanCount;
}

- (void)setInterVisitScanCount:(unint64_t)a3
{
  self->_unint64_t interVisitScanCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastScanRequestedDate, 0);
  objc_storeStrong((id *)&self->_scheduledScanRequest, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)evaluateInterVisitAfterVisitExit:(os_log_t)log displayEvents:advertisements:deviceRecord:clock:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22345C000, log, OS_LOG_TYPE_ERROR, "#TAScanRequest called evaluateInterVisitAfterVisitExit with an open POI snapshot", v1, 2u);
}

@end