@interface MLContentRating
- (MLContentRating)init;
- (MLContentRating)initWithContentRatingDictionary:(id)a3;
- (MLContentRating)initWithStringRepresentation:(id)a3;
- (NSNumber)ratingRank;
- (NSString)ratingDescription;
- (NSString)ratingLabel;
- (NSString)ratingSystem;
- (id)copyStringRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setValue:(id)a3 forKey:(id)a4;
- (void)_setValueCopy:(id)a3 forKey:(id)a4;
- (void)setRatingDescription:(id)a3;
- (void)setRatingLabel:(id)a3;
- (void)setRatingRank:(id)a3;
- (void)setRatingSystem:(id)a3;
@end

@implementation MLContentRating

- (void).cxx_destruct
{
}

- (void)_setValueCopy:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = (id)[a3 copy];
  [(MLContentRating *)self _setValue:v7 forKey:v6];
}

- (void)_setValue:(id)a3 forKey:(id)a4
{
  dictionary = self->_dictionary;
  if (a3) {
    [(NSMutableDictionary *)dictionary setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)dictionary removeObjectForKey:a4];
  }
}

- (id)copyStringRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = [(MLContentRating *)self ratingSystem];
  v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_1F08D4D70;
  }
  [v3 appendFormat:@"%@|", v6];
  id v7 = [(MLContentRating *)self ratingLabel];

  if (v7) {
    v8 = v7;
  }
  else {
    v8 = &stru_1F08D4D70;
  }
  [v3 appendFormat:@"%@|", v8];
  v9 = [(MLContentRating *)self ratingRank];
  v10 = [v9 stringValue];

  if (v10) {
    v11 = v10;
  }
  else {
    v11 = &stru_1F08D4D70;
  }
  [v3 appendFormat:@"%@|", v11];
  v12 = [(MLContentRating *)self ratingDescription];

  if (v12) {
    v13 = v12;
  }
  else {
    v13 = &stru_1F08D4D70;
  }
  [v3 appendString:v13];

  return v3;
}

- (MLContentRating)initWithStringRepresentation:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v4 length])
  {
    id v6 = [v4 componentsSeparatedByString:@"|"];
    uint64_t v7 = [v6 count];
    if (v7)
    {
      unint64_t v8 = v7;
      v9 = [v6 objectAtIndex:0];
      [v5 setObject:v9 forKey:@"system"];

      if (v8 != 1)
      {
        v10 = [v6 objectAtIndex:1];
        [v5 setObject:v10 forKey:@"label"];

        if (v8 >= 3)
        {
          v11 = NSNumber;
          v12 = [v6 objectAtIndex:2];
          v13 = objc_msgSend(v11, "numberWithInt:", objc_msgSend(v12, "intValue"));
          [v5 setObject:v13 forKey:@"rank"];
        }
        v14 = [v6 objectAtIndex:1];
        [v5 setObject:v14 forKey:@"content"];
      }
    }
  }
  v15 = [(MLContentRating *)self initWithContentRatingDictionary:v5];

  return v15;
}

- (void)setRatingSystem:(id)a3
{
}

- (void)setRatingRank:(id)a3
{
}

- (void)setRatingLabel:(id)a3
{
}

- (void)setRatingDescription:(id)a3
{
}

- (NSString)ratingSystem
{
  return (NSString *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"system"];
}

- (NSNumber)ratingRank
{
  v2 = [(NSMutableDictionary *)self->_dictionary objectForKey:@"rank"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
LABEL_5:
    id v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v2, "integerValue"));
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSNumber *)v4;
}

- (NSString)ratingLabel
{
  return (NSString *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"label"];
}

- (NSString)ratingDescription
{
  return (NSString *)[(NSMutableDictionary *)self->_dictionary objectForKey:@"content"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  dictionary = self->_dictionary;

  return (id)[v4 initWithContentRatingDictionary:dictionary];
}

- (MLContentRating)initWithContentRatingDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLContentRating;
  id v5 = [(MLContentRating *)&v9 init];
  if (v5)
  {
    if (v4) {
      id v6 = (NSMutableDictionary *)[v4 mutableCopy];
    }
    else {
      id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    dictionary = v5->_dictionary;
    v5->_dictionary = v6;
  }
  return v5;
}

- (MLContentRating)init
{
  return [(MLContentRating *)self initWithContentRatingDictionary:0];
}

@end