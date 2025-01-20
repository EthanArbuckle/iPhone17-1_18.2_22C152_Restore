id sub_2460()
{
  void *v0;
  uint64_t vars8;

  if (qword_8008 != -1) {
    dispatch_once(&qword_8008, &stru_4040);
  }
  v0 = (void *)qword_8000;

  return v0;
}

void sub_24B4(id a1)
{
  qword_8000 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "general");

  _objc_release_x1();
}

id sub_24F8()
{
  if (qword_8018 != -1) {
    dispatch_once(&qword_8018, &stru_4060);
  }
  v0 = (void *)qword_8010;

  return v0;
}

void sub_254C(id a1)
{
  qword_8010 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "xpc");

  _objc_release_x1();
}

id sub_2590()
{
  if (qword_8028 != -1) {
    dispatch_once(&qword_8028, &stru_4080);
  }
  v0 = (void *)qword_8020;

  return v0;
}

void sub_25E4(id a1)
{
  qword_8020 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "heuristic");

  _objc_release_x1();
}

id sub_2628()
{
  if (qword_8038 != -1) {
    dispatch_once(&qword_8038, &stru_40A0);
  }
  v0 = (void *)qword_8030;

  return v0;
}

void sub_267C(id a1)
{
  qword_8030 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notifications");

  _objc_release_x1();
}

id sub_26C0()
{
  if (qword_8048 != -1) {
    dispatch_once(&qword_8048, &stru_40C0);
  }
  v0 = (void *)qword_8040;

  return v0;
}

void sub_2714(id a1)
{
  qword_8040 = (uint64_t)os_log_create("com.apple.duetexpertd.mm", "GENERAL");

  _objc_release_x1();
}

id sub_2758()
{
  if (qword_8058 != -1) {
    dispatch_once(&qword_8058, &stru_40E0);
  }
  v0 = (void *)qword_8050;

  return v0;
}

void sub_27AC(id a1)
{
  qword_8050 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "dailyroutines");

  _objc_release_x1();
}

id sub_27F0()
{
  if (qword_8068 != -1) {
    dispatch_once(&qword_8068, &stru_4100);
  }
  v0 = (void *)qword_8060;

  return v0;
}

void sub_2844(id a1)
{
  qword_8060 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "feedback");

  _objc_release_x1();
}

id sub_2888()
{
  if (qword_8078 != -1) {
    dispatch_once(&qword_8078, &stru_4120);
  }
  v0 = (void *)qword_8070;

  return v0;
}

void sub_28DC(id a1)
{
  qword_8070 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "modes");

  _objc_release_x1();
}

id sub_2920()
{
  if (qword_8088 != -1) {
    dispatch_once(&qword_8088, &stru_4140);
  }
  v0 = (void *)qword_8080;

  return v0;
}

void sub_2974(id a1)
{
  qword_8080 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "hero");

  _objc_release_x1();
}

id sub_29B8()
{
  if (qword_8098 != -1) {
    dispatch_once(&qword_8098, &stru_4160);
  }
  v0 = (void *)qword_8090;

  return v0;
}

void sub_2A0C(id a1)
{
  qword_8090 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "deletions");

  _objc_release_x1();
}

id sub_2A50()
{
  if (qword_80A8 != -1) {
    dispatch_once(&qword_80A8, &stru_4180);
  }
  v0 = (void *)qword_80A0;

  return v0;
}

void sub_2AA4(id a1)
{
  qword_80A0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "information");

  _objc_release_x1();
}

id sub_2AE8()
{
  if (qword_80B8 != -1) {
    dispatch_once(&qword_80B8, &stru_41A0);
  }
  v0 = (void *)qword_80B0;

  return v0;
}

void sub_2B3C(id a1)
{
  qword_80B0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "timeline");

  _objc_release_x1();
}

id sub_2B80()
{
  if (qword_80C8 != -1) {
    dispatch_once(&qword_80C8, &stru_41C0);
  }
  v0 = (void *)qword_80C0;

  return v0;
}

void sub_2BD4(id a1)
{
  qword_80C0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");

  _objc_release_x1();
}

