@interface PSUICarrierSpaceUsageSection
- (BOOL)isSharedPlan;
- (CTCarrierSpaceUsageAccountMetrics)accountMetrics;
- (CTCarrierSpaceUsagePlanMetrics)primaryMetrics;
- (NSMutableArray)barCategories;
- (NSMutableArray)otherMetrics;
- (NSString)sharedPlanIdentifier;
- (id)description;
- (void)setAccountMetrics:(id)a3;
- (void)setBarCategories:(id)a3;
- (void)setOtherMetrics:(id)a3;
- (void)setPrimaryMetrics:(id)a3;
- (void)setSharedPlanIdentifier:(id)a3;
@end

@implementation PSUICarrierSpaceUsageSection

- (BOOL)isSharedPlan
{
  v3 = [(PSUICarrierSpaceUsageSection *)self primaryMetrics];
  if (v3)
  {
    v4 = [(PSUICarrierSpaceUsageSection *)self otherMetrics];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)description
{
  v18 = NSString;
  uint64_t v3 = [(PSUICarrierSpaceUsageSection *)self sharedPlanIdentifier];
  v4 = (void *)v3;
  BOOL v5 = @"Single Plan";
  if (v3) {
    BOOL v5 = (__CFString *)v3;
  }
  v17 = v5;
  v6 = [(PSUICarrierSpaceUsageSection *)self primaryMetrics];
  v7 = [(PSUICarrierSpaceUsageSection *)self accountMetrics];
  v8 = [v7 networkUsageLabel];
  v9 = [(PSUICarrierSpaceUsageSection *)self accountMetrics];
  uint64_t v10 = [v9 deviceType];
  v11 = [(PSUICarrierSpaceUsageSection *)self accountMetrics];
  if ([v11 localDevice]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  v13 = [(PSUICarrierSpaceUsageSection *)self otherMetrics];
  v14 = [(PSUICarrierSpaceUsageSection *)self barCategories];
  v15 = [v18 stringWithFormat:@"Shared ID: %@\nPrimary Metrics: %@\nAccount Metrics=<Network Usage Label: %@\nDevice Type: %d\nIs Local Device: %@>\nOther Metrics: %@\nBar Categories: %@", v17, v6, v8, v10, v12, v13, v14];

  return v15;
}

- (NSString)sharedPlanIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSharedPlanIdentifier:(id)a3
{
}

- (CTCarrierSpaceUsagePlanMetrics)primaryMetrics
{
  return (CTCarrierSpaceUsagePlanMetrics *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrimaryMetrics:(id)a3
{
}

- (CTCarrierSpaceUsageAccountMetrics)accountMetrics
{
  return (CTCarrierSpaceUsageAccountMetrics *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccountMetrics:(id)a3
{
}

- (NSMutableArray)otherMetrics
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOtherMetrics:(id)a3
{
}

- (NSMutableArray)barCategories
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBarCategories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barCategories, 0);
  objc_storeStrong((id *)&self->_otherMetrics, 0);
  objc_storeStrong((id *)&self->_accountMetrics, 0);
  objc_storeStrong((id *)&self->_primaryMetrics, 0);
  objc_storeStrong((id *)&self->_sharedPlanIdentifier, 0);
}

@end