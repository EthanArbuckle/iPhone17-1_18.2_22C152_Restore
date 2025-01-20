@interface PDRelevantPassGroup
- (NSArray)sortedPasses;
- (NSData)iconData;
- (NSSet)passes;
- (NSString)bodyText;
- (NSString)relevantText;
- (NSString)titleText;
- (PDCandidateRelevantPass)seedPass;
- (PDRelevantPassGroup)init;
- (PDRelevantPassGroup)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4;
- (id)_dateText;
- (void)_addCandidate:(id)a3;
- (void)_addCandidate:(id)a3 withRelevantText:(id)a4;
- (void)_recomputeSeedPass;
- (void)addCandidate:(id)a3 forBeacon:(id)a4;
- (void)addCandidate:(id)a3 forDate:(id)a4;
- (void)addCandidate:(id)a3 forLocation:(id)a4;
- (void)removeCandidate:(id)a3;
@end

@implementation PDRelevantPassGroup

- (PDRelevantPassGroup)init
{
  return 0;
}

- (PDRelevantPassGroup)initWithDatabaseManager:(id)a3 cardFileManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PDRelevantPassGroup;
  v9 = [(PDRelevantPassGroup *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseManager, a3);
    objc_storeStrong((id *)&v10->_cardFileManager, a4);
    v11 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    passes = v10->_passes;
    v10->_passes = v11;
  }
  return v10;
}

- (NSSet)passes
{
  return (NSSet *)self->_passes;
}

- (NSArray)sortedPasses
{
  id v2 = [(NSMutableSet *)self->_passes pk_mutableArrayCopy];
  [v2 sortUsingComparator:&stru_10074D5C8];
  return (NSArray *)v2;
}

- (NSData)iconData
{
  if (self->_seedPass)
  {
    databaseManager = self->_databaseManager;
    v5 = [(PDCandidateRelevantPass *)self->_seedPass uniqueIdentifier];
    v6 = [(PDDatabaseManager *)databaseManager passWithUniqueIdentifier:v5];

    id v7 = [v6 notificationIconImage];
    id v8 = +[NSData dataWithCGImage:PKPassNotificationIconImage()];
  }
  else
  {
    id v8 = 0;
  }
  return (NSData *)v8;
}

- (NSString)titleText
{
  return [(PDCandidateRelevantPass *)self->_seedPass organizationName];
}

