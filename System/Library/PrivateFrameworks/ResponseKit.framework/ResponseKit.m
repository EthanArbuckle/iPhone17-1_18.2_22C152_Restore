id RKLinguisticCategoryToPreferenceKey(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = [NSNumber numberWithUnsignedInteger:a1];
  v2 = keyToCategoryMap();
  v3 = [v2 allKeysForObject:v1];

  if ([v3 count] == 1)
  {
    v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id keyToCategoryMap()
{
  if (keyToCategoryMap_onceToken != -1) {
    dispatch_once(&keyToCategoryMap_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)keyToCategoryMap_sKeyToCategoryMap;

  return v0;
}

__CFString *RKLinguisticCategoryForFSMType(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"xCONGRATULATIONx"])
  {
    uint64_t v2 = 37;
LABEL_13:
    RKLinguisticCategoryToPreferenceKey(v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if ([v1 isEqualToString:@"xNEWYEARx"])
  {
    uint64_t v2 = 39;
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"xBIRTHDAYx"])
  {
    uint64_t v2 = 38;
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"xTHINKING_OF_YOUx"])
  {
    uint64_t v2 = 41;
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"xCHINESENEWYEARx"])
  {
    uint64_t v2 = 40;
    goto LABEL_13;
  }
  if ([v1 isEqualToString:@"xSHOOTINGSTARx"])
  {
    uint64_t v2 = 42;
    goto LABEL_13;
  }
  v3 = @"Unknown";
LABEL_14:

  return v3;
}

uint64_t RKLinguisticCategoryFromPreferenceKey(void *a1)
{
  id v1 = a1;
  uint64_t v2 = keyToCategoryMap();
  v3 = [v2 objectForKeyedSubscript:v1];

  if (v3) {
    uint64_t v4 = [v3 unsignedIntegerValue];
  }
  else {
    uint64_t v4 = -1;
  }

  return v4;
}

void __keyToCategoryMap_block_invoke()
{
  v53[46] = *MEMORY[0x263EF8340];
  v52[0] = @"Unknown";
  v51 = [NSNumber numberWithUnsignedInteger:0];
  v53[0] = v51;
  v52[1] = @"QueryGeneral";
  v50 = [NSNumber numberWithUnsignedInteger:1];
  v53[1] = v50;
  v52[2] = @"QueryPolar";
  v49 = [NSNumber numberWithUnsignedInteger:2];
  v53[2] = v49;
  v52[3] = @"QueryPolarDefinite";
  v48 = [NSNumber numberWithUnsignedInteger:3];
  v53[3] = v48;
  v52[4] = @"QueryPolarRequest";
  v47 = [NSNumber numberWithUnsignedInteger:4];
  v53[4] = v47;
  v52[5] = @"QueryTagged";
  v46 = [NSNumber numberWithUnsignedInteger:5];
  v53[5] = v46;
  v52[6] = @"QueryAlternative";
  v45 = [NSNumber numberWithUnsignedInteger:6];
  v53[6] = v45;
  v52[7] = @"QueryPerson";
  v44 = [NSNumber numberWithUnsignedInteger:7];
  v53[7] = v44;
  v52[8] = @"QueryObject";
  v43 = [NSNumber numberWithUnsignedInteger:8];
  v53[8] = v43;
  v52[9] = @"QueryPersonOrObject";
  v42 = [NSNumber numberWithUnsignedInteger:9];
  v53[9] = v42;
  v52[10] = @"QueryPosessive";
  v41 = [NSNumber numberWithUnsignedInteger:10];
  v53[10] = v41;
  v52[11] = @"QueryLocation";
  v40 = [NSNumber numberWithUnsignedInteger:11];
  v53[11] = v40;
  v52[12] = @"QueryLocationSelf";
  v39 = [NSNumber numberWithUnsignedInteger:12];
  v53[12] = v39;
  v52[13] = @"QueryEvaluation";
  v38 = [NSNumber numberWithUnsignedInteger:13];
  v53[13] = v38;
  v52[14] = @"QueryEvaluationState";
  v37 = [NSNumber numberWithUnsignedInteger:14];
  v53[14] = v37;
  v52[15] = @"QueryReason";
  v36 = [NSNumber numberWithUnsignedInteger:15];
  v53[15] = v36;
  v52[16] = @"QueryDistance";
  v35 = [NSNumber numberWithUnsignedInteger:16];
  v53[16] = v35;
  v52[17] = @"QueryDimension";
  v34 = [NSNumber numberWithUnsignedInteger:17];
  v53[17] = v34;
  v52[18] = @"QueryCountable";
  v33 = [NSNumber numberWithUnsignedInteger:18];
  v53[18] = v33;
  v52[19] = @"QueryUncountable";
  v32 = [NSNumber numberWithUnsignedInteger:19];
  v53[19] = v32;
  v52[20] = @"QueryQuantity";
  v31 = [NSNumber numberWithUnsignedInteger:20];
  v53[20] = v31;
  v52[21] = @"QueryTime";
  v30 = [NSNumber numberWithUnsignedInteger:21];
  v53[21] = v30;
  v52[22] = @"QueryTimePast";
  v29 = [NSNumber numberWithUnsignedInteger:22];
  v53[22] = v29;
  v52[23] = @"QueryTimeFuture";
  v28 = [NSNumber numberWithUnsignedInteger:23];
  v53[23] = v28;
  v52[24] = @"QueryTimeOfDay";
  v27 = [NSNumber numberWithUnsignedInteger:24];
  v53[24] = v27;
  v52[25] = @"QueryDay";
  v26 = [NSNumber numberWithUnsignedInteger:25];
  v53[25] = v26;
  v52[26] = @"QueryMonth";
  v25 = [NSNumber numberWithUnsignedInteger:26];
  v53[26] = v25;
  v52[27] = @"QueryYear";
  v24 = [NSNumber numberWithUnsignedInteger:27];
  v53[27] = v24;
  v52[28] = @"QueryDuration";
  v23 = [NSNumber numberWithUnsignedInteger:28];
  v53[28] = v23;
  v52[29] = @"QueryFrequency";
  v22 = [NSNumber numberWithUnsignedInteger:29];
  v53[29] = v22;
  v52[30] = @"QueryAge";
  v21 = [NSNumber numberWithUnsignedInteger:30];
  v53[30] = v21;
  v52[31] = @"StatementGeneral";
  v20 = [NSNumber numberWithUnsignedInteger:31];
  v53[31] = v20;
  v52[32] = @"StatementGreeting";
  v19 = [NSNumber numberWithUnsignedInteger:32];
  v53[32] = v19;
  v52[33] = @"StatementImperative";
  v18 = [NSNumber numberWithUnsignedInteger:33];
  v53[33] = v18;
  v52[34] = @"StatementAppreciation";
  v17 = [NSNumber numberWithUnsignedInteger:34];
  v53[34] = v17;
  v52[35] = @"StatementApology";
  v16 = [NSNumber numberWithUnsignedInteger:35];
  v53[35] = v16;
  v52[36] = @"FixedPhrase";
  v15 = [NSNumber numberWithUnsignedInteger:36];
  v53[36] = v15;
  v52[37] = @"StatementCongratulation";
  v14 = [NSNumber numberWithUnsignedInteger:37];
  v53[37] = v14;
  v52[38] = @"StatementBirthday";
  v0 = [NSNumber numberWithUnsignedInteger:38];
  v53[38] = v0;
  v52[39] = @"StatementNewYear";
  id v1 = [NSNumber numberWithUnsignedInteger:39];
  v53[39] = v1;
  v52[40] = @"StatementChineseNewYear";
  uint64_t v2 = [NSNumber numberWithUnsignedInteger:40];
  v53[40] = v2;
  v52[41] = @"StatementThinkingOfYou";
  v3 = [NSNumber numberWithUnsignedInteger:41];
  v53[41] = v3;
  v52[42] = @"StatementShootingStar";
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:42];
  v53[42] = v4;
  v52[43] = @"QueryProactive";
  v5 = [NSNumber numberWithUnsignedInteger:43];
  v53[43] = v5;
  v52[44] = @"StatementPayment";
  v6 = [NSNumber numberWithUnsignedInteger:44];
  v53[44] = v6;
  v52[45] = @"QueryPhotoSharing";
  v7 = [NSNumber numberWithUnsignedInteger:45];
  v53[45] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:46];
  v9 = (void *)keyToCategoryMap_sKeyToCategoryMap;
  keyToCategoryMap_sKeyToCategoryMap = v8;

  for (uint64_t i = 0; i != 46; ++i)
  {
    v11 = (void *)keyToCategoryMap_sKeyToCategoryMap;
    v12 = [NSNumber numberWithUnsignedInteger:i];
    v13 = [v11 allKeysForObject:v12];
  }
}

void sub_217E28DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217E293A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

id _languageCodeForIdentifier(uint64_t a1)
{
  id v1 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:a1];
  uint64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263EFF508]];

  return v2;
}

id _regExPatternFromKeywords(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x21D45BF80]();
  v3 = [MEMORY[0x263F08AE8] escapedPatternForString:v1];
  uint64_t v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\s+", @" \\\\s+ ", 1024, 0, objc_msgSend(v3, "length"));
  v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

