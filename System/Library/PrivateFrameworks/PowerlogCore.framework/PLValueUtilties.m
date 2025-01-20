@interface PLValueUtilties
+ (BOOL)isFormater:(signed __int16)a3 validForObject:(id)a4;
+ (BOOL)isNil:(id)a3;
+ (id)formattedStringForDate:(id)a3;
+ (int64_t)compare:(id)a3 with:(id)a4;
+ (signed)formatterFromDataType:(id)a3;
+ (void)resetTimestampFormaterTimezone;
@end

@implementation PLValueUtilties

+ (BOOL)isFormater:(signed __int16)a3 validForObject:(id)a4
{
  id v5 = a4;
  if (!v5
    || ([MEMORY[0x1E4F1CA98] null],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v5))
  {
LABEL_5:
    char v7 = 1;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((unsigned __int16)a3 - 3 >= 4)
    {
LABEL_8:
      char v7 = 0;
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 7:
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      break;
    case 3:
    case 4:
    case 5:
    case 6:
      char isKindOfClass = objc_opt_respondsToSelector();
      break;
    default:
      goto LABEL_8;
  }
  char v7 = isKindOfClass;
LABEL_6:

  return v7 & 1;
}

+ (signed)formatterFromDataType:(id)a3
{
  uint64_t v3 = formatterFromDataType__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&formatterFromDataType__onceToken, &__block_literal_global_43);
  }
  id v5 = [(id)formatterFromDataType__PPSPBDatatypeToPLVFormater objectForKeyedSubscript:v4];

  signed __int16 v6 = [v5 shortValue];
  return v6;
}

+ (id)formattedStringForDate:(id)a3
{
  id v3 = a3;
  objc_sync_enter(@"kSharedTimestampFormater");
  id v4 = (void *)timestampFormatter;
  if (!timestampFormatter)
  {
    +[PLValueUtilties resetTimestampFormaterTimezone];
    id v4 = (void *)timestampFormatter;
  }
  id v5 = [v4 stringFromDate:v3];
  objc_sync_exit(@"kSharedTimestampFormater");

  return v5;
}

void __41__PLValueUtilties_formatterFromDataType___block_invoke()
{
  v3[8] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1F1584800;
  v2[1] = &unk_1F1584830;
  v3[0] = &unk_1F1584818;
  v3[1] = &unk_1F1584848;
  v2[2] = &unk_1F1584860;
  v2[3] = &unk_1F1584890;
  v3[2] = &unk_1F1584878;
  v3[3] = &unk_1F15848A8;
  v2[4] = &unk_1F15848C0;
  v2[5] = &unk_1F15848F0;
  v3[4] = &unk_1F15848D8;
  v3[5] = &unk_1F1584908;
  v2[6] = &unk_1F1584920;
  v2[7] = &unk_1F1584950;
  v3[6] = &unk_1F1584938;
  v3[7] = &unk_1F1584968;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)formatterFromDataType__PPSPBDatatypeToPLVFormater;
  formatterFromDataType__PPSPBDatatypeToPLVFormater = v0;
}

+ (void)resetTimestampFormaterTimezone
{
  objc_sync_enter(@"kSharedTimestampFormater");
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)timestampFormatter;
  timestampFormatter = v2;

  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)timestampFormatter setLocale:v4];
  id v5 = (void *)timestampFormatter;
  signed __int16 v6 = [v4 objectForKey:*MEMORY[0x1E4F1C3E0]];
  [v5 setCalendar:v6];

  char v7 = (void *)timestampFormatter;
  v8 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  [v7 setTimeZone:v8];

  [(id)timestampFormatter setDateFormat:@"MM/dd/yy HH:mm:ss.SSS"];
  objc_sync_exit(@"kSharedTimestampFormater");
}

+ (int64_t)compare:(id)a3 with:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!+[PLValueUtilties isNil:v5]
    && !+[PLValueUtilties isNil:v6]
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_opt_respondsToSelector() & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (objc_opt_respondsToSelector() & 1) != 0))
  {
    int64_t v7 = [v5 compare:v6];
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

+ (BOOL)isNil:(id)a3
{
  if (!a3) {
    return 1;
  }
  id v3 = (void *)MEMORY[0x1E4F1CA98];
  id v4 = a3;
  id v5 = [v3 null];
  BOOL v6 = v5 == v4;

  return v6;
}

@end