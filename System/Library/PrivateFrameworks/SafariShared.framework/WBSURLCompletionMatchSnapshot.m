@interface WBSURLCompletionMatchSnapshot
+ (BOOL)supportsSecureCoding;
- (BOOL)isSynthesizedTopHit;
- (BOOL)isTopHit;
- (BOOL)isTopHitDueToTriggerMatch;
- (NSDate)lastVisitTime;
- (NSString)description;
- (NSString)title;
- (NSString)userVisibleURLString;
- (NSURL)url;
- (WBSURLCompletionMatchSnapshot)init;
- (WBSURLCompletionMatchSnapshot)initWithCoder:(id)a3;
- (WBSURLCompletionMatchSnapshot)initWithURL:(id)a3 title:(id)a4 matchLocation:(int64_t)a5 isTopHit:(BOOL)a6 isSynthesizedTopHit:(BOOL)a7 isTopHitDueToTriggerMatch:(BOOL)a8 visitCount:(int64_t)a9 lastVisitTime:(id)a10;
- (int64_t)matchLocation;
- (int64_t)visitCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSURLCompletionMatchSnapshot

- (WBSURLCompletionMatchSnapshot)init
{
  return 0;
}

- (WBSURLCompletionMatchSnapshot)initWithURL:(id)a3 title:(id)a4 matchLocation:(int64_t)a5 isTopHit:(BOOL)a6 isSynthesizedTopHit:(BOOL)a7 isTopHitDueToTriggerMatch:(BOOL)a8 visitCount:(int64_t)a9 lastVisitTime:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a10;
  v28.receiver = self;
  v28.super_class = (Class)WBSURLCompletionMatchSnapshot;
  v19 = [(WBSURLCompletionMatchSnapshot *)&v28 init];
  if (v19)
  {
    uint64_t v20 = [v16 copy];
    url = v19->_url;
    v19->_url = (NSURL *)v20;

    uint64_t v22 = [v17 copy];
    title = v19->_title;
    v19->_title = (NSString *)v22;

    uint64_t v24 = [(NSURL *)v19->_url safari_userVisibleString];
    userVisibleURLString = v19->_userVisibleURLString;
    v19->_userVisibleURLString = (NSString *)v24;

    v19->_topHit = a6;
    v19->_synthesizedTopHit = a7;
    v19->_topHitDueToTriggerMatch = a8;
    v19->_matchLocation = a5;
    v19->_visitCount = a9;
    objc_storeStrong((id *)&v19->_lastVisitTime, a10);
    v26 = v19;
  }

  return v19;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; url = \"%@\"; title = \"%@\"; matchLocation = %d; topHit = %d; synthesizedTopHit = %d; topHitDueToTriggerMatch = %d; visitCount = %ld; lastVisitTime = %@>",
    v5,
    self,
    self->_url,
    self->_title,
    self->_matchLocation,
    self->_topHit,
    self->_synthesizedTopHit,
    self->_topHitDueToTriggerMatch,
    self->_visitCount,
  v6 = self->_lastVisitTime);

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSURLCompletionMatchSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"matchLocation"];
  uint64_t v8 = [v4 decodeBoolForKey:@"topHit"];
  uint64_t v9 = [v4 decodeBoolForKey:@"synthesizedTopHit"];
  uint64_t v10 = [v4 decodeBoolForKey:@"topHitDueToTriggerMatch"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"visitCount"];
  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastVisitTime"];

  v13 = [(WBSURLCompletionMatchSnapshot *)self initWithURL:v5 title:v6 matchLocation:v7 isTopHit:v8 isSynthesizedTopHit:v9 isTopHitDueToTriggerMatch:v10 visitCount:v11 lastVisitTime:v12];
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  url = self->_url;
  id v5 = a3;
  [v5 encodeObject:url forKey:@"url"];
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeInteger:self->_matchLocation forKey:@"matchLocation"];
  [v5 encodeBool:self->_topHit forKey:@"topHit"];
  [v5 encodeBool:self->_synthesizedTopHit forKey:@"synthesizedTopHit"];
  [v5 encodeBool:self->_topHitDueToTriggerMatch forKey:@"topHitDueToTriggerMatch"];
  [v5 encodeInteger:self->_visitCount forKey:@"visitCount"];
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

- (NSString)userVisibleURLString
{
  return self->_userVisibleURLString;
}

- (int64_t)matchLocation
{
  return self->_matchLocation;
}

- (BOOL)isTopHit
{
  return self->_topHit;
}

- (BOOL)isSynthesizedTopHit
{
  return self->_synthesizedTopHit;
}

- (BOOL)isTopHitDueToTriggerMatch
{
  return self->_topHitDueToTriggerMatch;
}

- (int64_t)visitCount
{
  return self->_visitCount;
}

- (NSDate)lastVisitTime
{
  return self->_lastVisitTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastVisitTime, 0);
  objc_storeStrong((id *)&self->_userVisibleURLString, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end