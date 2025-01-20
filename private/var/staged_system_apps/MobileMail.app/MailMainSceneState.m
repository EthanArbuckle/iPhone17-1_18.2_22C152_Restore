@interface MailMainSceneState
+ (id)log;
- (ConversationViewRestorationState)conversationViewState;
- (EFFuture)conversationViewStateFuture;
- (EFFuture)messageListStateFuture;
- (MailMainSceneState)initWithBuilder:(id)a3;
- (MailMainSceneState)initWithDictionary:(id)a3 daemonInterface:(id)a4;
- (MailMainSceneState)initWithDictionary:(id)a3 daemonInterface:(id)a4 componentFactory:(id)a5;
- (MessageListRestorationState)messageListState;
- (NSDictionary)favoritesManagerState;
- (NSString)ef_publicDescription;
- (id)_conversationStateDictionaryFromDictionary:(id)a3 version:(int64_t)a4;
- (id)_favoritesManagerStateFromDictionary:(id)a3 version:(int64_t)a4;
- (id)_messageListStateDictionaryFromDictionary:(id)a3 version:(int64_t)a4;
- (id)beginLoadingConversationStateWithDictionary:(id)a3 daemonInterface:(id)a4;
- (id)beginLoadingMessageListStateWithDictionary:(id)a3 daemonInterface:(id)a4;
- (id)dictionaryRepresentation;
- (int64_t)_detailNavigationStateFromDictionary:(id)a3 version:(int64_t)a4;
- (int64_t)_primaryNavigationStateFromDictionary:(id)a3 version:(int64_t)a4;
- (int64_t)_supplementaryNavigationStateFromDictionary:(id)a3 version:(int64_t)a4;
- (int64_t)_versionFromDictionary:(id)a3;
- (int64_t)detailNavState;
- (int64_t)primaryNavState;
- (int64_t)supplementaryNavState;
- (void)_loadFromDictionary:(id)a3 daemonInterface:(id)a4 componentFactory:(id)a5;
- (void)_setDefaultValues;
- (void)setConversationViewState:(id)a3;
- (void)setConversationViewStateFuture:(id)a3;
- (void)setDetailNavState:(int64_t)a3;
- (void)setFavoritesManagerState:(id)a3;
- (void)setMessageListState:(id)a3;
- (void)setMessageListStateFuture:(id)a3;
- (void)setPrimaryNavState:(int64_t)a3;
- (void)setSupplementaryNavState:(int64_t)a3;
@end

@implementation MailMainSceneState

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100116900;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_1006996D0 != -1) {
    dispatch_once(&qword_1006996D0, block);
  }
  v2 = (void *)qword_1006996C8;

  return v2;
}

- (MailMainSceneState)initWithDictionary:(id)a3 daemonInterface:(id)a4
{
  return [(MailMainSceneState *)self initWithDictionary:a3 daemonInterface:a4 componentFactory:self];
}

- (MailMainSceneState)initWithDictionary:(id)a3 daemonInterface:(id)a4 componentFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MailMainSceneState;
  v11 = [(MailMainSceneState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(MailMainSceneState *)v11 _setDefaultValues];
    [(MailMainSceneState *)v12 _loadFromDictionary:v8 daemonInterface:v9 componentFactory:v10];
  }

  return v12;
}

- (MailMainSceneState)initWithBuilder:(id)a3
{
  v4 = (void (**)(id, MailMainSceneState *))a3;
  v8.receiver = self;
  v8.super_class = (Class)MailMainSceneState;
  v5 = [(MailMainSceneState *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(MailMainSceneState *)v5 _setDefaultValues];
    v4[2](v4, v6);
  }

  return v6;
}

- (void)_setDefaultValues
{
  [(MailMainSceneState *)self setPrimaryNavState:1];
  [(MailMainSceneState *)self setSupplementaryNavState:0];
  [(MailMainSceneState *)self setDetailNavState:0];

  [(MailMainSceneState *)self setMessageListState:0];
}

- (id)dictionaryRepresentation
{
  v3 = [(MailMainSceneState *)self conversationViewState];
  v4 = [v3 dictionaryRepresentation];

  v5 = [(MailMainSceneState *)self messageListState];
  v6 = [v5 dictionaryRepresentation];

  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [v7 setObject:&off_10062A860 forKeyedSubscript:@"StateDictionaryVersion"];
  objc_super v8 = [(MailMainSceneState *)self favoritesManagerState];
  [v7 setObject:v8 forKeyedSubscript:@"FavoritesManagerState"];

  unint64_t v9 = [(MailMainSceneState *)self primaryNavState];
  CFStringRef v10 = @"MessageList";
  if (v9 <= 2) {
    CFStringRef v10 = off_100608910[v9];
  }
  [v7 setObject:v10 forKeyedSubscript:@"PrimaryNavigationState"];
  if ((id)[(MailMainSceneState *)self supplementaryNavState] == (id)1) {
    CFStringRef v11 = @"MessageList";
  }
  else {
    CFStringRef v11 = @"MessageListCollapsedToPrimary";
  }
  [v7 setObject:v11 forKeyedSubscript:@"SupplementaryNavigationState"];
  int64_t v12 = [(MailMainSceneState *)self detailNavState];
  CFStringRef v13 = @"NoSelection";
  if (v12 == 1) {
    CFStringRef v13 = @"ConversationViewPrimary";
  }
  if (v12 == 2) {
    CFStringRef v14 = @"ConversationViewSecondary";
  }
  else {
    CFStringRef v14 = v13;
  }
  [v7 setObject:v14 forKeyedSubscript:@"DetailNavigationState"];
  [v7 setObject:v4 forKeyedSubscript:@"ConversationViewState"];
  [v7 setObject:v6 forKeyedSubscript:@"MessageListState"];
  id v15 = [v7 copy];

  return v15;
}

