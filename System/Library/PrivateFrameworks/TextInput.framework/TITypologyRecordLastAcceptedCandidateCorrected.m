@interface TITypologyRecordLastAcceptedCandidateCorrected
+ (BOOL)supportsSecureCoding;
- (TITypologyRecordLastAcceptedCandidateCorrected)initWithCoder:(id)a3;
- (id)shortDescription;
- (void)applyToStatistic:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TITypologyRecordLastAcceptedCandidateCorrected

- (id)shortDescription
{
  return @"LAST ACCEPTED CANDIDATE CORRECTED";
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TITypologyRecordLastAcceptedCandidateCorrected;
  [(TITypologyRecord *)&v3 encodeWithCoder:a3];
}

- (TITypologyRecordLastAcceptedCandidateCorrected)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TITypologyRecordLastAcceptedCandidateCorrected;
  return [(TITypologyRecord *)&v4 initWithCoder:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)applyToStatistic:(id)a3
{
}

@end