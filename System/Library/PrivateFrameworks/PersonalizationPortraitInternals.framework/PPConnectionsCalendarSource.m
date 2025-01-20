@interface PPConnectionsCalendarSource
+ (PPConnectionsCalendarSource)sharedInstance;
+ (id)locationLabelFromEvent:(id)a3;
+ (id)locationNameFromEvent:(id)a3;
+ (id)locationValueFromEvent:(id)a3;
- (BOOL)isCalendarEventEligibleForLocationPrediction:(id)a3;
- (PPConnectionsCalendarSource)init;
- (id)ekEventWithExternalID:(id)a3;
- (id)identifier;
- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8;
@end

@implementation PPConnectionsCalendarSource

- (id)identifier
{
  return @"calendar";
}

- (id)locationItemsWithCriteria:(id)a3 earliest:(id)a4 latest:(id)a5 limit:(unint64_t)a6 consumer:(unint64_t)a7 explanationSet:(id)a8
{
  char v9 = a7;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a8;
  if ((v9 & 6) != 0 || [a3 locationField] == 10)
  {
    v14 = 0;
  }
  else
  {
    [v12 timeIntervalSinceNow];
    double v17 = v16;
    v18 = objc_opt_new();
    v19 = v18;
    if (self)
    {
      localEventStore = self->_localEventStore;
      id v21 = v18;
      v22 = [v21 dateByAddingTimeInterval:v17];
      v23 = [(PPLocalEventStore *)localEventStore eventsFromDate:v21 toDate:v22];
    }
    else
    {
      v23 = 0;
    }

    if ([v23 count])
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v24 = v23;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        char v27 = 0;
        uint64_t v28 = *(void *)v42;
LABEL_12:
        uint64_t v29 = 0;
        while (1)
        {
          if (*(void *)v42 != v28) {
            objc_enumerationMutation(v24);
          }
          uint64_t v30 = *(void *)(*((void *)&v41 + 1) + 8 * v29);
          if (-[PPConnectionsCalendarSource isCalendarEventEligibleForLocationPrediction:](self, "isCalendarEventEligibleForLocationPrediction:", v30, (void)v41))
          {
            break;
          }
          ++v29;
          char v27 = 1;
          if (v26 == v29)
          {
            uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v46 count:16];
            if (v26) {
              goto LABEL_12;
            }

LABEL_25:
            v39 = v13;
            uint64_t v40 = 30;
            goto LABEL_22;
          }
        }
        v31 = [(id)objc_opt_class() locationLabelFromEvent:v30];
        v32 = [(id)objc_opt_class() locationValueFromEvent:v30];
        id v33 = objc_alloc(MEMORY[0x1E4F89DC0]);
        v34 = (void *)[v33 initWithOriginatingBundleID:*MEMORY[0x1E4F8A040]];
        v35 = [(id)objc_opt_class() locationNameFromEvent:v30];
        [v34 setName:v35];

        [v34 setLabel:v31];
        [v34 setValue:v32];
        [v34 setShortValue:v32];
        [v34 setSource:@"calendar"];
        v36 = NSNumber;
        v37 = +[PPConnectionsParameters sharedInstance];
        [v37 calendarEventLocationExpirySeconds];
        v38 = objc_msgSend(v36, "numberWithDouble:");
        [v34 setLifetime:v38];

        if (v34)
        {
          v45 = v34;
          v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];

          goto LABEL_27;
        }
        if (v27) {
          goto LABEL_25;
        }
      }
      else
      {
      }
    }
    else
    {
      v39 = v13;
      uint64_t v40 = 29;
LABEL_22:
      [v39 push:v40];
    }
    v14 = 0;
LABEL_27:
  }
  return v14;
}

- (void).cxx_destruct
{
}

- (BOOL)isCalendarEventEligibleForLocationPrediction:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && ([v3 eventFlags] & 4) != 0)
  {
    v6 = [v4 structuredLocationAddress];
    BOOL v5 = v6 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)ekEventWithExternalID:(id)a3
{
  return [(PPLocalEventStore *)self->_localEventStore eventWithExternalID:a3];
}

- (PPConnectionsCalendarSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPConnectionsCalendarSource;
  v2 = [(PPConnectionsCalendarSource *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[PPLocalEventStore defaultStore];
    localEventStore = v2->_localEventStore;
    v2->_localEventStore = (PPLocalEventStore *)v3;
  }
  return v2;
}

+ (id)locationValueFromEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 structuredLocationAddress];
  if (v4)
  {
    BOOL v5 = [v3 structuredLocationAddress];
    objc_super v6 = [v5 stringByReplacingOccurrencesOfString:@", ", @" " withString];
    v7 = PPCollapseWhitespaceAndStrip();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)locationLabelFromEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 structuredLocationTitle];
  if (v4)
  {
    BOOL v5 = PPCollapseWhitespaceAndStrip();
  }
  else
  {
    objc_super v6 = [v3 title];
    BOOL v5 = PPCollapseWhitespaceAndStrip();
  }
  return v5;
}

+ (id)locationNameFromEvent:(id)a3
{
  id v3 = a3;
  v4 = [v3 structuredLocationTitle];
  if (v4)
  {
    BOOL v5 = PPCollapseWhitespaceAndStrip();
  }
  else
  {
    objc_super v6 = [v3 title];
    BOOL v5 = PPCollapseWhitespaceAndStrip();
  }
  return v5;
}

+ (PPConnectionsCalendarSource)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_16242);
  }
  v2 = (void *)sharedInstance_shared;
  return (PPConnectionsCalendarSource *)v2;
}

uint64_t __45__PPConnectionsCalendarSource_sharedInstance__block_invoke()
{
  sharedInstance_shared = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

@end