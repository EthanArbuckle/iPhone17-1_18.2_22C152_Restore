@interface TCFontName
- (NSString)fullName;
- (NSString)styleName;
- (TCFontName)initWithDictionary:(id)a3;
- (TCFontName)initWithStyleName:(id)a3 fullName:(id)a4;
- (id)description;
- (id)equivalentDictionary;
@end

@implementation TCFontName

- (TCFontName)initWithStyleName:(id)a3 fullName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TCFontName;
  v8 = [(TCFontName *)&v15 init];
  v9 = v8;
  if (v8)
  {
    if (v6)
    {
      uint64_t v10 = [v6 copy];
      styleName = v9->_styleName;
      v9->_styleName = (NSString *)v10;
    }
    else
    {
      styleName = v8->_styleName;
      v8->_styleName = (NSString *)&stru_26EBF24D8;
    }

    if (v7)
    {
      uint64_t v12 = [v7 copy];
      fullName = v9->_fullName;
      v9->_fullName = (NSString *)v12;
    }
    else
    {
      fullName = v9->_fullName;
      v9->_fullName = (NSString *)&stru_26EBF24D8;
    }
  }
  return v9;
}

- (id)equivalentDictionary
{
  v3 = NSDictionary;
  v4 = [(TCFontName *)self fullName];
  if (v4)
  {
    v5 = [(TCFontName *)self fullName];
  }
  else
  {
    v5 = &stru_26EBF24D8;
  }
  id v6 = [(TCFontName *)self styleName];
  if (v6)
  {
    id v7 = [(TCFontName *)self styleName];
  }
  else
  {
    id v7 = &stru_26EBF24D8;
  }
  v8 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, @"full-name", v7, @"style-name", 0);
  if (v6) {

  }
  if (v4) {
  return v8;
  }
}

- (TCFontName)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"style-name"];
  id v6 = [v4 objectForKeyedSubscript:@"full-name"];
  id v7 = [(TCFontName *)self initWithStyleName:v5 fullName:v6];

  return v7;
}

- (id)description
{
  v2 = [(TCFontName *)self equivalentDictionary];
  v3 = [v2 description];

  return v3;
}

- (NSString)styleName
{
  return self->_styleName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_styleName, 0);
}

@end