id sub_100004674(id a1)
{
  uint64_t v1;

  return a1;
}

void sub_100004698(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100004E48(id a1)
{
  off_10003DA48 = os_log_create("com.apple.FedStats", "Framework");
  _objc_release_x1();
}

id sub_100005404(id a1, NSArray *a2, id *a3)
{
  v3 = a2;
  v4 = [(NSArray *)v3 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = 0;
  if (isKindOfClass)
  {
    v7 = [(NSArray *)v3 objectAtIndexedSubscript:0];
    v6 = +[FedStatsUtil sha1:v7];
  }
  return v6;
}

id sub_1000054B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 objectAtIndexedSubscript:0];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v6 = 0;
  if (isKindOfClass)
  {
    v7 = [v3 objectAtIndexedSubscript:0];
    id v8 = [v7 rangeOfCharacterFromSet:*(void *)(a1 + 32)];

    v6 = 0;
    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = [v3 objectAtIndexedSubscript:0];
      v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", +[FedStatsUtil bitStringToInt:v9]);
    }
  }

  return v6;
}

void sub_100009540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009558(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009568(uint64_t a1)
{
}

void sub_100009570(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = (id)(*(void *)(a1 + 40) - 1);
  if (v5 == [a3 index]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v6];
  }
}

int64_t sub_100009F98(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

void sub_10000C8A8(uint64_t a1)
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = v2;
  if (!v2)
  {
    uint64_t v19 = +[_DPMLRuntimeError errorWithCode:300 description:@"Cannot load class bundle"];
    v20 = (void *)qword_10003DCB0;
    qword_10003DCB0 = v19;

    goto LABEL_30;
  }
  v4 = [v2 URLForResource:@"DPMLRecipeIDAssociations" withExtension:@"plist"];
  if (!v4)
  {
    uint64_t v21 = +[_DPMLRuntimeError errorWithCode:300 description:@"Cannot find associations file from class bundle"];
    v22 = (void *)qword_10003DCB0;
    qword_10003DCB0 = v21;

    goto LABEL_29;
  }
  id v5 = +[NSDictionary dictionaryWithContentsOfURL:v4];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v23 = +[_DPMLRuntimeError errorWithCode:300 description:@"Cannot load association file from class bundle file"];
    v18 = (void *)qword_10003DCB0;
    qword_10003DCB0 = v23;
    goto LABEL_25;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (!v8) {
    goto LABEL_21;
  }
  uint64_t v9 = *(void *)v38;
  v32 = v7;
  uint64_t v29 = a1;
  uint64_t v30 = *(void *)v38;
  while (2)
  {
    uint64_t v10 = 0;
    id v31 = v8;
    do
    {
      if (*(void *)v38 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void *)(*((void *)&v37 + 1) + 8 * (void)v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v26 = +[_DPMLRuntimeError errorWithCode:300 description:@"Associations must have strings as keys"];
        id v12 = (id)qword_10003DCB0;
        qword_10003DCB0 = v26;
LABEL_27:

        goto LABEL_28;
      }
      id v12 = [v7 objectForKey:v11];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v27 = +[_DPMLRuntimeError errorWithCode:300 description:@"Associations must have arrays of strings as values"];
        v28 = (void *)qword_10003DCB0;
        qword_10003DCB0 = v27;

        goto LABEL_27;
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v12 = v12;
      v13 = (char *)[v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v13)
      {
        v14 = v13;
        uint64_t v15 = *(void *)v34;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(void *)v34 != v15) {
              objc_enumerationMutation(v12);
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uint64_t v24 = +[_DPMLRuntimeError errorWithCode:300 description:@"Associations must have arrays of strings as values"];
              v25 = (void *)qword_10003DCB0;
              qword_10003DCB0 = v24;

              id v7 = v32;
              goto LABEL_27;
            }
          }
          v14 = (char *)[v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }

      uint64_t v10 = (char *)v10 + 1;
      id v7 = v32;
      uint64_t v9 = v30;
    }
    while (v10 != v31);
    id v8 = [v32 countByEnumeratingWithState:&v37 objects:v42 count:16];
    a1 = v29;
    if (v8) {
      continue;
    }
    break;
  }
LABEL_21:

  id v17 = [objc_alloc(*(Class *)(a1 + 32)) initWithAssociation:v7];
  v18 = (void *)qword_10003DCA8;
  qword_10003DCA8 = (uint64_t)v17;
LABEL_25:

LABEL_28:
LABEL_29:

LABEL_30:
}

