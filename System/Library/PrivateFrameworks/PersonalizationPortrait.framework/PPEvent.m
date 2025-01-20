@interface PPEvent
+ (BOOL)supportsSecureCoding;
+ (id)convertBatchOfEKEvents:(id)a3 calendarInternPool:(id)a4;
+ (id)convertBatchOfEKEvents:(id)a3 calendarInternPool:(id)a4 interningSet:(id)a5;
+ (id)deferredAllocationEventFromEKEvent:(id)a3;
+ (id)descriptionForSuggestedEventCategory:(unsigned __int8)a3;
+ (unsigned)suggestedEventCategoryFromMetadata:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNLEvent;
- (BOOL)isStructuredEvent;
- (BOOL)organizerIsCurrentUser;
- (BOOL)representsUnscheduledFreeTime;
- (CLLocation)structuredLocationCoordinates;
- (EKObjectID)objectID;
- (NSArray)attendees;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)eventIdentifier;
- (NSString)location;
- (NSString)notes;
- (NSString)organizerName;
- (NSString)structuredLocationAddress;
- (NSString)structuredLocationTitle;
- (NSString)title;
- (NSURL)externalURI;
- (NSURL)url;
- (PPCalendar)calendar;
- (PPEvent)initWithCoder:(id)a3;
- (PPEvent)initWithEKEvent:(id)a3 calendarInternPool:(id)a4;
- (PPEvent)initWithEventIdentifier:(id)a3 objectID:(id)a4 title:(id)a5 location:(id)a6 calendar:(id)a7 startDate:(id)a8 endDate:(id)a9 availability:(char)a10 externalURI:(id)a11 attendees:(id)a12 organizerName:(id)a13 eventFlags:(unsigned __int8)a14 notes:(id)a15 url:(id)a16 structuredLocationTitle:(id)a17 structuredLocationAddress:(id)a18 structuredLocationCoordinates:(id)a19 suggestedEventCategory:(unsigned __int8)a20;
- (PPEvent)initWithEventIdentifier:(id)a3 objectID:(id)a4 title:(id)a5 location:(id)a6 calendar:(id)a7 startDate:(id)a8 endDate:(id)a9 availability:(char)a10 externalURIString:(id)a11 attendees:(id)a12 organizerName:(id)a13 eventFlags:(unsigned __int8)a14 notes:(id)a15 urlString:(id)a16 structuredLocationTitle:(id)a17 structuredLocationAddress:(id)a18 structuredLocationCoordinates:(id)a19 suggestedEventCategory:(unsigned __int8)a20;
- (PPEvent)initWithIndex:(unint64_t)a3 inBackingPlists:(id)a4 calendar:(id)a5;
- (PPEvent)initWithPlist:(id)a3 calendar:(id)a4;
- (char)availability;
- (id)description;
- (int64_t)compareStartDateWithEvent:(id)a3;
- (unint64_t)hash;
- (unsigned)eventFlags;
- (unsigned)suggestedEventCategory;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPEvent

+ (id)descriptionForSuggestedEventCategory:(unsigned __int8)a3
{
  if (a3 > 0xCu) {
    return 0;
  }
  else {
    return *(&off_1E550E1D8 + a3);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_backingPlists, 0);
}

- (PPCalendar)calendar
{
  return self->_calendar;
}

- (BOOL)isNLEvent
{
  return [(PPEvent *)self suggestedEventCategory] == 12;
}

