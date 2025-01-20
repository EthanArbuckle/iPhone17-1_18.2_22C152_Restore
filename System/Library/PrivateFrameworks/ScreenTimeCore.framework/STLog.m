@interface STLog
+ (NSDictionary)logCategories;
+ (OS_os_log)accountState;
+ (OS_os_log)apns;
+ (OS_os_log)appInfo;
+ (OS_os_log)appMonitor;
+ (OS_os_log)ask;
+ (OS_os_log)askClient;
+ (OS_os_log)backgroundActivity;
+ (OS_os_log)blueprint;
+ (OS_os_log)cachingCodableStore;
+ (OS_os_log)checkpoint;
+ (OS_os_log)cloudkit;
+ (OS_os_log)communicationClient;
+ (OS_os_log)communicationSafety;
+ (OS_os_log)conduit;
+ (OS_os_log)contactStorePrimitives;
+ (OS_os_log)contactsService;
+ (OS_os_log)conversation;
+ (OS_os_log)coreAnalytics;
+ (OS_os_log)coreAnimation;
+ (OS_os_log)coreDataConfigurationStore;
+ (OS_os_log)coreDataObserver;
+ (OS_os_log)coreDataTransformer;
+ (OS_os_log)coreDataValidation;
+ (OS_os_log)daemon;
+ (OS_os_log)defaultUserPolicyApplicator;
+ (OS_os_log)deviceCapabilitiesClient;
+ (OS_os_log)deviceInformationPrimitives;
+ (OS_os_log)deviceState;
+ (OS_os_log)downtimeClient;
+ (OS_os_log)eyeReliefStateWriter;
+ (OS_os_log)family;
+ (OS_os_log)familyCirclePrimitives;
+ (OS_os_log)familyCommunicationService;
+ (OS_os_log)familyInformationProvider;
+ (OS_os_log)familyMemberGenesisStateStore;
+ (OS_os_log)familyMessaging;
+ (OS_os_log)familyScreenTimeManager;
+ (OS_os_log)familySettingsManager;
+ (OS_os_log)fileBackedKeyValueStore;
+ (OS_os_log)idsMessageTransport;
+ (OS_os_log)idsTransport;
+ (OS_os_log)idsTransportMessageAddressMap;
+ (OS_os_log)idsTransportMessageIdentifierMap;
+ (OS_os_log)idsTransportPrimitives;
+ (OS_os_log)managementStateObserver;
+ (OS_os_log)messageTrackingTransportEnvoy;
+ (OS_os_log)messageTrackingTransportService;
+ (OS_os_log)mirroring;
+ (OS_os_log)oneMoreMinuteManager;
+ (OS_os_log)organizationControllerConfigurationAdapter;
+ (OS_os_log)passcodeAuthenticationProviderService;
+ (OS_os_log)passcodeProviderService;
+ (OS_os_log)payload;
+ (OS_os_log)payloadManager;
+ (OS_os_log)payloadQueue;
+ (OS_os_log)persistence;
+ (OS_os_log)personal;
+ (OS_os_log)pinController;
+ (OS_os_log)pinService;
+ (OS_os_log)privateService;
+ (OS_os_log)promise;
+ (OS_os_log)reactor;
+ (OS_os_log)reactorCore;
+ (OS_os_log)reactorDirectiveProcessor;
+ (OS_os_log)reactorTool;
+ (OS_os_log)remoteViewService;
+ (OS_os_log)requestManager;
+ (OS_os_log)restrictionsMigrator;
+ (OS_os_log)screenTimeOrganizationController;
+ (OS_os_log)screentime;
+ (OS_os_log)settingsService;
+ (OS_os_log)setupClient;
+ (OS_os_log)test;
+ (OS_os_log)tool;
+ (OS_os_log)transaction;
+ (OS_os_log)transportServiceMessageLedger;
+ (OS_os_log)usage;
+ (OS_os_log)userNotifications;
+ (OS_os_log)userSafetyPolicyWriter;
+ (OS_os_log)utility;
+ (OS_os_log)v2Disable;
+ (OS_os_log)versionVector;
+ (OS_os_log)xpcServiceProvider;
@end

@implementation STLog

