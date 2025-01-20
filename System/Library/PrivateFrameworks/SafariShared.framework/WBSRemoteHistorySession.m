@interface WBSRemoteHistorySession
+ (BOOL)supportsSecureCoding;
- (BOOL)isCurrentSession;
- (BOOL)isEqual:(id)a3;
- (NSArray)items;
- (NSDate)endDate;
- (NSDate)startDate;
- (WBSRemoteHistorySession)init;
- (WBSRemoteHistorySession)initWithCoder:(id)a3;
- (WBSRemoteHistorySession)initWithStartDate:(id)a3 endDate:(id)a4 items:(id)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSRemoteHistorySession

- (WBSRemoteHistorySession)init
{
  return 0;
}

- (WBSRemoteHistorySession)initWithStartDate:(id)a3 endDate:(id)a4 items:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WBSRemoteHistorySession;
  v12 = [(WBSRemoteHistorySession *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startDate, a3);
    objc_storeStrong((id *)&v13->_endDate, a4);
    uint64_t v14 = [v11 copy];
    items = v13->_items;
    v13->_items = (NSArray *)v14;

    v16 = v13;
  }

  return v13;
}

- (BOOL)isCurrentSession
{
  startDate = self->_startDate;
  v3 = [MEMORY[0x1E4F1C9C8] date];
  v4 = objc_msgSend(v3, "safari_startOfDay");
  LOBYTE(startDate) = [(NSDate *)startDate isEqualToDate:v4];

  return (char)startDate;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; startDate = %@; endDate = %@; items = %ld items>",
    v5,
    self,
    self->_startDate,
    self->_endDate,
  v6 = [(NSArray *)self->_items count]);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WBSRemoteHistorySession *)a3;
  if (v4 == self)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      startDate = self->_startDate;
      v6 = [(WBSRemoteHistorySession *)v4 startDate];
      if ([(NSDate *)startDate isEqualToDate:v6])
      {
        endDate = self->_endDate;
        v8 = [(WBSRemoteHistorySession *)v4 endDate];
        char v9 = [(NSDate *)endDate isEqualToDate:v8];
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDate *)self->_startDate hash];
  return [(NSDate *)self->_endDate hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSRemoteHistorySession)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  char v9 = [v7 setWithArray:v8];
  id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"items"];

  id v11 = [(WBSRemoteHistorySession *)self initWithStartDate:v5 endDate:v6 items:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  startDate = self->_startDate;
  id v5 = a3;
  [v5 encodeObject:startDate forKey:@"startDate"];
  [v5 encodeObject:self->_endDate forKey:@"endDate"];
  [v5 encodeObject:self->_items forKey:@"items"];
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end