@interface PKFelicaShinkansenTicket
+ (BOOL)supportsSecureCoding;
- (NSArray)trains;
- (NSNumber)validityStartDate;
- (NSNumber)validityTerm;
- (PKFelicaShinkansenTicket)init;
- (PKFelicaShinkansenTicket)initWithCoder:(id)a3;
- (PKFelicaShinkansenTicket)initWithDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKFelicaShinkansenTicket

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaShinkansenTicket)init
{
  return 0;
}

- (PKFelicaShinkansenTicket)initWithDictionary:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v28.receiver = self;
    v28.super_class = (Class)PKFelicaShinkansenTicket;
    v5 = [(PKFelicaShinkansenTicket *)&v28 init];
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      v7 = objc_msgSend(v4, "objectForKeyedSubscript:", @"NFTrains", 0);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v25 != v10) {
              objc_enumerationMutation(v7);
            }
            v12 = [[PKFelicaShinkansenTrain alloc] initWithDictionary:*(void *)(*((void *)&v24 + 1) + 8 * i)];
            if (v12) {
              [v6 addObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
        }
        while (v9);
      }

      if ([v6 count])
      {
        uint64_t v13 = [v6 copy];
        trains = v5->_trains;
        v5->_trains = (NSArray *)v13;
      }
      else
      {
        trains = v5->_trains;
        v5->_trains = 0;
      }

      v16 = NSNumber;
      v17 = [v4 objectForKeyedSubscript:@"NFValidityStartDate"];
      uint64_t v18 = [v16 numberWithInteger:IntegerFromFelicaDateFormat(v17)];
      validityStartDate = v5->_validityStartDate;
      v5->_validityStartDate = (NSNumber *)v18;

      v20 = [v4 objectForKeyedSubscript:@"NFValidityTerm"];
      uint64_t v21 = [v20 copy];
      validityTerm = v5->_validityTerm;
      v5->_validityTerm = (NSNumber *)v21;
    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (PKFelicaShinkansenTicket)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKFelicaShinkansenTicket;
  v5 = [(PKFelicaShinkansenTicket *)&v16 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"trains"];
    trains = v5->_trains;
    v5->_trains = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"validityStartDate"];
    validityStartDate = v5->_validityStartDate;
    v5->_validityStartDate = (NSNumber *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"validityTerm"];
    validityTerm = v5->_validityTerm;
    v5->_validityTerm = (NSNumber *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  trains = self->_trains;
  id v5 = a3;
  [v5 encodeObject:trains forKey:@"trains"];
  [v5 encodeObject:self->_validityStartDate forKey:@"validityStartDate"];
  [v5 encodeObject:self->_validityTerm forKey:@"validityTerm"];
}

- (NSArray)trains
{
  return self->_trains;
}

- (NSNumber)validityStartDate
{
  return self->_validityStartDate;
}

- (NSNumber)validityTerm
{
  return self->_validityTerm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validityTerm, 0);
  objc_storeStrong((id *)&self->_validityStartDate, 0);
  objc_storeStrong((id *)&self->_trains, 0);
}

@end