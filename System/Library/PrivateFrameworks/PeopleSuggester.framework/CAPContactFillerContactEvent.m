@interface CAPContactFillerContactEvent
- (BOOL)hasAverageBehavioralRuleConfidence;
- (BOOL)hasAverageBehavioralRuleConviction;
- (BOOL)hasAverageBehavioralRuleLift;
- (BOOL)hasAverageBehavioralRuleMLScore;
- (BOOL)hasAverageBehavioralRulePowerFactor;
- (BOOL)hasAverageBehavioralRuleSupport;
- (BOOL)hasInteractionModelScore;
- (BOOL)hasMaximumBehavioralRuleConfidence;
- (BOOL)hasMaximumBehavioralRuleConviction;
- (BOOL)hasMaximumBehavioralRuleLift;
- (BOOL)hasMaximumBehavioralRuleMLScore;
- (BOOL)hasMaximumBehavioralRulePowerFactor;
- (BOOL)hasMaximumBehavioralRuleSupport;
- (BOOL)hasMinimumBehavioralRuleConfidence;
- (BOOL)hasMinimumBehavioralRuleConviction;
- (BOOL)hasMinimumBehavioralRuleLift;
- (BOOL)hasMinimumBehavioralRuleMLScore;
- (BOOL)hasMinimumBehavioralRulePowerFactor;
- (BOOL)hasMinimumBehavioralRuleSupport;
- (BOOL)hasNormalizedIncomingCallFrequency;
- (BOOL)hasNormalizedOutgoingCallFrequency;
- (BOOL)hasNumberOfBehavioralRulesAdvocating;
- (BOOL)hasStdevBehavioralRuleConfidence;
- (BOOL)hasStdevBehavioralRuleConviction;
- (BOOL)hasStdevBehavioralRuleLift;
- (BOOL)hasStdevBehavioralRuleMLScore;
- (BOOL)hasStdevBehavioralRulePowerFactor;
- (BOOL)hasStdevBehavioralRuleSupport;
- (BOOL)hasTimeSinceLastContactViaIncomingCall;
- (BOOL)hasTimeSinceLastContactViaOutgoingCall;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasShareRecipient;
- (double)averageBehavioralRuleConfidence;
- (double)averageBehavioralRuleConviction;
- (double)averageBehavioralRuleLift;
- (double)averageBehavioralRuleMLScore;
- (double)averageBehavioralRulePowerFactor;
- (double)averageBehavioralRuleSupport;
- (double)interactionModelScore;
- (double)maximumBehavioralRuleConfidence;
- (double)maximumBehavioralRuleConviction;
- (double)maximumBehavioralRuleLift;
- (double)maximumBehavioralRuleMLScore;
- (double)maximumBehavioralRulePowerFactor;
- (double)maximumBehavioralRuleSupport;
- (double)minimumBehavioralRuleConfidence;
- (double)minimumBehavioralRuleConviction;
- (double)minimumBehavioralRuleLift;
- (double)minimumBehavioralRuleMLScore;
- (double)minimumBehavioralRulePowerFactor;
- (double)minimumBehavioralRuleSupport;
- (double)stdevBehavioralRuleConfidence;
- (double)stdevBehavioralRuleConviction;
- (double)stdevBehavioralRuleLift;
- (double)stdevBehavioralRuleMLScore;
- (double)stdevBehavioralRulePowerFactor;
- (double)stdevBehavioralRuleSupport;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)timeSinceLastContactViaIncomingCallAsString:(int)a3;
- (id)timeSinceLastContactViaIncomingTextAsString:(int)a3;
- (id)timeSinceLastContactViaOutgoingCallAsString:(int)a3;
- (id)timeSinceLastContactViaOutgoingTextAsString:(int)a3;
- (id)timeSinceLastContactViaShareAsString:(int)a3;
- (int)StringAsTimeSinceLastContactViaIncomingCall:(id)a3;
- (int)StringAsTimeSinceLastContactViaIncomingText:(id)a3;
- (int)StringAsTimeSinceLastContactViaOutgoingCall:(id)a3;
- (int)StringAsTimeSinceLastContactViaOutgoingText:(id)a3;
- (int)StringAsTimeSinceLastContactViaShare:(id)a3;
- (int)timeSinceLastContactViaIncomingCall;
- (int)timeSinceLastContactViaIncomingText;
- (int)timeSinceLastContactViaOutgoingCall;
- (int)timeSinceLastContactViaOutgoingText;
- (int)timeSinceLastContactViaShare;
- (unint64_t)hash;
- (unsigned)normalizedIncomingCallFrequency;
- (unsigned)normalizedIncomingTextFrequency;
- (unsigned)normalizedOutgoingCallFrequency;
- (unsigned)normalizedOutgoingTextFrequency;
- (unsigned)normalizedShareFrequency;
- (unsigned)numberOfBehavioralRulesAdvocating;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAverageBehavioralRuleConfidence:(double)a3;
- (void)setAverageBehavioralRuleConviction:(double)a3;
- (void)setAverageBehavioralRuleLift:(double)a3;
- (void)setAverageBehavioralRuleMLScore:(double)a3;
- (void)setAverageBehavioralRulePowerFactor:(double)a3;
- (void)setAverageBehavioralRuleSupport:(double)a3;
- (void)setHasAverageBehavioralRuleConfidence:(BOOL)a3;
- (void)setHasAverageBehavioralRuleConviction:(BOOL)a3;
- (void)setHasAverageBehavioralRuleLift:(BOOL)a3;
- (void)setHasAverageBehavioralRuleMLScore:(BOOL)a3;
- (void)setHasAverageBehavioralRulePowerFactor:(BOOL)a3;
- (void)setHasAverageBehavioralRuleSupport:(BOOL)a3;
- (void)setHasInteractionModelScore:(BOOL)a3;
- (void)setHasMaximumBehavioralRuleConfidence:(BOOL)a3;
- (void)setHasMaximumBehavioralRuleConviction:(BOOL)a3;
- (void)setHasMaximumBehavioralRuleLift:(BOOL)a3;
- (void)setHasMaximumBehavioralRuleMLScore:(BOOL)a3;
- (void)setHasMaximumBehavioralRulePowerFactor:(BOOL)a3;
- (void)setHasMaximumBehavioralRuleSupport:(BOOL)a3;
- (void)setHasMinimumBehavioralRuleConfidence:(BOOL)a3;
- (void)setHasMinimumBehavioralRuleConviction:(BOOL)a3;
- (void)setHasMinimumBehavioralRuleLift:(BOOL)a3;
- (void)setHasMinimumBehavioralRuleMLScore:(BOOL)a3;
- (void)setHasMinimumBehavioralRulePowerFactor:(BOOL)a3;
- (void)setHasMinimumBehavioralRuleSupport:(BOOL)a3;
- (void)setHasNormalizedIncomingCallFrequency:(BOOL)a3;
- (void)setHasNormalizedOutgoingCallFrequency:(BOOL)a3;
- (void)setHasNumberOfBehavioralRulesAdvocating:(BOOL)a3;
- (void)setHasStdevBehavioralRuleConfidence:(BOOL)a3;
- (void)setHasStdevBehavioralRuleConviction:(BOOL)a3;
- (void)setHasStdevBehavioralRuleLift:(BOOL)a3;
- (void)setHasStdevBehavioralRuleMLScore:(BOOL)a3;
- (void)setHasStdevBehavioralRulePowerFactor:(BOOL)a3;
- (void)setHasStdevBehavioralRuleSupport:(BOOL)a3;
- (void)setHasTimeSinceLastContactViaIncomingCall:(BOOL)a3;
- (void)setHasTimeSinceLastContactViaOutgoingCall:(BOOL)a3;
- (void)setInteractionModelScore:(double)a3;
- (void)setMaximumBehavioralRuleConfidence:(double)a3;
- (void)setMaximumBehavioralRuleConviction:(double)a3;
- (void)setMaximumBehavioralRuleLift:(double)a3;
- (void)setMaximumBehavioralRuleMLScore:(double)a3;
- (void)setMaximumBehavioralRulePowerFactor:(double)a3;
- (void)setMaximumBehavioralRuleSupport:(double)a3;
- (void)setMinimumBehavioralRuleConfidence:(double)a3;
- (void)setMinimumBehavioralRuleConviction:(double)a3;
- (void)setMinimumBehavioralRuleLift:(double)a3;
- (void)setMinimumBehavioralRuleMLScore:(double)a3;
- (void)setMinimumBehavioralRulePowerFactor:(double)a3;
- (void)setMinimumBehavioralRuleSupport:(double)a3;
- (void)setNormalizedIncomingCallFrequency:(unsigned int)a3;
- (void)setNormalizedIncomingTextFrequency:(unsigned int)a3;
- (void)setNormalizedOutgoingCallFrequency:(unsigned int)a3;
- (void)setNormalizedOutgoingTextFrequency:(unsigned int)a3;
- (void)setNormalizedShareFrequency:(unsigned int)a3;
- (void)setNumberOfBehavioralRulesAdvocating:(unsigned int)a3;
- (void)setStdevBehavioralRuleConfidence:(double)a3;
- (void)setStdevBehavioralRuleConviction:(double)a3;
- (void)setStdevBehavioralRuleLift:(double)a3;
- (void)setStdevBehavioralRuleMLScore:(double)a3;
- (void)setStdevBehavioralRulePowerFactor:(double)a3;
- (void)setStdevBehavioralRuleSupport:(double)a3;
- (void)setTimeSinceLastContactViaIncomingCall:(int)a3;
- (void)setTimeSinceLastContactViaIncomingText:(int)a3;
- (void)setTimeSinceLastContactViaOutgoingCall:(int)a3;
- (void)setTimeSinceLastContactViaOutgoingText:(int)a3;
- (void)setTimeSinceLastContactViaShare:(int)a3;
- (void)setWasShareRecipient:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CAPContactFillerContactEvent

- (id)timeSinceLastContactViaShareAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E5AE1188[a3];
  }

  return v3;
}

- (int)StringAsTimeSinceLastContactViaShare:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CFTIME_LESSTHAN2mins"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN5mins"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN10mins"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN30mins"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN1hr"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN2hrs"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN4hrs"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN6hrs"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN12hrs"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN24hrs"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CAPTIME_OTHER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CAPTIME_UNKNOWN"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)timeSinceLastContactViaIncomingTextAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5AE1188[a3];
  }

  return v3;
}

- (int)StringAsTimeSinceLastContactViaIncomingText:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CFTIME_LESSTHAN2mins"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN5mins"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN10mins"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN30mins"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN1hr"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN2hrs"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN4hrs"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN6hrs"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN12hrs"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN24hrs"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CAPTIME_OTHER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CAPTIME_UNKNOWN"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)timeSinceLastContactViaOutgoingTextAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5AE1188[a3];
  }

  return v3;
}

- (int)StringAsTimeSinceLastContactViaOutgoingText:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CFTIME_LESSTHAN2mins"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN5mins"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN10mins"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN30mins"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN1hr"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN2hrs"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN4hrs"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN6hrs"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN12hrs"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN24hrs"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CAPTIME_OTHER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CAPTIME_UNKNOWN"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)timeSinceLastContactViaIncomingCall
{
  if ((*((unsigned char *)&self->_has + 3) & 0x10) != 0) {
    return self->_timeSinceLastContactViaIncomingCall;
  }
  else {
    return 0;
  }
}

- (void)setTimeSinceLastContactViaIncomingCall:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_timeSinceLastContactViaIncomingCall = a3;
}

- (void)setHasTimeSinceLastContactViaIncomingCall:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTimeSinceLastContactViaIncomingCall
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)timeSinceLastContactViaIncomingCallAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5AE1188[a3];
  }

  return v3;
}

- (int)StringAsTimeSinceLastContactViaIncomingCall:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CFTIME_LESSTHAN2mins"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN5mins"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN10mins"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN30mins"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN1hr"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN2hrs"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN4hrs"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN6hrs"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN12hrs"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN24hrs"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CAPTIME_OTHER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CAPTIME_UNKNOWN"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)timeSinceLastContactViaOutgoingCall
{
  if ((*((unsigned char *)&self->_has + 3) & 0x20) != 0) {
    return self->_timeSinceLastContactViaOutgoingCall;
  }
  else {
    return 0;
  }
}

- (void)setTimeSinceLastContactViaOutgoingCall:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_timeSinceLastContactViaOutgoingCall = a3;
}

- (void)setHasTimeSinceLastContactViaOutgoingCall:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasTimeSinceLastContactViaOutgoingCall
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (id)timeSinceLastContactViaOutgoingCallAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E5AE1188[a3];
  }

  return v3;
}

- (int)StringAsTimeSinceLastContactViaOutgoingCall:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CFTIME_LESSTHAN2mins"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN5mins"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN10mins"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN30mins"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN1hr"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN2hrs"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN4hrs"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN6hrs"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN12hrs"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CFTIME_LESSTHAN24hrs"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CAPTIME_OTHER"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"CAPTIME_UNKNOWN"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setNormalizedIncomingCallFrequency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_normalizedIncomingCallFrequency = a3;
}

- (void)setHasNormalizedIncomingCallFrequency:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasNormalizedIncomingCallFrequency
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setNormalizedOutgoingCallFrequency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_normalizedOutgoingCallFrequency = a3;
}

- (void)setHasNormalizedOutgoingCallFrequency:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasNormalizedOutgoingCallFrequency
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setNumberOfBehavioralRulesAdvocating:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_numberOfBehavioralRulesAdvocating = a3;
}

- (void)setHasNumberOfBehavioralRulesAdvocating:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasNumberOfBehavioralRulesAdvocating
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setAverageBehavioralRuleSupport:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_averageBehavioralRuleSupport = a3;
}

- (void)setHasAverageBehavioralRuleSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasAverageBehavioralRuleSupport
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAverageBehavioralRuleConfidence:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_averageBehavioralRuleConfidence = a3;
}

- (void)setHasAverageBehavioralRuleConfidence:(BOOL)a3
{
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAverageBehavioralRuleConfidence
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAverageBehavioralRuleLift:(double)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_averageBehavioralRuleLift = a3;
}

- (void)setHasAverageBehavioralRuleLift:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAverageBehavioralRuleLift
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAverageBehavioralRuleConviction:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_averageBehavioralRuleConviction = a3;
}

- (void)setHasAverageBehavioralRuleConviction:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAverageBehavioralRuleConviction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAverageBehavioralRulePowerFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_averageBehavioralRulePowerFactor = a3;
}

- (void)setHasAverageBehavioralRulePowerFactor:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAverageBehavioralRulePowerFactor
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAverageBehavioralRuleMLScore:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_averageBehavioralRuleMLScore = a3;
}

- (void)setHasAverageBehavioralRuleMLScore:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAverageBehavioralRuleMLScore
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMinimumBehavioralRuleSupport:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_minimumBehavioralRuleSupport = a3;
}

- (void)setHasMinimumBehavioralRuleSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasMinimumBehavioralRuleSupport
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMinimumBehavioralRuleConfidence:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_minimumBehavioralRuleConfidence = a3;
}

- (void)setHasMinimumBehavioralRuleConfidence:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasMinimumBehavioralRuleConfidence
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setMinimumBehavioralRuleLift:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_minimumBehavioralRuleLift = a3;
}

- (void)setHasMinimumBehavioralRuleLift:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasMinimumBehavioralRuleLift
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMinimumBehavioralRuleConviction:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_minimumBehavioralRuleConviction = a3;
}

- (void)setHasMinimumBehavioralRuleConviction:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasMinimumBehavioralRuleConviction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMinimumBehavioralRulePowerFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_minimumBehavioralRulePowerFactor = a3;
}

- (void)setHasMinimumBehavioralRulePowerFactor:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMinimumBehavioralRulePowerFactor
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMinimumBehavioralRuleMLScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_minimumBehavioralRuleMLScore = a3;
}

- (void)setHasMinimumBehavioralRuleMLScore:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasMinimumBehavioralRuleMLScore
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setMaximumBehavioralRuleSupport:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_maximumBehavioralRuleSupport = a3;
}

- (void)setHasMaximumBehavioralRuleSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMaximumBehavioralRuleSupport
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setMaximumBehavioralRuleConfidence:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_maximumBehavioralRuleConfidence = a3;
}

- (void)setHasMaximumBehavioralRuleConfidence:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasMaximumBehavioralRuleConfidence
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setMaximumBehavioralRuleLift:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_maximumBehavioralRuleLift = a3;
}

- (void)setHasMaximumBehavioralRuleLift:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMaximumBehavioralRuleLift
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setMaximumBehavioralRuleConviction:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_maximumBehavioralRuleConviction = a3;
}

- (void)setHasMaximumBehavioralRuleConviction:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMaximumBehavioralRuleConviction
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setMaximumBehavioralRulePowerFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_maximumBehavioralRulePowerFactor = a3;
}

- (void)setHasMaximumBehavioralRulePowerFactor:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMaximumBehavioralRulePowerFactor
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setMaximumBehavioralRuleMLScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_maximumBehavioralRuleMLScore = a3;
}

- (void)setHasMaximumBehavioralRuleMLScore:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasMaximumBehavioralRuleMLScore
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setStdevBehavioralRuleSupport:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_stdevBehavioralRuleSupport = a3;
}

- (void)setHasStdevBehavioralRuleSupport:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasStdevBehavioralRuleSupport
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setStdevBehavioralRuleConfidence:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_stdevBehavioralRuleConfidence = a3;
}

- (void)setHasStdevBehavioralRuleConfidence:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasStdevBehavioralRuleConfidence
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setStdevBehavioralRuleLift:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_stdevBehavioralRuleLift = a3;
}