void sub_10000D764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_10000D784(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 count];
  if (v5 && v7)
  {
    if (*(int *)(a1 + 72) < 1)
    {
      int v12 = 1;
    }
    else
    {
      id v8 = [SqliteClient alloc];
      uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
      uint64_t v10 = [(SqliteClient *)v8 initWithFile:v9 error:*(void *)(a1 + 64)];

      unsigned int v11 = [(SqliteClient *)v10 getTotalCount:*(void *)(a1 + 64)];
      if (!v10)
      {
        id v17 = +[_PFLLog extension];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_10001F674((uint64_t)v5, v17);
        }
        uint64_t v19 = (uint64_t)v5;
        goto LABEL_24;
      }
      int v12 = v11;
    }
    v13 = *(void **)(a1 + 40);
    uint64_t v36 = kDPMetadataAlgorithmParameters;
    uint64_t v34 = kDPMetadataAlgoParamDimensionality;
    v14 = +[NSNumber numberWithInt:((v12 << *(_DWORD *)(a1 + 76)) + 1)];
    long long v35 = v14;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    long long v37 = v15;
    v16 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v17 = [v13 updateMetadataWithDPParameters:v16];

    v18 = +[_PFLLog extension];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = (uint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "metadata %@.", buf, 0xCu);
    }

    uint64_t v19 = +[NSString stringWithFormat:@"%@_%@", v5, @"prefix"];

    v20 = [*(id *)(a1 + 48) clientIdentifier];
    v31[0] = v20;
    v31[1] = v19;
    uint64_t v21 = [*(id *)(a1 + 40) experimentIdentifier];
    v31[2] = v21;
    v22 = [*(id *)(a1 + 40) deploymentIdentifier];
    v31[3] = v22;
    uint64_t v23 = [*(id *)(a1 + 40) treatmentIdentifier];
    v31[4] = v23;
    uint64_t v24 = +[NSArray arrayWithObjects:v31 count:5];

    v25 = [v24 componentsJoinedByString:@":"];
    uint64_t v26 = +[_PFLLog extension];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = (uint64_t)v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "baseKey %@.", buf, 0xCu);
    }

    unsigned int v27 = +[FedStatsDataEncoder record:v6 metadata:v17 baseKey:v25];
    v28 = +[_PFLLog extension];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_10001F9B8((uint64_t)v6, v19, v28);
    }

    uint64_t v29 = +[_PFLLog extension];
    uint64_t v30 = v29;
    if (v27)
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v19;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Record %@ data succeed.", buf, 0xCu);
      }

      *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v6 count];
    }
    else
    {
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10001F984();
      }
    }
LABEL_24:

    id v5 = (id)v19;
  }
}

void sub_10000EF20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EF38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000EF48(uint64_t a1)
{
}

void sub_10000EF50(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) huffmanCode:v3 error:0];
  if (!v4)
  {
    id v4 = *(id *)(a1 + 40);
    id v5 = +[_PFLLog extension];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Can not encode the character %@.", (uint8_t *)&v6, 0xCu);
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendString:v4];
}

void sub_10000F3D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000F44C(id a1)
{
  off_10003DB10 = os_log_create("com.apple.PrivateFederatedLearning", "Framework");
  _objc_release_x1();
}

void sub_10000F4E4(id a1)
{
  qword_10003DCD0 = (uint64_t)os_log_create("com.apple.PrivateFederatedLearning", "Telemetry");
  _objc_release_x1();
}

void sub_10000F57C(id a1)
{
  off_10003DB18 = os_log_create("com.apple.PrivateFederatedLearning", "MLRuntimePlugin");
  _objc_release_x1();
}

void sub_10000FB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FB94(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000FBA4(uint64_t a1)
{
}

void sub_10000FBAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 length] >= 2) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void sub_100011364(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100011380(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100011650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011668(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011678(uint64_t a1)
{
}

void sub_100011680(id a1, BPSCompletion *a2)
{
  v2 = a2;
  id v3 = [(BPSCompletion *)v2 state];
  id v4 = +[_PFLLog extension];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      int v6 = [(BPSCompletion *)v2 error];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BiomeKeyboardClient read data error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (v5)
  {
    LOWORD(v7) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "BiomeKeyboardClient read data succeed", (uint8_t *)&v7, 2u);
  }
}

id sub_10001178C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:a2];
}

unsigned char *sub_100011FC0(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_100011FD0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

int64_t sub_1000134E4(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

id sub_100017300(void *a1, void *a2)
{
  id v18 = a1;
  id v3 = a2;
  id v17 = +[NSMutableDictionary dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKey:v9];
        unsigned int v11 = [v10 objectForKey:@"dataType"];
        if ((id)+[FedStatsDataTypeFactory dataTypeFromString:v11] == (id)3)
        {
          int v12 = [v10 objectForKey:@"categoryFile"];
          if (v12)
          {
            if (!+[FedStatsDataCohort checkCohortField:v12 forNamespaceID:v18])
            {
              uint64_t v15 = +[_PFLLog extension];
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
                sub_1000205A8();
              }

              id v14 = 0;
              v13 = v17;
              goto LABEL_17;
            }
            [v17 setObject:v12 forKey:v9];
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  v13 = v17;
  id v14 = v17;
LABEL_17:

  return v14;
}

uint64_t sub_100017540(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (([v6 hasSuffix:@"with-private-relay"] & 1) != 0
    || [&off_100034658 containsObject:v6])
  {
    id v8 = +[_PFLLog extension];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000206EC();
    }

    if (![v6 hasSuffix:@"with-private-relay"]
      || ([v5 containsString:@"privacyProxy = 1"] & 1) != 0)
    {
      uint64_t v9 = [v7 objectForKey:kDPMetadataDediscoServerConfiguration];
      uint64_t v10 = v9;
      if (v9)
      {
        unsigned int v11 = [v9 objectForKey:kDPMetadataDediscoServerConfigurationHelpers];
        int v12 = v11;
        if (v11)
        {
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          int v12 = v11;
          id v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v24;
            while (2)
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v24 != v15) {
                  objc_enumerationMutation(v12);
                }
                if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "containsString:", @"apple", (void)v23))
                {
                  long long v20 = +[_PFLLog extension];
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
                    sub_100020684();
                  }

                  uint64_t v17 = 0;
                  goto LABEL_30;
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
          uint64_t v17 = 1;
LABEL_30:

          goto LABEL_35;
        }
        long long v21 = +[_PFLLog extension];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100020650();
        }
      }
      else
      {
        int v12 = +[_PFLLog extension];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10002061C();
        }
      }
      uint64_t v17 = 0;
