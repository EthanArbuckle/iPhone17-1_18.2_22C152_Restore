@interface WFAddButtonParameter
- (WFAddButtonParameterDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation WFAddButtonParameter

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (WFAddButtonParameterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFAddButtonParameterDelegate *)WeakRetained;
}

@end