@interface PUTopPeopleWallpaperSuggestionsDistancingContext
- (PUTopPeopleWallpaperSuggestionsDistancingContext)init;
- (double)locationFactor;
- (double)locationPivot;
- (double)peopleFactor;
- (double)peoplePivot;
- (double)sceneprintFactor;
- (double)sceneprintPivot;
- (double)timeFactor;
- (double)timePivot;
- (id)dictionaryRepresentation;
- (unint64_t)maximumNumberOfSuggestionsWithPeople;
- (unint64_t)maximumNumberOfSuggestionsWithoutPeople;
- (void)setLocationFactor:(double)a3;
- (void)setLocationPivot:(double)a3;
- (void)setMaximumNumberOfSuggestionsWithPeople:(unint64_t)a3;
- (void)setMaximumNumberOfSuggestionsWithoutPeople:(unint64_t)a3;
- (void)setPeopleFactor:(double)a3;
- (void)setPeoplePivot:(double)a3;
- (void)setSceneprintFactor:(double)a3;
- (void)setSceneprintPivot:(double)a3;
- (void)setTimeFactor:(double)a3;
- (void)setTimePivot:(double)a3;
@end

@implementation PUTopPeopleWallpaperSuggestionsDistancingContext

- (void)setMaximumNumberOfSuggestionsWithoutPeople:(unint64_t)a3
{
  self->_maximumNumberOfSuggestionsWithoutPeople = a3;
}

- (unint64_t)maximumNumberOfSuggestionsWithoutPeople
{
  return self->_maximumNumberOfSuggestionsWithoutPeople;
}

- (void)setMaximumNumberOfSuggestionsWithPeople:(unint64_t)a3
{
  self->_maximumNumberOfSuggestionsWithPeople = a3;
}

- (unint64_t)maximumNumberOfSuggestionsWithPeople
{
  return self->_maximumNumberOfSuggestionsWithPeople;
}

- (void)setSceneprintFactor:(double)a3
{
  self->_sceneprintFactor = a3;
}

- (double)sceneprintFactor
{
  return self->_sceneprintFactor;
}

- (void)setPeopleFactor:(double)a3
{
  self->_peopleFactor = a3;
}

- (double)peopleFactor
{
  return self->_peopleFactor;
}

- (void)setLocationFactor:(double)a3
{
  self->_locationFactor = a3;
}

- (double)locationFactor
{
  return self->_locationFactor;
}

- (void)setTimeFactor:(double)a3
{
  self->_timeFactor = a3;
}

- (double)timeFactor
{
  return self->_timeFactor;
}

- (void)setSceneprintPivot:(double)a3
{
  self->_sceneprintPivot = a3;
}

- (double)sceneprintPivot
{
  return self->_sceneprintPivot;
}

- (void)setPeoplePivot:(double)a3
{
  self->_peoplePivot = a3;
}

- (double)peoplePivot
{
  return self->_peoplePivot;
}

- (void)setLocationPivot:(double)a3
{
  self->_locationPivot = a3;
}

- (double)locationPivot
{
  return self->_locationPivot;
}

- (void)setTimePivot:(double)a3
{
  self->_timePivot = a3;
}

- (double)timePivot
{
  return self->_timePivot;
}

- (id)dictionaryRepresentation
{
  v16[10] = *MEMORY[0x1E4F143B8];
  v15[0] = @"timePivot";
  v14 = [NSNumber numberWithDouble:self->_timePivot];
  v16[0] = v14;
  v15[1] = @"locationPivot";
  v3 = [NSNumber numberWithDouble:self->_locationPivot];
  v16[1] = v3;
  v15[2] = @"peoplePivot";
  v4 = [NSNumber numberWithDouble:self->_peoplePivot];
  v16[2] = v4;
  v15[3] = @"sceneprintPivot";
  v5 = [NSNumber numberWithDouble:self->_sceneprintPivot];
  v16[3] = v5;
  v15[4] = @"timeFactor";
  v6 = [NSNumber numberWithDouble:self->_timeFactor];
  v16[4] = v6;
  v15[5] = @"locationFactor";
  v7 = [NSNumber numberWithDouble:self->_locationFactor];
  v16[5] = v7;
  v15[6] = @"peopleFactor";
  v8 = [NSNumber numberWithDouble:self->_peopleFactor];
  v16[6] = v8;
  v15[7] = @"sceneprintFactor";
  v9 = [NSNumber numberWithDouble:self->_sceneprintFactor];
  v16[7] = v9;
  v15[8] = @"maximumNumberOfSuggestionsWithPeople";
  v10 = [NSNumber numberWithUnsignedInteger:self->_maximumNumberOfSuggestionsWithPeople];
  v16[8] = v10;
  v15[9] = @"maximumNumberOfSuggestionsWithoutPeople";
  v11 = [NSNumber numberWithUnsignedInteger:self->_maximumNumberOfSuggestionsWithoutPeople];
  v16[9] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:10];

  return v12;
}

- (PUTopPeopleWallpaperSuggestionsDistancingContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)PUTopPeopleWallpaperSuggestionsDistancingContext;
  result = [(PUTopPeopleWallpaperSuggestionsDistancingContext *)&v8 init];
  if (result)
  {
    *(_OWORD *)&result->_timePivot = xmmword_1AEFF7D10;
    *(_OWORD *)&result->_peoplePivot = xmmword_1AEFF7D20;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_timeFactor = _Q0;
    *(_OWORD *)&result->_peopleFactor = xmmword_1AEFF7D30;
    *(int64x2_t *)&result->_maximumNumberOfSuggestionsWithPeople = vdupq_n_s64(7uLL);
  }
  return result;
}

@end