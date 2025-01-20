@interface PLEventForwardPowerStateEntry
+ (id)entryKey;
+ (void)load;
- (BOOL)isBasebandWake;
- (NSArray)reason;
- (id)initEntryWithIOMessage:(unsigned int)a3;
- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withCurrentWakeTime:(unint64_t)a6 withCurrentWakeTimeKey:(id)a7 withDate:(id)a8;
- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withCurrentWakeTime:(unint64_t)a6 withCurrentWakeTimeKey:(id)a7 withWakeType:(id)a8 withDriverWakeReason:(id)a9 withDate:(id)a10;
- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withDate:(id)a6;
- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withKernelSleepDate:(id)a6 withDate:(id)a7;
- (signed)event;
- (signed)state;
@end

@implementation PLEventForwardPowerStateEntry

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLEventForwardPowerStateEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryKey
{
  return +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"PowerState"];
}

- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withDate:(id)a6
{
  uint64_t v7 = a4;
  uint64_t v8 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = +[PLEventForwardPowerStateEntry entryKey];
  v18.receiver = self;
  v18.super_class = (Class)PLEventForwardPowerStateEntry;
  v13 = [(PLEntry *)&v18 initWithEntryKey:v12 withDate:v11];

  if (v13)
  {
    v14 = [MEMORY[0x1E4F28ED0] numberWithShort:v8];
    [(PLEntry *)v13 setObject:v14 forKeyedSubscript:@"State"];

    v15 = [MEMORY[0x1E4F28ED0] numberWithShort:v7];
    [(PLEntry *)v13 setObject:v15 forKeyedSubscript:@"Event"];

    v16 = (void *)IOPMSleepWakeCopyUUID();
    [(PLEntry *)v13 setObject:v16 forKeyedSubscript:@"UUID"];

    if (v10) {
      [(PLEntry *)v13 setObject:v10 forKeyedSubscript:@"Reason"];
    }
  }

  return v13;
}

- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withKernelSleepDate:(id)a6 withDate:(id)a7
{
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = +[PLEventForwardPowerStateEntry entryKey];
  v21.receiver = self;
  v21.super_class = (Class)PLEventForwardPowerStateEntry;
  v16 = [(PLEntry *)&v21 initWithEntryKey:v15 withDate:v14];

  if (v16)
  {
    v17 = [MEMORY[0x1E4F28ED0] numberWithShort:v10];
    [(PLEntry *)v16 setObject:v17 forKeyedSubscript:@"State"];

    objc_super v18 = [MEMORY[0x1E4F28ED0] numberWithShort:v9];
    [(PLEntry *)v16 setObject:v18 forKeyedSubscript:@"Event"];

    v19 = (void *)IOPMSleepWakeCopyUUID();
    [(PLEntry *)v16 setObject:v19 forKeyedSubscript:@"UUID"];

    [(PLEntry *)v16 setObject:v13 forKeyedSubscript:@"KernelSleepDate"];
    if (v12) {
      [(PLEntry *)v16 setObject:v12 forKeyedSubscript:@"Reason"];
    }
  }

  return v16;
}

- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withCurrentWakeTime:(unint64_t)a6 withCurrentWakeTimeKey:(id)a7 withWakeType:(id)a8 withDriverWakeReason:(id)a9 withDate:(id)a10
{
  uint64_t v13 = a4;
  uint64_t v14 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  objc_super v21 = +[PLEventForwardPowerStateEntry entryKey];
  v28.receiver = self;
  v28.super_class = (Class)PLEventForwardPowerStateEntry;
  v22 = [(PLEntry *)&v28 initWithEntryKey:v21 withDate:v20];

  if (v22)
  {
    v23 = [MEMORY[0x1E4F28ED0] numberWithShort:v14];
    [(PLEntry *)v22 setObject:v23 forKeyedSubscript:@"State"];

    v24 = [MEMORY[0x1E4F28ED0] numberWithShort:v13];
    [(PLEntry *)v22 setObject:v24 forKeyedSubscript:@"Event"];

    v25 = (void *)IOPMSleepWakeCopyUUID();
    [(PLEntry *)v22 setObject:v25 forKeyedSubscript:@"UUID"];

    v26 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a6];
    [(PLEntry *)v22 setObject:v26 forKeyedSubscript:v17];

    if (v16) {
      [(PLEntry *)v22 setObject:v16 forKeyedSubscript:@"Reason"];
    }
    if (v18) {
      [(PLEntry *)v22 setObject:v18 forKeyedSubscript:@"WakeType"];
    }
    if (v19) {
      [(PLEntry *)v22 setObject:v19 forKeyedSubscript:@"DriverWakeReason"];
    }
  }

  return v22;
}