LABEL_35:

LABEL_42:
      goto LABEL_43;
    }
    uint64_t v10 = +[_PFLLog extension];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  unsigned int v18 = [v6 hasSuffix:@"without-private-relay"];
  uint64_t v10 = +[_PFLLog extension];
  BOOL v19 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (!v18)
  {
    if (v19) {
      sub_100020754();
    }
    uint64_t v17 = 1;
    goto LABEL_42;
  }
  if (v19) {
    sub_100020720();
  }

  if (([v5 containsString:@"privacyProxy = 0"] & 1) == 0)
  {
    uint64_t v10 = +[_PFLLog extension];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
LABEL_40:
    }
      sub_1000206B8();
LABEL_41:
    uint64_t v17 = 0;
    goto LABEL_42;
  }
  uint64_t v17 = 1;
LABEL_43:

  return v17;
}

void sub_100017EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100017F30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100017F40(uint64_t a1)
{
}

void sub_100017F48(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [v3 error];
    uint64_t v5 = +[_DPMLRuntimeError errorWithCode:200 underlyingError:v4 description:@"DSL Completion Error"];
    uint64_t v6 = *(void *)(a1[5] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(a1[6] + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = 0;
  }
  else
  {
    uint64_t v10 = +[_PFLLog extension];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Biome Stream Transaction Complete", buf, 2u);
    }
  }
  unsigned int v11 = (void *)a1[4];
  uint64_t v12 = *(void *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v13 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v13 + 40);
  id v14 = [v11 recordDataArray:v12 error:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);

  if (v14)
  {
    *(void *)(*(void *)(a1[7] + 8) + 24) += [*(id *)(*(void *)(a1[6] + 8) + 40) count];
    [*(id *)(*(void *)(a1[6] + 8) + 40) removeAllObjects];
  }
  else
  {
    uint64_t v15 = +[_PFLLog extension];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000208D0((uint64_t)(a1 + 5), v15);
    }

    uint64_t v16 = *(void *)(a1[6] + 8);
    uint64_t v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;
  }
}

void sub_10001810C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v4 = +[NSMutableArray array];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  if (v3)
  {
    id v7 = +[_PFLLog extension];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100020954();
    }

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (isKindOfClass) {
      [v9 addObjectsFromArray:v3];
    }
    else {
      [v9 addObject:v3];
    }
  }
}

void sub_10001A0C8(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  qword_10003DCE0 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, objc_opt_class(), 0);
  _objc_release_x1();
}

void sub_10001A2D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_10001A2F4(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_10001A308(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

uint64_t sub_10001AEA8(uint64_t a1)
{
  qword_10003DCF0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

uint64_t sub_10001B0D4(uint64_t a1)
{
  qword_10003DD00 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

void sub_10001BBA0(uint64_t a1)
{
  id v17 = 0;
  uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 URLForResource:@"DPMLSQLQueryAllowList" withExtension:@"plist"];
    if (v4)
    {
      uint64_t v5 = +[_DPMLSQLQueryValidator parseQueryPermissionList:v4 error:&v17];
      if (v5)
      {
        uint64_t v6 = [v3 URLForResource:@"DPMLSQLQueryBlockList" withExtension:@"plist"];
        if (v6)
        {
          id v7 = +[_DPMLSQLQueryValidator parseQueryPermissionList:v6 error:&v17];
          if (v7)
          {
            id v8 = [objc_alloc(*(Class *)(a1 + 32)) initWithAllowList:v5 blockList:v7];
            uint64_t v9 = (void *)qword_10003DD10;
            qword_10003DD10 = (uint64_t)v8;
          }
          else
          {
            uint64_t v16 = +[_DPMLRuntimeError errorWithCode:300 underlyingError:v17 description:@"Cannot create block-list"];
            uint64_t v9 = (void *)qword_10003DD18;
            qword_10003DD18 = v16;
          }
        }
        else
        {
          uint64_t v15 = +[_DPMLRuntimeError errorWithCode:300 description:@"Cannot find block-list from class bundle"];
          id v7 = (void *)qword_10003DD18;
          qword_10003DD18 = v15;
        }
      }
      else
      {
        uint64_t v14 = +[_DPMLRuntimeError errorWithCode:300 underlyingError:v17 description:@"Cannot create allow-list"];
        uint64_t v6 = (void *)qword_10003DD18;
        qword_10003DD18 = v14;
      }
    }
    else
    {
      uint64_t v12 = +[_DPMLRuntimeError errorWithCode:300 description:@"Cannot find allow-list from class bundle"];
      uint64_t v13 = (void *)qword_10003DD18;
      qword_10003DD18 = v12;
    }
  }
  else
  {
    uint64_t v10 = +[_DPMLRuntimeError errorWithCode:300 description:@"Cannot load class bundle"];
    unsigned int v11 = (void *)qword_10003DD18;
    qword_10003DD18 = v10;
  }
}

void sub_10001D43C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[_PFLLog extension];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100020D04(a1, a2, v4);
  }
}

