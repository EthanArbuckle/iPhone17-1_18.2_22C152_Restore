@interface TITypologyStatisticCurrentAutocorrections
- (TIAutocorrectionList)autocorrections;
- (TICandidateRequestToken)requestToken;
- (void)setAutocorrections:(id)a3;
- (void)setRequestToken:(id)a3;
- (void)visitRecordAutocorrections:(id)a3;
@end

@implementation TITypologyStatisticCurrentAutocorrections

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToken, 0);

  objc_storeStrong((id *)&self->_autocorrections, 0);
}

- (void)setRequestToken:(id)a3
{
}

- (TICandidateRequestToken)requestToken
{
  return self->_requestToken;
}

- (void)setAutocorrections:(id)a3
{
}

- (TIAutocorrectionList)autocorrections
{
  return self->_autocorrections;
}

- (void)visitRecordAutocorrections:(id)a3
{
  id v4 = a3;
  v5 = [v4 autocorrections];
  [(TITypologyStatisticCurrentAutocorrections *)self setAutocorrections:v5];

  id v6 = [v4 requestToken];

  [(TITypologyStatisticCurrentAutocorrections *)self setRequestToken:v6];
}

@end