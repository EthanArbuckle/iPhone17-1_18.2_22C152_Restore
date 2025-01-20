@interface SUIBIntelligenceFlowActionSummaryMutation
- (NSDictionary)parameterSummaries;
- (NSString)formatString;
- (void)setFormatString:(id)a3;
- (void)setParameterSummaries:(id)a3;
@end

@implementation SUIBIntelligenceFlowActionSummaryMutation

- (NSString)formatString
{
  return self->_formatString;
}

- (void)setFormatString:(id)a3
{
}

- (NSDictionary)parameterSummaries
{
  return self->_parameterSummaries;
}

- (void)setParameterSummaries:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterSummaries, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
}

@end