- (void)_loadFromDictionary:(id)a3 daemonInterface:(id)a4 componentFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 || ![v8 count])
  {
    int64_t v12 = +[MailMainSceneState log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10045AB20(v12);
    }
    goto LABEL_8;
  }
  uint64_t v11 = [(MailMainSceneState *)self _versionFromDictionary:v8];
  if (v11 >= 4)
  {
    int64_t v12 = +[MailMainSceneState log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10045AB64(v11, v12);
    }
LABEL_8:

    goto LABEL_9;
  }
  CFStringRef v13 = [(MailMainSceneState *)self _favoritesManagerStateFromDictionary:v8 version:v11];
  [(MailMainSceneState *)self setFavoritesManagerState:v13];

  [(MailMainSceneState *)self setPrimaryNavState:[(MailMainSceneState *)self _primaryNavigationStateFromDictionary:v8 version:v11]];
  [(MailMainSceneState *)self setSupplementaryNavState:[(MailMainSceneState *)self _supplementaryNavigationStateFromDictionary:v8 version:v11]];
  [(MailMainSceneState *)self setDetailNavState:[(MailMainSceneState *)self _detailNavigationStateFromDictionary:v8 version:v11]];
  CFStringRef v14 = [(MailMainSceneState *)self _conversationStateDictionaryFromDictionary:v8 version:v11];
  if ([v14 count])
  {
    id v15 = [v10 beginLoadingConversationStateWithDictionary:v14 daemonInterface:v9];
    [(MailMainSceneState *)self setConversationViewStateFuture:v15];
  }
  v16 = [(MailMainSceneState *)self _messageListStateDictionaryFromDictionary:v8 version:v11];
  if ([v16 count])
  {
    v17 = [v10 beginLoadingMessageListStateWithDictionary:v16 daemonInterface:v9];
    [(MailMainSceneState *)self setMessageListStateFuture:v17];
  }
LABEL_9:
}

- (int64_t)_versionFromDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 ef_objectOfClass:objc_opt_class() forKey:@"StateDictionaryVersion"];
  v5 = v4;
  if (v4)
  {
    int64_t v6 = (int64_t)[v4 integerValue];
    id v7 = +[MailMainSceneState log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v12 = 134217984;
      int64_t v13 = v6;
      id v8 = "Found dictionary version: %ld";
      id v9 = v7;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    id v7 = +[MailMainSceneState log];
    int64_t v6 = 1;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      id v8 = "No version was found in dictionary. Assuming v1.";
      int64_t v6 = 1;
      id v9 = v7;
      uint32_t v10 = 2;
      goto LABEL_6;
    }
  }

  return v6;
}

- (id)_favoritesManagerStateFromDictionary:(id)a3 version:(int64_t)a4
{
  id v4 = a3;
  v5 = [v4 ef_objectOfClass:objc_opt_class() forKey:@"FavoritesManagerState"];

  return v5;
}

- (int64_t)_primaryNavigationStateFromDictionary:(id)a3 version:(int64_t)a4
{
  id v4 = a3;
  v5 = [v4 ef_objectOfClass:objc_opt_class() forKey:@"PrimaryNavigationState"];
  int64_t v6 = sub_10011722C(v5);

  return v6;
}

- (int64_t)_supplementaryNavigationStateFromDictionary:(id)a3 version:(int64_t)a4
{
  id v5 = a3;
  if (a4 >= 3)
  {
    id v7 = [v5 ef_objectOfClass:objc_opt_class() forKey:@"SupplementaryNavigationState"];
    int64_t v6 = sub_100117350(v7);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (int64_t)_detailNavigationStateFromDictionary:(id)a3 version:(int64_t)a4
{
  id v4 = a3;
  id v5 = [v4 ef_objectOfClass:objc_opt_class() forKey:@"DetailNavigationState"];
  int64_t v6 = sub_10011743C(v5);

  return v6;
}

- (id)_conversationStateDictionaryFromDictionary:(id)a3 version:(int64_t)a4
{
  id v4 = [a3 objectForKeyedSubscript:@"ConversationViewState" a4];

  return v4;
}

- (id)_messageListStateDictionaryFromDictionary:(id)a3 version:(int64_t)a4
{
  id v4 = [a3 objectForKeyedSubscript:@"MessageListState" a4];

  return v4;
}

- (ConversationViewRestorationState)conversationViewState
{
  v2 = [(MailMainSceneState *)self conversationViewStateFuture];
  id v3 = [v2 resultIfAvailable];

  return (ConversationViewRestorationState *)v3;
}

- (void)setConversationViewState:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = +[EFFuture futureWithResult:v4];
    [(MailMainSceneState *)self setConversationViewStateFuture:v5];
  }
  else
  {
    id v5 = +[NSError mf_invalidRestorationDataErrorWithUnderlyingError:0];
    int64_t v6 = +[EFFuture futureWithError:v5];
    [(MailMainSceneState *)self setConversationViewStateFuture:v6];
  }
}