- (BOOL)isStructuredEvent
{
  int v3 = [(PPEvent *)self suggestedEventCategory];
  if (v3) {
    LOBYTE(v3) = [(PPEvent *)self suggestedEventCategory] != 12;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v4 = (PPEvent *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        v7 = v6;
        if (self)
        {
          calendar = self->_calendar;
          v9 = (PPCalendar *)v6[3];
          if (calendar == v9)
          {
          }
          else
          {
            v10 = v9;
            v11 = calendar;
            BOOL v12 = [(PPCalendar *)v11 isEqual:v10];

            if (!v12) {
              goto LABEL_7;
            }
          }
          v14 = [(NSArray *)self->_backingPlists objectAtIndexedSubscript:self->_indexInBackingPlists];
          v15 = [v7[1] objectAtIndexedSubscript:v7[2]];
          uint64_t v16 = [v14 count];
          v17 = [v14 objectForKeyedSubscript:@"slc"];
          uint64_t v18 = v16 - (v17 != 0);
          uint64_t v19 = [v15 count];
          v20 = [v15 objectForKeyedSubscript:@"slc"];
          uint64_t v21 = v19 - (v20 != 0);

          if (v18 == v21)
          {
            long long v36 = 0u;
            long long v37 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            id v22 = v14;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              v32 = v14;
              v33 = v7;
              uint64_t v25 = *(void *)v35;
              while (2)
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v35 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = *(void **)(*((void *)&v34 + 1) + 8 * i);
                  if ((objc_msgSend(v27, "isEqual:", @"slc", v32, v33, (void)v34) & 1) == 0)
                  {
                    v28 = [v22 objectForKeyedSubscript:v27];
                    v29 = [v15 objectForKeyedSubscript:v27];
                    int v30 = [v28 isEqual:v29];

                    if (!v30)
                    {
                      BOOL v13 = 0;
                      goto LABEL_24;
                    }
                  }
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v38 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
              BOOL v13 = 1;
LABEL_24:
              v14 = v32;
              v7 = v33;
            }
            else
            {
              BOOL v13 = 1;
            }
          }
          else
          {
            BOOL v13 = 0;
          }

          goto LABEL_28;
        }
LABEL_7:
        BOOL v13 = 0;
LABEL_28:

        goto LABEL_29;
      }
    }
    BOOL v13 = 0;
  }
LABEL_29:

  return v13;
}

- (unint64_t)hash
{
  v2 = [(PPEvent *)self objectID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v21 = a3;
  v4 = [(PPEvent *)self eventIdentifier];
  [v21 encodeObject:v4 forKey:@"eid"];

  v5 = [(PPEvent *)self objectID];
  v6 = [v5 URIRepresentation];
  v7 = [v6 absoluteString];
  [v21 encodeObject:v7 forKey:@"oid"];

  v8 = [(PPEvent *)self title];
  [v21 encodeObject:v8 forKey:@"ttl"];

  v9 = [(PPEvent *)self location];
  [v21 encodeObject:v9 forKey:@"loc"];

  v10 = [(PPEvent *)self calendar];
  [v21 encodeObject:v10 forKey:@"cal"];

  v11 = [(PPEvent *)self startDate];
  [v21 encodeObject:v11 forKey:@"sdt"];

  BOOL v12 = [(PPEvent *)self endDate];
  [v21 encodeObject:v12 forKey:@"edt"];

  objc_msgSend(v21, "encodeInt32:forKey:", -[PPEvent availability](self, "availability"), @"avl");
  BOOL v13 = [(PPEvent *)self externalURI];
  [v21 encodeObject:v13 forKey:@"uri"];

  v14 = [(PPEvent *)self attendees];
  [v21 encodeObject:v14 forKey:@"atn"];

  v15 = [(PPEvent *)self organizerName];
  [v21 encodeObject:v15 forKey:@"onm"];

  objc_msgSend(v21, "encodeInt32:forKey:", -[PPEvent eventFlags](self, "eventFlags"), @"efl");
  uint64_t v16 = [(PPEvent *)self notes];
  [v21 encodeObject:v16 forKey:@"not"];

  v17 = [(PPEvent *)self url];
  [v21 encodeObject:v17 forKey:@"url"];

  uint64_t v18 = [(PPEvent *)self structuredLocationTitle];
  [v21 encodeObject:v18 forKey:@"slt"];

  uint64_t v19 = [(PPEvent *)self structuredLocationAddress];
  [v21 encodeObject:v19 forKey:@"sla"];

  v20 = [(PPEvent *)self structuredLocationCoordinates];
  [v21 encodeObject:v20 forKey:@"slc"];

  objc_msgSend(v21, "encodeInt32:forKey:", -[PPEvent suggestedEventCategory](self, "suggestedEventCategory"), @"sec");
}

- (PPEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v43 = [v4 decodeObjectOfClass:v5 forKey:@"eid"];
  v8 = [v4 decodeObjectOfClass:v5 forKey:@"oid"];
  if (v8)
  {
    id EKObjectIDClass = getEKObjectIDClass();
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v8];
    v11 = [EKObjectIDClass objectIDWithURL:v10];
  }
  else
  {
    v11 = 0;
  }

  BOOL v12 = [v4 decodeObjectOfClass:v5 forKey:@"ttl"];
  BOOL v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cal"];
  v14 = [v4 decodeObjectOfClass:v6 forKey:@"sdt"];
  v15 = [v4 decodeObjectOfClass:v6 forKey:@"edt"];
  uint64_t v16 = 0;
  if (v11 && v13 && v14 && v15)
  {
    v40 = v15;
    long long v37 = [v4 decodeObjectOfClass:v5 forKey:@"loc"];
    char v36 = [v4 decodeInt32ForKey:@"avl"];
    uint64_t v39 = [v4 decodeObjectOfClass:v7 forKey:@"uri"];
    v17 = (void *)MEMORY[0x192F97350]();
    v41 = v12;
    id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    v42 = v11;
    uint64_t v19 = objc_opt_class();
    long long v35 = objc_msgSend(v18, "initWithObjects:", v19, objc_opt_class(), 0);
    v32 = [v4 decodeObjectOfClasses:v35 forKey:@"atn"];
    long long v34 = [v4 decodeObjectOfClass:v5 forKey:@"onm"];
    char v33 = [v4 decodeInt32ForKey:@"efl"];
    v31 = [v4 decodeObjectOfClass:v5 forKey:@"not"];
    v20 = [v4 decodeObjectOfClass:v7 forKey:@"url"];
    [v4 decodeObjectOfClass:v5 forKey:@"slt"];
    v38 = v14;
    v22 = id v21 = v13;
    uint64_t v23 = [v4 decodeObjectOfClass:v5 forKey:@"sla"];
    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"slc"];
    LOBYTE(v30) = [v4 decodeInt32ForKey:@"sec"];
    LOBYTE(v29) = v33;
    LOBYTE(v28) = v36;
    uint64_t v25 = (void *)v43;
    v26 = objc_retain(-[PPEvent initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURI:attendees:organizerName:eventFlags:notes:url:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:](self, "initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURI:attendees:organizerName:eventFlags:notes:url:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:", v43, v42, v41, v37, v21, v38, v40, v28, v39, v32, v34, v29, v31, v20,
              v22,
              v23,
              v24,
              v30));

    BOOL v13 = v21;
    v14 = v38;

    BOOL v12 = v41;
    uint64_t v16 = v26;
    v11 = v42;

    v15 = v40;
    self = v16;
  }
  else
  {
    uint64_t v25 = (void *)v43;
  }

  return v16;
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = [(PPEvent *)self eventIdentifier];
  uint64_t v5 = [(PPEvent *)self title];
  uint64_t v6 = [(PPEvent *)self startDate];
  uint64_t v7 = [(PPEvent *)self endDate];
  v8 = [(PPEvent *)self attendees];
  v9 = (void *)[v3 initWithFormat:@"<PPEvent i:'%@' t:'%@' s:'%@' e:'%@' a:'%tu'>", v4, v5, v6, v7, objc_msgSend(v8, "count")];

  return v9;
}

