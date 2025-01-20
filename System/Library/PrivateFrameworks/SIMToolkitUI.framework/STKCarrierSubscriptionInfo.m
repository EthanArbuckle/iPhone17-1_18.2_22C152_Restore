@interface STKCarrierSubscriptionInfo
- (BOOL)canShowClass0SMSOverInCallAlerts;
- (BOOL)showClass0SMSFromField;
- (NSArray)ussdAlwaysFilteredPatterns;
- (NSArray)ussdSometimesFilteredPatterns;
- (STKCarrierSubscriptionInfo)initWithShowClass0SMSFromField:(BOOL)a3 canShowClass0SMSOverInCallAlerts:(BOOL)a4 ussdAlwaysFilteredPatterns:(id)a5 ussdSometimesFilteredPatterns:(id)a6;
- (STKUSSDFilter)ussdFilter;
@end

@implementation STKCarrierSubscriptionInfo

- (STKCarrierSubscriptionInfo)initWithShowClass0SMSFromField:(BOOL)a3 canShowClass0SMSOverInCallAlerts:(BOOL)a4 ussdAlwaysFilteredPatterns:(id)a5 ussdSometimesFilteredPatterns:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)STKCarrierSubscriptionInfo;
  v12 = [(STKCarrierSubscriptionInfo *)&v21 init];
  v13 = v12;
  if (v12)
  {
    v12->_canShowClass0SMSOverInCallAlerts = a4;
    v12->_showClass0SMSFromField = a3;
    uint64_t v14 = [(NSArray *)v12->_ussdAlwaysFilteredPatterns copy];
    ussdAlwaysFilteredPatterns = v13->_ussdAlwaysFilteredPatterns;
    v13->_ussdAlwaysFilteredPatterns = (NSArray *)v14;

    uint64_t v16 = [(NSArray *)v13->_ussdSometimesFilteredPatterns copy];
    ussdSometimesFilteredPatterns = v13->_ussdSometimesFilteredPatterns;
    v13->_ussdSometimesFilteredPatterns = (NSArray *)v16;

    v18 = [[STKUSSDFilter alloc] initWithAlwaysFilteredPatterns:v10 sometimesFilteredPatterns:v11];
    ussdFilter = v13->_ussdFilter;
    v13->_ussdFilter = v18;
  }
  return v13;
}

- (BOOL)canShowClass0SMSOverInCallAlerts
{
  return self->_canShowClass0SMSOverInCallAlerts;
}

- (BOOL)showClass0SMSFromField
{
  return self->_showClass0SMSFromField;
}

- (NSArray)ussdAlwaysFilteredPatterns
{
  return self->_ussdAlwaysFilteredPatterns;
}

- (NSArray)ussdSometimesFilteredPatterns
{
  return self->_ussdSometimesFilteredPatterns;
}

- (STKUSSDFilter)ussdFilter
{
  return self->_ussdFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ussdFilter, 0);
  objc_storeStrong((id *)&self->_ussdSometimesFilteredPatterns, 0);

  objc_storeStrong((id *)&self->_ussdAlwaysFilteredPatterns, 0);
}

@end