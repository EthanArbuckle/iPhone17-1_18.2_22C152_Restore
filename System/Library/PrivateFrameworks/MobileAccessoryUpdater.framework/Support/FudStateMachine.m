@interface FudStateMachine
+ (BOOL)supportsSecureCoding;
+ (id)stepName:(int)a3;
+ (void)initialize;
- (AUDAccessory)accessory;
- (BOOL)conformsToAllowedValuesForKey:(id)a3 value:(id)a4;
- (BOOL)isActive;
- (BOOL)performStep:(int)a3 withOptions:(id)a4;
- (BOOL)pluginForcedSilentUpdate;
- (BOOL)showPersonalizationRequiredDialogAndGetResponse;
- (FudStateMachine)initWithCoder:(id)a3;
- (FudStateMachine)initWithPluginName:(id)a3 filterName:(id)a4 delegate:(id)a5 options:(id)a6;
- (FudStateMachineDelegate)delegate;
- (NSDictionary)pluginOptions;
- (NSString)stateMachineFilterName;
- (NSString)stateMachinePluginName;
- (NSString)stateMachineRevision;
- (id)createBeginningOfUpdateDictForEvent:(id)a3 info:(id)a4;
- (id)createEndOfUpdateDictForEvent:(id)a3 info:(id)a4;
- (id)exception;
- (id)getMatchingFilter;
- (id)loadPlugin;
- (int)nextStep:(id *)a3;
- (int)performNextStepWithOptions:(id)a3;
- (void)accessoryDisconnected:(id)a3;
- (void)clearException;
- (void)dealloc;
- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 error:(id)a6;
- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7;
- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didRunStateWithInfo:(id)a3;
- (void)doneWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)issueNotification:(id)a3;
- (void)log:(int)a3 format:(id)a4;
- (void)logv:(int)a3 format:(id)a4 arguments:(char *)a5;
- (void)personalizationDone:(id)a3 response:(id)a4 error:(id)a5;
- (void)personalizationRequest:(id)a3;
- (void)progress:(double)a3;
- (void)reportAnalytics:(id)a3 info:(id)a4;
- (void)runState;
- (void)runStateDoApply;
- (void)runStateDoBootstrap;
- (void)runStateDoCheck;
- (void)runStateDoDownload;
- (void)runStateDoFinish;
- (void)runStateDoPrepare;
- (void)runStateEnd;
- (void)runStateQueryNeedsBootstrap;
- (void)runStateQueryNeedsRemoteCheck;
- (void)runStateStart;
- (void)setAccessory:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setException:(id)a3;
- (void)setPluginOptions:(id)a3;
@end

@implementation FudStateMachine

+ (void)initialize
{
  qword_100095DB0 = (uint64_t)"runStateStart";
  qword_100095DD0 = (uint64_t)"runStateEnd";
  qword_100095DF0 = (uint64_t)"runStateQueryNeedsBootstrap";
  qword_100095E10 = (uint64_t)"runStateDoBootstrap";
  qword_100095E30 = (uint64_t)"runStateQueryNeedsRemoteCheck";
  qword_100095E50 = (uint64_t)"runStateDoCheck";
  qword_100095E70 = (uint64_t)"runStateDoCheck";
  qword_100095E90 = (uint64_t)"runStateDoDownload";
  qword_100095EB0 = (uint64_t)"runStateDoPrepare";
  qword_100095ED0 = (uint64_t)"runStateDoApply";
  qword_100095EF0 = (uint64_t)"runStateDoFinish";
  qword_100095F10 = (uint64_t)"runStateDoFinish";
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stepName:(int)a3
{
  if (a3 > 0xA) {
    return @"Invalid step: out of range";
  }
  else {
    return +[NSString stringWithCString:(&off_10007D790)[a3] encoding:4];
  }
}

- (FudStateMachine)initWithPluginName:(id)a3 filterName:(id)a4 delegate:(id)a5 options:(id)a6
{
  FudLog();
  v20.receiver = self;
  v20.super_class = (Class)FudStateMachine;
  v11 = -[FudStateMachine init](&v20, "init", "-[FudStateMachine initWithPluginName:filterName:delegate:options:]");
  v12 = (FudStateMachine *)v11;
  if (a3 && a4)
  {
    if (v11)
    {
      v11[161] = 0;
      *(void *)(v11 + 164) = 0xFFFFFFFF00000002;
      *((void *)v11 + 1) = a3;
      v12->stateMachineFilterName = (NSString *)a4;
      v12->stateMachineRevision = 0;
      v12->plugin = 0;
      v12->pluginInfo = 0;
      v13 = (NSDictionary *)a6;
      v12->pluginOptions = 0;
      v12->defaultOptions = v13;
      v12->remoteCheck = 0;
      v12->pluginForcedSilentUpdate = 0;
      v12->exception = 0;
      v12->pluginProgressWeights = 0;
      v12->hasSleepAssertion = 0;
      if (qword_100096360 != -1) {
        dispatch_once(&qword_100096360, &stru_10007D7E8);
      }
      dispatch_semaphore_wait((dispatch_semaphore_t)qword_100096370, 0xFFFFFFFFFFFFFFFFLL);
      v14 = (OS_dispatch_queue *)[(id)qword_100096368 objectForKey:v12->stateMachinePluginName];
      v12->workQueue = v14;
      if (!v14)
      {
        v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_BACKGROUND, 0);
        dispatch_queue_t v17 = dispatch_queue_create("com.apple.fud.statemachine", v16);
        v12->workQueue = (OS_dispatch_queue *)v17;
        [(id)qword_100096368 setObject:v17 forKey:v12->stateMachinePluginName];
      }
      dispatch_semaphore_signal((dispatch_semaphore_t)qword_100096370);
      v12->validCallback = 0;
      v12->personalizer = 0;
      v12->accessory = 0;
      v12->needsDeviceList = 0;
      v12->accessoryModelNumber = +[NSString stringWithString:v12->stateMachineFilterName];
      v12->existingFWVersionOnAcc = +[NSString stringWithString:@"Unknown"];
      v12->newFWVersionAvailable = +[NSString stringWithString:@"Unknown"];
      v12->transportType = +[NSString stringWithString:@"Unknown"];
      v12->resumePercent = +[NSNumber numberWithUnsignedInteger:0];
      v12->resumeCount = +[NSNumber numberWithUnsignedInteger:0];
      [(FudStateMachine *)v12 setDelegate:a5];
    }
  }
  else
  {
    FudLog();
    v18 = v12;
    return 0;
  }
  return v12;
}

- (void)dealloc
{
  FudLog();
  stateMachinePluginName = self->stateMachinePluginName;
  stateMachineFilterName = self->stateMachineFilterName;
  FudLog();
  [(FudStateMachine *)self clearException];
  plugin = self->plugin;
  if (plugin)
  {
    [(FudPlugin *)plugin setDelegate:0];
  }
  accessory = self->accessory;
  if (accessory) {

  }
  personalizer = self->personalizer;
  if (personalizer) {

  }
  v6 = self->stateMachinePluginName;
  if (v6) {

  }
  v7 = self->stateMachineFilterName;
  if (v7) {

  }
  stateMachineRevision = self->stateMachineRevision;
  if (stateMachineRevision) {

  }
  pluginProgressWeights = self->pluginProgressWeights;
  if (pluginProgressWeights) {

  }
  pluginInfo = self->pluginInfo;
  if (pluginInfo) {

  }
  pluginOptions = self->pluginOptions;
  if (pluginOptions) {

  }
  defaultOptions = self->defaultOptions;
  if (defaultOptions) {

  }
  accessoryModelNumber = self->accessoryModelNumber;
  if (accessoryModelNumber) {

  }
  existingFWVersionOnAcc = self->existingFWVersionOnAcc;
  if (existingFWVersionOnAcc) {

  }
  newFWVersionAvailable = self->newFWVersionAvailable;
  if (newFWVersionAvailable) {

  }
  transportType = self->transportType;
  if (transportType) {

  }
  resumePercent = self->resumePercent;
  if (resumePercent) {

  }
  resumeCount = self->resumeCount;
  if (resumeCount) {

  }
  v21.receiver = self;
  v21.super_class = (Class)FudStateMachine;
  [(FudStateMachine *)&v21 dealloc];
}