void sub_217E2E9A4(_Unwind_Exception *a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_217E2F138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217E2F824(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSUInteger NSSubtractRange(NSRange a1, NSRange a2)
{
  NSUInteger length = a2.length;
  NSUInteger location = a2.location;
  NSUInteger v4 = a1.length;
  NSUInteger v5 = a1.location;
  if (NSIntersectionRange(a1, a2).length)
  {
    v9.NSUInteger location = v5;
    v9.NSUInteger length = v4;
    v10.NSUInteger location = location;
    v10.NSUInteger length = length;
    NSRange v6 = NSIntersectionRange(v9, v10);
    if (v6.location != v5 || v6.length != v4)
    {
      if (v5 + v4 <= location + length) {
        uint64_t v7 = v5;
      }
      else {
        uint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (location > v5) {
        return v7;
      }
      else {
        return location + length;
      }
    }
  }
  return v5;
}

void sub_217E33660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_217E33DAC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_217E34E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_217E35900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217E384DC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_217E38954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217E3A3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_217E3AA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_217E3EDFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_217E42200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217E4238C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_217E4260C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)RKMontrealModel;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_217E427F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_217E4291C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_217E42A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217E42B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217E42F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217E43A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *__p,uint64_t a29)
{
  if (__p) {
    operator delete(__p);
  }
  objc_sync_exit(v29);

  _Unwind_Resume(a1);
}

uint64_t *std::map<int,int>::at(uint64_t a1, int *a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 8);
  if (!v2) {
LABEL_8:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  int v3 = *a2;
  while (1)
  {
    while (1)
    {
      int v4 = *((_DWORD *)v2 + 7);
      if (v3 >= v4) {
        break;
      }
      uint64_t v2 = (uint64_t *)*v2;
      if (!v2) {
        goto LABEL_8;
      }
    }
    if (v4 >= v3) {
      return v2 + 4;
    }
    uint64_t v2 = (uint64_t *)v2[1];
    if (!v2) {
      goto LABEL_8;
    }
  }
}

uint64_t IOMappings::lookupInput(IOMappings *this, char *a2, size_t a3)
{
  std::string::basic_string[abi:ne180100](__dst, a2, a3);
  int v4 = (IOMappings *)std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::find<std::string>((uint64_t)this, (const void **)__dst);
  NSUInteger v5 = v4;
  if ((IOMappings *)((char *)this + 8) == v4)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "UNKNOWN");
    uint64_t v7 = std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::find<std::string>((uint64_t)this, (const void **)__p);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    NSRange v6 = (unsigned int *)((char *)this + 96);
    if (v5 != (IOMappings *)v7) {
      NSRange v6 = (unsigned int *)(v7 + 56);
    }
  }
  else
  {
    NSRange v6 = (unsigned int *)((char *)v4 + 56);
  }
  uint64_t v8 = *v6;
  if (v13 < 0) {
    operator delete(__dst[0]);
  }
  return v8;
}

void sub_217E43CE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void sub_217E43FC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35)
{
  if (__p)
  {
    a35 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__51(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__52(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void sub_217E44480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35)
{
  if (__p)
  {
    a35 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_217E44710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217E44898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217E44A78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *findTopKClassifications(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a2 >= 6) {
    findTopKClassifications();
  }
  v19[0] = 0;
  v19[1] = 0;
  int v20 = 0;
  uint64_t v7 = a5 + a4;
  if (a5 + a4 > a4)
  {
    uint64_t v8 = a3 + 20 * a4;
    do
    {
      for (uint64_t i = 0; i != 20; i += 4)
        *(float *)((char *)v19 + i) = *(float *)(v8 + i) + *(float *)((char *)v19 + i);
      ++a4;
      v8 += 20;
    }
    while (a4 != v7);
  }
  uint64_t v10 = 0;
  float v11 = 0.0;
  do
  {
    float v11 = v11 + *(float *)((char *)v19 + v10);
    v10 += 4;
  }
  while (v10 != 20);
  for (uint64_t j = 0; j != 20; j += 4)
    *(float *)((char *)v19 + j) = *(float *)((char *)v19 + j) / v11;
  uint64_t v13 = 0;
  v14 = &v18;
  do
  {
    int v15 = *((_DWORD *)v19 + v13);
    *(v14 - 1) = v13;
    *(_DWORD *)v14 = v15;
    v14 += 2;
    ++v13;
  }
  while (v13 != 5);
  qsort_b(&v17, 5uLL, 0x10uLL, &__block_literal_global_118);
  return memcpy(a1, &v17, 16 * a2);
}

void sub_217E44D6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_217E44E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__82(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void sub_217E44F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

void sub_217E450AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    NSRange v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    NSRange v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2642D1CD8, MEMORY[0x263F8C060]);
}

void sub_217E451E0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t std::__tree<std::__value_type<std::string,int>,std::__map_value_compare<std::string,std::__value_type<std::string,int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,int>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    size_t v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      size_t v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    size_t v8 = a3;
  }
  else {
    size_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t ___ZL23findTopKClassificationsP31RKEventIdentifierClassificationmPKfmm_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3 = *(float *)(a2 + 8);
  float v4 = *(float *)(a3 + 8);
  if (v3 <= v4) {
    unsigned int v5 = 0;
  }
  else {
    unsigned int v5 = -1;
  }
  if (v3 < v4) {
    return 1;
  }
  else {
    return v5;
  }
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2642D1CE0, MEMORY[0x263F8C068]);
}

void sub_217E4546C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void std::vector<std::pair<int,int>>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,int>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *,false>(uint64_t result, int *a2, uint64_t a3, uint64_t a4, char a5)
{
  int v10 = (int *)result;
LABEL_2:
  float v11 = v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    int v10 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = ((char *)a2 - (char *)v11) >> 3;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          int v23 = *(a2 - 2);
          int v24 = *v11;
          if (v23 < *v11 || v24 >= v23 && *(a2 - 1) < v11[1])
          {
            int *v11 = v23;
            *(a2 - 2) = v24;
            int v25 = v11[1];
            v11[1] = *(a2 - 1);
            *(a2 - 1) = v25;
          }
          break;
        case 3uLL:
          __n128 result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v11, v11 + 2, a2 - 2);
          break;
        case 4uLL:
          __n128 result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v11, v11 + 2, v11 + 4, a2 - 2);
          break;
        case 5uLL:
          __n128 result = std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v11, v11 + 2, v11 + 4, v11 + 6, a2 - 2);
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v14 <= 191) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *,std::pair<int,int> *>(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[2 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x401)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v11, &v11[2 * (v15 >> 1)], a2 - 2);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v11 + 2, v17 - 2, a2 - 4);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v11 + 4, &v11[2 * v16 + 2], a2 - 6);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v17 - 2, v17, &v11[2 * v16 + 2]);
      uint64_t v18 = *(void *)v11;
      *(void *)float v11 = *(void *)v17;
      *(void *)uint64_t v17 = v18;
      if (a5) {
        goto LABEL_16;
      }
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(&v11[2 * (v15 >> 1)], v11, a2 - 2);
      if (a5) {
        goto LABEL_16;
      }
    }
    int v19 = *(v11 - 2);
    if (v19 >= *v11 && (*v11 < v19 || *(v11 - 1) >= v11[1]))
    {
      __n128 result = (uint64_t)std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<int,int> *,std::__less<void,void> &>(v11, a2);
      float v11 = (int *)result;
      goto LABEL_21;
    }
LABEL_16:
    int v20 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<int,int> *,std::__less<void,void> &>(v11, a2);
    if ((v21 & 1) == 0) {
      goto LABEL_19;
    }
    BOOL v22 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v11, v20);
    float v11 = v20 + 2;
    __n128 result = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v20 + 2, a2);
    if (result)
    {
      a4 = -v13;
      a2 = v20;
      if (v22) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v22)
    {
LABEL_19:
      __n128 result = std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *,false>(v10, v20, a3, -v13, a5 & 1);
      float v11 = v20 + 2;
LABEL_21:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v11, a2);
  }
  else
  {
    return (uint64_t)std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(v11, a2);
  }
}

_DWORD *std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(_DWORD *result, _DWORD *a2)
{
  if (result == a2) {
    return result;
  }
  uint64_t v2 = result + 2;
  if (result + 2 == a2) {
    return result;
  }
  uint64_t v3 = 0;
  float v4 = result;
  do
  {
    char v5 = v4;
    float v4 = v2;
    int v6 = v5[2];
    int v7 = *v5;
    if (v6 >= *v5 && (v7 < v6 || v5[3] >= v5[1])) {
      goto LABEL_18;
    }
    int v9 = v5[2];
    int v8 = v5[3];
    int v10 = v5[1];
    v5[2] = v7;
    v4[1] = v10;
    float v11 = result;
    if (v5 == result) {
      goto LABEL_17;
    }
    uint64_t v12 = v3;
    while (1)
    {
      int v13 = *(_DWORD *)((char *)result + v12 - 8);
      if (v13 <= v9) {
        break;
      }
      int v14 = *(_DWORD *)((char *)result + v12 - 4);
LABEL_11:
      v5 -= 2;
      unint64_t v15 = (_DWORD *)((char *)result + v12);
      _DWORD *v15 = v13;
      v15[1] = v14;
      v12 -= 8;
      if (!v12)
      {
        float v11 = result;
        goto LABEL_17;
      }
    }
    if (v13 >= v9)
    {
      float v11 = (_DWORD *)((char *)result + v12);
      int v14 = *(_DWORD *)((char *)result + v12 - 4);
      if (v14 <= v8) {
        goto LABEL_17;
      }
      goto LABEL_11;
    }
    float v11 = v5;
LABEL_17:
    _DWORD *v11 = v9;
    v11[1] = v8;
LABEL_18:
    uint64_t v2 = v4 + 2;
    v3 += 8;
  }
  while (v4 + 2 != a2);
  return result;
}

