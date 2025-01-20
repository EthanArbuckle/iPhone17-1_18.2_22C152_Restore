@interface SAClassRegistry
+ (Class)classForAceClassName:(id)a3 inGroupWithIdentifier:(id)a4;
+ (id)sharedClassRegistry;
+ (void)initialize;
+ (void)registerAcronym:(id)a3 forGroupWithIdentifier:(id)a4;
+ (void)registerClass:(Class)a3 forAceClassName:(id)a4 inGroupWithIdentifier:(id)a5;
- (Class)classForAceClassWithName:(id)a3 inGroupWithIdentifier:(id)a4;
- (void)registerClass:(Class)a3 forAceClassWithName:(id)a4 inGroupWithIdentifier:(id)a5;
@end

@implementation SAClassRegistry

+ (id)sharedClassRegistry
{
  if (qword_1EB4EC9E8 != -1) {
    dispatch_once(&qword_1EB4EC9E8, &__block_literal_global_0);
  }
  v2 = (void *)_MergedGlobals_1;
  return v2;
}

uint64_t __38__SAClassRegistry_sharedClassRegistry__block_invoke()
{
  _MergedGlobals_1 = objc_alloc_init(SAClassRegistry);
  return MEMORY[0x1F41817F8]();
}

+ (void)initialize
{
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_2);
  }
}