- (int)performNextStepWithOptions:(id)a3
{
  v11 = "-[FudStateMachine performNextStepWithOptions:]";
  FudLog();
  objc_sync_enter(self);
  if (self->busy)
  {
    FudLog();
    objc_sync_exit(self);
    return -1;
  }
  int state = self->state;
  defaultOptions = self->defaultOptions;
  if (!a3)
  {
    if (!defaultOptions)
    {
      v8 = 0;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  if (defaultOptions)
  {
LABEL_7:
    id v7 = -[NSDictionary mutableCopy](defaultOptions, "mutableCopy", "-[FudStateMachine performNextStepWithOptions:]");
    goto LABEL_8;
  }
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
LABEL_8:
  v8 = v7;
  objc_msgSend(v7, "addEntriesFromDictionary:", a3, v11);
LABEL_9:
  self->busy = 1;
  -[FudStateMachine setPluginOptions:](self, "setPluginOptions:", v8, v11);

  objc_sync_exit(self);
  if (self->exception) {
    FudLog();
  }
  workQueue = self->workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F408;
  block[3] = &unk_10007CF58;
  block[4] = self;
  dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, block);
  FudLog();
  return state;
}

- (void)doneWithOptions:(id)a3
{
  FudLog();
  workQueue = self->workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F4C8;
  block[3] = &unk_10007CF58;
  block[4] = self;
  dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, block);
  FudLog();
}

- (id)exception
{
  return self->exception;
}

- (void)clearException
{
  FudLog();
  [(FudStateMachine *)self setException:0];
}

- (BOOL)performStep:(int)a3 withOptions:(id)a4
{
  FudLog();
  if (a3 < 0xC)
  {
    uint64_t state = self->state;
    if (state == a3 || LODWORD((&off_100095D98)[4 * state + 2]) == a3) {
      return -[FudStateMachine performNextStepWithOptions:](self, "performNextStepWithOptions:", a4, "-[FudStateMachine performStep:withOptions:]") != -1;
    }
    +[FudStateMachine stepName:](FudStateMachine, "stepName:", LODWORD((&off_100095D98)[4 * a3 + 2]), "-[FudStateMachine performStep:withOptions:]");
    +[FudStateMachine stepName:LODWORD((&off_100095D98)[4 * self->state + 2])];
  }
  FudLog();
  return 0;
}

- (int)nextStep:(id *)a3
{
  FudLog();
  objc_sync_enter(self);
  if (self->busy)
  {
    v10 = sub_10001F75C(self, 8u, @"%s: state machine is busy", v5, v6, v7, v8, v9, (uint64_t)"-[FudStateMachine nextStep:]");
    if (a3)
    {
      *a3 = v10;
    }
    else if (v10)
    {
    }
    int v11 = -1;
  }
  else
  {
    if (a3) {
      *a3 = 0;
    }
    int v11 = (int)(&off_100095D98)[4 * self->state + 2];
  }
  objc_sync_exit(self);
  return v11;
}

- (void)setException:(id)a3
{
  exception = self->exception;
  if (exception)
  {

    self->exception = 0;
  }
  if (a3)
  {
    if ([a3 userInfo])
    {
      if (objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", @"PluginName")
        && objc_msgSend(objc_msgSend(a3, "userInfo"), "objectForKey:", @"DeviceClassName"))
      {
        uint64_t v6 = (NSError *)a3;
LABEL_17:
        self->exception = v6;
        return;
      }
      [a3 userInfo];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      v10 = (NSMutableDictionary *)[a3 userInfo];
      int v11 = v10;
      if (v8 == v9)
      {
LABEL_12:
        if (![(NSMutableDictionary *)v11 objectForKey:@"PluginName"]) {
          [(NSMutableDictionary *)v11 setObject:self->stateMachinePluginName forKey:@"PluginName"];
        }
        if (![(NSMutableDictionary *)v11 objectForKey:@"DeviceClassName"]) {
          [(NSMutableDictionary *)v11 setObject:self->stateMachineFilterName forKey:@"DeviceClassName"];
        }
        uint64_t v6 = (NSError *)objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", objc_msgSend(a3, "domain"), objc_msgSend(a3, "code"), v11);
        goto LABEL_17;
      }
      uint64_t v7 = (NSMutableDictionary *)[(NSMutableDictionary *)v10 mutableCopy];
    }
    else
    {
      uint64_t v7 = +[NSMutableDictionary dictionaryWithCapacity:0];
    }
    int v11 = v7;
    goto LABEL_12;
  }
}

- (BOOL)isActive
{
  FudLog();
  int state = self->state;
  BOOL needsDeviceList = (state - 2) < 9;
  if (!state) {
    BOOL needsDeviceList = self->needsDeviceList;
  }
  BOOL v5 = state == 2 && needsDeviceList;
  if (self->nextState == -1) {
    return v5;
  }
  else {
    return needsDeviceList;
  }
}

- (id)loadPlugin
{
  FudLog();
  id result = self->plugin;
  if (!result)
  {
    stateMachineDelegate = self->stateMachineDelegate;
    if (stateMachineDelegate)
    {
      self->plugin = (FudPlugin *)-[FudStateMachineDelegate getPluginWithName:forFilter:delegate:info:options:](stateMachineDelegate, "getPluginWithName:forFilter:delegate:info:options:", self->stateMachinePluginName, self->stateMachineFilterName, self, &self->pluginInfo, self->pluginOptions, "-[FudStateMachine loadPlugin]");
      pluginInfo = self->pluginInfo;
      if (pluginInfo)
      {
        int v11 = pluginInfo;
        ProgressWeightsFromPluginInfo = (FudProgressWeights *)getProgressWeightsFromPluginInfo();
        self->pluginProgressWeights = ProgressWeightsFromPluginInfo;
        if (ProgressWeightsFromPluginInfo) {
          v13 = ProgressWeightsFromPluginInfo;
        }
        if ([(NSDictionary *)self->pluginInfo objectForKey:@"AccessoryIdentifier"])
        {
          accessoryModelNumber = self->accessoryModelNumber;
          if (accessoryModelNumber)
          {

            self->accessoryModelNumber = 0;
          }
          self->accessoryModelNumber = (NSString *)objc_msgSend(-[NSDictionary objectForKey:](self->pluginInfo, "objectForKey:", @"AccessoryIdentifier"), "copy");
        }
      }
      FudLog();
    }
    else
    {
      -[FudStateMachine setException:](self, "setException:", sub_10001F75C(self, 1u, @"%s: unable to load plugin. no state machine delegate set!", v3, v4, v5, v6, v7, (uint64_t)"-[FudStateMachine loadPlugin]"));
    }
    id result = self->plugin;
    if (!result)
    {
      -[FudStateMachine setException:](self, "setException:", sub_10001F75C(self, 3u, @"%s: failed to get plugin from delegate", v15, v16, v17, v18, v19, (uint64_t)"-[FudStateMachine loadPlugin]"));
      return self->plugin;
    }
  }
  return result;
}

