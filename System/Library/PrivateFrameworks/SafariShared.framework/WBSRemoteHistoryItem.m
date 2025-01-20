@interface WBSRemoteHistoryItem
+ (BOOL)supportsSecureCoding;
- (NSDate)lastVisitTime;
- (NSString)title;
- (NSURL)url;
- (WBSRemoteHistoryItem)init;
- (WBSRemoteHistoryItem)initWithCoder:(id)a3;
- (WBSRemoteHistoryItem)initWithURL:(id)a3 title:(id)a4 lastVisitTime:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSRemoteHistoryItem

- (WBSRemoteHistoryItem)init
{
  return 0;
}

- (WBSRemoteHistoryItem)initWithURL:(id)a3 title:(id)a4 lastVisitTime:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WBSRemoteHistoryItem;
  v12 = [(WBSRemoteHistoryItem *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    uint64_t v14 = [v10 copy];
    title = v13->_title;
    v13->_title = (NSString *)v14;

    objc_storeStrong((id *)&v13->_lastVisitTime, a5);
    v16 = v13;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; url = %@; title = %@; lastVisitTime = %@>",
    v5,
    self,
    self->_url,
    self->_title,
  v6 = self->_lastVisitTime);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSRemoteHistoryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastVisitTime"];

  v8 = [(WBSRemoteHistoryItem *)self initWithURL:v5 title:v6 lastVisitTime:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_lastVisitTime forKey:@"lastVisitTime"];
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)lastVisitTime
{
  return self->_lastVisitTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastVisitTime, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end