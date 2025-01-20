@interface WBSRemoteHistoryVisit
+ (BOOL)supportsSecureCoding;
- (NSDate)date;
- (NSURL)url;
- (WBSRemoteHistoryVisit)init;
- (WBSRemoteHistoryVisit)initWithCoder:(id)a3;
- (WBSRemoteHistoryVisit)initWithURL:(id)a3 date:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSRemoteHistoryVisit

- (WBSRemoteHistoryVisit)init
{
  return 0;
}

- (WBSRemoteHistoryVisit)initWithURL:(id)a3 date:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSRemoteHistoryVisit;
  v9 = [(WBSRemoteHistoryVisit *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_date, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p url = %@; date = %@>", v5, self, self->_url, self->_date];;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSRemoteHistoryVisit)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];

  id v7 = [(WBSRemoteHistoryVisit *)self initWithURL:v5 date:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_date forKey:@"date"];
}

- (NSURL)url
{
  return self->_url;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end