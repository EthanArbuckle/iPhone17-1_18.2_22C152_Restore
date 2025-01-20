@interface SFCalendarEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)hasIsAllDay;
- (BOOL)isAllDay;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)dictionaryRepresentation;
- (NSString)notes;
- (NSString)title;
- (NSTimeZone)endTimeZone;
- (NSTimeZone)startTimeZone;
- (NSURL)url;
- (SFCalendarEvent)initWithCoder:(id)a3;
- (SFCalendarEvent)initWithProtobuf:(id)a3;
- (SFStructuredLocation)endLocation;
- (SFStructuredLocation)location;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setEndLocation:(id)a3;
- (void)setEndTimeZone:(id)a3;
- (void)setIsAllDay:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setNotes:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStartTimeZone:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SFCalendarEvent

- (SFCalendarEvent)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SFCalendarEvent;
  v5 = [(SFCalendarEvent *)&v37 init];
  if (v5)
  {
    v6 = [v4 title];

    if (v6)
    {
      v7 = [v4 title];
      [(SFCalendarEvent *)v5 setTitle:v7];
    }
    v8 = [v4 startDate];

    if (v8)
    {
      v9 = [v4 startDate];
      v10 = (void *)MEMORY[0x1E4F1C9C8];
      [v9 secondsSince1970];
      v11 = objc_msgSend(v10, "dateWithTimeIntervalSince1970:");
      [(SFCalendarEvent *)v5 setStartDate:v11];
    }
    v12 = [v4 endDate];

    if (v12)
    {
      v13 = [v4 endDate];
      v14 = (void *)MEMORY[0x1E4F1C9C8];
      [v13 secondsSince1970];
      v15 = objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
      [(SFCalendarEvent *)v5 setEndDate:v15];
    }
    if ([v4 isAllDay]) {
      -[SFCalendarEvent setIsAllDay:](v5, "setIsAllDay:", [v4 isAllDay]);
    }
    v16 = [v4 location];

    if (v16)
    {
      v17 = [SFStructuredLocation alloc];
      v18 = [v4 location];
      v19 = [(SFStructuredLocation *)v17 initWithProtobuf:v18];
      [(SFCalendarEvent *)v5 setLocation:v19];
    }
    v20 = [v4 notes];

    if (v20)
    {
      v21 = [v4 notes];
      [(SFCalendarEvent *)v5 setNotes:v21];
    }
    v22 = [v4 startTimeZone];

    if (v22)
    {
      v23 = [v4 startTimeZone];
      v24 = _SFPBTimeZoneHandwrittenTranslator(v23);
      [(SFCalendarEvent *)v5 setStartTimeZone:v24];
    }
    v25 = [v4 endTimeZone];

    if (v25)
    {
      v26 = [v4 endTimeZone];
      v27 = _SFPBTimeZoneHandwrittenTranslator(v26);
      [(SFCalendarEvent *)v5 setEndTimeZone:v27];
    }
    v28 = [v4 endLocation];

    if (v28)
    {
      v29 = [SFStructuredLocation alloc];
      v30 = [v4 endLocation];
      v31 = [(SFStructuredLocation *)v29 initWithProtobuf:v30];
      [(SFCalendarEvent *)v5 setEndLocation:v31];
    }
    v32 = [v4 url];

    if (v32)
    {
      v33 = [v4 url];
      v34 = _SFPBURLHandwrittenTranslator(v33);
      [(SFCalendarEvent *)v5 setUrl:v34];
    }
    v35 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_endLocation, 0);
  objc_storeStrong((id *)&self->_endTimeZone, 0);
  objc_storeStrong((id *)&self->_startTimeZone, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setUrl:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setEndLocation:(id)a3
{
}

- (SFStructuredLocation)endLocation
{
  return self->_endLocation;
}

- (void)setEndTimeZone:(id)a3
{
}

- (NSTimeZone)endTimeZone
{
  return self->_endTimeZone;
}

- (void)setStartTimeZone:(id)a3
{
}

- (NSTimeZone)startTimeZone
{
  return self->_startTimeZone;
}

- (void)setNotes:(id)a3
{
}

- (NSString)notes
{
  return self->_notes;
}

- (void)setLocation:(id)a3
{
}

- (SFStructuredLocation)location
{
  return self->_location;
}

- (BOOL)isAllDay
{
  return self->_isAllDay;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)hash
{
  v22 = [(SFCalendarEvent *)self title];
  uint64_t v3 = [v22 hash];
  id v4 = [(SFCalendarEvent *)self startDate];
  uint64_t v5 = [v4 hash] ^ v3;
  v6 = [(SFCalendarEvent *)self endDate];
  uint64_t v7 = v5 ^ [v6 hash];
  uint64_t v8 = [(SFCalendarEvent *)self isAllDay];
  v9 = [(SFCalendarEvent *)self location];
  uint64_t v10 = v7 ^ v8 ^ [v9 hash];
  v11 = [(SFCalendarEvent *)self notes];
  uint64_t v12 = [v11 hash];
  v13 = [(SFCalendarEvent *)self startTimeZone];
  uint64_t v14 = v12 ^ [v13 hash];
  v15 = [(SFCalendarEvent *)self endTimeZone];
  uint64_t v16 = v14 ^ [v15 hash];
  v17 = [(SFCalendarEvent *)self endLocation];
  uint64_t v18 = v10 ^ v16 ^ [v17 hash];
  v19 = [(SFCalendarEvent *)self url];
  unint64_t v20 = v18 ^ [v19 hash];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFCalendarEvent *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFCalendarEvent *)v4 isMemberOfClass:objc_opt_class()])
    {
      uint64_t v5 = v4;
      v6 = [(SFCalendarEvent *)self title];
      uint64_t v7 = [(SFCalendarEvent *)v5 title];
      if ((v6 == 0) == (v7 != 0))
      {
        char v11 = 0;
LABEL_52:

        goto LABEL_53;
      }
      uint64_t v8 = [(SFCalendarEvent *)self title];
      if (v8)
      {
        v9 = [(SFCalendarEvent *)self title];
        uint64_t v10 = [(SFCalendarEvent *)v5 title];
        if (![v9 isEqual:v10])
        {
          char v11 = 0;
LABEL_50:

          goto LABEL_51;
        }
        v80 = v10;
        v81 = v9;
      }
      uint64_t v12 = [(SFCalendarEvent *)self startDate];
      v13 = [(SFCalendarEvent *)v5 startDate];
      if ((v12 == 0) == (v13 != 0)) {
        goto LABEL_48;
      }
      uint64_t v14 = [(SFCalendarEvent *)self startDate];
      if (v14)
      {
        v15 = [(SFCalendarEvent *)self startDate];
        v77 = [(SFCalendarEvent *)v5 startDate];
        v78 = v15;
        if (![v15 isEqual:v77])
        {
LABEL_46:

LABEL_47:
          goto LABEL_48;
        }
      }
      v79 = v14;
      uint64_t v16 = [(SFCalendarEvent *)self endDate];
      v17 = [(SFCalendarEvent *)v5 endDate];
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_48:

          char v11 = 0;
          if (!v8)
          {
LABEL_51:

            goto LABEL_52;
          }
          goto LABEL_49;
        }
        goto LABEL_46;
      }
      v74 = v16;
      v75 = v17;
      v76 = [(SFCalendarEvent *)self endDate];
      if (v76)
      {
        uint64_t v18 = [(SFCalendarEvent *)self endDate];
        uint64_t v19 = [(SFCalendarEvent *)v5 endDate];
        v73 = (void *)v18;
        unint64_t v20 = (void *)v18;
        uint64_t v16 = (void *)v19;
        if (![v20 isEqual:v19]) {
          goto LABEL_23;
        }
      }
      BOOL v21 = [(SFCalendarEvent *)self isAllDay];
      if (v21 != [(SFCalendarEvent *)v5 isAllDay])
      {
        uint64_t v14 = v79;
        if (!v76) {
          goto LABEL_45;
        }
        goto LABEL_23;
      }
      v72 = v16;
      v22 = [(SFCalendarEvent *)self location];
      v23 = [(SFCalendarEvent *)v5 location];
      if ((v22 == 0) == (v23 != 0))
      {

        uint64_t v14 = v79;
        goto LABEL_44;
      }
      v69 = v23;
      v70 = v22;
      [(SFCalendarEvent *)self location];
      v71 = uint64_t v14 = v79;
      if (v71)
      {
        v24 = [(SFCalendarEvent *)self location];
        v67 = [(SFCalendarEvent *)v5 location];
        v68 = v24;
        if (![v24 isEqual:v67]) {
          goto LABEL_42;
        }
      }
      v25 = [(SFCalendarEvent *)self notes];
      v26 = [(SFCalendarEvent *)v5 notes];
      if ((v25 == 0) == (v26 != 0))
      {

        goto LABEL_41;
      }
      v65 = v25;
      v66 = v26;
      v27 = [(SFCalendarEvent *)self notes];
      if (v27)
      {
        v28 = [(SFCalendarEvent *)self notes];
        v62 = [(SFCalendarEvent *)v5 notes];
        v63 = v28;
        if (!objc_msgSend(v28, "isEqual:"))
        {
LABEL_39:

LABEL_40:
LABEL_41:
          uint64_t v14 = v79;
          if (!v71)
          {
LABEL_43:

LABEL_44:
            uint64_t v16 = v72;
            if (!v76)
            {
LABEL_45:

              if (!v14) {
                goto LABEL_48;
              }
              goto LABEL_46;
            }
LABEL_23:

            goto LABEL_45;
          }
LABEL_42:

          goto LABEL_43;
        }
      }
      v64 = v27;
      v29 = [(SFCalendarEvent *)self startTimeZone];
      v30 = [(SFCalendarEvent *)v5 startTimeZone];
      if ((v29 == 0) == (v30 != 0))
      {

        v27 = v64;
        if (!v64) {
          goto LABEL_40;
        }
        goto LABEL_39;
      }
      v60 = v30;
      v61 = [(SFCalendarEvent *)self startTimeZone];
      if (v61)
      {
        uint64_t v31 = [(SFCalendarEvent *)self startTimeZone];
        v57 = [(SFCalendarEvent *)v5 startTimeZone];
        v58 = (void *)v31;
        v32 = (void *)v31;
        v33 = v64;
        if (!objc_msgSend(v32, "isEqual:")) {
          goto LABEL_60;
        }
      }
      v59 = v29;
      v35 = [(SFCalendarEvent *)self endTimeZone];
      v36 = [(SFCalendarEvent *)v5 endTimeZone];
      if ((v35 == 0) == (v36 != 0))
      {

        v33 = v64;
        v29 = v59;
        if (!v61)
        {
          v40 = v71;
LABEL_61:

          if (v33)
          {
          }
          uint64_t v14 = v79;
          if (v40)
          {
          }
          if (v76)
          {
          }
          if (!v79) {
            goto LABEL_47;
          }
          goto LABEL_46;
        }
LABEL_60:
        v40 = v71;

        goto LABEL_61;
      }
      v55 = v36;
      v56 = v35;
      uint64_t v54 = [(SFCalendarEvent *)self endTimeZone];
      if (v54)
      {
        objc_super v37 = [(SFCalendarEvent *)self endTimeZone];
        v51 = [(SFCalendarEvent *)v5 endTimeZone];
        v52 = v37;
        if (!objc_msgSend(v37, "isEqual:"))
        {
          char v11 = 0;
          v38 = v61;
          v39 = (void *)v54;
LABEL_84:

LABEL_85:
          if (v38)
          {
          }
          if (v64)
          {
          }
          if (v71)
          {
          }
          if (v76)
          {
          }
          if (v79)
          {
          }
          if (!v8) {
            goto LABEL_51;
          }
LABEL_49:
          uint64_t v10 = v80;
          v9 = v81;
          goto LABEL_50;
        }
      }
      v41 = [(SFCalendarEvent *)self endLocation];
      v53 = [(SFCalendarEvent *)v5 endLocation];
      if ((v41 == 0) == (v53 != 0))
      {

        char v11 = 0;
        goto LABEL_83;
      }
      v50 = [(SFCalendarEvent *)self endLocation];
      if (!v50
        || ([(SFCalendarEvent *)self endLocation],
            v42 = objc_claimAutoreleasedReturnValue(),
            [(SFCalendarEvent *)v5 endLocation],
            v48 = objc_claimAutoreleasedReturnValue(),
            v49 = v42,
            objc_msgSend(v42, "isEqual:")))
      {
        v47 = [(SFCalendarEvent *)self url];
        v46 = [(SFCalendarEvent *)v5 url];
        if ((v47 == 0) == (v46 != 0))
        {

          char v11 = 0;
        }
        else
        {
          v45 = [(SFCalendarEvent *)self url];
          if (v45)
          {
            v44 = [(SFCalendarEvent *)self url];
            v43 = [(SFCalendarEvent *)v5 url];
            char v11 = [v44 isEqual:v43];
          }
          else
          {

            char v11 = 1;
          }
        }
        if (!v50) {
          goto LABEL_82;
        }
      }
      else
      {
        char v11 = 0;
      }

