@interface PPDecayedFeedbackCounts
- (NSDate)latestDate;
- (PPDecayedFeedbackCounts)initWithLatestDate:(id)a3 engagedExplicitly:(double)a4 engagedImplicitly:(double)a5 rejectedExplicitly:(double)a6 rejectedImplicitly:(double)a7;
- (double)engagedExplicitly;
- (double)engagedImplicitly;
- (double)rejectedExplicitly;
- (double)rejectedImplicitly;
- (id)toDictionary;
@end

@implementation PPDecayedFeedbackCounts

- (void).cxx_destruct
{
}

- (NSDate)latestDate
{
  return self->_latestDate;
}

- (double)rejectedImplicitly
{
  return self->_rejectedImplicitly;
}

- (double)rejectedExplicitly
{
  return self->_rejectedExplicitly;
}

- (double)engagedImplicitly
{
  return self->_engagedImplicitly;
}

- (double)engagedExplicitly
{
  return self->_engagedExplicitly;
}

- (id)toDictionary
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = (void *)MEMORY[0x1CB79D060]([v3 setFormatOptions:275]);
  v13[0] = @"latestDate";
  latestDate = self->_latestDate;
  v6 = latestDate;
  if (!latestDate)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v6;
  v13[1] = @"engagedExplicitly";
  v7 = [NSNumber numberWithDouble:self->_engagedExplicitly];
  v14[1] = v7;
  v13[2] = @"engagedImplicitly";
  v8 = [NSNumber numberWithDouble:self->_engagedImplicitly];
  v14[2] = v8;
  v13[3] = @"rejectedExplicitly";
  v9 = [NSNumber numberWithDouble:self->_rejectedExplicitly];
  v14[3] = v9;
  v13[4] = @"rejectedImplicitly";
  v10 = [NSNumber numberWithDouble:self->_rejectedImplicitly];
  v14[4] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  if (!latestDate) {

  }
  return v11;
}

- (PPDecayedFeedbackCounts)initWithLatestDate:(id)a3 engagedExplicitly:(double)a4 engagedImplicitly:(double)a5 rejectedExplicitly:(double)a6 rejectedImplicitly:(double)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PPDecayedFeedbackCounts;
  v14 = [(PPDecayedFeedbackCounts *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_latestDate, a3);
    v15->_engagedExplicitly = a4;
    v15->_engagedImplicitly = a5;
    v15->_rejectedExplicitly = a6;
    v15->_rejectedImplicitly = a7;
  }

  return v15;
}

@end