- (void)runState
{
  FudLog();
  if (self->state >= 0xCu)
  {
    uint64_t v8 = sub_10001F75C(self, 9u, @"%s: invalid state: %d", v3, v4, v5, v6, v7, (uint64_t)"-[FudStateMachine runState]");
LABEL_8:
    [(FudStateMachine *)self setException:v8];
    [(FudStateMachine *)self didRunStateWithInfo:0];
    goto LABEL_11;
  }
  char v9 = objc_opt_respondsToSelector();
  int state = self->state;
  if ((v9 & 1) == 0)
  {
    uint64_t v8 = sub_10001F75C(self, 0xAu, @"%s: invalid selector for state %s", v10, v11, v12, v13, v14, (uint64_t)"-[FudStateMachine runState]");
    goto LABEL_8;
  }
  self->nextState = state;
  if (state == LODWORD((&off_100095D98)[4 * state + 2]))
  {
    -[FudStateMachine clearException](self, "clearException", "-[FudStateMachine runState]");
    if (objc_opt_respondsToSelector()) {
      [(FudStateMachineDelegate *)self->stateMachineDelegate stepWillBegin:self->state stateMachine:self];
    }
    else {
      FudLog();
    }
  }
  uint64_t v16 = self;
  dispatch_group_enter((dispatch_group_t)qword_1000975B0);
  uint64_t v17 = (&off_100095D98)[4 * self->state];
  FudLog();
  -[FudStateMachine performSelector:](self, "performSelector:", (&off_100095D98)[4 * self->state + 3], "-[FudStateMachine runState]", v17);
LABEL_11:
  FudLog();
}

- (void)didRunStateWithInfo:(id)a3
{
  uint64_t state = self->state;
  uint64_t v17 = "-[FudStateMachine didRunStateWithInfo:]";
  FudLog();
  if ((self->state - 5) <= 1)
  {
    if (objc_opt_respondsToSelector())
    {
      unsigned int pluginForcedSilentUpdate = -[FudPlugin shouldUpdateBeSilent:](self->plugin, "shouldUpdateBeSilent:", 0, "-[FudStateMachine didRunStateWithInfo:]");
      self->unsigned int pluginForcedSilentUpdate = pluginForcedSilentUpdate;
    }
    else
    {
      unsigned int pluginForcedSilentUpdate = self->pluginForcedSilentUpdate;
    }
    uint64_t v17 = "-[FudStateMachine didRunStateWithInfo:]";
    uint64_t v18 = pluginForcedSilentUpdate;
    FudLog();
  }
  int nextState = self->nextState;
  if (nextState == -1) {
    int nextState = self->state;
  }
  else {
    self->uint64_t state = nextState;
  }
  self->busy = 0;
  uint64_t v8 = &(&off_100095D98)[4 * state];
  int v10 = *((_DWORD *)v8 + 4);
  char v9 = (unsigned int *)(v8 + 2);
  if (v10 != LODWORD((&off_100095D98)[4 * nextState + 2])
    || nextState != 11 && self->exception
    || (int v11 = 0, state == 11) && nextState == 8)
  {
    id v19 = +[FudStateMachine stepName:](FudStateMachine, "stepName:", "-[FudStateMachine didRunStateWithInfo:]", v18);
    FudLog();
    -[FudStateMachineDelegate stepComplete:stateMachine:status:error:info:](self->stateMachineDelegate, "stepComplete:stateMachine:status:error:info:", *v9, self, self->exception == 0, "-[FudStateMachine didRunStateWithInfo:]", v19);
    int v11 = 1;
  }
  if (a3)
  {
    uint64_t ProgressWeightsFromPluginInfo = getProgressWeightsFromPluginInfo();
    if (ProgressWeightsFromPluginInfo)
    {
      uint64_t v13 = (void *)ProgressWeightsFromPluginInfo;

      self->pluginProgressWeights = (FudProgressWeights *)v13;
    }
    id v14 = objc_msgSend(a3, "objectForKey:", @"DeviceClassRevision", v17);
    if (v14)
    {
      uint64_t v15 = v14;

      self->stateMachineRevision = (NSString *)v15;
    }
  }
  dispatch_group_leave((dispatch_group_t)qword_1000975B0);

  uint64_t v16 = self->state;
  if (state == v16)
  {
    FudLog();
  }
  else
  {
    objc_super v20 = (&off_100095D98)[4 * state];
    objc_super v21 = (&off_100095D98)[4 * v16];
    FudLog();
    if (!v11 || self->state == 1) {
      -[FudStateMachine performNextStepWithOptions:](self, "performNextStepWithOptions:", self->pluginOptions, "-[FudStateMachine didRunStateWithInfo:]", v20, v21);
    }
  }
  FudLog();
}

- (id)getMatchingFilter
{
  id v3 = [(FudStateMachineDelegate *)self->stateMachineDelegate getStorage];
  if (v3)
  {
    id v9 = [v3 getPolicyForFilterName:self->stateMachineFilterName];
    if (v9)
    {
      id result = [v9 getMatchingFilterWithName:self->stateMachineFilterName];
      if (result) {
        return result;
      }
      objc_super v21 = sub_10001F75C(self, 5u, @"%s: failed to get filter for \"%@\" from policy", v16, v17, v18, v19, v20, (uint64_t)"-[FudStateMachine getMatchingFilter]");
    }
    else
    {
      objc_super v21 = sub_10001F75C(self, 4u, @"%s: failed to get policy for \"%@\" from storage", v10, v11, v12, v13, v14, (uint64_t)"-[FudStateMachine getMatchingFilter]");
    }
  }
  else
  {
    objc_super v21 = sub_10001F75C(self, 2u, @"%s: failed to get storage from delegate", v4, v5, v6, v7, v8, (uint64_t)"-[FudStateMachine getMatchingFilter]");
  }
  [(FudStateMachine *)self setException:v21];
  return 0;
}

- (void)runStateStart
{
  FudLog();
  self->int nextState = (int)(&off_100095D98)[4 * self->state + 1];
  [(FudStateMachine *)self didRunStateWithInfo:0];
}

- (void)runStateEnd
{
  FudLog();
  FudLog();
  [(FudStateMachine *)self didRunStateWithInfo:0];
}

- (void)runStateQueryNeedsBootstrap
{
  FudLog();
  id v3 = -[FudStateMachine getMatchingFilter](self, "getMatchingFilter", "-[FudStateMachine runStateQueryNeedsBootstrap]");
  if (!v3) {
    goto LABEL_21;
  }
  uint64_t v4 = v3;
  +[FudUtilities logFudAggd:status:info:value:](FudUtilities, "logFudAggd:status:info:value:", [v3 filterName], @"updates.attempts", 0, 1);
  uint64_t v15 = [v4 needsQueryDevices];
  accessory = self->accessory;
  FudLog();
  if (objc_msgSend(v4, "needsQueryDevices", "-[FudStateMachine runStateQueryNeedsBootstrap]", v15, accessory))
  {
    uint64_t v5 = self->accessory;
    if (v5)
    {
LABEL_14:
      pluginOptions = self->pluginOptions;
      if (!pluginOptions)
      {
        pluginOptions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        self->pluginOptions = pluginOptions;
        uint64_t v5 = self->accessory;
      }
      [(NSMutableDictionary *)pluginOptions setObject:v5 forKey:@"AccessoryOption"];
      goto LABEL_17;
    }
    id v17 = 0;
    self->BOOL needsDeviceList = 1;
    self->int nextState = 1;
    if ([(FudStateMachine *)self loadPlugin])
    {
      if ([(FudPlugin *)self->plugin conformsToProtocol:&OBJC_PROTOCOL___FudQueryPlugin])
      {
        [(FudPlugin *)self->plugin queryDeviceList:&v17];
        if (v17 && [v17 count])
        {
          id v6 = v17;
          uint64_t v7 = (AUDAccessory *)[v17 objectAtIndex:0];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            self->accessory = v7;
            if ((unint64_t)[v17 count] >= 2)
            {
              uint64_t v8 = 1;
              int v9 = 1;
              do
              {
                -[FudStateMachineDelegate queueUpEventForAccessory:stateMachine:](self->stateMachineDelegate, "queueUpEventForAccessory:stateMachine:", [v17 objectAtIndex:v8], self);
                uint64_t v8 = (unsigned __int16)++v9;
              }
              while ((unint64_t)[v17 count] > (unsigned __int16)v9);
            }

            goto LABEL_13;
          }

          uint64_t v14 = "-[FudStateMachine runStateQueryNeedsBootstrap]";
        }
        else
        {
          uint64_t v14 = "-[FudStateMachine runStateQueryNeedsBootstrap]";
        }
      }
      else
      {
        uint64_t v14 = "-[FudStateMachine runStateQueryNeedsBootstrap]";
      }
    }
    else
    {
      uint64_t v14 = "-[FudStateMachine runStateQueryNeedsBootstrap]";
    }
    FudLog();
    goto LABEL_21;
  }