int *std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(int *result, int *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 2;
    if (result + 2 != a2)
    {
      uint64_t v3 = result + 1;
      do
      {
        float v4 = result;
        __n128 result = v2;
        int v5 = v4[2];
        int v6 = *v4;
        if (v5 < *v4 || v6 >= v5 && v4[3] < v4[1])
        {
          int v7 = *result;
          int v8 = result[1];
          for (uint64_t i = v3; ; i -= 2)
          {
            int v10 = *i;
            i[1] = v6;
            i[2] = v10;
            int v6 = *(i - 3);
            if (v6 <= v7 && (v6 < v7 || *(i - 2) <= v8)) {
              break;
            }
          }
          *(i - 1) = v7;
          *uint64_t i = v8;
        }
        uint64_t v2 = result + 2;
        v3 += 2;
      }
      while (result + 2 != a2);
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(int *a1, int *a2, int *a3)
{
  int v3 = *a2;
  int v4 = *a1;
  if (*a2 >= *a1 && (v4 < v3 || a2[1] >= a1[1]))
  {
    int v9 = *a3;
    if (*a3 >= v3 && (v3 < v9 || a3[1] >= a2[1])) {
      return 0;
    }
    *a2 = v9;
    *a3 = v3;
    float v11 = a2 + 1;
    int v10 = a2[1];
    a2[1] = a3[1];
    a3[1] = v10;
    int v12 = *a2;
    int v13 = *a1;
    if (*a2 >= *a1 && (v13 < v12 || *v11 >= a1[1])) {
      return 1;
    }
    *a1 = v12;
    int v6 = a1 + 1;
    *a2 = v13;
    uint64_t v8 = 2;
  }
  else
  {
    int v5 = *a3;
    if (*a3 < v3 || v3 >= v5 && a3[1] < a2[1])
    {
      *a1 = v5;
      int v6 = a1 + 1;
      *a3 = v4;
      int v7 = a3 + 1;
      uint64_t v8 = 1;
    }
    else
    {
      *a1 = v3;
      *a2 = v4;
      int v14 = a1[1];
      a1[1] = a2[1];
      a2[1] = v14;
      int v15 = *a3;
      int v16 = *a2;
      if (*a3 >= *a2 && (v16 < v15 || a3[1] >= v14)) {
        return 1;
      }
      *a2 = v15;
      *a3 = v16;
      int v7 = a3 + 1;
      uint64_t v8 = 2;
      int v6 = a2 + 1;
    }
    float v11 = v7;
  }
  int v17 = *v6;
  int *v6 = *v11;
  int *v11 = v17;
  return v8;
}

int *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<int,int> *,std::__less<void,void> &>(int *a1, int *a2)
{
  int v3 = *a1;
  int v2 = a1[1];
  int v4 = *(a2 - 2);
  if (v4 <= *a1 && (v4 < v3 || *(a2 - 1) <= v2))
  {
    for (uint64_t i = a1 + 2; i < a2 && *i <= v3 && (*i < v3 || i[1] <= v2); i += 2)
      ;
  }
  else
  {
    uint64_t i = a1;
    do
    {
      int v7 = i[2];
      i += 2;
      int v6 = v7;
    }
    while (v7 <= v3 && (v6 < v3 || i[1] <= v2));
  }
  if (i < a2)
  {
    for (a2 -= 2; v4 > v3 || v4 >= v3 && a2[1] > v2; a2 -= 2)
    {
      int v8 = *(a2 - 2);
      int v4 = v8;
    }
  }
  if (i < a2)
  {
    int v9 = *i;
    int v10 = *a2;
    do
    {
      *uint64_t i = v10;
      *a2 = v9;
      int v11 = i[1];
      i[1] = a2[1];
      a2[1] = v11;
      do
      {
        int v12 = i[2];
        i += 2;
        int v9 = v12;
      }
      while (v12 <= v3 && (v9 < v3 || i[1] <= v2));
      do
      {
        do
        {
          int v13 = *(a2 - 2);
          a2 -= 2;
          int v10 = v13;
          BOOL v14 = v13 < v3;
        }
        while (v13 > v3);
      }
      while (!v14 && a2[1] > v2);
    }
    while (i < a2);
  }
  if (i - 2 != a1)
  {
    *a1 = *(i - 2);
    a1[1] = *(i - 1);
  }
  *(i - 2) = v3;
  *(i - 1) = v2;
  return i;
}

_DWORD *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,std::pair<int,int> *,std::__less<void,void> &>(int *a1, _DWORD *a2)
{
  uint64_t v2 = 0;
  int v3 = *a1;
  int v4 = a1[1];
  while (1)
  {
    int v5 = a1[v2 + 2];
    if (v5 >= v3 && (v5 > v3 || a1[v2 + 3] >= v4)) {
      break;
    }
    v2 += 2;
  }
  unint64_t v6 = (unint64_t)&a1[v2 + 2];
  if (v2 * 4)
  {
    do
    {
      int v8 = *(a2 - 2);
      a2 -= 2;
      int v7 = v8;
    }
    while (v8 >= v3 && (v7 > v3 || a2[1] >= v4));
  }
  else
  {
LABEL_19:
    if (v6 < (unint64_t)a2)
    {
      do
      {
        int v10 = *(a2 - 2);
        a2 -= 2;
        int v9 = v10;
        if (v10 < v3) {
          break;
        }
        if (v9 > v3) {
          goto LABEL_19;
        }
      }
      while (a2[1] >= v4 && v6 < (unint64_t)a2);
    }
  }
  if (v6 >= (unint64_t)a2)
  {
    int v13 = (_DWORD *)v6;
  }
  else
  {
    int v12 = *a2;
    int v13 = (_DWORD *)v6;
    BOOL v14 = a2;
    do
    {
      _DWORD *v13 = v12;
      _DWORD *v14 = v5;
      int v15 = v13[1];
      v13[1] = v14[1];
      v14[1] = v15;
      do
      {
        do
        {
          int v16 = v13[2];
          v13 += 2;
          int v5 = v16;
          BOOL v17 = v16 <= v3;
        }
        while (v16 < v3);
      }
      while (v17 && v13[1] < v4);
      do
      {
        int v18 = *(v14 - 2);
        v14 -= 2;
        int v12 = v18;
      }
      while (v18 >= v3 && (v12 > v3 || v14[1] >= v4));
    }
    while (v13 < v14);
  }
  if (v13 - 2 != a1)
  {
    *a1 = *(v13 - 2);
    a1[1] = *(v13 - 1);
  }
  *(v13 - 2) = v3;
  *(v13 - 1) = v4;
  return v13 - 2;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(int *a1, int *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 3;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      int v6 = *(a2 - 2);
      int v7 = *a1;
      if (v6 < *a1 || v7 >= v6 && *(a2 - 1) < a1[1])
      {
        *a1 = v6;
        *(a2 - 2) = v7;
        int v8 = a1[1];
        a1[1] = *(a2 - 1);
        *(a2 - 1) = v8;
      }
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a1 + 2, a2 - 2);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a1 + 2, a1 + 4, a2 - 2);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a1 + 2, a1 + 4, a1 + 6, a2 - 2);
      return 1;
    default:
      int v9 = a1 + 4;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a1 + 2, a1 + 4);
      int v10 = a1 + 6;
      if (a1 + 6 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  do
  {
    int v13 = *v9;
    if (*v10 >= *v9 && (v13 < *v10 || v10[1] >= v9[1])) {
      goto LABEL_22;
    }
    int v14 = *v10;
    int v15 = v10[1];
    *int v10 = v13;
    v10[1] = v9[1];
    int v16 = a1;
    if (v9 == a1) {
      goto LABEL_21;
    }
    uint64_t v17 = v11;
    while (1)
    {
      int v18 = (char *)a1 + v17;
      int v19 = *(int *)((char *)a1 + v17 + 8);
      if (v19 > v14)
      {
        int v20 = *((_DWORD *)v18 + 3);
        goto LABEL_17;
      }
      if (v19 < v14)
      {
        int v16 = v9;
        goto LABEL_21;
      }
      int v20 = *(int *)((char *)a1 + v17 + 12);
      if (v20 <= v15) {
        break;
      }
LABEL_17:
      v9 -= 2;
      *((_DWORD *)v18 + 4) = v19;
      *(int *)((char *)a1 + v17 + 20) = v20;
      v17 -= 8;
      if (v17 == -16)
      {
        int v16 = a1;
        goto LABEL_21;
      }
    }
    int v16 = (int *)((char *)a1 + v17 + 16);
LABEL_21:
    int *v16 = v14;
    v16[1] = v15;
    if (++v12 == 8) {
      return v10 + 2 == a2;
    }
LABEL_22:
    int v9 = v10;
    v11 += 8;
    v10 += 2;
  }
  while (v10 != a2);
  return 1;
}

uint64_t std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(int *a1, int *a2, int *a3, int *a4)
{
  uint64_t result = std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a2, a3);
  int v9 = *a4;
  int v10 = *a3;
  if (*a4 < *a3 || v10 >= v9 && a4[1] < a3[1])
  {
    *a3 = v9;
    *a4 = v10;
    int v11 = a3[1];
    a3[1] = a4[1];
    a4[1] = v11;
    int v12 = *a3;
    int v13 = *a2;
    if (*a3 < *a2 || v13 >= v12 && a3[1] < a2[1])
    {
      *a2 = v12;
      *a3 = v13;
      int v14 = a2[1];
      a2[1] = a3[1];
      a3[1] = v14;
      int v15 = *a2;
      int v16 = *a1;
      if (*a2 < *a1 || v16 >= v15 && a2[1] < a1[1])
      {
        *a1 = v15;
        *a2 = v16;
        int v17 = a1[1];
        a1[1] = a2[1];
        a2[1] = v17;
      }
    }
  }
  return result;
}

uint64_t std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(int *a1, int *a2, int *a3, int *a4, int *a5)
{
  uint64_t result = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a2, a3, a4);
  int v11 = *a5;
  int v12 = *a4;
  if (*a5 < *a4 || v12 >= v11 && a5[1] < a4[1])
  {
    *a4 = v11;
    *a5 = v12;
    int v13 = a4[1];
    a4[1] = a5[1];
    a5[1] = v13;
    int v14 = *a4;
    int v15 = *a3;
    if (*a4 < *a3 || v15 >= v14 && a4[1] < a3[1])
    {
      *a3 = v14;
      *a4 = v15;
      int v16 = a3[1];
      a3[1] = a4[1];
      a4[1] = v16;
      int v17 = *a3;
      int v18 = *a2;
      if (*a3 < *a2 || v18 >= v17 && a3[1] < a2[1])
      {
        *a2 = v17;
        *a3 = v18;
        int v19 = a2[1];
        a2[1] = a3[1];
        a3[1] = v19;
        int v20 = *a2;
        int v21 = *a1;
        if (*a2 < *a1 || v21 >= v20 && a2[1] < a1[1])
        {
          *a1 = v20;
          *a2 = v21;
          int v22 = a1[1];
          a1[1] = a2[1];
          a2[1] = v22;
        }
      }
    }
  }
  return result;
}