- (void)setHasStdevBehavioralRuleLift:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasStdevBehavioralRuleLift
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setStdevBehavioralRuleConviction:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_stdevBehavioralRuleConviction = a3;
}

- (void)setHasStdevBehavioralRuleConviction:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasStdevBehavioralRuleConviction
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setStdevBehavioralRulePowerFactor:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_stdevBehavioralRulePowerFactor = a3;
}

- (void)setHasStdevBehavioralRulePowerFactor:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasStdevBehavioralRulePowerFactor
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setStdevBehavioralRuleMLScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_stdevBehavioralRuleMLScore = a3;
}

- (void)setHasStdevBehavioralRuleMLScore:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasStdevBehavioralRuleMLScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setInteractionModelScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_interactionModelScore = a3;
}

- (void)setHasInteractionModelScore:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($1451EF63A6CFCCDA6C3A04E30C0EA5C4)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasInteractionModelScore
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)CAPContactFillerContactEvent;
  int v4 = [(CAPContactFillerContactEvent *)&v8 description];
  v5 = [(CAPContactFillerContactEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t timeSinceLastContactViaShare = self->_timeSinceLastContactViaShare;
  if (timeSinceLastContactViaShare >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_timeSinceLastContactViaShare);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E5AE1188[timeSinceLastContactViaShare];
  }
  [v3 setObject:v5 forKey:@"timeSinceLastContactViaShare"];

  uint64_t timeSinceLastContactViaIncomingText = self->_timeSinceLastContactViaIncomingText;
  if (timeSinceLastContactViaIncomingText >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_timeSinceLastContactViaIncomingText);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E5AE1188[timeSinceLastContactViaIncomingText];
  }
  [v3 setObject:v7 forKey:@"timeSinceLastContactViaIncomingText"];

  uint64_t timeSinceLastContactViaOutgoingText = self->_timeSinceLastContactViaOutgoingText;
  if (timeSinceLastContactViaOutgoingText >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_timeSinceLastContactViaOutgoingText);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E5AE1188[timeSinceLastContactViaOutgoingText];
  }
  [v3 setObject:v9 forKey:@"timeSinceLastContactViaOutgoingText"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    uint64_t timeSinceLastContactViaIncomingCall = self->_timeSinceLastContactViaIncomingCall;
    if (timeSinceLastContactViaIncomingCall >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_timeSinceLastContactViaIncomingCall);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E5AE1188[timeSinceLastContactViaIncomingCall];
    }
    [v3 setObject:v12 forKey:@"timeSinceLastContactViaIncomingCall"];

    $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    uint64_t timeSinceLastContactViaOutgoingCall = self->_timeSinceLastContactViaOutgoingCall;
    if (timeSinceLastContactViaOutgoingCall >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_timeSinceLastContactViaOutgoingCall);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E5AE1188[timeSinceLastContactViaOutgoingCall];
    }
    [v3 setObject:v14 forKey:@"timeSinceLastContactViaOutgoingCall"];
  }
  v15 = [NSNumber numberWithUnsignedInt:self->_normalizedShareFrequency];
  [v3 setObject:v15 forKey:@"normalizedShareFrequency"];

  v16 = [NSNumber numberWithUnsignedInt:self->_normalizedIncomingTextFrequency];
  [v3 setObject:v16 forKey:@"normalizedIncomingTextFrequency"];

  v17 = [NSNumber numberWithUnsignedInt:self->_normalizedOutgoingTextFrequency];
  [v3 setObject:v17 forKey:@"normalizedOutgoingTextFrequency"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x2000000) != 0)
  {
    v23 = [NSNumber numberWithUnsignedInt:self->_normalizedIncomingCallFrequency];
    [v3 setObject:v23 forKey:@"normalizedIncomingCallFrequency"];

    $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
    if ((*(_DWORD *)&v18 & 0x4000000) == 0)
    {
LABEL_22:
      if ((*(_DWORD *)&v18 & 0x8000000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&v18 & 0x4000000) == 0)
  {
    goto LABEL_22;
  }
  v24 = [NSNumber numberWithUnsignedInt:self->_normalizedOutgoingCallFrequency];
  [v3 setObject:v24 forKey:@"normalizedOutgoingCallFrequency"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x8000000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v18 & 0x20) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  v25 = [NSNumber numberWithUnsignedInt:self->_numberOfBehavioralRulesAdvocating];
  [v3 setObject:v25 forKey:@"numberOfBehavioralRulesAdvocating"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x20) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v18 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  v26 = [NSNumber numberWithDouble:self->_averageBehavioralRuleSupport];
  [v3 setObject:v26 forKey:@"averageBehavioralRuleSupport"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 1) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v18 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  v27 = [NSNumber numberWithDouble:self->_averageBehavioralRuleConfidence];
  [v3 setObject:v27 forKey:@"averageBehavioralRuleConfidence"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 4) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v18 & 2) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  v28 = [NSNumber numberWithDouble:self->_averageBehavioralRuleLift];
  [v3 setObject:v28 forKey:@"averageBehavioralRuleLift"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 2) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v18 & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  v29 = [NSNumber numberWithDouble:self->_averageBehavioralRuleConviction];
  [v3 setObject:v29 forKey:@"averageBehavioralRuleConviction"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v18 & 8) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  v30 = [NSNumber numberWithDouble:self->_averageBehavioralRulePowerFactor];
  [v3 setObject:v30 forKey:@"averageBehavioralRulePowerFactor"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 8) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v18 & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  v31 = [NSNumber numberWithDouble:self->_averageBehavioralRuleMLScore];
  [v3 setObject:v31 forKey:@"averageBehavioralRuleMLScore"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v18 & 0x2000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_60;
  }
LABEL_59:
  v32 = [NSNumber numberWithDouble:self->_minimumBehavioralRuleSupport];
  [v3 setObject:v32 forKey:@"minimumBehavioralRuleSupport"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x2000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v18 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_61;
  }
LABEL_60:
  v33 = [NSNumber numberWithDouble:self->_minimumBehavioralRuleConfidence];
  [v3 setObject:v33 forKey:@"minimumBehavioralRuleConfidence"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v18 & 0x4000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_62;
  }
LABEL_61:
  v34 = [NSNumber numberWithDouble:self->_minimumBehavioralRuleLift];
  [v3 setObject:v34 forKey:@"minimumBehavioralRuleLift"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v18 & 0x20000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_63;
  }
LABEL_62:
  v35 = [NSNumber numberWithDouble:self->_minimumBehavioralRuleConviction];
  [v3 setObject:v35 forKey:@"minimumBehavioralRuleConviction"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v18 & 0x10000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_64;
  }
LABEL_63:
  v36 = [NSNumber numberWithDouble:self->_minimumBehavioralRulePowerFactor];
  [v3 setObject:v36 forKey:@"minimumBehavioralRulePowerFactor"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x10000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v18 & 0x1000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_65;
  }
LABEL_64:
  v37 = [NSNumber numberWithDouble:self->_minimumBehavioralRuleMLScore];
  [v3 setObject:v37 forKey:@"minimumBehavioralRuleMLScore"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x1000) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v18 & 0x80) == 0) {
      goto LABEL_37;
    }
    goto LABEL_66;
  }
LABEL_65:
  v38 = [NSNumber numberWithDouble:self->_maximumBehavioralRuleSupport];
  [v3 setObject:v38 forKey:@"maximumBehavioralRuleSupport"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x80) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v18 & 0x200) == 0) {
      goto LABEL_38;
    }
    goto LABEL_67;
  }
LABEL_66:
  v39 = [NSNumber numberWithDouble:self->_maximumBehavioralRuleConfidence];
  [v3 setObject:v39 forKey:@"maximumBehavioralRuleConfidence"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x200) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v18 & 0x100) == 0) {
      goto LABEL_39;
    }
    goto LABEL_68;
  }
LABEL_67:
  v40 = [NSNumber numberWithDouble:self->_maximumBehavioralRuleLift];
  [v3 setObject:v40 forKey:@"maximumBehavioralRuleLift"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x100) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v18 & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_69;
  }
LABEL_68:
  v41 = [NSNumber numberWithDouble:self->_maximumBehavioralRuleConviction];
  [v3 setObject:v41 forKey:@"maximumBehavioralRuleConviction"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&v18 & 0x400) == 0) {
      goto LABEL_41;
    }
    goto LABEL_70;
  }
LABEL_69:
  v42 = [NSNumber numberWithDouble:self->_maximumBehavioralRulePowerFactor];
  [v3 setObject:v42 forKey:@"maximumBehavioralRulePowerFactor"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x400) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v18 & 0x1000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_71;
  }
LABEL_70:
  v43 = [NSNumber numberWithDouble:self->_maximumBehavioralRuleMLScore];
  [v3 setObject:v43 forKey:@"maximumBehavioralRuleMLScore"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v18 & 0x80000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_72;
  }
