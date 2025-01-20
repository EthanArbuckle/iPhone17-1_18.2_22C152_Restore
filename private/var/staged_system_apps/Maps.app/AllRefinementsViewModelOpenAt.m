@interface AllRefinementsViewModelOpenAt
- (AllRefinementsViewModelOpenAt)initWithDisplayName:(id)a3 timeStamp:(double)a4 isSelected:(BOOL)a5 isNextDay:(BOOL)a6 data:(id)a7;
- (BOOL)isNextDay;
- (BOOL)isSelected;
- (NSString)displayName;
- (double)timeStamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)data;
- (void)updateTimeStamp:(double)a3 isSelected:(BOOL)a4;
@end

@implementation AllRefinementsViewModelOpenAt

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AllRefinementsViewModelOpenAt alloc];
  v5 = [(AllRefinementsViewModelOpenAt *)self displayName];
  [(AllRefinementsViewModelOpenAt *)self timeStamp];
  double v7 = v6;
  BOOL v8 = [(AllRefinementsViewModelOpenAt *)self isSelected];
  BOOL v9 = [(AllRefinementsViewModelOpenAt *)self isNextDay];
  v10 = [(AllRefinementsViewModelOpenAt *)self data];
  v11 = [(AllRefinementsViewModelOpenAt *)v4 initWithDisplayName:v5 timeStamp:v8 isSelected:v9 isNextDay:v10 data:v7];

  return v11;
}

- (AllRefinementsViewModelOpenAt)initWithDisplayName:(id)a3 timeStamp:(double)a4 isSelected:(BOOL)a5 isNextDay:(BOOL)a6 data:(id)a7
{
  id v13 = a3;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)AllRefinementsViewModelOpenAt;
  v15 = [(AllRefinementsViewModelOpenAt *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_displayName, a3);
    v16->_isSelected = a5;
    v16->_timeStamp = a4;
    v16->_isNextDay = a6;
    objc_storeStrong(&v16->_data, a7);
  }

  return v16;
}

- (void)updateTimeStamp:(double)a3 isSelected:(BOOL)a4
{
  self->_isSelected = a4;
  self->_timeStamp = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (BOOL)isNextDay
{
  return self->_isNextDay;
}

- (id)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data, 0);

  objc_storeStrong((id *)&self->_displayName, 0);
}

@end