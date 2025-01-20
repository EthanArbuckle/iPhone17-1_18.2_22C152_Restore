@interface WBSPasswordPatternMatch
- (BOOL)isEqual:(id)a3;
- (NSDictionary)dictionaryRepresentation;
- (NSDictionary)userInfo;
- (NSString)matchedSubstring;
- (WBSPasswordPatternMatch)initWithDictionaryRepresentation:(id)a3;
- (WBSPasswordPatternMatch)initWithType:(unint64_t)a3 matchedSubstring:(id)a4 range:(_NSRange)a5 guessesRequired:(double)a6 userInfo:(id)a7;
- (_NSRange)range;
- (double)guessesRequired;
- (id)compactDescriptionWithMatchedStringColumnWidth:(unint64_t)a3;
- (id)description;
- (id)initExhaustiveSearchPatternWithMatchedSubstring:(id)a3 range:(_NSRange)a4;
- (unint64_t)endIndex;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation WBSPasswordPatternMatch

- (WBSPasswordPatternMatch)initWithType:(unint64_t)a3 matchedSubstring:(id)a4 range:(_NSRange)a5 guessesRequired:(double)a6 userInfo:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a4;
  id v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)WBSPasswordPatternMatch;
  v15 = [(WBSPasswordPatternMatch *)&v23 init];
  v16 = v15;
  if (v15)
  {
    v15->_type = a3;
    uint64_t v17 = [v13 copy];
    matchedSubstring = v16->_matchedSubstring;
    v16->_matchedSubstring = (NSString *)v17;

    v16->_range.NSUInteger location = location;
    v16->_range.NSUInteger length = length;
    v16->_guessesRequired = a6;
    uint64_t v19 = [v14 copy];
    userInfo = v16->_userInfo;
    v16->_userInfo = (NSDictionary *)v19;

    v21 = v16;
  }

  return v16;
}

- (id)initExhaustiveSearchPatternWithMatchedSubstring:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  double v7 = (double)a4.length;
  id v8 = a3;
  v9 = -[WBSPasswordPatternMatch initWithType:matchedSubstring:range:guessesRequired:userInfo:](self, "initWithType:matchedSubstring:range:guessesRequired:userInfo:", 0, v8, location, length, 0, __exp10(v7));

  return v9;
}

- (WBSPasswordPatternMatch)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "safari_numberForKey:", @"type");
  v6 = objc_msgSend(v4, "safari_numberForKey:", @"rangeLocation");
  double v7 = objc_msgSend(v4, "safari_numberForKey:", @"rangeLength");
  id v8 = objc_msgSend(v4, "safari_numberForKey:", @"guessesRequired");
  uint64_t v9 = [v4 objectForKeyedSubscript:@"matchedSubstring"];
  v10 = (void *)v9;
  v11 = &stru_1F105D3F0;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  id v13 = [v4 objectForKeyedSubscript:@"userInfo"];

  id v14 = 0;
  if (v5 && v6 && v7 && v8)
  {
    uint64_t v15 = [v5 integerValue];
    uint64_t v16 = [v6 unsignedIntegerValue];
    uint64_t v17 = [v7 unsignedIntegerValue];
    [v8 doubleValue];
    self = [(WBSPasswordPatternMatch *)self initWithType:v15 matchedSubstring:v12 range:v16 guessesRequired:v17 userInfo:v13];
    id v14 = self;
  }

  return v14;
}

- (unint64_t)endIndex
{
  return self->_range.location + self->_range.length - 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSPasswordPatternMatch *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(WBSPasswordPatternMatch *)v5 userInfo];
      unint64_t type = self->_type;
      if (type != [(WBSPasswordPatternMatch *)v5 type])
      {
        char v11 = 0;
LABEL_15:

        goto LABEL_16;
      }
      matchedSubstring = self->_matchedSubstring;
      uint64_t v9 = [(WBSPasswordPatternMatch *)v5 matchedSubstring];
      if (![(NSString *)matchedSubstring isEqualToString:v9]) {
        goto LABEL_13;
      }
      char v11 = 0;
      if (self->_range.location != [(WBSPasswordPatternMatch *)v5 range] || self->_range.length != v10) {
        goto LABEL_14;
      }
      double guessesRequired = self->_guessesRequired;
      [(WBSPasswordPatternMatch *)v5 guessesRequired];
      if (guessesRequired == v13)
      {
        userInfo = self->_userInfo;
        if ((unint64_t)userInfo | v6) {
          char v11 = [(NSDictionary *)userInfo isEqual:v6];
        }
        else {
          char v11 = 1;
        }
      }
      else
      {
LABEL_13:
        char v11 = 0;
      }
