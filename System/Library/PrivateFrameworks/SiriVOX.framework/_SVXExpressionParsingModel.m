@interface _SVXExpressionParsingModel
- (NSMutableArray)parseableExpressions;
- (NSMutableDictionary)aceViewByAceId;
- (NSMutableDictionary)aceViewIdByExpressionId;
- (_SVXExpressionParsingModel)initWithParseableExpressions:(id)a3 aceViewIdByExpressionId:(id)a4 aceViewByAceId:(id)a5;
- (void)setAceViewByAceId:(id)a3;
- (void)setAceViewIdByExpressionId:(id)a3;
- (void)setParseableExpressions:(id)a3;
@end

@implementation _SVXExpressionParsingModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aceViewByAceId, 0);
  objc_storeStrong((id *)&self->_aceViewIdByExpressionId, 0);

  objc_storeStrong((id *)&self->_parseableExpressions, 0);
}

- (void)setAceViewByAceId:(id)a3
{
}

- (NSMutableDictionary)aceViewByAceId
{
  return self->_aceViewByAceId;
}

- (void)setAceViewIdByExpressionId:(id)a3
{
}

- (NSMutableDictionary)aceViewIdByExpressionId
{
  return self->_aceViewIdByExpressionId;
}

- (void)setParseableExpressions:(id)a3
{
}

- (NSMutableArray)parseableExpressions
{
  return self->_parseableExpressions;
}

- (_SVXExpressionParsingModel)initWithParseableExpressions:(id)a3 aceViewIdByExpressionId:(id)a4 aceViewByAceId:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_SVXExpressionParsingModel;
  v12 = [(_SVXExpressionParsingModel *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parseableExpressions, a3);
    objc_storeStrong((id *)&v13->_aceViewIdByExpressionId, a4);
    objc_storeStrong((id *)&v13->_aceViewByAceId, a5);
  }

  return v13;
}

@end