@interface SCLScheduleSettings(ViewModel)
+ (id)scheduleSettingsWithViewModel:()ViewModel;
@end

@implementation SCLScheduleSettings(ViewModel)

+ (id)scheduleSettingsWithViewModel:()ViewModel
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F66F58]);
  objc_msgSend(v4, "setEnabled:", objc_msgSend(v3, "isEnabled"));
  switch([v3 scheduleType])
  {
    case 0:
      id v9 = objc_alloc(MEMORY[0x263F66F60]);
      v8 = (void *)[v9 initWithRecurrences:MEMORY[0x263EFFA68]];
      break;
    case 1:
    case 2:
      id v5 = objc_alloc(MEMORY[0x263F66F60]);
      v6 = [v3 timeIntervals];
      uint64_t v7 = objc_msgSend(v5, "initWithTimeIntervals:repeatSchedule:", v6, objc_msgSend(v3, "repeatSchedule"));
      goto LABEL_6;
    case 3:
      v6 = [v3 customSchedule];
      uint64_t v7 = [v6 copy];
LABEL_6:
      v8 = (void *)v7;

      break;
    default:
      v8 = 0;
      break;
  }
  [v4 setSchedule:v8];

  return v4;
}

@end