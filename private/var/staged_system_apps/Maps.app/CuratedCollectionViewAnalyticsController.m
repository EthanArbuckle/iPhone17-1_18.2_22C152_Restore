@interface CuratedCollectionViewAnalyticsController
+ (id)_eventValueForMediaType:(int64_t)a3;
- (BOOL)saved;
- (CuratedCollectionViewAnalyticsController)initWithCollectionIdentifier:(id)a3;
- (CuratedCollectionViewEvent)_createBaseEvent;
- (GEOPlaceCollection)curatedCollection;
- (int)target;
- (unint64_t)collectionMUID;
- (void)_captureCollectionViewEvent:(CuratedCollectionViewEvent *)a3;
- (void)logClose;
- (void)logDiscoverMoreFromPublisher;
- (void)logOpenAppClipWithURL:(id)a3;
- (void)logOpenWebsite;
- (void)logPullUpCuratedCollectionView;
- (void)logPunchOutToPublisherReviewWithIndex:(unint64_t)a3;
- (void)logPunchOutToURL:(id)a3;
- (void)logPunchOutUsingAppWithIdentifier:(id)a3;
- (void)logRemoveCuratedCollection;
- (void)logReportAProblem;
- (void)logRevealAppClipWithURL:(id)a3;
- (void)logRevealCuratedCollectionView;
- (void)logSaveCuratedCollection;
- (void)logSavePlaceItemToCuratedCollectionWithMUID:(unint64_t)a3;
- (void)logScrollDown;
- (void)logScrollUp;
- (void)logShareCuratedCollection;
- (void)logShowMediaAppMenu;
- (void)logTapCollectionItem:(id)a3 atIndex:(unint64_t)a4;
- (void)logTapMediaAppWithIdentifier:(id)a3;
- (void)logTapMediaIntegrationWithType:(int64_t)a3 verticalIndex:(int64_t)a4;
- (void)logTapShowLessDescription;
- (void)logTapShowMoreDescription;
- (void)logTryAgain;
- (void)setCollectionMUID:(unint64_t)a3;
- (void)setCuratedCollection:(id)a3;
- (void)setSaved:(BOOL)a3;
- (void)updateWithPlaceCollection:(id)a3;
@end

@implementation CuratedCollectionViewAnalyticsController

- (CuratedCollectionViewAnalyticsController)initWithCollectionIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)CuratedCollectionViewAnalyticsController;
    v5 = [(CuratedCollectionViewAnalyticsController *)&v8 init];
    if (v5)
    {
      v5->_collectionMUID = (unint64_t)[v4 muid];
      v5->_saved = 0;
      v5->_target = 259;
    }
    self = v5;
    v6 = self;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: collectionIdentifier != ((void *)0)", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

- (void)updateWithPlaceCollection:(id)a3
{
  v7 = (GEOPlaceCollection *)a3;
  if (self->_curatedCollection != v7)
  {
    objc_storeStrong((id *)&self->_curatedCollection, a3);
    v5 = [(GEOPlaceCollection *)self->_curatedCollection collectionIdentifier];
    self->_collectionMUID = (unint64_t)[v5 muid];

    v6 = +[CuratedCollectionSyncManager sharedManager];
    self->_saved = [v6 collectionIsSaved:v7];
  }
}

- (void)logShareCuratedCollection
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 2096;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logRevealCuratedCollectionView
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 21;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logScrollUp
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 7;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logScrollDown
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 8;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logClose
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 4;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logTryAgain
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 2171;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logTapShowMoreDescription
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 9040;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logTapShowLessDescription
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 9039;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logTapCollectionItem:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  memset(v15, 0, sizeof(v15));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v15[0]) = 2068;
  v7 = [v6 mapItem];
  objc_super v8 = [v7 _identifier];
  v9 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v8 muid]);
  uint64_t v10 = [v9 stringValue];
  v11 = (void *)*((void *)&v15[0] + 1);
  *((void *)&v15[0] + 1) = v10;

  uint64_t v12 = +[NSNumber numberWithUnsignedInteger:a4];
  v13 = (void *)v16;
  *(void *)&long long v16 = v12;

  sub_100D82DF4((uint64_t)v14, (uint64_t)v15);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v14];
  }
  else {
    sub_1003B5EAC((uint64_t)v14);
  }
  sub_1003B5EAC((uint64_t)v15);
}

