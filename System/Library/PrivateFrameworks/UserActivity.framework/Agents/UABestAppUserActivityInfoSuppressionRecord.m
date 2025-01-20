@interface UABestAppUserActivityInfoSuppressionRecord
- (NSDate)hardSupressUntil;
- (NSDate)lastInterestingTime;
- (NSDate)supressUntil;
- (NSUUID)itemUUID;
- (id)description;
- (void)setHardSupressUntil:(id)a3;
- (void)setItemUUID:(id)a3;
- (void)setLastInterestingTime:(id)a3;
- (void)setSupressUntil:(id)a3;
@end

@implementation UABestAppUserActivityInfoSuppressionRecord

- (id)description
{
  v3 = [(UABestAppUserActivityInfoSuppressionRecord *)self itemUUID];
  v4 = [(UABestAppUserActivityInfoSuppressionRecord *)self hardSupressUntil];
  v5 = [(UABestAppUserActivityInfoSuppressionRecord *)self supressUntil];
  v6 = [(UABestAppUserActivityInfoSuppressionRecord *)self lastInterestingTime];
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"supressionRec(%@ hard=%@ until=%@ (lastInterestingTime=%@)"), v3, v4, v5, v6;

  return v7;
}

- (NSUUID)itemUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (void)setItemUUID:(id)a3
{
}

- (NSDate)hardSupressUntil
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setHardSupressUntil:(id)a3
{
}

- (NSDate)supressUntil
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSupressUntil:(id)a3
{
}

- (NSDate)lastInterestingTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLastInterestingTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastInterestingTime, 0);
  objc_storeStrong((id *)&self->_supressUntil, 0);
  objc_storeStrong((id *)&self->_hardSupressUntil, 0);

  objc_storeStrong((id *)&self->_itemUUID, 0);
}

@end