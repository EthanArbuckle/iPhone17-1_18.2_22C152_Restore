@interface MKCallHistory
+ (BOOL)read:(id)a3;
+ (double)duration:(id)a3;
+ (id)calls:(id)a3 label:(id)a4;
+ (id)convertCallHistoryToCall:(id)a3;
+ (unsigned)status:(id)a3;
- (BOOL)isRead;
- (MKCallHistory)initWithSerializedData:(id)a3;
- (NSArray)otherNumbers;
- (NSDate)date;
- (NSString)countryCode;
- (NSString)number;
- (NSUUID)label;
- (double)duration;
- (unint64_t)type;
- (void)setCountryCode:(id)a3;
- (void)setDate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setIsRead:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setNumber:(id)a3;
- (void)setOtherNumbers:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation MKCallHistory

- (MKCallHistory)initWithSerializedData:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MKCallHistory;
  v5 = [(MKCallHistory *)&v19 init];
  if (!v5) {
    goto LABEL_4;
  }
  if (!v4) {
    goto LABEL_5;
  }
  v6 = objc_msgSend(v4, "mk_numberForKey:", @"is_read");
  -[MKCallHistory setIsRead:](v5, "setIsRead:", [v6 BOOLValue]);

  v7 = objc_msgSend(v4, "mk_numberForKey:", @"type");
  -[MKCallHistory setType:](v5, "setType:", [v7 unsignedIntegerValue]);

  v8 = (void *)MEMORY[0x263EFF910];
  v9 = objc_msgSend(v4, "mk_numberForKey:", @"date");
  [v9 doubleValue];
  v11 = [v8 dateWithTimeIntervalSince1970:v10 / 1000.0];
  [(MKCallHistory *)v5 setDate:v11];

  v12 = objc_msgSend(v4, "mk_numberForKey:", @"duration");
  [v12 doubleValue];
  -[MKCallHistory setDuration:](v5, "setDuration:");

  v13 = objc_msgSend(v4, "mk_stringForKey:", @"country_code");
  v14 = [v13 lowercaseString];
  [(MKCallHistory *)v5 setCountryCode:v14];

  v15 = objc_msgSend(v4, "mk_stringForKey:", @"number");
  [(MKCallHistory *)v5 setNumber:v15];

  v16 = objc_msgSend(v4, "mk_arrayForKey:", @"other_numbers");
  [(MKCallHistory *)v5 setOtherNumbers:v16];

  if ([(NSArray *)v5->_otherNumbers count]) {
LABEL_4:
  }
    v17 = v5;
  else {
LABEL_5:
  }
    v17 = 0;

  return v17;
}

+ (BOOL)read:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 4) {
    char v4 = [v3 isRead];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

+ (unsigned)status:(id)a3
{
  id v3 = a3;
  switch([v3 type])
  {
    case 1:
      char v4 = (unsigned int *)MEMORY[0x263F305C0];
      break;
    case 2:
      [v3 duration];
      char v4 = (unsigned int *)MEMORY[0x263F305B8];
      if (v5 != 0.0) {
        char v4 = (unsigned int *)MEMORY[0x263F305C8];
      }
      break;
    case 3:
      char v4 = (unsigned int *)MEMORY[0x263F305B0];
      break;
    case 4:
    case 5:
      char v4 = (unsigned int *)MEMORY[0x263F305D8];
      break;
    default:
      char v4 = (unsigned int *)MEMORY[0x263F305E8];
      break;
  }
  unsigned int v6 = *v4;

  return v6;
}

+ (double)duration:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 1 || (double v4 = 0.0, objc_msgSend(v3, "type") == 2))
  {
    [v3 duration];
    double v4 = v5;
  }

  return v4;
}

+ (id)calls:(id)a3 label:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v20 = a4;
  unsigned int v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    objc_super v19 = v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [[MKCallHistory alloc] initWithSerializedData:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        v13 = v12;
        if (!v12)
        {
          v17 = +[MKLog log];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
            +[MKCallHistory calls:label:](&buf, v19, v17);
          }
          goto LABEL_15;
        }
        if ([(MKCallHistory *)v12 type] && [(MKCallHistory *)v13 type] <= 5)
        {
          v14 = [(MKCallHistory *)v13 number];

          if (v14)
          {
            v15 = [(MKCallHistory *)v13 number];
            v16 = [v20 label:v15];
            [(MKCallHistory *)v13 setLabel:v16];
          }
          v17 = +[MKCallHistory convertCallHistoryToCall:](MKCallHistory, "convertCallHistoryToCall:", v13, v19);
          if (v17) {
            [v6 addObject:v17];
          }
LABEL_15:
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)convertCallHistoryToCall:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x263EFF9C0]);
  id v5 = [v3 otherNumbers];
  unsigned int v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = objc_msgSend(v3, "otherNumbers", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x263F30578];
        v14 = [v3 countryCode];
        v15 = [v13 normalizedPhoneNumberHandleForValue:v12 isoCountryCode:v14];

        if (!v15)
        {
          v15 = [MEMORY[0x263F30578] normalizedEmailAddressHandleForValue:v12];
          if (!v15)
          {
            v15 = [MEMORY[0x263F30578] normalizedGenericHandleForValue:v12];
            if (!v15) {
              continue;
            }
          }
        }
        [v6 addObject:v15];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  if ([v6 count])
  {
    id v16 = objc_alloc_init(MEMORY[0x263F30598]);
    [v16 setHandleType:2];
    [v16 setMediaType:1];
    [v16 setTtyType:0];
    [v16 setServiceProvider:*MEMORY[0x263F30628]];
    objc_msgSend(v16, "setRead:", +[MKCallHistory read:](MKCallHistory, "read:", v3));
    [v16 setRemoteParticipantHandles:v6];
    objc_msgSend(v16, "setCallStatus:", +[MKCallHistory status:](MKCallHistory, "status:", v3));
    +[MKCallHistory duration:v3];
    objc_msgSend(v16, "setDuration:");
    v17 = [v3 date];
    [v16 setDate:v17];

    v18 = [v3 countryCode];
    [v16 setIsoCountryCode:v18];

    objc_super v19 = [v3 label];
    [v16 setLocalParticipantUUID:v19];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (BOOL)isRead
{
  return self->_isRead;
}

- (void)setIsRead:(BOOL)a3
{
  self->_isRead = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSUUID)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
}

- (NSArray)otherNumbers
{
  return self->_otherNumbers;
}

- (void)setOtherNumbers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherNumbers, 0);
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

+ (void)calls:(os_log_t)log label:.cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_22BFAC000, log, OS_LOG_TYPE_ERROR, "could not deserialize call history item.", buf, 2u);
}

@end