@interface SCLRecurrenceSchedule
+ (BOOL)supportsSecureCoding;
+ (void)performBlockWithSharedFormatter:(id)a3;
- (BOOL)isEqual:(id)a3;
- (SCLRecurrenceSchedule)init;
- (SCLRecurrenceSchedule)initWithCoder:(id)a3;
- (SCLRecurrenceSchedule)initWithRecurrences:(id)a3;
- (SCLRecurrenceSchedule)initWithTimeIntervals:(id)a3 repeatSchedule:(int64_t)a4;
- (id)description;
- (id)recurrences;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCLRecurrenceSchedule

+ (void)performBlockWithSharedFormatter:(id)a3
{
  uint64_t v3 = performBlockWithSharedFormatter__onceToken;
  v4 = (void (**)(id, uint64_t))a3;
  if (v3 != -1) {
    dispatch_once(&performBlockWithSharedFormatter__onceToken, &__block_literal_global_9);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&performBlockWithSharedFormatter____sharedFormatterLock);
  v4[2](v4, performBlockWithSharedFormatter____sharedFormatter);

  os_unfair_lock_unlock((os_unfair_lock_t)&performBlockWithSharedFormatter____sharedFormatterLock);
}

void __57__SCLRecurrenceSchedule_performBlockWithSharedFormatter___block_invoke()
{
  v0 = objc_alloc_init(SCLScheduleFormatter);
  v1 = (void *)performBlockWithSharedFormatter____sharedFormatter;
  performBlockWithSharedFormatter____sharedFormatter = (uint64_t)v0;

  performBlockWithSharedFormatter____sharedFormatterLock = 0;
}

- (SCLRecurrenceSchedule)init
{
  return [(SCLRecurrenceSchedule *)self initWithRecurrences:MEMORY[0x263EFFA68]];
}

- (SCLRecurrenceSchedule)initWithRecurrences:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCLRecurrenceSchedule;
  v5 = [(SCLRecurrenceSchedule *)&v10 init];
  if (v5)
  {
    v6 = +[SCLScheduleRecurrence dayOfWeekAndStartTimeComparator];
    uint64_t v7 = [v4 sortedArrayUsingComparator:v6];
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v7;
  }
  return v5;
}

- (id)recurrences
{
  return self->_recurrences;
}

- (unint64_t)hash
{
  v2 = [(SCLRecurrenceSchedule *)self recurrences];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SCLRecurrenceSchedule *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(SCLRecurrenceSchedule *)self recurrences];
      v6 = [(SCLRecurrenceSchedule *)v4 recurrences];
      char v7 = [v5 isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  id v15 = 0;
  unint64_t v3 = objc_opt_class();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__SCLRecurrenceSchedule_description__block_invoke;
  v9[3] = &unk_2648ACA70;
  v9[4] = self;
  v9[5] = &v10;
  [v3 performBlockWithSharedFormatter:v9];
  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  char v7 = [v4 stringWithFormat:@"<%@ %p; %@>", v6, self, v11[5]];

  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __36__SCLRecurrenceSchedule_description__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 stringFromSchedule:*(void *)(a1 + 32)];
  return MEMORY[0x270F9A758]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLRecurrenceSchedule)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCLRecurrenceSchedule;
  v5 = [(SCLRecurrenceSchedule *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"recurrences"];
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

- (SCLRecurrenceSchedule)initWithTimeIntervals:(id)a3 repeatSchedule:(int64_t)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * v11);
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __93__SCLRecurrenceSchedule_SCLRecurrenceScheduleCreation__initWithTimeIntervals_repeatSchedule___block_invoke;
        v16[3] = &unk_2648AC338;
        id v17 = v6;
        uint64_t v18 = v12;
        SCLEnumerateDaysInRepeatSchedule(a4, (uint64_t)v16);

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }

  v13 = [(SCLRecurrenceSchedule *)self initWithRecurrences:v6];
  return v13;
}

void __93__SCLRecurrenceSchedule_SCLRecurrenceScheduleCreation__initWithTimeIntervals_repeatSchedule___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [[SCLScheduleRecurrence alloc] initWithTimeInterval:*(void *)(a1 + 40) day:a2];
  [v2 addObject:v3];
}

@end