void sub_10001D4A0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = +[_PFLLog extension];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100020D88();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10001D688(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = +[_PFLLog extension];
  id v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100020F48();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_100020EA0(a1, v7);
  }
}

void sub_10001DBE0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_10001DBF8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10001E4D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = +[_PFLLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002102C(a1, v6, v7);
    }
  }
  else
  {
    id v8 = [v5 containingBundle];
    id v7 = [v8 bundleIdentifier];

    if (v7)
    {
      uint64_t v9 = +[NSArray arrayWithObject:v5];
      uint64_t v10 = INSupportedMediaCategories();
      unsigned int v11 = [v5 objectForInfoDictionaryKey:INExtensionAttributesSupportedIntentsKey ofClass:objc_opt_class() inScope:0];
      if ([*(id *)(a1 + 40) _isSupportedIntentMediaApp:v7 :v10 :v11])
      {
        uint64_t v12 = [InstalledApp alloc];
        uint64_t v13 = [v10 allObjects];
        uint64_t v14 = [(InstalledApp *)v12 initWithBundleIdentifier:v7 supportedMediaCategories:v13 supportedIntents:v11 appName:0];

        uint64_t v15 = [*(id *)(*(void *)(a1 + 40) + 24) objectForKeyedSubscript:@"media"];
        [v15 addObject:v14];

        uint64_t v16 = +[_PFLLog framework];
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          id v17 = [v5 bundleIdentifier];
          int v18 = 138412802;
          BOOL v19 = v17;
          __int16 v20 = 2112;
          long long v21 = v11;
          __int16 v22 = 2112;
          long long v23 = v10;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "pluginkit record: %@ has supported intent %@ and supported media categories: %@", (uint8_t *)&v18, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v9 = +[_PFLLog framework];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100020FB4((uint64_t)v5, v9);
      }
    }
  }
}

BOOL sub_10001E960(id a1, InstalledApp *a2, BOOL *a3)
{
  uint64_t v3 = [(InstalledApp *)a2 bundleIdentifier];
  char v4 = [&off_100034670 containsObject:v3] ^ 1;

  return v4;
}

BOOL sub_10001E9A8(id a1, InstalledApp *a2, BOOL *a3)
{
  uint64_t v3 = [(InstalledApp *)a2 supportedIntents];
  char v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  unsigned __int8 v6 = [v3 containsObject:v5];

  return v6;
}

BOOL sub_10001EA10(id a1, InstalledApp *a2, BOOL *a3)
{
  uint64_t v3 = [(InstalledApp *)a2 supportedMediaCategories];
  char v4 = [v3 containsObject:@"INMediaCategoryVideo"] ^ 1;

  return v4;
}

void sub_10001EF94(uint64_t a1)
{
  memset(&v6, 0, 512);
  uname(&v6);
  id v2 = objc_alloc(*(Class *)(a1 + 32));
  uint64_t v3 = +[NSString stringWithCString:v6.machine encoding:4];
  id v4 = [v2 initWithDeviceType:v3];
  id v5 = (void *)qword_10003DD38;
  qword_10003DD38 = (uint64_t)v4;
}

void sub_10001F4F8(void *a1)
{
  uint64_t v1 = [a1 firstObject];
  id v2 = objc_opt_class();
  id v3 = sub_100004674(v2);
  sub_100004698((void *)&_mh_execute_header, v4, v5, "Recording data of type: %@ for key: %@", v6, v7, v8, v9, v10);
}

void sub_10001F594(void *a1)
{
  uint64_t v1 = [a1 firstObject];
  id v2 = objc_opt_class();
  id v3 = sub_100004674(v2);
  sub_100004698((void *)&_mh_execute_header, v4, v5, "Recording data of type array, with first object class: %@ for key: %@", v6, v7, v8, v9, v10);
}

void sub_10001F630(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot determine locale, will not proceed.", v1, 2u);
}

void sub_10001F674(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create SqliteClient for database %@.", (uint8_t *)&v2, 0xCu);
}

void sub_10001F6EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to register function bit_string_to_int in Biome", v1, 2u);
}

void sub_10001F730(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to register function sha1 in Biome", v1, 2u);
}

void sub_10001F774(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Query execution failed, %@", (uint8_t *)&v4, 0xCu);
}

void sub_10001F80C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to recordfor key: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001F884(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 firstObject];
  int v7 = 138412546;
  id v8 = (id)objc_opt_class();
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  id v6 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Recording data of type: %@ for key: %@", (uint8_t *)&v7, 0x16u);
}