LABEL_13:
  uint64_t v5 = self->accessory;
  if (v5) {
    goto LABEL_14;
  }
LABEL_17:
  unsigned int v11 = [v4 needsBootstrapping];
  uint64_t v12 = &(&off_100095D98)[4 * self->state];
  if (v11) {
    int v13 = *((_DWORD *)v12 + 2);
  }
  else {
    int v13 = *((_DWORD *)v12 + 3);
  }
  self->int nextState = v13;
LABEL_21:
  -[FudStateMachine didRunStateWithInfo:](self, "didRunStateWithInfo:", 0, v14);
}

- (void)runStateDoBootstrap
{
  FudLog();
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoBootstrap]"))
  {
    self->validCallback = "didBootstrap:info:error:";
    plugin = self->plugin;
    pluginOptions = self->pluginOptions;
    [(FudPlugin *)plugin bootstrapWithOptions:pluginOptions];
  }
  else
  {
    self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
    [(FudStateMachine *)self didRunStateWithInfo:0];
  }
}

- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  FudLog();
  objc_sync_enter(self);
  if (self->validCallback == "didBootstrap:info:error:")
  {
    self->validCallback = 0;
    objc_sync_exit(self);
    if (-[NSString containsString:](self->stateMachineFilterName, "containsString:", @"AppleSTDP2700Bootstrap", "-[FudStateMachine didBootstrap:info:error:]")|| !v7)
    {
      +[FudUtilities logFudAggd:self->stateMachineFilterName status:@"updates.failure" info:0 value:1];
      +[FudUtilities logFudAggd:status:info:value:](FudUtilities, "logFudAggd:status:info:value:", self->stateMachineFilterName, @"error", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"bootstrap.%@.%ld", [a5 domain], objc_msgSend(a5, "code")), 1);
      if ([(FudStateMachine *)self getMatchingFilter])
      {
        self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
        if (a5)
        {
          [(FudStateMachine *)self setException:a5];
          if (objc_msgSend(objc_msgSend(a5, "domain"), "isEqualToString:", @"com.apple.MobileAccessoryUpdater.ErrorDomain")&& objc_msgSend(a5, "code") == (id)1)
          {
            id v17 = "-[FudStateMachine didBootstrap:info:error:]";
            id v18 = a5;
            FudLog();
            CFStringRef v14 = @"com.apple.fud.updateInterrupted";
          }
          else
          {
            CFStringRef v14 = @"com.apple.fud.updateFailed";
          }
          uint64_t v15 = +[NSString stringWithString:](NSString, "stringWithString:", v14, v17, v18);
          [(FudStateMachine *)self createEndOfUpdateDictForEvent:v15 info:a4];
          FudLog();
          AnalyticsSendEvent();
          if (v15) {
        }
          }
        else
        {
          -[FudStateMachine setException:](self, "setException:", sub_10001F75C(self, 7u, @"%s: unspecified error from plugin", v9, v10, v11, v12, v13, (uint64_t)"-[FudStateMachine didBootstrap:info:error:]"));
        }
      }
    }
    else
    {
      self->int nextState = (int)(&off_100095D98)[4 * self->state + 1];
      if (a5) {
        FudLog();
      }
    }
    workQueue = self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002075C;
    block[3] = &unk_10007D4B0;
    block[4] = self;
    void block[5] = a4;
    dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, block);
    FudLog();
  }
  else
  {
    FudLog();
    objc_sync_exit(self);
  }
}

- (void)runStateQueryNeedsRemoteCheck
{
  FudLog();
  id v3 = -[FudStateMachineDelegate getStorage](self->stateMachineDelegate, "getStorage", "-[FudStateMachine runStateQueryNeedsRemoteCheck]");
  if (!v3)
  {
    id v18 = sub_10001F75C(self, 2u, @"%s: failed to get storage from delegate", v4, v5, v6, v7, v8, (uint64_t)"-[FudStateMachine runStateQueryNeedsRemoteCheck]");
LABEL_10:
    [(FudStateMachine *)self setException:v18];
    goto LABEL_14;
  }
  uint64_t v9 = v3;
  id v10 = [v3 getPolicyForPlugin:self->stateMachinePluginName];
  if (!v10)
  {
    id v18 = sub_10001F75C(self, 4u, @"%s: failed to get policy from storage", v11, v12, v13, v14, v15, (uint64_t)"-[FudStateMachine runStateQueryNeedsRemoteCheck]");
    goto LABEL_10;
  }
  self->remoteCheck = 0;
  self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
  if ([v9 policyAllowsRemoteFindNow:v10 filter:self->stateMachineFilterName revision:self->stateMachineRevision])
  {
    SCNetworkReachabilityFlags flags = 0;
    sockaddr address = (sockaddr)xmmword_10006AB10;
    uint64_t v16 = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, &address);
    if (v16)
    {
      id v17 = v16;
      if (SCNetworkReachabilityGetFlags(v16, &flags) && (flags & 2) != 0)
      {
        FudLog();
        CFRelease(v17);
        self->remoteCheck = 1;
        self->int nextState = (int)(&off_100095D98)[4 * self->state + 1];
        goto LABEL_14;
      }
      FudLog();
      CFRelease(v17);
    }
    else
    {
      FudLog();
    }
    FudLog();
  }
LABEL_14:
  [(FudStateMachine *)self didRunStateWithInfo:0];
}

- (void)runStateDoCheck
{
  FudLog();
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoCheck]"))
  {
    self->validCallback = "didFind:info:updateAvailable:needsDownload:error:";
    plugin = self->plugin;
    pluginOptions = self->pluginOptions;
    BOOL remoteCheck = self->remoteCheck;
    [(FudPlugin *)plugin findFirmwareWithOptions:pluginOptions remote:remoteCheck];
  }
  else
  {
    self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
    [(FudStateMachine *)self didRunStateWithInfo:0];
  }
}

- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 error:(id)a6
{
}

- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v11 = a3;
  v33 = "-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]";
  FudLog();
  objc_sync_enter(self);
  if (self->validCallback == "didFind:info:updateAvailable:needsDownload:error:")
  {
    self->validCallback = 0;
    objc_sync_exit(self);
    if (a7)
    {
      -[FudStateMachine setException:](self, "setException:", a7, "-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]");
      if (!v11) {
        goto LABEL_25;
      }
    }
    else if (!v11)
    {
      -[FudStateMachine setException:](self, "setException:", sub_10001F75C(self, 7u, @"%s: Unspecified error from plugin", v13, v14, v15, v16, v17, (uint64_t)"-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]"));
LABEL_25:
      v34 = "-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]";
      exception = self->exception;
      FudLog();
      self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
      if (a7)
      {
        if (objc_msgSend(objc_msgSend(a7, "domain", "-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]", exception), "isEqualToString:", @"com.apple.MobileAccessoryUpdater.ErrorDomain")&& objc_msgSend(a7, "code") == (id)1)
        {
          v35 = "-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]";
          id v37 = a7;
          FudLog();
          CFStringRef v30 = @"com.apple.fud.updateInterrupted";
        }
        else
        {
          CFStringRef v30 = @"com.apple.fud.updateFailed";
        }
        v31 = +[NSString stringWithString:](NSString, "stringWithString:", v30, v35, v37);
        v34 = (const char *)v31;
        exception = [(FudStateMachine *)self createEndOfUpdateDictForEvent:v31 info:a4];
        FudLog();
        AnalyticsSendEvent();
        if (v31) {
      }
        }
      +[FudUtilities logFudAggd:self->stateMachineFilterName, @"updates.failure", 0, 1, v34, exception status info value];
      +[FudUtilities logFudAggd:status:info:value:](FudUtilities, "logFudAggd:status:info:value:", self->stateMachineFilterName, @"error", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"find.%@.%ld", [a7 domain], objc_msgSend(a7, "code")), 1);
LABEL_37:
      workQueue = self->workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100020F90;
      block[3] = &unk_10007D4B0;
      block[4] = self;
      void block[5] = a4;
      dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, block);
      FudLog();
      return;
    }
    if (v9)
    {
      if (a4)
      {
        if ([a4 objectForKeyedSubscript:@"existingFWVersionOnAccessory"])
        {
          existingFWVersionOnAcc = self->existingFWVersionOnAcc;
          if (existingFWVersionOnAcc)
          {

            self->existingFWVersionOnAcc = 0;
          }
          self->existingFWVersionOnAcc = (NSString *)objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"existingFWVersionOnAccessory", v33), "copy");
        }
        if (objc_msgSend(a4, "objectForKeyedSubscript:", @"newFWVersion", v33))
        {
          newFWVersionAvailable = self->newFWVersionAvailable;
          if (newFWVersionAvailable)
          {

            self->newFWVersionAvailable = 0;
          }
          self->newFWVersionAvailable = (NSString *)objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"newFWVersion"), "copy");
        }
      }
      stateMachinePluginName = self->stateMachinePluginName;
      v39[3] = @"newFWVersion";
      v40 = stateMachinePluginName;
      v39[0] = @"pluginName";
      v39[1] = @"modelName";
      long long v41 = *(_OWORD *)&self->accessoryModelNumber;
      v39[2] = @"existingFWVersionOnAccessory";
      v42 = self->newFWVersionAvailable;
      objc_super v21 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v40, v39, 4, v33));
      if (v8)
      {
        v22 = (int *)&(&off_100095D98)[4 * self->state + 1];
        CFStringRef v23 = @"mobileAsset";
      }
      else
      {
        FudLog();
        CFStringRef v23 = @"fileSystem";
        v22 = &dword_100095E80;
      }
      self->int nextState = *v22;
      [(NSMutableDictionary *)v21 setObject:v23 forKey:@"sourceOfFirmware"];
      FudLog();
      AnalyticsSendEvent();
    }
    else
    {
      self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
      +[FudUtilities logFudAggd:self->stateMachineFilterName status:@"updates.current" info:0 value:1];
      if (self->remoteCheck)
      {
        id v24 = [(FudStateMachineDelegate *)self->stateMachineDelegate getStorage];
        if (v24) {
          objc_msgSend(v24, "recordSuccessfulRemoteFindForPolicy:filter:revision:date:", objc_msgSend(v24, "getPolicyForPlugin:", self->stateMachinePluginName), self->stateMachineFilterName, self->stateMachineRevision, 0);
        }
        else {
          -[FudStateMachine setException:](self, "setException:", sub_10001F75C(self, 2u, @"%s: failed to get storage from delegate", v25, v26, v27, v28, v29, (uint64_t)"-[FudStateMachine didFind:info:updateAvailable:needsDownload:error:]"));
        }
      }
      else
      {
        FudLog();
      }
    }
    goto LABEL_37;
  }
  FudLog();
  objc_sync_exit(self);
}

- (void)runStateDoDownload
{
  FudLog();
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoDownload]"))
  {
    self->validCallback = "didDownload:info:error:";
    plugin = self->plugin;
    pluginOptions = self->pluginOptions;
    [(FudPlugin *)plugin downloadFirmwareWithOptions:pluginOptions];
  }
  else
  {
    self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
    [(FudStateMachine *)self didRunStateWithInfo:0];
  }
}

- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  FudLog();
  objc_sync_enter(self);
  if (self->validCallback == "didDownload:info:error:")
  {
    self->validCallback = 0;
    objc_sync_exit(self);
    if (v7)
    {
      id v14 = -[FudStateMachineDelegate getStorage](self->stateMachineDelegate, "getStorage", "-[FudStateMachine didDownload:info:error:]");
      if (v14 && (uint64_t v15 = v14, (v16 = [v14 getPolicyForPlugin:self->stateMachinePluginName]) != 0)) {
        [v15 recordSuccessfulRemoteFindForPolicy:v16 filter:self->stateMachineFilterName revision:self->stateMachineRevision date:0];
      }
      else {
        FudLog();
      }
      self->int nextState = (int)(&off_100095D98)[4 * self->state + 1];
      if (a5) {
        FudLog();
      }
    }
    else
    {
      self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
      if (a5)
      {
        -[FudStateMachine setException:](self, "setException:", a5, "-[FudStateMachine didDownload:info:error:]");
        if (objc_msgSend(objc_msgSend(a5, "domain"), "isEqualToString:", @"com.apple.MobileAccessoryUpdater.ErrorDomain")&& objc_msgSend(a5, "code") == (id)1)
        {
          uint64_t v20 = "-[FudStateMachine didDownload:info:error:]";
          id v22 = a5;
          FudLog();
          CFStringRef v17 = @"com.apple.fud.updateInterrupted";
        }
        else
        {
          CFStringRef v17 = @"com.apple.fud.updateFailed";
        }
        id v18 = +[NSString stringWithString:](NSString, "stringWithString:", v17, v20, v22);
        objc_super v21 = v18;
        id v22 = [(FudStateMachine *)self createEndOfUpdateDictForEvent:v18 info:a4];
        FudLog();
        AnalyticsSendEvent();
        if (v18) {
      }
        }
      else
      {
        -[FudStateMachine setException:](self, "setException:", sub_10001F75C(self, 7u, @"%s: unspecified error from plugin", v9, v10, v11, v12, v13, (uint64_t)"-[FudStateMachine didDownload:info:error:]"));
      }
      +[FudUtilities logFudAggd:self->stateMachineFilterName, @"updates.failure", 0, 1, v21, v22 status info value];
      +[FudUtilities logFudAggd:status:info:value:](FudUtilities, "logFudAggd:status:info:value:", self->stateMachineFilterName, @"error", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"download.%@.%ld", [a5 domain], objc_msgSend(a5, "code")), 1);
    }
    workQueue = self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000213CC;
    block[3] = &unk_10007D4B0;
    block[4] = self;
    void block[5] = a4;
    dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, block);
    FudLog();
  }
  else
  {
    FudLog();
    objc_sync_exit(self);
  }
}

- (void)personalizationDone:(id)a3 response:(id)a4 error:(id)a5
{
  FudLog();
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine personalizationDone:response:error:]"))
  {
    if (!a5)
    {
      plugin = self->plugin;
      id v10 = a3;
      id v11 = a4;
      id v12 = 0;
      goto LABEL_7;
    }
    uint64_t v13 = "-[FudStateMachine personalizationDone:response:error:]";
    id v14 = a5;
    FudLog();
    plugin = self->plugin;
LABEL_5:
    id v10 = a3;
    id v11 = 0;
    id v12 = a5;
LABEL_7:
    -[FudPlugin personalizationResponse:response:status:](plugin, "personalizationResponse:response:status:", v10, v11, v12, v13, v14);
    goto LABEL_8;
  }
  uint64_t v13 = "-[FudStateMachine personalizationDone:response:error:]";
  FudLog();
  plugin = self->plugin;
  if (plugin) {
    goto LABEL_5;
  }
LABEL_8:
  FudLog();
}

- (BOOL)showPersonalizationRequiredDialogAndGetResponse
{
  FudLog();
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  id v3 = -[FudStateMachine getMatchingFilter](self, "getMatchingFilter", "-[FudStateMachine showPersonalizationRequiredDialogAndGetResponse]");
  uint64_t v4 = [v3 filterReadableName]
     ? +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"New Firmware available for %@. This requires Personalization, you will be prompted for your credentials.", [v3 filterReadableName]): +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"New Firmware available for %@. This requires Personalization, you will be prompted for your credentials.", @"your accessory");
  uint64_t v5 = v4;
  id v6 = +[NSMutableDictionary dictionary];
  [v6 setObject:@"*** INTERNAL ONLY ***" forKey:kCFUserNotificationAlertHeaderKey];
  [v6 setObject:v5 forKey:kCFUserNotificationAlertMessageKey];
  [v6 setObject:@"OK" forKey:kCFUserNotificationDefaultButtonTitleKey];
  [v6 setObject:@"Cancel" forKey:kCFUserNotificationAlternateButtonTitleKey];
  SInt32 error = 0;
  BOOL v7 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0x21uLL, &error, (CFDictionaryRef)v6);
  if (!v7) {
    return 0;
  }
  BOOL v8 = v7;
  CFOptionFlags responseFlags = 0;
  CFUserNotificationReceiveResponse(v7, 0.0, &responseFlags);
  BOOL v9 = responseFlags == 0;
  CFRelease(v8);
  return v9;
}

