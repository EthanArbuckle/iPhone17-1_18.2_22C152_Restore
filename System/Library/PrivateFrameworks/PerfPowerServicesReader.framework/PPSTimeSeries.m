@interface PPSTimeSeries
+ (BOOL)supportsSecureCoding;
- (BOOL)containsEvent:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTimeSeries:(id)a3;
- (NSArray)allTimestamps;
- (NSArray)array;
- (PPSEvent)firstObject;
- (PPSEvent)lastObject;
- (PPSTimeSeries)init;
- (PPSTimeSeries)initWithCoder:(id)a3;
- (PPSTimeSeries)initWithEvents:(id)a3;
- (id)JSONRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)countMapWithBlock:(id)a3 groupingDimensions:(id)a4;
- (id)countWithBlock:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)filteredTimeSeriesUsingPredicate:(id)a3;
- (id)metricValuesForKey:(id)a3;
- (id)objectEnumerator;
- (id)reverseObjectEnumerator;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)JSONRepresentation;
- (void)_guaranteeSortedness;
- (void)addEvent:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)mergeWithTimeSeries:(id)a3;
- (void)removeAllEvents;
- (void)removeEvent:(id)a3;
@end

@implementation PPSTimeSeries

- (id)countWithBlock:(id)a3
{
  return +[PPSCountGenerator countWithTimeSeries:self block:a3];
}

- (id)countMapWithBlock:(id)a3 groupingDimensions:(id)a4
{
  return +[PPSCountGenerator countMapWithTimeSeries:self block:a3 groupingDimensions:a4];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[PPSTimeSeries allocWithZone:a3];
  events = self->_events;
  return [(PPSTimeSeries *)v4 initWithEvents:events];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(PPSTimeSeries *)self _guaranteeSortedness];
  [v4 encodeBool:self->_isSorted forKey:@"isSorted"];
  [v4 encodeObject:self->_sortHint forKey:@"sortHint"];
  [v4 encodeObject:self->_events forKey:@"events"];
}

- (PPSTimeSeries)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PPSTimeSeries;
  v5 = [(PPSTimeSeries *)&v14 init];
  if (v5)
  {
    v5->_isSorted = [v4 decodeBoolForKey:@"isSorted"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sortHint"];
    sortHint = v5->_sortHint;
    v5->_sortHint = (NSData *)v6;

    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"events"];
    events = v5->_events;
    v5->_events = (NSMutableArray *)v11;

    [(PPSTimeSeries *)v5 _guaranteeSortedness];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  [(PPSTimeSeries *)self _guaranteeSortedness];
  events = self->_events;
  return [(NSMutableArray *)events countByEnumeratingWithState:a3 objects:a4 count:a5];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  [(PPSTimeSeries *)self _guaranteeSortedness];
  [(NSMutableArray *)self->_events enumerateObjectsUsingBlock:v4];
}

- (id)objectEnumerator
{
  [(PPSTimeSeries *)self _guaranteeSortedness];
  events = self->_events;
  return (id)[(NSMutableArray *)events objectEnumerator];
}

- (id)reverseObjectEnumerator
{
  [(PPSTimeSeries *)self _guaranteeSortedness];
  events = self->_events;
  return (id)[(NSMutableArray *)events reverseObjectEnumerator];
}

- (PPSTimeSeries)init
{
  v6.receiver = self;
  v6.super_class = (Class)PPSTimeSeries;
  v2 = [(PPSTimeSeries *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF980] array];
    events = v2->_events;
    v2->_events = (NSMutableArray *)v3;

    v2->_isSorted = 1;
  }
  return v2;
}

- (PPSTimeSeries)initWithEvents:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPSTimeSeries;
  v5 = [(PPSTimeSeries *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    events = v5->_events;
    v5->_events = (NSMutableArray *)v6;

    v5->_isSorted = 0;
    [(PPSTimeSeries *)v5 _guaranteeSortedness];
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    unsigned __int8 v6 = [(PPSTimeSeries *)self isEqualToTimeSeries:v4];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PPSTimeSeries;
    unsigned __int8 v6 = [(PPSTimeSeries *)&v9 isEqual:v4];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)isEqualToTimeSeries:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v4 = a3;
  [(PPSTimeSeries *)self _guaranteeSortedness];
  events = self->_events;
  unsigned __int8 v6 = (void *)v4[4];

  BOOL v7 = (void *)[v6 copy];
  LOBYTE(events) = [(NSMutableArray *)events isEqualToArray:v7];

  return (char)events;
}

