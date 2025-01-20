@interface MOContextStringFeedback
+ (BOOL)supportsSecureCoding;
+ (id)describeFeedbackMode:(unint64_t)a3;
+ (id)describeUsageFeedback:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (MOContextStringFeedback)initWithCoder:(id)a3;
- (MOContextStringFeedback)initWithContextStringIdentifier:(id)a3;
- (NSDate)timestamp;
- (NSString)textString;
- (NSUUID)stringIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)describeFeedbackMode;
- (id)describeUsageFeedback;
- (id)description;
- (unint64_t)mode;
- (unint64_t)score;
- (unint64_t)usage;
- (void)encodeWithCoder:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setScore:(unint64_t)a3;
- (void)setStringIdentifier:(id)a3;
- (void)setTextString:(id)a3;
- (void)setTimestamp:(id)a3;
- (void)setUsage:(unint64_t)a3;
@end

@implementation MOContextStringFeedback

- (MOContextStringFeedback)initWithContextStringIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextStringFeedback;
  v6 = [(MOContextStringFeedback *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stringIdentifier, a3);
  }

  return v7;
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
  [v5 encodeInteger:self->_score forKey:@"score"];
  [v5 encodeObject:self->_timestamp forKey:@"timestamp"];
  [v5 encodeInteger:self->_mode forKey:@"mode"];
  [v5 encodeInteger:self->_usage forKey:@"usage"];
}

- (MOContextStringFeedback)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringIdentifier"];
  v6 = [(MOContextStringFeedback *)self initWithContextStringIdentifier:v5];
  if (v6)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textString"];
    textString = v6->_textString;
    v6->_textString = (NSString *)v7;

    v6->_score = (unint64_t)[v4 decodeIntegerForKey:@"score"];
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v9;

    v6->_mode = (unint64_t)[v4 decodeIntegerForKey:@"mode"];
    v6->_usage = (unint64_t)[v4 decodeIntegerForKey:@"usage"];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [v4 isMemberOfClass:objc_opt_class()];
  stringIdentifier = self->_stringIdentifier;
  uint64_t v7 = [v4 stringIdentifier];
  LOBYTE(stringIdentifier) = [(NSUUID *)stringIdentifier isEqual:v7];

  textString = self->_textString;
  uint64_t v9 = [v4 textString];

  LOBYTE(textString) = [(NSString *)textString isEqual:v9];
  return v5 & stringIdentifier & textString;
}

- (id)describeFeedbackMode
{
  unint64_t v2 = [(MOContextStringFeedback *)self mode];
  return +[MOContextStringFeedback describeFeedbackMode:v2];
}

+ (id)describeFeedbackMode:(unint64_t)a3
{
  CFStringRef v3 = @"Unknown";
  if (a3 == 1) {
    CFStringRef v3 = @"System";
  }
  if (a3 == 2) {
    return @"User";
  }
  else {
    return (id)v3;
  }
}

- (id)describeUsageFeedback
{
  unint64_t v2 = [(MOContextStringFeedback *)self usage];
  return +[MOContextStringFeedback describeUsageFeedback:v2];
}

+ (id)describeUsageFeedback:(unint64_t)a3
{
  if (a3 - 1 > 5) {
    return @"Unknown";
  }
  else {
    return off_1000A5A80[a3 - 1];
  }
}

- (id)description
{
  CFStringRef v3 = [(MOContextStringFeedback *)self stringIdentifier];
  id v4 = [(MOContextStringFeedback *)self textString];
  unsigned __int8 v5 = [(MOContextStringFeedback *)self timestamp];
  unint64_t v6 = [(MOContextStringFeedback *)self score];
  uint64_t v7 = [(MOContextStringFeedback *)self describeFeedbackMode];
  v8 = [(MOContextStringFeedback *)self describeUsageFeedback];
  uint64_t v9 = +[NSString stringWithFormat:@"stringIdentifier, %@, string, %@, timestamp, %@, score ,%lu, mode, %@, usage, %@", v3, v4, v5, v6, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MOContextStringFeedback alloc];
  unsigned __int8 v5 = [(MOContextStringFeedback *)self stringIdentifier];
  unint64_t v6 = [(MOContextStringFeedback *)v4 initWithContextStringIdentifier:v5];

  uint64_t v7 = [(MOContextStringFeedback *)self textString];
  [(MOContextStringFeedback *)v6 setTextString:v7];

  v8 = [(MOContextStringFeedback *)self timestamp];
  [(MOContextStringFeedback *)v6 setTimestamp:v8];

  [(MOContextStringFeedback *)v6 setScore:[(MOContextStringFeedback *)self score]];
  [(MOContextStringFeedback *)v6 setMode:[(MOContextStringFeedback *)self mode]];
  [(MOContextStringFeedback *)v6 setUsage:[(MOContextStringFeedback *)self usage]];
  return v6;
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

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (unint64_t)score
{
  return self->_score;
}

- (void)setScore:(unint64_t)a3
{
  self->_score = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (unint64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(unint64_t)a3
{
  self->_usage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_stringIdentifier, 0);
  objc_storeStrong((id *)&self->_textString, 0);
}

@end