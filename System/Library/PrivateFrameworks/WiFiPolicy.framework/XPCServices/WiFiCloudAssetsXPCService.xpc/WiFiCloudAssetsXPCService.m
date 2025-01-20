void sub_1000055AC(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  NSString *v4;
  id v5;
  id v6;
  id v9;
  BOOL v10;
  id v11;
  uint64_t v12;
  id v13[2];
  id v14;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  v13[0] = location[0];
  v12 = -1;
  v9 = [v13[0] records];
  v10 = [v9 count] == 0;

  if (!v10)
  {
    v5 = [v13[0] records];
    v11 = [v5 firstObject];

    v6 = [v11 valueForKey:@"index"];
    v12 = (int)[v6 intValue];

    objc_storeStrong(&v11, 0);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a1[4]) {
      (*(void (**)(void))(a1[4] + 16))();
    }
  }
  else
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSStringFromClass(v3);
    NSLog(@"Error: Response is not of type WCAFetchKeyValuesResponse, instead its %@", v4);

    if (a1[4]) {
      (*(void (**)(void))(a1[4] + 16))();
    }
  }
  objc_storeStrong(v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void sub_100005E34(id a1)
{
  uint64_t v1 = objc_opt_new();
  v2 = (void *)qword_100015568;
  qword_100015568 = v1;
}

void sub_100006158(uint64_t a1)
{
}

void sub_1000061A4(id a1)
{
}

void sub_100006234(id a1)
{
}

void sub_100006484(id *a1)
{
  v10[2] = a1;
  v10[1] = a1;
  id v2 = a1[4];
  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  v6 = sub_1000065A0;
  v7 = &unk_100010A60;
  id v8 = a1[4];
  id v9 = a1[5];
  v10[0] = a1[6];
  objc_msgSend(v2, "_findLocallyInstalledAssetWithCompletion:");
  objc_storeStrong(v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v8, 0);
}

void sub_1000065A0(uint64_t a1)
{
  uint64_t v19 = a1;
  uint64_t v18 = a1;
  id v17 = 0;
  v10 = *(void **)(*(void *)(a1 + 32) + 8);
  id v11 = [*(id *)(a1 + 40) asset];
  id v12 = objc_msgSend(v10, "indexOfObject:");

  id v17 = v12;
  id v16 = 0;
  if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v1 = [*(id *)(*(void *)(a1 + 32) + 8) objectAtIndexedSubscript:v17];
    id v2 = v16;
    id v16 = v1;
  }
  id v15 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = *(id *)(a1 + 40);
    v7 = *(void **)(a1 + 32);
    id v8 = [v14 keys];
    id v3 = objc_msgSend(v7, "_readInstalledKeys:ofAsset:");
    id v4 = v15;
    id v15 = v3;

    objc_storeStrong(&v14, 0);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = *(id *)(a1 + 40);
      id v5 = [*(id *)(a1 + 32) _readSQLiteDataBase:v13 ofAsset:v16];
      id v6 = v15;
      id v15 = v5;

      objc_storeStrong(&v13, 0);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
}

void sub_100006A54(uint64_t a1)
{
}

NSDictionary *__cdecl sub_100006C90(id a1)
{
  CFStringRef v2 = @"event";
  CFStringRef v3 = @"no-network-connectivity";
  return +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
}

void sub_100006D24(id *a1, void *a2)
{
  v12[3] = a1;
  v12[2] = a2;
  v12[1] = a1;
  if (a2)
  {
    id v2 = [a1[5] name];
    NSLog(@"[%s][%@] Metdata download failed", "-[WCAServer _fetchAssetCatalogueFromServer:completion:]_block_invoke_2", v2);

    AnalyticsSendEventLazy();
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v4 = a1[4];
    id v3 = a1[5];
    id v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    id v9 = sub_100006EA8;
    v10 = &unk_100010AC8;
    id v11 = a1[4];
    v12[0] = a1[6];
    [v4 _queryAndFindBestVersionOfAsset:v3 completion:&v6];
    objc_storeStrong(v12, 0);
    objc_storeStrong(&v11, 0);
  }
}

uint64_t sub_100006EA8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

NSDictionary *__cdecl sub_100006EF8(id a1)
{
  CFStringRef v2 = @"event";
  CFStringRef v3 = @"metdata-download-failed";
  return +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
}