- (int64_t)compareStartDateWithEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PPEvent *)self startDate];
  uint64_t v6 = [v4 startDate];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)organizerIsCurrentUser
{
  return [(PPEvent *)self eventFlags] & 1;
}

- (BOOL)representsUnscheduledFreeTime
{
  return ([(PPEvent *)self eventFlags] >> 1) & 1;
}

- (unsigned)suggestedEventCategory
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"sec"];
  unsigned __int8 v4 = [v3 unsignedCharValue];

  return v4;
}

- (CLLocation)structuredLocationCoordinates
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"slc"];

  if (v3)
  {
    unsigned __int8 v4 = (void *)MEMORY[0x192F97350]();
    uint64_t v5 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v6 = (void *)MEMORY[0x192F97350]();
    int64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    v8 = [v5 unarchivedObjectOfClasses:v7 fromData:v3 error:0];
  }
  else
  {
    v8 = 0;
  }

  return (CLLocation *)v8;
}

- (NSString)structuredLocationAddress
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"sla"];

  return (NSString *)v3;
}

- (NSString)structuredLocationTitle
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"slt"];

  return (NSString *)v3;
}

- (NSURL)url
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"url"];

  if (v3) {
    unsigned __int8 v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v3];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return (NSURL *)v4;
}

- (NSString)notes
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"not"];

  return (NSString *)v3;
}

- (unsigned)eventFlags
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"efl"];
  unsigned __int8 v4 = [v3 unsignedCharValue];

  return v4;
}

- (NSString)organizerName
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"onm"];

  return (NSString *)v3;
}

- (NSArray)attendees
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"atn"];

  uint64_t v4 = [v3 count];
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __20__PPEvent_attendees__block_invoke;
    v9[3] = &unk_1E550E180;
    id v10 = v3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __20__PPEvent_attendees__block_invoke_2;
    v8[3] = &__block_descriptor_40_e5_Q8__0l;
    v8[4] = v4;
    id v6 = v3;
    id v3 = objc_msgSend(v5, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v9, v8);
  }
  return (NSArray *)v3;
}

