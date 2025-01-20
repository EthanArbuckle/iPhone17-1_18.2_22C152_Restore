@interface MOContextString
+ (BOOL)supportsSecureCoding;
+ (id)describeSource:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (MOContextString)initWithCoder:(id)a3;
- (MOContextString)initWithContextStringMO:(id)a3;
- (MOContextString)initWithIdentifier:(id)a3 string:(id)a4;
- (NSArray)contextDimensions;
- (NSString)textString;
- (NSUUID)stringIdentifier;
- (double)accuracy;
- (double)satisfaction;
- (double)totalScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)describeSource;
- (id)description;
- (unint64_t)contentType;
- (unint64_t)promptIndex;
- (unint64_t)source;
- (void)encodeWithCoder:(id)a3;
- (void)setAccuracy:(double)a3;
- (void)setContentType:(unint64_t)a3;
- (void)setContextDimensions:(id)a3;
- (void)setPromptIndex:(unint64_t)a3;
- (void)setSatisfaction:(double)a3;
- (void)setSource:(unint64_t)a3;
- (void)setStringIdentifier:(id)a3;
- (void)setTextString:(id)a3;
- (void)setTotalScore:(double)a3;
@end

@implementation MOContextString

- (MOContextString)initWithIdentifier:(id)a3 string:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOContextString;
  v9 = [(MOContextString *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stringIdentifier, a3);
    objc_storeStrong((id *)&v10->_textString, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  stringIdentifier = self->_stringIdentifier;
  id v5 = a3;
  [v5 encodeObject:stringIdentifier forKey:@"stringIdentifier"];
  [v5 encodeObject:self->_textString forKey:@"textString"];
  [v5 encodeInteger:self->_source forKey:@"source"];
  [v5 encodeObject:self->_contextDimensions forKey:@"contextDimensions"];
  [v5 encodeDouble:@"accuracy" forKey:self->_accuracy];
  [v5 encodeDouble:@"satisfaction" forKey:self->_satisfaction];
  [v5 encodeInteger:self->_contentType forKey:@"contentType"];
  [v5 encodeInteger:self->_promptIndex forKey:@"promptIndex"];
  [v5 encodeDouble:@"totalScore" forKey:self->_totalScore];
}

- (MOContextString)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textString"];
  id v7 = [(MOContextString *)self initWithIdentifier:v5 string:v6];
  if (v7)
  {
    v7->_source = (unint64_t)[v4 decodeIntegerForKey:@"source"];
    uint64_t v8 = objc_opt_class();
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"contextDimensions"];
    contextDimensions = v7->_contextDimensions;
    v7->_contextDimensions = (NSArray *)v10;

    [v4 decodeDoubleForKey:@"accuracy"];
    v7->_accuracy = v12;
    [v4 decodeDoubleForKey:@"satisfaction"];
    v7->_satisfaction = v13;
    v7->_contentType = (unint64_t)[v4 decodeIntegerForKey:@"contentType"];
    v7->_promptIndex = (unint64_t)[v4 decodeIntegerForKey:@"promptIndex"];
    [v4 decodeDoubleForKey:@"totalScore"];
    v7->_totalScore = v14;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 isMemberOfClass:objc_opt_class()];
  stringIdentifier = self->_stringIdentifier;
  id v7 = [v4 stringIdentifier];
  LOBYTE(stringIdentifier) = [(NSUUID *)stringIdentifier isEqual:v7];

  textString = self->_textString;
  v9 = [v4 textString];

  LOBYTE(textString) = [(NSString *)textString isEqual:v9];
  return v5 & stringIdentifier & textString;
}

+ (id)describeSource:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return *(&off_1000A4F88 + a3 - 1);
  }
}

- (id)describeSource
{
  unint64_t v2 = [(MOContextString *)self source];
  return +[MOContextString describeSource:v2];
}