LABEL_71:
  v44 = [NSNumber numberWithDouble:self->_stdevBehavioralRuleSupport];
  [v3 setObject:v44 forKey:@"stdevBehavioralRuleSupport"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x80000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v18 & 0x200000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_73;
  }
LABEL_72:
  v45 = [NSNumber numberWithDouble:self->_stdevBehavioralRuleConfidence];
  [v3 setObject:v45 forKey:@"stdevBehavioralRuleConfidence"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x200000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v18 & 0x100000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_74;
  }
LABEL_73:
  v46 = [NSNumber numberWithDouble:self->_stdevBehavioralRuleLift];
  [v3 setObject:v46 forKey:@"stdevBehavioralRuleLift"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x100000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v18 & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_75;
  }
LABEL_74:
  v47 = [NSNumber numberWithDouble:self->_stdevBehavioralRuleConviction];
  [v3 setObject:v47 forKey:@"stdevBehavioralRuleConviction"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x800000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v18 & 0x400000) == 0) {
      goto LABEL_47;
    }
LABEL_76:
    v49 = [NSNumber numberWithDouble:self->_stdevBehavioralRuleMLScore];
    [v3 setObject:v49 forKey:@"stdevBehavioralRuleMLScore"];

    if ((*(_DWORD *)&self->_has & 0x40) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_75:
  v48 = [NSNumber numberWithDouble:self->_stdevBehavioralRulePowerFactor];
  [v3 setObject:v48 forKey:@"stdevBehavioralRulePowerFactor"];

  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x400000) != 0) {
    goto LABEL_76;
  }
LABEL_47:
  if ((*(unsigned char *)&v18 & 0x40) != 0)
  {
LABEL_48:
    v19 = [NSNumber numberWithDouble:self->_interactionModelScore];
    [v3 setObject:v19 forKey:@"interactionModelScore"];
  }
LABEL_49:
  v20 = [NSNumber numberWithBool:self->_wasShareRecipient];
  [v3 setObject:v20 forKey:@"wasShareRecipient"];

  id v21 = v3;
  return v21;
}

- (BOOL)readFrom:(id)a3
{
  return CAPContactFillerContactEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
    if ((*(_DWORD *)&v5 & 0x4000000) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&v5 & 0x8000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_DWORD *)&v5 & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&v5 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 1) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 4) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&v5 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x10) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&v5 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v5 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v5 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v5 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v5 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v5 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v5 & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v5 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v5 & 0x200) == 0) {
      goto LABEL_23;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v5 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v5 & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v5 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v5 & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v5 & 0x200000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v5 & 0x100000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v5 & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v5 & 0x400000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteDoubleField();
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x400000) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v5 & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_63:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_33:
  }
    PBDataWriterWriteDoubleField();
LABEL_34:
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 62) = self->_timeSinceLastContactViaShare;
  *((_DWORD *)a3 + 59) = self->_timeSinceLastContactViaIncomingText;
  *((_DWORD *)a3 + 61) = self->_timeSinceLastContactViaOutgoingText;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    *((_DWORD *)a3 + 58) = self->_timeSinceLastContactViaIncomingCall;
    *((_DWORD *)a3 + 64) |= 0x10000000u;
    $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    *((_DWORD *)a3 + 60) = self->_timeSinceLastContactViaOutgoingCall;
    *((_DWORD *)a3 + 64) |= 0x20000000u;
  }
  *((_DWORD *)a3 + 56) = self->_normalizedShareFrequency;
  *((_DWORD *)a3 + 53) = self->_normalizedIncomingTextFrequency;
  *((_DWORD *)a3 + 55) = self->_normalizedOutgoingTextFrequency;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x2000000) != 0)
  {
    *((_DWORD *)a3 + 52) = self->_normalizedIncomingCallFrequency;
    *((_DWORD *)a3 + 64) |= 0x2000000u;
    $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
    if ((*(_DWORD *)&v4 & 0x4000000) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&v4 & 0x8000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&v4 & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 54) = self->_normalizedOutgoingCallFrequency;
  *((_DWORD *)a3 + 64) |= 0x4000000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&v4 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 57) = self->_numberOfBehavioralRulesAdvocating;
  *((_DWORD *)a3 + 64) |= 0x8000000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&v4 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)a3 + 6) = *(void *)&self->_averageBehavioralRuleSupport;
  *((_DWORD *)a3 + 64) |= 0x20u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 1) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v4 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)a3 + 1) = *(void *)&self->_averageBehavioralRuleConfidence;
  *((_DWORD *)a3 + 64) |= 1u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 4) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&v4 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)a3 + 3) = *(void *)&self->_averageBehavioralRuleLift;
  *((_DWORD *)a3 + 64) |= 4u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&v4 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)a3 + 2) = *(void *)&self->_averageBehavioralRuleConviction;
  *((_DWORD *)a3 + 64) |= 2u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x10) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&v4 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)a3 + 5) = *(void *)&self->_averageBehavioralRulePowerFactor;
  *((_DWORD *)a3 + 64) |= 0x10u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 8) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v4 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)a3 + 4) = *(void *)&self->_averageBehavioralRuleMLScore;
  *((_DWORD *)a3 + 64) |= 8u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v4 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)a3 + 19) = *(void *)&self->_minimumBehavioralRuleSupport;
  *((_DWORD *)a3 + 64) |= 0x40000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v4 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)a3 + 14) = *(void *)&self->_minimumBehavioralRuleConfidence;
  *((_DWORD *)a3 + 64) |= 0x2000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v4 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)a3 + 16) = *(void *)&self->_minimumBehavioralRuleLift;
  *((_DWORD *)a3 + 64) |= 0x8000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v4 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)a3 + 15) = *(void *)&self->_minimumBehavioralRuleConviction;
  *((_DWORD *)a3 + 64) |= 0x4000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v4 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)a3 + 18) = *(void *)&self->_minimumBehavioralRulePowerFactor;
  *((_DWORD *)a3 + 64) |= 0x20000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v4 & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)a3 + 17) = *(void *)&self->_minimumBehavioralRuleMLScore;
  *((_DWORD *)a3 + 64) |= 0x10000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x1000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v4 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)a3 + 13) = *(void *)&self->_maximumBehavioralRuleSupport;
  *((_DWORD *)a3 + 64) |= 0x1000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v4 & 0x200) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)a3 + 8) = *(void *)&self->_maximumBehavioralRuleConfidence;
  *((_DWORD *)a3 + 64) |= 0x80u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v4 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)a3 + 10) = *(void *)&self->_maximumBehavioralRuleLift;
  *((_DWORD *)a3 + 64) |= 0x200u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v4 & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)a3 + 9) = *(void *)&self->_maximumBehavioralRuleConviction;
  *((_DWORD *)a3 + 64) |= 0x100u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v4 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)a3 + 12) = *(void *)&self->_maximumBehavioralRulePowerFactor;
  *((_DWORD *)a3 + 64) |= 0x800u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v4 & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)a3 + 11) = *(void *)&self->_maximumBehavioralRuleMLScore;
  *((_DWORD *)a3 + 64) |= 0x400u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x1000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v4 & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)a3 + 25) = *(void *)&self->_stdevBehavioralRuleSupport;
  *((_DWORD *)a3 + 64) |= 0x1000000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v4 & 0x200000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)a3 + 20) = *(void *)&self->_stdevBehavioralRuleConfidence;
  *((_DWORD *)a3 + 64) |= 0x80000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v4 & 0x100000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)a3 + 22) = *(void *)&self->_stdevBehavioralRuleLift;
  *((_DWORD *)a3 + 64) |= 0x200000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v4 & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)a3 + 21) = *(void *)&self->_stdevBehavioralRuleConviction;
  *((_DWORD *)a3 + 64) |= 0x100000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v4 & 0x400000) == 0) {
      goto LABEL_32;
    }
LABEL_61:
    *((void *)a3 + 23) = *(void *)&self->_stdevBehavioralRuleMLScore;
    *((_DWORD *)a3 + 64) |= 0x400000u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_60:
  *((void *)a3 + 24) = *(void *)&self->_stdevBehavioralRulePowerFactor;
  *((_DWORD *)a3 + 64) |= 0x800000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x400000) != 0) {
    goto LABEL_61;
  }
LABEL_32:
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
LABEL_33:
    *((void *)a3 + 7) = *(void *)&self->_interactionModelScore;
    *((_DWORD *)a3 + 64) |= 0x40u;
  }
