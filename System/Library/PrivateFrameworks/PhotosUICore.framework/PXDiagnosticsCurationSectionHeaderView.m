@interface PXDiagnosticsCurationSectionHeaderView
- (NSDictionary)sectionInfo;
- (NSString)agentAndStage;
- (NSString)reason;
- (NSString)state;
- (PXDiagnosticsCurationSectionHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAgentAndStage:(id)a3;
- (void)setReason:(id)a3;
- (void)setSectionInfo:(id)a3;
- (void)setState:(id)a3;
@end

@implementation PXDiagnosticsCurationSectionHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_agentAndStage, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_storeStrong((id *)&self->_reasonLabel, 0);
  objc_storeStrong((id *)&self->_agentAndStageLabel, 0);
  objc_storeStrong((id *)&self->_stateBadgeView, 0);
}

- (NSString)reason
{
  return self->_reason;
}

- (NSString)agentAndStage
{
  return self->_agentAndStage;
}

- (NSString)state
{
  return self->_state;
}

- (NSDictionary)sectionInfo
{
  return self->_sectionInfo;
}

- (void)setReason:(id)a3
{
  p_reason = &self->_reason;
  objc_storeStrong((id *)&self->_reason, a3);
  id v6 = a3;
  [(UILabel *)self->_reasonLabel setText:*p_reason];
}

- (void)setAgentAndStage:(id)a3
{
  p_agentAndStage = &self->_agentAndStage;
  objc_storeStrong((id *)&self->_agentAndStage, a3);
  id v6 = a3;
  [(UILabel *)self->_agentAndStageLabel setText:*p_agentAndStage];
}

- (void)setSectionInfo:(id)a3
{
  id v13 = a3;
  if (v13
    && ([v13 objectForKeyedSubscript:@"state"],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    v5 = [v13 objectForKeyedSubscript:@"state"];
    [(PXDiagnosticsCurationSectionHeaderView *)self setState:v5];

    id v6 = [v13 objectForKeyedSubscript:@"stateHistory"];
    v7 = [v6 lastObject];

    v8 = NSString;
    v9 = [v7 objectForKeyedSubscript:@"stage"];
    v10 = [v7 objectForKeyedSubscript:@"agent"];
    v11 = [v8 stringWithFormat:@"%@ (%@)", v9, v10];
    [(PXDiagnosticsCurationSectionHeaderView *)self setAgentAndStage:v11];

    v12 = [v7 objectForKeyedSubscript:@"reason"];
    [(PXDiagnosticsCurationSectionHeaderView *)self setReason:v12];
  }
  else
  {
    [(PXDiagnosticsCurationSectionHeaderView *)self setState:@"Rejected"];
    [(PXDiagnosticsCurationSectionHeaderView *)self setAgentAndStage:@"Not clustered"];
    [(PXDiagnosticsCurationSectionHeaderView *)self setReason:0];
  }
}

- (void)setState:(id)a3
{
  p_state = &self->_state;
  objc_storeStrong((id *)&self->_state, a3);
  id v6 = a3;
  [(PXStateBadgeView *)self->_stateBadgeView setState:*p_state];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PXDiagnosticsCurationSectionHeaderView;
  [(PXDiagnosticsCurationSectionHeaderView *)&v10 layoutSubviews];
  [(PXDiagnosticsCurationSectionHeaderView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[PXStateBadgeView setFrame:](self->_stateBadgeView, "setFrame:", 2.0, 5.0, 16.0, 16.0);
  double v7 = v6 * 0.5 + -3.0;
  -[UILabel setFrame:](self->_agentAndStageLabel, "setFrame:", 24.0, 4.0, v4, v7);
  v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  [(UILabel *)self->_agentAndStageLabel setFont:v8];

  -[UILabel setFrame:](self->_reasonLabel, "setFrame:", 24.0, 21.0, v4, v7);
  v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:14.0];
  [(UILabel *)self->_reasonLabel setFont:v9];
}

- (PXDiagnosticsCurationSectionHeaderView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PXDiagnosticsCurationSectionHeaderView;
  double v3 = -[PXDiagnosticsCurationSectionHeaderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(PXDiagnosticsCurationSectionHeaderView *)v3 bounds];
    double v6 = v5;
    [(PXDiagnosticsCurationSectionHeaderView *)v4 bounds];
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 3.0, v6, v7 + -4.0);
    v9 = [MEMORY[0x1E4FB1618] lightGrayColor];
    [v8 setBackgroundColor:v9];

    [(PXDiagnosticsCurationSectionHeaderView *)v4 addSubview:v8];
    objc_super v10 = [[PXStateBadgeView alloc] initWithState:@"Unknown"];
    stateBadgeView = v4->_stateBadgeView;
    v4->_stateBadgeView = v10;

    [(PXDiagnosticsCurationSectionHeaderView *)v4 addSubview:v4->_stateBadgeView];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    agentAndStageLabel = v4->_agentAndStageLabel;
    v4->_agentAndStageLabel = v12;

    [(UILabel *)v4->_agentAndStageLabel setText:@"Agent & Stage"];
    v14 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v4->_agentAndStageLabel setTextColor:v14];

    [(PXDiagnosticsCurationSectionHeaderView *)v4 addSubview:v4->_agentAndStageLabel];
    v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    reasonLabel = v4->_reasonLabel;
    v4->_reasonLabel = v15;

    [(UILabel *)v4->_reasonLabel setText:@"Reason"];
    v17 = [MEMORY[0x1E4FB1618] blackColor];
    [(UILabel *)v4->_reasonLabel setTextColor:v17];

    [(PXDiagnosticsCurationSectionHeaderView *)v4 addSubview:v4->_reasonLabel];
  }
  return v4;
}

@end