LABEL_14:

      goto LABEL_15;
    }
    char v11 = 0;
  }
LABEL_16:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_matchedSubstring hash];
  return [(NSDictionary *)self->_userInfo hash] ^ v3 ^ self->_range.location;
}

- (id)description
{
  NSUInteger v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  unint64_t v6 = self->_type - 1;
  if (v6 > 4) {
    double v7 = @"ExhaustiveSearch";
  }
  else {
    double v7 = off_1E615C4D8[v6];
  }
  matchedSubstring = self->_matchedSubstring;
  uint64_t v9 = NSStringFromRange(self->_range);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; unint64_t type = %@; matchedString = %@; range = %@; guessesRequired = %.0lf; userInfo = %@>",
    v5,
    self,
    v7,
    matchedSubstring,
    v9,
    *(void *)&self->_guessesRequired,
  uint64_t v10 = self->_userInfo);

  return v10;
}

- (id)compactDescriptionWithMatchedStringColumnWidth:(unint64_t)a3
{
  NSUInteger location = self->_range.location;
  if (self->_userInfo)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    userInfo = self->_userInfo;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__WBSPasswordPatternMatch_compactDescriptionWithMatchedStringColumnWidth___block_invoke;
    v16[3] = &unk_1E615C4B8;
    id v17 = v6;
    id v8 = v6;
    [(NSDictionary *)userInfo enumerateKeysAndObjectsUsingBlock:v16];
    uint64_t v9 = [v8 componentsJoinedByString:@", "];
  }
  else
  {
    uint64_t v9 = &stru_1F105D3F0;
  }
  uint64_t v10 = NSString;
  char v11 = [(NSString *)self->_matchedSubstring UTF8String];
  unint64_t v12 = self->_type - 1;
  if (v12 > 4) {
    double v13 = @"ExhaustiveSearch";
  }
  else {
    double v13 = off_1E615C4D8[v12];
  }
  id v14 = [v10 stringWithFormat:@"%*s%-*s | %-16s | %12lg | %@", location, ", a3 - location, v11, -[__CFString UTF8String](v13, "UTF8String""), *(void *)&self->_guessesRequired, v9];

  return v14;
}

void __74__WBSPasswordPatternMatch_compactDescriptionWithMatchedStringColumnWidth___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSUInteger v3 = *(void **)(a1 + 32);
  [NSString stringWithFormat:@"%@ = %@", a2, a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

- (NSDictionary)dictionaryRepresentation
{
  v14[5] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = (void *)MEMORY[0x1E4F1CA60];
  v13[0] = @"type";
  id v4 = [NSNumber numberWithUnsignedInteger:self->_type];
  matchedSubstring = self->_matchedSubstring;
  v14[0] = v4;
  v14[1] = matchedSubstring;
  v13[1] = @"matchedSubstring";
  v13[2] = @"rangeLocation";
  id v6 = [NSNumber numberWithUnsignedInteger:self->_range.location];
  v14[2] = v6;
  v13[3] = @"rangeLength";
  double v7 = [NSNumber numberWithUnsignedInteger:self->_range.length];
  v14[3] = v7;
  v13[4] = @"guessesRequired";
  id v8 = [NSNumber numberWithDouble:self->_guessesRequired];
  v14[4] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  uint64_t v10 = [v3 dictionaryWithDictionary:v9];

  userInfo = self->_userInfo;
  if (userInfo) {
    [v10 setObject:userInfo forKeyedSubscript:@"userInfo"];
  }
  return (NSDictionary *)v10;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)matchedSubstring
{
  return self->_matchedSubstring;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (double)guessesRequired
{
  return self->_guessesRequired;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_matchedSubstring, 0);
}

@end