uint64_t sub_100007104(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v19 = a2;
  uint64_t v18 = a1;
  NSLog(@"Query MAQueryResult: %ld", a2);
  id v13 = [*(id *)(a1 + 32) results];
  BOOL v14 = [v13 count] == 0;

  if (!v14)
  {
    memset(__b, 0, sizeof(__b));
    id obj = [*(id *)(a1 + 32) results];
    id v11 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
    if (v11)
    {
      uint64_t v7 = *(void *)__b[2];
      uint64_t v8 = 0;
      id v9 = v11;
      while (1)
      {
        uint64_t v6 = v8;
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(__b[1] + 8 * v8);
        id v3 = [v17 attributes];
        id v15 = [v3 objectForKeyedSubscript:@"WiFiCloudAssetType"];

        id v4 = *(void **)(*(void *)(a1 + 40) + 40);
        id v5 = [v17 getLocalUrl];
        objc_msgSend(v4, "setObject:forKey:");

        objc_storeStrong(&v15, 0);
        ++v8;
        if (v6 + 1 >= (unint64_t)v9)
        {
          uint64_t v8 = 0;
          id v9 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
          if (!v9) {
            break;
          }
        }
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000078A8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSLog(@"Query MAQueryResult: %ld", a2);
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v6 = [*(id *)(a1 + 32) results];
    BOOL v7 = [v6 count] == 0;

    if (v7)
    {
      id v2 = [*(id *)(a1 + 48) name];
      NSLog(@"[%s][%@] Empty results for asset update query", "-[WCAServer _queryAndFindBestVersionOfAsset:completion:]_block_invoke", v2);

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      id v4 = *(void **)(a1 + 40);
      uint64_t v3 = *(void *)(a1 + 48);
      id v5 = [*(id *)(a1 + 32) results];
      objc_msgSend(v4, "_findBestVersionOfAsset:fromResults:completion:", v3);
    }
  }
}

void sub_100008400(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) name];
  NSLog(@"[%s][%@] %s: Asset version %@ purged", "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]_block_invoke", v2, "-[WCAServer _findBestVersionOfAsset:fromResults:completion:]_block_invoke", *(void *)(a1 + 40));
}

void sub_10000860C(id a1, MAProgressNotification *a2)
{
  id v2 = a1;
  location[1] = a1;
  id v4 = location;
  id v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v6 = v2;
  id v3 = [location[0] totalWritten];
  NSLog(@"Progress callback: %lld %lld", v3, [location[0] totalExpected]);
  objc_storeStrong(v4, v5);
}

uint64_t sub_100008694(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = a1;
  uint64_t v24 = a1;
  uint64_t v23 = a2;
  v22[1] = a1;
  id v10 = [*(id *)(a1 + 32) assetType];
  id v9 = [*(id *)(v8 + 32) getLocalUrl];
  NSLog(@"Got the download asset reply: %@, and %@", v10, v9);

  if (v23)
  {
    id v3 = [*(id *)(v8 + 40) name];
    NSLog(@"[%s][%@] %s: Asset download failed - error %ld", "-[WCAServer _downloadAsset:withLocalAsset:completion:]_block_invoke_2", v3, "-[WCAServer _downloadAsset:withLocalAsset:completion:]_block_invoke_2", v23);

    id v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    BOOL v14 = sub_100008A10;
    id v15 = &unk_100010BE8;
    uint64_t v16 = v23;
    AnalyticsSendEventLazy();
  }
  else
  {
    id v4 = [*(id *)(v8 + 40) name];
    NSLog(@"[%s][%@] %s: Asset download completed", "-[WCAServer _downloadAsset:withLocalAsset:completion:]_block_invoke_2", v4, "-[WCAServer _downloadAsset:withLocalAsset:completion:]_block_invoke_2");

    id v5 = &v17;
    id v17 = _NSConcreteStackBlock;
    int v18 = -1073741824;
    int v19 = 0;
    uint64_t v20 = sub_10000891C;
    v21 = &unk_100010BC8;
    location = (id *)v22;
    v22[0] = *(id *)(v8 + 32);
    AnalyticsSendEventLazy();
    id v6 = [*(id *)(v8 + 40) latestNotInstalledAsset];
    objc_msgSend(*(id *)(v8 + 40), "setLatestInstalledAsset:");

    objc_storeStrong(location, 0);
  }
  return (*(uint64_t (**)(void))(*(void *)(v8 + 48) + 16))();
}

