@interface STFamilyInformationCoreDataTransformerComponent
+ (id)_purgeFamilyInformationInContext:(id)a3;
+ (id)_updateLocalUserWithFamilyMembers:(id)a3 inContext:(id)a4;
+ (id)familyMemberTypeForTargetableFamilyMember:(id)a3;
+ (id)persistFamilyInformationFromFamilyMembers:(id)a3 container:(id)a4;
@end

@implementation STFamilyInformationCoreDataTransformerComponent

+ (id)persistFamilyInformationFromFamilyMembers:(id)a3 container:(id)a4
{
  id v6 = a3;
  id v7 = [a4 newBackgroundContext];
  if ([v6 count]) {
    [a1 _updateLocalUserWithFamilyMembers:v6 inContext:v7];
  }
  else {
  v8 = [a1 _purgeFamilyInformationInContext:v7];
  }

  return v8;
}

+ (id)_updateLocalUserWithFamilyMembers:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[STLog coreDataTransformer];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "+[STFamilyInformationCoreDataTransformerComponent _updateLocalUserWithFamilyMembers:inContext:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}s: \nUpdating local user with family information", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100030B68;
  v21 = sub_100030B78;
  id v22 = +[STResult success];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100030B80;
  v13[3] = &unk_1002FBE90;
  id v9 = v6;
  id v14 = v9;
  p_long long buf = &buf;
  id v10 = v7;
  id v15 = v10;
  id v17 = a1;
  [v10 performBlockAndWait:v13];
  id v11 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  return v11;
}

+ (id)_purgeFamilyInformationInContext:(id)a3
{
  id v3 = a3;
  v4 = +[STLog coreDataTransformer];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Purging family information from local user", buf, 2u);
  }

  *(void *)long long buf = 0;
  v12 = buf;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_100030B68;
  id v15 = sub_100030B78;
  id v16 = +[STResult success];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000310A8;
  v8[3] = &unk_1002FC558;
  id v5 = v3;
  id v9 = v5;
  id v10 = buf;
  [v5 performBlockAndWait:v8];
  id v6 = *((id *)v12 + 5);

  _Block_object_dispose(buf, 8);
  return v6;
}

+ (id)familyMemberTypeForTargetableFamilyMember:(id)a3
{
  id v3 = [a3 memberType];
  if ((unint64_t)v3 <= 3) {
    id v4 = *(id *)*(&off_1002FC578 + (void)v3);
  }
  return v4;
}

@end