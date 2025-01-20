@interface TransitDirectionsListBoardingInfoItem
- (BOOL)shouldHideInExpandedDisplayStyle;
- (GEOTransitBoardingInfo)boardingInfo;
- (NSArray)preboardingStrings;
- (TransitDirectionsListBoardingInfoItem)initWithBoardingInfo:(id)a3;
- (TransitDirectionsListBoardingInfoItem)initWithPreboardingStrings:(id)a3;
@end

@implementation TransitDirectionsListBoardingInfoItem

- (TransitDirectionsListBoardingInfoItem)initWithBoardingInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsListBoardingInfoItem;
  v6 = [(TransitDirectionsListItem *)&v9 initWithInstructions:0];
  v7 = v6;
  if (v6)
  {
    [(TransitDirectionsListItem *)v6 setType:16];
    objc_storeStrong((id *)&v7->_boardingInfo, a3);
  }

  return v7;
}

- (TransitDirectionsListBoardingInfoItem)initWithPreboardingStrings:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TransitDirectionsListBoardingInfoItem;
  v6 = [(TransitDirectionsListItem *)&v9 initWithInstructions:0];
  v7 = v6;
  if (v6)
  {
    [(TransitDirectionsListItem *)v6 setType:16];
    objc_storeStrong((id *)&v7->_preboardingStrings, a3);
  }

  return v7;
}

- (BOOL)shouldHideInExpandedDisplayStyle
{
  return self->_preboardingStrings != 0;
}

- (GEOTransitBoardingInfo)boardingInfo
{
  return self->_boardingInfo;
}

- (NSArray)preboardingStrings
{
  return self->_preboardingStrings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preboardingStrings, 0);

  objc_storeStrong((id *)&self->_boardingInfo, 0);
}

@end