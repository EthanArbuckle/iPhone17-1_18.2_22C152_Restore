@interface NTKSiderealSector
+ (BOOL)supportsSecureCoding;
- (NTKSiderealSector)initWithCoder:(id)a3;
- (NTKSiderealSector)initWithStartingEvent:(id)a3 endingEvent:(id)a4;
- (NTKSiderealSolarEvent)endingEvent;
- (NTKSiderealSolarEvent)startingEvent;
- (double)gradientEndPoint;
- (double)gradientStartPoint;
- (id)description;
- (id)localizedName;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setEndingEvent:(id)a3;
- (void)setGradientEndPoint:(NTKSiderealSector *)self;
- (void)setGradientStartPoint:(NTKSiderealSector *)self;
- (void)setStartingEvent:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation NTKSiderealSector

- (NTKSiderealSector)initWithStartingEvent:(id)a3 endingEvent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKSiderealSector;
  v9 = [(NTKSiderealSector *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startingEvent, a3);
    objc_storeStrong((id *)&v10->_endingEvent, a4);
    unint64_t v11 = [v7 type];
    if (v11 <= 9) {
      v10->_type = qword_1BC8A2520[v11];
    }
  }

  return v10;
}

- (NTKSiderealSector)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NTKSiderealSector;
  v5 = [(NTKSiderealSector *)&v24 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"type"];
    v5->_type = [v6 unsignedIntegerValue];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startingEvent"];
    startingEvent = v5->_startingEvent;
    v5->_startingEvent = (NTKSiderealSolarEvent *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endingEvent"];
    endingEvent = v5->_endingEvent;
    v5->_endingEvent = (NTKSiderealSolarEvent *)v9;

    unint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gradientStartPoint.x"];
    [v11 floatValue];
    unsigned int v23 = v12;

    objc_super v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gradientStartPoint.y"];
    [v13 floatValue];
    unsigned int v22 = v14;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gradientEndPoint.x"];
    [v15 floatValue];
    unsigned int v21 = v16;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gradientEndPoint.y"];
    [v17 floatValue];
    unsigned int v20 = v18;

    *(void *)v5->_gradientStartPoint = __PAIR64__(v22, v23);
    *(void *)v5->_gradientEndPoint = __PAIR64__(v20, v21);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  unint64_t type = self->_type;
  id v6 = a3;
  uint64_t v7 = [v4 numberWithUnsignedInteger:type];
  [v6 encodeObject:v7 forKey:@"type"];

  [v6 encodeObject:self->_startingEvent forKey:@"startingEvent"];
  [v6 encodeObject:self->_endingEvent forKey:@"endingEvent"];
  id v8 = [NSNumber numberWithFloat:*(double *)self->_gradientStartPoint];
  [v6 encodeObject:v8 forKey:@"gradientStartPoint.x"];

  LODWORD(v9) = *(_DWORD *)&self->_gradientStartPoint[4];
  v10 = [NSNumber numberWithFloat:v9];
  [v6 encodeObject:v10 forKey:@"gradientStartPoint.y"];

  unint64_t v11 = [NSNumber numberWithFloat:*(double *)self->_gradientEndPoint];
  [v6 encodeObject:v11 forKey:@"gradientEndPoint.x"];

  LODWORD(v12) = *(_DWORD *)&self->_gradientEndPoint[4];
  id v13 = [NSNumber numberWithFloat:v12];
  [v6 encodeObject:v13 forKey:@"gradientEndPoint.y"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(NTKSiderealSector *)self localizedName];
  [(NTKSiderealSolarEvent *)self->_startingEvent angle];
  uint64_t v6 = v5;
  [(NTKSiderealSolarEvent *)self->_endingEvent angle];
  id v8 = [v3 stringWithFormat:@"SiderealSector: %@ %f %f", v4, v6, v7];

  return v8;
}

- (id)localizedName
{
  p_localizedName = &self->_localizedName;
  localizedName = self->_localizedName;
  if (localizedName)
  {
    id v4 = localizedName;
  }
  else
  {
    switch(self->_type)
    {
      case 0uLL:
        uint64_t v5 = NTKBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"SOLAR_DAYTIME";
        goto LABEL_13;
      case 1uLL:
        uint64_t v5 = NTKBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"SOLAR_TWILIGHT_CIVIL_DAWN";
        goto LABEL_13;
      case 2uLL:
        uint64_t v5 = NTKBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"SOLAR_TWILIGHT_CIVIL_DUSK";
        goto LABEL_13;
      case 3uLL:
        uint64_t v5 = NTKBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"SOLAR_TWILIGHT_NAUTICAL_DAWN";
        goto LABEL_13;
      case 4uLL:
        uint64_t v5 = NTKBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"SOLAR_TWILIGHT_NAUTICAL_DUSK";
        goto LABEL_13;
      case 5uLL:
        uint64_t v5 = NTKBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"SOLAR_TWILIGHT_ASTRONOMICAL_DAWN";
        goto LABEL_13;
      case 6uLL:
        uint64_t v5 = NTKBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"SOLAR_TWILIGHT_ASTRONOMICAL_DUSK";
        goto LABEL_13;
      case 7uLL:
        uint64_t v5 = NTKBundle();
        uint64_t v6 = v5;
        uint64_t v7 = @"SOLAR_NIGHTTIME";
LABEL_13:
        id v4 = [v5 localizedStringForKey:v7 value:&stru_1F1635E90 table:@"Sidereal"];

        break;
      default:
        id v4 = &stru_1F1635E90;
        break;
    }
    objc_storeStrong((id *)p_localizedName, v4);
  }
  return v4;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_unint64_t type = a3;
}

- (NTKSiderealSolarEvent)startingEvent
{
  return self->_startingEvent;
}

- (void)setStartingEvent:(id)a3
{
}

- (NTKSiderealSolarEvent)endingEvent
{
  return self->_endingEvent;
}

- (void)setEndingEvent:(id)a3
{
}

- (double)gradientStartPoint
{
  return *(double *)(a1 + 40);
}

- (void)setGradientStartPoint:(NTKSiderealSector *)self
{
  *(void *)self->_gradientStartPoint = v2;
}

- (double)gradientEndPoint
{
  return *(double *)(a1 + 48);
}

- (void)setGradientEndPoint:(NTKSiderealSector *)self
{
  *(void *)self->_gradientEndPoint = v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endingEvent, 0);
  objc_storeStrong((id *)&self->_startingEvent, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end