NSDictionary *sub_10000891C(uint64_t a1)
{
  v4[0] = @"event";
  v5[0] = @"asset-download-completed";
  v4[1] = @"asset-type";
  id v2 = [*(id *)(a1 + 32) assetType];
  v5[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v3;
}

NSDictionary *sub_100008A10(uint64_t a1)
{
  v4[0] = @"event";
  v5[0] = @"asset-download-failed";
  v4[1] = @"error";
  id v2 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  v5[1] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v3;
}

NSDictionary *__cdecl sub_1000094F4(id a1)
{
  CFStringRef v2 = @"event";
  CFStringRef v3 = @"default-assets";
  return +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
}

NSDictionary *__cdecl sub_100009588(id a1)
{
  CFStringRef v2 = @"event";
  CFStringRef v3 = @"locally-installed-assets";
  return +[NSDictionary dictionaryWithObjects:&v3 forKeys:&v2 count:1];
}

NSDictionary *sub_10000961C(uint64_t a1)
{
  v6[0] = @"event";
  v7[0] = @"found-local-overrides";
  v6[1] = @"key";
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"KeyPath"];
  v7[1] = v5;
  v6[2] = @"value";
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Value"];
  v7[2] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

uint64_t sub_1000099DC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009FB0(void *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

id WFRunSqliteQuery(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id location = 0;
  objc_storeStrong(&location, a1);
  id v86 = 0;
  objc_storeStrong(&v86, a2);
  id v85 = 0;
  objc_storeStrong(&v85, a3);
  id v84 = 0;
  objc_storeStrong(&v84, a4);
  uint64_t v83 = a5;
  id v82 = (id)objc_opt_new();
  memset(__b, 0, sizeof(__b));
  id v46 = v84;
  id v47 = [v46 countByEnumeratingWithState:__b objects:v92 count:16];
  if (v47)
  {
    uint64_t v39 = *(void *)__b[2];
    uint64_t v40 = 0;
    id v41 = v47;
    while (1)
    {
      uint64_t v38 = v40;
      if (*(void *)__b[2] != v39) {
        objc_enumerationMutation(v46);
      }
      uint64_t v81 = *(void *)(__b[1] + 8 * v40);
      id v36 = v82;
      v37 = +[NSString stringWithFormat:@"\"%@\"", v81];
      objc_msgSend(v36, "addObject:");

      ++v40;
      if (v38 + 1 >= (unint64_t)v41)
      {
        uint64_t v40 = 0;
        id v41 = [v46 countByEnumeratingWithState:__b objects:v92 count:16];
        if (!v41) {
          break;
        }
      }
    }
  }

  id v79 = 0;
  if ([v82 count])
  {
    id v5 = [v82 componentsJoinedByString:@","];
    id v6 = v79;
    id v79 = v5;
  }
  else
  {
    objc_storeStrong(&v79, @"*");
  }
  v78 = 0;
  if (sqlite3_open_v2((const char *)[location fileSystemRepresentation], &v78, 1, 0))
  {
    sqlite3_close(v78);
    NSLog(@"Failed to open db connection");
    id v88 = 0;
    int v76 = 1;
  }
  else
  {
    id v75 = (id)objc_opt_new();
    [v75 appendFormat:@"SELECT %@ FROM \"%@\" WHERE ", v79, v85];
    id v74 = (id)objc_opt_new();
    memset(v72, 0, sizeof(v72));
    id v34 = v86;
    id v35 = [v34 countByEnumeratingWithState:v72 objects:v91 count:16];
    if (v35)
    {
      uint64_t v31 = *(void *)v72[2];
      uint64_t v32 = 0;
      id v33 = v35;
      while (1)
      {
        uint64_t v30 = v32;
        if (*(void *)v72[2] != v31) {
          objc_enumerationMutation(v34);
        }
        uint64_t v73 = *(void *)(v72[1] + 8 * v32);
        id v28 = v74;
        v29 = +[NSString stringWithFormat:@"(\"%@\" = ?)", v73];
        objc_msgSend(v28, "addObject:");

        ++v32;
        if (v30 + 1 >= (unint64_t)v33)
        {
          uint64_t v32 = 0;
          id v33 = [v34 countByEnumeratingWithState:v72 objects:v91 count:16];
          if (!v33) {
            break;
          }
        }
      }
    }

    id v71 = [v74 componentsJoinedByString:@" AND "];
    char v68 = 0;
    if (v83 <= 0)
    {
      BOOL v7 = &stru_100012688;
    }
    else
    {
      v69 = +[NSString stringWithFormat:@"LIMIT %d", v83];
      char v68 = 1;
      BOOL v7 = v69;
    }
    id v70 = v7;
    if (v68) {

    }
    [v75 appendFormat:@"%@ %@;", v71, v70];
    v67 = 0;
    int v66 = sqlite3_prepare_v2(v78, (const char *)[v75 UTF8String], -1, &v67, 0);
    if (v66)
    {
      id v88 = 0;
      int v76 = 1;
    }
    else
    {
      int v65 = 1;
      memset(v63, 0, sizeof(v63));
      id v26 = v86;
      id v27 = [v26 countByEnumeratingWithState:v63 objects:v90 count:16];
      if (v27)
      {
        uint64_t v23 = *(void *)v63[2];
        uint64_t v24 = 0;
        id v25 = v27;
        while (1)
        {
          uint64_t v22 = v24;
          if (*(void *)v63[2] != v23) {
            objc_enumerationMutation(v26);
          }
          uint64_t v64 = *(void *)(v63[1] + 8 * v24);
          id v62 = [v86 objectForKeyedSubscript:v64];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v61 = v62;
            if (!strcmp((const char *)[v61 objCType], "i")
              || !strcmp((const char *)[v61 objCType], "B"))
            {
              sqlite3_bind_int(v67, v65, (int)[v61 intValue]);
            }
            else if (!strcmp((const char *)[v61 objCType], "f"))
            {
              uint64_t v20 = v67;
              int v21 = v65;
              [v61 doubleValue];
              sqlite3_bind_double(v20, v21, v8);
            }
            else if (!strcmp((const char *)[v61 objCType], "q"))
            {
              sqlite3_bind_int64(v67, v65, (sqlite3_int64)[v61 longLongValue]);
            }
            objc_storeStrong(&v61, 0);
          }
          else
          {
            id v60 = [v62 description];
            int v59 = objc_msgSend(v60, "lengthOfBytesUsingEncoding:");
            v58 = (const char *)[v60 cStringUsingEncoding:4];
            sqlite3_bind_text(v67, v65, v58, v59, 0);
            objc_storeStrong(&v60, 0);
          }
          ++v65;
          objc_storeStrong(&v62, 0);
          ++v24;
          if (v22 + 1 >= (unint64_t)v25)
          {
            uint64_t v24 = 0;
            id v25 = [v26 countByEnumeratingWithState:v63 objects:v90 count:16];
            if (!v25) {
              break;
            }
          }
        }
      }

      char v57 = 0;
      id v56 = (id)objc_opt_new();
      id v55 = (id)objc_opt_new();
      while (1)
      {
        int v66 = sqlite3_step(v67);
        if (v66 != 100) {
          break;
        }
        if ((v57 & 1) == 0)
        {
          int v54 = 0;
          int v54 = sqlite3_column_count(v67);
          for (int N = 0; N < v54; ++N)
          {
            v52 = +[NSString stringWithUTF8String:sqlite3_column_name(v67, N)];
            [v56 addObject:v52];
            objc_storeStrong((id *)&v52, 0);
          }
          char v57 = 1;
        }
        id v51 = (id)objc_opt_new();
        int iCol = 0;
        memset(v49, 0, 0x40uLL);
        id v18 = v56;
        id v19 = [v18 countByEnumeratingWithState:v49 objects:v89 count:16];
        if (v19)
        {
          uint64_t v15 = *(void *)v49[2];
          uint64_t v16 = 0;
          id v17 = v19;
          while (1)
          {
            uint64_t v14 = v16;
            if (*(void *)v49[2] != v15) {
              objc_enumerationMutation(v18);
            }
            v49[8] = *(void *)(v49[1] + 8 * v16);
            int v48 = sqlite3_column_type(v67, iCol);
            switch(v48)
            {
              case 1:
                int v13 = +[NSNumber numberWithLongLong:sqlite3_column_int64(v67, iCol)];
                objc_msgSend(v51, "setObject:forKeyedSubscript:");

                break;
              case 2:
                int v12 = +[NSNumber numberWithDouble:sqlite3_column_double(v67, iCol)];
                objc_msgSend(v51, "setObject:forKeyedSubscript:");

                break;
              case 3:
                id v11 = +[NSString stringWithUTF8String:sqlite3_column_text(v67, iCol)];
                objc_msgSend(v51, "setObject:forKeyedSubscript:");

                break;
            }
            ++iCol;
            ++v16;
            if (v14 + 1 >= (unint64_t)v17)
            {
              uint64_t v16 = 0;
              id v17 = [v18 countByEnumeratingWithState:v49 objects:v89 count:16];
              if (!v17) {
                break;
              }
            }
          }
        }

        [v55 addObject:v51];
        objc_storeStrong(&v51, 0);
      }
      id v88 = v55;
      int v76 = 1;
      objc_storeStrong(&v55, 0);
      objc_storeStrong(&v56, 0);
    }
    objc_storeStrong(&v70, 0);
    objc_storeStrong(&v71, 0);
    objc_storeStrong(&v74, 0);
    objc_storeStrong(&v75, 0);
  }
  objc_storeStrong(&v79, 0);
  objc_storeStrong(&v82, 0);
  objc_storeStrong(&v84, 0);
  objc_storeStrong(&v85, 0);
  objc_storeStrong(&v86, 0);
  objc_storeStrong(&location, 0);
  id v9 = v88;

  return v9;
}

void sub_10000B1B0(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v35 = 0;
  objc_storeStrong(&v35, a3);
  id v34 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v32 = location[0];
    id v31 = (id)objc_opt_new();
    id v6 = [v32 keyValues];
    id v5 = [v6 objectForKeyedSubscript:@"WiFiInternalSSIDs"];
    id v4 = [v5 arrayValue];
    objc_msgSend(v31, "setInternalSSIDs:");

    id v9 = [v32 keyValues];
    id v8 = [v9 objectForKeyedSubscript:@"MacRandomization"];
    id v7 = [v8 dictionaryValue];
    objc_msgSend(v31, "setDisabledMacRandomizationVersions:");

    id v12 = [v32 keyValues];
    id v11 = [v12 objectForKeyedSubscript:@"SoftErrors"];
    id v10 = [v11 dictionaryValue];
    objc_msgSend(v31, "setSoftErrors:");

    id v15 = [v32 keyValues];
    id v14 = [v15 objectForKeyedSubscript:@"DataPathTelemetry"];
    id v13 = [v14 dictionaryValue];
    objc_msgSend(v31, "setDatapathTelemetry:");

    id v18 = [v32 keyValues];
    id v17 = [v18 objectForKeyedSubscript:@"JTRN"];
    id v16 = [v17 dictionaryValue];
    objc_msgSend(v31, "setJtrnDefaults:");

    id v21 = [v32 keyValues];
    id v20 = [v21 objectForKeyedSubscript:@"WiFiAmbiguousSSIDs"];
    id v19 = [v20 arrayValue];
    objc_msgSend(v31, "setAmbiguousSSIDs:");

    id v24 = [v32 keyValues];
    id v23 = [v24 objectForKeyedSubscript:@"AccessPointProfile"];
    id v22 = [v23 dictionaryValue];
    objc_msgSend(v31, "setApProfile:");

    id v27 = [v32 keyValues];
    id v26 = [v27 objectForKeyedSubscript:@"BeaconParsing"];
    id v25 = [v26 dictionaryValue];
    objc_msgSend(v31, "setBeaconParsing:");

    if (a1[4]) {
      (*(void (**)(void))(a1[4] + 16))();
    }
    objc_storeStrong(&v31, 0);
    objc_storeStrong(&v32, 0);
    int v33 = 0;
  }
  else
  {
    id v3 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v3);
    NSLog(@"Error: Response is not of type WCAFetchKeyValuesResponse, instead its %@", v28);

    if (a1[4]) {
      (*(void (**)(void))(a1[4] + 16))();
    }
    int v33 = 1;
  }
  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