id *__20__PPEvent_attendees__block_invoke(uint64_t a1, void *a2)
{
  v2 = -[PPAttendee initWithIndex:inBackingPlists:]((id *)[PPAttendee alloc], a2, *(void **)(a1 + 32));
  return v2;
}

uint64_t __20__PPEvent_attendees__block_invoke_2(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

- (NSURL)externalURI
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"uri"];

  if (v3) {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return (NSURL *)v4;
}

- (char)availability
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"avl"];
  char v4 = [v3 unsignedCharValue];

  return v4;
}

- (NSDate)endDate
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"edt"];

  return (NSDate *)v3;
}

- (NSDate)startDate
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"sdt"];

  return (NSDate *)v3;
}

- (NSString)location
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"loc"];

  return (NSString *)v3;
}

- (NSString)title
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"ttl"];

  return (NSString *)v3;
}

- (EKObjectID)objectID
{
  id v3 = objc_alloc((Class)getEKObjectIDClass());
  char v4 = -[PPAttendee _plist]((uint64_t)self);
  uint64_t v5 = [v4 objectForKeyedSubscript:@"oid"];
  id v6 = (void *)[v3 initWithDictionaryRepresentation:v5];

  return (EKObjectID *)v6;
}

- (NSString)eventIdentifier
{
  v2 = -[PPAttendee _plist]((uint64_t)self);
  id v3 = [v2 objectForKeyedSubscript:@"eid"];

  return (NSString *)v3;
}

- (PPEvent)initWithIndex:(unint64_t)a3 inBackingPlists:(id)a4 calendar:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PPEvent;
  v11 = [(PPEvent *)&v14 init];
  BOOL v12 = v11;
  if (v11)
  {
    v11->_indexInBackingPlists = a3;
    objc_storeStrong((id *)&v11->_backingPlists, a4);
    objc_storeStrong((id *)&v12->_calendar, a5);
  }

  return v12;
}

- (PPEvent)initWithPlist:(id)a3 calendar:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v12 count:1];

  id v10 = -[PPEvent initWithIndex:inBackingPlists:calendar:](self, "initWithIndex:inBackingPlists:calendar:", 0, v9, v7, v12, v13);
  return v10;
}