- (void)logPullUpCuratedCollectionView
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 1;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logSaveCuratedCollection
{
  self->_saved = 1;
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 2091;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logRemoveCuratedCollection
{
  self->_saved = 0;
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 2088;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logPunchOutToPublisherReviewWithIndex:(unint64_t)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  memset(v8, 0, sizeof(v8));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v8[0]) = 9035;
  uint64_t v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = (void *)v9;
  *(void *)&long long v9 = v5;

  sub_100D82DF4((uint64_t)v7, (uint64_t)v8);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v7];
  }
  else {
    sub_1003B5EAC((uint64_t)v7);
  }
  sub_1003B5EAC((uint64_t)v8);
}

- (void)logReportAProblem
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 5013;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logTapMediaIntegrationWithType:(int64_t)a3 verticalIndex:(int64_t)a4
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  memset(v12, 0, sizeof(v12));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v12[0]) = 259;
  uint64_t v7 = [(id)objc_opt_class() _eventValueForMediaType:a3];
  objc_super v8 = (void *)*((void *)&v12[0] + 1);
  *((void *)&v12[0] + 1) = v7;

  uint64_t v9 = +[NSNumber numberWithInteger:a4];
  long long v10 = (void *)v13;
  *(void *)&long long v13 = v9;

  sub_100D82DF4((uint64_t)v11, (uint64_t)v12);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v11];
  }
  else {
    sub_1003B5EAC((uint64_t)v11);
  }
  sub_1003B5EAC((uint64_t)v12);
}

- (void)logShowMediaAppMenu
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 261;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logTapMediaAppWithIdentifier:(id)a3
{
  id v5 = a3;
  long long v8 = 0u;
  long long v9 = 0u;
  memset(v7, 0, sizeof(v7));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v7[0]) = 257;
  DWORD2(v8) = 48;
  objc_storeStrong((id *)v7 + 1, a3);
  sub_100D82DF4((uint64_t)v6, (uint64_t)v7);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v6];
  }
  else {
    sub_1003B5EAC((uint64_t)v6);
  }
  sub_1003B5EAC((uint64_t)v7);
}

- (void)logPunchOutToURL:(id)a3
{
  id v4 = a3;
  memset(v8, 0, sizeof(v8));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v8[0]) = 6050;
  uint64_t v5 = [v4 absoluteString];
  id v6 = (void *)*((void *)&v8[0] + 1);
  *((void *)&v8[0] + 1) = v5;

  sub_100D82DF4((uint64_t)v7, (uint64_t)v8);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v7];
  }
  else {
    sub_1003B5EAC((uint64_t)v7);
  }
  sub_1003B5EAC((uint64_t)v8);
}

- (void)logPunchOutUsingAppWithIdentifier:(id)a3
{
  id v5 = a3;
  memset(v7, 0, sizeof(v7));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v7[0]) = 260;
  objc_storeStrong((id *)v7 + 1, a3);
  sub_100D82DF4((uint64_t)v6, (uint64_t)v7);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v6];
  }
  else {
    sub_1003B5EAC((uint64_t)v6);
  }
  sub_1003B5EAC((uint64_t)v7);
}

- (void)logSavePlaceItemToCuratedCollectionWithMUID:(unint64_t)a3
{
  memset(v9, 0, sizeof(v9));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v9[0]) = 2073;
  id v5 = +[NSNumber numberWithUnsignedLongLong:a3];
  uint64_t v6 = [v5 stringValue];
  uint64_t v7 = (void *)*((void *)&v9[0] + 1);
  *((void *)&v9[0] + 1) = v6;

  sub_100D82DF4((uint64_t)v8, (uint64_t)v9);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v8];
  }
  else {
    sub_1003B5EAC((uint64_t)v8);
  }
  sub_1003B5EAC((uint64_t)v9);
}

- (void)logDiscoverMoreFromPublisher
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 2102;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logOpenWebsite
{
  memset(v4, 0, sizeof(v4));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v4[0]) = 2170;
  sub_100D82DF4((uint64_t)v3, (uint64_t)v4);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v3];
  }
  else {
    sub_1003B5EAC((uint64_t)v3);
  }
  sub_1003B5EAC((uint64_t)v4);
}