void sub_10001F944()
{
  sub_10000F3EC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "No unknown data to process.", v1, 2u);
}

void sub_10001F984()
{
  sub_10000F3EC();
  sub_10000F3D0((void *)&_mh_execute_header, v0, v1, "Failed to record data with DifferentialPrivacy framework.", v2, v3, v4, v5, v6);
}

void sub_10001F9B8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Record data %@ for %@.", (uint8_t *)&v3, 0x16u);
}

void sub_10001FA40(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to load sqlite DB: %@.", (uint8_t *)&v2, 0xCu);
}

void sub_10001FAB8()
{
  sub_10000F3EC();
  sub_10000F3D0((void *)&_mh_execute_header, v0, v1, "No encoding database is provoided, should implement dataItemToBitString: encodingClient: in subclass.", v2, v3, v4, v5, v6);
}

void sub_10001FAEC()
{
  sub_10000F3EC();
  sub_10000F3D0((void *)&_mh_execute_header, v0, v1, "Default encoding only supports NSString now.", v2, v3, v4, v5, v6);
}

void sub_10001FB20(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to load sqlite DB.", v1, 2u);
}

void sub_10001FB64(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to record data with Differential Privacy framework.", v1, 2u);
}

void sub_10001FBA8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FC20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FC98()
{
  sub_10000F3EC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not fetch recipeAttachment from Trial Client for registered namespaces", v1, 2u);
}

void sub_10001FCD8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Start with task=%@", (uint8_t *)&v2, 0xCu);
}

void sub_10001FD50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FDC8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FE34(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  __int16 v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "End task with record events count: %@ error: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10001FEE8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001FF54()
{
  sub_10000F3EC();
  sub_100011380((void *)&_mh_execute_header, v0, v1, "Loaded recipe", v2, v3, v4, v5, v6);
}

void sub_10001FF88()
{
  sub_10000F3EC();
  sub_100011380((void *)&_mh_execute_header, v0, v1, "Received recipe attachment", v2, v3, v4, v5, v6);
}

void sub_10001FFBC()
{
  sub_10000F3EC();
  sub_100011380((void *)&_mh_execute_header, v0, v1, "Stopping extension", v2, v3, v4, v5, v6);
}

void sub_10001FFF0(unsigned char *a1, unsigned char *a2)
{
  sub_100011FC0(a1, a2);
  sub_100011FD0((void *)&_mh_execute_header, v2, v3, "BMKeyboardTokenFrequency has no locale, drop the event.", v4);
}

void sub_10002001C(unsigned char *a1, unsigned char *a2)
{
  sub_100011FC0(a1, a2);
  sub_100011FD0((void *)&_mh_execute_header, v2, v3, "The locale of BMKeyboardTokenFrequency is from multilingual keyboard, drop the event.", v4);
}

void sub_100020048(unsigned char *a1, unsigned char *a2)
{
  sub_100011FC0(a1, a2);
  sub_100011FD0((void *)&_mh_execute_header, v2, v3, "BMKeyboardTokenFrequency has unknown token type, drop the event.", v4);
}

void sub_100020074(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid SQL template: %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000200FC(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Cannot process data point, skipping...", buf, 2u);
}

void sub_10002013C(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Non-dictionary or nil in the input, skipping...", buf, 2u);
}

void sub_10002017C(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 debugDescription];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Cannot process data point: '%@', skipping", a1, 0xCu);
}

void sub_1000201F4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord failed to record bit vectors for key '%@'", (uint8_t *)&v2, 0xCu);
}

void sub_10002026C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord encoded data array, recording", v1, 2u);
}

void sub_1000202B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "encodeDataArrayAndRecord with baseKey = \"%@\"", (uint8_t *)&v2, 0xCu);
}

void sub_100020328(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Bitacora donation error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000203A0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  sub_10001A2E8();
  sub_10001A2D0((void *)&_mh_execute_header, a2, v4, "base64 graph dsl %@", v5);
}

void sub_10002042C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  sub_10001A2E8();
  sub_10001A2D0((void *)&_mh_execute_header, a2, v4, "base64 graph data %@", v5);
}

void sub_1000204B8(void *a1, NSObject *a2)
{
  [a1 UTF8String];
  sub_10001A2E8();
  sub_10001A2D0((void *)&_mh_execute_header, a2, v3, "base64 graph %s", v4);
}

void sub_10002053C()
{
  sub_10001A2E8();
  sub_10001A2D0((void *)&_mh_execute_header, v0, v1, "SQL Query: \"%@\"", v2);
}

void sub_1000205A8()
{
  sub_10001A2E8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Cannot use \"%@\" as categorical type database field", v1, 0xCu);
}

void sub_10002061C()
{
  sub_10000F3EC();
  sub_10000F3D0((void *)&_mh_execute_header, v0, v1, "Dedisco configuration is missing Server configuration.", v2, v3, v4, v5, v6);
}

void sub_100020650()
{
  sub_10000F3EC();
  sub_10000F3D0((void *)&_mh_execute_header, v0, v1, "Dedisco Server configuration is missing helper servers.", v2, v3, v4, v5, v6);
}