- (PPEvent)initWithEventIdentifier:(id)a3 objectID:(id)a4 title:(id)a5 location:(id)a6 calendar:(id)a7 startDate:(id)a8 endDate:(id)a9 availability:(char)a10 externalURIString:(id)a11 attendees:(id)a12 organizerName:(id)a13 eventFlags:(unsigned __int8)a14 notes:(id)a15 urlString:(id)a16 structuredLocationTitle:(id)a17 structuredLocationAddress:(id)a18 structuredLocationCoordinates:(id)a19 suggestedEventCategory:(unsigned __int8)a20
{
  v89[128] = *MEMORY[0x1E4F143B8];
  id v87 = a3;
  id v25 = a4;
  id v85 = a5;
  id v71 = a6;
  id v84 = a6;
  id v26 = a7;
  id v72 = a8;
  id v83 = a8;
  id v82 = a9;
  id v76 = a11;
  id v75 = a12;
  id v74 = a13;
  id v73 = a15;
  id v81 = a16;
  id v80 = a17;
  id v79 = a18;
  id v78 = a19;
  v86 = v25;
  if (v25)
  {
    if (v26) {
      goto LABEL_3;
    }
  }
  else
  {
    v66 = [MEMORY[0x1E4F28B00] currentHandler];
    [v66 handleFailureInMethod:a2, self, @"PPEvent.m", 556, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];

    if (v26) {
      goto LABEL_3;
    }
  }
  v67 = [MEMORY[0x1E4F28B00] currentHandler];
  [v67 handleFailureInMethod:a2, self, @"PPEvent.m", 557, @"Invalid parameter not satisfying: %@", @"calendar" object file lineNumber description];

LABEL_3:
  if (!v83)
  {
    v68 = [MEMORY[0x1E4F28B00] currentHandler];
    [v68 handleFailureInMethod:a2, self, @"PPEvent.m", 558, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];
  }
  if (!v82)
  {
    v69 = [MEMORY[0x1E4F28B00] currentHandler];
    [v69 handleFailureInMethod:a2, self, @"PPEvent.m", 559, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];
  }
  bzero(v89, 0x400uLL);
  bzero(v88, 0x400uLL);
  if (v87)
  {
    v89[0] = @"eid";
    v88[0] = v87;
    uint64_t v27 = 1;
  }
  else
  {
    uint64_t v27 = 0;
  }
  v89[v27] = @"oid";
  uint64_t v28 = [v86 dictionaryRepresentation];
  id v29 = v88[v27];
  v88[v27] = (id)v28;

  uint64_t v30 = v27 + 1;
  if (v85)
  {
    v31 = (void *)v89[v30];
    v89[v30] = @"ttl";

    objc_storeStrong(&v88[v30], a5);
    uint64_t v30 = v27 | 2;
  }
  if (v84)
  {
    v32 = (void *)v89[v30];
    v89[v30] = @"loc";

    objc_storeStrong(&v88[v30++], v71);
  }
  uint64_t v33 = v30;
  long long v34 = (void *)v89[v30];
  v89[v30] = @"sdt";

  objc_storeStrong(&v88[v30], v72);
  long long v35 = (void *)v89[v30 + 1];
  v89[v33 + 1] = @"edt";

  objc_storeStrong(&v88[v30 + 1], a9);
  uint64_t v36 = 8 * v30 + 16;
  long long v37 = *(void **)((char *)v89 + v36);
  v89[v33 + 2] = @"avl";

  uint64_t v38 = [NSNumber numberWithChar:a10];
  uint64_t v39 = *(id *)((char *)v88 + v36);
  *(id *)((char *)v88 + v36) = (id)v38;

  uint64_t v40 = v30 + 3;
  if (v76)
  {
    v41 = (void *)v89[v40];
    v89[v40] = @"uri";

    objc_storeStrong(&v88[v40], a11);
    uint64_t v40 = v30 + 4;
  }
  if (v75)
  {
    v42 = (void *)v89[v40];
    v89[v40] = @"atn";

    uint64_t v43 = objc_msgSend(v75, "_pas_mappedArrayWithTransform:", &__block_literal_global_165);
    id v44 = v88[v40];
    v88[v40] = (id)v43;

    ++v40;
  }
  if (v74)
  {
    v45 = (void *)v89[v40];
    v89[v40] = @"onm";

    objc_storeStrong(&v88[v40++], a13);
  }
  v46 = (void *)v89[v40];
  v89[v40] = @"efl";

  uint64_t v47 = [NSNumber numberWithUnsignedChar:a14];
  id v48 = v88[v40];
  v88[v40] = (id)v47;

  uint64_t v49 = v40 + 1;
  if (v73)
  {
    v50 = (void *)v89[v49];
    v89[v49] = @"not";

    objc_storeStrong(&v88[v49], a15);
    uint64_t v49 = v40 + 2;
  }
  v51 = v78;
  if (v81)
  {
    v52 = (void *)v89[v49];
    v89[v49] = @"url";

    objc_storeStrong(&v88[v49++], a16);
  }
  if (v80)
  {
    v53 = (void *)v89[v49];
    v89[v49] = @"slt";

    objc_storeStrong(&v88[v49++], a17);
  }
  if (v79)
  {
    v54 = (void *)v89[v49];
    v89[v49] = @"sla";

    objc_storeStrong(&v88[v49++], a18);
  }
  if (v78)
  {
    v55 = (void *)MEMORY[0x192F97350]();
    v56 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v78 requiringSecureCoding:1 error:0];
    if (v56)
    {
      v57 = (void *)v89[v49];
      v89[v49] = @"slc";

      objc_storeStrong(&v88[v49++], v56);
    }

    v51 = v78;
  }
  if (a20)
  {
    v58 = (void *)v89[v49];
    v89[v49] = @"sec";

    uint64_t v59 = [NSNumber numberWithUnsignedChar:a20];
    id v60 = v88[v49];
    v88[v49] = (id)v59;

    ++v49;
  }
  v61 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:v88 forKeys:v89 count:v49];
  v62 = [(PPEvent *)self initWithPlist:v61 calendar:v26];

  for (uint64_t i = 127; i != -1; --i)
  for (uint64_t j = 127; j != -1; --j)

  return v62;
}

id __271__PPEvent_initWithEventIdentifier_objectID_title_location_calendar_startDate_endDate_availability_externalURIString_attendees_organizerName_eventFlags_notes_urlString_structuredLocationTitle_structuredLocationAddress_structuredLocationCoordinates_suggestedEventCategory___block_invoke(uint64_t a1, uint64_t a2)
{
  return -[PPAttendee _plist](a2);
}

