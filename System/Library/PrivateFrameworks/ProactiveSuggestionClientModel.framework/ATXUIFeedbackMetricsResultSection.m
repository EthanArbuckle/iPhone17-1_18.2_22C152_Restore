@interface ATXUIFeedbackMetricsResultSection
- (ATXCategoricalAttributeBreakdown)clientModelBreakdown;
- (ATXCategoricalAttributeBreakdown)confidenceBreakdown;
- (ATXCategoricalAttributeBreakdown)consumerSubTypeBreakdown;
- (ATXCategoricalAttributeBreakdown)predictionReasonCodeBreakdown;
- (ATXScoreDistribution)scoreDistribution;
- (ATXUIFeedbackMetricsResultSection)init;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUIFeedbackMetricsResultSection:(id)a3;
- (unint64_t)hash;
@end

@implementation ATXUIFeedbackMetricsResultSection

- (ATXUIFeedbackMetricsResultSection)init
{
  v14.receiver = self;
  v14.super_class = (Class)ATXUIFeedbackMetricsResultSection;
  v2 = [(ATXUIFeedbackMetricsResultSection *)&v14 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    scoreDistribution = v2->_scoreDistribution;
    v2->_scoreDistribution = (ATXScoreDistribution *)v3;

    uint64_t v5 = objc_opt_new();
    clientModelBreakdown = v2->_clientModelBreakdown;
    v2->_clientModelBreakdown = (ATXCategoricalAttributeBreakdown *)v5;

    uint64_t v7 = objc_opt_new();
    consumerSubTypeBreakdown = v2->_consumerSubTypeBreakdown;
    v2->_consumerSubTypeBreakdown = (ATXCategoricalAttributeBreakdown *)v7;

    uint64_t v9 = objc_opt_new();
    confidenceBreakdown = v2->_confidenceBreakdown;
    v2->_confidenceBreakdown = (ATXCategoricalAttributeBreakdown *)v9;

    uint64_t v11 = objc_opt_new();
    predictionReasonCodeBreakdown = v2->_predictionReasonCodeBreakdown;
    v2->_predictionReasonCodeBreakdown = (ATXCategoricalAttributeBreakdown *)v11;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXUIFeedbackMetricsResultSection *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUIFeedbackMetricsResultSection *)self isEqualToATXUIFeedbackMetricsResultSection:v5];

  return v6;
}

- (BOOL)isEqualToATXUIFeedbackMetricsResultSection:(id)a3
{
  v4 = (id *)a3;
  scoreDistribution = self->_scoreDistribution;
  BOOL v6 = (ATXScoreDistribution *)v4[1];
  if (scoreDistribution == v6)
  {
  }
  else
  {
    uint64_t v7 = v6;
    v8 = scoreDistribution;
    BOOL v9 = [(ATXScoreDistribution *)v8 isEqual:v7];

    if (!v9) {
      goto LABEL_15;
    }
  }
  clientModelBreakdown = self->_clientModelBreakdown;
  uint64_t v11 = (ATXCategoricalAttributeBreakdown *)v4[2];
  if (clientModelBreakdown == v11)
  {
  }
  else
  {
    v12 = v11;
    v13 = clientModelBreakdown;
    BOOL v14 = [(ATXCategoricalAttributeBreakdown *)v13 isEqual:v12];

    if (!v14) {
      goto LABEL_15;
    }
  }
  consumerSubTypeBreakdown = self->_consumerSubTypeBreakdown;
  v16 = (ATXCategoricalAttributeBreakdown *)v4[3];
  if (consumerSubTypeBreakdown == v16)
  {
  }
  else
  {
    v17 = v16;
    v18 = consumerSubTypeBreakdown;
    BOOL v19 = [(ATXCategoricalAttributeBreakdown *)v18 isEqual:v17];

    if (!v19) {
      goto LABEL_15;
    }
  }
  confidenceBreakdown = self->_confidenceBreakdown;
  v21 = (ATXCategoricalAttributeBreakdown *)v4[4];
  if (confidenceBreakdown == v21)
  {
  }
  else
  {
    v22 = v21;
    v23 = confidenceBreakdown;
    BOOL v24 = [(ATXCategoricalAttributeBreakdown *)v23 isEqual:v22];

    if (!v24)
    {
LABEL_15:
      char v25 = 0;
      goto LABEL_21;
    }
  }
  v26 = self->_predictionReasonCodeBreakdown;
  v27 = v26;
  if (v26 == v4[5]) {
    char v25 = 1;
  }
  else {
    char v25 = -[ATXCategoricalAttributeBreakdown isEqual:](v26, "isEqual:");
  }

LABEL_21:
  return v25;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ATXScoreDistribution *)self->_scoreDistribution hash];
  unint64_t v4 = [(ATXCategoricalAttributeBreakdown *)self->_clientModelBreakdown hash] - v3 + 32 * v3;
  unint64_t v5 = [(ATXCategoricalAttributeBreakdown *)self->_consumerSubTypeBreakdown hash] - v4 + 32 * v4;
  unint64_t v6 = [(ATXCategoricalAttributeBreakdown *)self->_confidenceBreakdown hash] - v5 + 32 * v5;
  return [(ATXCategoricalAttributeBreakdown *)self->_predictionReasonCodeBreakdown hash] - v6 + 32 * v6;
}

- (ATXScoreDistribution)scoreDistribution
{
  return self->_scoreDistribution;
}

- (ATXCategoricalAttributeBreakdown)clientModelBreakdown
{
  return self->_clientModelBreakdown;
}

- (ATXCategoricalAttributeBreakdown)consumerSubTypeBreakdown
{
  return self->_consumerSubTypeBreakdown;
}

- (ATXCategoricalAttributeBreakdown)confidenceBreakdown
{
  return self->_confidenceBreakdown;
}

- (ATXCategoricalAttributeBreakdown)predictionReasonCodeBreakdown
{
  return self->_predictionReasonCodeBreakdown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionReasonCodeBreakdown, 0);
  objc_storeStrong((id *)&self->_confidenceBreakdown, 0);
  objc_storeStrong((id *)&self->_consumerSubTypeBreakdown, 0);
  objc_storeStrong((id *)&self->_clientModelBreakdown, 0);
  objc_storeStrong((id *)&self->_scoreDistribution, 0);
}

@end