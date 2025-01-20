@interface PPTripEvent
+ (BOOL)supportsSecureCoding;
- (NSArray)tripParts;
- (PPTripEvent)initWithCoder:(id)a3;
- (PPTripEvent)initWithStartDate:(id)a3 endDate:(id)a4 tripParts:(id)a5;
- (id)description;
- (id)destinations;
- (id)destinationsBasedTitle;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPTripEvent

- (void).cxx_destruct
{
}

- (NSArray)tripParts
{
  return self->_tripParts;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(PPScoredEvent *)self title];
  v5 = (void *)[v3 initWithFormat:@"<PPTripEvent t:'%@'>", v4];

  return v5;
}

- (id)destinationsBasedTitle
{
  id v3 = objc_opt_new();
  [v3 setDateFormat:@"MMM d, yyyy"];
  v4 = [(PPScoredEvent *)self startDate];
  v5 = [v3 stringFromDate:v4];

  v6 = [(PPScoredEvent *)self endDate];
  v7 = [v3 stringFromDate:v6];

  id v8 = [NSString alloc];
  v9 = [(PPTripEvent *)self destinations];
  v10 = objc_msgSend(v9, "_pas_componentsJoinedByString:", @" ");;
  v11 = (void *)[v8 initWithFormat:@"Trip to %@ - %@ to %@", v10, v5, v7];

  return v11;
}

- (id)destinations
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_tripParts;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "destinationString", (void)v11);
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PPTripEvent;
  id v4 = a3;
  [(PPScoredEvent *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_tripParts, @"tps", v5.receiver, v5.super_class);
}

- (PPTripEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPTripEvent;
  objc_super v5 = [(PPScoredEvent *)&v13 initWithCoder:v4];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = (void *)MEMORY[0x192F97350]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"tps"];

  if (v10)
  {
    tripParts = v5->_tripParts;
    v5->_tripParts = (NSArray *)v10;

LABEL_4:
    v10 = v5;
  }

  return v10;
}

- (PPTripEvent)initWithStartDate:(id)a3 endDate:(id)a4 tripParts:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PPTripEvent;
  v10 = [(PPScoredEvent *)&v14 initWithStartDate:a3 endDate:a4 title:0 score:1.0];
  long long v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_tripParts, a5);
    long long v12 = [(PPTripEvent *)v11 destinationsBasedTitle];
    [(PPScoredEvent *)v11 setTitle:v12];
  }
  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end