void __29__SAClassRegistry_initialize__block_invoke()
{
  v9[71] = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v8[0] = @"com.apple.ace.contact";
  v8[1] = @"com.apple.ace.acousticid";
  v9[0] = @"SAAB";
  v9[1] = @"SAAI";
  v8[2] = @"com.apple.ace.alarm";
  v8[3] = @"com.apple.ace.answer";
  v9[2] = @"SAAlarm";
  v9[3] = @"SAAnswer";
  v8[4] = @"com.apple.ace.apps";
  v8[5] = @"com.apple.ace.alternatives";
  v9[4] = @"SAApps";
  v9[5] = @"SAAR";
  v8[6] = @"com.apple.ace.attention";
  v8[7] = @"com.apple.ace.accessibility";
  v9[6] = @"SAAttention";
  v9[7] = @"SAAX";
  v8[8] = @"com.apple.ace.calendar";
  v8[9] = @"com.apple.ace.ui.card";
  v9[8] = @"SACalendar";
  v9[9] = @"SACard";
  v8[10] = @"com.apple.ace.clientflow";
  v8[11] = @"com.apple.ace.client.local.messages";
  v9[10] = @"SACF";
  v9[11] = @"SACFM";
  v8[12] = @"com.apple.ace.clientflow.local.pex";
  v8[13] = @"com.apple.ace.clock";
  v9[12] = @"SACFPEX";
  v9[13] = @"SAClock";
  v8[14] = @"com.apple.ace.dailybriefing";
  v8[15] = @"com.apple.ace.devicecontrol";
  v9[14] = @"SADailyBriefing";
  v9[15] = @"SADeviceControl";
  v8[16] = @"com.apple.ace.device";
  v8[17] = @"com.apple.ace.diagnostic";
  v9[16] = @"SADevice";
  v9[17] = @"SADIAG";
  v8[18] = @"com.apple.ace.dialog";
  v8[19] = @"com.apple.ace.devicePlaySound";
  v9[18] = @"SADialog";
  v9[19] = @"SADP";
  v8[20] = @"com.apple.ace.execution";
  v8[21] = @"com.apple.ace.email";
  v9[20] = @"SAE";
  v9[21] = @"SAEmail";
  v8[22] = @"com.apple.ace.fmf";
  v8[23] = @"com.apple.ace.generalknowledge";
  v9[22] = @"SAFmf";
  v9[23] = @"SAGK";
  v8[24] = @"com.apple.ace.glance";
  v8[25] = @"com.apple.ace.system";
  v9[24] = @"SAGL";
  v9[25] = @"SA";
  v8[26] = @"com.apple.ace.guidance";
  v8[27] = @"com.apple.ace.homeautomation";
  v9[26] = @"SAGuidance";
  v9[27] = @"SAHA";
  v8[28] = @"com.apple.ace.health";
  v8[29] = @"com.apple.ace.homecommunication";
  v9[28] = @"SAHL";
  v9[29] = @"SAHomeCommunication";
  v8[30] = @"com.apple.ace.iCloud";
  v8[31] = @"com.apple.ace.command.assistant.intent";
  v9[30] = @"SAiCloud";
  v9[31] = @"SAIntentGroup";
  v8[32] = @"com.apple.ace.knowledgeStore";
  v8[33] = @"com.apple.ace.livecontent";
  v9[32] = @"SAKnowledge";
  v9[33] = @"SALCM";
  v8[34] = @"com.apple.ace.localsearch";
  v8[35] = @"com.apple.ace.mac";
  v9[34] = @"SALocalSearch";
  v9[35] = @"SAMac";
  v8[36] = @"com.apple.ace.microblog";
  v8[37] = @"com.apple.ace.movie";
  v9[36] = @"SAMicroblog";
  v9[37] = @"SAMovie";
  v8[38] = @"com.apple.ace.movieV2";
  v8[39] = @"com.apple.ace.media";
  v9[38] = @"SAMovieV2";
  v9[39] = @"SAMP";
  v8[40] = @"com.apple.ace.note";
  v8[41] = @"com.apple.ace.notification";
  v9[40] = @"SANote";
  v9[41] = @"SANotification";
  v8[42] = @"com.apple.ace.nowplaying";
  v8[43] = @"com.apple.ace.nowplaying.video";
  v9[42] = @"SANP";
  v9[43] = @"SANPVideo";
  v8[44] = @"com.apple.ace.phone";
  v8[45] = @"com.apple.ace.profile";
  v9[44] = @"SAPhone";
  v9[45] = @"SAProfile";
  v8[46] = @"com.apple.ace.radar";
  v8[47] = @"com.apple.ace.requestdispatch";
  v9[46] = @"SARadar";
  v9[47] = @"SARD";
  v8[48] = @"com.apple.ace.remembers";
  v8[49] = @"com.apple.ace.reminder";
  v9[48] = @"SARemembers";
  v9[49] = @"SAReminder";
  v8[50] = @"com.apple.ace.restaurant";
  v8[51] = @"com.apple.ace.onscreenaction";
  v9[50] = @"SARestaurant";
  v9[51] = @"SAScreenAction";
  v8[52] = @"com.apple.ace.setting";
  v8[53] = @"com.apple.ace.speech";
  v9[52] = @"SASetting";
  v9[53] = @"SAS";
  v8[54] = @"com.apple.ace.sms";
  v8[55] = @"com.apple.ace.sports";
  v9[54] = @"SASms";
  v9[55] = @"SASports";
  v8[56] = @"com.apple.ace.templates";
  v8[57] = @"com.apple.ace.stock";
  v9[56] = @"SAST";
  v9[57] = @"SAStock";
  v8[58] = @"com.apple.ace.vector";
  v8[59] = @"com.apple.ace.stopwatch";
  v9[58] = @"SASV";
  v9[59] = @"SASW";
  v8[60] = @"com.apple.ace.sync";
  v8[61] = @"com.apple.ace.timer";
  v9[60] = @"SASync";
  v9[61] = @"SATimer";
  v8[62] = @"com.apple.ace.tts";
  v8[63] = @"com.apple.ace.assistant";
  v9[62] = @"SATTS";
  v9[63] = @"SAUI";
  v8[64] = @"com.apple.ace.ui.lite";
  v9[64] = @"SAUIL";
  v8[65] = @"com.apple.ace.ui.templates";
  v9[65] = @"SAUITemplate";
  v8[66] = @"com.apple.ace.universalsearch";
  v9[66] = @"SAUS";
  v8[67] = @"com.apple.ace.videocontent";
  v9[67] = @"SAVCS";
  v8[68] = @"com.apple.ace.weather";
  v9[68] = @"SAWeather";
  v8[69] = @"com.apple.ace.websearch";
  v9[69] = @"SAWeb";
  v8[70] = @"com.apple.ace.watchlist";
  v9[70] = @"SAWL";
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:71];
  uint64_t v2 = [v0 initWithDictionary:v1];
  v3 = (void *)qword_1EB4EC9F0;
  qword_1EB4EC9F0 = v2;

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v5 = (void *)qword_1EB4EC9F8;
  qword_1EB4EC9F8 = (uint64_t)v4;

  dispatch_queue_t v6 = dispatch_queue_create("SAClassRegistry", 0);
  v7 = (void *)qword_1EB4ECA00;
  qword_1EB4ECA00 = (uint64_t)v6;
}