- (void)logOpenAppClipWithURL:(id)a3
{
  id v4 = a3;
  memset(v8, 0, sizeof(v8));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v8[0]) = 6090;
  uint64_t v5 = [v4 absoluteString];
  uint64_t v6 = (void *)*((void *)&v8[0] + 1);
  *((void *)&v8[0] + 1) = v5;

  sub_100D82DF4((uint64_t)v7, (uint64_t)v8);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v7];
  }
  else {
    sub_1003B5EAC((uint64_t)v7);
  }
  [(CuratedCollectionViewAnalyticsController *)self logRevealAppClipWithURL:v4];
  sub_1003B5EAC((uint64_t)v8);
}

- (void)logRevealAppClipWithURL:(id)a3
{
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  memset(v8, 0, sizeof(v8));
  [(CuratedCollectionViewAnalyticsController *)self _createBaseEvent];
  LODWORD(v8[0]) = 6105;
  DWORD2(v9) = 670;
  uint64_t v5 = [v4 absoluteString];
  uint64_t v6 = (void *)*((void *)&v8[0] + 1);
  *((void *)&v8[0] + 1) = v5;

  sub_100D82DF4((uint64_t)v7, (uint64_t)v8);
  if (self) {
    [(CuratedCollectionViewAnalyticsController *)self _captureCollectionViewEvent:v7];
  }
  else {
    sub_1003B5EAC((uint64_t)v7);
  }
  sub_1003B5EAC((uint64_t)v8);
}

- (CuratedCollectionViewEvent)_createBaseEvent
{
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var3 = 0u;
  *(_OWORD *)&retstr->var1 = 0u;
  retstr->var9 = 0;
  retstr->var10 = 0;
  retstr->var2 = +[NSNumber numberWithUnsignedLongLong:[(CuratedCollectionViewAnalyticsController *)self collectionMUID]];
  retstr->var8 = 14;
  retstr->var7 = [(CuratedCollectionViewAnalyticsController *)self target];
  uint64_t v5 = [(GEOPlaceCollection *)self->_curatedCollection publisher];
  uint64_t v6 = [v5 identifier];
  +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v6 muid]);
  retstr->var6 = (id)objc_claimAutoreleasedReturnValue();

  retstr->var3 = +[NSNumber numberWithBool:self->_saved];
  id v8 = [(GEOPlaceCollection *)self->_curatedCollection collectionIdentifier];
  +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v8 resultProviderID]);
  retstr->var5 = (id)objc_claimAutoreleasedReturnValue();

  return result;
}

- (void)_captureCollectionViewEvent:(CuratedCollectionViewEvent *)a3
{
  uint64_t var0 = a3->var0;
  if (!var0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Assertion failed: event.action != GEOUIAction_UI_ACTION_UNKNOWN";
LABEL_9:
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v12, buf, 2u);
    goto LABEL_4;
  }
  uint64_t var7 = a3->var7;
  if (!var7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      goto LABEL_4;
    }
    *(_WORD *)buf = 0;
    uint64_t v12 = "Assertion failed: event.target != GEOUITarget_UI_TARGET_UNKNOWN";
    goto LABEL_9;
  }
  id var1 = a3->var1;
  id var6 = a3->var6;
  uint64_t v7 = +[NSArray arrayWithObjects:&var6 count:1];
  id var2 = a3->var2;
  id var3 = a3->var3;
  id var4 = a3->var4;
  long long v11 = +[NSNumber numberWithInt:a3->var8];
  +[GEOAPPortal captureCuratedCollectionUserAction:var0 target:var7 value:var1 publisherId:v7 following:0 collectionId:var2 collectionCategory:0 collectionCurrentlySaved:var3 verticalIndex:var4 horizontalIndex:0 placeCardType:v11 possibleActions:0 impossibleActions:0 providerId:a3->var5 repeatableSectionIndex:0 modules:0];

LABEL_4:
  sub_1003B5EAC((uint64_t)a3);
}

+ (id)_eventValueForMediaType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x14) {
    return 0;
  }
  else {
    return off_101323928[a3];
  }
}

- (unint64_t)collectionMUID
{
  return self->_collectionMUID;
}

- (void)setCollectionMUID:(unint64_t)a3
{
  self->_collectionMUID = a3;
}

- (int)target
{
  return self->_target;
}

- (GEOPlaceCollection)curatedCollection
{
  return self->_curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
}

- (BOOL)saved
{
  return self->_saved;
}

- (void)setSaved:(BOOL)a3
{
  self->_saved = a3;
}

- (void).cxx_destruct
{
}

@end