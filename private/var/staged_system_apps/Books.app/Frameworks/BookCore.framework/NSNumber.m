@interface NSNumber
- (id)bc_assertClampedToMinimum:(id)a3 maximum:(id)a4;
- (id)bc_assertClampedToUnitInterval;
- (id)bc_clampedToMinimum:(id)a3 maximum:(id)a4;
- (id)bc_clampedToMinimum:(id)a3 maximum:(id)a4 orSubstitute:(id)a5;
- (id)bc_clampedToUnitIntervalOrNegativeOne;
@end

@implementation NSNumber

- (id)bc_clampedToMinimum:(id)a3 maximum:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  if ([(NSNumber *)v8 compare:v6] == NSOrderedAscending)
  {
    v9 = (NSNumber *)v6;

    v8 = v9;
  }
  if ((char *)[(NSNumber *)v8 compare:v7] == (char *)&def_7D91C + 1)
  {
    v10 = (NSNumber *)v7;

    v8 = v10;
  }

  return v8;
}

- (id)bc_assertClampedToMinimum:(id)a3 maximum:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(NSNumber *)self compare:v6] == NSOrderedAscending
     || (char *)[(NSNumber *)self compare:v7] == (char *)&def_7D91C + 1)
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_1F0D4C((uint64_t)v6, (uint64_t)v7, (uint64_t)self);
  }
  v8 = [(NSNumber *)self bc_clampedToMinimum:v6 maximum:v7];

  return v8;
}

- (id)bc_clampedToMinimum:(id)a3 maximum:(id)a4 orSubstitute:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = self;
  if ([(NSNumber *)v10 compare:a3] == NSOrderedAscending
    || (char *)[(NSNumber *)v10 compare:v8] == (char *)&def_7D91C + 1)
  {
    v11 = (NSNumber *)v9;

    v10 = v11;
  }

  return v10;
}

- (id)bc_assertClampedToUnitInterval
{
  return [(NSNumber *)self bc_assertClampedToMinimum:&off_2E2640 maximum:&off_2E2658];
}

- (id)bc_clampedToUnitIntervalOrNegativeOne
{
  return [(NSNumber *)self bc_clampedToMinimum:&off_2E2640 maximum:&off_2E2658 orSubstitute:&off_2E2670];
}

@end