+ (void)registerAcronym:(id)a3 forGroupWithIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = qword_1EB4ECA00;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__SAClassRegistry_registerAcronym_forGroupWithIdentifier___block_invoke;
  v10[3] = &unk_1E5CDDF60;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, v10);
}

uint64_t __58__SAClassRegistry_registerAcronym_forGroupWithIdentifier___block_invoke(uint64_t a1)
{
  return [(id)qword_1EB4EC9F0 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

- (void)registerClass:(Class)a3 forAceClassWithName:(id)a4 inGroupWithIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = qword_1EB4ECA00;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__SAClassRegistry_registerClass_forAceClassWithName_inGroupWithIdentifier___block_invoke;
  v13[3] = &unk_1E5CDDF88;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  Class v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(v10, v13);
}

uint64_t __75__SAClassRegistry_registerClass_forAceClassWithName_inGroupWithIdentifier___block_invoke(void *a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v4 = a1[6];
  uint64_t v3 = a1[7];
  uint64_t v5 = a1[5];
  return [v2 registerClass:v3 forAceClassName:v5 inGroupWithIdentifier:v4];
}

+ (void)registerClass:(Class)a3 forAceClassName:(id)a4 inGroupWithIdentifier:(id)a5
{
  id v9 = a4;
  id v7 = a5;
  id v8 = [(id)qword_1EB4EC9F8 objectForKey:v7];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(id)qword_1EB4EC9F8 setObject:v8 forKey:v7];
  }
  [v8 setObject:a3 forKey:v9];
}

- (Class)classForAceClassWithName:(id)a3 inGroupWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() classForAceClassName:v6 inGroupWithIdentifier:v5];

  return (Class)v7;
}

+ (Class)classForAceClassName:(id)a3 inGroupWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2050000000;
  uint64_t v21 = 0;
  id v8 = qword_1EB4ECA00;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__SAClassRegistry_classForAceClassName_inGroupWithIdentifier___block_invoke;
  v13[3] = &unk_1E5CDDFB0;
  id v14 = v7;
  id v15 = v6;
  Class v16 = &v18;
  id v17 = a1;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v13);
  id v11 = (id)v19[3];

  _Block_object_dispose(&v18, 8);
  return (Class)v11;
}

void __62__SAClassRegistry_classForAceClassName_inGroupWithIdentifier___block_invoke(uint64_t a1)
{
  id v7 = [(id)qword_1EB4EC9F8 objectForKey:*(void *)(a1 + 32)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 objectForKey:*(void *)(a1 + 40)];
  uint64_t v2 = v7;
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = [(id)qword_1EB4EC9F0 objectForKey:*(void *)(a1 + 32)];
    uint64_t v4 = [v3 stringByAppendingString:*(void *)(a1 + 40)];
    id v5 = v4;
    if (v4) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = NSClassFromString(v4);
    }
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    if (v6) {
      [*(id *)(a1 + 56) registerClass:v6 forAceClassName:*(void *)(a1 + 40) inGroupWithIdentifier:*(void *)(a1 + 32)];
    }

    uint64_t v2 = v7;
  }
}

@end