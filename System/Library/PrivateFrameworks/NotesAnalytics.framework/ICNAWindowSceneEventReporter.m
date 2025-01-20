@interface ICNAWindowSceneEventReporter
+ (double)areaOfWindowScene:(id)a3;
- (ICNAWindowSceneEventReporter)initWithSubTrackerName:(id)a3 windowScene:(id)a4;
- (NSString)saltedInstrumentationID;
- (NSString)windowSceneID;
- (double)previousArea;
- (void)setPreviousArea:(double)a3;
- (void)startWindowSceneEventDurationTracking;
- (void)submitWindowSceneEvent;
- (void)submitWindowSceneResizeEventIfNecessaryWithWindowScene:(id)a3 forceSubmit:(BOOL)a4;
@end

@implementation ICNAWindowSceneEventReporter

- (ICNAWindowSceneEventReporter)initWithSubTrackerName:(id)a3 windowScene:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ICNAWindowSceneEventReporter;
  v7 = [(ICNAEventReporter *)&v13 initWithSubTrackerName:a3 windowScene:v6];
  if (v7)
  {
    [(id)objc_opt_class() areaOfWindowScene:v6];
    v7->_previousArea = v8;
    v9 = [v6 session];
    uint64_t v10 = [v9 persistentIdentifier];
    windowSceneID = v7->_windowSceneID;
    v7->_windowSceneID = (NSString *)v10;
  }
  return v7;
}

+ (double)areaOfWindowScene:(id)a3
{
  v3 = [a3 coordinateSpace];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  return v5 * v7;
}

- (NSString)saltedInstrumentationID
{
  v3 = +[ICNAController sharedController];
  double v4 = [v3 privateSessionID];

  double v5 = NSString;
  double v6 = [(ICNAWindowSceneEventReporter *)self windowSceneID];
  double v7 = [v5 stringWithFormat:@"%@%@", v6, v4];

  double v8 = +[ICNAIdentityManager sharedManager];
  v9 = [v8 saltedID:v7 forClass:objc_opt_class()];

  return (NSString *)v9;
}

- (void)startWindowSceneEventDurationTracking
{
  v9[1] = *MEMORY[0x1E4F143B8];
  [(ICNAEventReporter *)self startTimedEventOfType:objc_opt_class()];
  v3 = [ICASWindowSceneData alloc];
  double v4 = [(ICNAWindowSceneEventReporter *)self saltedInstrumentationID];
  double v5 = [(ICASWindowSceneData *)v3 initWithWindowSceneID:v4];

  double v6 = +[ICNAController sharedController];
  v9[0] = v5;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  double v8 = [(ICNAEventReporter *)self subTracker];
  [v6 pushDataObjects:v7 unique:1 onlyOnce:0 subTracker:v8];
}

- (void)submitWindowSceneEvent
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [ICASWindowSceneData alloc];
  double v4 = [(ICNAWindowSceneEventReporter *)self saltedInstrumentationID];
  double v5 = [(ICASWindowSceneData *)v3 initWithWindowSceneID:v4];

  double v6 = +[ICNAController sharedController];
  v9[0] = v5;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  double v8 = [(ICNAEventReporter *)self subTracker];
  [v6 pushDataObjects:v7 unique:1 onlyOnce:1 subTracker:v8];

  [(ICNAEventReporter *)self submitTimedEventOfTypeIfPossible:objc_opt_class()];
}

- (void)submitWindowSceneResizeEventIfNecessaryWithWindowScene:(id)a3 forceSubmit:(BOOL)a4
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(id)objc_opt_class() areaOfWindowScene:v6];
  double v8 = v7;
  if (a4 || ([(ICNAWindowSceneEventReporter *)self previousArea], vabdd_f64(v9, v8) > 0.00000011920929))
  {
    uint64_t v10 = [v6 screen];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    v15 = [ICASWindowSceneData alloc];
    v16 = [(ICNAWindowSceneEventReporter *)self saltedInstrumentationID];
    v17 = [(ICASWindowSceneData *)v15 initWithWindowSceneID:v16];

    v18 = [ICASWindowSceneResizeData alloc];
    v19 = objc_msgSend(NSNumber, "numberWithBool:", vabdd_f64(v12 * v14, v8) > 0.00000011920929);
    v20 = [(ICASWindowSceneResizeData *)v18 initWithUsesMultiWindow:v19];

    v21 = +[ICNAController sharedController];
    uint64_t v22 = objc_opt_class();
    v25[0] = v17;
    v25[1] = v20;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v24 = [(ICNAEventReporter *)self subTracker];
    [v21 submitEventOfType:v22 pushThenPopDataObjects:v23 subTracker:v24];

    [(ICNAWindowSceneEventReporter *)self setPreviousArea:v8];
  }
}

- (double)previousArea
{
  return self->_previousArea;
}

- (void)setPreviousArea:(double)a3
{
  self->_previousArea = a3;
}

- (NSString)windowSceneID
{
  return self->_windowSceneID;
}

- (void).cxx_destruct
{
}

@end