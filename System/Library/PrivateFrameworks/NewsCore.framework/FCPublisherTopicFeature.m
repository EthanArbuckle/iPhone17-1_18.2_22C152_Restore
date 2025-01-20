@interface FCPublisherTopicFeature
- (FCPublisherTopicFeature)init;
- (FCPublisherTopicFeature)initWithPersonalizationIdentifier:(id)a3;
- (FCPublisherTopicFeature)initWithPublisherTagID:(id)a3 topicTagID:(id)a4;
- (NSArray)features;
- (NSString)publisherTagID;
- (NSString)topicTagID;
- (void)setPublisherTagID:(id)a3;
- (void)setTopicTagID:(id)a3;
@end

@implementation FCPublisherTopicFeature

- (FCPublisherTopicFeature)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(FCPublisherTopicFeature *)self initWithPublisherTagID:0 topicTagID:0];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPublisherTopicFeature init]";
    __int16 v9 = 2080;
    v10 = "FCPersonalizationFeature.m";
    __int16 v11 = 1024;
    int v12 = 753;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCPublisherTopicFeature init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (FCPublisherTopicFeature)initWithPersonalizationIdentifier:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 rangeOfString:@"+"];
  uint64_t v7 = v6;
  unint64_t v8 = [v4 rangeOfString:@"+" options:4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL && v8 > v5)
  {
    uint64_t v13 = v5 + v7;
    uint64_t v14 = v8 - v13;
    uint64_t v15 = v8 + v9;
    uint64_t v16 = [v4 length] - (v8 + v9);
    v17 = objc_msgSend(v4, "substringWithRange:", v13, v14);
    v18 = objc_msgSend(v4, "substringWithRange:", v15, v16);
    self = [(FCPublisherTopicFeature *)self initWithPublisherTagID:v17 topicTagID:v18];

    int v12 = self;
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

- (FCPublisherTopicFeature)initWithPublisherTagID:(id)a3 topicTagID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)FCPublisherTopicFeature;
  unint64_t v8 = [(FCPersonalizationFeature *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    if (v6) {
      [(FCPublisherTopicFeature *)v8 setPublisherTagID:v6];
    }
    if (v7) {
      [(FCPublisherTopicFeature *)v9 setTopicTagID:v7];
    }
    uint64_t v10 = [NSString stringWithFormat:@"%@%@%@%@%@", @"f4", @"+", v6, @"+", v7];
    personalizationIdentifier = v9->super._personalizationIdentifier;
    v9->super._personalizationIdentifier = (NSString *)v10;
  }
  return v9;
}

- (NSArray)features
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [FCTagIDFeature alloc];
  id v4 = [(FCPublisherTopicFeature *)self publisherTagID];
  unint64_t v5 = [(FCTagIDFeature *)v3 initWithTagID:v4];
  v11[0] = v5;
  id v6 = [FCTagIDFeature alloc];
  id v7 = [(FCPublisherTopicFeature *)self topicTagID];
  unint64_t v8 = [(FCTagIDFeature *)v6 initWithTagID:v7];
  v11[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)publisherTagID
{
  return self->_publisherTagID;
}

- (void)setPublisherTagID:(id)a3
{
}

- (NSString)topicTagID
{
  return self->_topicTagID;
}

- (void)setTopicTagID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicTagID, 0);
  objc_storeStrong((id *)&self->_publisherTagID, 0);
}

@end