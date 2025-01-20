@interface ODCurareReportFillerDataSetStats
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)featureName;
- (NSString)featureValueMax;
- (NSString)featureValueMean;
- (NSString)featureValueMin;
- (NSString)featureValuePercentile10;
- (NSString)featureValuePercentile25;
- (NSString)featureValuePercentile50;
- (NSString)featureValuePercentile75;
- (NSString)featureValuePercentile90;
- (NSString)featureValueStd;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFeatureName:(id)a3;
- (void)setFeatureValueMax:(id)a3;
- (void)setFeatureValueMean:(id)a3;
- (void)setFeatureValueMin:(id)a3;
- (void)setFeatureValuePercentile10:(id)a3;
- (void)setFeatureValuePercentile25:(id)a3;
- (void)setFeatureValuePercentile50:(id)a3;
- (void)setFeatureValuePercentile75:(id)a3;
- (void)setFeatureValuePercentile90:(id)a3;
- (void)setFeatureValueStd:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODCurareReportFillerDataSetStats

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerDataSetStats;
  v4 = [(ODCurareReportFillerDataSetStats *)&v8 description];
  v5 = [(ODCurareReportFillerDataSetStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  featureName = self->_featureName;
  if (featureName) {
    [v3 setObject:featureName forKey:@"featureName"];
  }
  featureValueMin = self->_featureValueMin;
  if (featureValueMin) {
    [v4 setObject:featureValueMin forKey:@"featureValueMin"];
  }
  featureValueMax = self->_featureValueMax;
  if (featureValueMax) {
    [v4 setObject:featureValueMax forKey:@"featureValueMax"];
  }
  featureValueMean = self->_featureValueMean;
  if (featureValueMean) {
    [v4 setObject:featureValueMean forKey:@"featureValueMean"];
  }
  featureValueStd = self->_featureValueStd;
  if (featureValueStd) {
    [v4 setObject:featureValueStd forKey:@"featureValueStd"];
  }
  featureValuePercentile10 = self->_featureValuePercentile10;
  if (featureValuePercentile10) {
    [v4 setObject:featureValuePercentile10 forKey:@"featureValuePercentile10"];
  }
  featureValuePercentile25 = self->_featureValuePercentile25;
  if (featureValuePercentile25) {
    [v4 setObject:featureValuePercentile25 forKey:@"featureValuePercentile25"];
  }
  featureValuePercentile50 = self->_featureValuePercentile50;
  if (featureValuePercentile50) {
    [v4 setObject:featureValuePercentile50 forKey:@"featureValuePercentile50"];
  }
  featureValuePercentile75 = self->_featureValuePercentile75;
  if (featureValuePercentile75) {
    [v4 setObject:featureValuePercentile75 forKey:@"featureValuePercentile75"];
  }
  featureValuePercentile90 = self->_featureValuePercentile90;
  if (featureValuePercentile90) {
    [v4 setObject:featureValuePercentile90 forKey:@"featureValuePercentile90"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerDataSetStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_featureName) {
    -[ODCurareReportFillerDataSetStats writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_featureValueMin) {
    -[ODCurareReportFillerDataSetStats writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_featureValueMax) {
    -[ODCurareReportFillerDataSetStats writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (!self->_featureValueMean) {
    -[ODCurareReportFillerDataSetStats writeTo:].cold.4();
  }
  PBDataWriterWriteStringField();
  if (!self->_featureValueStd) {
    -[ODCurareReportFillerDataSetStats writeTo:].cold.5();
  }
  PBDataWriterWriteStringField();
  if (!self->_featureValuePercentile10) {
    -[ODCurareReportFillerDataSetStats writeTo:].cold.6();
  }
  PBDataWriterWriteStringField();
  if (!self->_featureValuePercentile25) {
    -[ODCurareReportFillerDataSetStats writeTo:].cold.7();
  }
  PBDataWriterWriteStringField();
  if (!self->_featureValuePercentile50) {
    -[ODCurareReportFillerDataSetStats writeTo:].cold.8();
  }
  PBDataWriterWriteStringField();
  if (!self->_featureValuePercentile75) {
    -[ODCurareReportFillerDataSetStats writeTo:].cold.9();
  }
  PBDataWriterWriteStringField();
  if (!self->_featureValuePercentile90) {
    -[ODCurareReportFillerDataSetStats writeTo:]0();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  featureName = self->_featureName;
  id v5 = a3;
  [v5 setFeatureName:featureName];
  [v5 setFeatureValueMin:self->_featureValueMin];
  [v5 setFeatureValueMax:self->_featureValueMax];
  [v5 setFeatureValueMean:self->_featureValueMean];
  [v5 setFeatureValueStd:self->_featureValueStd];
  [v5 setFeatureValuePercentile10:self->_featureValuePercentile10];
  [v5 setFeatureValuePercentile25:self->_featureValuePercentile25];
  [v5 setFeatureValuePercentile50:self->_featureValuePercentile50];
  [v5 setFeatureValuePercentile75:self->_featureValuePercentile75];
  [v5 setFeatureValuePercentile90:self->_featureValuePercentile90];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_featureName copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_featureValueMin copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  uint64_t v10 = [(NSString *)self->_featureValueMax copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  uint64_t v12 = [(NSString *)self->_featureValueMean copyWithZone:a3];
  v13 = (void *)v5[3];
  v5[3] = v12;

  uint64_t v14 = [(NSString *)self->_featureValueStd copyWithZone:a3];
  v15 = (void *)v5[10];
  v5[10] = v14;

  uint64_t v16 = [(NSString *)self->_featureValuePercentile10 copyWithZone:a3];
  v17 = (void *)v5[5];
  v5[5] = v16;

  uint64_t v18 = [(NSString *)self->_featureValuePercentile25 copyWithZone:a3];
  v19 = (void *)v5[6];
  v5[6] = v18;

  uint64_t v20 = [(NSString *)self->_featureValuePercentile50 copyWithZone:a3];
  v21 = (void *)v5[7];
  v5[7] = v20;

  uint64_t v22 = [(NSString *)self->_featureValuePercentile75 copyWithZone:a3];
  v23 = (void *)v5[8];
  v5[8] = v22;

  uint64_t v24 = [(NSString *)self->_featureValuePercentile90 copyWithZone:a3];
  v25 = (void *)v5[9];
  v5[9] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  featureName = self->_featureName;
  if ((unint64_t)featureName | v4[1])
  {
    if (!-[NSString isEqual:](featureName, "isEqual:")) {
      goto LABEL_22;
    }
  }
  featureValueMin = self->_featureValueMin;
  if ((unint64_t)featureValueMin | v4[4] && !-[NSString isEqual:](featureValueMin, "isEqual:")) {
    goto LABEL_22;
  }
  if (((featureValueMax = self->_featureValueMax, !((unint64_t)featureValueMax | v4[2]))
     || -[NSString isEqual:](featureValueMax, "isEqual:"))
    && ((featureValueMean = self->_featureValueMean, !((unint64_t)featureValueMean | v4[3]))
     || -[NSString isEqual:](featureValueMean, "isEqual:"))
    && ((featureValueStd = self->_featureValueStd, !((unint64_t)featureValueStd | v4[10]))
     || -[NSString isEqual:](featureValueStd, "isEqual:"))
    && ((featureValuePercentile10 = self->_featureValuePercentile10,
         !((unint64_t)featureValuePercentile10 | v4[5]))
     || -[NSString isEqual:](featureValuePercentile10, "isEqual:"))
    && ((featureValuePercentile25 = self->_featureValuePercentile25,
         !((unint64_t)featureValuePercentile25 | v4[6]))
     || -[NSString isEqual:](featureValuePercentile25, "isEqual:"))
    && ((featureValuePercentile50 = self->_featureValuePercentile50,
         !((unint64_t)featureValuePercentile50 | v4[7]))
     || -[NSString isEqual:](featureValuePercentile50, "isEqual:"))
    && ((featureValuePercentile75 = self->_featureValuePercentile75,
         !((unint64_t)featureValuePercentile75 | v4[8]))
     || -[NSString isEqual:](featureValuePercentile75, "isEqual:")))
  {
    featureValuePercentile90 = self->_featureValuePercentile90;
    if ((unint64_t)featureValuePercentile90 | v4[9]) {
      char v15 = -[NSString isEqual:](featureValuePercentile90, "isEqual:");
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
LABEL_22:
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_featureName hash];
  NSUInteger v4 = [(NSString *)self->_featureValueMin hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_featureValueMax hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_featureValueMean hash];
  NSUInteger v7 = [(NSString *)self->_featureValueStd hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_featureValuePercentile10 hash];
  NSUInteger v9 = v6 ^ v8 ^ [(NSString *)self->_featureValuePercentile25 hash];
  NSUInteger v10 = [(NSString *)self->_featureValuePercentile50 hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_featureValuePercentile75 hash];
  return v9 ^ v11 ^ [(NSString *)self->_featureValuePercentile90 hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[1]) {
    -[ODCurareReportFillerDataSetStats setFeatureName:](self, "setFeatureName:");
  }
  if (v4[4]) {
    -[ODCurareReportFillerDataSetStats setFeatureValueMin:](self, "setFeatureValueMin:");
  }
  if (v4[2]) {
    -[ODCurareReportFillerDataSetStats setFeatureValueMax:](self, "setFeatureValueMax:");
  }
  if (v4[3]) {
    -[ODCurareReportFillerDataSetStats setFeatureValueMean:](self, "setFeatureValueMean:");
  }
  if (v4[10]) {
    -[ODCurareReportFillerDataSetStats setFeatureValueStd:](self, "setFeatureValueStd:");
  }
  if (v4[5]) {
    -[ODCurareReportFillerDataSetStats setFeatureValuePercentile10:](self, "setFeatureValuePercentile10:");
  }
  if (v4[6]) {
    -[ODCurareReportFillerDataSetStats setFeatureValuePercentile25:](self, "setFeatureValuePercentile25:");
  }
  if (v4[7]) {
    -[ODCurareReportFillerDataSetStats setFeatureValuePercentile50:](self, "setFeatureValuePercentile50:");
  }
  if (v4[8]) {
    -[ODCurareReportFillerDataSetStats setFeatureValuePercentile75:](self, "setFeatureValuePercentile75:");
  }
  if (v4[9]) {
    -[ODCurareReportFillerDataSetStats setFeatureValuePercentile90:](self, "setFeatureValuePercentile90:");
  }
}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
}

- (NSString)featureValueMin
{
  return self->_featureValueMin;
}

- (void)setFeatureValueMin:(id)a3
{
}

- (NSString)featureValueMax
{
  return self->_featureValueMax;
}

- (void)setFeatureValueMax:(id)a3
{
}

- (NSString)featureValueMean
{
  return self->_featureValueMean;
}

- (void)setFeatureValueMean:(id)a3
{
}

- (NSString)featureValueStd
{
  return self->_featureValueStd;
}

- (void)setFeatureValueStd:(id)a3
{
}

- (NSString)featureValuePercentile10
{
  return self->_featureValuePercentile10;
}

- (void)setFeatureValuePercentile10:(id)a3
{
}

- (NSString)featureValuePercentile25
{
  return self->_featureValuePercentile25;
}

- (void)setFeatureValuePercentile25:(id)a3
{
}

- (NSString)featureValuePercentile50
{
  return self->_featureValuePercentile50;
}

- (void)setFeatureValuePercentile50:(id)a3
{
}

- (NSString)featureValuePercentile75
{
  return self->_featureValuePercentile75;
}

- (void)setFeatureValuePercentile75:(id)a3
{
}

- (NSString)featureValuePercentile90
{
  return self->_featureValuePercentile90;
}

- (void)setFeatureValuePercentile90:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValueStd, 0);
  objc_storeStrong((id *)&self->_featureValuePercentile90, 0);
  objc_storeStrong((id *)&self->_featureValuePercentile75, 0);
  objc_storeStrong((id *)&self->_featureValuePercentile50, 0);
  objc_storeStrong((id *)&self->_featureValuePercentile25, 0);
  objc_storeStrong((id *)&self->_featureValuePercentile10, 0);
  objc_storeStrong((id *)&self->_featureValueMin, 0);
  objc_storeStrong((id *)&self->_featureValueMean, 0);
  objc_storeStrong((id *)&self->_featureValueMax, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 171, "nil != self->_featureName");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 176, "nil != self->_featureValueMin");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 181, "nil != self->_featureValueMax");
}

- (void)writeTo:.cold.4()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 186, "nil != self->_featureValueMean");
}

- (void)writeTo:.cold.5()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 191, "nil != self->_featureValueStd");
}

- (void)writeTo:.cold.6()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 196, "nil != self->_featureValuePercentile10");
}

- (void)writeTo:.cold.7()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 201, "nil != self->_featureValuePercentile25");
}

- (void)writeTo:.cold.8()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 206, "nil != self->_featureValuePercentile50");
}

- (void)writeTo:.cold.9()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 211, "nil != self->_featureValuePercentile75");
}

- (void)writeTo:.cold.10()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 216, "nil != self->_featureValuePercentile90");
}

@end