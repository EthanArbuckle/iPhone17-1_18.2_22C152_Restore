@interface ATXPOICategoryVisitEvent
- (ATXPOICategoryVisitEvent)initWithPossibleCategoryNames:(id)a3 startDate:(id)a4 endDate:(id)a5 hasExited:(BOOL)a6;
- (BOOL)hasExited;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXPOICategoryVisitEvent:(id)a3;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSOrderedSet)possibleCategoryNames;
- (id)description;
- (id)identifier;
@end

@implementation ATXPOICategoryVisitEvent

- (ATXPOICategoryVisitEvent)initWithPossibleCategoryNames:(id)a3 startDate:(id)a4 endDate:(id)a5 hasExited:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)ATXPOICategoryVisitEvent;
  v14 = [(ATXPOICategoryVisitEvent *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_startDate, a4);
    objc_storeStrong((id *)&v15->_endDate, a5);
    objc_storeStrong((id *)&v15->_possibleCategoryNames, a3);
    v15->_hasExited = a6;
  }

  return v15;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(ATXPOICategoryVisitEvent *)self possibleCategoryNames];
  v5 = [(ATXPOICategoryVisitEvent *)self startDate];
  v6 = [(ATXPOICategoryVisitEvent *)self endDate];
  v7 = (void *)[v3 initWithFormat:@"ATXPOICategoryVisitEvent categories: %@, startDate: %@, endDate: %@ hasExited: %d", v4, v5, v6, -[ATXPOICategoryVisitEvent hasExited](self, "hasExited")];

  return v7;
}

- (id)identifier
{
  id v3 = [(ATXPOICategoryVisitEvent *)self possibleCategoryNames];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [NSString alloc];
    v6 = [(ATXPOICategoryVisitEvent *)self possibleCategoryNames];
    v7 = [v6 objectAtIndexedSubscript:0];
    v8 = (__CFString *)[v5 initWithFormat:@"%@", v7];
  }
  else
  {
    v8 = @"unknown";
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ATXPOICategoryVisitEvent *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXPOICategoryVisitEvent *)self isEqualToATXPOICategoryVisitEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXPOICategoryVisitEvent:(id)a3
{
  uint64_t v4 = (id *)a3;
  possibleCategoryNames = self->_possibleCategoryNames;
  BOOL v6 = (NSOrderedSet *)v4[4];
  if (possibleCategoryNames == v6)
  {
  }
  else
  {
    v7 = v6;
    v8 = possibleCategoryNames;
    char v9 = [(NSOrderedSet *)v8 isEqual:v7];

    if ((v9 & 1) == 0)
    {
      char v10 = 0;
      goto LABEL_9;
    }
  }
  id v11 = [(ATXPOICategoryVisitEvent *)self startDate];
  id v12 = [v4 startDate];
  if ([v11 isEqualToDate:v12])
  {
    id v13 = [(ATXPOICategoryVisitEvent *)self endDate];
    v14 = [v4 endDate];
    char v10 = [v13 isEqualToDate:v14];
  }
  else
  {
    char v10 = 0;
  }

LABEL_9:
  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSOrderedSet)possibleCategoryNames
{
  return self->_possibleCategoryNames;
}

- (BOOL)hasExited
{
  return self->_hasExited;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleCategoryNames, 0);
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end