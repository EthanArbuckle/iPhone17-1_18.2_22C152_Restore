@interface PLNetworkEnergyModel
- (NSArray)linkCost;
- (NSArray)linkDuration;
- (NSArray)linkLevel1Parameters;
- (NSString)taskUUID;
- (PLNetworkEnergyModel)initWithLinkType:(unsigned __int8)a3;
- (PLNetworkEnergyModel)initWithLinkType:(unsigned __int8)a3 withTaskUUID:(id)a4;
- (double)computeLevel1TimeWithBytes:(double)a3;
- (double)getEnergy;
- (double)overallBytes;
- (double)overallDuration;
- (double)powerlevel1Duration;
- (double)powerlevel2Duration;
- (double)powerlevel3Duration;
- (id)description;
- (unsigned)linkType;
- (unsigned)updateCount;
- (void)reportEnergyToPowerlogWithClientID:(signed __int16)a3;
- (void)setLinkCost:(id)a3;
- (void)setLinkDuration:(id)a3;
- (void)setLinkLevel1Parameters:(id)a3;
- (void)setLinkType:(unsigned __int8)a3;
- (void)setOverallBytes:(double)a3;
- (void)setOverallDuration:(double)a3;
- (void)setPowerlevel1Duration:(double)a3;
- (void)setPowerlevel2Duration:(double)a3;
- (void)setPowerlevel3Duration:(double)a3;
- (void)setTaskUUID:(id)a3;
- (void)setUpdateCount:(unsigned int)a3;
- (void)updateAllLevelTimesWithLevel1Time:(double)a3 withUpdateDuration:(double)a4;
- (void)updateWithBytes:(double)a3 withDuration:(double)a4;
@end

@implementation PLNetworkEnergyModel

- (PLNetworkEnergyModel)initWithLinkType:(unsigned __int8)a3
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PLNetworkEnergyModel;
  v4 = [(PLNetworkEnergyModel *)&v18 init];
  v5 = (PLNetworkEnergyModel *)v4;
  if (v4)
  {
    *(void *)(v4 + 20) = 0;
    *(void *)(v4 + 12) = 0;
    *((_DWORD *)v4 + 9) = 0;
    *(void *)(v4 + 28) = 0;
    v4[8] = a3;
    *((void *)v4 + 5) = 0;
    *((void *)v4 + 6) = 0;
    v6 = (void *)*((void *)v4 + 7);
    *((void *)v4 + 7) = &stru_1EF44BBB0;

    linkDuration = v5->_linkDuration;
    v5->_linkDuration = (NSArray *)&unk_1EF450A78;

    linkCost = v5->_linkCost;
    v5->_linkCost = (NSArray *)&unk_1EF450AF0;

    v22[0] = &unk_1EF450B08;
    v9 = [NSNumber numberWithDouble:0.000002];
    v21[0] = v9;
    v21[1] = &unk_1EF450760;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    v22[1] = v10;
    v11 = [NSNumber numberWithDouble:0.000005];
    v20[0] = v11;
    v20[1] = &unk_1EF450B20;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    v22[2] = v12;
    v13 = [NSNumber numberWithDouble:0.000001];
    v19[0] = v13;
    v19[1] = &unk_1EF450B20;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v22[3] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    linkLevel1Parameters = v5->_linkLevel1Parameters;
    v5->_linkLevel1Parameters = (NSArray *)v15;
  }
  return v5;
}

- (PLNetworkEnergyModel)initWithLinkType:(unsigned __int8)a3 withTaskUUID:(id)a4
{
  uint64_t v5 = a3;
  id v7 = a4;
  v8 = [(PLNetworkEnergyModel *)self initWithLinkType:v5];
  v9 = v8;
  if (v7 && v8) {
    objc_storeStrong((id *)&v8->_taskUUID, a4);
  }

  return v9;
}