- (MessageListRestorationState)messageListState
{
  v2 = [(MailMainSceneState *)self messageListStateFuture];
  id v3 = [v2 resultIfAvailable];

  return (MessageListRestorationState *)v3;
}

- (void)setMessageListState:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = +[EFFuture futureWithResult:v4];
    [(MailMainSceneState *)self setMessageListStateFuture:v5];
  }
  else
  {
    id v5 = +[NSError mf_invalidRestorationDataErrorWithUnderlyingError:0];
    int64_t v6 = +[EFFuture futureWithError:v5];
    [(MailMainSceneState *)self setMessageListStateFuture:v6];
  }
}

- (id)beginLoadingConversationStateWithDictionary:(id)a3 daemonInterface:(id)a4
{
  id v4 = +[ConversationViewRestorationState loadFromDictionary:a3 daemonInterface:a4];

  return v4;
}

- (id)beginLoadingMessageListStateWithDictionary:(id)a3 daemonInterface:(id)a4
{
  id v4 = +[MessageListRestorationState loadFromDictionary:a3 daemonInterface:a4];

  return v4;
}

- (NSString)ef_publicDescription
{
  unint64_t v3 = [(MailMainSceneState *)self primaryNavState];
  CFStringRef v4 = @"MessageList";
  if (v3 <= 2) {
    CFStringRef v4 = off_100608910[v3];
  }
  int64_t v5 = [(MailMainSceneState *)self supplementaryNavState];
  int64_t v6 = @"MessageListCollapsedToPrimary";
  if (v5 == 1) {
    int64_t v6 = @"MessageList";
  }
  v21 = v6;
  int64_t v7 = [(MailMainSceneState *)self detailNavState];
  id v8 = @"NoSelection";
  if (v7 == 1) {
    id v8 = @"ConversationViewPrimary";
  }
  if (v7 == 2) {
    id v8 = @"ConversationViewSecondary";
  }
  v20 = v8;
  uint64_t v9 = objc_opt_class();
  v19 = [(MailMainSceneState *)self favoritesManagerState];
  if (v19) {
    uint32_t v10 = @"YES";
  }
  else {
    uint32_t v10 = @"NO";
  }
  uint64_t v11 = v10;
  int v12 = [(MailMainSceneState *)self conversationViewState];
  if (v12) {
    int64_t v13 = @"YES";
  }
  else {
    int64_t v13 = @"NO";
  }
  CFStringRef v14 = v13;
  id v15 = [(MailMainSceneState *)self messageListState];
  if (v15) {
    CFStringRef v16 = @"YES";
  }
  else {
    CFStringRef v16 = @"NO";
  }
  v17 = +[NSString stringWithFormat:@"<%@: %p> primaryNav=%@ supplementaryNav=%@ detailNav=%@ hasFavoritesManagerState=%@ hasConversationViewState=%@ hasMessageListState=%@", v9, self, v4, v21, v20, v11, v14, v16];

  return (NSString *)v17;
}

- (NSDictionary)favoritesManagerState
{
  return self->_favoritesManagerState;
}

- (void)setFavoritesManagerState:(id)a3
{
}

- (int64_t)primaryNavState
{
  return self->_primaryNavState;
}

- (void)setPrimaryNavState:(int64_t)a3
{
  self->_primaryNavState = a3;
}

- (int64_t)supplementaryNavState
{
  return self->_supplementaryNavState;
}

- (void)setSupplementaryNavState:(int64_t)a3
{
  self->_supplementaryNavState = a3;
}

- (int64_t)detailNavState
{
  return self->_detailNavState;
}

- (void)setDetailNavState:(int64_t)a3
{
  self->_detailNavState = a3;
}

- (EFFuture)conversationViewStateFuture
{
  return self->_conversationViewStateFuture;
}

- (void)setConversationViewStateFuture:(id)a3
{
}

- (EFFuture)messageListStateFuture
{
  return self->_messageListStateFuture;
}

- (void)setMessageListStateFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageListStateFuture, 0);
  objc_storeStrong((id *)&self->_conversationViewStateFuture, 0);

  objc_storeStrong((id *)&self->_favoritesManagerState, 0);
}

@end