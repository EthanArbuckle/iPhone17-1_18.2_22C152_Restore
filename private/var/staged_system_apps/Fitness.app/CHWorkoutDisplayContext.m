@interface CHWorkoutDisplayContext
+ (BOOL)_screenIsLarge;
+ (id)_dayViewDisplayContext;
+ (id)_friendDetailDisplayContext;
+ (id)_workoutDetailDisplayContext;
+ (id)_workoutDetailOpenGoalDisplayContext;
+ (id)_workoutsListDisplayContext;
+ (id)displayContextWithName:(id)a3;
- (NSString)unitFormatString;
- (UIFont)dateFont;
- (UIFont)goalDescriptionFont;
- (UIFont)pace100UnitFont;
- (UIFont)valueFont;
- (UIFont)workoutTypeFont;
- (double)appIconWidth;
- (double)gymKitIconWidth;
- (double)ringDiameter;
- (double)ringThickness;
- (void)setAppIconWidth:(double)a3;
- (void)setDateFont:(id)a3;
- (void)setGoalDescriptionFont:(id)a3;
- (void)setGymKitIconWidth:(double)a3;
- (void)setPace100UnitFont:(id)a3;
- (void)setRingDiameter:(double)a3;
- (void)setRingThickness:(double)a3;
- (void)setUnitFormatString:(id)a3;
- (void)setValueFont:(id)a3;
- (void)setWorkoutTypeFont:(id)a3;
@end

@implementation CHWorkoutDisplayContext

+ (id)displayContextWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"DayViewDisplayContext"])
  {
    uint64_t v5 = [a1 _dayViewDisplayContext];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"WorkoutsListDisplayContext"]) {
    goto LABEL_4;
  }
  if ([v4 isEqualToString:@"FriendDetailDisplayContext"])
  {
    uint64_t v5 = [a1 _friendDetailDisplayContext];
  }
  else if ([v4 isEqualToString:@"WorkoutDetailDisplayContext"])
  {
    uint64_t v5 = [a1 _workoutDetailDisplayContext];
  }
  else
  {
    if (![v4 isEqualToString:@"WorkoutDetailOpenGoalDisplayContext"])
    {
LABEL_4:
      uint64_t v5 = [a1 _workoutsListDisplayContext];
      goto LABEL_11;
    }
    uint64_t v5 = [a1 _workoutDetailOpenGoalDisplayContext];
  }
LABEL_11:
  v6 = (void *)v5;

  return v6;
}

+ (id)_dayViewDisplayContext
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE410;
  block[3] = &unk_1008AB950;
  block[4] = a1;
  if (qword_10096B3C8 != -1) {
    dispatch_once(&qword_10096B3C8, block);
  }
  v2 = (void *)qword_10096B3C0;

  return v2;
}

+ (id)_workoutsListDisplayContext
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EE65C;
  block[3] = &unk_1008AB950;
  block[4] = a1;
  if (qword_10096B3D8 != -1) {
    dispatch_once(&qword_10096B3D8, block);
  }
  v2 = (void *)qword_10096B3D0;

  return v2;
}

+ (id)_friendDetailDisplayContext
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEA28;
  block[3] = &unk_1008AB950;
  block[4] = a1;
  if (qword_10096B3E8 != -1) {
    dispatch_once(&qword_10096B3E8, block);
  }
  v2 = (void *)qword_10096B3E0;

  return v2;
}

+ (BOOL)_screenIsLarge
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  BOOL v4 = v3 > 320.0;

  return v4;
}

+ (id)_workoutDetailDisplayContext
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EEDF8;
  block[3] = &unk_1008AB950;
  block[4] = a1;
  if (qword_10096B3F8 != -1) {
    dispatch_once(&qword_10096B3F8, block);
  }
  v2 = (void *)qword_10096B3F0;

  return v2;
}

+ (id)_workoutDetailOpenGoalDisplayContext
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EF17C;
  block[3] = &unk_1008AB950;
  block[4] = a1;
  if (qword_10096B408 != -1) {
    dispatch_once(&qword_10096B408, block);
  }
  v2 = (void *)qword_10096B400;

  return v2;
}

- (double)ringDiameter
{
  return self->_ringDiameter;
}

- (void)setRingDiameter:(double)a3
{
  self->_ringDiameter = a3;
}

- (double)ringThickness
{
  return self->_ringThickness;
}

- (void)setRingThickness:(double)a3
{
  self->_ringThickness = a3;
}

- (double)appIconWidth
{
  return self->_appIconWidth;
}

- (void)setAppIconWidth:(double)a3
{
  self->_appIconWidth = a3;
}

- (double)gymKitIconWidth
{
  return self->_gymKitIconWidth;
}

- (void)setGymKitIconWidth:(double)a3
{
  self->_gymKitIconWidth = a3;
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (void)setValueFont:(id)a3
{
}

- (UIFont)goalDescriptionFont
{
  return self->_goalDescriptionFont;
}

- (void)setGoalDescriptionFont:(id)a3
{
}

- (UIFont)pace100UnitFont
{
  return self->_pace100UnitFont;
}

- (void)setPace100UnitFont:(id)a3
{
}

- (UIFont)dateFont
{
  return self->_dateFont;
}

- (void)setDateFont:(id)a3
{
}

- (UIFont)workoutTypeFont
{
  return self->_workoutTypeFont;
}

- (void)setWorkoutTypeFont:(id)a3
{
}

- (NSString)unitFormatString
{
  return self->_unitFormatString;
}

- (void)setUnitFormatString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitFormatString, 0);
  objc_storeStrong((id *)&self->_workoutTypeFont, 0);
  objc_storeStrong((id *)&self->_dateFont, 0);
  objc_storeStrong((id *)&self->_pace100UnitFont, 0);
  objc_storeStrong((id *)&self->_goalDescriptionFont, 0);

  objc_storeStrong((id *)&self->_valueFont, 0);
}

@end