- (id)description
{
  v3 = NSString;
  [(PLNetworkEnergyModel *)self powerlevel1Duration];
  uint64_t v5 = v4;
  [(PLNetworkEnergyModel *)self powerlevel2Duration];
  uint64_t v7 = v6;
  [(PLNetworkEnergyModel *)self powerlevel3Duration];
  uint64_t v9 = v8;
  unsigned int v10 = [(PLNetworkEnergyModel *)self linkType];
  [(PLNetworkEnergyModel *)self overallBytes];
  uint64_t v12 = v11;
  [(PLNetworkEnergyModel *)self overallDuration];
  uint64_t v14 = v13;
  [(PLNetworkEnergyModel *)self getEnergy];
  uint64_t v16 = v15;
  v17 = [(PLNetworkEnergyModel *)self taskUUID];
  objc_super v18 = [v3 stringWithFormat:@"powerlevel1Duration=%f, powerlevel2Duration=%f, powerlevel3Duration=%f, linkType=%d, overallBytes=%f, overallDuration=%f TotalEnergy=%f, taskID=%@", v5, v7, v9, v10, v12, v14, v16, v17];

  return v18;
}

- (void)updateWithBytes:(double)a3 withDuration:(double)a4
{
  [(PLNetworkEnergyModel *)self setUpdateCount:[(PLNetworkEnergyModel *)self updateCount] + 1];
  [(PLNetworkEnergyModel *)self overallDuration];
  [(PLNetworkEnergyModel *)self setOverallDuration:v7 + a4];
  [(PLNetworkEnergyModel *)self overallBytes];
  [(PLNetworkEnergyModel *)self setOverallBytes:v8 + a3];
  [(PLNetworkEnergyModel *)self computeLevel1TimeWithBytes:a3];
  -[PLNetworkEnergyModel updateAllLevelTimesWithLevel1Time:withUpdateDuration:](self, "updateAllLevelTimesWithLevel1Time:withUpdateDuration:");
}

