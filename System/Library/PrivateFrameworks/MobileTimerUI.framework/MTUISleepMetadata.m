@interface MTUISleepMetadata
- (BOOL)displaysTime;
- (NSDateComponents)alarmComponents;
- (NSString)detailedDescription;
- (NSString)mainDescription;
- (void)setAlarmComponents:(id)a3;
- (void)setDetailedDescription:(id)a3;
- (void)setDisplaysTime:(BOOL)a3;
- (void)setMainDescription:(id)a3;
@end

@implementation MTUISleepMetadata

- (NSString)detailedDescription
{
  return self->_detailedDescription;
}

- (void)setDetailedDescription:(id)a3
{
}

- (NSString)mainDescription
{
  return self->_mainDescription;
}

- (void)setMainDescription:(id)a3
{
}

- (NSDateComponents)alarmComponents
{
  return self->_alarmComponents;
}

- (void)setAlarmComponents:(id)a3
{
}

- (BOOL)displaysTime
{
  return self->_displaysTime;
}

- (void)setDisplaysTime:(BOOL)a3
{
  self->_displaysTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmComponents, 0);
  objc_storeStrong((id *)&self->_mainDescription, 0);

  objc_storeStrong((id *)&self->_detailedDescription, 0);
}

@end