int main(int argc, const char **argv, const char **envp)
{
  int v7 = 0;
  int v6 = argc;
  v5[1] = argv;
  v5[0] = (id)objc_opt_new();
  id v4 = +[NSXPCListener serviceListener];
  [(NSXPCListener *)v4 setDelegate:v5[0]];
  [(NSXPCListener *)v4 resume];
  int v7 = 0;
  objc_storeStrong((id *)&v4, 0);
  objc_storeStrong(v5, 0);
  return v7;
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return _SCNetworkReachabilityCreateWithAddress(allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return _sqlite3_bind_double(a1, a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return _sqlite3_bind_int(a1, a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return _sqlite3_bind_int64(a1, a2, a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return _sqlite3_bind_text(a1, a2, a3, a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int64(a1, iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return _sqlite3_column_name(a1, N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_text(a1, iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_type(a1, iCol);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return _sqlite3_prepare_v2(db, zSql, nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return _sqlite3_step(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

id objc_msgSend_UAPSD(void *a1, const char *a2, ...)
{
  return [a1 UAPSD];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__getNetworkReachability(void *a1, const char *a2, ...)
{
  return [a1 _getNetworkReachability];
}

id objc_msgSend__loadDefaultsFromLocalFile(void *a1, const char *a2, ...)
{
  return [a1 _loadDefaultsFromLocalFile];
}

id objc_msgSend_antennas11c(void *a1, const char *a2, ...)
{
  return [a1 antennas11c];
}

id objc_msgSend_antennas11n(void *a1, const char *a2, ...)
{
  return [a1 antennas11n];
}

id objc_msgSend_arrayValue(void *a1, const char *a2, ...)
{
  return [a1 arrayValue];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_beaconInterval(void *a1, const char *a2, ...)
{
  return [a1 beaconInterval];
}

id objc_msgSend_beaconsDataAsset(void *a1, const char *a2, ...)
{
  return [a1 beaconsDataAsset];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_columnNames(void *a1, const char *a2, ...)
{
  return [a1 columnNames];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return [a1 dictionaryValue];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return [a1 extension];
}

id objc_msgSend_fetchWiFiAssetsFromServer(void *a1, const char *a2, ...)
{
  return [a1 fetchWiFiAssetsFromServer];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalUrl];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_keyValues(void *a1, const char *a2, ...)
{
  return [a1 keyValues];
}

id objc_msgSend_keys(void *a1, const char *a2, ...)
{
  return [a1 keys];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_latestInstalledAsset(void *a1, const char *a2, ...)
{
  return [a1 latestInstalledAsset];
}

id objc_msgSend_latestInstalledVersion(void *a1, const char *a2, ...)
{
  return [a1 latestInstalledVersion];
}

id objc_msgSend_latestNotInstalledAsset(void *a1, const char *a2, ...)
{
  return [a1 latestNotInstalledAsset];
}

id objc_msgSend_latestNotInstalledVersion(void *a1, const char *a2, ...)
{
  return [a1 latestNotInstalledVersion];
}

id objc_msgSend_limit(void *a1, const char *a2, ...)
{
  return [a1 limit];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return [a1 objCType];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_records(void *a1, const char *a2, ...)
{
  return [a1 records];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_tableName(void *a1, const char *a2, ...)
{
  return [a1 tableName];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return [a1 totalExpected];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return [a1 totalWritten];
}

id objc_msgSend_wifiBehaviorPlistAsset(void *a1, const char *a2, ...)
{
  return [a1 wifiBehaviorPlistAsset];
}

id objc_msgSend_wlanAsel(void *a1, const char *a2, ...)
{
  return [a1 wlanAsel];
}

id objc_msgSend_wlanFixedCapabilities(void *a1, const char *a2, ...)
{
  return [a1 wlanFixedCapabilities];
}

id objc_msgSend_wlanHTAmpduparam(void *a1, const char *a2, ...)
{
  return [a1 wlanHTAmpduparam];
}

id objc_msgSend_wlanHTCapabilities(void *a1, const char *a2, ...)
{
  return [a1 wlanHTCapabilities];
}

id objc_msgSend_wlanHtexCapabilities(void *a1, const char *a2, ...)
{
  return [a1 wlanHtexCapabilities];
}

id objc_msgSend_wlanTimDtimPeriod(void *a1, const char *a2, ...)
{
  return [a1 wlanTimDtimPeriod];
}

id objc_msgSend_wlanTxbf(void *a1, const char *a2, ...)
{
  return [a1 wlanTxbf];
}

id objc_msgSend_wlanVhtCapabilities(void *a1, const char *a2, ...)
{
  return [a1 wlanVhtCapabilities];
}

id objc_msgSend_wlanWfaIeWmeQosInfo(void *a1, const char *a2, ...)
{
  return [a1 wlanWfaIeWmeQosInfo];
}