LABEL_82:
LABEL_83:
      v38 = v61;
      v39 = (void *)v54;
      if (!v54) {
        goto LABEL_85;
      }
      goto LABEL_84;
    }
    char v11 = 0;
  }
LABEL_53:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFCalendarEvent *)self title];
  v6 = (void *)[v5 copy];
  [v4 setTitle:v6];

  uint64_t v7 = [(SFCalendarEvent *)self startDate];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setStartDate:v8];

  v9 = [(SFCalendarEvent *)self endDate];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setEndDate:v10];

  objc_msgSend(v4, "setIsAllDay:", -[SFCalendarEvent isAllDay](self, "isAllDay"));
  char v11 = [(SFCalendarEvent *)self location];
  uint64_t v12 = (void *)[v11 copy];
  [v4 setLocation:v12];

  v13 = [(SFCalendarEvent *)self notes];
  uint64_t v14 = (void *)[v13 copy];
  [v4 setNotes:v14];

  v15 = [(SFCalendarEvent *)self startTimeZone];
  uint64_t v16 = (void *)[v15 copy];
  [v4 setStartTimeZone:v16];

  v17 = [(SFCalendarEvent *)self endTimeZone];
  uint64_t v18 = (void *)[v17 copy];
  [v4 setEndTimeZone:v18];

  uint64_t v19 = [(SFCalendarEvent *)self endLocation];
  unint64_t v20 = (void *)[v19 copy];
  [v4 setEndLocation:v20];

  BOOL v21 = [(SFCalendarEvent *)self url];
  v22 = (void *)[v21 copy];
  [v4 setUrl:v22];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCalendarEvent alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCalendarEvent *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCalendarEvent alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBCalendarEvent *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBCalendarEvent alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBCalendarEvent *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCalendarEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBCalendarEvent alloc] initWithData:v5];
  uint64_t v7 = [(SFCalendarEvent *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasIsAllDay
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsAllDay:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isAllDay = a3;
}

@end