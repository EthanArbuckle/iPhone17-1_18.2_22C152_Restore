@interface ECStrings
+ (void)initialize;
@end

@implementation ECStrings

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    TCBundle();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = [v14 localizedStringForKey:@"h" value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v3 = (void *)sDurationHourShortString;
    sDurationHourShortString = v2;

    TCBundle();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v15 localizedStringForKey:@"hours" value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v5 = (void *)sDurationHourLongString;
    sDurationHourLongString = v4;

    TCBundle();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v16 localizedStringForKey:@"m" value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v7 = (void *)sDurationMinuteShortString;
    sDurationMinuteShortString = v6;

    TCBundle();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v17 localizedStringForKey:@"minutes" value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v9 = (void *)sDurationMinuteLongString;
    sDurationMinuteLongString = v8;

    TCBundle();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v18 localizedStringForKey:@"s" value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v11 = (void *)sDurationSecondShortString;
    sDurationSecondShortString = v10;

    TCBundle();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v19 localizedStringForKey:@"seconds" value:&stru_26EBF24D8 table:@"TCCompatibility"];
    v13 = (void *)sDurationSecondLongString;
    sDurationSecondLongString = v12;
  }
}

@end