id sub_2C18()
{
  if (qword_80D8 != -1) {
    dispatch_once(&qword_80D8, &stru_41E0);
  }
  v0 = (void *)qword_80D0;

  return v0;
}

void sub_2C6C(id a1)
{
  qword_80D0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "relevance_model");

  _objc_release_x1();
}

id sub_2CB0()
{
  if (qword_80E8 != -1) {
    dispatch_once(&qword_80E8, &stru_4200);
  }
  v0 = (void *)qword_80E0;

  return v0;
}

void sub_2D04(id a1)
{
  qword_80E0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "watch");

  _objc_release_x1();
}

id sub_2D48()
{
  if (qword_80F8 != -1) {
    dispatch_once(&qword_80F8, &stru_4220);
  }
  v0 = (void *)qword_80F0;

  return v0;
}

void sub_2D9C(id a1)
{
  qword_80F0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "UI");

  _objc_release_x1();
}

id sub_2DE0()
{
  if (qword_8108 != -1) {
    dispatch_once(&qword_8108, &stru_4240);
  }
  v0 = (void *)qword_8100;

  return v0;
}

void sub_2E34(id a1)
{
  qword_8100 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending");

  _objc_release_x1();
}

id sub_2E78()
{
  if (qword_8118 != -1) {
    dispatch_once(&qword_8118, &stru_4260);
  }
  v0 = (void *)qword_8110;

  return v0;
}

void sub_2ECC(id a1)
{
  qword_8110 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");

  _objc_release_x1();
}

id sub_2F10()
{
  if (qword_8128 != -1) {
    dispatch_once(&qword_8128, &stru_4280);
  }
  v0 = (void *)qword_8120;

  return v0;
}

void sub_2F64(id a1)
{
  qword_8120 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");

  _objc_release_x1();
}

id sub_2FA8()
{
  if (qword_8138 != -1) {
    dispatch_once(&qword_8138, &stru_42A0);
  }
  v0 = (void *)qword_8130;

  return v0;
}

void sub_2FFC(id a1)
{
  qword_8130 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "homescreen");

  _objc_release_x1();
}

id sub_3040()
{
  if (qword_8148 != -1) {
    dispatch_once(&qword_8148, &stru_42C0);
  }
  v0 = (void *)qword_8140;

  return v0;
}

void sub_3094(id a1)
{
  qword_8140 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "sleepschedule");

  _objc_release_x1();
}

id sub_30D8()
{
  if (qword_8158 != -1) {
    dispatch_once(&qword_8158, &stru_42E0);
  }
  v0 = (void *)qword_8150;

  return v0;
}

void sub_312C(id a1)
{
  qword_8150 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "lockscreen");

  _objc_release_x1();
}

id sub_3170()
{
  if (qword_8168 != -1) {
    dispatch_once(&qword_8168, &stru_4300);
  }
  v0 = (void *)qword_8160;

  return v0;
}

void sub_31C4(id a1)
{
  qword_8160 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "anchor");

  _objc_release_x1();
}

id sub_3208()
{
  if (qword_8178 != -1) {
    dispatch_once(&qword_8178, &stru_4320);
  }
  v0 = (void *)qword_8170;

  return v0;
}

void sub_325C(id a1)
{
  qword_8170 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_prediction");

  _objc_release_x1();
}

id sub_32A0()
{
  if (qword_8188 != -1) {
    dispatch_once(&qword_8188, &stru_4340);
  }
  v0 = (void *)qword_8180;

  return v0;
}

void sub_32F4(id a1)
{
  qword_8180 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "action_prediction");

  _objc_release_x1();
}

id sub_3338()
{
  if (qword_8198 != -1) {
    dispatch_once(&qword_8198, &stru_4360);
  }
  v0 = (void *)qword_8190;

  return v0;
}

void sub_338C(id a1)
{
  qword_8190 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_library");

  _objc_release_x1();
}

id sub_33D0()
{
  if (qword_81A8 != -1) {
    dispatch_once(&qword_81A8, &stru_4380);
  }
  v0 = (void *)qword_81A0;

  return v0;
}

void sub_3424(id a1)
{
  qword_81A0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "app_install");

  _objc_release_x1();
}

id sub_3468()
{
  if (qword_81B8 != -1) {
    dispatch_once(&qword_81B8, &stru_43A0);
  }
  v0 = (void *)qword_81B0;

  return v0;
}

