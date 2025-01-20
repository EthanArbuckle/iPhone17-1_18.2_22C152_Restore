@interface WBSHistoryVisitIdentifier
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)urlString;
- (WBSHistoryItem)associatedHistoryItem;
- (WBSHistoryVisit)associatedHistoryVisit;
- (WBSHistoryVisitIdentifier)initWithCoder:(id)a3;
- (WBSHistoryVisitIdentifier)initWithURLString:(id)a3 visitTime:(double)a4;
- (double)visitTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAssociatedHistoryItem:(id)a3;
- (void)setAssociatedHistoryVisit:(id)a3;
@end

@implementation WBSHistoryVisitIdentifier

- (WBSHistoryVisitIdentifier)initWithURLString:(id)a3 visitTime:(double)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSHistoryVisitIdentifier;
  v7 = [(WBSHistoryVisitIdentifier *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    urlString = v7->_urlString;
    v7->_urlString = (NSString *)v8;

    v7->_visitTime = a4;
    uint64_t v10 = [(NSString *)v7->_urlString hash];
    v11 = [NSNumber numberWithDouble:a4];
    v7->_hash = [v11 hash] ^ v10;

    v12 = v7;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  urlString = self->_urlString;
  double visitTime = self->_visitTime;
  return (id)[v4 initWithURLString:urlString visitTime:visitTime];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    double visitTime = self->_visitTime;
    [v5 visitTime];
    if (visitTime == v7)
    {
      urlString = self->_urlString;
      v9 = [v5 urlString];
      BOOL v10 = [(NSString *)urlString isEqualToString:v9];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; urlString = \"%@\"; double visitTime = %lf; associatedHistoryItem = %@; associatedHistoryVisit = %@>",
    v5,
    self,
    self->_urlString,
    *(void *)&self->_visitTime,
    self->_associatedHistoryItem,
  id v6 = self->_associatedHistoryVisit);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  urlString = self->_urlString;
  id v5 = a3;
  [v5 encodeObject:urlString forKey:@"urlString"];
  [v5 encodeDouble:@"visitTime" forKey:self->_visitTime];
}

- (WBSHistoryVisitIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSHistoryVisitIdentifier;
  id v5 = [(WBSHistoryVisitIdentifier *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"urlString"];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v6;

    [v4 decodeDoubleForKey:@"visitTime"];
    v5->_double visitTime = v8;
    uint64_t v9 = [(NSString *)v5->_urlString hash];
    BOOL v10 = [NSNumber numberWithDouble:v5->_visitTime];
    v5->_hash = [v10 hash] ^ v9;

    v11 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_hash;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (double)visitTime
{
  return self->_visitTime;
}

- (WBSHistoryItem)associatedHistoryItem
{
  return self->_associatedHistoryItem;
}

- (void)setAssociatedHistoryItem:(id)a3
{
}

- (WBSHistoryVisit)associatedHistoryVisit
{
  return self->_associatedHistoryVisit;
}

- (void)setAssociatedHistoryVisit:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedHistoryVisit, 0);
  objc_storeStrong((id *)&self->_associatedHistoryItem, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end