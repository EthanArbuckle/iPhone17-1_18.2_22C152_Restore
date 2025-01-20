@interface FeedbackSubmissionPostAction
+ (BOOL)supportsSecureCoding;
- (FeedbackSubmissionPostAction)initWithCoder:(id)a3;
- (NSData)data;
- (NSString)communityIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setCommunityIdentifier:(id)a3;
- (void)setData:(id)a3;
@end

@implementation FeedbackSubmissionPostAction

- (FeedbackSubmissionPostAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FeedbackSubmissionPostAction;
  v5 = [(FeedbackSubmissionPostAction *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    [(FeedbackSubmissionPostAction *)v5 setData:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"communityIdentifier"];
    id v8 = [v7 copy];
    [(FeedbackSubmissionPostAction *)v5 setCommunityIdentifier:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(FeedbackSubmissionPostAction *)self data];
  [v4 encodeObject:v5 forKey:@"data"];

  id v6 = [(FeedbackSubmissionPostAction *)self communityIdentifier];
  [v4 encodeObject:v6 forKey:@"communityIdentifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)communityIdentifier
{
  return self->_communityIdentifier;
}

- (void)setCommunityIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_communityIdentifier, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end