LABEL_34:
  *((unsigned char *)a3 + 252) = self->_wasShareRecipient;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 62) = self->_timeSinceLastContactViaShare;
  *((_DWORD *)result + 59) = self->_timeSinceLastContactViaIncomingText;
  *((_DWORD *)result + 61) = self->_timeSinceLastContactViaOutgoingText;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    *((_DWORD *)result + 58) = self->_timeSinceLastContactViaIncomingCall;
    *((_DWORD *)result + 64) |= 0x10000000u;
    $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    *((_DWORD *)result + 60) = self->_timeSinceLastContactViaOutgoingCall;
    *((_DWORD *)result + 64) |= 0x20000000u;
  }
  *((_DWORD *)result + 56) = self->_normalizedShareFrequency;
  *((_DWORD *)result + 53) = self->_normalizedIncomingTextFrequency;
  *((_DWORD *)result + 55) = self->_normalizedOutgoingTextFrequency;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
    *((_DWORD *)result + 52) = self->_normalizedIncomingCallFrequency;
    *((_DWORD *)result + 64) |= 0x2000000u;
    $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x4000000) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)result + 54) = self->_normalizedOutgoingCallFrequency;
  *((_DWORD *)result + 64) |= 0x4000000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 57) = self->_numberOfBehavioralRulesAdvocating;
  *((_DWORD *)result + 64) |= 0x8000000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&v6 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)result + 6) = *(void *)&self->_averageBehavioralRuleSupport;
  *((_DWORD *)result + 64) |= 0x20u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 1) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)result + 1) = *(void *)&self->_averageBehavioralRuleConfidence;
  *((_DWORD *)result + 64) |= 1u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)result + 3) = *(void *)&self->_averageBehavioralRuleLift;
  *((_DWORD *)result + 64) |= 4u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)result + 2) = *(void *)&self->_averageBehavioralRuleConviction;
  *((_DWORD *)result + 64) |= 2u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)result + 5) = *(void *)&self->_averageBehavioralRulePowerFactor;
  *((_DWORD *)result + 64) |= 0x10u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((void *)result + 4) = *(void *)&self->_averageBehavioralRuleMLScore;
  *((_DWORD *)result + 64) |= 8u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((void *)result + 19) = *(void *)&self->_minimumBehavioralRuleSupport;
  *((_DWORD *)result + 64) |= 0x40000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((void *)result + 14) = *(void *)&self->_minimumBehavioralRuleConfidence;
  *((_DWORD *)result + 64) |= 0x2000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)result + 16) = *(void *)&self->_minimumBehavioralRuleLift;
  *((_DWORD *)result + 64) |= 0x8000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)result + 15) = *(void *)&self->_minimumBehavioralRuleConviction;
  *((_DWORD *)result + 64) |= 0x4000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)result + 18) = *(void *)&self->_minimumBehavioralRulePowerFactor;
  *((_DWORD *)result + 64) |= 0x20000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)result + 17) = *(void *)&self->_minimumBehavioralRuleMLScore;
  *((_DWORD *)result + 64) |= 0x10000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)result + 13) = *(void *)&self->_maximumBehavioralRuleSupport;
  *((_DWORD *)result + 64) |= 0x1000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)result + 8) = *(void *)&self->_maximumBehavioralRuleConfidence;
  *((_DWORD *)result + 64) |= 0x80u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)result + 10) = *(void *)&self->_maximumBehavioralRuleLift;
  *((_DWORD *)result + 64) |= 0x200u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)result + 9) = *(void *)&self->_maximumBehavioralRuleConviction;
  *((_DWORD *)result + 64) |= 0x100u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)result + 12) = *(void *)&self->_maximumBehavioralRulePowerFactor;
  *((_DWORD *)result + 64) |= 0x800u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)result + 11) = *(void *)&self->_maximumBehavioralRuleMLScore;
  *((_DWORD *)result + 64) |= 0x400u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)result + 25) = *(void *)&self->_stdevBehavioralRuleSupport;
  *((_DWORD *)result + 64) |= 0x1000000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x200000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)result + 20) = *(void *)&self->_stdevBehavioralRuleConfidence;
  *((_DWORD *)result + 64) |= 0x80000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)result + 22) = *(void *)&self->_stdevBehavioralRuleLift;
  *((_DWORD *)result + 64) |= 0x200000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)result + 21) = *(void *)&self->_stdevBehavioralRuleConviction;
  *((_DWORD *)result + 64) |= 0x100000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_32;
    }
LABEL_61:
    *((void *)result + 23) = *(void *)&self->_stdevBehavioralRuleMLScore;
    *((_DWORD *)result + 64) |= 0x400000u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_60:
  *((void *)result + 24) = *(void *)&self->_stdevBehavioralRulePowerFactor;
  *((_DWORD *)result + 64) |= 0x800000u;
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) != 0) {
    goto LABEL_61;
  }
LABEL_32:
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
LABEL_33:
    *((void *)result + 7) = *(void *)&self->_interactionModelScore;
    *((_DWORD *)result + 64) |= 0x40u;
  }
LABEL_34:
  *((unsigned char *)result + 252) = self->_wasShareRecipient;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_timeSinceLastContactViaShare != *((_DWORD *)v4 + 62)
    || self->_timeSinceLastContactViaIncomingText != *((_DWORD *)v4 + 59)
    || self->_timeSinceLastContactViaOutgoingText != *((_DWORD *)v4 + 61))
  {
    goto LABEL_160;
  }
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has = self->_has;
  int v6 = *((_DWORD *)v4 + 64);
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_timeSinceLastContactViaIncomingCall != *((_DWORD *)v4 + 58)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x10000000) != 0)
  {
LABEL_160:
    BOOL v8 = 0;
    goto LABEL_161;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v6 & 0x20000000) == 0 || self->_timeSinceLastContactViaOutgoingCall != *((_DWORD *)v4 + 60)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x20000000) != 0)
  {
    goto LABEL_160;
  }
  if (self->_normalizedShareFrequency != *((_DWORD *)v4 + 56)
    || self->_normalizedIncomingTextFrequency != *((_DWORD *)v4 + 53)
    || self->_normalizedOutgoingTextFrequency != *((_DWORD *)v4 + 55))
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_normalizedIncomingCallFrequency != *((_DWORD *)v4 + 52)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_normalizedOutgoingCallFrequency != *((_DWORD *)v4 + 54)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_numberOfBehavioralRulesAdvocating != *((_DWORD *)v4 + 57)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_averageBehavioralRuleSupport != *((double *)v4 + 6)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_160;
  }
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_averageBehavioralRuleConfidence != *((double *)v4 + 1)) {
      goto LABEL_160;
    }
  }
  else if (v6)
  {
    goto LABEL_160;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_averageBehavioralRuleLift != *((double *)v4 + 3)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_160;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_averageBehavioralRuleConviction != *((double *)v4 + 2)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_160;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_averageBehavioralRulePowerFactor != *((double *)v4 + 5)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_160;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_averageBehavioralRuleMLScore != *((double *)v4 + 4)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_minimumBehavioralRuleSupport != *((double *)v4 + 19)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_minimumBehavioralRuleConfidence != *((double *)v4 + 14)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_minimumBehavioralRuleLift != *((double *)v4 + 16)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_minimumBehavioralRuleConviction != *((double *)v4 + 15)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_minimumBehavioralRulePowerFactor != *((double *)v4 + 18)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_minimumBehavioralRuleMLScore != *((double *)v4 + 17)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_maximumBehavioralRuleSupport != *((double *)v4 + 13)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_maximumBehavioralRuleConfidence != *((double *)v4 + 8)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_maximumBehavioralRuleLift != *((double *)v4 + 10)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_maximumBehavioralRuleConviction != *((double *)v4 + 9)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_maximumBehavioralRulePowerFactor != *((double *)v4 + 12)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_maximumBehavioralRuleMLScore != *((double *)v4 + 11)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_stdevBehavioralRuleSupport != *((double *)v4 + 25)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_stdevBehavioralRuleConfidence != *((double *)v4 + 20)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_stdevBehavioralRuleLift != *((double *)v4 + 22)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_stdevBehavioralRuleConviction != *((double *)v4 + 21)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_stdevBehavioralRulePowerFactor != *((double *)v4 + 24)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_stdevBehavioralRuleMLScore != *((double *)v4 + 23)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_160;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_interactionModelScore != *((double *)v4 + 7)) {
      goto LABEL_160;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_160;
  }
  int v7 = v4[252];
  if (self->_wasShareRecipient) {
    BOOL v8 = v7 != 0;
  }
  else {
    BOOL v8 = v7 == 0;
  }
LABEL_161:

  return v8;
}

