@interface _PSMessagesPinningUtilities
+ (id)actionTypeToString:(int64_t)a3;
+ (id)chatGuidsFromSuggestions:(id)a3;
+ (id)dateToString:(id)a3;
+ (id)interactionMethodToString:(int64_t)a3;
+ (id)intersectionsOfActualPinnings:(id)a3 fromTopN:(unint64_t)a4 suggestions:(id)a5;
+ (id)startOfDayForDate:(id)a3;
+ (id)suggestionsToString:(id)a3;
@end

@implementation _PSMessagesPinningUtilities

+ (id)actionTypeToString:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_1E5AE0068[a3];
  }
}

+ (id)interactionMethodToString:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return off_1E5AE0090[a3];
  }
}

+ (id)startOfDayForDate:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  v6 = [v5 startOfDayForDate:v4];

  return v6;
}

+ (id)chatGuidsFromSuggestions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "chatGuid", (void)v13);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v4 copy];

  return v11;
}

+ (id)suggestionsToString:(id)a3
{
  id v3 = [a1 chatGuidsFromSuggestions:a3];
  id v4 = [v3 componentsJoinedByString:@" "];

  return v4;
}

+ (id)dateToString:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28C10];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setDateFormat:@"EE, d LLLL yyyy HH:mm"];
  uint64_t v6 = [v5 stringFromDate:v4];

  return v6;
}

+ (id)intersectionsOfActualPinnings:(id)a3 fromTopN:(unint64_t)a4 suggestions:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = [v8 count];
  if (v9 >= a4) {
    unint64_t v10 = a4;
  }
  else {
    unint64_t v10 = v9;
  }
  v11 = objc_msgSend(v8, "subarrayWithRange:", 0, v10);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v12);
        }
        v15 += objc_msgSend(v11, "containsObject:", *(void *)(*((void *)&v20 + 1) + 8 * i), (void)v20);
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
  else
  {
    uint64_t v15 = 0;
  }

  uint64_t v18 = [NSNumber numberWithUnsignedInteger:v15];

  return v18;
}

@end