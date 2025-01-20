@interface NavdDoomIncident
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldSuppress;
- (NSDate)expiryDate;
- (NSString)description;
- (NSString)destinationID;
- (NSString)uniqueID;
- (NavdDoomIncident)initWithCoder:(id)a3;
- (NavdDoomIncident)initWithUniqueID:(id)a3 destinationID:(id)a4 expiryDate:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)objectForJSON;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setShouldSuppress:(BOOL)a3;
@end

@implementation NavdDoomIncident

- (NavdDoomIncident)initWithUniqueID:(id)a3 destinationID:(id)a4 expiryDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NavdDoomIncident;
  v11 = [(NavdDoomIncident *)&v19 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    uniqueID = v11->_uniqueID;
    v11->_uniqueID = v12;

    v14 = (NSString *)[v9 copy];
    destinationID = v11->_destinationID;
    v11->_destinationID = v14;

    v16 = (NSDate *)[v10 copy];
    expiryDate = v11->_expiryDate;
    v11->_expiryDate = v16;
  }
  return v11;
}

- (NavdDoomIncident)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NavdDoomIncident;
  v5 = [(NavdDoomIncident *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationID"];
    destinationID = v5->_destinationID;
    v5->_destinationID = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v10;

    v5->_shouldSuppress = [v4 decodeBoolForKey:@"shouldSuppress"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  id v4 = [(NavdDoomIncident *)self uniqueID];
  [v7 encodeObject:v4 forKey:@"uniqueID"];

  v5 = [(NavdDoomIncident *)self destinationID];
  [v7 encodeObject:v5 forKey:@"destinationID"];

  uint64_t v6 = [(NavdDoomIncident *)self expiryDate];
  [v7 encodeObject:v6 forKey:@"expiryDate"];

  [v7 encodeBool:[self shouldSuppress] forKey:@"shouldSuppress"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[NavdDoomIncident allocWithZone:a3];
  v5 = [(NavdDoomIncident *)self uniqueID];
  uint64_t v6 = [(NavdDoomIncident *)self destinationID];
  id v7 = [(NavdDoomIncident *)self expiryDate];
  uint64_t v8 = [(NavdDoomIncident *)v4 initWithUniqueID:v5 destinationID:v6 expiryDate:v7];

  if (v8) {
    v8->_shouldSuppress = [(NavdDoomIncident *)self shouldSuppress];
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NavdDoomIncident *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(NavdDoomIncident *)self uniqueID];
      id v7 = [(NavdDoomIncident *)v5 uniqueID];
      if ([v6 isEqualToString:v7])
      {
        uint64_t v8 = [(NavdDoomIncident *)self destinationID];
        id v9 = [(NavdDoomIncident *)v5 destinationID];
        unsigned __int8 v10 = [v8 isEqualToString:v9];
      }
      else
      {
        unsigned __int8 v10 = 0;
      }
    }
    else
    {
      v11 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        int v13 = 136446978;
        v14 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/navd/Doom/NavdDoomIncident.mm";
        __int16 v15 = 1024;
        int v16 = 91;
        __int16 v17 = 2082;
        v18 = "-[NavdDoomIncident isEqual:]";
        __int16 v19 = 2082;
        v20 = "NO == [object isKindOfClass:[NavdDoomIncident class]]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Passed object is not an incident", (uint8_t *)&v13, 0x26u);
      }

      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [(NavdDoomIncident *)self uniqueID];
  id v4 = (char *)[v3 hash];

  v5 = [(NavdDoomIncident *)self destinationID];
  uint64_t v6 = &v4[(void)[v5 hash]];

  return (unint64_t)v6;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)NavdDoomIncident;
  v3 = [(NavdDoomIncident *)&v10 description];
  id v4 = [(NavdDoomIncident *)self uniqueID];
  v5 = [(NavdDoomIncident *)self destinationID];
  uint64_t v6 = [(NavdDoomIncident *)self expiryDate];
  id v7 = MapsSuggestionsStringFromDate();
  uint64_t v8 = +[NSString stringWithFormat:@"%@ uniqueID=%@ destinationID=%@ expiryDate=%@", v3, v4, v5, v7];

  return (NSString *)v8;
}

- (id)objectForJSON
{
  v12[0] = @"uniqueID";
  v3 = [(NavdDoomIncident *)self uniqueID];
  id v4 = MSg::jsonFor();
  v13[0] = v4;
  v12[1] = @"destinationID";
  v5 = [(NavdDoomIncident *)self destinationID];
  uint64_t v6 = MSg::jsonFor();
  v13[1] = v6;
  v12[2] = @"expiryDate";
  id v7 = [(NavdDoomIncident *)self expiryDate];
  id v9 = MSg::jsonFor(v7, v8);
  v13[2] = v9;
  objc_super v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];

  return v10;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (NSString)destinationID
{
  return self->_destinationID;
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (BOOL)shouldSuppress
{
  return self->_shouldSuppress;
}

- (void)setShouldSuppress:(BOOL)a3
{
  self->_shouldSuppress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_destinationID, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end