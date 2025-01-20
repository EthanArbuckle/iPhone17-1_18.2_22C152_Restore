@interface ULTapToRadar
+ (int64_t)_classificationFromULTapToRadarClassification:(int64_t)a3;
+ (int64_t)_reproducibilityFromULTapToRadarReproducibility:(int64_t)a3;
+ (void)createRadarWithComponentName:(id)a3 componentVersion:(id)a4 componentID:(id)a5 classification:(int64_t)a6 reproducibility:(int64_t)a7 title:(id)a8 description:(id)a9 extensionIDs:(id)a10 processName:(id)a11 displayReason:(id)a12 isUserInitiated:(BOOL)a13 completionHandler:(id)a14;
@end

@implementation ULTapToRadar

+ (void)createRadarWithComponentName:(id)a3 componentVersion:(id)a4 componentID:(id)a5 classification:(int64_t)a6 reproducibility:(int64_t)a7 title:(id)a8 description:(id)a9 extensionIDs:(id)a10 processName:(id)a11 displayReason:(id)a12 isUserInitiated:(BOOL)a13 completionHandler:(id)a14
{
  id v35 = a3;
  id v17 = a4;
  id v18 = a5;
  id v34 = a8;
  id v19 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  v23 = (void (**)(id, void *))a14;
  if (+[ULPlatform isInternalInstall]
    && getTapToRadarServiceClass()
    && (Class)getRadarDraftClass[0]()
    && (Class)getRadarComponentClass[0]())
  {
    id v24 = objc_alloc((Class)getRadarComponentClass[0]());
    v25 = v18;
    uint64_t v26 = [v18 integerValue];
    v27 = v17;
    v28 = (void *)[v24 initWithName:v35 version:v17 identifier:v26];
    getRadarDraftClass[0]();
    v29 = objc_opt_new();
    [v29 setComponent:v28];
    objc_msgSend(v29, "setClassification:", objc_msgSend(a1, "_classificationFromULTapToRadarClassification:", a6));
    objc_msgSend(v29, "setReproducibility:", objc_msgSend(a1, "_reproducibilityFromULTapToRadarReproducibility:", a7));
    [v29 setTitle:v34];
    [v29 setProblemDescription:v19];
    [v29 setDiagnosticExtensionIDs:v20];
    [v29 setIsUserInitiated:a13];
    v30 = [(objc_class *)getTapToRadarServiceClass() shared];
    [v30 createDraft:v29 forProcessNamed:v21 withDisplayReason:v22 completionHandler:v23];
  }
  else
  {
    v25 = v18;
    v27 = v17;
    v28 = objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"TTR not supported", -1, 0, a6, a1);
    v23[2](v23, v28);
  }
}

+ (int64_t)_classificationFromULTapToRadarClassification:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xA) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)_reproducibilityFromULTapToRadarReproducibility:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 6) {
    return 0;
  }
  else {
    return a3;
  }
}

@end