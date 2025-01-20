@interface PGGraphResolvedPlace
- (NSString)placeInterestType;
- (PGGraphResolvedPlace)initWithPlaceOfInterestType:(id)a3 confidence:(double)a4;
- (double)confidence;
@end

@implementation PGGraphResolvedPlace

- (void).cxx_destruct
{
}

- (double)confidence
{
  return self->_confidence;
}

- (NSString)placeInterestType
{
  return self->_placeInterestType;
}

- (PGGraphResolvedPlace)initWithPlaceOfInterestType:(id)a3 confidence:(double)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphResolvedPlace;
  v8 = [(PGGraphResolvedPlace *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_placeInterestType, a3);
    v9->_confidence = a4;
  }

  return v9;
}

@end