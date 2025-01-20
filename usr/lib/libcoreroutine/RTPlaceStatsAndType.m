@interface RTPlaceStatsAndType
- (NSUUID)placeIdentifier;
- (RTLearnedPlaceTypeInferencePlaceStats)placeStats;
- (RTPlaceStatsAndType)initWithPlaceStats:(id)a3 type:(unint64_t)a4 placeIdentifier:(id)a5;
- (unint64_t)type;
@end

@implementation RTPlaceStatsAndType

- (RTPlaceStatsAndType)initWithPlaceStats:(id)a3 type:(unint64_t)a4 placeIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)RTPlaceStatsAndType;
  v11 = [(RTPlaceStatsAndType *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_placeStats, a3);
    v12->_type = a4;
    objc_storeStrong((id *)&v12->_placeIdentifier, a5);
  }

  return v12;
}

- (RTLearnedPlaceTypeInferencePlaceStats)placeStats
{
  return self->_placeStats;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSUUID)placeIdentifier
{
  return self->_placeIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeIdentifier, 0);

  objc_storeStrong((id *)&self->_placeStats, 0);
}

@end