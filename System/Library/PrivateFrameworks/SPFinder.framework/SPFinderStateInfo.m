@interface SPFinderStateInfo
+ (BOOL)canPublishAnonymously;
+ (BOOL)supportsSecureCoding;
- (BOOL)optInScreenOffScan;
- (BOOL)state;
- (NSArray)disabledReasonsArray;
- (NSDate)lastPublishDate;
- (NSDate)lastScheduledPublishActivityDate;
- (NSDate)lastUpdated;
- (NSSet)disabledReasons;
- (SPFinderStateInfo)initWithCoder:(id)a3;
- (SPFinderStateInfo)initWithState:(BOOL)a3 optInScreenOffScan:(BOOL)a4 lastUpdated:(id)a5 lastPublishDate:(id)a6 lastScheduledPublishActivityDate:(id)a7 activeCache:(int64_t)a8 disabledReasons:(id)a9;
- (id)description;
- (int64_t)activeCache;
- (void)encodeWithCoder:(id)a3;
- (void)setActiveCache:(int64_t)a3;
- (void)setDisabledReasonsArray:(id)a3;
- (void)setLastPublishDate:(id)a3;
- (void)setLastScheduledPublishActivityDate:(id)a3;
- (void)setLastUpdated:(id)a3;
- (void)setOptInScreenOffScan:(BOOL)a3;
- (void)setState:(BOOL)a3;
@end

@implementation SPFinderStateInfo

- (SPFinderStateInfo)initWithState:(BOOL)a3 optInScreenOffScan:(BOOL)a4 lastUpdated:(id)a5 lastPublishDate:(id)a6 lastScheduledPublishActivityDate:(id)a7 activeCache:(int64_t)a8 disabledReasons:(id)a9
{
  BOOL v12 = a4;
  BOOL v13 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a9;
  v23.receiver = self;
  v23.super_class = (Class)SPFinderStateInfo;
  v19 = [(SPFinderStateInfo *)&v23 init];
  v20 = v19;
  if (v19)
  {
    [(SPFinderStateInfo *)v19 setState:v13];
    [(SPFinderStateInfo *)v20 setOptInScreenOffScan:v12];
    [(SPFinderStateInfo *)v20 setLastUpdated:v15];
    [(SPFinderStateInfo *)v20 setLastPublishDate:v16];
    [(SPFinderStateInfo *)v20 setLastScheduledPublishActivityDate:v17];
    [(SPFinderStateInfo *)v20 setActiveCache:a8];
    v21 = [v18 allObjects];
    [(SPFinderStateInfo *)v20 setDisabledReasonsArray:v21];
  }
  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", -[SPFinderStateInfo state](self, "state"), @"state");
  v4 = [(SPFinderStateInfo *)self lastUpdated];
  [v8 encodeObject:v4 forKey:@"lastUpdated"];

  v5 = [(SPFinderStateInfo *)self lastPublishDate];
  [v8 encodeObject:v5 forKey:@"lastPublishDate"];

  v6 = [(SPFinderStateInfo *)self lastScheduledPublishActivityDate];
  [v8 encodeObject:v6 forKey:@"lastScheduledPublishActivityDate"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[SPFinderStateInfo activeCache](self, "activeCache"), @"activeCache");
  v7 = [(SPFinderStateInfo *)self disabledReasonsArray];
  [v8 encodeObject:v7 forKey:@"disabledReasonsArray"];

  objc_msgSend(v8, "encodeBool:forKey:", -[SPFinderStateInfo optInScreenOffScan](self, "optInScreenOffScan"), @"optInScreenOffScan");
}

- (SPFinderStateInfo)initWithCoder:(id)a3
{
  v14[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  -[SPFinderStateInfo setState:](self, "setState:", [v4 decodeBoolForKey:@"state"]);
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastUpdated"];
  [(SPFinderStateInfo *)self setLastUpdated:v5];

  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastPublishDate"];
  [(SPFinderStateInfo *)self setLastPublishDate:v6];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastScheduledPublishActivityDate"];
  [(SPFinderStateInfo *)self setLastScheduledPublishActivityDate:v7];

  -[SPFinderStateInfo setActiveCache:](self, "setActiveCache:", [v4 decodeIntegerForKey:@"activeCache"]);
  id v8 = (void *)MEMORY[0x263EFFA08];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];
  v10 = [v8 setWithArray:v9];
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"disabledReasonsArray"];
  [(SPFinderStateInfo *)self setDisabledReasonsArray:v11];

  uint64_t v12 = [v4 decodeBoolForKey:@"optInScreenOffScan"];
  [(SPFinderStateInfo *)self setOptInScreenOffScan:v12];
  return self;
}

- (NSSet)disabledReasons
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(SPFinderStateInfo *)self disabledReasonsArray];
  id v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (id)description
{
  v3 = NSString;
  BOOL v4 = [(SPFinderStateInfo *)self state];
  BOOL v5 = [(SPFinderStateInfo *)self optInScreenOffScan];
  v6 = [(SPFinderStateInfo *)self lastUpdated];
  v7 = [(SPFinderStateInfo *)self lastPublishDate];
  id v8 = [(SPFinderStateInfo *)self lastScheduledPublishActivityDate];
  int64_t v9 = [(SPFinderStateInfo *)self activeCache];
  v10 = [(SPFinderStateInfo *)self disabledReasonsArray];
  v11 = [v3 stringWithFormat:@"SPFinderStateInfo state: %i, optInScreenOffScan: %i, lastUpdated: %@, lastPublishDate: %@, lastScheduledPublishActivityDate: %@, activeCache: %li, disabledReasons: %@", v4, v5, v6, v7, v8, v9, v10];

  return v11;
}

+ (BOOL)canPublishAnonymously
{
  return 1;
}

- (BOOL)state
{
  return self->_state;
}

- (void)setState:(BOOL)a3
{
  self->_state = a3;
}

- (BOOL)optInScreenOffScan
{
  return self->_optInScreenOffScan;
}

- (void)setOptInScreenOffScan:(BOOL)a3
{
  self->_optInScreenOffScan = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
}

- (NSDate)lastPublishDate
{
  return self->_lastPublishDate;
}

- (void)setLastPublishDate:(id)a3
{
}

- (NSDate)lastScheduledPublishActivityDate
{
  return self->_lastScheduledPublishActivityDate;
}

- (void)setLastScheduledPublishActivityDate:(id)a3
{
}

- (int64_t)activeCache
{
  return self->_activeCache;
}

- (void)setActiveCache:(int64_t)a3
{
  self->_activeCache = a3;
}

- (NSArray)disabledReasonsArray
{
  return self->_disabledReasonsArray;
}

- (void)setDisabledReasonsArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledReasonsArray, 0);
  objc_storeStrong((id *)&self->_lastScheduledPublishActivityDate, 0);
  objc_storeStrong((id *)&self->_lastPublishDate, 0);
  objc_storeStrong((id *)&self->_lastUpdated, 0);
}

@end