- (PPEvent)initWithEventIdentifier:(id)a3 objectID:(id)a4 title:(id)a5 location:(id)a6 calendar:(id)a7 startDate:(id)a8 endDate:(id)a9 availability:(char)a10 externalURI:(id)a11 attendees:(id)a12 organizerName:(id)a13 eventFlags:(unsigned __int8)a14 notes:(id)a15 url:(id)a16 structuredLocationTitle:(id)a17 structuredLocationAddress:(id)a18 structuredLocationCoordinates:(id)a19 suggestedEventCategory:(unsigned __int8)a20
{
  id v46 = a19;
  id v44 = a18;
  id v41 = a17;
  id v23 = a16;
  id v36 = a15;
  id v32 = a13;
  id v35 = a12;
  id v33 = a9;
  id v34 = a8;
  id v48 = a7;
  id v24 = a6;
  id v38 = a5;
  id v40 = a4;
  id v25 = a3;
  uint64_t v43 = [a11 absoluteString];
  v45 = [v23 absoluteString];

  LOBYTE(v31) = a20;
  LOBYTE(v30) = a14;
  LOBYTE(v29) = a10;
  id v26 = v24;
  uint64_t v27 = -[PPEvent initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURIString:attendees:organizerName:eventFlags:notes:urlString:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:](self, "initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURIString:attendees:organizerName:eventFlags:notes:urlString:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:", v25, v40, v38, v24, v48, v34, v33, v29, v43, v35, v32, v30, v36, v45, v41,
          v44,
          v46,
          v31);

  return v27;
}

- (PPEvent)initWithEKEvent:(id)a3 calendarInternPool:(id)a4
{
  id v6 = a4;
  id v7 = +[PPEvent deferredAllocationEventFromEKEvent:a3];
  id v8 = objc_opt_new();
  ((void (**)(void, void *, id))v7)[2](v7, v8, v6);
  id v9 = (PPEvent *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (unsigned)suggestedEventCategoryFromMetadata:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [v3 objectForKeyedSubscript:@"SGEventMetadataTypeKey"];
  int v5 = [v4 isEqualToString:@"StructuredEvent"];

  if (v5)
  {
    id v6 = (void *)MEMORY[0x192F97350]();
    id v7 = [v3 objectForKeyedSubscript:@"SGEventMetadataCategoryDescriptionKey"];
    id v8 = [v7 lowercaseString];

    if (v8)
    {
      id v9 = [&unk_1EDA6B940 objectForKeyedSubscript:v8];
      id v10 = v9;
      if (v9)
      {
        unsigned __int8 v11 = [v9 unsignedCharValue];
      }
      else
      {
        objc_super v14 = pp_default_log_handle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          int v16 = 138543362;
          v17 = v8;
          _os_log_fault_impl(&dword_18CAA6000, v14, OS_LOG_TYPE_FAULT, "PPEvent creation with unknown suggested category: StructuredEvent::%{public}@", (uint8_t *)&v16, 0xCu);
        }

        unsigned __int8 v11 = 0;
      }
    }
    else
    {
      unsigned __int8 v11 = 0;
    }
  }
  else
  {
    id v12 = [v3 objectForKeyedSubscript:@"SGEventMetadataTypeKey"];
    int v13 = [v12 isEqualToString:@"NLEvent"];

    if (v13) {
      unsigned __int8 v11 = 12;
    }
    else {
      unsigned __int8 v11 = 0;
    }
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)convertBatchOfEKEvents:(id)a3 calendarInternPool:(id)a4 interningSet:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    unsigned __int8 v11 = pp_default_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = [v8 count];
      _os_log_impl(&dword_18CAA6000, v11, OS_LOG_TYPE_DEFAULT, "PPEvent convertBatchOfEKEvents begin (count %tu)", buf, 0xCu);
    }

    id v12 = pp_default_log_handle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18CAA6000, v12, OS_LOG_TYPE_DEFAULT, "PPEvent convertBatchOfEKEvents step 1 begin: generate deferredAllocationBlocks", buf, 2u);
    }

    int v13 = (void *)MEMORY[0x192F97350]();
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __66__PPEvent_convertBatchOfEKEvents_calendarInternPool_interningSet___block_invoke;
    v27[3] = &__block_descriptor_40_e17__16__0__EKEvent_8l;
    v27[4] = a1;
    objc_super v14 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v27);
    v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEFAULT, "PPEvent convertBatchOfEKEvents step 2 begin: run deferredAllocationBlocks", buf, 2u);
    }

    int v16 = (void *)MEMORY[0x192F97350]();
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __66__PPEvent_convertBatchOfEKEvents_calendarInternPool_interningSet___block_invoke_149;
    v24[3] = &unk_1E550E138;
    id v17 = v10;
    id v25 = v17;
    id v26 = v9;
    uint64_t v18 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", v24);

    uint64_t v19 = pp_default_log_handle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v8 count];
      uint64_t v21 = [v18 count];
      uint64_t v22 = [v17 count];
      *(_DWORD *)buf = 134218496;
      uint64_t v29 = v20;
      __int16 v30 = 2048;
      uint64_t v31 = v21;
      __int16 v32 = 2048;
      uint64_t v33 = v22;
      _os_log_impl(&dword_18CAA6000, v19, OS_LOG_TYPE_DEFAULT, "PPEvent convertBatchOfEKEvents complete (ekEvent count %tu, ppEvent count %tu, interningSet count %tu)", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

uint64_t __66__PPEvent_convertBatchOfEKEvents_calendarInternPool_interningSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deferredAllocationEventFromEKEvent:a2];
}