int *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *,std::pair<int,int> *>(int *a1, int *a2, int *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) >> 3;
    if ((char *)a2 - (char *)a1 >= 9)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      int v12 = &a1[2 * v10];
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>((uint64_t)a1, a4, v9, v12);
        v12 -= 2;
        --v11;
      }
      while (v11);
    }
    int v13 = a2;
    if (a2 != a3)
    {
      int v14 = a2;
      do
      {
        int v15 = *v14;
        int v16 = *a1;
        if (*v14 < *a1 || v16 >= v15 && v14[1] < a1[1])
        {
          int *v14 = v16;
          *a1 = v15;
          int v17 = v14[1];
          v14[1] = a1[1];
          a1[1] = v17;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>((uint64_t)a1, a4, v9, a1);
        }
        v14 += 2;
      }
      while (v14 != a3);
      int v13 = a3;
    }
    if (v8 >= 9)
    {
      uint64_t v18 = (unint64_t)v8 >> 3;
      int v19 = a2 - 2;
      do
      {
        int v21 = *a1;
        int v20 = a1[1];
        int v22 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(a1, a4, v18);
        if (v19 == v22)
        {
          int *v22 = v21;
          v22[1] = v20;
        }
        else
        {
          int *v22 = *v19;
          v22[1] = v19[1];
          int *v19 = v21;
          v19[1] = v20;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>((uint64_t)a1, (uint64_t)(v22 + 2), a4, ((char *)(v22 + 2) - (char *)a1) >> 3);
        }
        v19 -= 2;
      }
      while (v18-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(uint64_t result, uint64_t a2, uint64_t a3, int *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 3)
    {
      uint64_t v6 = v4 >> 2;
      uint64_t v7 = (v4 >> 2) + 1;
      uint64_t v8 = (int *)(result + 8 * v7);
      uint64_t v9 = v6 + 2;
      if (v9 < a3)
      {
        int v10 = v8[2];
        if (*v8 < v10 || v10 >= *v8 && *(_DWORD *)(result + 8 * v7 + 4) < v8[3])
        {
          v8 += 2;
          uint64_t v7 = v9;
        }
      }
      int v11 = *v8;
      if (*v8 >= *a4 && (*a4 < v11 || v8[1] >= a4[1]))
      {
        int v12 = *a4;
        int v13 = a4[1];
        *a4 = v11;
        a4[1] = v8[1];
        if (v5 >= v7)
        {
          while (1)
          {
            uint64_t v15 = 2 * v7;
            uint64_t v7 = (2 * v7) | 1;
            int v14 = (int *)(result + 8 * v7);
            uint64_t v16 = v15 + 2;
            if (v16 < a3)
            {
              int v17 = v14[2];
              if (*v14 < v17 || v17 >= *v14 && *(_DWORD *)(result + 8 * v7 + 4) < v14[3])
              {
                v14 += 2;
                uint64_t v7 = v16;
              }
            }
            int v18 = *v14;
            if (*v14 < v12 || v18 <= v12 && v14[1] < v13) {
              break;
            }
            *uint64_t v8 = v18;
            v8[1] = v14[1];
            uint64_t v8 = v14;
            if (v5 < v7) {
              goto LABEL_22;
            }
          }
        }
        int v14 = v8;
LABEL_22:
        int *v14 = v12;
        v14[1] = v13;
      }
    }
  }
  return result;
}

_DWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(_DWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = result;
    uint64_t v7 = v3 + 1;
    result += 2 * v3 + 2;
    uint64_t v8 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v9 = v8 + 2;
    if (v9 < a3)
    {
      int v10 = result[2];
      if (*result < v10 || v10 >= *result && v6[2 * v7 + 1] < result[3])
      {
        result += 2;
        uint64_t v3 = v9;
      }
    }
    _DWORD *v6 = *result;
    v6[1] = result[1];
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::pair<int,int> *>(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    unint64_t v5 = v4 >> 1;
    uint64_t v6 = (int *)(result + 8 * (v4 >> 1));
    int v7 = *v6;
    int v8 = *(_DWORD *)(a2 - 8);
    if (*v6 < v8 || v8 >= v7 && *(_DWORD *)(result + 8 * v5 + 4) < *(_DWORD *)(a2 - 4))
    {
      int v9 = *(_DWORD *)(a2 - 8);
      int v10 = *(_DWORD *)(a2 - 4);
      *(_DWORD *)(a2 - _Block_object_dispose(&STACK[0x2A8], 8) = v7;
      *(_DWORD *)(a2 - 4) = v6[1];
      if (v4 >= 2)
      {
        while (1)
        {
          unint64_t v12 = v5 - 1;
          unint64_t v5 = (v5 - 1) >> 1;
          int v11 = (int *)(result + 8 * v5);
          int v13 = *v11;
          if (*v11 >= v9)
          {
            if (v13 > v9) {
              break;
            }
            int v14 = *(_DWORD *)(result + 8 * v5 + 4);
            if (v14 >= v10) {
              break;
            }
          }
          else
          {
            int v14 = v11[1];
          }
          int *v6 = v13;
          v6[1] = v14;
          uint64_t v6 = (int *)(result + 8 * v5);
          if (v12 <= 1) {
            goto LABEL_12;
          }
        }
      }
      int v11 = v6;
LABEL_12:
      int *v11 = v9;
      v11[1] = v10;
    }
  }
  return result;
}

LABEL_1:
  int v10 = (unint64_t *)(a2 - 24);
  uint64_t j = a1;
  while (1)
  {
    a1 = j;
    unint64_t v12 = a2 - j;
    int v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2 - j) >> 3);
    if (v5 || !v4)
    {
      switch(v13)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          v65 = (long long *)(a2 - 24);
          v66 = *(void *)(a2 - 24);
          if (v66 < *(void *)j
            || v66 <= *(void *)j
            && ((v67 = *(void *)(a2 - 16), v68 = *(void *)(j + 8), v67 < v68)
             || v67 <= v68 && *(unsigned __int8 *)(a2 - 8) < *(unsigned __int8 *)(j + 16)))
          {
            v153 = *(void *)(j + 16);
            v145 = *(_OWORD *)j;
            v69 = *v65;
            *(void *)(j + 16) = *(void *)(a2 - 8);
            *(_OWORD *)uint64_t j = v69;
            *(void *)(a2 - _Block_object_dispose(&STACK[0x2A8], 8) = v153;
            *v65 = v145;
          }
          break;
        case 3uLL:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((long long *)j, (unint64_t *)(j + 24), (long long *)(a2 - 24));
          break;
        case 4uLL:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(j, (unint64_t *)(j + 24), j + 48, a2 - 24);
          break;
        case 5uLL:
          std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,[(RKEventIdentifier *)j _identifyStrings:j + 48 otherDateCount:j + 72 otherDates:a2 - 24];
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v12 <= 575) {
      break;
    }
    if (!a3)
    {
      if (j == a2) {
        return;
      }
      v85 = (v13 - 2) >> 1;
      v86 = v85;
      while (1)
      {
        v87 = v86;
        if (v85 >= v86)
        {
          v88 = (2 * v86) | 1;
          v89 = j + 24 * v88;
          if (2 * v87 + 2 < (uint64_t)v13)
          {
            v90 = *(void *)(v89 + 24);
            if (*(void *)v89 < v90
              || *(void *)v89 <= v90
              && ((v91 = *(void *)(j + 24 * v88 + 8), v92 = *(void *)(v89 + 32), v91 < v92)
               || v91 <= v92 && *(unsigned __int8 *)(j + 24 * v88 + 16) < *(unsigned __int8 *)(v89 + 40)))
            {
              v89 += 24;
              v88 = 2 * v87 + 2;
            }
          }
          v93 = j + 24 * v87;
          v94 = *(void *)v93;
          if (*(void *)v89 >= *(void *)v93)
          {
            if (*(void *)v89 > *(void *)v93)
            {
              v95 = *(void *)(v93 + 8);
LABEL_168:
              v97 = *(unsigned __int8 *)(v93 + 16);
              *(_DWORD *)&v147[3] = *(_DWORD *)(v93 + 20);
              *(_DWORD *)v147 = *(_DWORD *)(v93 + 17);
              while (1)
              {
                v98 = *(_OWORD *)v89;
                *(void *)(v93 + 16) = *(void *)(v89 + 16);
                *(_OWORD *)v93 = v98;
                if (v85 < v88) {
                  goto LABEL_183;
                }
                v93 = v89;
                v99 = 2 * v88;
                v88 = (2 * v88) | 1;
                v89 = j + 24 * v88;
                v100 = v99 + 2;
                if (v100 < (uint64_t)v13)
                {
                  v101 = *(void *)(v89 + 24);
                  if (*(void *)v89 < v101
                    || *(void *)v89 <= v101
                    && ((v102 = *(void *)(j + 24 * v88 + 8), v103 = *(void *)(v89 + 32), v102 < v103)
                     || v102 <= v103
                     && *(unsigned __int8 *)(j + 24 * v88 + 16) < *(unsigned __int8 *)(v89 + 40)))
                  {
                    v89 += 24;
                    v88 = v100;
                  }
                }
                if (*(void *)v89 < v94) {
                  break;
                }
                if (*(void *)v89 <= v94)
                {
                  v104 = *(void *)(v89 + 8);
                  if (v104 < v95 || v104 <= v95 && *(unsigned __int8 *)(v89 + 16) < v97) {
                    break;
                  }
                }
              }
              v89 = v93;
LABEL_183:
              *(void *)v89 = v94;
              *(void *)(v89 + _Block_object_dispose(&STACK[0x2A8], 8) = v95;
              *(unsigned char *)(v89 + 16) = v97;
              *(_DWORD *)(v89 + 17) = *(_DWORD *)v147;
              *(_DWORD *)(v89 + 20) = *(_DWORD *)&v147[3];
              goto LABEL_184;
            }
            v96 = *(void *)(v89 + 8);
            v95 = *(void *)(j + 24 * v87 + 8);
            if (v96 >= v95
              && (v96 > v95 || *(unsigned __int8 *)(v89 + 16) >= *(unsigned __int8 *)(j + 24 * v87 + 16)))
            {
              goto LABEL_168;
            }
          }
        }
LABEL_184:
        v86 = v87 - 1;
        if (!v87)
        {
          v105 = v12 / 0x18uLL;
          while (1)
          {
            v106 = 0;
            v154 = *(void *)(j + 16);
            v148 = *(_OWORD *)j;
            v107 = j;
            do
            {
              v108 = v107;
              v109 = v106 + 1;
              v107 += 24 * (v106 + 1);
              v110 = 2 * v106;
              v106 = (2 * v106) | 1;
              v111 = v110 + 2;
              if (v111 < v105)
              {
                v112 = *(void *)(v107 + 24);
                if (*(void *)v107 < v112
                  || *(void *)v107 <= v112
                  && ((v114 = *(void *)(v108 + 24 * v109 + 8), v115 = *(void *)(v107 + 32), v114 < v115)
                   || v114 <= v115
                   && *(unsigned __int8 *)(v108 + 24 * v109 + 16) < *(unsigned __int8 *)(v107 + 40)))
                {
                  v107 += 24;
                  v106 = v111;
                }
              }
              v113 = *(_OWORD *)v107;
              *(void *)(v108 + 16) = *(void *)(v107 + 16);
              *(_OWORD *)v108 = v113;
            }
            while (v106 <= (uint64_t)((unint64_t)(v105 - 2) >> 1));
            a2 -= 24;
            if (v107 == a2)
            {
              *(void *)(v107 + 16) = v154;
              *(_OWORD *)v107 = v148;
            }
            else
            {
              v116 = *(_OWORD *)a2;
              *(void *)(v107 + 16) = *(void *)(a2 + 16);
              *(_OWORD *)v107 = v116;
              *(void *)(a2 + 16) = v154;
              *(_OWORD *)a2 = v148;
              v117 = v107 - j + 24;
              if (v117 >= 25)
              {
                v118 = v117 / 0x18uLL - 2;
                v119 = v118 >> 1;
                v120 = j + 24 * (v118 >> 1);
                v121 = *(void *)v107;
                if (*(void *)v120 < *(void *)v107)
                {
                  v122 = *(void *)(v107 + 8);
LABEL_201:
                  v123 = *(unsigned __int8 *)(v107 + 16);
                  *(_DWORD *)v141 = *(_DWORD *)(v107 + 17);
                  *(_DWORD *)&v141[3] = *(_DWORD *)(v107 + 20);
                  v124 = *(void *)(v120 + 16);
                  *(_OWORD *)v107 = *(_OWORD *)v120;
                  *(void *)(v107 + 16) = v124;
                  if (v118 >= 2)
                  {
                    while (1)
                    {
                      v126 = v119 - 1;
                      v119 = (v119 - 1) >> 1;
                      v125 = j + 24 * v119;
                      if (*(void *)v125 >= v121)
                      {
                        if (*(void *)v125 > v121) {
                          break;
                        }
                        v127 = *(void *)(j + 24 * v119 + 8);
                        if (v127 >= v122 && (v127 > v122 || *(unsigned __int8 *)(j + 24 * v119 + 16) >= v123)) {
                          break;
                        }
                      }
                      v128 = *(_OWORD *)v125;
                      *(void *)(v120 + 16) = *(void *)(v125 + 16);
                      *(_OWORD *)v120 = v128;
                      v120 = j + 24 * v119;
                      if (v126 <= 1) {
                        goto LABEL_209;
                      }
                    }
                  }
                  v125 = v120;
LABEL_209:
                  *(void *)v125 = v121;
                  *(void *)(v125 + _Block_object_dispose(&STACK[0x2A8], 8) = v122;
                  *(unsigned char *)(v125 + 16) = v123;
                  *(_DWORD *)(v125 + 17) = *(_DWORD *)v141;
                  *(_DWORD *)(v125 + 20) = *(_DWORD *)&v141[3];
                  goto LABEL_211;
                }
                if (*(void *)v120 <= *(void *)v107)
                {
                  v129 = *(void *)(j + 24 * v119 + 8);
                  v122 = *(void *)(v107 + 8);
                  if (v129 < v122
                    || v129 <= v122
                    && *(unsigned __int8 *)(j + 24 * v119 + 16) < *(unsigned __int8 *)(v107 + 16))
                  {
                    goto LABEL_201;
                  }
                }
              }
            }
LABEL_211:
            v40 = v105-- <= 2;
            if (v40) {
              return;
            }
          }
        }
      }
    }
    int v14 = v13 >> 1;
    uint64_t v15 = (unint64_t *)(j + 24 * (v13 >> 1));
    if ((unint64_t)v12 >= 0xC01)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((long long *)a1, (unint64_t *)(a1 + 24 * (v13 >> 1)), (long long *)(a2 - 24));
      uint64_t v16 = 3 * v14;
      int v17 = (unint64_t *)(a1 + 24 * v14 - 24);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((long long *)(a1 + 24), v17, (long long *)(a2 - 48));
      int v18 = (unint64_t *)(a1 + 24 + 8 * v16);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((long long *)(a1 + 48), v18, (long long *)(a2 - 72));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((long long *)v17, v15, (long long *)v18);
      v150 = *(void *)(a1 + 16);
      v142 = *(_OWORD *)a1;
      int v19 = v15[2];
      *(_OWORD *)a1 = *(_OWORD *)v15;
      *(void *)(a1 + 16) = v19;
      v15[2] = v150;
      *(_OWORD *)uint64_t v15 = v142;
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((long long *)(a1 + 24 * (v13 >> 1)), (unint64_t *)a1, (long long *)(a2 - 24));
    }
    --a3;
    int v20 = *(void *)a1;
    if ((a4 & 1) != 0 || (int v21 = *(void *)(a1 - 24), v21 < v20))
    {
LABEL_15:
      int v24 = 0;
      int v25 = *(void *)(a1 + 8);
      v26 = *(unsigned __int8 *)(a1 + 16);
      *(_DWORD *)v139 = *(_DWORD *)(a1 + 17);
      *(_DWORD *)&v139[3] = *(_DWORD *)(a1 + 20);
      while (1)
      {
        v27 = *(void *)(a1 + v24 + 24);
        if (v27 >= v20)
        {
          if (v27 > v20) {
            break;
          }
          v28 = *(void *)(a1 + v24 + 32);
          if (v28 >= v25 && (v28 > v25 || *(unsigned __int8 *)(a1 + v24 + 40) >= v26)) {
            break;
          }
        }
        v24 += 24;
      }
      v29 = a1 + v24 + 24;
      if (v24)
      {
        v30 = *v10;
        for (uint64_t i = a2 - 24; v30 >= v20; i -= 24)
        {
          if (v30 <= v20)
          {
            v32 = *(void *)(i + 8);
            if (v32 < v25 || v32 <= v25 && *(unsigned __int8 *)(i + 16) < v26) {
              break;
            }
          }
          v33 = *(void *)(i - 24);
          v30 = v33;
        }
      }
      else
      {
        uint64_t i = a2;
        if (v29 < a2)
        {
          uint64_t v34 = *v10;
          uint64_t i = a2 - 24;
          if (*v10 >= v20)
          {
            uint64_t i = a2 - 24;
            do
            {
              if (v34 > v20) {
                goto LABEL_36;
              }
              v35 = *(void *)(i + 8);
              if (v35 < v25) {
                break;
              }
              if (v35 <= v25)
              {
                if (v29 >= i || *(unsigned __int8 *)(i + 16) < v26) {
                  break;
                }
              }
              else
              {
LABEL_36:
                if (v29 >= i) {
                  break;
                }
              }
              v36 = *(void *)(i - 24);
              i -= 24;
              uint64_t v34 = v36;
            }
            while (v36 >= v20);
          }
        }
      }
      uint64_t j = v29;
      if (v29 < i)
      {
        v37 = i;
        do
        {
          v151 = *(void *)(j + 16);
          v143 = *(_OWORD *)j;
          v38 = *(_OWORD *)v37;
          *(void *)(j + 16) = *(void *)(v37 + 16);
          *(_OWORD *)uint64_t j = v38;
          *(void *)(v37 + 16) = v151;
          *(_OWORD *)v37 = v143;
          do
          {
            do
            {
              v39 = *(void *)(j + 24);
              j += 24;
              v40 = v39 > v20;
            }
            while (v39 < v20);
            if (v40) {
              break;
            }
            v41 = *(void *)(j + 8);
          }
          while (v41 < v25 || v41 <= v25 && *(unsigned __int8 *)(j + 16) < v26);
          while (1)
          {
            v43 = *(void *)(v37 - 24);
            v37 -= 24;
            v42 = v43;
            if (v43 < v20) {
              break;
            }
            if (v42 <= v20)
            {
              v44 = *(void *)(v37 + 8);
              if (v44 < v25 || v44 <= v25 && *(unsigned __int8 *)(v37 + 16) < v26) {
                break;
              }
            }
          }
        }
        while (j < v37);
      }
      if (j - 24 != a1)
      {
        v45 = *(_OWORD *)(j - 24);
        *(void *)(a1 + 16) = *(void *)(j - 8);
        *(_OWORD *)a1 = v45;
      }
      *(void *)(j - 24) = v20;
      *(void *)(j - 16) = v25;
      *(unsigned char *)(j - _Block_object_dispose(&STACK[0x2A8], 8) = v26;
      *(_DWORD *)(j - 7) = *(_DWORD *)v139;
      *(_DWORD *)(j - 4) = *(_DWORD *)&v139[3];
      if (v29 < i)
      {
LABEL_60:
        std::__introsort<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *,false>(a1, j - 24, a3, a4 & 1);
        a4 = 0;
      }
      else
      {
        v46 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(a1, j - 24);
        if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(j, a2))
        {
          a2 = j - 24;
          if (v46) {
            return;
          }
          goto LABEL_1;
        }
        if (!v46) {
          goto LABEL_60;
        }
      }
    }
    else
    {
      if (v21 > v20)
      {
        int v23 = *(void *)(a1 + 8);
      }
      else
      {
        int v22 = *(void *)(a1 - 16);
        int v23 = *(void *)(a1 + 8);
        if (v22 < v23 || v22 <= v23 && *(unsigned __int8 *)(a1 - 8) < *(unsigned __int8 *)(a1 + 16)) {
          goto LABEL_15;
        }
      }
      v47 = *(unsigned __int8 *)(a1 + 16);
      *(_DWORD *)v140 = *(_DWORD *)(a1 + 17);
      *(_DWORD *)&v140[3] = *(_DWORD *)(a1 + 20);
      v48 = *v10;
      if (v20 < *v10
        || v20 <= *v10 && ((v64 = *(void *)(a2 - 16), v23 < v64) || v23 <= v64 && v47 < *(unsigned __int8 *)(a2 - 8)))
      {
        uint64_t j = a1;
        while (1)
        {
          v50 = *(void *)(j + 24);
          j += 24;
          v49 = v50;
          if (v20 < v50) {
            break;
          }
          if (v20 <= v49)
          {
            v51 = *(void *)(j + 8);
            if (v23 < v51 || v23 <= v51 && v47 < *(unsigned __int8 *)(j + 16)) {
              break;
            }
          }
        }
      }
      else
      {
        for (uint64_t j = a1 + 24; j < a2; j += 24)
        {
          if (v20 < *(void *)j) {
            break;
          }
          if (v20 <= *(void *)j)
          {
            v63 = *(void *)(j + 8);
            if (v23 < v63 || v23 <= v63 && v47 < *(unsigned __int8 *)(j + 16)) {
              break;
            }
          }
        }
      }
      k = a2;
      if (j < a2)
      {
        for (k = a2 - 24; ; k -= 24)
        {
          if (v20 >= v48)
          {
            if (v20 > v48) {
              break;
            }
            v53 = *(void *)(k + 8);
            if (v23 >= v53 && (v23 > v53 || v47 >= *(unsigned __int8 *)(k + 16))) {
              break;
            }
          }
          v54 = *(void *)(k - 24);
          v48 = v54;
        }
      }
      while (j < k)
      {
        v152 = *(void *)(j + 16);
        v144 = *(_OWORD *)j;
        v55 = *(_OWORD *)k;
        *(void *)(j + 16) = *(void *)(k + 16);
        *(_OWORD *)uint64_t j = v55;
        *(void *)(k + 16) = v152;
        *(_OWORD *)k = v144;
        while (1)
        {
          v57 = *(void *)(j + 24);
          j += 24;
          v56 = v57;
          if (v20 < v57) {
            break;
          }
          if (v20 <= v56)
          {
            v58 = *(void *)(j + 8);
            if (v23 < v58 || v23 <= v58 && v47 < *(unsigned __int8 *)(j + 16)) {
              break;
            }
          }
        }
        do
        {
          do
          {
            v59 = *(void *)(k - 24);
            k -= 24;
            v60 = v20 > v59;
          }
          while (v20 < v59);
          if (v60) {
            break;
          }
          v61 = *(void *)(k + 8);
        }
        while (v23 < v61 || v23 <= v61 && v47 < *(unsigned __int8 *)(k + 16));
      }
      unint64_t v4 = j - 24 >= a1;
      unint64_t v5 = j - 24 == a1;
      if (j - 24 != a1)
      {
        v62 = *(_OWORD *)(j - 24);
        *(void *)(a1 + 16) = *(void *)(j - 8);
        *(_OWORD *)a1 = v62;
      }
      a4 = 0;
      *(void *)(j - 24) = v20;
      *(void *)(j - 16) = v23;
      *(unsigned char *)(j - _Block_object_dispose(&STACK[0x2A8], 8) = v47;
      *(_DWORD *)(j - 7) = *(_DWORD *)v140;
      *(_DWORD *)(j - 4) = *(_DWORD *)&v140[3];
    }
  }
  v70 = j + 24;
  v72 = j == a2 || v70 == a2;
  if ((a4 & 1) == 0)
  {
    if (v72) {
      return;
    }
    while (1)
    {
      v130 = a1;
      a1 = v70;
      v131 = *(void *)(v130 + 24);
      if (v131 < *(void *)v130) {
        break;
      }
      if (v131 <= *(void *)v130)
      {
        v132 = *(void *)(v130 + 32);
        v133 = *(void *)(v130 + 8);
        if (v132 < v133
          || v132 <= v133 && *(unsigned __int8 *)(v130 + 40) < *(unsigned __int8 *)(v130 + 16))
        {
          goto LABEL_226;
        }
      }
LABEL_233:
      v70 = a1 + 24;
      if (a1 + 24 == a2) {
        return;
      }
    }
    v132 = *(void *)(v130 + 32);
LABEL_226:
    v134 = *(unsigned __int8 *)(v130 + 40);
    *(_DWORD *)v149 = *(_DWORD *)(v130 + 41);
    *(_DWORD *)&v149[3] = *(_DWORD *)(v130 + 44);
    do
    {
      do
      {
        v135 = v130;
        *(_OWORD *)(v130 + 24) = *(_OWORD *)v130;
        *(void *)(v130 + 40) = *(void *)(v130 + 16);
        v136 = *(void *)(v130 - 24);
        v130 -= 24;
        v137 = v131 > v136;
      }
      while (v131 < v136);
      if (v137) {
        break;
      }
      v138 = *(void *)(v135 - 16);
    }
    while (v132 < v138 || v132 <= v138 && v134 < *(unsigned __int8 *)(v135 - 8));
    *(void *)v135 = v131;
    *(void *)(v135 + _Block_object_dispose(&STACK[0x2A8], 8) = v132;
    *(unsigned char *)(v135 + 16) = v134;
    *(_DWORD *)(v135 + 17) = *(_DWORD *)v149;
    *(_DWORD *)(v135 + 20) = *(_DWORD *)&v149[3];
    goto LABEL_233;
  }
  if (v72) {
    return;
  }
  v73 = 0;
  v74 = j;
  while (2)
  {
    v75 = v74;
    v74 = v70;
    v76 = *(void *)(v75 + 24);
    if (v76 >= *(void *)v75)
    {
      if (v76 > *(void *)v75) {
        goto LABEL_150;
      }
      v77 = *(void *)(v75 + 32);
      v78 = *(void *)(v75 + 8);
      if (v77 >= v78 && (v77 > v78 || *(unsigned __int8 *)(v75 + 40) >= *(unsigned __int8 *)(v75 + 16))) {
        goto LABEL_150;
      }
    }
    else
    {
      v77 = *(void *)(v75 + 32);
    }
    v79 = *(unsigned __int8 *)(v75 + 40);
    *(_DWORD *)v146 = *(_DWORD *)(v75 + 41);
    *(_DWORD *)&v146[3] = *(_DWORD *)(v75 + 44);
    *(_OWORD *)v74 = *(_OWORD *)v75;
    *(void *)(v74 + 16) = *(void *)(v75 + 16);
    v80 = j;
    if (v75 == j) {
      goto LABEL_149;
    }
    v81 = v73;
    while (2)
    {
      v82 = j + v81;
      v83 = *(void *)(j + v81 - 24);
      if (v76 < v83) {
        goto LABEL_145;
      }
      if (v76 > v83) {
        goto LABEL_147;
      }
      v84 = *(void *)(j + v81 - 16);
      if (v77 < v84)
      {
LABEL_145:
        v75 -= 24;
        *(_OWORD *)v82 = *(_OWORD *)(j + v81 - 24);
        *(void *)(v82 + 16) = *(void *)(j + v81 - 8);
        v81 -= 24;
        if (!v81)
        {
          v80 = j;
          goto LABEL_149;
        }
        continue;
      }
      break;
    }
    if (v77 <= v84)
    {
      if (v79 >= *(unsigned __int8 *)(j + v81 - 8))
      {
LABEL_147:
        v80 = v75;
        goto LABEL_149;
      }
      goto LABEL_145;
    }
    v80 = j + v81;
LABEL_149:
    *(void *)v80 = v76;
    *(void *)(v80 + _Block_object_dispose(&STACK[0x2A8], 8) = v77;
    *(unsigned char *)(v80 + 16) = v79;
    *(_DWORD *)(v80 + 17) = *(_DWORD *)v146;
    *(_DWORD *)(v80 + 20) = *(_DWORD *)&v146[3];
LABEL_150:
    v70 = v74 + 24;
    v73 += 24;
    if (v74 + 24 != a2) {
      continue;
    }
    break;
  }
}

void std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *,0>(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(a1, a2, a3, a4);
  if (*(void *)a5 < *(void *)a4
    || *(void *)a5 <= *(void *)a4
    && ((unint64_t v28 = *(void *)(a5 + 8), v29 = *(void *)(a4 + 8), v28 < v29)
     || v28 <= v29 && *(unsigned __int8 *)(a5 + 16) < *(unsigned __int8 *)(a4 + 16)))
  {
    uint64_t v10 = *(void *)(a4 + 16);
    long long v11 = *(_OWORD *)a4;
    uint64_t v12 = *(void *)(a5 + 16);
    *(_OWORD *)a4 = *(_OWORD *)a5;
    *(void *)(a4 + 16) = v12;
    *(_OWORD *)a5 = v11;
    *(void *)(a5 + 16) = v10;
    if (*(void *)a4 < *(void *)a3
      || *(void *)a4 <= *(void *)a3
      && ((unint64_t v13 = *(void *)(a4 + 8), v14 = *(void *)(a3 + 8), v13 < v14)
       || v13 <= v14 && *(unsigned __int8 *)(a4 + 16) < *(unsigned __int8 *)(a3 + 16)))
    {
      uint64_t v15 = *(void *)(a3 + 16);
      long long v16 = *(_OWORD *)a3;
      uint64_t v17 = *(void *)(a4 + 16);
      *(_OWORD *)a3 = *(_OWORD *)a4;
      *(void *)(a3 + 16) = v17;
      *(_OWORD *)a4 = v16;
      *(void *)(a4 + 16) = v15;
      if (*(void *)a3 < *a2
        || *(void *)a3 <= *a2
        && ((unint64_t v18 = *(void *)(a3 + 8), v19 = a2[1], v18 < v19)
         || v18 <= v19 && *(unsigned __int8 *)(a3 + 16) < *((unsigned __int8 *)a2 + 16)))
      {
        unint64_t v20 = a2[2];
        long long v21 = *(_OWORD *)a2;
        unint64_t v22 = *(void *)(a3 + 16);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        a2[2] = v22;
        *(_OWORD *)a3 = v21;
        *(void *)(a3 + 16) = v20;
        if (*a2 < *(void *)a1
          || *a2 <= *(void *)a1
          && ((unint64_t v23 = a2[1], v24 = *(void *)(a1 + 8), v23 < v24)
           || v23 <= v24 && *((unsigned __int8 *)a2 + 16) < *(unsigned __int8 *)(a1 + 16)))
        {
          unint64_t v25 = *(void *)(a1 + 16);
          long long v26 = *(_OWORD *)a1;
          unint64_t v27 = a2[2];
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(void *)(a1 + 16) = v27;
          *(_OWORD *)a2 = v26;
          a2[2] = v25;
        }
      }
    }
  }
}

long long *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(long long *result, unint64_t *a2, long long *a3)
{
  unint64_t v3 = *a2;
  if (*a2 < *(void *)result
    || *a2 <= *(void *)result
    && ((unint64_t v25 = a2[1], v26 = *((void *)result + 1), v25 < v26)
     || v25 <= v26 && *((unsigned __int8 *)a2 + 16) < *((unsigned __int8 *)result + 16)))
  {
    if (*(void *)a3 < v3
      || *(void *)a3 <= v3
      && ((unint64_t v17 = *((void *)a3 + 1), v18 = a2[1], v17 < v18)
       || v17 <= v18 && *((unsigned __int8 *)a3 + 16) < *((unsigned __int8 *)a2 + 16)))
    {
      unint64_t v4 = *((void *)result + 2);
      long long v5 = *result;
      uint64_t v6 = *((void *)a3 + 2);
      *uint64_t result = *a3;
      *((void *)result + 2) = v6;
    }
    else
    {
      unint64_t v19 = *((void *)result + 2);
      long long v20 = *result;
      unint64_t v21 = a2[2];
      *uint64_t result = *(_OWORD *)a2;
      *((void *)result + 2) = v21;
      *(_OWORD *)a2 = v20;
      a2[2] = v19;
      if (*(void *)a3 >= *a2)
      {
        if (*(void *)a3 > *a2) {
          return result;
        }
        unint64_t v22 = *((void *)a3 + 1);
        unint64_t v23 = a2[1];
        if (v22 >= v23 && (v22 > v23 || *((unsigned __int8 *)a3 + 16) >= *((unsigned __int8 *)a2 + 16))) {
          return result;
        }
      }
      unint64_t v4 = a2[2];
      long long v5 = *(_OWORD *)a2;
      unint64_t v24 = *((void *)a3 + 2);
      *(_OWORD *)a2 = *a3;
      a2[2] = v24;
    }
    *a3 = v5;
    *((void *)a3 + 2) = v4;
    return result;
  }
  if (*(void *)a3 < v3
    || *(void *)a3 <= v3
    && ((v7 = *((void *)a3 + 1), unint64_t v8 = a2[1], v7 < v8)
     || v7 <= v8 && *((unsigned __int8 *)a3 + 16) < *((unsigned __int8 *)a2 + 16)))
  {
    unint64_t v9 = a2[2];
    long long v10 = *(_OWORD *)a2;
    unint64_t v11 = *((void *)a3 + 2);
    *(_OWORD *)a2 = *a3;
    a2[2] = v11;
    *a3 = v10;
    *((void *)a3 + 2) = v9;
    if (*a2 < *(void *)result
      || *a2 <= *(void *)result
      && ((v12 = a2[1], unint64_t v13 = *((void *)result + 1), v12 < v13)
       || v12 <= v13 && *((unsigned __int8 *)a2 + 16) < *((unsigned __int8 *)result + 16)))
    {
      unint64_t v14 = *((void *)result + 2);
      long long v15 = *result;
      unint64_t v16 = a2[2];
      *uint64_t result = *(_OWORD *)a2;
      *((void *)result + 2) = v16;
      *(_OWORD *)a2 = v15;
      a2[2] = v14;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v6 = (long long *)(a2 - 24);
      unint64_t v7 = *(void *)(a2 - 24);
      if (v7 < *(void *)a1
        || v7 <= *(void *)a1
        && ((unint64_t v23 = *(void *)(a2 - 16), v24 = *(void *)(a1 + 8), v23 < v24)
         || v23 <= v24 && *(unsigned __int8 *)(a2 - 8) < *(unsigned __int8 *)(a1 + 16)))
      {
        uint64_t v8 = *(void *)(a1 + 16);
        long long v9 = *(_OWORD *)a1;
        uint64_t v10 = *(void *)(a2 - 8);
        *(_OWORD *)a1 = *v6;
        *(void *)(a1 + 16) = v10;
        long long *v6 = v9;
        *(void *)(a2 - _Block_object_dispose(&STACK[0x2A8], 8) = v8;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((long long *)a1, (unint64_t *)(a1 + 24), (long long *)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(a1, (unint64_t *)(a1 + 24), a1 + 48, a2 - 24);
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,[(RKEventIdentifier *)a1 _identifyStrings:a1 + 48 otherDateCount:a1 + 72 otherDates:a2 - 24];
      return 1;
    default:
      uint64_t v11 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((long long *)a1, (unint64_t *)(a1 + 24), (long long *)(a1 + 48));
      uint64_t v12 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v13 = 0;
      int v14 = 0;
      break;
  }
  while (1)
  {
    unint64_t v15 = *(void *)v12;
    if (*(void *)v12 < *(void *)v11) {
      break;
    }
    if (*(void *)v12 <= *(void *)v11)
    {
      unint64_t v16 = *(void *)(v12 + 8);
      unint64_t v22 = *(void *)(v11 + 8);
      if (v16 < v22 || v16 <= v22 && *(unsigned __int8 *)(v12 + 16) < *(unsigned __int8 *)(v11 + 16)) {
        goto LABEL_9;
      }
    }
LABEL_26:
    uint64_t v11 = v12;
    v13 += 24;
    v12 += 24;
    if (v12 == a2) {
      return 1;
    }
  }
  unint64_t v16 = *(void *)(v12 + 8);
LABEL_9:
  unsigned int v17 = *(unsigned __int8 *)(v12 + 16);
  *(_DWORD *)unint64_t v25 = *(_DWORD *)(v12 + 17);
  *(_DWORD *)&v25[3] = *(_DWORD *)(v12 + 20);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)v11;
  *(void *)(v12 + 16) = *(void *)(v11 + 16);
  uint64_t v18 = a1;
  if (v11 != a1)
  {
    uint64_t v19 = v13;
    while (1)
    {
      unint64_t v20 = *(void *)(a1 + v19 + 24);
      if (v15 >= v20)
      {
        if (v15 > v20) {
          goto LABEL_23;
        }
        unint64_t v21 = *(void *)(a1 + v19 + 32);
        if (v16 >= v21)
        {
          if (v16 > v21)
          {
LABEL_23:
            uint64_t v18 = v11;
            goto LABEL_25;
          }
          if (v17 >= *(unsigned __int8 *)(a1 + v19 + 40)) {
            break;
          }
        }
      }
      v11 -= 24;
      *(_OWORD *)(a1 + v19 + 4_Block_object_dispose(&STACK[0x2A8], 8) = *(_OWORD *)(a1 + v19 + 24);
      *(void *)(a1 + v19 + 64) = *(void *)(a1 + v19 + 40);
      v19 -= 24;
      if (v19 == -48)
      {
        uint64_t v18 = a1;
        goto LABEL_25;
      }
    }
    uint64_t v18 = a1 + v19 + 48;
  }
LABEL_25:
  *(void *)uint64_t v18 = v15;
  *(void *)(v18 + _Block_object_dispose(&STACK[0x2A8], 8) = v16;
  *(unsigned char *)(v18 + 16) = v17;
  *(_DWORD *)(v18 + 17) = *(_DWORD *)v25;
  *(_DWORD *)(v18 + 20) = *(_DWORD *)&v25[3];
  if (++v14 != 8) {
    goto LABEL_26;
  }
  return v12 + 24 == a2;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::$_0 &,-[RKEventIdentifier _identifyStrings:otherDateCount:otherDates:]::Delta *>((long long *)a1, a2, (long long *)a3);
  if (*(void *)a4 < *(void *)a3
    || *(void *)a4 <= *(void *)a3
    && ((unint64_t v9 = *(void *)(a4 + 8), v10 = *(void *)(a3 + 8), v9 < v10)
     || v9 <= v10 && *(unsigned __int8 *)(a4 + 16) < *(unsigned __int8 *)(a3 + 16)))
  {
    uint64_t v11 = *(void *)(a3 + 16);
    __n128 result = *(__n128 *)a3;
    uint64_t v12 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v12;
    *(__n128 *)a4 = result;
    *(void *)(a4 + 16) = v11;
    if (*(void *)a3 < *a2
      || *(void *)a3 <= *a2
      && ((unint64_t v13 = *(void *)(a3 + 8), v14 = a2[1], v13 < v14)
       || v13 <= v14 && *(unsigned __int8 *)(a3 + 16) < *((unsigned __int8 *)a2 + 16)))
    {
      unint64_t v15 = a2[2];
      __n128 result = *(__n128 *)a2;
      unint64_t v16 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v16;
      *(__n128 *)a3 = result;
      *(void *)(a3 + 16) = v15;
      if (*a2 < *(void *)a1
        || *a2 <= *(void *)a1
        && ((unint64_t v17 = a2[1], v18 = *(void *)(a1 + 8), v17 < v18)
         || v17 <= v18 && *((unsigned __int8 *)a2 + 16) < *(unsigned __int8 *)(a1 + 16)))
      {
        unint64_t v19 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        unint64_t v20 = a2[2];
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v20;
        *(__n128 *)a2 = result;
        a2[2] = v19;
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<RKEventIdentifierRange>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

void sub_217E48370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return v0;
}

void sub_217E4D0A0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_217E4DAB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 192), 8);
  _Unwind_Resume(a1);
}

void stripCharacterSet(void *a1, void *a2)
{
  id v9 = a1;
  id v3 = a2;
  uint64_t v4 = [v9 length];
  if (v4)
  {
    uint64_t v5 = v4;
    do
    {
      uint64_t v6 = objc_msgSend(v9, "rangeOfCharacterFromSet:options:range:", v3, 4, 0, v5);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL || v7 == 0) {
        break;
      }
      uint64_t v5 = v6;
      objc_msgSend(v9, "deleteCharactersInRange:", v6, v7);
    }
    while (v5);
  }
}

void sub_217E4E4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void stripEmojiSkinTones(void *a1)
{
  uint64_t v1 = stripEmojiSkinTones_onceToken;
  id v2 = a1;
  id v3 = v2;
  if (v1 != -1)
  {
    dispatch_once(&stripEmojiSkinTones_onceToken, &__block_literal_global_161_0);
    id v2 = v3;
  }
  stripCharacterSet(v2, (void *)stripEmojiSkinTones_sEmojiSkinToneCharacterSet);
}

void stripDiacritics(void *a1)
{
  uint64_t v1 = stripDiacritics_onceToken;
  id v2 = a1;
  CFMutableStringRef theString = v2;
  if (v1 != -1)
  {
    dispatch_once(&stripDiacritics_onceToken, &__block_literal_global_165);
    id v2 = theString;
  }
  CFStringNormalize(v2, kCFStringNormalizationFormD);
  stripCharacterSet(theString, (void *)stripDiacritics_sDiacriticCharacterSet);
  CFStringNormalize(theString, kCFStringNormalizationFormC);
}

void sub_217E4ED9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __stripEmojiSkinTones_block_invoke()
{
  stripEmojiSkinTones_sEmojiSkinToneCharacterSet = objc_msgSend(MEMORY[0x263F08708], "characterSetWithRange:", 127995, 5);

  return MEMORY[0x270F9A758]();
}

uint64_t __normalizeWhitespace_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v1 = (void *)normalizeWhitespace_sWhitespaceCharacterSet;
  normalizeWhitespace_sWhitespaceCharacterSet = v0;

  normalizeWhitespace_sNonWhitespaceCharacterSet = [(id)normalizeWhitespace_sWhitespaceCharacterSet invertedSet];

  return MEMORY[0x270F9A758]();
}

void __stripDiacritics_block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 768, 56);
  objc_msgSend(v0, "addCharactersInRange:", 825, 22);
  objc_msgSend(v0, "addCharactersInRange:", 848, 8);
  objc_msgSend(v0, "addCharactersInRange:", 861, 6);
  objc_msgSend(v0, "addCharactersInRange:", 1155, 5);
  objc_msgSend(v0, "addCharactersInRange:", 1425, 45);
  objc_msgSend(v0, "addCharactersInRange:", 1471, 1);
  objc_msgSend(v0, "addCharactersInRange:", 1473, 2);
  objc_msgSend(v0, "addCharactersInRange:", 1476, 1);
  objc_msgSend(v0, "addCharactersInRange:", 1611, 8);
  objc_msgSend(v0, "addCharactersInRange:", 1623, 2);
  objc_msgSend(v0, "addCharactersInRange:", 1759, 2);
  objc_msgSend(v0, "addCharactersInRange:", 1770, 3);
  objc_msgSend(v0, "addCharactersInRange:", 2275, 28);
  objc_msgSend(v0, "addCharactersInRange:", 3655, 6);
  objc_msgSend(v0, "addCharactersInRange:", 3662, 1);
  objc_msgSend(v0, "addCharactersInRange:", 12330, 6);
  uint64_t v1 = (void *)stripDiacritics_sDiacriticCharacterSet;
  stripDiacritics_sDiacriticCharacterSet = (uint64_t)v0;
}

void sub_217E4FF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void findTopKClassifications()
{
  __assert_rtn("findTopKClassifications", "RKEventIdentifier.mm", 541, "k <= RKEventIDCount");
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x270F18C38]();
}

uint64_t CEMEnumerateEmojiTokensInStringWithBlock()
{
  return MEMORY[0x270F18C48]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x270F18C60]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x270EE4860](allocator, at);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4A90](allocator, localeIdentifier);
}

