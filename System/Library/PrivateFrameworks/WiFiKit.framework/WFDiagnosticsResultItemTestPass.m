@interface WFDiagnosticsResultItemTestPass
- (BOOL)didPassTest;
- (NSArray)failedTests;
- (NSArray)results;
- (NSString)suggestion;
- (NSString)title;
- (WFDiagnosticsResultItemTestPass)initWithResults:(id)a3;
- (void)setDidPassTest:(BOOL)a3;
- (void)setFailedTests:(id)a3;
- (void)setResults:(id)a3;
- (void)setSuggestion:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation WFDiagnosticsResultItemTestPass

- (WFDiagnosticsResultItemTestPass)initWithResults:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFDiagnosticsResultItemTestPass;
  id v3 = a3;
  v4 = [(WFDiagnosticsResultItemTestPass *)&v6 init];
  -[WFDiagnosticsResultItemTestPass setResults:](v4, "setResults:", v3, v6.receiver, v6.super_class);

  [(WFDiagnosticsResultItemTestPass *)v4 setDidPassTest:1];
  [(WFDiagnosticsResultItemTestPass *)v4 setFailedTests:MEMORY[0x263EFFA68]];
  return v4;
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
}

- (BOOL)didPassTest
{
  return self->_didPassTest;
}

- (void)setDidPassTest:(BOOL)a3
{
  self->_didPassTest = a3;
}

- (NSArray)failedTests
{
  return self->_failedTests;
}

- (void)setFailedTests:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedTests, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end