- (NSString)bodyText
{
  v3 = [(PDRelevantPassGroup *)self _dateText];
  relevantText = v3;
  if (v3 || (relevantText = self->_relevantText) != 0)
  {
    v5 = relevantText;
  }
  else
  {
    PKLocalizedString(@"NEARBY");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSString)relevantText
{
  return self->_relevantText;
}

- (PDCandidateRelevantPass)seedPass
{
  return self->_seedPass;
}

- (id)_dateText
{
  relevantDate = self->_relevantDate;
  if (relevantDate)
  {
    v3 = relevantDate;
    id v4 = objc_alloc_init((Class)NSDateFormatter);
    v5 = [(PKPassRelevantDate *)v3 date];
    v6 = v5;
    if (v5)
    {
      if (([v5 isToday] & 1) != 0
        || ([v6 isTomorrow] & 1) != 0
        || [v6 isYesterday])
      {
        [v4 setDateStyle:3];
        [v4 setTimeStyle:1];
        [v4 setDoesRelativeDateFormatting:1];
      }
      else
      {
        [v4 setDateStyle:2];
        [v4 setTimeStyle:1];
      }
      id v7 = [v4 stringFromDate:v6];
    }
    else
    {
      v9 = [(PKPassRelevantDate *)v3 effectiveStartDate];
      v10 = [(PKPassRelevantDate *)v3 effectiveEndDate];
      id v7 = PKDateRangeStringFromDateToDate(v9, v10, 0, 0, 1);
    }
    id v8 = objc_msgSend(v7, "pk_uppercaseFirstStringForPreferredLocale");
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (void)addCandidate:(id)a3 forDate:(id)a4
{
  id v21 = a3;
  id v7 = a4;
  [(PDRelevantPassGroup *)self _addCandidate:v21];
  if (v7)
  {
    p_relevantDate = (id *)&self->_relevantDate;
    if (([v7 isEqual:self->_relevantDate] & 1) == 0)
    {
      if (!*p_relevantDate) {
        goto LABEL_13;
      }
      v9 = [*p_relevantDate effectiveEndDate];
      v10 = v9;
      if (v9)
      {
        [v9 timeIntervalSinceNow];
        double v12 = v11;
      }
      else
      {
        v13 = [*p_relevantDate date];
        [v13 timeIntervalSinceNow];
        double v12 = v14;
      }
      v15 = [v7 effectiveEndDate];
      v16 = v15;
      if (v15)
      {
        [v15 timeIntervalSinceNow];
        double v18 = v17;
      }
      else
      {
        v19 = [v7 date];
        [v19 timeIntervalSinceNow];
        double v18 = v20;
      }
      if ((id)[(PDCandidateRelevantPass *)self->_seedPass style] != (id)4 && v12 <= 0.0 == v18 > 0.0)
      {
        if (v18 <= 0.0) {
          goto LABEL_14;
        }
        goto LABEL_13;
      }
      if (fabs(v18) < fabs(v12))
      {
LABEL_13:
        objc_storeStrong((id *)&self->_relevantDate, a4);
        objc_storeStrong((id *)&self->_seedPass, a3);
      }
    }
  }
LABEL_14:
}

- (void)addCandidate:(id)a3 forLocation:(id)a4
{
  id v6 = a3;
  id v7 = [a4 relevantText];
  [(PDRelevantPassGroup *)self _addCandidate:v6 withRelevantText:v7];
}

- (void)addCandidate:(id)a3 forBeacon:(id)a4
{
  id v6 = a3;
  id v7 = [a4 relevantText];
  [(PDRelevantPassGroup *)self _addCandidate:v6 withRelevantText:v7];
}

- (void)_addCandidate:(id)a3 withRelevantText:(id)a4
{
  v13 = (PDCandidateRelevantPass *)a3;
  id v6 = a4;
  [(PDRelevantPassGroup *)self _addCandidate:v13];
  if (v13 && !self->_relevantText)
  {
    cardFileManager = self->_cardFileManager;
    id v8 = [(PDCandidateRelevantPass *)v13 uniqueIdentifier];
    v9 = [(PDCardFileManager *)cardFileManager dataAccessorForObjectWithUniqueID:v8];

    v10 = [v9 bundle];
    PKLocalizedPassStringForPassBundle();
    double v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    relevantText = self->_relevantText;
    self->_relevantText = v11;
  }
  if (self->_seedPass != v13) {
    [(PDRelevantPassGroup *)self _recomputeSeedPass];
  }
}

- (void)_addCandidate:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!self->_seedPass)
  {
    objc_storeStrong((id *)&self->_seedPass, a3);
    id v5 = v6;
  }
  [(NSMutableSet *)self->_passes addObject:v5];
}

- (void)removeCandidate:(id)a3
{
  passes = self->_passes;
  id v5 = (PDCandidateRelevantPass *)a3;
  [(NSMutableSet *)passes removeObject:v5];
  seedPass = self->_seedPass;

  if (seedPass == v5)
  {
    [(PDRelevantPassGroup *)self _recomputeSeedPass];
  }
}

- (void)_recomputeSeedPass
{
  v3 = [(NSMutableSet *)self->_passes allObjects];
  id v6 = [v3 sortedArrayUsingComparator:&stru_10074D5E8];

  id v4 = [v6 firstObject];
  seedPass = self->_seedPass;
  self->_seedPass = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevantText, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_seedPass, 0);
  objc_storeStrong((id *)&self->_cardFileManager, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
}

@end