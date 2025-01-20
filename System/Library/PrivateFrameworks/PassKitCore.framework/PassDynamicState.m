@interface PassDynamicState
- (PKPassBalanceModel)balanceModel;
- (PKPassLiveRender)liveRender;
- (PKPassRelevancyModel)relevancyModel;
- (void)setBalanceModel:(id)a3;
- (void)setLiveRender:(id)a3;
- (void)setRelevancyModel:(id)a3;
@end

@implementation PassDynamicState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevancyModel, 0);
  objc_storeStrong((id *)&self->_balanceModel, 0);
  objc_storeStrong((id *)&self->_liveRender, 0);
}

- (void)setRelevancyModel:(id)a3
{
}

- (void)setLiveRender:(id)a3
{
}

- (void)setBalanceModel:(id)a3
{
}

- (PKPassRelevancyModel)relevancyModel
{
  return self->_relevancyModel;
}

- (PKPassLiveRender)liveRender
{
  return self->_liveRender;
}

- (PKPassBalanceModel)balanceModel
{
  return self->_balanceModel;
}

@end