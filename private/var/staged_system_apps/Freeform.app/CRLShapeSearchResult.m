@interface CRLShapeSearchResult
- (BOOL)isEqual:(id)a3;
- (BOOL)isExactMatch;
- (CRLShapeSearchResult)initWithIdentifier:(id)a3 matchingKeyword:(id)a4 priority:(unint64_t)a5 score:(id)a6;
- (NSNumber)score;
- (NSString)matchingKeyword;
- (id)description;
- (id)identifier;
- (unint64_t)hash;
- (unint64_t)priority;
- (void)setIsExactMatch:(BOOL)a3;
- (void)setScore:(id)a3;
@end

@implementation CRLShapeSearchResult

- (CRLShapeSearchResult)initWithIdentifier:(id)a3 matchingKeyword:(id)a4 priority:(unint64_t)a5 score:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CRLShapeSearchResult;
  v14 = [(CRLShapeSearchResult *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong(&v14->_identifier, a3);
    v16 = (NSString *)[v12 copy];
    matchingKeyword = v15->_matchingKeyword;
    v15->_matchingKeyword = v16;

    v15->_priority = a5;
    objc_storeStrong((id *)&v15->_score, a6);
  }

  return v15;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLShapeSearchResult *)self identifier];
  v5 = [(CRLShapeSearchResult *)self matchingKeyword];
  unint64_t v6 = [(CRLShapeSearchResult *)self priority];
  v7 = [(CRLShapeSearchResult *)self score];
  v8 = +[NSString stringWithFormat:@"<%@: %p identifier=%@ matchingKeyword=%@ priority=%lu score=%@>", v3, self, v4, v5, v6, v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  unint64_t v6 = sub_1002469D0(v5, v4);

  v7 = [(CRLShapeSearchResult *)self identifier];
  v8 = [v6 identifier];
  if ([v7 isEqual:v8])
  {
    v9 = [(CRLShapeSearchResult *)self matchingKeyword];
    v10 = [v6 matchingKeyword];
    unsigned __int8 v11 = [v9 isEqual:v10];
  }
  else
  {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  id v6 = [self->_identifier hash];
  uint64_t v3 = sub_1000C8080((char *)&v6, 8, 0xCBF29CE484222325);
  NSUInteger v5 = [(NSString *)self->_matchingKeyword hash];
  return sub_1000C8080((char *)&v5, 8, v3);
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)matchingKeyword
{
  return self->_matchingKeyword;
}

- (BOOL)isExactMatch
{
  return self->_isExactMatch;
}

- (void)setIsExactMatch:(BOOL)a3
{
  self->_isExactMatch = a3;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (NSNumber)score
{
  return self->_score;
}

- (void)setScore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_matchingKeyword, 0);

  objc_storeStrong(&self->_identifier, 0);
}

@end