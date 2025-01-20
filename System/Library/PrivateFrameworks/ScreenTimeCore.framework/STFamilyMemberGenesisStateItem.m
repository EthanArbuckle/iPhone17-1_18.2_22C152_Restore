@interface STFamilyMemberGenesisStateItem
+ (BOOL)supportsSecureCoding;
+ (int64_t)_validStateFromCurrentState:(int64_t)a3 desiredState:(int64_t)a4;
- (BOOL)expired;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFamilyMemberGenesisStateItem:(id)a3;
- (NSDate)creationDate;
- (STFamilyMemberGenesisStateItem)initWithCoder:(id)a3;
- (STFamilyMemberGenesisStateItem)initWithUserID:(id)a3 genesisState:(int64_t)a4;
- (STFamilyMemberGenesisStateItem)itemWithUpdatedState:(int64_t)a3;
- (STUserID)userID;
- (id)_initWithUserID:(id)a3 genesisState:(int64_t)a4 creationDate:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)genesisState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STFamilyMemberGenesisStateItem

- (STFamilyMemberGenesisStateItem)initWithUserID:(id)a3 genesisState:(int64_t)a4
{
  id v6 = a3;
  v7 = +[NSDate now];
  v8 = [(STFamilyMemberGenesisStateItem *)self _initWithUserID:v6 genesisState:a4 creationDate:v7];

  return v8;
}

- (id)_initWithUserID:(id)a3 genesisState:(int64_t)a4 creationDate:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)STFamilyMemberGenesisStateItem;
  id v7 = a5;
  id v8 = a3;
  v9 = [(STFamilyMemberGenesisStateItem *)&v15 init];
  v10 = (STUserID *)objc_msgSend(v8, "copy", v15.receiver, v15.super_class);

  userID = v9->_userID;
  v9->_userID = v10;

  v9->_genesisState = a4;
  v12 = (NSDate *)[v7 copy];

  creationDate = v9->_creationDate;
  v9->_creationDate = v12;

  return v9;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STFamilyMemberGenesisStateItem *)self userID];
  int64_t v5 = [(STFamilyMemberGenesisStateItem *)self genesisState];
  CFStringRef v6 = @"Pending";
  if (v5 == 1) {
    CFStringRef v6 = @"AwaitingResponse";
  }
  if (v5 == 2) {
    CFStringRef v7 = @"Done";
  }
  else {
    CFStringRef v7 = v6;
  }
  id v8 = [(STFamilyMemberGenesisStateItem *)self creationDate];
  v9 = +[NSString stringWithFormat:@"<%@ { UserID: %@, State: %@, Created: %@ }>", v3, v4, v7, v8];

  return v9;
}

- (STFamilyMemberGenesisStateItem)itemWithUpdatedState:(int64_t)a3
{
  int64_t v4 = +[STFamilyMemberGenesisStateItem _validStateFromCurrentState:[(STFamilyMemberGenesisStateItem *)self genesisState] desiredState:a3];
  int64_t v5 = [STFamilyMemberGenesisStateItem alloc];
  CFStringRef v6 = [(STFamilyMemberGenesisStateItem *)self userID];
  CFStringRef v7 = [(STFamilyMemberGenesisStateItem *)self creationDate];
  id v8 = [(STFamilyMemberGenesisStateItem *)v5 _initWithUserID:v6 genesisState:v4 creationDate:v7];

  return (STFamilyMemberGenesisStateItem *)v8;
}

+ (int64_t)_validStateFromCurrentState:(int64_t)a3 desiredState:(int64_t)a4
{
  int64_t v5 = a3;
  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (!a3 && (unint64_t)(a4 - 1) < 2) {
      return a4;
    }
  }
  else if (a4 == 2)
  {
    return 2;
  }
  CFStringRef v6 = +[STLog familyMemberGenesisStateStore];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"Pending";
    if (v5 == 1) {
      CFStringRef v8 = @"AwaitingResponse";
    }
    else {
      CFStringRef v8 = @"Pending";
    }
    if (v5 == 2) {
      CFStringRef v8 = @"Done";
    }
    if (a4 == 1) {
      CFStringRef v7 = @"AwaitingResponse";
    }
    if (a4 == 2) {
      CFStringRef v7 = @"Done";
    }
    int v10 = 138543618;
    CFStringRef v11 = v8;
    __int16 v12 = 2114;
    CFStringRef v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Could not transition state from: '%{public}@' to: '%{public}@'", (uint8_t *)&v10, 0x16u);
  }

  return v5;
}

- (BOOL)expired
{
  uint64_t v3 = +[NSDate now];
  int64_t v4 = [(STFamilyMemberGenesisStateItem *)self creationDate];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return v6 >= 2592000.0;
}

- (STFamilyMemberGenesisStateItem)initWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"userID"];
  id v6 = [v4 decodeIntegerForKey:@"genesisState"];
  [v4 decodeDoubleForKey:@"creationDate"];
  double v8 = v7;

  if (v8 == 0.0) {
    +[NSDate now];
  }
  else {
  v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v8];
  }
  int v10 = [(STFamilyMemberGenesisStateItem *)self _initWithUserID:v5 genesisState:v6 creationDate:v9];

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  userID = self->_userID;
  id v5 = a3;
  [v5 encodeObject:userID forKey:@"userID"];
  [v5 encodeInteger:self->_genesisState forKey:@"genesisState"];
  [(NSDate *)self->_creationDate timeIntervalSinceReferenceDate];
  objc_msgSend(v5, "encodeDouble:forKey:", @"creationDate");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  userID = self->_userID;
  int64_t genesisState = self->_genesisState;
  creationDate = self->_creationDate;
  return [v4 _initWithUserID:userID genesisState:genesisState creationDate:creationDate];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STFamilyMemberGenesisStateItem *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STFamilyMemberGenesisStateItem *)self isEqualToFamilyMemberGenesisStateItem:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToFamilyMemberGenesisStateItem:(id)a3
{
  id v4 = (STFamilyMemberGenesisStateItem *)a3;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    BOOL v5 = [(STFamilyMemberGenesisStateItem *)self userID];
    id v6 = [(STFamilyMemberGenesisStateItem *)v4 userID];
    if ([v5 isEqualToUserID:v6]
      && (double v7 = [(STFamilyMemberGenesisStateItem *)self genesisState],
          v7 == (void *)[(STFamilyMemberGenesisStateItem *)v4 genesisState]))
    {
      double v8 = [(STFamilyMemberGenesisStateItem *)self creationDate];
      v9 = [(STFamilyMemberGenesisStateItem *)v4 creationDate];
      unsigned __int8 v10 = [v8 isEqualToDate:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(STFamilyMemberGenesisStateItem *)self userID];
  unint64_t v4 = (unint64_t)[v3 hash];
  unint64_t v5 = [(STFamilyMemberGenesisStateItem *)self genesisState] ^ v4;
  id v6 = [(STFamilyMemberGenesisStateItem *)self creationDate];
  unint64_t v7 = v5 ^ (unint64_t)[v6 hash];

  return v7;
}

- (STUserID)userID
{
  return (STUserID *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)genesisState
{
  return self->_genesisState;
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_userID, 0);
}

@end