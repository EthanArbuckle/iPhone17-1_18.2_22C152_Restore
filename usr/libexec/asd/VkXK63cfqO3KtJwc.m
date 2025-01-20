@interface VkXK63cfqO3KtJwc
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation VkXK63cfqO3KtJwc

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v11 = a6;
  id v12 = a8;
  uint64_t var1 = a3->var1;
  v49 = +[PJXBDBF1h0EU80dy sharedInstance];
  if (var1 == 1)
  {
    unint64_t var0 = a3->var4.var0.var0;
    id v15 = [v11 jCbmcix0xxhNVOSS:var0 TWWnmIjkBlMfHmma:v12];
    if ((a5 & 2) != 0) {
      goto LABEL_30;
    }
    id v16 = v15;
    BOOL v46 = 0;
    goto LABEL_11;
  }
  unint64_t var0 = a3->var4.var0.var0;
  unsigned int v17 = sub_10000681C((a5 >> 4) & 1, a3->var4.var5.var3, 0);
  if (((v17 == 0) & (a5 >> 1)) != 0) {
    unsigned int v18 = 2;
  }
  else {
    unsigned int v18 = v17;
  }
  if (v18 == 3)
  {
    v19 = [kjAS9HuCdR1m5txL alloc];
    uint64_t v20 = 163003;
LABEL_24:
    v26 = [(kjAS9HuCdR1m5txL *)v19 initWithGyF0atX3JpCKc9pK:&__NSArray0__struct qfSDGTGvqd3Hruzg:v20];
LABEL_25:
    v33 = v49;
    goto LABEL_40;
  }
  id v21 = [v11 jCbmcix0xxhNVOSS:var0 TWWnmIjkBlMfHmma:v12];
  if (v18 <= 1)
  {
    id v16 = v21;
    BOOL v46 = v18 == 1;
LABEL_11:
    os_signpost_id_t v22 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
    v23 = (id)qword_1006AD1B0;
    v24 = v23;
    os_signpost_id_t spid = v22;
    unint64_t v25 = v22 - 1;
    if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_INTERVAL_BEGIN, spid, "cdf", "enableTelemetry=NO", buf, 2u);
    }

    v26 = [v49 tuV7J33gT8DSDOWz:v16 forDFVersion:var1];
    v27 = (id)qword_1006AD1B0;
    v28 = v27;
    if (v26)
    {
      if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        unsigned int v29 = a4->var0;
        unsigned int v30 = a4->var1;
        *(_DWORD *)buf = 67240704;
        unsigned int v51 = v29;
        __int16 v52 = 1026;
        unsigned int v53 = v30;
        __int16 v54 = 1026;
        int v55 = 1;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "cdf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,h=%{public,signpost.telemetry:number2}d", buf, 0x14u);
      }

      goto LABEL_25;
    }
    if (v46)
    {
      if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        unsigned int v31 = a4->var0;
        unsigned int v32 = a4->var1;
        *(_DWORD *)buf = 67240704;
        unsigned int v51 = v31;
        __int16 v52 = 1026;
        unsigned int v53 = v32;
        __int16 v54 = 1026;
        int v55 = 2;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "cdf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,h=%{public,signpost.telemetry:number2}d", buf, 0x14u);
      }

      v19 = [kjAS9HuCdR1m5txL alloc];
      uint64_t v20 = 163002;
      goto LABEL_24;
    }
    if (v25 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      unsigned int v34 = a4->var0;
      unsigned int v35 = a4->var1;
      *(_DWORD *)buf = 67240704;
      unsigned int v51 = v34;
      __int16 v52 = 1026;
      unsigned int v53 = v35;
      __int16 v54 = 1026;
      int v55 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_END, spid, "cdf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d,h=%{public,signpost.telemetry:number2}d", buf, 0x14u);
    }
  }
LABEL_30:
  os_signpost_id_t v36 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v37 = (id)qword_1006AD1B0;
  v38 = v37;
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "mdf", "enableTelemetry=NO", buf, 2u);
  }

  v26 = [v11 PLMCCRRqEw4moT9R:var0 UtPlzRffoEpw7Ue1:a4 SFkZRA5Ek9YzhDRs:a5 & 0xFFFFFFFD TWWnmIjkBlMfHmma:v12];
  v39 = +[NSDate date];
  [(kjAS9HuCdR1m5txL *)v26 setWgZJLy8f4tn41Pge:v39];

  uint64_t v40 = a4->var0;
  if (var1 == 1)
  {
    v33 = v49;
    [v49 r2wriXQ3o6jv840j:a3 gXKoR0dNwQUyaeOl:v40 lEWFPyiFIAJ2uoyd:v26];
  }
  else
  {
    v33 = v49;
    [v49 qSbwrv1Q3SgLu8BN:a3 gXKoR0dNwQUyaeOl:v40 lEWFPyiFIAJ2uoyd:v26];
  }
  v41 = (id)qword_1006AD1B0;
  v42 = v41;
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
  {
    unsigned int v43 = a4->var0;
    unsigned int v44 = a4->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v51 = v43;
    __int16 v52 = 1026;
    unsigned int v53 = v44;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, v36, "mdf", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

LABEL_40:

  return v26;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  unsigned int var1 = a3->var1;
  [v10 encodeInt32:var1 forKey:@"0x6595"];
  if (var1 == 2)
  {
    id v12 = [v8 jCbmcix0xxhNVOSS:a3->var4.var0.var0 TWWnmIjkBlMfHmma:v9];
    [v10 encodeInt64:0x7784FD561BB2380BLL forKey:@"0x5563"];
    [v10 encodeInt64:a3->var4.var11.var1 forKey:@"0x43a0"];
    p_var3 = &a3->var4.var5.var3;
    CFStringRef v14 = @"0xfa5b";
    goto LABEL_5;
  }
  if (var1 == 1)
  {
    id v12 = [v8 jCbmcix0xxhNVOSS:a3->var4.var0.var0 TWWnmIjkBlMfHmma:v9];
    [v10 encodeInt64:0x7784FD561BB2380BLL forKey:@"0x5563"];
    p_var3 = &a3->var4.var11.var1;
    CFStringRef v14 = @"0xdb4";
LABEL_5:
    [v10 encodeInt64:*p_var3 forKey:v14];
    [v10 encodeInt64:v12 forKey:@"0x07aa"];
  }
  unint64_t v15 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v15;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5 = a4;
  v6 = v5;
  unsigned int var1 = a3->var1;
  if (var1 == 2 || var1 == 1)
  {
    uint64_t v8 = [v5 listDependenciesForDataframe:a3->var4.var0.var0];
  }
  else
  {
    uint64_t v8 = +[NSSet set];
  }
  id v9 = (void *)v8;

  return v9;
}

@end