void CFRelease(CFTypeRef cf)
{
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE5100](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFRange CFStringGetRangeOfComposedCharactersAtIndex(CFStringRef theString, CFIndex theIndex)
{
  CFIndex v2 = MEMORY[0x270EE5200](theString, theIndex);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.NSUInteger length = v2;
  result.NSUInteger location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x270EE52B8](string, range, transform, reverse);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5338](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

uint64_t ChineseTokenizerAdvanceToNextToken()
{
  return MEMORY[0x270F91858]();
}

uint64_t ChineseTokenizerCreate()
{
  return MEMORY[0x270F91860]();
}

uint64_t ChineseTokenizerGetCurrentTokenRange()
{
  return MEMORY[0x270F91868]();
}

uint64_t ChineseTokenizerRelease()
{
  return MEMORY[0x270F91870]();
}

uint64_t ChineseTokenizerSetCustomWordCheckBlock()
{
  return MEMORY[0x270F91878]();
}

uint64_t ChineseTokenizerSetString()
{
  return MEMORY[0x270F91880]();
}

uint64_t DDResultCurrencyExtraction()
{
  return MEMORY[0x270F251B0]();
}

uint64_t DDResultGetCategory()
{
  return MEMORY[0x270F251C0]();
}

uint64_t DDResultGetRange()
{
  return MEMORY[0x270F251E0]();
}

uint64_t DDResultGetType()
{
  return MEMORY[0x270F25200]();
}

uint64_t DDResultGetValue()
{
  return MEMORY[0x270F25208]();
}

uint64_t DDResultHasType()
{
  return MEMORY[0x270F25210]();
}

uint64_t DDScannerCopyResultsWithOptions()
{
  return MEMORY[0x270F25238]();
}

uint64_t DDScannerCreateWithType()
{
  return MEMORY[0x270F25250]();
}

uint64_t DDScannerScanString()
{
  return MEMORY[0x270F25260]();
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x270F474B0]();
}

