@interface WBSFrequentlyVistedSiteAnalyticsPayload
- (WBSFrequentlyVistedSiteAnalyticsPayload)initWithItemPosition:(unint64_t)a3 lastVisitedDate:(id)a4 score:(id)a5;
- (id)debugDescription;
- (id)eventDictionaryDescription;
@end

@implementation WBSFrequentlyVistedSiteAnalyticsPayload

- (WBSFrequentlyVistedSiteAnalyticsPayload)initWithItemPosition:(unint64_t)a3 lastVisitedDate:(id)a4 score:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WBSFrequentlyVistedSiteAnalyticsPayload;
  v11 = [(WBSFrequentlyVistedSiteAnalyticsPayload *)&v15 init];
  v12 = v11;
  if (v11)
  {
    v11->_itemPosition = a3;
    objc_storeStrong((id *)&v11->_lastVisitedDate, a4);
    objc_storeStrong((id *)&v12->_score, a5);
    v13 = v12;
  }

  return v12;
}

- (id)eventDictionaryDescription
{
  v12[3] = *MEMORY[0x1E4F143B8];
  if (self->_score)
  {
    v11[0] = @"position";
    v3 = [NSNumber numberWithUnsignedInteger:self->_itemPosition];
    v12[0] = v3;
    v11[1] = @"lastVisitedTimeInterval";
    v4 = [NSNumber numberWithUnsignedInteger:descriptionForTimeInterval(self->_lastVisitedDate)];
    v11[2] = @"score";
    score = self->_score;
    v12[1] = v4;
    v12[2] = score;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  }
  else
  {
    v9[0] = @"position";
    v3 = [NSNumber numberWithUnsignedInteger:self->_itemPosition];
    v9[1] = @"lastVisitedTimeInterval";
    v10[0] = v3;
    v4 = [NSNumber numberWithUnsignedInteger:descriptionForTimeInterval(self->_lastVisitedDate)];
    v10[1] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  }
  v7 = (void *)v6;

  return v7;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; item position = %lu; time interval since last visit = %@; score = %@>",
    v5,
    self,
    self->_itemPosition,
    self->_lastVisitedDate,
  uint64_t v6 = self->_score);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_lastVisitedDate, 0);
}

@end