@interface SSSoftwareUpdate
- (NSDate)installDate;
- (NSDictionary)updateDictionary;
- (NSString)bundleIdentifier;
- (SSSoftwareUpdate)initWithUpdateDictionary:(id)a3;
- (int64_t)parentalControlsRank;
- (int64_t)storeItemIdentifier;
- (int64_t)updateState;
- (void)dealloc;
- (void)setInstallDate:(id)a3;
- (void)setUpdateState:(int64_t)a3;
@end

@implementation SSSoftwareUpdate

- (SSSoftwareUpdate)initWithUpdateDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSSoftwareUpdate;
  v4 = [(SSSoftwareUpdate *)&v6 init];
  if (v4) {
    v4->_dictionary = (NSDictionary *)[a3 copy];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)SSSoftwareUpdate;
  [(SSSoftwareUpdate *)&v3 dealloc];
}

- (NSString)bundleIdentifier
{
  id v3 = [(NSDictionary *)self->_dictionary objectForKey:@"bundleId"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v3 = [(NSDictionary *)self->_dictionary objectForKey:@"bundle-id"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
  }
  id v4 = v3;
  return (NSString *)v4;
}

- (int64_t)parentalControlsRank
{
  id v3 = [(NSDictionary *)self->_dictionary objectForKey:@"contentRating"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = @"value";
    v5 = v3;
  }
  else
  {
    id v6 = [(NSDictionary *)self->_dictionary objectForKey:@"parental_control_attributes"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 0;
    }
    id v4 = @"rating-software";
    v5 = v6;
  }
  v7 = (void *)[v5 objectForKey:v4];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v7 integerValue];
}

- (int64_t)storeItemIdentifier
{
  id v2 = [(NSDictionary *)self->_dictionary objectForKey:@"id"];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v2 longLongValue];
}

- (NSDate)installDate
{
  return self->_installDate;
}

- (void)setInstallDate:(id)a3
{
}

- (NSDictionary)updateDictionary
{
  return self->_dictionary;
}

- (int64_t)updateState
{
  return self->_updateState;
}

- (void)setUpdateState:(int64_t)a3
{
  self->_updateState = a3;
}

@end