- (NSArray)allTimestamps
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(PPSTimeSeries *)self _guaranteeSortedness];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSMutableArray count](self->_events, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_events;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = NSNumber;
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "monotonicTimestamp", (void)v13);
        v10 = objc_msgSend(v9, "numberWithDouble:");
        [v3 addObject:v10];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v11 = (void *)[v3 copy];
  return (NSArray *)v11;
}

- (NSArray)array
{
  [(PPSTimeSeries *)self _guaranteeSortedness];
  uint64_t v3 = (void *)[(NSMutableArray *)self->_events copy];
  return (NSArray *)v3;
}

- (unint64_t)count
{
  return [(NSMutableArray *)self->_events count];
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@ %p> count=%lu", v5, self, -[PPSTimeSeries count](self, "count")];

  return v6;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(PPSTimeSeries *)self _guaranteeSortedness];
  uint64_t v3 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", @"(");
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_events;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        objc_super v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) description];
        [v3 appendFormat:@"\n%@,", v9];
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@"\n"]);
  return v3;
}

- (PPSEvent)firstObject
{
  [(PPSTimeSeries *)self _guaranteeSortedness];
  events = self->_events;
  return (PPSEvent *)[(NSMutableArray *)events firstObject];
}

- (unint64_t)hash
{
  [(PPSTimeSeries *)self _guaranteeSortedness];
  events = self->_events;
  return [(NSMutableArray *)events hash];
}

- (PPSEvent)lastObject
{
  [(PPSTimeSeries *)self _guaranteeSortedness];
  events = self->_events;
  return (PPSEvent *)[(NSMutableArray *)events lastObject];
}

- (id)JSONRepresentation
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x25A2D4DD0](self, a2);
  [(PPSTimeSeries *)self _guaranteeSortedness];
  id v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[PPSTimeSeries count](self, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = self->_events;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  id v15 = 0;
  long long v11 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:1 error:&v15];
  id v12 = v15;
  if (v12)
  {
    long long v13 = PPSReaderLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      [(PPSTimeSeries *)(uint64_t)v12 JSONRepresentation];
    }
  }
  return v11;
}

- (void)addEvent:(id)a3
{
  self->_isSorted = 0;
}

- (BOOL)containsEvent:(id)a3
{
  return [(NSMutableArray *)self->_events containsObject:a3];
}

- (id)filteredTimeSeriesUsingPredicate:(id)a3
{
  uint64_t v3 = [(NSMutableArray *)self->_events filteredArrayUsingPredicate:a3];
  id v4 = [[PPSTimeSeries alloc] initWithEvents:v3];

  return v4;
}

- (void)mergeWithTimeSeries:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(NSMutableArray *)self->_events addObject:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  self->_isSorted = 0;
}

- (id)metricValuesForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![(NSMutableArray *)self->_events count])
  {
    uint64_t v14 = 0;
    goto LABEL_18;
  }
  [(PPSTimeSeries *)self _guaranteeSortedness];
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = self->_events;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v7)
  {

LABEL_16:
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v6);
      }
      long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "metricValueForKey:", v4, (void)v16);
      if (v12)
      {
        [v5 addObject:v12];
        char v9 = 1;
      }
      else
      {
        long long v13 = [MEMORY[0x263EFF9D0] null];
        [v5 addObject:v13];
      }
    }
    uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v8);

  if ((v9 & 1) == 0) {
    goto LABEL_16;
  }
  uint64_t v14 = (void *)[v5 copy];
LABEL_17:

LABEL_18:
  return v14;
}

- (void)removeAllEvents
{
}

- (void)removeEvent:(id)a3
{
}

- (void)_guaranteeSortedness
{
  if (!self->_isSorted)
  {
    uint64_t v3 = (void *)MEMORY[0x25A2D4DD0]();
    events = self->_events;
    if (self->_sortHint) {
      -[NSMutableArray sortedArrayUsingFunction:context:hint:](events, "sortedArrayUsingFunction:context:hint:", _eventSortComparator, 0);
    }
    else {
    uint64_t v5 = [(NSMutableArray *)events sortedArrayUsingSelector:sel_compare_];
    }
    uint64_t v6 = (NSMutableArray *)[v5 mutableCopy];
    uint64_t v7 = self->_events;
    self->_events = v6;

    uint64_t v8 = [(NSMutableArray *)self->_events sortedArrayHint];
    sortHint = self->_sortHint;
    self->_sortHint = v8;

    self->_isSorted = 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_sortHint, 0);
}

- (void)JSONRepresentation
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_258F16000, a2, OS_LOG_TYPE_DEBUG, "Error while parsing JSON data: %@", (uint8_t *)&v2, 0xCu);
}

@end