- (void)personalizationRequest:(id)a3
{
  FudLog();
  personalizer = self->personalizer;
  if (!personalizer)
  {
    personalizer = -[FudPersonalizer initWithDelegate:]([FudPersonalizer alloc], "initWithDelegate:", self, "-[FudStateMachine personalizationRequest:]");
    self->personalizer = personalizer;
  }
  [(FudPersonalizer *)personalizer doPersonalization:a3];
}

- (void)runStateDoPrepare
{
  FudLog();
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoPrepare]"))
  {
    self->validCallback = "didPrepare:info:error:";
    plugin = self->plugin;
    pluginOptions = self->pluginOptions;
    [(FudPlugin *)plugin prepareFirmwareWithOptions:pluginOptions];
  }
  else
  {
    self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
    [(FudStateMachine *)self didRunStateWithInfo:0];
  }
}

- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  FudLog();
  objc_sync_enter(self);
  if (self->validCallback == "didPrepare:info:error:")
  {
    self->validCallback = 0;
    objc_sync_exit(self);
    id v14 = &(&off_100095D98)[4 * self->state];
    if (v7)
    {
      self->int nextState = *((_DWORD *)v14 + 2);
      if (a5) {
        FudLog();
      }
    }
    else
    {
      self->int nextState = *((_DWORD *)v14 + 3);
      if (a5)
      {
        -[FudStateMachine setException:](self, "setException:", a5, "-[FudStateMachine didPrepare:info:error:]");
        if (objc_msgSend(objc_msgSend(a5, "domain"), "isEqualToString:", @"com.apple.MobileAccessoryUpdater.ErrorDomain")&& objc_msgSend(a5, "code") == (id)1)
        {
          id v18 = "-[FudStateMachine didPrepare:info:error:]";
          id v20 = a5;
          FudLog();
          CFStringRef v15 = @"com.apple.fud.updateInterrupted";
        }
        else
        {
          CFStringRef v15 = @"com.apple.fud.updateFailed";
        }
        id v16 = +[NSString stringWithString:](NSString, "stringWithString:", v15, v18, v20);
        uint64_t v19 = v16;
        id v20 = [(FudStateMachine *)self createEndOfUpdateDictForEvent:v16 info:a4];
        FudLog();
        AnalyticsSendEvent();
        if (v16) {
      }
        }
      else
      {
        -[FudStateMachine setException:](self, "setException:", sub_10001F75C(self, 7u, @"%s: unspecified error from plugin", v9, v10, v11, v12, v13, (uint64_t)"-[FudStateMachine didPrepare:info:error:]"));
      }
      +[FudUtilities logFudAggd:self->stateMachineFilterName, @"updates.failure", 0, 1, v19, v20 status info value];
      +[FudUtilities logFudAggd:status:info:value:](FudUtilities, "logFudAggd:status:info:value:", self->stateMachineFilterName, @"error", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"prepare.%@.%ld", [a5 domain], objc_msgSend(a5, "code")), 1);
    }
    workQueue = self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100021A70;
    block[3] = &unk_10007D4B0;
    block[4] = self;
    void block[5] = a4;
    dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, block);
    FudLog();
  }
  else
  {
    FudLog();
    objc_sync_exit(self);
  }
}

- (void)runStateDoApply
{
  FudLog();
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoApply]"))
  {
    self->validCallback = "didApply:info:error:";
    id v3 = [(FudStateMachine *)self getMatchingFilter];
    if ([v3 noPowerAssertion])
    {
      [v3 filterName];
    }
    else if (!self->hasSleepAssertion {
           && !IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, @"com.apple.MobileAccessoryUpdater.SleepAssertionID", &self->sleepAssertionId))
    }
    {
      self->hasSleepAssertion = 1;
    }
    FudLog();
    plugin = self->plugin;
    pluginOptions = self->pluginOptions;
    [(FudPlugin *)plugin applyFirmwareWithOptions:pluginOptions];
  }
  else
  {
    self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
    [(FudStateMachine *)self didRunStateWithInfo:0];
  }
}

- (id)createEndOfUpdateDictForEvent:(id)a3 info:(id)a4
{
  FudLog();
  if (!a3
    || (objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateCompleted", "-[FudStateMachine createEndOfUpdateDictForEvent:info:]") & 1) == 0&& (objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateInterrupted") & 1) == 0&& (objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateFailed") & 1) == 0)
  {
    FudLog();
    return 0;
  }
  stateMachinePluginName = self->stateMachinePluginName;
  v33[0] = @"pluginName";
  v33[1] = @"modelName";
  accessoryModelNumber = self->accessoryModelNumber;
  v34[0] = stateMachinePluginName;
  v34[1] = accessoryModelNumber;
  resumePercent = self->resumePercent;
  v34[2] = self->transportType;
  v33[2] = @"transportType";
  v33[3] = @"existingFWVersionOnAccessory";
  long long v35 = *(_OWORD *)&self->existingFWVersionOnAcc;
  v33[4] = @"newFWVersion";
  v33[5] = @"resumedFromPercent";
  v36 = resumePercent;
  uint64_t v10 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:6]);
  id v32 = a3;
  if (a4)
  {
    if ([a4 objectForKeyedSubscript:@"cumulativeProgressPercent"]) {
      uint64_t v11 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"cumulativeProgressPercent"];
    }
    else {
      uint64_t v11 = &off_1000867A0;
    }
    if ([a4 objectForKeyedSubscript:@"currentSessionTimeTaken"]) {
      uint64_t v19 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"currentSessionTimeTaken"];
    }
    else {
      uint64_t v19 = &off_1000867A0;
    }
    if ([a4 objectForKeyedSubscript:@"cumulativeTimeTaken"]) {
      id v20 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"cumulativeTimeTaken"];
    }
    else {
      id v20 = &off_1000867A0;
    }
    if ([a4 objectForKeyedSubscript:@"cumulativeCalendarTimeTaken"]) {
      objc_super v21 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"cumulativeCalendarTimeTaken"];
    }
    else {
      objc_super v21 = &off_1000867A0;
    }
    if ([a4 objectForKeyedSubscript:@"cumulativeCloakingTime"]) {
      id v22 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"cumulativeCloakingTime"];
    }
    else {
      id v22 = &off_1000867A0;
    }
    id v16 = v22;
    if ([a4 objectForKeyedSubscript:@"averageBitRate"]) {
      CFStringRef v17 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"averageBitRate"];
    }
    else {
      CFStringRef v17 = &off_1000867A0;
    }
    CFStringRef v15 = v21;
    id v14 = v20;
    if ([a4 objectForKeyedSubscript:@"totalSessionCount"]) {
      CFStringRef v30 = (_UNKNOWN **)[a4 objectForKeyedSubscript:@"totalSessionCount"];
    }
    else {
      CFStringRef v30 = &off_1000867A0;
    }
    uint64_t v13 = v19;
    if ([a4 objectForKeyedSubscript:@"error"]) {
      CFStringRef v12 = (const __CFString *)[a4 objectForKeyedSubscript:@"error"];
    }
    else {
      CFStringRef v12 = @"Unknown";
    }
    if ([a4 objectForKeyedSubscript:@"interruptedState"]) {
      CFStringRef v31 = (const __CFString *)[a4 objectForKeyedSubscript:@"interruptedState"];
    }
    else {
      CFStringRef v31 = @"Unknown";
    }
    if ([a4 objectForKeyedSubscript:@"failureState"]) {
      CFStringRef v29 = (const __CFString *)[a4 objectForKeyedSubscript:@"failureState"];
    }
    else {
      CFStringRef v29 = @"Unknown";
    }
    id v18 = v30;
  }
  else
  {
    CFStringRef v12 = @"Unknown";
    uint64_t v11 = &off_1000867A0;
    uint64_t v13 = &off_1000867A0;
    id v14 = &off_1000867A0;
    CFStringRef v15 = &off_1000867A0;
    id v16 = &off_1000867A0;
    CFStringRef v17 = &off_1000867A0;
    id v18 = &off_1000867A0;
    CFStringRef v31 = @"Unknown";
    CFStringRef v29 = @"Unknown";
  }
  [(NSMutableDictionary *)v10 setObject:v11 forKey:@"cumulativeProgressPercent"];
  [(NSMutableDictionary *)v10 setObject:v13 forKey:@"currentSessionTimeTaken"];
  [(NSMutableDictionary *)v10 setObject:v14 forKey:@"cumulativeTimeTaken"];
  [(NSMutableDictionary *)v10 setObject:v15 forKey:@"cumulativeCalendarTimeTaken"];
  [(NSMutableDictionary *)v10 setObject:v16 forKey:@"cumulativeCloakingTime"];
  [(NSMutableDictionary *)v10 setObject:v17 forKey:@"averageBitRate"];
  [(NSMutableDictionary *)v10 setObject:v18 forKey:@"totalSessionCount"];
  [(NSMutableDictionary *)v10 setObject:v12 forKey:@"error"];
  if (([v32 isEqualToString:@"com.apple.fud.updateCompleted"] & 1) == 0)
  {
    unsigned int v23 = [v32 isEqualToString:@"com.apple.fud.updateInterrupted"];
    if (a4 && v23)
    {
      CFStringRef v24 = @"interruptedState";
      uint64_t v25 = v10;
      CFStringRef v26 = v31;
LABEL_45:
      [(NSMutableDictionary *)v25 setObject:v26 forKey:v24];
      return v10;
    }
    unsigned int v27 = [v32 isEqualToString:@"com.apple.fud.updateFailed"];
    if (a4 && v27)
    {
      CFStringRef v24 = @"failureState";
      uint64_t v25 = v10;
      CFStringRef v26 = v29;
      goto LABEL_45;
    }
  }
  return v10;
}

