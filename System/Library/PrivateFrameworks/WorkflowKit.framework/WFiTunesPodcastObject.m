@interface WFiTunesPodcastObject
+ (id)JSONKeyPathsByPropertyKey;
- (NSString)podcastUUID;
- (NSURL)feedURL;
- (WFiTunesPodcastObject)initWithName:(id)a3 identifier:(id)a4 podcastUUID:(id)a5 feedURL:(id)a6 kind:(id)a7;
- (void)setFeedURL:(id)a3;
- (void)setPodcastUUID:(id)a3;
@end

@implementation WFiTunesPodcastObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedURL, 0);
  objc_storeStrong((id *)&self->_podcastUUID, 0);
}

- (void)setFeedURL:(id)a3
{
}

- (NSURL)feedURL
{
  return self->_feedURL;
}

- (void)setPodcastUUID:(id)a3
{
}

- (NSString)podcastUUID
{
  return self->_podcastUUID;
}

- (WFiTunesPodcastObject)initWithName:(id)a3 identifier:(id)a4 podcastUUID:(id)a5 feedURL:(id)a6 kind:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)WFiTunesPodcastObject;
  v14 = [(WFiTunesObject *)&v18 initWithName:a3 identifier:a4 kind:a7];
  v15 = v14;
  if (v14)
  {
    [(WFiTunesPodcastObject *)v14 setPodcastUUID:v12];
    [(WFiTunesPodcastObject *)v15 setFeedURL:v13];
    v16 = v15;
  }

  return v15;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesPodcastObject;
  v2 = objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v3 = (void *)[v2 mutableCopy];

  v7[0] = @"podcastUUID";
  v7[1] = @"feedURL";
  v8[0] = @"podcastUUID";
  v8[1] = @"feedUrl";
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  [v3 addEntriesFromDictionary:v4];

  return v3;
}

@end