- (double)getEnergy
{
  [(PLNetworkEnergyModel *)self powerlevel1Duration];
  double v4 = v3;
  uint64_t v5 = [(PLNetworkEnergyModel *)self linkCost];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  double v7 = [v6 objectAtIndexedSubscript:0];
  [v7 doubleValue];
  double v9 = v8;
  [(PLNetworkEnergyModel *)self powerlevel2Duration];
  double v11 = v10;
  uint64_t v12 = [(PLNetworkEnergyModel *)self linkCost];
  uint64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  uint64_t v14 = [v13 objectAtIndexedSubscript:1];
  [v14 doubleValue];
  double v16 = v11 * v15 + v4 * v9;
  [(PLNetworkEnergyModel *)self powerlevel3Duration];
  double v18 = v17;
  v19 = [(PLNetworkEnergyModel *)self linkCost];
  v20 = objc_msgSend(v19, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v21 = [v20 objectAtIndexedSubscript:2];
  [v21 doubleValue];
  double v23 = (v16 + v18 * v22) / 3600.0;

  return v23;
}

- (double)computeLevel1TimeWithBytes:(double)a3
{
  uint64_t v5 = [(PLNetworkEnergyModel *)self linkLevel1Parameters];
  uint64_t v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  double v7 = [v6 objectAtIndexedSubscript:0];
  [v7 doubleValue];
  double v9 = v8;
  double v10 = [(PLNetworkEnergyModel *)self linkLevel1Parameters];
  double v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  uint64_t v12 = [v11 objectAtIndexedSubscript:1];
  [v12 doubleValue];
  double v14 = v13 + a3 * v9;

  return v14;
}

- (void)updateAllLevelTimesWithLevel1Time:(double)a3 withUpdateDuration:(double)a4
{
  double v7 = [(PLNetworkEnergyModel *)self linkDuration];
  double v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  double v9 = [v8 objectAtIndexedSubscript:1];
  [v9 doubleValue];
  double v11 = v10;

  uint64_t v12 = [(PLNetworkEnergyModel *)self linkDuration];
  double v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  double v14 = [v13 objectAtIndexedSubscript:2];
  [v14 doubleValue];
  double v16 = v15;

  if (a4 >= a3) {
    double v17 = a3;
  }
  else {
    double v17 = a4;
  }
  [(PLNetworkEnergyModel *)self powerlevel1Duration];
  [(PLNetworkEnergyModel *)self setPowerlevel1Duration:v17 + v18];
  double v19 = a4 - a3;
  double v20 = fmax(v19, 0.0);
  if (v11 >= v20) {
    double v21 = v20;
  }
  else {
    double v21 = v11;
  }
  [(PLNetworkEnergyModel *)self powerlevel2Duration];
  [(PLNetworkEnergyModel *)self setPowerlevel2Duration:v21 + v22];
  double v23 = fmax(v19 - v11, 0.0);
  if (v16 >= v23) {
    double v24 = v23;
  }
  else {
    double v24 = v16;
  }
  [(PLNetworkEnergyModel *)self powerlevel3Duration];
  double v26 = v24 + v25;
  [(PLNetworkEnergyModel *)self setPowerlevel3Duration:v26];
}

- (void)reportEnergyToPowerlogWithClientID:(signed __int16)a3
{
  uint64_t v3 = a3;
  v17[6] = *MEMORY[0x1E4F143B8];
  [(PLNetworkEnergyModel *)self getEnergy];
  v16[0] = @"Energy";
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  v17[0] = v5;
  v16[1] = @"UpdateCount";
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[PLNetworkEnergyModel updateCount](self, "updateCount"));
  v17[1] = v6;
  v16[2] = @"OverallBytes";
  double v7 = NSNumber;
  [(PLNetworkEnergyModel *)self overallBytes];
  double v8 = objc_msgSend(v7, "numberWithDouble:");
  v17[2] = v8;
  v16[3] = @"OverallDuration";
  double v9 = NSNumber;
  [(PLNetworkEnergyModel *)self overallDuration];
  double v10 = objc_msgSend(v9, "numberWithDouble:");
  v17[3] = v10;
  v16[4] = @"LinkType";
  double v11 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[PLNetworkEnergyModel linkType](self, "linkType"));
  v17[4] = v11;
  v16[5] = @"taskUUID";
  uint64_t v12 = [(PLNetworkEnergyModel *)self taskUUID];
  double v13 = (void *)v12;
  double v14 = &stru_1EF44BBB0;
  if (v12) {
    double v14 = (__CFString *)v12;
  }
  v17[5] = v14;
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];

  PLLogRegisteredEvent(v3, @"NetworkEnergyModel", v15);
}

- (double)powerlevel1Duration
{
  return self->_powerlevel1Duration;
}

- (void)setPowerlevel1Duration:(double)a3
{
  self->_powerlevel1Duration = a3;
}

- (double)powerlevel2Duration
{
  return self->_powerlevel2Duration;
}

- (void)setPowerlevel2Duration:(double)a3
{
  self->_powerlevel2Duration = a3;
}

- (double)powerlevel3Duration
{
  return self->_powerlevel3Duration;
}

- (void)setPowerlevel3Duration:(double)a3
{
  self->_powerlevel3Duration = a3;
}

- (unsigned)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(unsigned __int8)a3
{
  self->_linkType = a3;
}

- (double)overallBytes
{
  return self->_overallBytes;
}

- (void)setOverallBytes:(double)a3
{
  self->_overallBytes = a3;
}

- (double)overallDuration
{
  return self->_overallDuration;
}

- (void)setOverallDuration:(double)a3
{
  self->_overallDuration = a3;
}

- (unsigned)updateCount
{
  return self->_updateCount;
}

- (void)setUpdateCount:(unsigned int)a3
{
  self->_updateCount = a3;
}

- (NSString)taskUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTaskUUID:(id)a3
{
}

- (NSArray)linkCost
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLinkCost:(id)a3
{
}

- (NSArray)linkDuration
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLinkDuration:(id)a3
{
}

- (NSArray)linkLevel1Parameters
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLinkLevel1Parameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkLevel1Parameters, 0);
  objc_storeStrong((id *)&self->_linkDuration, 0);
  objc_storeStrong((id *)&self->_linkCost, 0);
  objc_storeStrong((id *)&self->_taskUUID, 0);
}

@end