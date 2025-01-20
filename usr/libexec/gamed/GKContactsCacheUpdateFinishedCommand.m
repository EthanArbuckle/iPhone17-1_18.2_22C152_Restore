@interface GKContactsCacheUpdateFinishedCommand
- (GKContactsCacheUpdateFinishedCommand)initWithChangeHistoryToken:(id)a3;
- (NSData)changeHistoryToken;
- (void)executeWithContext:(id)a3;
- (void)setChangeHistoryToken:(id)a3;
@end

@implementation GKContactsCacheUpdateFinishedCommand

- (GKContactsCacheUpdateFinishedCommand)initWithChangeHistoryToken:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKContactsCacheUpdateFinishedCommand;
  v6 = [(GKContactsCacheUpdateFinishedCommand *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_changeHistoryToken, a3);
  }

  return v7;
}

- (void)executeWithContext:(id)a3
{
  id v6 = +[GKCDContactInfoList _gkPrimaryListWithContext:a3];
  v4 = [(GKContactsCacheUpdateFinishedCommand *)self changeHistoryToken];
  [v6 setChangeHistoryToken:v4];

  id v5 = +[NSNumber numberWithShort:GKCDContactInfoListCurrentVersion];
  [v6 setVersion:v5];
}

- (NSData)changeHistoryToken
{
  return self->_changeHistoryToken;
}

- (void)setChangeHistoryToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end