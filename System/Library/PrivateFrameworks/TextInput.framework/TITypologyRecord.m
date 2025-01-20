@interface TITypologyRecord
+ (BOOL)supportsSecureCoding;
+ (id)recordClasses;
- (NSUUID)recordID;
- (TITypologyRecord)init;
- (TITypologyRecord)initWithCoder:(id)a3;
- (double)timestamp;
- (id)changedText;
- (id)currentKeyboardState;
- (id)shortDescription;
- (id)textSummary;
- (id)textSummaryForAutocorrection:(id)a3;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRecordID:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation TITypologyRecord

- (void).cxx_destruct
{
}

- (void)setRecordID:(id)a3
{
}

- (NSUUID)recordID
{
  return self->_recordID;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (id)textSummaryForAutocorrection:(id)a3
{
  id v3 = a3;
  v4 = [v3 input];
  v5 = [v3 candidate];

  if ([v4 length]
    && ([MEMORY[0x1E4F28B88] alphanumericCharacterSet],
        v6 = objc_claimAutoreleasedReturnValue(),
        [v6 invertedSet],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v4 rangeOfCharacterFromSet:v7],
        v7,
        v6,
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    [NSString stringWithFormat:@"{%@→%@}", v4, v5];
  }
  else
  {
    [NSString stringWithFormat:@"{%@}", v5, v11];
  v9 = };

  return v9;
}

- (id)currentKeyboardState
{
  return 0;
}

- (id)changedText
{
  return 0;
}

- (id)shortDescription
{
  return @"TITypologyRecord";
}

- (id)textSummary
{
  return &stru_1EDBDCE38;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeObject:self->_recordID forKey:@"recordID"];
}

- (TITypologyRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TITypologyRecord;
  id v5 = [(TITypologyRecord *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_double timestamp = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordID"];
    recordID = v5->_recordID;
    v5->_recordID = (NSUUID *)v7;
  }
  return v5;
}

- (TITypologyRecord)init
{
  v8.receiver = self;
  v8.super_class = (Class)TITypologyRecord;
  v2 = [(TITypologyRecord *)&v8 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28F80] processInfo];
    [v3 systemUptime];
    v2->_double timestamp = v4;

    uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
    recordID = v2->_recordID;
    v2->_recordID = (NSUUID *)v5;
  }
  return v2;
}

+ (id)recordClasses
{
  v4[16] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  v4[12] = objc_opt_class();
  v4[13] = objc_opt_class();
  v4[14] = objc_opt_class();
  v4[15] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:16];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
}

@end