void sub_100020684()
{
  sub_10000F3EC();
  sub_10000F3D0((void *)&_mh_execute_header, v0, v1, "Helper in Dedisco Server configuration cannot be 1st party.", v2, v3, v4, v5, v6);
}

void sub_1000206B8()
{
  sub_10000F3EC();
  sub_10000F3D0((void *)&_mh_execute_header, v0, v1, "The SQL query does not filter against only private relay signal on the table.", v2, v3, v4, v5, v6);
}

void sub_1000206EC()
{
  sub_10000F3EC();
  sub_100011380((void *)&_mh_execute_header, v0, v1, "The client ID is associated with explicit use-case with private relay.", v2, v3, v4, v5, v6);
}

void sub_100020720()
{
  sub_10000F3EC();
  sub_100011380((void *)&_mh_execute_header, v0, v1, "The client ID is associated with explicit use-case without private relay.", v2, v3, v4, v5, v6);
}

void sub_100020754()
{
  sub_10000F3EC();
  sub_100011380((void *)&_mh_execute_header, v0, v1, "The client ID is not associated with private relay.", v2, v3, v4, v5, v6);
}

void sub_100020788(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10001A2D0((void *)&_mh_execute_header, a3, (uint64_t)a3, "Loaded publisher %@", (uint8_t *)a2);
}

void sub_1000207D8(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10001A2D0((void *)&_mh_execute_header, a3, (uint64_t)a3, "Running graph %@", (uint8_t *)a2);
}

void sub_100020830()
{
  sub_10000F3EC();
  sub_100011380((void *)&_mh_execute_header, v0, v1, "Nothing to record ¯\\_(ツ)_/¯", v2, v3, v4, v5, v6);
}

void sub_100020864()
{
  sub_10001A2E8();
  sub_10001A2D0((void *)&_mh_execute_header, v0, v1, "Cannot record all data: %@", v2);
}

void sub_1000208D0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Recording result failed with error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100020954()
{
  sub_10000F3EC();
  sub_100011380((void *)&_mh_execute_header, v0, v1, "Received event", v2, v3, v4, v5, v6);
}

void sub_100020988(char a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "recordStatus %d for key: %@", (uint8_t *)v3, 0x12u);
}

void sub_100020A14(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)sub_10001A2F4(a1, a2), "count");
  _DWORD *v3 = 134217984;
  void *v2 = v4;
  sub_10001A308((void *)&_mh_execute_header, v5, v6, "Recorded %lu data");
}

void sub_100020A64()
{
  sub_10001A2E8();
  sub_10001A2D0((void *)&_mh_execute_header, v0, v1, "levelURLs = %@", v2);
}

void sub_100020AD0()
{
  sub_10000F3EC();
  sub_100011380((void *)&_mh_execute_header, v0, v1, "No factors needed.", v2, v3, v4, v5, v6);
}

void sub_100020B04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)sub_10001A2F4(a1, a2), "allObjects");
  uint64_t v5 = [v4 componentsJoinedByString:@"', '"];
  _DWORD *v3 = 138412290;
  void *v2 = v5;
  sub_10001A308((void *)&_mh_execute_header, v6, v7, "factor fields in data = ['%@']");
}

void sub_100020B80(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "No cohorts were required.", buf, 2u);
}

void sub_100020BC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "recipe is not a dictionary.", v1, 2u);
}

void sub_100020C04(uint64_t *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  sub_10001DBE0((void *)&_mh_execute_header, a3, (uint64_t)a3, "Recipe %@ content: %@", (uint8_t *)&v5);
}

void sub_100020C8C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ does not exist, metadata is not changed, will use Dedisco V1.", (uint8_t *)&v2, 0xCu);
}

void sub_100020D04(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  sub_10001DBE0((void *)&_mh_execute_header, a3, (uint64_t)a3, "Downloading %@, progress %li", (uint8_t *)&v4);
}

void sub_100020D88()
{
  sub_10001DBC8();
  sub_10001DBF8((void *)&_mh_execute_header, v0, v1, "Trial failed to download %@, error %@");
}

void sub_100020DF4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 namespaceIdentifier];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v5;
  sub_10001DBE0((void *)&_mh_execute_header, a3, v6, "Removing factor %@ for namespace %@", (uint8_t *)&v7);
}

void sub_100020EA0(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) namespaceIdentifier];
  int v6 = 138412546;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  __int16 v9 = v4;
  sub_10001DBE0((void *)&_mh_execute_header, a2, v5, "Removing factor %@ for namespace %@ succeed.", (uint8_t *)&v6);
}

void sub_100020F48()
{
  sub_10001DBC8();
  sub_10001DBF8((void *)&_mh_execute_header, v0, v1, "Failed to delete %@, error %@");
}

void sub_100020FB4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error enumerating plugins; missing containing bundle of plugin: %@",
    (uint8_t *)&v2,
    0xCu);
}