- (id)initEntryWithState:(signed __int16)a3 withEvent:(signed __int16)a4 withReason:(id)a5 withCurrentWakeTime:(unint64_t)a6 withCurrentWakeTimeKey:(id)a7 withDate:(id)a8
{
  uint64_t v11 = a4;
  uint64_t v12 = a3;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = +[PLEventForwardPowerStateEntry entryKey];
  v24.receiver = self;
  v24.super_class = (Class)PLEventForwardPowerStateEntry;
  id v18 = [(PLEntry *)&v24 initWithEntryKey:v17 withDate:v16];

  if (v18)
  {
    id v19 = [MEMORY[0x1E4F28ED0] numberWithShort:v12];
    [(PLEntry *)v18 setObject:v19 forKeyedSubscript:@"State"];

    id v20 = [MEMORY[0x1E4F28ED0] numberWithShort:v11];
    [(PLEntry *)v18 setObject:v20 forKeyedSubscript:@"Event"];

    objc_super v21 = (void *)IOPMSleepWakeCopyUUID();
    [(PLEntry *)v18 setObject:v21 forKeyedSubscript:@"UUID"];

    v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:a6];
    [(PLEntry *)v18 setObject:v22 forKeyedSubscript:v15];

    if (v14) {
      [(PLEntry *)v18 setObject:v14 forKeyedSubscript:@"Reason"];
    }
  }

  return v18;
}

- (id)initEntryWithIOMessage:(unsigned int)a3
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  __int16 v5 = -1;
  v6 = 0;
  __int16 v7 = -1;
  switch((v4 >> 4))
  {
    case 0u:
      __int16 v7 = 1;
      __int16 v5 = 3;
      goto LABEL_7;
    case 1u:
      __int16 v5 = 1;
      __int16 v7 = 1;
      goto LABEL_7;
    case 2u:
      __int16 v7 = 1;
      __int16 v5 = 2;
      goto LABEL_7;
    case 3u:
    case 4u:
    case 5u:
    case 6u:
    case 7u:
    case 8u:
    case 0xAu:
      goto LABEL_7;
    case 9u:
      __int16 v5 = 0;
      __int16 v7 = 0;
      goto LABEL_7;
    case 0xBu:
      goto LABEL_8;
    default:
      __int16 v7 = -1;
LABEL_7:
      uint64_t v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      self = (PLEventForwardPowerStateEntry *)[(PLEventForwardPowerStateEntry *)self initEntryWithState:v7 withEvent:v5 withReason:0 withDate:v8];

      v6 = self;
LABEL_8:

      return v6;
  }
}

- (signed)state
{
  objc_super v2 = [(PLEntry *)self objectForKeyedSubscript:@"State"];
  signed __int16 v3 = [v2 longValue];

  return v3;
}

- (signed)event
{
  objc_super v2 = [(PLEntry *)self objectForKeyedSubscript:@"Event"];
  signed __int16 v3 = [v2 longValue];

  return v3;
}

- (NSArray)reason
{
  return (NSArray *)[(PLEntry *)self objectForKeyedSubscript:@"Reason"];
}

- (BOOL)isBasebandWake
{
  objc_super v2 = [(PLEventForwardPowerStateEntry *)self reason];
  char v3 = [v2 containsAtleastOneOf:&unk_1F40125F8];

  return v3;
}

@end