@interface FdvTdusyTLSA8Wsh
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation FdvTdusyTLSA8Wsh

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v58 = a6;
  id v11 = a7;
  id v12 = a8;
  os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v14 = (id)qword_1006AD1B0;
  v15 = v14;
  os_signpost_id_t spid = v13;
  unint64_t v60 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "wp", "enableTelemetry=YES", buf, 2u);
  }

  uint64_t v69 = 0;
  *(void *)buf = 0;
  v64 = buf;
  uint64_t v65 = 0x3032000000;
  v66 = sub_10001161C;
  v67 = sub_10001162C;
  id v68 = 0;
  v61 = +[NSMutableDictionary dictionaryWithCapacity:a3->var4.var0.var2];
  os_signpost_id_t v16 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v17 = (id)qword_1006AD1B0;
  v18 = v17;
  os_signpost_id_t v55 = v16;
  unint64_t v59 = v16 - 1;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v70 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "wp_1", "enableTelemetry=YES", v70, 2u);
  }

  BOOL v20 = v69 == 0;
  if (a3->var4.var0.var2 && !v69)
  {
    uint64_t v21 = 0;
    unint64_t v22 = 0;
    *(void *)&long long v19 = 67109634;
    long long v54 = v19;
    do
    {
      v23 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:](Yp00msaYdVlZesvU, "yv5QRLoFvJ66jYJS:xNtFS0jGMQPgkTi7:i4KDOQicW9Xd5WBz:TWWnmIjkBlMfHmma:", (char *)a3->var4.var0.var3 + v21, &v69, v11, v12, v54);
      if (v23) {
        BOOL v24 = v69 == 0;
      }
      else {
        BOOL v24 = 0;
      }
      if (v24)
      {
        v26 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)a3->var4.var0.var3 + v21 + 136 xNtFS0jGMQPgkTi7:&v69 i4KDOQicW9Xd5WBz:v11 TWWnmIjkBlMfHmma:v12];
        if (v26) {
          BOOL v27 = v69 == 0;
        }
        else {
          BOOL v27 = 0;
        }
        if (v27)
        {
          [v61 setObject:v26 forKeyedSubscript:v23];
        }
        else
        {
          v28 = qword_1006AD1A0;
          if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v70 = v54;
            int v71 = v22;
            __int16 v72 = 2112;
            uint64_t v73 = (uint64_t)v23;
            __int16 v74 = 2048;
            uint64_t v75 = v69;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "WP Skipping %d (%@) due to error %ld", v70, 0x1Cu);
          }
        }
      }
      else
      {
        v25 = qword_1006AD1A0;
        if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v70 = 67109376;
          int v71 = v22;
          __int16 v72 = 2048;
          uint64_t v73 = v69;
          _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "WP Skipping %d due to error %ld", v70, 0x12u);
        }
      }

      ++v22;
      BOOL v20 = v69 == 0;
      if (v22 >= a3->var4.var0.var2) {
        break;
      }
      v21 += 272;
    }
    while (!v69);
  }
  if (v20)
  {
    v29 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v69 i4KDOQicW9Xd5WBz:v11 TWWnmIjkBlMfHmma:v12];
    if (v69)
    {
      v30 = qword_1006AD1A0;
      if (os_log_type_enabled((os_log_t)qword_1006AD1A0, OS_LOG_TYPE_ERROR)) {
        sub_10055C744(&v69, v30);
      }
    }
  }
  else
  {
    v29 = 0;
  }
  v31 = (id)qword_1006AD1B0;
  v32 = v31;
  if (v59 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    unsigned int var0 = a4->var0;
    unsigned int var1 = a4->var1;
    *(_DWORD *)v70 = 67240448;
    int v71 = var0;
    __int16 v72 = 1026;
    LODWORD(v73) = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, v55, "wp_1", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", v70, 0xEu);
  }

  if (!v69)
  {
    os_signpost_id_t v35 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
    v36 = (id)qword_1006AD1B0;
    v37 = v36;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)v70 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_BEGIN, v35, "wp_2", "enableTelemetry=YES", v70, 2u);
    }

    v38 = [[VHJG14dpou8WUEOf alloc] initWithZKQesNL3BCNYUjZw:v61];
    v39 = v38;
    if (v38)
    {
      unint64_t v40 = a3->var4.var0.var0;
      uint64_t var4 = a3->var4.var0.var4;
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472;
      v62[2] = sub_100011634;
      v62[3] = &unk_10065EED0;
      v62[4] = buf;
      uint64_t v42 = [(VHJG14dpou8WUEOf *)v38 Dp2N5iuaONVuK1T4:v29 JMJGqFLtbMZn4EGN:v40 QsX3tfdMvsGwvY0F:var4 withCompletion:v62];
    }
    else
    {
      uint64_t v42 = 170003;
    }
    uint64_t v69 = v42;

    v43 = (id)qword_1006AD1B0;
    v44 = v43;
    if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
    {
      unsigned int v45 = a4->var0;
      unsigned int v46 = a4->var1;
      *(_DWORD *)v70 = 67240448;
      int v71 = v45;
      __int16 v72 = 1026;
      LODWORD(v73) = v46;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_END, v35, "wp_2", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", v70, 0xEu);
    }
  }
  v47 = (id)qword_1006AD1B0;
  v48 = v47;
  if (v60 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
  {
    unsigned int v49 = a4->var0;
    unsigned int v50 = a4->var1;
    *(_DWORD *)v70 = 67240448;
    int v71 = v49;
    __int16 v72 = 1026;
    LODWORD(v73) = v50;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_END, spid, "wp", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", v70, 0xEu);
  }

  v51 = [kjAS9HuCdR1m5txL alloc];
  v52 = [(kjAS9HuCdR1m5txL *)v51 initWithGyF0atX3JpCKc9pK:*((void *)v64 + 5) qfSDGTGvqd3Hruzg:v69];

  _Block_object_dispose(buf, 8);

  return v52;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v20 = 0;
  [v10 encodeInt64:0xD65B10DF4565AAELL forKey:@"0x5563"];
  [v10 encodeInt64:a3->var4.var0.var0 forKey:@"0xca8b"];
  [v10 encodeInt64:a3->var4.var0.var4 forKey:@"0x9d77"];
  id v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v20 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
  [v10 encodeObject:v11];
  if (a3->var4.var0.var2)
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    do
    {
      v14 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)a3->var4.var0.var3 + v12 xNtFS0jGMQPgkTi7:&v20 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
      uint64_t v15 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)a3->var4.var0.var3 + v12 + 136 xNtFS0jGMQPgkTi7:&v20 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v9];
      os_signpost_id_t v16 = (void *)v15;
      if (v14) {
        BOOL v17 = v15 == 0;
      }
      else {
        BOOL v17 = 1;
      }
      if (!v17)
      {
        [v10 encodeObject:v14];
        [v10 encodeObject:v16];
      }

      ++v13;
      v12 += 272;
    }
    while (v13 < a3->var4.var0.var2);
  }
  unint64_t v18 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v18;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4.var7.var1];
  [v5 setSet:v6];

  if (a3->var4.var0.var2)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    do
    {
      id v9 = +[Yp00msaYdVlZesvU listDependenciesForStringType:(char *)a3->var4.var0.var3 + v7];
      [v5 unionSet:v9];

      id v10 = +[Yp00msaYdVlZesvU listDependenciesForStringType:(char *)a3->var4.var0.var3 + v7 + 136];
      [v5 unionSet:v10];

      ++v8;
      v7 += 272;
    }
    while (v8 < a3->var4.var0.var2);
  }
  id v11 = +[NSSet setWithSet:v5];

  return v11;
}

@end