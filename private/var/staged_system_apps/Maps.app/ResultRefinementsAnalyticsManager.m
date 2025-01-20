@interface ResultRefinementsAnalyticsManager
- (BOOL)isFromWaypointEditor;
- (ResultRefinementsAnalyticsManager)init;
- (ResultRefinementsAnalyticsManager)initWithRefinementsFromWaypointEditor:(BOOL)a3;
- (void)logRefinementsEvent:(unint64_t)a3 fromSource:(unint64_t)a4;
- (void)resultRefinementTappedWithKey:(id)a3 source:(unint64_t)a4 refinementType:(unint64_t)a5 isSelected:(BOOL)a6;
- (void)setIsFromWaypointEditor:(BOOL)a3;
@end

@implementation ResultRefinementsAnalyticsManager

- (ResultRefinementsAnalyticsManager)init
{
  return [(ResultRefinementsAnalyticsManager *)self initWithRefinementsFromWaypointEditor:0];
}

- (ResultRefinementsAnalyticsManager)initWithRefinementsFromWaypointEditor:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ResultRefinementsAnalyticsManager;
  result = [(ResultRefinementsAnalyticsManager *)&v5 init];
  if (result) {
    result->_isFromWaypointEditor = a3;
  }
  return result;
}

- (void)logRefinementsEvent:(unint64_t)a3 fromSource:(unint64_t)a4
{
  if (a4 == 2)
  {
    uint64_t v6 = 22;
  }
  else if (a4 == 1)
  {
    uint64_t v6 = 23;
  }
  else if (a4)
  {
    uint64_t v6 = 0;
  }
  else if ([(ResultRefinementsAnalyticsManager *)self isFromWaypointEditor])
  {
    uint64_t v6 = 58;
  }
  else
  {
    uint64_t v6 = 21;
  }
  switch(a3)
  {
    case 0uLL:
      if (a4 == 1) {
        uint64_t v7 = 186;
      }
      else {
        uint64_t v7 = 205;
      }
      break;
    case 1uLL:
      if (a4 == 1) {
        uint64_t v7 = 168;
      }
      else {
        uint64_t v7 = 167;
      }
      break;
    case 2uLL:
      uint64_t v7 = 155;
      break;
    case 3uLL:
      uint64_t v7 = 157;
      break;
    default:
      uint64_t v7 = 0;
      break;
  }
  id v8 = +[MKMapService sharedService];
  [v8 captureUserAction:v7 onTarget:v6 eventValue:0];
}

- (void)resultRefinementTappedWithKey:(id)a3 source:(unint64_t)a4 refinementType:(unint64_t)a5 isSelected:(BOOL)a6
{
  BOOL v6 = a6;
  id v16 = a3;
  if (a4 == 2)
  {
    unsigned int v11 = 176;
    int v12 = 197;
    uint64_t v10 = 22;
  }
  else if (a4 == 1)
  {
    unsigned int v11 = 176;
    int v12 = 197;
    uint64_t v10 = 23;
  }
  else if (a4)
  {
    uint64_t v10 = 0;
    int v12 = 0;
    unsigned int v11 = 0;
  }
  else
  {
    if ([(ResultRefinementsAnalyticsManager *)self isFromWaypointEditor]) {
      uint64_t v10 = 58;
    }
    else {
      uint64_t v10 = 21;
    }
    unsigned int v11 = 190;
    int v12 = 200;
  }
  if (v6) {
    unsigned int v13 = 158;
  }
  else {
    unsigned int v13 = 202;
  }
  if (v6) {
    unsigned int v11 = v12;
  }
  if (a5) {
    unsigned int v11 = 0;
  }
  if (a5 == 1) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = v11;
  }
  v15 = +[MKMapService sharedService];
  [v15 captureUserAction:v14 onTarget:v10 eventValue:v16];
}

- (BOOL)isFromWaypointEditor
{
  return self->_isFromWaypointEditor;
}

- (void)setIsFromWaypointEditor:(BOOL)a3
{
  self->_isFromWaypointEditor = a3;
}

@end