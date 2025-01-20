@interface MRLogForCategory
@end

@implementation MRLogForCategory

uint64_t ___MRLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.amp.mediaremote", "MediaRemote");
  v1 = (void *)_MRLogForCategory___logs[0];
  _MRLogForCategory___logs[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.amp.mediaremote", "NowPlaying");
  v3 = (void *)qword_1EB46FC88;
  qword_1EB46FC88 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.amp.mediaremote", "RemoteControl");
  v5 = (void *)qword_1EB46FC90;
  qword_1EB46FC90 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.amp.mediaremote", "ExternalDevice");
  v7 = (void *)qword_1EB46FC98;
  qword_1EB46FC98 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.amp.mediaremote", "Television");
  v9 = (void *)qword_1EB46FCA0;
  qword_1EB46FCA0 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.amp.mediaremote", "AudioInputPlugin");
  v11 = (void *)qword_1EB46FCA8;
  qword_1EB46FCA8 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.amp.mediaremote", "Assertion");
  v13 = (void *)qword_1EB46FCB0;
  qword_1EB46FCB0 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.amp.mediaremote", "Proximity");
  v15 = (void *)qword_1EB46FCB8;
  qword_1EB46FCB8 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.amp.mediaremote", "XPC");
  v17 = (void *)qword_1EB46FCC0;
  qword_1EB46FCC0 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.amp.mediaremote", "IDS");
  v19 = (void *)qword_1EB46FCC8;
  qword_1EB46FCC8 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.amp.mediaremote", "rr");
  v21 = (void *)qword_1EB46FCD0;
  qword_1EB46FCD0 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.amp.mediaremote", "UI");
  v23 = (void *)qword_1EB46FCD8;
  qword_1EB46FCD8 = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.amp.mediaremote", "GroupSession");
  v25 = (void *)qword_1EB46FCE0;
  qword_1EB46FCE0 = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.amp.mediaremote", "RouteRecommendation");
  v27 = (void *)qword_1EB46FCE8;
  qword_1EB46FCE8 = (uint64_t)v26;

  qword_1EB46FCF0 = (uint64_t)os_log_create("com.apple.amp.mediaremote", "GroupSessionOversize");

  return MEMORY[0x1F41817F8]();
}

@end