uint64_t __66__PPEvent_convertBatchOfEKEvents_calendarInternPool_interningSet___block_invoke_149(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

+ (id)convertBatchOfEKEvents:(id)a3 calendarInternPool:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  uint64_t v10 = [v8 count];
  if ((unint64_t)(10 * v10) >= 0x4000) {
    uint64_t v11 = 0x4000;
  }
  else {
    uint64_t v11 = 10 * v10;
  }
  id v12 = (void *)[v9 initWithCapacity:v11];
  int v13 = [a1 convertBatchOfEKEvents:v8 calendarInternPool:v7 interningSet:v12];

  return v13;
}

+ (id)deferredAllocationEventFromEKEvent:(id)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = (void *)MEMORY[0x192F97350]();
  uint64_t v5 = [v3 startDate];
  if (v5
    && (id v6 = (void *)v5,
        [v3 endDate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v61 = [v3 eventIdentifier];
    id v8 = [v3 organizer];
    char v9 = [v8 isCurrentUser];

    int v10 = [v3 eligibleForTravelAdvisories];
    char v11 = v9 | 4;
    if (!v10) {
      char v11 = v9;
    }
    char v59 = v11;
    id v12 = [v3 preferredLocationWithoutPrediction];
    v64 = [v3 calendar];
    int v13 = (void *)MEMORY[0x192F97350]();
    uint64_t v14 = [v3 customObjectForKey:@"SGEventMetadataKey"];
    v63 = v4;
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
      char v57 = [(id)objc_opt_class() suggestedEventCategoryFromMetadata:v14];
    }
    else {
      char v57 = 0;
    }
    id v17 = [v3 locationWithoutPrediction];
    if ([v17 length])
    {
      v55 = v17;
    }
    else
    {

      v55 = 0;
    }
    uint64_t v18 = [v3 attendees];
    uint64_t v19 = objc_msgSend(v18, "_pas_mappedArrayWithTransform:", &__block_literal_global_140);

    v62 = (void *)v14;
    if ([v3 hasNotes])
    {
      uint64_t v49 = [v3 notes];
    }
    else
    {
      uint64_t v49 = 0;
    }
    v53 = [v12 title];
    id v41 = [v3 title];
    v42 = [v3 objectID];
    uint64_t v43 = [v3 startDate];
    uint64_t v20 = [v3 endDate];
    uint64_t v51 = [v3 availability];
    uint64_t v21 = [v3 externalURI];
    [v21 absoluteString];
    id v46 = v65 = v12;

    uint64_t v22 = [v3 organizer];
    id v23 = [v22 name];

    id v24 = [v3 URL];
    id v25 = [v24 absoluteString];

    id v26 = [v65 address];
    uint64_t v27 = [v65 geoLocation];
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_4;
    v66[3] = &unk_1E550E0F0;
    id v67 = v64;
    id v68 = v19;
    id v69 = v61;
    id v70 = v42;
    id v71 = v41;
    id v72 = v55;
    id v73 = v43;
    id v74 = v20;
    id v75 = v46;
    id v76 = v23;
    char v83 = v59;
    id v77 = v49;
    id v78 = v25;
    id v79 = v53;
    id v80 = v26;
    id v81 = v27;
    uint64_t v82 = v51;
    char v84 = v57;
    id v60 = v27;
    id v58 = v26;
    id v54 = v53;
    id v52 = v25;
    id v50 = v49;
    id v48 = v23;
    id v47 = v46;
    id v45 = v20;
    id v44 = v43;
    id v56 = v55;
    id v28 = v41;
    id v29 = v42;
    id v30 = v61;
    id v31 = v19;
    id v32 = v64;
    int v16 = (void *)[v66 copy];

    v15 = v65;
    char v4 = v63;
  }
  else
  {
    v15 = pp_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v85[0] = @"nil start date";
      uint64_t v34 = NSNumber;
      id v35 = [v3 startDate];
      id v36 = [v34 numberWithInt:v35 == 0];
      v85[1] = @"nil end date";
      v86[0] = v36;
      long long v37 = NSNumber;
      id v38 = [v3 endDate];
      uint64_t v39 = [v37 numberWithInt:v38 == 0];
      v86[1] = v39;
      id v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v86 forKeys:v85 count:2];
      *(_DWORD *)buf = 138412290;
      v88 = v40;
      _os_log_debug_impl(&dword_18CAA6000, v15, OS_LOG_TYPE_DEBUG, "PPEvent initWithEKEvent returning nil due to: %@", buf, 0xCu);
    }
    int v16 = &__block_literal_global_1405;
  }

  return v16;
}

