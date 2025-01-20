@interface NRLinkUpgradeReport
- (BOOL)isEqual:(id)a3;
- (double)timeSinceLastAdvice;
- (id)description;
- (unint64_t)endAdvice;
- (unint64_t)endReason;
- (unint64_t)rateOfAdvicePerHour;
- (void)setAdvice:(unint64_t)a3;
- (void)setBattery:(unsigned __int8)a3;
- (void)setEndAdvice:(unint64_t)a3;
- (void)setEndReason:(unint64_t)a3;
- (void)setRateOfAdvicePerHour:(unint64_t)a3;
- (void)setReason:(unint64_t)a3;
- (void)setThermalLevel:(unsigned __int8)a3;
- (void)setTimeSinceLastAdvice:(double)a3;
- (void)setType:(unsigned __int8)a3;
@end

@implementation NRLinkUpgradeReport

- (void)setRateOfAdvicePerHour:(unint64_t)a3
{
  self->_rateOfAdvicePerHour = a3;
}

- (unint64_t)rateOfAdvicePerHour
{
  return self->_rateOfAdvicePerHour;
}

- (void)setTimeSinceLastAdvice:(double)a3
{
  self->_timeSinceLastAdvice = a3;
}

- (double)timeSinceLastAdvice
{
  return self->_timeSinceLastAdvice;
}

- (void)setEndReason:(unint64_t)a3
{
  self->_endReason = a3;
}

- (unint64_t)endReason
{
  return self->_endReason;
}

- (void)setEndAdvice:(unint64_t)a3
{
  self->_endAdvice = a3;
}

- (unint64_t)endAdvice
{
  return self->_endAdvice;
}

- (void)setBattery:(unsigned __int8)a3
{
  self->_battery = a3;
}

- (void)setThermalLevel:(unsigned __int8)a3
{
  self->_thermalLevel = a3;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (void)setAdvice:(unint64_t)a3
{
  self->_advice = a3;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (NRLinkUpgradeReport *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t advice = self->_advice;
      if (v5)
      {
        if (advice == v5->_advice)
        {
          unint64_t advice = v5->_reason;
LABEL_6:
          BOOL v7 = self->_reason == advice;
LABEL_11:

          goto LABEL_12;
        }
      }
      else if (!advice)
      {
        goto LABEL_6;
      }
      BOOL v7 = 0;
      goto LABEL_11;
    }
    BOOL v7 = 0;
  }
LABEL_12:

  return v7;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  unint64_t advice = self->_advice;
  v5 = @"None";
  switch(advice)
  {
    case 0uLL:
      break;
    case 1uLL:
      v5 = @"BluetoothDefault";
      break;
    case 2uLL:
      v5 = @"BluetoothClassic";
      break;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      v5 = @"WiFi";
      break;
    default:
      if (advice == 128) {
        v5 = @"NoUpgrade";
      }
      else {
LABEL_5:
      }
        v5 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"Unknown(%llu)", advice];
      break;
  }
  unint64_t reason = self->_reason;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  v8 = v7;
  if ((reason & 0x100) != 0)
  {
    [v7 addObject:@"TransferSizeSmall"];
    if ((reason & 0x200) == 0)
    {
LABEL_10:
      if ((reason & 0x400) == 0) {
        goto LABEL_11;
      }
      goto LABEL_37;
    }
  }
  else if ((reason & 0x200) == 0)
  {
    goto LABEL_10;
  }
  [v8 addObject:@"TransferSizeMedium"];
  if ((reason & 0x400) == 0)
  {
LABEL_11:
    if ((reason & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v8 addObject:@"TransferSizeLarge"];
  if ((reason & 0x4000) == 0)
  {
LABEL_12:
    if ((reason & 0x8000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v8 addObject:@"ServiceClassVoice"];
  if ((reason & 0x8000) == 0)
  {
LABEL_13:
    if ((reason & 0x40000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v8 addObject:@"ServiceClassVideo"];
  if ((reason & 0x40000) == 0)
  {
LABEL_14:
    if ((reason & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v8 addObject:@"RadioConditionPoor"];
  if ((reason & 0x80000) == 0)
  {
LABEL_15:
    if ((reason & 0x100000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v8 addObject:@"RadioConditionFair"];
  if ((reason & 0x100000) == 0)
  {
LABEL_16:
    if ((reason & 0x200000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v8 addObject:@"RadioConditionGood"];
  if ((reason & 0x200000) == 0)
  {
LABEL_17:
    if ((reason & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v8 addObject:@"RadioConditionBest"];
  if ((reason & 0x400000) == 0)
  {
LABEL_18:
    if ((reason & 0x800000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v8 addObject:@"CongestionHigh"];
  if ((reason & 0x800000) == 0)
  {
LABEL_19:
    if ((reason & 0x1000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v8 addObject:@"CongestionNotHigh"];
  if ((reason & 0x1000000) == 0)
  {
LABEL_20:
    if ((reason & 0x2000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v8 addObject:@"PluggedIn"];
  if ((reason & 0x2000000) == 0)
  {
LABEL_21:
    if ((reason & 0x4000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v8 addObject:@"NotPluggedIn"];
  if ((reason & 0x4000000) == 0)
  {
LABEL_22:
    if ((reason & 0x8000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v8 addObject:@"BatteryPercentagePoor"];
  if ((reason & 0x8000000) == 0)
  {
LABEL_23:
    if ((reason & 0x10000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v8 addObject:@"BatteryPercentageFair"];
  if ((reason & 0x10000000) == 0)
  {
LABEL_24:
    if ((reason & 0x20000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v8 addObject:@"BatteryPercentageGood"];
  if ((reason & 0x20000000) == 0)
  {
LABEL_25:
    if ((reason & 0x100000000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v8 addObject:@"BatteryPercentageBest"];
  if ((reason & 0x100000000000000) == 0)
  {
LABEL_26:
    if ((reason & 0x200000000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v8 addObject:@"NSURLPathDataTransferComplete"];
  if ((reason & 0x200000000000000) == 0)
  {
LABEL_27:
    if ((reason & 0x400000000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v8 addObject:@"RecommendationEngineRestarted"];
  if ((reason & 0x400000000000000) == 0)
  {
LABEL_28:
    if ((reason & 0x800000000000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v8 addObject:@"UnexpectedLinkSwitch"];
  if ((reason & 0x800000000000000) == 0)
  {
LABEL_29:
    if ((reason & 0x1000000000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v8 addObject:@"CompanionLinkInactivity"];
  if ((reason & 0x1000000000000000) == 0)
  {
LABEL_30:
    if ((reason & 0x2000000000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v8 addObject:@"RadioConditionsDeteriorated"];
  if ((reason & 0x2000000000000000) == 0)
  {
LABEL_31:
    if ((reason & 0x4000000000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_57:
  [v8 addObject:@"BatteryConditionsDeteriorated"];
  if ((reason & 0x4000000000000000) != 0) {
LABEL_32:
  }
    [v8 addObject:@"LinkSwitchFailure"];
LABEL_33:
  if ([v8 count])
  {
    v9 = [v8 componentsJoinedByString:@", "];
  }
  else
  {
    v9 = @"<none>";
  }

  id v10 = [v3 initWithFormat:@"[%@ %@ since:%.2f rate:%llu/hr]", v5, v9, *(void *)&self->_timeSinceLastAdvice, self->_rateOfAdvicePerHour];

  return v10;
}

@end