void sub_10002102C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  __int16 v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error enumerating plugins; matching query: %@, error: %@",
    (uint8_t *)&v6,
    0x16u);
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFRelease(CFTypeRef cf)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return _CFStringTokenizerAdvanceToNextToken(tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFStringTokenizerCreate(alloc, string, range, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFRange CurrentTokenRange = _CFStringTokenizerGetCurrentTokenRange(tokenizer);
  CFIndex length = CurrentTokenRange.length;
  CFIndex location = CurrentTokenRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

uint64_t INSupportedMediaCategories()
{
  return _INSupportedMediaCategories();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int sqlite3_close(sqlite3 *a1)
{
  return _sqlite3_close(a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return _sqlite3_close_v2(a1);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return _sqlite3_column_count(pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_double(a1, iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return _sqlite3_column_int(a1, iCol);
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

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return _sqlite3_errmsg(a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return _sqlite3_errstr(a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return _sqlite3_exec(a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return _sqlite3_finalize(pStmt);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return _sqlite3_open(filename, ppDb);
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

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int uname(utsname *a1)
{
  return _uname(a1);
}

id objc_msgSend_DSLSupportedClassesSet(void *a1, const char *a2, ...)
{
  return [a1 DSLSupportedClassesSet];
}

id objc_msgSend_Keyboard(void *a1, const char *a2, ...)
{
  return [a1 Keyboard];
}

id objc_msgSend_SQL(void *a1, const char *a2, ...)
{
  return [a1 SQL];
}

id objc_msgSend_TokenFrequency(void *a1, const char *a2, ...)
{
  return [a1 TokenFrequency];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessedColumns(void *a1, const char *a2, ...)
{
  return [a1 accessedColumns];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowList(void *a1, const char *a2, ...)
{
  return [a1 allowList];
}

id objc_msgSend_allowed(void *a1, const char *a2, ...)
{
  return [a1 allowed];
}

id objc_msgSend_applyFilteringForMediaDomain(void *a1, const char *a2, ...)
{
  return [a1 applyFilteringForMediaDomain];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_association(void *a1, const char *a2, ...)
{
  return [a1 association];
}

id objc_msgSend_blockList(void *a1, const char *a2, ...)
{
  return [a1 blockList];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bound(void *a1, const char *a2, ...)
{
  return [a1 bound];
}

id objc_msgSend_bpsPublisher(void *a1, const char *a2, ...)
{
  return [a1 bpsPublisher];
}

id objc_msgSend_bucketBoundaries(void *a1, const char *a2, ...)
{
  return [a1 bucketBoundaries];
}

id objc_msgSend_bucketCount(void *a1, const char *a2, ...)
{
  return [a1 bucketCount];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_categories(void *a1, const char *a2, ...)
{
  return [a1 categories];
}

id objc_msgSend_categoryFile(void *a1, const char *a2, ...)
{
  return [a1 categoryFile];
}

id objc_msgSend_categoryMap(void *a1, const char *a2, ...)
{
  return [a1 categoryMap];
}

id objc_msgSend_classCount(void *a1, const char *a2, ...)
{
  return [a1 classCount];
}

id objc_msgSend_className(void *a1, const char *a2, ...)
{
  return [a1 className];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_cohortInstance(void *a1, const char *a2, ...)
{
  return [a1 cohortInstance];
}

id objc_msgSend_cohortName(void *a1, const char *a2, ...)
{
  return [a1 cohortName];
}

id objc_msgSend_cohortNameList(void *a1, const char *a2, ...)
{
  return [a1 cohortNameList];
}

id objc_msgSend_cohortObjects(void *a1, const char *a2, ...)
{
  return [a1 cohortObjects];
}

id objc_msgSend_columns(void *a1, const char *a2, ...)
{
  return [a1 columns];
}

id objc_msgSend_combinationSpec(void *a1, const char *a2, ...)
{
  return [a1 combinationSpec];
}

id objc_msgSend_containingBundle(void *a1, const char *a2, ...)
{
  return [a1 containingBundle];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
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

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataRecorderType(void *a1, const char *a2, ...)
{
  return [a1 dataRecorderType];
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return [a1 dataType];
}

id objc_msgSend_dataTypeContent(void *a1, const char *a2, ...)
{
  return [a1 dataTypeContent];
}

id objc_msgSend_dataTypes(void *a1, const char *a2, ...)
{
  return [a1 dataTypes];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return [a1 deploymentId];
}

id objc_msgSend_deploymentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deploymentIdentifier];
}

id objc_msgSend_describe(void *a1, const char *a2, ...)
{
  return [a1 describe];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dimensionality(void *a1, const char *a2, ...)
{
  return [a1 dimensionality];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainToInstalledApps(void *a1, const char *a2, ...)
{
  return [a1 domainToInstalledApps];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return [a1 experimentId];
}

id objc_msgSend_experimentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 experimentIdentifier];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return [a1 extension];
}

id objc_msgSend_factor(void *a1, const char *a2, ...)
{
  return [a1 factor];
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return [a1 fileValue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_framework(void *a1, const char *a2, ...)
{
  return [a1 framework];
}

id objc_msgSend_getResults(void *a1, const char *a2, ...)
{
  return [a1 getResults];
}

id objc_msgSend_graphDSL(void *a1, const char *a2, ...)
{
  return [a1 graphDSL];
}

id objc_msgSend_hasPath(void *a1, const char *a2, ...)
{
  return [a1 hasPath];
}

id objc_msgSend_hashLength(void *a1, const char *a2, ...)
{
  return [a1 hashLength];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isUnknownDictionaryCase(void *a1, const char *a2, ...)
{
  return [a1 isUnknownDictionaryCase];
}

id objc_msgSend_kAvailableTypes(void *a1, const char *a2, ...)
{
  return [a1 kAvailableTypes];
}

id objc_msgSend_kOutOfCategories(void *a1, const char *a2, ...)
{
  return [a1 kOutOfCategories];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return [a1 locationServicesEnabled];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_lsAppRecords(void *a1, const char *a2, ...)
{
  return [a1 lsAppRecords];
}

id objc_msgSend_lsPluginKitExtensions(void *a1, const char *a2, ...)
{
  return [a1 lsPluginKitExtensions];
}

id objc_msgSend_maxValue(void *a1, const char *a2, ...)
{
  return [a1 maxValue];
}

id objc_msgSend_minValue(void *a1, const char *a2, ...)
{
  return [a1 minValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_namespaceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 namespaceIdentifier];
}

id objc_msgSend_namespaceMap(void *a1, const char *a2, ...)
{
  return [a1 namespaceMap];
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return [a1 next];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numBucket(void *a1, const char *a2, ...)
{
  return [a1 numBucket];
}

id objc_msgSend_numOfMediaApps(void *a1, const char *a2, ...)
{
  return [a1 numOfMediaApps];
}

id objc_msgSend_numOfPhoneApps(void *a1, const char *a2, ...)
{
  return [a1 numOfPhoneApps];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_orderedKeys(void *a1, const char *a2, ...)
{
  return [a1 orderedKeys];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 punctuationCharacterSet];
}

id objc_msgSend_queryStatement(void *a1, const char *a2, ...)
{
  return [a1 queryStatement];
}

id objc_msgSend_recipeDictionary(void *a1, const char *a2, ...)
{
  return [a1 recipeDictionary];
}

id objc_msgSend_recipeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 recipeIdentifier];
}

id objc_msgSend_recipeType(void *a1, const char *a2, ...)
{
  return [a1 recipeType];
}

id objc_msgSend_recipeURL(void *a1, const char *a2, ...)
{
  return [a1 recipeURL];
}

id objc_msgSend_recordMetadata(void *a1, const char *a2, ...)
{
  return [a1 recordMetadata];
}

id objc_msgSend_recordParameters(void *a1, const char *a2, ...)
{
  return [a1 recordParameters];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_resetColumnAccessLog(void *a1, const char *a2, ...)
{
  return [a1 resetColumnAccessLog];
}

id objc_msgSend_resolveDomainToBundleIds(void *a1, const char *a2, ...)
{
  return [a1 resolveDomainToBundleIds];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sqlAccessTable(void *a1, const char *a2, ...)
{
  return [a1 sqlAccessTable];
}

id objc_msgSend_sqlQuery(void *a1, const char *a2, ...)
{
  return [a1 sqlQuery];
}

id objc_msgSend_sqliteDB(void *a1, const char *a2, ...)
{
  return [a1 sqliteDB];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stepSize(void *a1, const char *a2, ...)
{
  return [a1 stepSize];
}

id objc_msgSend_strides(void *a1, const char *a2, ...)
{
  return [a1 strides];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportedIntentMediaCategories(void *a1, const char *a2, ...)
{
  return [a1 supportedIntentMediaCategories];
}

id objc_msgSend_supportedIntents(void *a1, const char *a2, ...)
{
  return [a1 supportedIntents];
}

id objc_msgSend_supportedMediaCategories(void *a1, const char *a2, ...)
{
  return [a1 supportedMediaCategories];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_tokenFrequencies(void *a1, const char *a2, ...)
{
  return [a1 tokenFrequencies];
}

id objc_msgSend_tokenType(void *a1, const char *a2, ...)
{
  return [a1 tokenType];
}

id objc_msgSend_total(void *a1, const char *a2, ...)
{
  return [a1 total];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_transformName(void *a1, const char *a2, ...)
{
  return [a1 transformName];
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return [a1 treatmentId];
}

id objc_msgSend_treatmentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 treatmentIdentifier];
}

id objc_msgSend_triClient(void *a1, const char *a2, ...)
{
  return [a1 triClient];
}

id objc_msgSend_trialClient(void *a1, const char *a2, ...)
{
  return [a1 trialClient];
}

id objc_msgSend_typeConfiguration(void *a1, const char *a2, ...)
{
  return [a1 typeConfiguration];
}

id objc_msgSend_typesInCombination(void *a1, const char *a2, ...)
{
  return [a1 typesInCombination];
}

id objc_msgSend_underlyingErrors(void *a1, const char *a2, ...)
{
  return [a1 underlyingErrors];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_upstreams(void *a1, const char *a2, ...)
{
  return [a1 upstreams];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_validOpClassTransforms(void *a1, const char *a2, ...)
{
  return [a1 validOpClassTransforms];
}

id objc_msgSend_validOpClasses(void *a1, const char *a2, ...)
{
  return [a1 validOpClasses];
}

id objc_msgSend_validOpSQLTransformTemplates(void *a1, const char *a2, ...)
{
  return [a1 validOpSQLTransformTemplates];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}