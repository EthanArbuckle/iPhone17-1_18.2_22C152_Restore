@interface SearchTopHitsSuggester
+ (OS_os_log)log;
- (BOOL)shouldQueryForAsYouType;
- (NSArray)categories;
- (NSString)logIdentifier;
- (SearchTopHitsSuggester)initWithMessageRepository:(id)a3 bundleID:(id)a4;
- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4;
@end

@implementation SearchTopHitsSuggester

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100212B60;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699EB8 != -1) {
    dispatch_once(&qword_100699EB8, block);
  }
  v2 = (void *)qword_100699EB0;

  return (OS_os_log *)v2;
}

- (SearchTopHitsSuggester)initWithMessageRepository:(id)a3 bundleID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SearchTopHitsSuggester;
  v9 = [(SearchTopHitsSuggester *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageRepository, a3);
    v11 = (NSString *)[v8 copy];
    bundleID = v10->_bundleID;
    v10->_bundleID = v11;
  }
  return v10;
}

- (BOOL)shouldQueryForAsYouType
{
  return 1;
}

- (NSString)logIdentifier
{
  return (NSString *)@"TopHits";
}

- (NSArray)categories
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = +[MUISearchSuggestionCategory topHitsCategory];
  v4 = +[MUISearchSuggestionCategory contactCategory];
  v9[1] = v4;
  v5 = +[MUISearchSuggestionCategory genericCategory];
  v9[2] = v5;
  v6 = +[NSArray arrayWithObjects:v9 count:3];
  [v2 addObjectsFromArray:v6];

  if (_os_feature_enabled_impl())
  {
    id v7 = +[MUISearchSuggestionCategory instantAnswersCategory];
    [v2 addObject:v7];
  }

  return (NSArray *)v2;
}

- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100212EE8((id *)[_SearchTopHitsSuggesterQuery alloc], v6, v7, self);
  v9 = v8;
  if (v8) {
    [v8[5] start];
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_messageRepository, 0);
}

@end