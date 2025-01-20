@interface TextToken
- (NSArray)features;
- (NSString)string;
- (TextToken)initWithString:(id)a3 score:(double)a4 features:(id)a5 wordID:(int)a6 properties:(unint64_t)a7;
- (double)score;
- (int)wordID;
- (unint64_t)properties;
@end

@implementation TextToken

- (TextToken)initWithString:(id)a3 score:(double)a4 features:(id)a5 wordID:(int)a6 properties:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)TextToken;
  v15 = [(TextToken *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_string, a3);
    v16->_score = a4;
    objc_storeStrong((id *)&v16->_features, a5);
    v16->_wordID = a6;
    v16->_properties = a7;
  }

  return v16;
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (double)score
{
  return self->_score;
}

- (NSArray)features
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (int)wordID
{
  return self->_wordID;
}

- (unint64_t)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end