- (id)createBeginningOfUpdateDictForEvent:(id)a3 info:(id)a4
{
  FudLog();
  if (a4)
  {
    if (a3
      && ((objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateStarted", "-[FudStateMachine createBeginningOfUpdateDictForEvent:info:]") & 1) != 0|| (objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateResumed") & 1) != 0))
    {
      if ([a4 objectForKeyedSubscript:@"transportType"]
        && -[FudStateMachine conformsToAllowedValuesForKey:value:](self, "conformsToAllowedValuesForKey:value:", @"transportType", [a4 objectForKeyedSubscript:@"transportType"]))
      {
        transportType = self->transportType;
        if (transportType)
        {

          self->transportType = 0;
        }
        self->transportType = (NSString *)objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"transportType"), "copy");
      }
      if ([a4 objectForKeyedSubscript:@"resumingFromPercent"])
      {
        resumePercent = self->resumePercent;
        if (resumePercent)
        {

          self->resumePercent = 0;
        }
        self->resumePercent = (NSNumber *)objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"resumingFromPercent"), "copy");
      }
      if ([a4 objectForKeyedSubscript:@"resumeCount"])
      {
        resumeCount = self->resumeCount;
        if (resumeCount)
        {

          self->resumeCount = 0;
        }
        self->resumeCount = (NSNumber *)objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"resumeCount"), "copy");
      }
      stateMachinePluginName = self->stateMachinePluginName;
      v13[0] = @"pluginName";
      v13[1] = @"modelName";
      accessoryModelNumber = self->accessoryModelNumber;
      v14[0] = stateMachinePluginName;
      v14[1] = accessoryModelNumber;
      v14[2] = self->transportType;
      v13[2] = @"transportType";
      v13[3] = @"existingFWVersionOnAccessory";
      v13[4] = @"newFWVersion";
      long long v15 = *(_OWORD *)&self->existingFWVersionOnAcc;
      a4 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5]);
      if (([a3 isEqualToString:@"com.apple.fud.updateStarted"] & 1) == 0
        && [a3 isEqualToString:@"com.apple.fud.updateResumed"])
      {
        [a4 setObject:self->resumePercent forKey:@"resumingFromPercent"];
        [a4 setObject:self->resumeCount forKey:@"resumeCount"];
      }
    }
    else
    {
      FudLog();
      return 0;
    }
  }
  else
  {
    FudLog();
  }
  return a4;
}

- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  FudLog();
  if (self->hasSleepAssertion)
  {
    uint64_t v9 = (void *)IOPMAssertionRelease(self->sleepAssertionId);
    CFStringRef v24 = @"com.apple.MobileAccessoryUpdater.SleepAssertionID";
    uint64_t sleepAssertionId = self->sleepAssertionId;
    id v22 = v9;
    FudLog();
    self->hasSleepAssertion = 0;
  }
  else
  {
    FudLog();
  }
  objc_sync_enter(self);
  if (self->validCallback == "didApply:info:error:")
  {
    self->validCallback = 0;
    objc_sync_exit(self);
    long long v15 = &(&off_100095D98)[4 * self->state];
    if (v7)
    {
      self->int nextState = *((_DWORD *)v15 + 2);
      -[FudStateMachine createEndOfUpdateDictForEvent:info:](self, "createEndOfUpdateDictForEvent:info:", @"com.apple.fud.updateCompleted", a4, "-[FudStateMachine didApply:info:error:]");
      FudLog();
      AnalyticsSendEvent();
      if (a5) {
        FudLog();
      }
    }
    else
    {
      self->int nextState = *((_DWORD *)v15 + 3);
      if (a5)
      {
        -[FudStateMachine setException:](self, "setException:", a5, "-[FudStateMachine didApply:info:error:]");
        if (objc_msgSend(objc_msgSend(a5, "domain"), "isEqualToString:", @"com.apple.MobileAccessoryUpdater.ErrorDomain")&& objc_msgSend(a5, "code") == (id)-1)
        {
          uint64_t v19 = "-[FudStateMachine didApply:info:error:]";
          id v22 = a5;
          FudLog();
          self->int nextState = 9;
        }
        if (objc_msgSend(objc_msgSend(a5, "domain", v19, v22, v24, sleepAssertionId), "isEqualToString:", @"com.apple.MobileAccessoryUpdater.ErrorDomain")&& objc_msgSend(a5, "code") == (id)1)
        {
          id v20 = "-[FudStateMachine didApply:info:error:]";
          id v23 = a5;
          FudLog();
          CFStringRef v16 = @"com.apple.fud.updateInterrupted";
        }
        else
        {
          CFStringRef v16 = @"com.apple.fud.updateFailed";
        }
        CFStringRef v17 = +[NSString stringWithString:](NSString, "stringWithString:", v16, v20, v23);
        objc_super v21 = v17;
        id v22 = [(FudStateMachine *)self createEndOfUpdateDictForEvent:v17 info:a4];
        FudLog();
        AnalyticsSendEvent();
        if (v17) {
      }
        }
      else
      {
        -[FudStateMachine setException:](self, "setException:", sub_10001F75C(self, 7u, @"%s: unspecified error from plugin", v10, v11, v12, v13, v14, (uint64_t)"-[FudStateMachine didApply:info:error:]"));
      }
      +[FudUtilities logFudAggd:self->stateMachineFilterName, @"updates.failure", 0, 1, v21, v22 status info value];
      +[FudUtilities logFudAggd:status:info:value:](FudUtilities, "logFudAggd:status:info:value:", self->stateMachineFilterName, @"error", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"apply.%@.%ld", [a5 domain], objc_msgSend(a5, "code")), 1);
    }
    workQueue = self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002275C;
    block[3] = &unk_10007D4B0;
    block[4] = self;
    void block[5] = a4;
    dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, block);
    FudLog();
  }
  else
  {
    FudLog();
    objc_sync_exit(self);
  }
}

