@interface RTAuthorizedLocationCurationMetrics
- (RTAuthorizedLocationCurationMetrics)init;
- (float)fractionOfVisitsToTopLOIWithGPS;
- (float)fractionOfVisitsToTopLOIWithWiFiHI;
- (float)maxCumulativeDwellTimeForNotFamiliarLoiHours;
- (float)registrationUsesBestTimeFraction;
- (float)visitRegistrationFraction;
- (int)ageDaysFirstAnyLoiVisit;
- (int)ageDaysFirstTopLoiGeoVisit;
- (int)ageDaysFirstTopLoiRegisteredVisit;
- (int)ageDaysFirstTopLoiVisit;
- (int)ageDaysRegistry;
- (int)maxUniqueVisitDaysForNotFamiliarLois;
- (int)visitsToTopLOIWithTechAvailabilityKnown;
- (void)setAgeDaysFirstAnyLoiVisit:(int)a3;
- (void)setAgeDaysFirstTopLoiGeoVisit:(int)a3;
- (void)setAgeDaysFirstTopLoiRegisteredVisit:(int)a3;
- (void)setAgeDaysFirstTopLoiVisit:(int)a3;
- (void)setAgeDaysRegistry:(int)a3;
- (void)setFractionOfVisitsToTopLOIWithGPS:(float)a3;
- (void)setFractionOfVisitsToTopLOIWithWiFiHI:(float)a3;
- (void)setMaxCumulativeDwellTimeForNotFamiliarLoiHours:(float)a3;
- (void)setMaxUniqueVisitDaysForNotFamiliarLois:(int)a3;
- (void)setRegistrationUsesBestTimeFraction:(float)a3;
- (void)setVisitRegistrationFraction:(float)a3;
- (void)setVisitsToTopLOIWithTechAvailabilityKnown:(int)a3;
@end

@implementation RTAuthorizedLocationCurationMetrics

- (RTAuthorizedLocationCurationMetrics)init
{
  v8.receiver = self;
  v8.super_class = (Class)RTAuthorizedLocationCurationMetrics;
  result = [(RTAuthorizedLocationCurationMetrics *)&v8 init];
  if (result)
  {
    result->_maxCumulativeDwellTimeForNotFamiliarLoiHours = -1.0;
    *(void *)&result->_maxUniqueVisitDaysForNotFamiliarLois = -1;
    *(void *)&result->_ageDaysFirstAnyLoiVisit = -1;
    *(void *)&result->_ageDaysFirstTopLoiRegisteredVisit = -1;
    __asm { FMOV            V0.2S, #-1.0 }
    *(void *)&result->_visitRegistrationFraction = _D0;
    result->_visitsToTopLOIWithTechAvailabilityKnown = -1;
    *(void *)&result->_fractionOfVisitsToTopLOIWithGPS = _D0;
  }
  return result;
}

- (float)maxCumulativeDwellTimeForNotFamiliarLoiHours
{
  return self->_maxCumulativeDwellTimeForNotFamiliarLoiHours;
}

- (void)setMaxCumulativeDwellTimeForNotFamiliarLoiHours:(float)a3
{
  self->_maxCumulativeDwellTimeForNotFamiliarLoiHours = a3;
}

- (int)maxUniqueVisitDaysForNotFamiliarLois
{
  return self->_maxUniqueVisitDaysForNotFamiliarLois;
}

- (void)setMaxUniqueVisitDaysForNotFamiliarLois:(int)a3
{
  self->_maxUniqueVisitDaysForNotFamiliarLois = a3;
}

- (int)ageDaysRegistry
{
  return self->_ageDaysRegistry;
}

- (void)setAgeDaysRegistry:(int)a3
{
  self->_ageDaysRegistry = a3;
}

- (int)ageDaysFirstAnyLoiVisit
{
  return self->_ageDaysFirstAnyLoiVisit;
}

- (void)setAgeDaysFirstAnyLoiVisit:(int)a3
{
  self->_ageDaysFirstAnyLoiVisit = a3;
}

- (int)ageDaysFirstTopLoiVisit
{
  return self->_ageDaysFirstTopLoiVisit;
}

- (void)setAgeDaysFirstTopLoiVisit:(int)a3
{
  self->_ageDaysFirstTopLoiVisit = a3;
}

- (int)ageDaysFirstTopLoiRegisteredVisit
{
  return self->_ageDaysFirstTopLoiRegisteredVisit;
}

- (void)setAgeDaysFirstTopLoiRegisteredVisit:(int)a3
{
  self->_ageDaysFirstTopLoiRegisteredVisit = a3;
}

- (int)ageDaysFirstTopLoiGeoVisit
{
  return self->_ageDaysFirstTopLoiGeoVisit;
}

- (void)setAgeDaysFirstTopLoiGeoVisit:(int)a3
{
  self->_ageDaysFirstTopLoiGeoVisit = a3;
}

- (float)visitRegistrationFraction
{
  return self->_visitRegistrationFraction;
}

- (void)setVisitRegistrationFraction:(float)a3
{
  self->_visitRegistrationFraction = a3;
}

- (float)registrationUsesBestTimeFraction
{
  return self->_registrationUsesBestTimeFraction;
}

- (void)setRegistrationUsesBestTimeFraction:(float)a3
{
  self->_registrationUsesBestTimeFraction = a3;
}

- (int)visitsToTopLOIWithTechAvailabilityKnown
{
  return self->_visitsToTopLOIWithTechAvailabilityKnown;
}

- (void)setVisitsToTopLOIWithTechAvailabilityKnown:(int)a3
{
  self->_visitsToTopLOIWithTechAvailabilityKnown = a3;
}

- (float)fractionOfVisitsToTopLOIWithGPS
{
  return self->_fractionOfVisitsToTopLOIWithGPS;
}

- (void)setFractionOfVisitsToTopLOIWithGPS:(float)a3
{
  self->_fractionOfVisitsToTopLOIWithGPS = a3;
}

- (float)fractionOfVisitsToTopLOIWithWiFiHI
{
  return self->_fractionOfVisitsToTopLOIWithWiFiHI;
}

- (void)setFractionOfVisitsToTopLOIWithWiFiHI:(float)a3
{
  self->_fractionOfVisitsToTopLOIWithWiFiHI = a3;
}

@end