PPEvent *__46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v31 = [[PPCalendar alloc] initWithEKCalendar:*(void *)(a1 + 32) internPool:v6];

  id v7 = *(void **)(a1 + 40);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_5;
  v32[3] = &unk_1E550E0C8;
  id v33 = v5;
  id v8 = v5;
  id v30 = objc_msgSend(v7, "_pas_mappedArrayWithTransform:", v32);
  uint64_t v27 = [PPEvent alloc];
  id v24 = internUsingSet(*(void **)(a1 + 48), v8);
  id v29 = internUsingSet(*(void **)(a1 + 56), v8);
  id v26 = internUsingSet(*(void **)(a1 + 64), v8);
  id v25 = internUsingSet(*(void **)(a1 + 72), v8);
  id v23 = internUsingSet(*(void **)(a1 + 80), v8);
  uint64_t v20 = internUsingSet(*(void **)(a1 + 88), v8);
  uint64_t v22 = *(void *)(a1 + 152);
  uint64_t v19 = internUsingSet(*(void **)(a1 + 96), v8);
  uint64_t v18 = internUsingSet(*(void **)(a1 + 104), v8);
  char v21 = *(unsigned char *)(a1 + 160);
  id v17 = internUsingSet(*(void **)(a1 + 112), v8);
  char v9 = internUsingSet(*(void **)(a1 + 120), v8);
  int v10 = internUsingSet(*(void **)(a1 + 128), v8);
  char v11 = internUsingSet(*(void **)(a1 + 136), v8);
  id v12 = internUsingSet(*(void **)(a1 + 144), v8);
  LOBYTE(v16) = *(unsigned char *)(a1 + 161);
  LOBYTE(v15) = v21;
  LOBYTE(v14) = v22;
  id v28 = -[PPEvent initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURIString:attendees:organizerName:eventFlags:notes:urlString:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:](v27, "initWithEventIdentifier:objectID:title:location:calendar:startDate:endDate:availability:externalURIString:attendees:organizerName:eventFlags:notes:urlString:structuredLocationTitle:structuredLocationAddress:structuredLocationCoordinates:suggestedEventCategory:", v24, v29, v26, v25, v31, v23, v20, v14, v19, v30, v18, v15, v17, v9, v10,
          v11,
          v12,
          v16);

  return v28;
}

uint64_t __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke()
{
  return 0;
}

uint64_t __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, *(void *)(a1 + 32));
}

id __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 name];
  char v4 = [v2 emailAddress];
  id v5 = [v2 URL];
  id v6 = [v5 absoluteString];

  LOBYTE(v5) = [v2 isCurrentUser];
  uint64_t v7 = [v2 participantStatus];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_3;
  v13[3] = &unk_1E550E0A0;
  id v14 = v3;
  id v15 = v4;
  char v18 = (char)v5;
  id v16 = v6;
  uint64_t v17 = v7;
  id v8 = v6;
  id v9 = v4;
  id v10 = v3;
  char v11 = (void *)[v13 copy];

  return v11;
}

id __46__PPEvent_deferredAllocationEventFromEKEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [[PPAttendee alloc] initWithName:*(void *)(a1 + 32) emailAddress:*(void *)(a1 + 40) urlString:*(void *)(a1 + 48) isCurrentUser:*(unsigned __int8 *)(a1 + 64) status:*(unsigned __int8 *)(a1 + 56)];
  id v5 = internUsingSet(v4, v3);

  return v5;
}

@end