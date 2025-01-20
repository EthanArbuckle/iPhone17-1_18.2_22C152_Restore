@interface MRMediaSuggestionController
- (MRMediaSuggestionController)initWithRequest:(id)a3;
- (MRMediaSuggestionControllerDelegate)delegate;
- (MRMediaSuggestionRequest)request;
- (NSDictionary)suggestions;
- (void)setDelegate:(id)a3;
@end

@implementation MRMediaSuggestionController

- (MRMediaSuggestionController)initWithRequest:(id)a3
{
  return 0;
}

- (MRMediaSuggestionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRMediaSuggestionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRMediaSuggestionRequest)request
{
  return self->_request;
}

- (NSDictionary)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_request, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end