@interface NTAggregationBudgetInfo
- (BOOL)allowSectionTitles;
- (BOOL)hasBannerSlotCost;
- (BOOL)respectMinMaxLimit;
- (NTAggregationBudgetInfo)init;
- (NTPBSectionSlotCostInfo)sectionSlotCostInfo;
- (double)bannerSlotCost;
- (double)slotsLimit;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)embedsLimit;
- (void)setAllowSectionTitles:(BOOL)a3;
- (void)setBannerSlotCost:(double)a3;
- (void)setEmbedsLimit:(unint64_t)a3;
- (void)setHasBannerSlotCost:(BOOL)a3;
- (void)setRespectMinMaxLimit:(BOOL)a3;
- (void)setSectionSlotCostInfo:(id)a3;
- (void)setSlotsLimit:(double)a3;
@end

@implementation NTAggregationBudgetInfo

- (NTAggregationBudgetInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTAggregationBudgetInfo;
  return [(NTAggregationBudgetInfo *)&v3 init];
}

- (void).cxx_destruct
{
}

- (void)setEmbedsLimit:(unint64_t)a3
{
  self->_embedsLimit = a3;
}

- (void)setSectionSlotCostInfo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v5 = [(NTAggregationBudgetInfo *)self sectionSlotCostInfo];
  [v4 setSectionSlotCostInfo:v5];

  objc_msgSend(v4, "setRespectMinMaxLimit:", -[NTAggregationBudgetInfo respectMinMaxLimit](self, "respectMinMaxLimit"));
  [(NTAggregationBudgetInfo *)self slotsLimit];
  objc_msgSend(v4, "setSlotsLimit:");
  objc_msgSend(v4, "setAllowSectionTitles:", -[NTAggregationBudgetInfo allowSectionTitles](self, "allowSectionTitles"));
  [(NTAggregationBudgetInfo *)self bannerSlotCost];
  objc_msgSend(v4, "setBannerSlotCost:");
  objc_msgSend(v4, "setHasBannerSlotCost:", -[NTAggregationBudgetInfo hasBannerSlotCost](self, "hasBannerSlotCost"));
  return v4;
}

- (NTPBSectionSlotCostInfo)sectionSlotCostInfo
{
  return self->_sectionSlotCostInfo;
}

- (unint64_t)embedsLimit
{
  return self->_embedsLimit;
}

- (BOOL)respectMinMaxLimit
{
  return self->_respectMinMaxLimit;
}

- (void)setRespectMinMaxLimit:(BOOL)a3
{
  self->_respectMinMaxLimit = a3;
}

- (double)slotsLimit
{
  return self->_slotsLimit;
}

- (void)setSlotsLimit:(double)a3
{
  self->_slotsLimit = a3;
}

- (BOOL)allowSectionTitles
{
  return self->_allowSectionTitles;
}

- (void)setAllowSectionTitles:(BOOL)a3
{
  self->_allowSectionTitles = a3;
}

- (BOOL)hasBannerSlotCost
{
  return self->_hasBannerSlotCost;
}

- (void)setHasBannerSlotCost:(BOOL)a3
{
  self->_hasBannerSlotCost = a3;
}

- (double)bannerSlotCost
{
  return self->_bannerSlotCost;
}

- (void)setBannerSlotCost:(double)a3
{
  self->_bannerSlotCost = a3;
}

@end