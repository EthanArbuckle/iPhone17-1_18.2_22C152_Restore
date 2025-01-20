@interface ICQOpportunityBubbleSpecification
- (ICQOpportunityBubbleDetailsSpecification)bubbleDetails;
- (ICQOpportunityBubbleSpecification)initWithOpportunityBubble:(id)a3 andOpportunitySheet:(id)a4;
- (ICQOpportunitySheetDetailsSpecification)sheetDetails;
- (NSString)appId;
- (_ICQOpportunityBubbleReportingSpecification)reportingDetails;
- (id)serverUIURL;
- (void)setAppId:(id)a3;
- (void)setBubbleDetails:(id)a3;
- (void)setReportingDetails:(id)a3;
- (void)setSheetDetails:(id)a3;
@end

@implementation ICQOpportunityBubbleSpecification

- (ICQOpportunityBubbleSpecification)initWithOpportunityBubble:(id)a3 andOpportunitySheet:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)ICQOpportunityBubbleSpecification;
  v8 = [(ICQOpportunityBubbleSpecification *)&v25 init];
  if (!v8)
  {
LABEL_10:
    v19 = v8;
    goto LABEL_16;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"appId"];
  appId = v8->_appId;
  v8->_appId = (NSString *)v9;

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v6 objectForKeyedSubscript:@"opportunityBubbleDetails"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [(ICQOpportunityFlowSpecification *)[ICQOpportunityBubbleDetailsSpecification alloc] initWithServerDictionary:v11];
      bubbleDetails = v8->_bubbleDetails;
      v8->_bubbleDetails = v12;
    }
    if (v7)
    {
      v14 = [v7 objectForKeyedSubscript:@"opportunitySheetDetails"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = [(ICQOpportunityFlowSpecification *)[ICQOpportunitySheetDetailsSpecification alloc] initWithServerDictionary:v14];
        sheetDetails = v8->_sheetDetails;
        v8->_sheetDetails = v15;
      }
    }
    v17 = [[_ICQOpportunityBubbleReportingSpecification alloc] initWithServerDictionary:v6];
    reportingDetails = v8->_reportingDetails;
    v8->_reportingDetails = v17;

    goto LABEL_10;
  }
  if (v8->_appId)
  {
    v20 = _ICQGetLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      Name = class_getName(v21);
      v23 = v8->_appId;
      *(_DWORD *)buf = 136315394;
      v27 = Name;
      __int16 v28 = 2112;
      v29 = v23;
      _os_log_impl(&dword_1D5851000, v20, OS_LOG_TYPE_DEFAULT, "GUARD_OBJECT_CLASS: expected %s, got %@", buf, 0x16u);
    }
  }
  v19 = 0;
LABEL_16:

  return v19;
}

- (id)serverUIURL
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [(ICQOpportunityBubbleSpecification *)self bubbleDetails];

  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v4 = [(ICQOpportunityBubbleSpecification *)self bubbleDetails];
    v5 = [v4 actions];

    v3 = (void *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v3)
    {
      uint64_t v6 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v5);
          }
          v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          uint64_t v9 = [v8 serverUIURL];

          if (v9)
          {
            v3 = [v8 serverUIURL];
            goto LABEL_12;
          }
        }
        v3 = (void *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v3;
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
}

- (ICQOpportunityBubbleDetailsSpecification)bubbleDetails
{
  return self->_bubbleDetails;
}

- (void)setBubbleDetails:(id)a3
{
}

- (ICQOpportunitySheetDetailsSpecification)sheetDetails
{
  return self->_sheetDetails;
}

- (void)setSheetDetails:(id)a3
{
}

- (_ICQOpportunityBubbleReportingSpecification)reportingDetails
{
  return self->_reportingDetails;
}

- (void)setReportingDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingDetails, 0);
  objc_storeStrong((id *)&self->_sheetDetails, 0);
  objc_storeStrong((id *)&self->_bubbleDetails, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end