- (void)runStateDoFinish
{
  FudLog();
  if (-[FudStateMachine loadPlugin](self, "loadPlugin", "-[FudStateMachine runStateDoFinish]"))
  {
    self->validCallback = "didFinish:info:error:";
    plugin = self->plugin;
    pluginOptions = self->pluginOptions;
    [(FudPlugin *)plugin finishWithOptions:pluginOptions];
  }
  else
  {
    self->int nextState = *((_DWORD *)&off_100095D98 + 8 * self->state + 3);
    [(FudStateMachine *)self didRunStateWithInfo:0];
  }
}

- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5
{
  BOOL v7 = a3;
  id v22 = (id)a3;
  FudLog();
  objc_super v21 = "-[FudStateMachine didFinish:info:error:]";
  FudLog();
  objc_sync_enter(self);
  if (self->validCallback == "didFinish:info:error:")
  {
    self->validCallback = 0;
    objc_sync_exit(self);
    uint64_t v14 = &(&off_100095D98)[4 * self->state];
    if (v7)
    {
      self->int nextState = *((_DWORD *)v14 + 2);
      if (a5)
      {
        objc_super v21 = "-[FudStateMachine didFinish:info:error:]";
        id v22 = a5;
        FudLog();
      }
      stateMachineFilterName = self->stateMachineFilterName;
      CFStringRef v16 = @"updates.success";
      CFStringRef v17 = 0;
    }
    else
    {
      self->int nextState = *((_DWORD *)v14 + 3);
      if (a5)
      {
        id v18 = self;
        uint64_t v19 = a5;
      }
      else
      {
        uint64_t v19 = sub_10001F75C(self, 7u, @"%s: unspecified error from plugin", v9, v10, v11, v12, v13, (uint64_t)"-[FudStateMachine didFinish:info:error:]");
        id v18 = self;
      }
      -[FudStateMachine setException:](v18, "setException:", v19, v21, v22, a4);
      +[FudUtilities logFudAggd:self->stateMachineFilterName status:@"updates.failure" info:0 value:1];
      CFStringRef v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"finish.%@.%ld", [a5 domain], objc_msgSend(a5, "code"));
      stateMachineFilterName = self->stateMachineFilterName;
      CFStringRef v16 = @"error";
    }
    +[FudUtilities logFudAggd:status:info:value:](FudUtilities, "logFudAggd:status:info:value:", stateMachineFilterName, v16, v17, 1, v21, v22);
    workQueue = self->workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022AC4;
    block[3] = &unk_10007D4B0;
    block[4] = self;
    void block[5] = a4;
    dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, block);
    FudLog();
  }
  else
  {
    FudLog();
    objc_sync_exit(self);
  }
}

- (void)reportAnalytics:(id)a3 info:(id)a4
{
  FudLog();
  if (a3
    && a4
    && ((CFStringRef v7 = @"com.apple.fud.updateStarted",
         (objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateStarted", "-[FudStateMachine reportAnalytics:info:]") & 1) != 0)|| (CFStringRef v7 = @"com.apple.fud.updateResumed", objc_msgSend(a3, "isEqualToString:", @"com.apple.fud.updateResumed")))&& -[FudStateMachine createBeginningOfUpdateDictForEvent:info:](self, "createBeginningOfUpdateDictForEvent:info:", v7, a4))
  {
    FudLog();
    AnalyticsSendEvent();
  }
  else
  {
    FudLog();
  }
  FudLog();
}

- (BOOL)conformsToAllowedValuesForKey:(id)a3 value:(id)a4
{
  unsigned int v5 = [a3 isEqualToString:@"transportType"];
  if (v5)
  {
    if (([a4 isEqualToString:@"USB"] & 1) != 0
      || ([a4 isEqualToString:@"UART"] & 1) != 0
      || ([a4 isEqualToString:@"BT"] & 1) != 0
      || ([a4 isEqualToString:@"AirPlay"] & 1) != 0
      || ([a4 isEqualToString:@"AIDBus"] & 1) != 0
      || ([a4 isEqualToString:@"Scorpius"] & 1) != 0
      || ([a4 isEqualToString:@"EATransport"] & 1) != 0)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      LOBYTE(v5) = [a4 isEqualToString:@"Generic"];
    }
  }
  return v5;
}

- (void)progress:(double)a3
{
  pluginProgressWeights = self->pluginProgressWeights;
  double v6 = -1.0;
  if (pluginProgressWeights && (self->state - 8) <= 2)
  {
    [(FudProgressWeights *)pluginProgressWeights calculateOverallProgressWithStepProgress:a3 step:-1.0];
    double v6 = v7;
  }
  stateMachineDelegate = self->stateMachineDelegate;
  uint64_t v9 = LODWORD((&off_100095D98)[4 * self->state + 2]);
  [(FudStateMachineDelegate *)stateMachineDelegate stepProgress:v9 stateMachine:self progress:a3 overallProgress:v6];
}

- (void)log:(int)a3 format:(id)a4
{
  [(FudStateMachine *)self logv:*(void *)&a3 format:a4 arguments:&v4];
}

- (void)accessoryDisconnected:(id)a3
{
  workQueue = self->workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022DE0;
  v4[3] = &unk_10007D4B0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_group_async((dispatch_group_t)qword_1000975B0, workQueue, v4);
}

- (void)logv:(int)a3 format:(id)a4 arguments:(char *)a5
{
  uint64_t v7 = *(void *)&a3;
  stateMachineFilterName = self->stateMachineFilterName;
  uint64_t v10 = pthread_self();
  +[NSString stringWithFormat:@"<%@[%d] %p>: ", stateMachineFilterName, pthread_mach_thread_np(v10), self->plugin];
  FudLog();
  _FudLogv(v7, a4, a5);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->stateMachinePluginName forKey:@"PluginName"];
  [a3 encodeObject:self->stateMachineFilterName forKey:@"FilterName"];
  if (self->personalizer || self->needsDeviceList) {
    uint64_t state = 1;
  }
  else {
    uint64_t state = self->state;
  }
  [a3 encodeInt:state forKey:@"StateNumber"];
}

- (FudStateMachine)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)FudStateMachine;
  uint64_t v4 = [(FudStateMachine *)&v9 init];
  if (v4)
  {
    id v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"PluginName"];
    if (-[FudStateMachine initWithPluginName:filterName:delegate:options:](v4, "initWithPluginName:filterName:delegate:options:", v5, [a3 decodeObjectOfClass:objc_opt_class() forKey:@"FilterName"], 0, 0))
    {
      unsigned int v6 = [a3 decodeIntForKey:@"StateNumber"];
      v4->uint64_t state = v6;
      if (v6 < 0xC)
      {
        FudLog();
        return v4;
      }
      FudLog();
      uint64_t v7 = v4;
    }
    return 0;
  }
  return v4;
}

- (void)issueNotification:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    stateMachineDelegate = self->stateMachineDelegate;
    [(FudStateMachineDelegate *)stateMachineDelegate issueNotification:self request:a3];
  }
}

- (NSString)stateMachinePluginName
{
  return self->stateMachinePluginName;
}

- (NSString)stateMachineFilterName
{
  return self->stateMachineFilterName;
}

- (NSString)stateMachineRevision
{
  return self->stateMachineRevision;
}

- (NSDictionary)pluginOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setPluginOptions:(id)a3
{
}

- (FudStateMachineDelegate)delegate
{
  return self->stateMachineDelegate;
}

- (void)setDelegate:(id)a3
{
  self->stateMachineDelegate = (FudStateMachineDelegate *)a3;
}

- (BOOL)pluginForcedSilentUpdate
{
  return self->pluginForcedSilentUpdate;
}

- (AUDAccessory)accessory
{
  return (AUDAccessory *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAccessory:(id)a3
{
}

@end