- (unint64_t)hash
{
  $1451EF63A6CFCCDA6C3A04E30C0EA5C4 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
    uint64_t v158 = 0;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v157 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v158 = 2654435761 * self->_timeSinceLastContactViaIncomingCall;
  if ((*(_DWORD *)&has & 0x20000000) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v157 = 2654435761 * self->_timeSinceLastContactViaOutgoingCall;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_4:
    uint64_t v156 = 2654435761 * self->_normalizedIncomingCallFrequency;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v156 = 0;
LABEL_8:
  if ((*(_DWORD *)&has & 0x4000000) != 0) {
    uint64_t v155 = 2654435761 * self->_normalizedOutgoingCallFrequency;
  }
  else {
    uint64_t v155 = 0;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0) {
    uint64_t v152 = 2654435761 * self->_numberOfBehavioralRulesAdvocating;
  }
  else {
    uint64_t v152 = 0;
  }
  unsigned int normalizedShareFrequency = self->_normalizedShareFrequency;
  unsigned int normalizedIncomingTextFrequency = self->_normalizedIncomingTextFrequency;
  unsigned int normalizedOutgoingTextFrequency = self->_normalizedOutgoingTextFrequency;
  uint64_t timeSinceLastContactViaShare = self->_timeSinceLastContactViaShare;
  uint64_t timeSinceLastContactViaIncomingText = self->_timeSinceLastContactViaIncomingText;
  uint64_t timeSinceLastContactViaOutgoingText = self->_timeSinceLastContactViaOutgoingText;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    double averageBehavioralRuleSupport = self->_averageBehavioralRuleSupport;
    double v6 = -averageBehavioralRuleSupport;
    if (averageBehavioralRuleSupport >= 0.0) {
      double v6 = self->_averageBehavioralRuleSupport;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if (*(unsigned char *)&has)
  {
    double averageBehavioralRuleConfidence = self->_averageBehavioralRuleConfidence;
    double v11 = -averageBehavioralRuleConfidence;
    if (averageBehavioralRuleConfidence >= 0.0) {
      double v11 = self->_averageBehavioralRuleConfidence;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    double averageBehavioralRuleLift = self->_averageBehavioralRuleLift;
    double v16 = -averageBehavioralRuleLift;
    if (averageBehavioralRuleLift >= 0.0) {
      double v16 = self->_averageBehavioralRuleLift;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    double averageBehavioralRuleConviction = self->_averageBehavioralRuleConviction;
    double v21 = -averageBehavioralRuleConviction;
    if (averageBehavioralRuleConviction >= 0.0) {
      double v21 = self->_averageBehavioralRuleConviction;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    double averageBehavioralRulePowerFactor = self->_averageBehavioralRulePowerFactor;
    double v26 = -averageBehavioralRulePowerFactor;
    if (averageBehavioralRulePowerFactor >= 0.0) {
      double v26 = self->_averageBehavioralRulePowerFactor;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    double averageBehavioralRuleMLScore = self->_averageBehavioralRuleMLScore;
    double v31 = -averageBehavioralRuleMLScore;
    if (averageBehavioralRuleMLScore >= 0.0) {
      double v31 = self->_averageBehavioralRuleMLScore;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    double minimumBehavioralRuleSupport = self->_minimumBehavioralRuleSupport;
    double v36 = -minimumBehavioralRuleSupport;
    if (minimumBehavioralRuleSupport >= 0.0) {
      double v36 = self->_minimumBehavioralRuleSupport;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    double minimumBehavioralRuleConfidence = self->_minimumBehavioralRuleConfidence;
    double v41 = -minimumBehavioralRuleConfidence;
    if (minimumBehavioralRuleConfidence >= 0.0) {
      double v41 = self->_minimumBehavioralRuleConfidence;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  unint64_t v143 = v39;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    double minimumBehavioralRuleLift = self->_minimumBehavioralRuleLift;
    double v46 = -minimumBehavioralRuleLift;
    if (minimumBehavioralRuleLift >= 0.0) {
      double v46 = self->_minimumBehavioralRuleLift;
    }
    long double v47 = floor(v46 + 0.5);
    double v48 = (v46 - v47) * 1.84467441e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  unint64_t v142 = v44;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    double minimumBehavioralRuleConviction = self->_minimumBehavioralRuleConviction;
    double v51 = -minimumBehavioralRuleConviction;
    if (minimumBehavioralRuleConviction >= 0.0) {
      double v51 = self->_minimumBehavioralRuleConviction;
    }
    long double v52 = floor(v51 + 0.5);
    double v53 = (v51 - v52) * 1.84467441e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    unint64_t v49 = 0;
  }
  unint64_t v141 = v49;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    double minimumBehavioralRulePowerFactor = self->_minimumBehavioralRulePowerFactor;
    double v56 = -minimumBehavioralRulePowerFactor;
    if (minimumBehavioralRulePowerFactor >= 0.0) {
      double v56 = self->_minimumBehavioralRulePowerFactor;
    }
    long double v57 = floor(v56 + 0.5);
    double v58 = (v56 - v57) * 1.84467441e19;
    unint64_t v54 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0) {
        v54 += (unint64_t)v58;
      }
    }
    else
    {
      v54 -= (unint64_t)fabs(v58);
    }
  }
  else
  {
    unint64_t v54 = 0;
  }
  unint64_t v140 = v54;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    double minimumBehavioralRuleMLScore = self->_minimumBehavioralRuleMLScore;
    double v61 = -minimumBehavioralRuleMLScore;
    if (minimumBehavioralRuleMLScore >= 0.0) {
      double v61 = self->_minimumBehavioralRuleMLScore;
    }
    long double v62 = floor(v61 + 0.5);
    double v63 = (v61 - v62) * 1.84467441e19;
    unint64_t v59 = 2654435761u * (unint64_t)fmod(v62, 1.84467441e19);
    if (v63 >= 0.0)
    {
      if (v63 > 0.0) {
        v59 += (unint64_t)v63;
      }
    }
    else
    {
      v59 -= (unint64_t)fabs(v63);
    }
  }
  else
  {
    unint64_t v59 = 0;
  }
  unint64_t v139 = v59;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    double maximumBehavioralRuleSupport = self->_maximumBehavioralRuleSupport;
    double v66 = -maximumBehavioralRuleSupport;
    if (maximumBehavioralRuleSupport >= 0.0) {
      double v66 = self->_maximumBehavioralRuleSupport;
    }
    long double v67 = floor(v66 + 0.5);
    double v68 = (v66 - v67) * 1.84467441e19;
    unint64_t v64 = 2654435761u * (unint64_t)fmod(v67, 1.84467441e19);
    if (v68 >= 0.0)
    {
      if (v68 > 0.0) {
        v64 += (unint64_t)v68;
      }
    }
    else
    {
      v64 -= (unint64_t)fabs(v68);
    }
  }
  else
  {
    unint64_t v64 = 0;
  }
  unint64_t v138 = v64;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    double maximumBehavioralRuleConfidence = self->_maximumBehavioralRuleConfidence;
    double v71 = -maximumBehavioralRuleConfidence;
    if (maximumBehavioralRuleConfidence >= 0.0) {
      double v71 = self->_maximumBehavioralRuleConfidence;
    }
    long double v72 = floor(v71 + 0.5);
    double v73 = (v71 - v72) * 1.84467441e19;
    unint64_t v69 = 2654435761u * (unint64_t)fmod(v72, 1.84467441e19);
    if (v73 >= 0.0)
    {
      if (v73 > 0.0) {
        v69 += (unint64_t)v73;
      }
    }
    else
    {
      v69 -= (unint64_t)fabs(v73);
    }
  }
  else
  {
    unint64_t v69 = 0;
  }
  unint64_t v137 = v69;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    double maximumBehavioralRuleLift = self->_maximumBehavioralRuleLift;
    double v76 = -maximumBehavioralRuleLift;
    if (maximumBehavioralRuleLift >= 0.0) {
      double v76 = self->_maximumBehavioralRuleLift;
    }
    long double v77 = floor(v76 + 0.5);
    double v78 = (v76 - v77) * 1.84467441e19;
    unint64_t v74 = 2654435761u * (unint64_t)fmod(v77, 1.84467441e19);
    if (v78 >= 0.0)
    {
      if (v78 > 0.0) {
        v74 += (unint64_t)v78;
      }
    }
    else
    {
      v74 -= (unint64_t)fabs(v78);
    }
  }
  else
  {
    unint64_t v74 = 0;
  }
  unint64_t v136 = v74;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    double maximumBehavioralRuleConviction = self->_maximumBehavioralRuleConviction;
    double v81 = -maximumBehavioralRuleConviction;
    if (maximumBehavioralRuleConviction >= 0.0) {
      double v81 = self->_maximumBehavioralRuleConviction;
    }
    long double v82 = floor(v81 + 0.5);
    double v83 = (v81 - v82) * 1.84467441e19;
    unint64_t v79 = 2654435761u * (unint64_t)fmod(v82, 1.84467441e19);
    if (v83 >= 0.0)
    {
      if (v83 > 0.0) {
        v79 += (unint64_t)v83;
      }
    }
    else
    {
      v79 -= (unint64_t)fabs(v83);
    }
  }
  else
  {
    unint64_t v79 = 0;
  }
  unint64_t v135 = v79;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    double maximumBehavioralRulePowerFactor = self->_maximumBehavioralRulePowerFactor;
    double v86 = -maximumBehavioralRulePowerFactor;
    if (maximumBehavioralRulePowerFactor >= 0.0) {
      double v86 = self->_maximumBehavioralRulePowerFactor;
    }
    long double v87 = floor(v86 + 0.5);
    double v88 = (v86 - v87) * 1.84467441e19;
    unint64_t v84 = 2654435761u * (unint64_t)fmod(v87, 1.84467441e19);
    if (v88 >= 0.0)
    {
      if (v88 > 0.0) {
        v84 += (unint64_t)v88;
      }
    }
    else
    {
      v84 -= (unint64_t)fabs(v88);
    }
  }
  else
  {
    unint64_t v84 = 0;
  }
  unint64_t v134 = v84;
  unint64_t v147 = v4;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    double maximumBehavioralRuleMLScore = self->_maximumBehavioralRuleMLScore;
    double v91 = -maximumBehavioralRuleMLScore;
    if (maximumBehavioralRuleMLScore >= 0.0) {
      double v91 = self->_maximumBehavioralRuleMLScore;
    }
    long double v92 = floor(v91 + 0.5);
    double v93 = (v91 - v92) * 1.84467441e19;
    unint64_t v89 = 2654435761u * (unint64_t)fmod(v92, 1.84467441e19);
    if (v93 >= 0.0)
    {
      if (v93 > 0.0) {
        v89 += (unint64_t)v93;
      }
    }
    else
    {
      v89 -= (unint64_t)fabs(v93);
    }
  }
  else
  {
    unint64_t v89 = 0;
  }
  unint64_t v146 = v9;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    double stdevBehavioralRuleSupport = self->_stdevBehavioralRuleSupport;
    double v96 = -stdevBehavioralRuleSupport;
    if (stdevBehavioralRuleSupport >= 0.0) {
      double v96 = self->_stdevBehavioralRuleSupport;
    }
    long double v97 = floor(v96 + 0.5);
    double v98 = (v96 - v97) * 1.84467441e19;
    unint64_t v94 = 2654435761u * (unint64_t)fmod(v97, 1.84467441e19);
    if (v98 >= 0.0)
    {
      if (v98 > 0.0) {
        v94 += (unint64_t)v98;
      }
    }
    else
    {
      v94 -= (unint64_t)fabs(v98);
    }
  }
  else
  {
    unint64_t v94 = 0;
  }
  unint64_t v145 = v14;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    double stdevBehavioralRuleConfidence = self->_stdevBehavioralRuleConfidence;
    double v101 = -stdevBehavioralRuleConfidence;
    if (stdevBehavioralRuleConfidence >= 0.0) {
      double v101 = self->_stdevBehavioralRuleConfidence;
    }
    long double v102 = floor(v101 + 0.5);
    double v103 = (v101 - v102) * 1.84467441e19;
    unint64_t v99 = 2654435761u * (unint64_t)fmod(v102, 1.84467441e19);
    if (v103 >= 0.0)
    {
      if (v103 > 0.0) {
        v99 += (unint64_t)v103;
      }
    }
    else
    {
      v99 -= (unint64_t)fabs(v103);
    }
  }
  else
  {
    unint64_t v99 = 0;
  }
  unint64_t v144 = v19;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    double stdevBehavioralRuleLift = self->_stdevBehavioralRuleLift;
    double v106 = -stdevBehavioralRuleLift;
    if (stdevBehavioralRuleLift >= 0.0) {
      double v106 = self->_stdevBehavioralRuleLift;
    }
    long double v107 = floor(v106 + 0.5);
    double v108 = (v106 - v107) * 1.84467441e19;
    unint64_t v104 = 2654435761u * (unint64_t)fmod(v107, 1.84467441e19);
    if (v108 >= 0.0)
    {
      if (v108 > 0.0) {
        v104 += (unint64_t)v108;
      }
    }
    else
    {
      v104 -= (unint64_t)fabs(v108);
    }
  }
  else
  {
    unint64_t v104 = 0;
  }
  unint64_t v132 = v24;
  unint64_t v133 = v89;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    double stdevBehavioralRuleConviction = self->_stdevBehavioralRuleConviction;
    double v111 = -stdevBehavioralRuleConviction;
    if (stdevBehavioralRuleConviction >= 0.0) {
      double v111 = self->_stdevBehavioralRuleConviction;
    }
    long double v112 = floor(v111 + 0.5);
    double v113 = (v111 - v112) * 1.84467441e19;
    unint64_t v109 = 2654435761u * (unint64_t)fmod(v112, 1.84467441e19);
    if (v113 >= 0.0)
    {
      if (v113 > 0.0) {
        v109 += (unint64_t)v113;
      }
    }
    else
    {
      v109 -= (unint64_t)fabs(v113);
    }
  }
  else
  {
    unint64_t v109 = 0;
  }
  unint64_t v114 = v29;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    double stdevBehavioralRulePowerFactor = self->_stdevBehavioralRulePowerFactor;
    double v117 = -stdevBehavioralRulePowerFactor;
    if (stdevBehavioralRulePowerFactor >= 0.0) {
      double v117 = self->_stdevBehavioralRulePowerFactor;
    }
    long double v118 = floor(v117 + 0.5);
    double v119 = (v117 - v118) * 1.84467441e19;
    unint64_t v115 = 2654435761u * (unint64_t)fmod(v118, 1.84467441e19);
    if (v119 >= 0.0)
    {
      if (v119 > 0.0) {
        v115 += (unint64_t)v119;
      }
    }
    else
    {
      v115 -= (unint64_t)fabs(v119);
    }
  }
  else
  {
    unint64_t v115 = 0;
  }
  unint64_t v120 = v34;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    double stdevBehavioralRuleMLScore = self->_stdevBehavioralRuleMLScore;
    double v123 = -stdevBehavioralRuleMLScore;
    if (stdevBehavioralRuleMLScore >= 0.0) {
      double v123 = self->_stdevBehavioralRuleMLScore;
    }
    long double v124 = floor(v123 + 0.5);
    double v125 = (v123 - v124) * 1.84467441e19;
    unint64_t v121 = 2654435761u * (unint64_t)fmod(v124, 1.84467441e19);
    if (v125 >= 0.0)
    {
      if (v125 > 0.0) {
        v121 += (unint64_t)v125;
      }
    }
    else
    {
      v121 -= (unint64_t)fabs(v125);
    }
  }
  else
  {
    unint64_t v121 = 0;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    double interactionModelScore = self->_interactionModelScore;
    double v128 = -interactionModelScore;
    if (interactionModelScore >= 0.0) {
      double v128 = self->_interactionModelScore;
    }
    long double v129 = floor(v128 + 0.5);
    double v130 = (v128 - v129) * 1.84467441e19;
    unint64_t v126 = 2654435761u * (unint64_t)fmod(v129, 1.84467441e19);
    if (v130 >= 0.0)
    {
      if (v130 > 0.0) {
        v126 += (unint64_t)v130;
      }
    }
    else
    {
      v126 -= (unint64_t)fabs(v130);
    }
  }
  else
  {
    unint64_t v126 = 0;
  }
  return (2654435761 * timeSinceLastContactViaIncomingText) ^ (2654435761 * timeSinceLastContactViaShare) ^ (2654435761 * timeSinceLastContactViaOutgoingText) ^ v158 ^ v157 ^ (2654435761 * normalizedShareFrequency) ^ (2654435761 * normalizedIncomingTextFrequency) ^ (2654435761 * normalizedOutgoingTextFrequency) ^ v156 ^ v155 ^ v152 ^ v147 ^ v146 ^ v145 ^ v144 ^ v132 ^ v114 ^ v120 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v94 ^ v99 ^ v104 ^ v109 ^ v115 ^ v121 ^ v126 ^ (2654435761 * self->_wasShareRecipient);
}