uint64_t LMLanguageModelAddTokenForString()
{
  return MEMORY[0x270F46AB8]();
}

uint64_t LMLanguageModelAddTransientVocabulary()
{
  return MEMORY[0x270F46AC0]();
}

uint64_t LMLanguageModelCopyDynamicModelBundlePath()
{
  return MEMORY[0x270F46AD0]();
}

uint64_t LMLanguageModelCopyTokenAttributes()
{
  return MEMORY[0x270F46AD8]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x270F46AE0]();
}

uint64_t LMLanguageModelCreatePredictionEnumerator()
{
  return MEMORY[0x270F46AE8]();
}

uint64_t LMLanguageModelCreateStringForTokenID()
{
  return MEMORY[0x270F46AF0]();
}

uint64_t LMLanguageModelDynamicModelIsEmpty()
{
  return MEMORY[0x270F46B00]();
}

uint64_t LMLanguageModelEnumeratePredictionsWithBlock()
{
  return MEMORY[0x270F46B10]();
}

uint64_t LMLanguageModelGetTokenIDForString()
{
  return MEMORY[0x270F46B40]();
}

uint64_t LMLanguageModelIncrementUsageCount()
{
  return MEMORY[0x270F46B50]();
}

uint64_t LMLanguageModelIncrementUsageCountWithEffectiveTime()
{
  return MEMORY[0x270F46B58]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x270F46B78]();
}