- (id)description
{
  v3 = [(MOContextString *)self stringIdentifier];
  id v4 = [(MOContextString *)self textString];
  unsigned __int8 v5 = [(MOContextString *)self describeSource];
  v6 = [(MOContextString *)self contextDimensions];
  unint64_t v7 = [(MOContextString *)self contentType];
  unint64_t v8 = [(MOContextString *)self promptIndex];
  [(MOContextString *)self totalScore];
  uint64_t v10 = +[NSString stringWithFormat:@"stringIdentifier, %@, string, %@, source, %@, contextDimensions, %@, contentType, %lu, promptIndex, %lu, totalScore, %f", v3, v4, v5, v6, v7, v8, v9];

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MOContextString alloc];
  unsigned __int8 v5 = [(MOContextString *)self stringIdentifier];
  v6 = [(MOContextString *)self textString];
  unint64_t v7 = [(MOContextString *)v4 initWithIdentifier:v5 string:v6];

  unint64_t v8 = [(MOContextString *)self contextDimensions];
  [(MOContextString *)v7 setContextDimensions:v8];

  [(MOContextString *)v7 setSource:[(MOContextString *)self source]];
  [(MOContextString *)self accuracy];
  -[MOContextString setAccuracy:](v7, "setAccuracy:");
  [(MOContextString *)self satisfaction];
  -[MOContextString setSatisfaction:](v7, "setSatisfaction:");
  [(MOContextString *)v7 setContentType:[(MOContextString *)self contentType]];
  [(MOContextString *)v7 setPromptIndex:[(MOContextString *)self promptIndex]];
  [(MOContextString *)self totalScore];
  -[MOContextString setTotalScore:](v7, "setTotalScore:");
  return v7;
}

- (NSString)textString
{
  return self->_textString;
}

- (void)setTextString:(id)a3
{
}

- (NSUUID)stringIdentifier
{
  return self->_stringIdentifier;
}

- (void)setStringIdentifier:(id)a3
{
}

- (NSArray)contextDimensions
{
  return self->_contextDimensions;
}

- (void)setContextDimensions:(id)a3
{
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (void)setAccuracy:(double)a3
{
  self->_accuracy = a3;
}

- (double)satisfaction
{
  return self->_satisfaction;
}

- (void)setSatisfaction:(double)a3
{
  self->_satisfaction = a3;
}

- (unint64_t)promptIndex
{
  return self->_promptIndex;
}

- (void)setPromptIndex:(unint64_t)a3
{
  self->_promptIndex = a3;
}

- (double)totalScore
{
  return self->_totalScore;
}

- (void)setTotalScore:(double)a3
{
  self->_totalScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDimensions, 0);
  objc_storeStrong((id *)&self->_stringIdentifier, 0);
  objc_storeStrong((id *)&self->_textString, 0);
}

- (MOContextString)initWithContextStringMO:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4)
  {
    v6 = [v4 stringIdentifier];
    unint64_t v7 = [v5 textString];
    self = [(MOContextString *)self initWithIdentifier:v6 string:v7];

    -[MOContextString setSource:](self, "setSource:", [v5 source]);
    -[MOContextString setContentType:](self, "setContentType:", [v5 contentType]);
    -[MOContextString setPromptIndex:](self, "setPromptIndex:", [v5 promptIndex]);
    [v5 totalScore];
    -[MOContextString setTotalScore:](self, "setTotalScore:");
    NSSelectorFromString(@"contextDimensions");
    if (objc_opt_respondsToSelector())
    {
      unint64_t v8 = objc_opt_new();
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v9 = objc_msgSend(v5, "contextDimensions", 0);
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            double v14 = [[MOContextDimension alloc] initWithContextDimensionMO:*(void *)(*((void *)&v18 + 1) + 8 * i)];
            [v8 addObject:v14];
          }
          id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }

      id v15 = [v8 copy];
      [(MOContextString *)self setContextDimensions:v15];
    }
    v16 = self;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end