+ (OS_os_log)screenTimeOrganizationController
{
  v2 = +[STLog logCategories];
  v3 = [v2 objectForKeyedSubscript:@"screenTimeOrganizationController"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)reactor
{
  v2 = +[STLog logCategories];
  v3 = [v2 objectForKeyedSubscript:@"reactor"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)communicationClient
{
  v2 = +[STLog logCategories];
  v3 = [v2 objectForKeyedSubscript:@"communicationClient"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)ask
{
  v2 = +[STLog logCategories];
  v3 = [v2 objectForKeyedSubscript:@"ask"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)screentime
{
  v2 = +[STLog logCategories];
  v3 = [v2 objectForKeyedSubscript:@"screentime"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)xpcServiceProvider
{
  v2 = +[STLog logCategories];
  v3 = [v2 objectForKeyedSubscript:@"xpcServiceProvider"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)conversation
{
  v2 = +[STLog logCategories];
  v3 = [v2 objectForKeyedSubscript:@"conversation"];

  return (OS_os_log *)v3;
}

+ (NSDictionary)logCategories
{
  if (logCategories_onceToken != -1) {
    dispatch_once(&logCategories_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)_logCategories;
  return (NSDictionary *)v2;
}

void __22__STLog_logCategories__block_invoke()
{
  v84[81] = *MEMORY[0x1E4F143B8];
  v83[0] = @"accountState";
  os_log_t v82 = os_log_create("com.apple.screentime.core", "accountState");
  v84[0] = v82;
  v83[1] = @"appInfo";
  os_log_t v81 = os_log_create("com.apple.screentime.core", "appInfo");
  v84[1] = v81;
  v83[2] = @"appMonitor";
  os_log_t v80 = os_log_create("com.apple.screentime.core", "appMonitor");
  v84[2] = v80;
  v83[3] = @"apns";
  os_log_t v79 = os_log_create("com.apple.screentime.core", "apns");
  v84[3] = v79;
  v83[4] = @"ask";
  os_log_t v78 = os_log_create("com.apple.screentime.core", "ask");
  v84[4] = v78;
  v83[5] = @"blueprint";
  os_log_t v77 = os_log_create("com.apple.screentime.core", "blueprint");
  v84[5] = v77;
  v83[6] = @"checkpoint";
  os_log_t v76 = os_log_create("com.apple.screentime.core", "checkpoint");
  v84[6] = v76;
  v83[7] = @"cloudkit";
  os_log_t v75 = os_log_create("com.apple.screentime.core", "cloudkit");
  v84[7] = v75;
  v83[8] = @"communicationSafety";
  os_log_t v74 = os_log_create("com.apple.screentime.core", "communicationSafety");
  v84[8] = v74;
  v83[9] = @"conduit";
  os_log_t v73 = os_log_create("com.apple.screentime.core", "conduit");
  v84[9] = v73;
  v83[10] = @"contactsService";
  os_log_t v72 = os_log_create("com.apple.screentime.core", "contactsService");
  v84[10] = v72;
  v83[11] = @"conversation";
  os_log_t v71 = os_log_create("com.apple.screentime.core", "conversation");
  v84[11] = v71;
  v83[12] = @"coreAnalytics";
  os_log_t v70 = os_log_create("com.apple.screentime.core", "coreAnalytics");
  v84[12] = v70;
  v83[13] = @"coreAnimation";
  os_log_t v69 = os_log_create("com.apple.screentime.core", "coreAnimation");
  v84[13] = v69;
  v83[14] = @"daemon";
  os_log_t v68 = os_log_create("com.apple.screentime.core", "daemon");
  v84[14] = v68;
  v83[15] = @"deviceState";
  os_log_t v67 = os_log_create("com.apple.screentime.core", "deviceState");
  v84[15] = v67;
  v83[16] = @"family";
  os_log_t v66 = os_log_create("com.apple.screentime.core", "family");
  v84[16] = v66;
  v83[17] = @"familyScreenTimeManager";
  os_log_t v65 = os_log_create("com.apple.screentime.core", "familyScreenTimeManager");
  v84[17] = v65;
  v83[18] = @"familySettingsManager";
  os_log_t v64 = os_log_create("com.apple.screentime.core", "familySettingsManager");
  v84[18] = v64;
  v83[19] = @"idsTransport";
  os_log_t v63 = os_log_create("com.apple.screentime.core", "idsTransport");
  v84[19] = v63;
  v83[20] = @"managementStateObserver";
  os_log_t v62 = os_log_create("com.apple.screentime.core", "managementStateObserver");
  v84[20] = v62;
  v83[21] = @"mirroring";
  os_log_t v61 = os_log_create("com.apple.screentime.core", "mirroring");
  v84[21] = v61;
  v83[22] = @"oneMoreMinuteManager";
  os_log_t v60 = os_log_create("com.apple.screentime.core", "oneMoreMinuteManager");
  v84[22] = v60;
  v83[23] = @"payload";
  os_log_t v59 = os_log_create("com.apple.screentime.core", "payload");
  v84[23] = v59;
  v83[24] = @"payloadManager";
  os_log_t v58 = os_log_create("com.apple.screentime.core", "payloadManager");
  v84[24] = v58;
  v83[25] = @"payloadQueue";
  os_log_t v57 = os_log_create("com.apple.screentime.core", "payloadQueue");
  v84[25] = v57;
  v83[26] = @"persistence";
  os_log_t v56 = os_log_create("com.apple.screentime.core", "persistence");
  v84[26] = v56;
  v83[27] = @"personal";
  os_log_t v55 = os_log_create("com.apple.screentime.core", "personal");
  v84[27] = v55;
  v83[28] = @"pinController";
  os_log_t v54 = os_log_create("com.apple.screentime.core", "pinController");
  v84[28] = v54;
  v83[29] = @"pinService";
  os_log_t v53 = os_log_create("com.apple.screentime.core", "pinService");
  v84[29] = v53;
  v83[30] = @"privateService";
  os_log_t v52 = os_log_create("com.apple.screentime.core", "privateService");
  v84[30] = v52;
  v83[31] = @"requestManager";
  os_log_t v51 = os_log_create("com.apple.screentime.core", "requestManager");
  v84[31] = v51;
  v83[32] = @"restrictionsMigrator";
  os_log_t v50 = os_log_create("com.apple.screentime.core", "restrictionsMigrator");
  v84[32] = v50;
  v83[33] = @"screentime";
  os_log_t v49 = os_log_create("com.apple.screentime.core", "screentime");
  v84[33] = v49;
  v83[34] = @"screenTimeOrganizationController";
  os_log_t v48 = os_log_create("com.apple.screentime.core", "screenTimeOrganizationController");
  v84[34] = v48;
  v83[35] = @"settingsService";
  os_log_t v47 = os_log_create("com.apple.screentime.core", "settingsService");
  v84[35] = v47;
  v83[36] = @"test";
  os_log_t v46 = os_log_create("com.apple.screentime.core", "test");
  v84[36] = v46;
  v83[37] = @"tool";
  os_log_t v45 = os_log_create("com.apple.screentime.core", "tool");
  v84[37] = v45;
  v83[38] = @"transaction";
  os_log_t v44 = os_log_create("com.apple.screentime.core", "transaction");
  v84[38] = v44;
  v83[39] = @"usage";
  os_log_t v43 = os_log_create("com.apple.screentime.core", "usage");
  v84[39] = v43;
  v83[40] = @"userNotifications";
  os_log_t v42 = os_log_create("com.apple.screentime.core", "userNotifications");
  v84[40] = v42;
  v83[41] = @"utility";
  os_log_t v41 = os_log_create("com.apple.screentime.core", "utility");
  v84[41] = v41;
  v83[42] = @"versionVector";
  os_log_t v40 = os_log_create("com.apple.screentime.core", "versionVector");
  v84[42] = v40;
  v83[43] = @"askClient";
  os_log_t v39 = os_log_create("com.apple.screentime.core", "askClient");
  v84[43] = v39;
  v83[44] = @"backgroundActivity";
  os_log_t v38 = os_log_create("com.apple.screentime.core", "backgroundActivity");
  v84[44] = v38;
  v83[45] = @"cachingCodableStore";
  os_log_t v37 = os_log_create("com.apple.screentime.core", "cachingCodableStore");
  v84[45] = v37;
  v83[46] = @"communicationClient";
  os_log_t v36 = os_log_create("com.apple.screentime.core", "communicationClient");
  v84[46] = v36;
  v83[47] = @"contactStorePrimitives";
  os_log_t v35 = os_log_create("com.apple.screentime.core", "contactStorePrimitives");
  v84[47] = v35;
  v83[48] = @"coreDataConfigurationStore";
  os_log_t v34 = os_log_create("com.apple.screentime.core", "coreDataConfigurationStore");
  v84[48] = v34;
  v83[49] = @"coreDataTransformer";
  os_log_t v33 = os_log_create("com.apple.screentime.core", "coreDataTransformer");
  v84[49] = v33;
  v83[50] = @"coreDataObserver";
  os_log_t v32 = os_log_create("com.apple.screentime.core", "coreDataObserver");
  v84[50] = v32;
  v83[51] = @"defaultUserPolicyApplicator";
  os_log_t v31 = os_log_create("com.apple.screentime.core", "defaultUserPolicyApplicator");
  v84[51] = v31;
  v83[52] = @"deviceCapabilitiesClient";
  os_log_t v30 = os_log_create("com.apple.screentime.core", "deviceCapabilitiesClient");
  v84[52] = v30;
  v83[53] = @"deviceInformationPrimitives";
  os_log_t v29 = os_log_create("com.apple.screentime.core", "deviceInformationPrimitives");
  v84[53] = v29;
  v83[54] = @"eyeReliefStateWriter";
  os_log_t v28 = os_log_create("com.apple.screentime.core", "eyeReliefStateWriter");
  v84[54] = v28;
  v83[55] = @"familyCirclePrimitives";
  os_log_t v27 = os_log_create("com.apple.screentime.core", "familyCirclePrimitives");
  v84[55] = v27;
  v83[56] = @"familyCommunicationService";
  os_log_t v26 = os_log_create("com.apple.screentime.core", "familyCommunicationService");
  v84[56] = v26;
  v83[57] = @"familyInformationProvider";
  os_log_t v25 = os_log_create("com.apple.screentime.core", "familyInformationProvider");
  v84[57] = v25;
  v83[58] = @"familyMemberGenesisStateStore";
  os_log_t v24 = os_log_create("com.apple.screentime.core", "familyMemberGenesisStateStore");
  v84[58] = v24;
  v83[59] = @"fileBackedKeyValueStore";
  os_log_t v23 = os_log_create("com.apple.screentime.core", "fileBackedKeyValueStore");
  v84[59] = v23;
  v83[60] = @"idsMessageTransport";
  os_log_t v22 = os_log_create("com.apple.screentime.core", "idsMessageTransport");
  v84[60] = v22;
  v83[61] = @"idsTransportMessageAddressMap";
  os_log_t v21 = os_log_create("com.apple.screentime.core", "idsTransportMessageAddressMap");
  v84[61] = v21;
  v83[62] = @"idsTransportMessageIdentifierMap";
  os_log_t v20 = os_log_create("com.apple.screentime.core", "idsTransportMessageIdentifierMap");
  v84[62] = v20;
  v83[63] = @"idsTransportPrimitives";
  os_log_t v19 = os_log_create("com.apple.screentime.core", "idsTransportPrimitives");
  v84[63] = v19;
  v83[64] = @"messageTrackingTransportEnvoy";
  os_log_t v18 = os_log_create("com.apple.screentime.core", "messageTrackingTransportEnvoy");
  v84[64] = v18;
  v83[65] = @"messageTrackingTransportService";
  os_log_t v17 = os_log_create("com.apple.screentime.core", "messageTrackingTransportService");
  v84[65] = v17;
  v83[66] = @"organizationControllerConfigurationAdapter";
  os_log_t v16 = os_log_create("com.apple.screentime.core", "organizationControllerConfigurationAdapter");
  v84[66] = v16;
  v83[67] = @"passcodeAuthenticationProviderService";
  os_log_t v15 = os_log_create("com.apple.screentime.core", "passcodeAuthenticationProviderService");
  v84[67] = v15;
  v83[68] = @"passcodeProviderService";
  os_log_t v14 = os_log_create("com.apple.screentime.core", "passcodeProviderService");
  v84[68] = v14;
  v83[69] = @"promise";
  os_log_t v13 = os_log_create("com.apple.screentime.core", "promise");
  v84[69] = v13;
  v83[70] = @"reactor";
  os_log_t v12 = os_log_create("com.apple.screentime.core", "reactor");
  v84[70] = v12;
  v83[71] = @"reactorCore";
  os_log_t v0 = os_log_create("com.apple.screentime.core", "reactorCore");
  v84[71] = v0;
  v83[72] = @"reactorDirectiveProcessor";
  os_log_t v1 = os_log_create("com.apple.screentime.core", "reactorDirectiveProcessor");
  v84[72] = v1;
  v83[73] = @"reactorTool";
  os_log_t v2 = os_log_create("com.apple.screentime.core", "reactorTool");
  v84[73] = v2;
  v83[74] = @"remoteViewService";
  os_log_t v3 = os_log_create("com.apple.screentime.core", "remoteViewService");
  v84[74] = v3;
  v83[75] = @"setupClient";
  os_log_t v4 = os_log_create("com.apple.screentime.core", "setupClient");
  v84[75] = v4;
  v83[76] = @"transportServiceMessageLedger";
  os_log_t v5 = os_log_create("com.apple.screentime.core", "transportServiceMessageLedger");
  v84[76] = v5;
  v83[77] = @"userSafetyPolicyWriter";
  os_log_t v6 = os_log_create("com.apple.screentime.core", "userSafetyPolicyWriter");
  v84[77] = v6;
  v83[78] = @"v2Disable";
  os_log_t v7 = os_log_create("com.apple.screentime.core", "v2Disable");
  v84[78] = v7;
  v83[79] = @"xpcServiceProvider";
  os_log_t v8 = os_log_create("com.apple.screentime.core", "xpcServiceProvider");
  v84[79] = v8;
  v83[80] = @"familyMessaging";
  os_log_t v9 = os_log_create("com.apple.screentime.core", "familyMessaging");
  v84[80] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:v83 count:81];
  v11 = (void *)_logCategories;
  _logCategories = v10;
}

+ (OS_os_log)accountState
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"accountState"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)appInfo
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"appInfo"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)appMonitor
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"appMonitor"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)apns
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"apns"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)blueprint
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"blueprint"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)checkpoint
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"checkpoint"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)cloudkit
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"cloudkit"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)communicationSafety
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"communicationSafety"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)conduit
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"conduit"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)contactsService
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"contactsService"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreAnalytics
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"coreAnalytics"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreAnimation
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"coreAnimation"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreDataValidation
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"coreDataValidation"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)daemon
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"daemon"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)deviceState
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"deviceState"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)family
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"family"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyScreenTimeManager
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"familyScreenTimeManager"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)familySettingsManager
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"familySettingsManager"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)idsTransport
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"idsTransport"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)managementStateObserver
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"managementStateObserver"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)mirroring
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"mirroring"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)oneMoreMinuteManager
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"oneMoreMinuteManager"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)payload
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"payload"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)payloadManager
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"payloadManager"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)payloadQueue
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"payloadQueue"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)persistence
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"persistence"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)personal
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"personal"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)pinController
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"pinController"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)pinService
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"pinService"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)privateService
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"privateService"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)requestManager
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"requestManager"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)restrictionsMigrator
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"restrictionsMigrator"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)settingsService
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"settingsService"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)test
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"test"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)tool
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"tool"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)transaction
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"transaction"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)usage
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"usage"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)userNotifications
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"userNotifications"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)utility
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"utility"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)versionVector
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"versionVector"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)askClient
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"askClient"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)backgroundActivity
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"backgroundActivity"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)cachingCodableStore
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"cachingCodableStore"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)contactStorePrimitives
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"contactStorePrimitives"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreDataConfigurationStore
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"coreDataConfigurationStore"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreDataTransformer
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"coreDataTransformer"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)coreDataObserver
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"coreDataObserver"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)defaultUserPolicyApplicator
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"defaultUserPolicyApplicator"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)deviceCapabilitiesClient
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"deviceCapabilitiesClient"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)deviceInformationPrimitives
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"deviceInformationPrimitives"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)downtimeClient
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"downtimeClient"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)eyeReliefStateWriter
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"eyeReliefStateWriter"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyCirclePrimitives
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"familyCirclePrimitives"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyCommunicationService
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"familyCommunicationService"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyInformationProvider
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"familyInformationProvider"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyMemberGenesisStateStore
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"familyMemberGenesisStateStore"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)fileBackedKeyValueStore
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"fileBackedKeyValueStore"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)idsMessageTransport
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"idsMessageTransport"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)idsTransportMessageAddressMap
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"idsTransportMessageAddressMap"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)idsTransportMessageIdentifierMap
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"idsTransportMessageIdentifierMap"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)idsTransportPrimitives
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"idsTransportPrimitives"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)messageTrackingTransportEnvoy
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"messageTrackingTransportEnvoy"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)messageTrackingTransportService
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"messageTrackingTransportService"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)organizationControllerConfigurationAdapter
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"organizationControllerConfigurationAdapter"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)passcodeAuthenticationProviderService
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"passcodeAuthenticationProviderService"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)passcodeProviderService
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"passcodeProviderService"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)promise
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"promise"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)reactorCore
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"reactorCore"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)reactorDirectiveProcessor
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"reactorDirectiveProcessor"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)reactorTool
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"reactorTool"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)remoteViewService
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"remoteViewService"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)setupClient
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"setupClient"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)transportServiceMessageLedger
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"transportServiceMessageLedger"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)userSafetyPolicyWriter
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"userSafetyPolicyWriter"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)v2Disable
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"v2Disable"];

  return (OS_os_log *)v3;
}

+ (OS_os_log)familyMessaging
{
  os_log_t v2 = +[STLog logCategories];
  os_log_t v3 = [v2 objectForKeyedSubscript:@"familyMessaging"];

  return (OS_os_log *)v3;
}

@end