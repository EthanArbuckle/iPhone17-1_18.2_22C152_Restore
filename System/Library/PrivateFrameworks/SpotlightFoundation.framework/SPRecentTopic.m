@interface SPRecentTopic
- (NSDate)engagementDate;
- (NSNumber)score;
- (SFTopic)topic;
- (SPRecentTopic)initWithTopic:(id)a3 score:(id)a4 engagementDate:(id)a5;
@end

@implementation SPRecentTopic

- (SPRecentTopic)initWithTopic:(id)a3 score:(id)a4 engagementDate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SPRecentTopic;
  v12 = [(SPRecentTopic *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topic, a3);
    objc_storeStrong((id *)&v13->_score, a4);
    objc_storeStrong((id *)&v13->_engagementDate, a5);
  }

  return v13;
}

- (SFTopic)topic
{
  return self->_topic;
}

- (NSNumber)score
{
  return self->_score;
}

- (NSDate)engagementDate
{
  return self->_engagementDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engagementDate, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

@end