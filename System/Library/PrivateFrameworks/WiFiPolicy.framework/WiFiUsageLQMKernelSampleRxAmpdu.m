@interface WiFiUsageLQMKernelSampleRxAmpdu
+ (id)featureFromFieldName:(id)a3;
+ (id)sampleWithStruct:(apple80211_rx_ampdu_lqmct_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5;
- (NSDate)timestamp;
- (WiFiUsageLQMKernelSampleRxAmpdu)initWithStruct:(apple80211_rx_ampdu_lqmct_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5;
- (double)duration;
- (unint64_t)rxAddBaReq;
- (unint64_t)rxAmpdu;
- (unint64_t)rxAmpduAll;
- (unint64_t)rxBarOverRxAmpdu;
- (unint64_t)rxDelBa;
- (unint64_t)rxDup;
- (unint64_t)rxHoles;
- (unint64_t)rxMpduDensity;
- (unint64_t)rxOos;
- (unint64_t)rxOow;
- (unint64_t)rxQueuedOverRxAmpdu;
- (unint64_t)rxStuck;
- (unint64_t)txAddBaResp;
- (unint64_t)txDelBa;
- (void)setDuration:(double)a3;
- (void)setRxAddBaReq:(unint64_t)a3;
- (void)setRxAmpdu:(unint64_t)a3;
- (void)setRxAmpduAll:(unint64_t)a3;
- (void)setRxBarOverRxAmpdu:(unint64_t)a3;
- (void)setRxDelBa:(unint64_t)a3;
- (void)setRxDup:(unint64_t)a3;
- (void)setRxHoles:(unint64_t)a3;
- (void)setRxMpduDensity:(unint64_t)a3;
- (void)setRxOos:(unint64_t)a3;
- (void)setRxOow:(unint64_t)a3;
- (void)setRxQueuedOverRxAmpdu:(unint64_t)a3;
- (void)setRxStuck:(unint64_t)a3;
- (void)setTimestamp:(id)a3;
- (void)setTxAddBaResp:(unint64_t)a3;
- (void)setTxDelBa:(unint64_t)a3;
@end

@implementation WiFiUsageLQMKernelSampleRxAmpdu

+ (id)sampleWithStruct:(apple80211_rx_ampdu_lqmct_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5
{
  id v7 = a4;
  uint64_t var0 = a3->var0;
  if (var0)
  {
    NSLog(&cfstr_SUnknownVersio.isa, "+[WiFiUsageLQMKernelSampleRxAmpdu sampleWithStruct:WithReferenceDate:AsNsec:]", var0);
    v9 = 0;
  }
  else
  {
    v9 = [[WiFiUsageLQMKernelSampleRxAmpdu alloc] initWithStruct:a3 WithReferenceDate:v7 AsNsec:a5];
  }

  return v9;
}

- (WiFiUsageLQMKernelSampleRxAmpdu)initWithStruct:(apple80211_rx_ampdu_lqmct_stats *)a3 WithReferenceDate:(id)a4 AsNsec:(unint64_t)a5
{
  v18.receiver = self;
  v18.super_class = (Class)WiFiUsageLQMKernelSampleRxAmpdu;
  id v7 = a4;
  v8 = [(WiFiUsageLQMKernelSampleRxAmpdu *)&v18 init];
  uint64_t v9 = +[WiFiUsageLQMTransformations dateWithMachContinuousTime:WithRef:asNS:](WiFiUsageLQMTransformations, "dateWithMachContinuousTime:WithRef:asNS:", *(void *)(&a3->var0 + 1), v7, a5, v18.receiver, v18.super_class);

  timestamp = v8->_timestamp;
  v8->_timestamp = (NSDate *)v9;

  unint64_t var1_high = HIDWORD(a3->var1);
  uint64_t var2 = a3->var2;
  v8->_rxAmpdu = var1_high;
  v8->_rxMpduDensity = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", var2, var1_high, +[WiFiUsageLQMTransformations mpduDensityScale]);
  v8->_rxBarOverRxAmpdu = +[WiFiUsageLQMTransformations ratioWithValue:Over:WithScale:](WiFiUsageLQMTransformations, "ratioWithValue:Over:WithScale:", a3->var10, v8->_rxAmpdu, +[WiFiUsageLQMTransformations mpduDensityScale]);
  v8->_rxQueuedOverRxAmpdu = +[WiFiUsageLQMTransformations ratioWithValue:a3->var13 Over:v8->_rxAmpdu WithScale:1];
  unint64_t var7 = a3->var7;
  v8->_rxAddBaReq = a3->var8;
  v8->_txAddBaResp = a3->var9;
  unint64_t var11 = a3->var11;
  v8->_txDelBa = var11;
  v8->_rxDelBa = var11;
  v8->_rxAmpduAll = HIDWORD(a3->var1);
  unint64_t var4 = a3->var4;
  v8->_rxHoles = a3->var3;
  v8->_rxDup = var4;
  unint64_t var6 = a3->var6;
  v8->_rxStuck = a3->var5;
  v8->_rxOow = var6;
  v8->_rxOos = var7;
  return v8;
}

+ (id)featureFromFieldName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", @"rxAmpdu", @"median", @"rxMpduDensity", @"median", @"rxBarOverRxAmpdu", @"median", @"rxQueuedOverRxAmpdu", @"sum", @"rxAddBaReq", @"sum", @"txAddBaResp", @"sum", @"txDelBa", @"sum", @"rxDelBa", @"sum", @"rxAmpduAll",
    @"sum",
    @"rxHoles",
    @"sum",
    @"rxDup",
    @"sum",
    @"rxStuck",
    @"sum",
    @"rxOow",
    @"sum",
    @"rxOos",
  v5 = 0);
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (unint64_t)rxAmpdu
{
  return self->_rxAmpdu;
}

- (void)setRxAmpdu:(unint64_t)a3
{
  self->_rxAmpdu = a3;
}

- (unint64_t)rxMpduDensity
{
  return self->_rxMpduDensity;
}

- (void)setRxMpduDensity:(unint64_t)a3
{
  self->_rxMpduDensity = a3;
}

- (unint64_t)rxBarOverRxAmpdu
{
  return self->_rxBarOverRxAmpdu;
}

- (void)setRxBarOverRxAmpdu:(unint64_t)a3
{
  self->_rxBarOverRxAmpdu = a3;
}

- (unint64_t)rxQueuedOverRxAmpdu
{
  return self->_rxQueuedOverRxAmpdu;
}

- (void)setRxQueuedOverRxAmpdu:(unint64_t)a3
{
  self->_rxQueuedOverRxAmpdu = a3;
}

- (unint64_t)rxAmpduAll
{
  return self->_rxAmpduAll;
}

- (void)setRxAmpduAll:(unint64_t)a3
{
  self->_rxAmpduAll = a3;
}

- (unint64_t)rxHoles
{
  return self->_rxHoles;
}

- (void)setRxHoles:(unint64_t)a3
{
  self->_rxHoles = a3;
}

- (unint64_t)rxDup
{
  return self->_rxDup;
}

- (void)setRxDup:(unint64_t)a3
{
  self->_rxDup = a3;
}

- (unint64_t)rxStuck
{
  return self->_rxStuck;
}

- (void)setRxStuck:(unint64_t)a3
{
  self->_rxStuck = a3;
}

- (unint64_t)rxOow
{
  return self->_rxOow;
}

- (void)setRxOow:(unint64_t)a3
{
  self->_rxOow = a3;
}

- (unint64_t)rxOos
{
  return self->_rxOos;
}

- (void)setRxOos:(unint64_t)a3
{
  self->_rxOos = a3;
}

- (unint64_t)rxAddBaReq
{
  return self->_rxAddBaReq;
}

- (void)setRxAddBaReq:(unint64_t)a3
{
  self->_rxAddBaReq = a3;
}

- (unint64_t)txAddBaResp
{
  return self->_txAddBaResp;
}

- (void)setTxAddBaResp:(unint64_t)a3
{
  self->_txAddBaResp = a3;
}

- (unint64_t)txDelBa
{
  return self->_txDelBa;
}

- (void)setTxDelBa:(unint64_t)a3
{
  self->_txDelBa = a3;
}

- (unint64_t)rxDelBa
{
  return self->_rxDelBa;
}

- (void)setRxDelBa:(unint64_t)a3
{
  self->_rxDelBa = a3;
}

- (void).cxx_destruct
{
}

@end