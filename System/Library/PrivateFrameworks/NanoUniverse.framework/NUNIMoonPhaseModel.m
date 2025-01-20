@interface NUNIMoonPhaseModel
- (CLLocation)location;
- (NSDate)entryDate;
- (NSDate)eventDate;
- (NSString)phaseName;
- (NUNIMoonPhaseModel)initWithDate:(id)a3 location:(id)a4;
- (int64_t)event;
- (int64_t)hemisphere;
- (unint64_t)phaseNumber;
@end

@implementation NUNIMoonPhaseModel

- (NUNIMoonPhaseModel)initWithDate:(id)a3 location:(id)a4
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)NUNIMoonPhaseModel;
  v9 = [(NUNIMoonPhaseModel *)&v43 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryDate, a3);
    objc_storeStrong((id *)&v10->_location, a4);
    location = v10->_location;
    if (!location)
    {
      v23 = NUNILoggingObjectForDomain(0);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E8AA000, v23, OS_LOG_TYPE_DEFAULT, "NTKMoonPhaseUtilities found no location", buf, 2u);
      }

      uint64_t v24 = NUNILocalizedString(@"MOONPHASE_UNKNOWN");
      phaseName = v10->_phaseName;
      v10->_phaseName = (NSString *)v24;

      v10->_phaseNumber = 0;
      v10->_hemisphere = -1;
      v10->_event = -1;
      eventDate = v10->_eventDate;
      v10->_eventDate = 0;
      goto LABEL_21;
    }
    [(CLLocation *)location coordinate];
    double v13 = v12;
    double v15 = v14;
    eventDate = objc_msgSend(objc_alloc(MEMORY[0x263F41738]), "initWithLocation:date:body:", v7, 4, v12, v14);
    NUNIMoonPhaseAngleFromEphemeris(eventDate);
    unint64_t v18 = vcvtmd_u64_f64((v17 + 180.0) / 360.0 * 112.0 + 0.5);
    v10->_phaseNumber = v18 - 112 * (((v18 >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64);
    v10->_hemisphere = v13 <= 0.0;
    v19 = [MEMORY[0x263EFFA18] systemTimeZone];
    uint64_t v20 = NUNIMoonPhaseDescription(v7, v19, v13, v15);
    v21 = v10->_phaseName;
    v10->_phaseName = (NSString *)v20;

    v22 = [eventDate rise];
    if ([v22 compare:v7] == -1)
    {
      v26 = [eventDate set];
      uint64_t v27 = [v26 compare:v7];

      if (v27 != -1) {
        goto LABEL_9;
      }
      v22 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v40 = objc_alloc(MEMORY[0x263F41738]);
      v41 = [v22 dateByAddingUnit:16 value:1 toDate:v7 options:0];
      uint64_t v42 = objc_msgSend(v40, "initWithLocation:date:body:", v41, 4, v13, v15);

      eventDate = (void *)v42;
    }

LABEL_9:
    v28 = (void *)MEMORY[0x263EFF980];
    v29 = [eventDate rise];
    v30 = [eventDate set];
    v31 = objc_msgSend(v28, "arrayWithObjects:", v7, v29, v30, 0);

    [v31 sortUsingSelector:sel_compare_];
    unint64_t v32 = [v31 indexOfObject:v7] + 1;
    v33 = NUNILoggingObjectForDomain(0);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      unint64_t v45 = v32;
      __int16 v46 = 2112;
      v47 = v31;
      _os_log_impl(&dword_21E8AA000, v33, OS_LOG_TYPE_DEFAULT, "NTKMoonPhaseUtilities index:%ld times:[%@]", buf, 0x16u);
    }

    if (v32 >= [v31 count])
    {
      v38 = NUNILoggingObjectForDomain(0);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E8AA000, v38, OS_LOG_TYPE_DEFAULT, "NTKMoonPhaseUtilities unknown event as we have old rise set times", buf, 2u);
      }

      id v7 = 0;
      v10->_event = -1;
    }
    else
    {
      v34 = [v31 objectAtIndexedSubscript:v32];

      v35 = [eventDate rise];
      int v36 = [v34 isEqualToDate:v35];

      uint64_t v37 = 2;
      if (v36) {
        uint64_t v37 = 0;
      }
      v10->_event = v37;
      if (v34)
      {
        CLKRoundDateDownToNearestMinute();
        id v7 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = 0;
      }
    }
    objc_storeStrong((id *)&v10->_eventDate, v7);

LABEL_21:
  }

  return v10;
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)phaseName
{
  return self->_phaseName;
}

- (unint64_t)phaseNumber
{
  return self->_phaseNumber;
}

- (int64_t)hemisphere
{
  return self->_hemisphere;
}

- (int64_t)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phaseName, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_eventDate, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);
}

@end