uint64_t LMLanguageModelSetParameterValue()
{
  return MEMORY[0x270F46BA0]();
}

uint64_t LMPredictionEnumeratorAdvance()
{
  return MEMORY[0x270F46C10]();
}

uint64_t LMPredictionEnumeratorGetPrediction()
{
  return MEMORY[0x270F46C18]();
}

uint64_t LMPredictionEnumeratorRelease()
{
  return MEMORY[0x270F46C20]();
}

uint64_t LMVocabularyContainsLemma()
{
  return MEMORY[0x270F46C40]();
}

uint64_t LMVocabularyContainsLemmaForCharacters()
{
  return MEMORY[0x270F46C48]();
}

uint64_t LMVocabularyGetSharedVocabulary()
{
  return MEMORY[0x270F46C58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t NLMessageConversationCreate()
{
  return MEMORY[0x270F4D820]();
}

uint64_t NLMessageConversationTurnCreate()
{
  return MEMORY[0x270F4D828]();
}

uint64_t NLMessageIntentCandidateCopyAttributes()
{
  return MEMORY[0x270F4D830]();
}

uint64_t NLMessageIntentCandidateGetIntentType()
{
  return MEMORY[0x270F4D838]();
}

uint64_t NLMessageIntentCandidateGetScore()
{
  return MEMORY[0x270F4D840]();
}

uint64_t NLMessageIntentRecognizerCopyTopNIntentCandidates()
{
  return MEMORY[0x270F4D848]();
}

uint64_t NLMessageIntentRecognizerCreate()
{
  return MEMORY[0x270F4D850]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.NSUInteger length = v3;
  result.NSUInteger location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

void free(void *a1)
{
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x270F99740]();
}