- (void)mergeFrom:(id)a3
{
  self->_uint64_t timeSinceLastContactViaShare = *((_DWORD *)a3 + 62);
  self->_uint64_t timeSinceLastContactViaIncomingText = *((_DWORD *)a3 + 59);
  self->_uint64_t timeSinceLastContactViaOutgoingText = *((_DWORD *)a3 + 61);
  int v3 = *((_DWORD *)a3 + 64);
  if ((v3 & 0x10000000) != 0)
  {
    self->_uint64_t timeSinceLastContactViaIncomingCall = *((_DWORD *)a3 + 58);
    *(_DWORD *)&self->_has |= 0x10000000u;
    int v3 = *((_DWORD *)a3 + 64);
  }
  if ((v3 & 0x20000000) != 0)
  {
    self->_uint64_t timeSinceLastContactViaOutgoingCall = *((_DWORD *)a3 + 60);
    *(_DWORD *)&self->_has |= 0x20000000u;
  }
  self->_unsigned int normalizedShareFrequency = *((_DWORD *)a3 + 56);
  self->_unsigned int normalizedIncomingTextFrequency = *((_DWORD *)a3 + 53);
  self->_unsigned int normalizedOutgoingTextFrequency = *((_DWORD *)a3 + 55);
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x2000000) != 0)
  {
    self->_normalizedIncomingCallFrequency = *((_DWORD *)a3 + 52);
    *(_DWORD *)&self->_has |= 0x2000000u;
    int v4 = *((_DWORD *)a3 + 64);
    if ((v4 & 0x4000000) == 0)
    {
LABEL_7:
      if ((v4 & 0x8000000) == 0) {
        goto LABEL_8;
      }
      goto LABEL_37;
    }
  }
  else if ((v4 & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  self->_normalizedOutgoingCallFrequency = *((_DWORD *)a3 + 54);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x8000000) == 0)
  {
LABEL_8:
    if ((v4 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_numberOfBehavioralRulesAdvocating = *((_DWORD *)a3 + 57);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x20) == 0)
  {
LABEL_9:
    if ((v4 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_double averageBehavioralRuleSupport = *((double *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 1) == 0)
  {
LABEL_10:
    if ((v4 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_double averageBehavioralRuleConfidence = *((double *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 4) == 0)
  {
LABEL_11:
    if ((v4 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_double averageBehavioralRuleLift = *((double *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 2) == 0)
  {
LABEL_12:
    if ((v4 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_double averageBehavioralRuleConviction = *((double *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x10) == 0)
  {
LABEL_13:
    if ((v4 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_double averageBehavioralRulePowerFactor = *((double *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 8) == 0)
  {
LABEL_14:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_double averageBehavioralRuleMLScore = *((double *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x40000) == 0)
  {
LABEL_15:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_double minimumBehavioralRuleSupport = *((double *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x2000) == 0)
  {
LABEL_16:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_double minimumBehavioralRuleConfidence = *((double *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x8000) == 0)
  {
LABEL_17:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_double minimumBehavioralRuleLift = *((double *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x4000) == 0)
  {
LABEL_18:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_double minimumBehavioralRuleConviction = *((double *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x20000) == 0)
  {
LABEL_19:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_double minimumBehavioralRulePowerFactor = *((double *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x10000) == 0)
  {
LABEL_20:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_double minimumBehavioralRuleMLScore = *((double *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x1000) == 0)
  {
LABEL_21:
    if ((v4 & 0x80) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_double maximumBehavioralRuleSupport = *((double *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x80) == 0)
  {
LABEL_22:
    if ((v4 & 0x200) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_double maximumBehavioralRuleConfidence = *((double *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x200) == 0)
  {
LABEL_23:
    if ((v4 & 0x100) == 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_double maximumBehavioralRuleLift = *((double *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x100) == 0)
  {
LABEL_24:
    if ((v4 & 0x800) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_double maximumBehavioralRuleConviction = *((double *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x800) == 0)
  {
LABEL_25:
    if ((v4 & 0x400) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_double maximumBehavioralRulePowerFactor = *((double *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x400) == 0)
  {
LABEL_26:
    if ((v4 & 0x1000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_double maximumBehavioralRuleMLScore = *((double *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x1000000) == 0)
  {
LABEL_27:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_double stdevBehavioralRuleSupport = *((double *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x80000) == 0)
  {
LABEL_28:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_double stdevBehavioralRuleConfidence = *((double *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x200000) == 0)
  {
LABEL_29:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_double stdevBehavioralRuleLift = *((double *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x100000) == 0)
  {
LABEL_30:
    if ((v4 & 0x800000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_double stdevBehavioralRuleConviction = *((double *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x800000) == 0)
  {
LABEL_31:
    if ((v4 & 0x400000) == 0) {
      goto LABEL_32;
    }
LABEL_61:
    self->_double stdevBehavioralRuleMLScore = *((double *)a3 + 23);
    *(_DWORD *)&self->_has |= 0x400000u;
    if ((*((_DWORD *)a3 + 64) & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_60:
  self->_double stdevBehavioralRulePowerFactor = *((double *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v4 = *((_DWORD *)a3 + 64);
  if ((v4 & 0x400000) != 0) {
    goto LABEL_61;
  }
LABEL_32:
  if ((v4 & 0x40) != 0)
  {
LABEL_33:
    self->_double interactionModelScore = *((double *)a3 + 7);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_34:
  self->_wasShareRecipient = *((unsigned char *)a3 + 252);
}

- (int)timeSinceLastContactViaShare
{
  return self->_timeSinceLastContactViaShare;
}

- (void)setTimeSinceLastContactViaShare:(int)a3
{
  self->_uint64_t timeSinceLastContactViaShare = a3;
}

- (int)timeSinceLastContactViaIncomingText
{
  return self->_timeSinceLastContactViaIncomingText;
}

- (void)setTimeSinceLastContactViaIncomingText:(int)a3
{
  self->_uint64_t timeSinceLastContactViaIncomingText = a3;
}

- (int)timeSinceLastContactViaOutgoingText
{
  return self->_timeSinceLastContactViaOutgoingText;
}

- (void)setTimeSinceLastContactViaOutgoingText:(int)a3
{
  self->_uint64_t timeSinceLastContactViaOutgoingText = a3;
}

- (unsigned)normalizedShareFrequency
{
  return self->_normalizedShareFrequency;
}

- (void)setNormalizedShareFrequency:(unsigned int)a3
{
  self->_unsigned int normalizedShareFrequency = a3;
}

- (unsigned)normalizedIncomingTextFrequency
{
  return self->_normalizedIncomingTextFrequency;
}

- (void)setNormalizedIncomingTextFrequency:(unsigned int)a3
{
  self->_unsigned int normalizedIncomingTextFrequency = a3;
}

- (unsigned)normalizedOutgoingTextFrequency
{
  return self->_normalizedOutgoingTextFrequency;
}

- (void)setNormalizedOutgoingTextFrequency:(unsigned int)a3
{
  self->_unsigned int normalizedOutgoingTextFrequency = a3;
}

- (unsigned)normalizedIncomingCallFrequency
{
  return self->_normalizedIncomingCallFrequency;
}

- (unsigned)normalizedOutgoingCallFrequency
{
  return self->_normalizedOutgoingCallFrequency;
}

- (unsigned)numberOfBehavioralRulesAdvocating
{
  return self->_numberOfBehavioralRulesAdvocating;
}

- (double)averageBehavioralRuleSupport
{
  return self->_averageBehavioralRuleSupport;
}

- (double)averageBehavioralRuleConfidence
{
  return self->_averageBehavioralRuleConfidence;
}

- (double)averageBehavioralRuleLift
{
  return self->_averageBehavioralRuleLift;
}

- (double)averageBehavioralRuleConviction
{
  return self->_averageBehavioralRuleConviction;
}

- (double)averageBehavioralRulePowerFactor
{
  return self->_averageBehavioralRulePowerFactor;
}

- (double)averageBehavioralRuleMLScore
{
  return self->_averageBehavioralRuleMLScore;
}

- (double)minimumBehavioralRuleSupport
{
  return self->_minimumBehavioralRuleSupport;
}

- (double)minimumBehavioralRuleConfidence
{
  return self->_minimumBehavioralRuleConfidence;
}

- (double)minimumBehavioralRuleLift
{
  return self->_minimumBehavioralRuleLift;
}

- (double)minimumBehavioralRuleConviction
{
  return self->_minimumBehavioralRuleConviction;
}

- (double)minimumBehavioralRulePowerFactor
{
  return self->_minimumBehavioralRulePowerFactor;
}

- (double)minimumBehavioralRuleMLScore
{
  return self->_minimumBehavioralRuleMLScore;
}

- (double)maximumBehavioralRuleSupport
{
  return self->_maximumBehavioralRuleSupport;
}

- (double)maximumBehavioralRuleConfidence
{
  return self->_maximumBehavioralRuleConfidence;
}

- (double)maximumBehavioralRuleLift
{
  return self->_maximumBehavioralRuleLift;
}

- (double)maximumBehavioralRuleConviction
{
  return self->_maximumBehavioralRuleConviction;
}

- (double)maximumBehavioralRulePowerFactor
{
  return self->_maximumBehavioralRulePowerFactor;
}

- (double)maximumBehavioralRuleMLScore
{
  return self->_maximumBehavioralRuleMLScore;
}

- (double)stdevBehavioralRuleSupport
{
  return self->_stdevBehavioralRuleSupport;
}

- (double)stdevBehavioralRuleConfidence
{
  return self->_stdevBehavioralRuleConfidence;
}

- (double)stdevBehavioralRuleLift
{
  return self->_stdevBehavioralRuleLift;
}

- (double)stdevBehavioralRuleConviction
{
  return self->_stdevBehavioralRuleConviction;
}

- (double)stdevBehavioralRulePowerFactor
{
  return self->_stdevBehavioralRulePowerFactor;
}

- (double)stdevBehavioralRuleMLScore
{
  return self->_stdevBehavioralRuleMLScore;
}

- (double)interactionModelScore
{
  return self->_interactionModelScore;
}

- (BOOL)wasShareRecipient
{
  return self->_wasShareRecipient;
}

- (void)setWasShareRecipient:(BOOL)a3
{
  self->_wasShareRecipient = a3;
}

@end