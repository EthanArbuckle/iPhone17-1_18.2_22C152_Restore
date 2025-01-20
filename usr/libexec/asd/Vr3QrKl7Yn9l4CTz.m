@interface Vr3QrKl7Yn9l4CTz
- (ASCoreDataManager)coreDataManager;
- (PJXBDBF1h0EU80dy)cacheManager;
- (Vr3QrKl7Yn9l4CTz)init;
- (Vr3QrKl7Yn9l4CTz)initWithfOZWnqN9bY6jwOMf:(id)a3;
- (_TtC3asd21PrecomputationManager)precomputationManager;
- (void)gCEWuNTdkAWg8Jj5WithStMYeuN4F4F4tdlz:(id)a3 workflows:(id)a4;
- (void)hiMi2bftgysHNCmu;
- (void)jzyh7hNN2V5AZJR1;
- (void)m2fzkz0hfx3YgwiD;
- (void)p3IhAuuUciVQl4AK;
- (void)ppirDXSrO0poQaQJ;
- (void)qvdJFx0260C4oDQI;
- (void)sFFfMcUAtN14Bjc5;
- (void)y6doGzfhnVRCi9Iy;
- (void)zs3Lq7W446m0cZJL;
@end

@implementation Vr3QrKl7Yn9l4CTz

- (Vr3QrKl7Yn9l4CTz)init
{
  v10.receiver = self;
  v10.super_class = (Class)Vr3QrKl7Yn9l4CTz;
  v2 = [(Vr3QrKl7Yn9l4CTz *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[PJXBDBF1h0EU80dy sharedInstance];
    cacheManager = v2->_cacheManager;
    v2->_cacheManager = (PJXBDBF1h0EU80dy *)v3;

    uint64_t v5 = +[ASCoreDataManager sharedInstance];
    coreDataManager = v2->_coreDataManager;
    v2->_coreDataManager = (ASCoreDataManager *)v5;

    uint64_t v7 = +[PrecomputationManager shared];
    precomputationManager = v2->_precomputationManager;
    v2->_precomputationManager = (_TtC3asd21PrecomputationManager *)v7;
  }
  return v2;
}

- (Vr3QrKl7Yn9l4CTz)initWithfOZWnqN9bY6jwOMf:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Vr3QrKl7Yn9l4CTz;
  v6 = [(Vr3QrKl7Yn9l4CTz *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cacheManager, a3);
  }

  return v7;
}

- (void)sFFfMcUAtN14Bjc5
{
  uint64_t v3 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "purgeAllUserData", v4, 2u);
  }
  [(Vr3QrKl7Yn9l4CTz *)self y6doGzfhnVRCi9Iy];
  [(Vr3QrKl7Yn9l4CTz *)self m2fzkz0hfx3YgwiD];
  [(Vr3QrKl7Yn9l4CTz *)self hiMi2bftgysHNCmu];
  [(Vr3QrKl7Yn9l4CTz *)self p3IhAuuUciVQl4AK];
  [(Vr3QrKl7Yn9l4CTz *)self qvdJFx0260C4oDQI];
}

- (void)qvdJFx0260C4oDQI
{
  id v2 = [(Vr3QrKl7Yn9l4CTz *)self cacheManager];
  [v2 vWMDLV5jN1a2h2p2:&__NSDictionary0__struct completionHandler:&stru_10065EE48];
}

- (void)gCEWuNTdkAWg8Jj5WithStMYeuN4F4F4tdlz:(id)a3 workflows:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    if ([v6 containsObject:&off_100688178])
    {
      id v16 = v7;
      id v17 = v6;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v7;
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * (void)v12);
            v14 = [(Vr3QrKl7Yn9l4CTz *)self cacheManager];
            uint64_t v22 = v13;
            v23 = &off_100688190;
            v15 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
            [v14 vWMDLV5jN1a2h2p2:v15 completionHandler:&stru_10065EE68];

            v12 = (char *)v12 + 1;
          }
          while (v10 != v12);
          id v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
        }
        while (v10);
      }

      id v7 = v16;
      id v6 = v17;
    }
  }
  else
  {
    [(Vr3QrKl7Yn9l4CTz *)self m2fzkz0hfx3YgwiD];
    [(Vr3QrKl7Yn9l4CTz *)self qvdJFx0260C4oDQI];
    [(Vr3QrKl7Yn9l4CTz *)self jzyh7hNN2V5AZJR1];
  }
}

- (void)jzyh7hNN2V5AZJR1
{
  id v2 = [(Vr3QrKl7Yn9l4CTz *)self cacheManager];
  id v5 = 0;
  [v2 ax7Szgk7yfiKNgSDError:&v5];
  id v3 = v5;

  if (v3)
  {
    v4 = (void *)qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055C51C(v4);
    }
  }
}

- (void)y6doGzfhnVRCi9Iy
{
  id v3 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "purgeBindings", v5, 2u);
  }
  v4 = [(Vr3QrKl7Yn9l4CTz *)self cacheManager];
  [v4 removeAllBindings];
}

- (void)m2fzkz0hfx3YgwiD
{
  id v3 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "purgeDFCs", buf, 2u);
  }
  v4 = [(Vr3QrKl7Yn9l4CTz *)self cacheManager];
  id v7 = 0;
  [v4 nYOW3DfIUVSEf2Hm:&off_1006886E0 rTZQrPNUbDSIifrh:&v7];
  id v5 = v7;

  if (v5)
  {
    id v6 = (void *)qword_1006AD1A0;
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055C51C(v6);
    }
  }
  [(PrecomputationManager *)self->_precomputationManager notifyCachesWereRemovedWithCompletionHandler:&stru_10065EE88];
}

- (void)ppirDXSrO0poQaQJ
{
  id v4 = [(Vr3QrKl7Yn9l4CTz *)self cacheManager];
  id v2 = +[ASDConfigurationManager shared];
  id v3 = [v2 payloadWorkflowTTLs];
  [v4 vWMDLV5jN1a2h2p2:v3 completionHandler:&stru_10065EEA8];
}

- (void)zs3Lq7W446m0cZJL
{
  id v2 = [(Vr3QrKl7Yn9l4CTz *)self coreDataManager];
  id v6 = 0;
  [v2 mILKmibfRWMwFVWD:@"DB_R115061196" iZGmRj7VI4MJ9lO1:0 AndError:&v6];
  id v3 = v6;

  id v4 = qword_1006AD1A0;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
      sub_10055C63C(v4);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[ASCleanupManager] JSON Bags purged successfully.", v5, 2u);
  }
}

- (void)p3IhAuuUciVQl4AK
{
  id v3 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "purgeG", v6, 2u);
  }
  id v4 = [(Vr3QrKl7Yn9l4CTz *)self cacheManager];
  id v5 = [v4 removeAllGeocodings];
}

- (void)hiMi2bftgysHNCmu
{
  id v3 = qword_1006AD1A0;
  if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "purgeR", v6, 2u);
  }
  id v4 = [(Vr3QrKl7Yn9l4CTz *)self cacheManager];
  id v5 = [v4 removeRavioli];
}

- (PJXBDBF1h0EU80dy)cacheManager
{
  return self->_cacheManager;
}

- (ASCoreDataManager)coreDataManager
{
  return self->_coreDataManager;
}

- (_TtC3asd21PrecomputationManager)precomputationManager
{
  return self->_precomputationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precomputationManager, 0);
  objc_storeStrong((id *)&self->_coreDataManager, 0);

  objc_storeStrong((id *)&self->_cacheManager, 0);
}

@end