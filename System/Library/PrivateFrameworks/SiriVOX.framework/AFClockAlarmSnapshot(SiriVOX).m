@interface AFClockAlarmSnapshot(SiriVOX)
- (id)svx_notifiedFiringAlarms;
@end

@implementation AFClockAlarmSnapshot(SiriVOX)

- (id)svx_notifiedFiringAlarms
{
  v2 = [a1 alarmsByID];
  v3 = [MEMORY[0x263EFF9B0] orderedSet];
  v4 = [a1 notifiedFiringAlarmIDs];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __57__AFClockAlarmSnapshot_SiriVOX__svx_notifiedFiringAlarms__block_invoke;
  v12 = &unk_2645520C8;
  id v13 = v2;
  id v14 = v3;
  id v5 = v3;
  id v6 = v2;
  [v4 enumerateObjectsUsingBlock:&v9];

  v7 = objc_msgSend(v5, "copy", v9, v10, v11, v12);

  return v7;
}

@end