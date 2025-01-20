@interface WFAssociationContext
- (BOOL)secondaryScanCompleted;
- (NSDate)associationStart;
- (NSDictionary)sectionCounts;
- (NSString)originatorDescription;
- (NSString)sectionNameJoined;
- (NSString)stateDescription;
- (WFAssociationContext)initWithNetwork:(id)a3;
- (WFNetworkListRecord)network;
- (id)description;
- (id)formattedStartDate;
- (id)networkName;
- (unint64_t)originator;
- (unint64_t)state;
- (void)setAssociationStart:(id)a3;
- (void)setNetwork:(id)a3;
- (void)setOriginator:(unint64_t)a3;
- (void)setSecondaryScanCompleted:(BOOL)a3;
- (void)setSectionCounts:(id)a3;
- (void)setSectionNameJoined:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation WFAssociationContext

- (WFAssociationContext)initWithNetwork:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFAssociationContext;
  v6 = [(WFAssociationContext *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_secondaryScanCompleted = 0;
    v6->_state = 0;
    v6->_originator = 0;
    objc_storeStrong((id *)&v6->_network, a3);
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    associationStart = v7->_associationStart;
    v7->_associationStart = (NSDate *)v8;
  }
  return v7;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_state != a3)
  {
    id v5 = WFLogForCategory(5uLL);
    os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v5)
    {
      v7 = v5;
      if (os_log_type_enabled(v7, v6))
      {
        unint64_t state = self->_state;
        if (state > 2) {
          v9 = 0;
        }
        else {
          v9 = off_26478F5A8[state];
        }
        if (a3 > 2) {
          v10 = 0;
        }
        else {
          v10 = off_26478F5A8[a3];
        }
        objc_super v11 = [(WFAssociationContext *)self networkName];
        int v12 = 138412802;
        v13 = v9;
        __int16 v14 = 2112;
        v15 = v10;
        __int16 v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_226071000, v7, v6, "association state changed: <%@> to <%@> for %@", (uint8_t *)&v12, 0x20u);
      }
    }

    self->_unint64_t state = a3;
  }
}

- (NSString)originatorDescription
{
  unint64_t originator = self->_originator;
  if (originator > 2) {
    return 0;
  }
  else {
    return &off_26478F590[originator]->isa;
  }
}

- (NSString)stateDescription
{
  unint64_t state = self->_state;
  if (state > 2) {
    return 0;
  }
  else {
    return &off_26478F5A8[state]->isa;
  }
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  os_log_type_t v6 = [(WFAssociationContext *)self stateDescription];
  v7 = [(WFAssociationContext *)self originatorDescription];
  uint64_t v8 = [(WFAssociationContext *)self sectionNameJoined];
  v9 = [(WFAssociationContext *)self formattedStartDate];
  v10 = [(WFAssociationContext *)self networkName];
  objc_super v11 = [v3 stringWithFormat:@"<%@ : %p State:'%@' Originator='%@' Section='%@' Started='%@' Network='%@'>", v5, self, v6, v7, v8, v9, v10];

  return v11;
}

- (id)networkName
{
  v2 = [(WFAssociationContext *)self network];
  v3 = [v2 ssid];

  return v3;
}

- (id)formattedStartDate
{
  v2 = (void *)MEMORY[0x263F08790];
  v3 = [(WFAssociationContext *)self associationStart];
  v4 = [v2 localizedStringFromDate:v3 dateStyle:1 timeStyle:3];

  return v4;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)originator
{
  return self->_originator;
}

- (void)setOriginator:(unint64_t)a3
{
  self->_unint64_t originator = a3;
}

- (BOOL)secondaryScanCompleted
{
  return self->_secondaryScanCompleted;
}

- (void)setSecondaryScanCompleted:(BOOL)a3
{
  self->_secondaryScanCompleted = a3;
}

- (NSString)sectionNameJoined
{
  return self->_sectionNameJoined;
}

- (void)setSectionNameJoined:(id)a3
{
}

- (NSDictionary)sectionCounts
{
  return self->_sectionCounts;
}

- (void)setSectionCounts:(id)a3
{
}

- (WFNetworkListRecord)network
{
  return self->_network;
}

- (void)setNetwork:(id)a3
{
}

- (NSDate)associationStart
{
  return self->_associationStart;
}

- (void)setAssociationStart:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associationStart, 0);
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_sectionCounts, 0);
  objc_storeStrong((id *)&self->_sectionNameJoined, 0);
}

@end