void sub_34BC(id a1)
{
  qword_81B0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "backup");

  _objc_release_x1();
}

id sub_3500()
{
  if (qword_81C8 != -1) {
    dispatch_once(&qword_81C8, &stru_43C0);
  }
  v0 = (void *)qword_81C0;

  return v0;
}

void sub_3554(id a1)
{
  qword_81C0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "metrics");

  _objc_release_x1();
}

id sub_3598()
{
  if (qword_81D8 != -1) {
    dispatch_once(&qword_81D8, &stru_43E0);
  }
  v0 = (void *)qword_81D0;

  return v0;
}

void sub_35EC(id a1)
{
  qword_81D0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "trial_assets");

  _objc_release_x1();
}

id sub_3630()
{
  if (qword_81E8 != -1) {
    dispatch_once(&qword_81E8, &stru_4400);
  }
  v0 = (void *)qword_81E0;

  return v0;
}

void sub_3684(id a1)
{
  qword_81E0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_management");

  _objc_release_x1();
}

id sub_36C8()
{
  if (qword_81F8 != -1) {
    dispatch_once(&qword_81F8, &stru_4420);
  }
  v0 = (void *)qword_81F0;

  return v0;
}

void sub_371C(id a1)
{
  qword_81F0 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextual_actions");

  _objc_release_x1();
}

id sub_3760()
{
  if (qword_8208 != -1) {
    dispatch_once(&qword_8208, &stru_4440);
  }
  v0 = (void *)qword_8200;

  return v0;
}

void sub_37B4(id a1)
{
  qword_8200 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "intents_helper");

  _objc_release_x1();
}

id sub_37F8()
{
  if (qword_8218 != -1) {
    dispatch_once(&qword_8218, &stru_4460);
  }
  v0 = (void *)qword_8210;

  return v0;
}

void sub_384C(id a1)
{
  qword_8210 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "context_heuristic");

  _objc_release_x1();
}

id sub_3890()
{
  if (qword_8228 != -1) {
    dispatch_once(&qword_8228, &stru_4480);
  }
  v0 = (void *)qword_8220;

  return v0;
}

void sub_38E4(id a1)
{
  qword_8220 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "zkw_hide");

  _objc_release_x1();
}

id sub_3928()
{
  if (qword_8238 != -1) {
    dispatch_once(&qword_8238, &stru_44A0);
  }
  v0 = (void *)qword_8230;

  return v0;
}

void sub_397C(id a1)
{
  qword_8230 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");

  _objc_release_x1();
}

id sub_39C0()
{
  if (qword_8248 != -1) {
    dispatch_once(&qword_8248, &stru_44C0);
  }
  v0 = (void *)qword_8240;

  return v0;
}

void sub_3A14(id a1)
{
  qword_8240 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "time");

  _objc_release_x1();
}

id sub_3A58()
{
  if (qword_8258 != -1) {
    dispatch_once(&qword_8258, &stru_44E0);
  }
  v0 = (void *)qword_8250;

  return v0;
}

void sub_3AAC(id a1)
{
  qword_8250 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "contextualengine");

  _objc_release_x1();
}

id sub_3AF0()
{
  if (qword_8268 != -1) {
    dispatch_once(&qword_8268, &stru_4500);
  }
  v0 = (void *)qword_8260;

  return v0;
}

void sub_3B44(id a1)
{
  qword_8260 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "usage_insights");

  _objc_release_x1();
}

id sub_3B88()
{
  if (qword_8278 != -1) {
    dispatch_once(&qword_8278, &stru_4520);
  }
  v0 = (void *)qword_8270;

  return v0;
}

void sub_3BDC(id a1)
{
  qword_8270 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "notification_categorization");

  _objc_release_x1();
}

id sub_3C20()
{
  if (qword_8288 != -1) {
    dispatch_once(&qword_8288, &stru_4540);
  }
  v0 = (void *)qword_8280;

  return v0;
}

void sub_3C74(id a1)
{
  qword_8280 = (uint64_t)os_log_create("com.apple.duetexpertd.atx", "settings_actions");

  _objc_release_x1();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}