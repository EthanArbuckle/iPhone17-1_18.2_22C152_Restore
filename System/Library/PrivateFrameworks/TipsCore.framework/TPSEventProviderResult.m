@interface TPSEventProviderResult
- (NSDate)resultDate;
- (NSDictionary)observationMap;
- (NSDictionary)userInfo;
- (NSString)identifier;
- (id)bookmark;
- (id)debugDescription;
- (void)setBookmark:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setObservationMap:(id)a3;
- (void)setResultDate:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation TPSEventProviderResult

- (NSDictionary)observationMap
{
  return self->_observationMap;
}

- (void)setResultDate:(id)a3
{
}

- (void)setObservationMap:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_resultDate, 0);
  objc_storeStrong((id *)&self->_observationMap, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)debugDescription
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@", self];
  [v3 appendFormat:@"%@ = %@\n", @"identifier", self->_identifier];
  [v3 appendFormat:@"%@ = %@\n", @"ResultDate", self->_resultDate];
  [v3 appendFormat:@"%@ = %@\n", @"ObservationMap", self->_observationMap];
  [v3 appendFormat:@"%@ = %@\n", @"bookmark", self->_bookmark];
  [v3 appendFormat:@"%@ = %@\n", @"userInfo", self->_userInfo];
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDate)resultDate
{
  return self->_resultDate;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
}

- (id)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

@end