@interface TAMetricsDetection
+ (BOOL)supportsSecureCoding;
+ (id)convertTADetectionTypeToString:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (TAGeneralDetectionMetrics)generalDetectionMetrics;
- (TAMetricsDetection)initWithCoder:(id)a3;
- (TAMetricsDetection)initWithDetectionType:(unint64_t)a3 visitDetectionMetrics:(id)a4 generalDetectionMetrics:(id)a5 singleVisitDetectionMetrics:(id)a6 latestAdvertisement:(id)a7;
- (TASPAdvertisement)latestAdvertisement;
- (TASingleVisitDetectionMetrics)singleVisitDetectionMetrics;
- (TAVisitDetectionMetrics)visitDetectionMetrics;
- (unint64_t)detectionType;
- (unint64_t)getMetricsCollectionType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TAMetricsDetection

- (TAMetricsDetection)initWithDetectionType:(unint64_t)a3 visitDetectionMetrics:(id)a4 generalDetectionMetrics:(id)a5 singleVisitDetectionMetrics:(id)a6 latestAdvertisement:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TAMetricsDetection;
  v17 = [(TAMetricsDetection *)&v20 init];
  v18 = v17;
  if (v17)
  {
    v17->_detectionType = a3;
    objc_storeStrong((id *)&v17->_latestAdvertisement, a7);
    if (v13) {
      objc_storeStrong((id *)&v18->_visitDetectionMetrics, a4);
    }
    if (v14) {
      objc_storeStrong((id *)&v18->_generalDetectionMetrics, a5);
    }
    if (v15) {
      objc_storeStrong((id *)&v18->_singleVisitDetectionMetrics, a6);
    }
    switch(v18->_detectionType)
    {
      case 0uLL:
        goto LABEL_10;
      case 1uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
        if (!v18->_generalDetectionMetrics) {
          goto LABEL_10;
        }
        break;
      case 2uLL:
      case 4uLL:
      case 5uLL:
      case 0x10uLL:
        if (!v18->_visitDetectionMetrics) {
          goto LABEL_10;
        }
        break;
      case 3uLL:
      case 6uLL:
      case 0xAuLL:
      case 0xBuLL:
        if (!v18->_singleVisitDetectionMetrics)
        {
LABEL_10:

          v18 = 0;
        }
        break;
      default:
        break;
    }
  }

  return v18;
}

- (unint64_t)getMetricsCollectionType
{
  return 3;
}

+ (id)convertTADetectionTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 0xF) {
    return @"Unknown";
  }
  else {
    return off_2646AAAC0[a3 - 1];
  }
}

- (BOOL)isEqual:(id)a3
{
  v5 = (TAMetricsDetection *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v5;
      unint64_t v7 = [(TAMetricsDetection *)self detectionType];
      if (v7 != [(TAMetricsDetection *)v6 detectionType])
      {
        char v11 = 0;
LABEL_29:

        goto LABEL_30;
      }
      v8 = [(TAMetricsDetection *)self visitDetectionMetrics];
      v9 = [(TAMetricsDetection *)v6 visitDetectionMetrics];
      if (v8 != v9)
      {
        v10 = [(TAMetricsDetection *)self visitDetectionMetrics];
        v3 = [(TAMetricsDetection *)v6 visitDetectionMetrics];
        v33 = v10;
        if (![v10 isEqual:v3])
        {
          char v11 = 0;
          goto LABEL_27;
        }
      }
      v12 = [(TAMetricsDetection *)self generalDetectionMetrics];
      id v13 = [(TAMetricsDetection *)v6 generalDetectionMetrics];
      if (v12 != v13)
      {
        id v14 = [(TAMetricsDetection *)self generalDetectionMetrics];
        v32 = [(TAMetricsDetection *)v6 generalDetectionMetrics];
        if (!objc_msgSend(v14, "isEqual:"))
        {
          char v11 = 0;
LABEL_25:

LABEL_26:
          if (v8 == v9)
          {
LABEL_28:

            goto LABEL_29;
          }
LABEL_27:

          goto LABEL_28;
        }
        v30 = v14;
      }
      uint64_t v15 = [(TAMetricsDetection *)self singleVisitDetectionMetrics];
      id v16 = [(TAMetricsDetection *)v6 singleVisitDetectionMetrics];
      v31 = (void *)v15;
      if ((void *)v15 == v16)
      {
        v26 = v13;
        v27 = v12;
      }
      else
      {
        v17 = [(TAMetricsDetection *)self singleVisitDetectionMetrics];
        v28 = [(TAMetricsDetection *)v6 singleVisitDetectionMetrics];
        v29 = v17;
        if (!objc_msgSend(v17, "isEqual:"))
        {
          char v11 = 0;
          v23 = v31;
          goto LABEL_23;
        }
        v26 = v13;
        v27 = v12;
      }
      v18 = [(TAMetricsDetection *)self latestAdvertisement];
      uint64_t v19 = [(TAMetricsDetection *)v6 latestAdvertisement];
      if (v18 == (void *)v19)
      {

        char v11 = 1;
      }
      else
      {
        objc_super v20 = (void *)v19;
        [(TAMetricsDetection *)self latestAdvertisement];
        v21 = v25 = v3;
        v22 = [(TAMetricsDetection *)v6 latestAdvertisement];
        char v11 = [v21 isEqual:v22];

        v3 = v25;
      }
      v23 = v31;
      id v13 = v26;
      v12 = v27;
      if (v31 == v16)
      {
LABEL_24:

        id v14 = v30;
        if (v12 == v13) {
          goto LABEL_26;
        }
        goto LABEL_25;
      }
LABEL_23:

      goto LABEL_24;
    }
    char v11 = 0;
  }
LABEL_30:

  return v11;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"MetricsType: TAMetricsDetection, DetectionType: %lu", self->_detectionType];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TAMetricsDetection)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"MType"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MVisitMetrics"];
  unint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MGeneralMetrics"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSingleMetrics"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MLatestAdvert"];

  v10 = [(TAMetricsDetection *)self initWithDetectionType:v5 visitDetectionMetrics:v6 generalDetectionMetrics:v7 singleVisitDetectionMetrics:v8 latestAdvertisement:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t detectionType = self->_detectionType;
  id v5 = a3;
  [v5 encodeInteger:detectionType forKey:@"MType"];
  [v5 encodeObject:self->_visitDetectionMetrics forKey:@"MVisitMetrics"];
  [v5 encodeObject:self->_generalDetectionMetrics forKey:@"MGeneralMetrics"];
  [v5 encodeObject:self->_singleVisitDetectionMetrics forKey:@"MSingleMetrics"];
  [v5 encodeObject:self->_latestAdvertisement forKey:@"MLatestAdvert"];
}

- (unint64_t)detectionType
{
  return self->_detectionType;
}

- (TAGeneralDetectionMetrics)generalDetectionMetrics
{
  return self->_generalDetectionMetrics;
}

- (TAVisitDetectionMetrics)visitDetectionMetrics
{
  return self->_visitDetectionMetrics;
}

- (TASingleVisitDetectionMetrics)singleVisitDetectionMetrics
{
  return self->_singleVisitDetectionMetrics;
}

- (TASPAdvertisement)latestAdvertisement
{
  return self->_latestAdvertisement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestAdvertisement, 0);
  objc_storeStrong((id *)&self->_singleVisitDetectionMetrics, 0);
  objc_storeStrong((id *)&self->_visitDetectionMetrics, 0);
  objc_storeStrong((id *)&self->_generalDetectionMetrics, 0);
}

@end