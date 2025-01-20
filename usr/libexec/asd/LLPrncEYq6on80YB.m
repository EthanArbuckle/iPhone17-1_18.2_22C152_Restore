@interface LLPrncEYq6on80YB
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation LLPrncEYq6on80YB

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v11 = a6;
  id v91 = a7;
  id v85 = a8;
  id v98 = 0;
  v82 = v11;
  id v92 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3->var4.var9.var1];
  id v93 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3->var4.var9.var1];
  id v88 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:a3->var4.var9.var1];
  unsigned int var1 = a3->var1;
  os_signpost_id_t v12 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v13 = (id)qword_1006AD1B0;
  v14 = v13;
  os_signpost_id_t spid = v12;
  unint64_t v83 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "ma", "enableTelemetry=YES", buf, 2u);
  }

  unint64_t var0 = a3->var4.var8.var0;
  if ((unint64_t)[v91 count] <= var0)
  {
    v86 = 0;
    v20 = +[eTBtehykeBvfpeTP hKjCyPlJs74k9vMV:161005];
    v87 = 0;
    v21 = 0;
LABEL_9:
    v16 = 0;
    id v17 = 0;
    id v84 = 0;
    id obj = 0;
    goto LABEL_10;
  }
  v86 = [v91 objectAtIndexedSubscript:a3->var4.var8.var0];
  id v98 = [v86 qfSDGTGvqd3Hruzg];
  if (v98)
  {
    v87 = 0;
    v77 = 0;
    v16 = 0;
    id v17 = 0;
    id v18 = 0;
    id obj = 0;
LABEL_7:
    v19 = [kjAS9HuCdR1m5txL alloc];
    v20 = [(kjAS9HuCdR1m5txL *)v19 initWithGyF0atX3JpCKc9pK:v17 qfSDGTGvqd3Hruzg:v98];
    v21 = v77;
    id v84 = v18;
    goto LABEL_10;
  }
  if (var1 < 2)
  {
    v87 = 0;
    v77 = 0;
  }
  else
  {
    v21 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var26.var2[0].var3 xNtFS0jGMQPgkTi7:&v98 i4KDOQicW9Xd5WBz:v91 TWWnmIjkBlMfHmma:v85];
    if (v98)
    {
      v27 = [kjAS9HuCdR1m5txL alloc];
      v87 = 0;
      v20 = [(kjAS9HuCdR1m5txL *)v27 initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:v98];
      goto LABEL_9;
    }
    v87 = +[NSPredicate predicateWithFormat:v21];
    v77 = v21;
  }
  if (!a3->var4.var9.var1)
  {
LABEL_30:
    [v86 GyF0atX3JpCKc9pK];
    if (var1 == 2) {
      v35 = {;
    }
      id obja = [v35 filteredArrayUsingPredicate:v87];
    }
    else
    {
      id obja = (id)objc_claimAutoreleasedReturnValue();
    }
    id v84 = objc_alloc_init((Class)NSMutableArray);
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id obj = obja;
    id v36 = [obj countByEnumeratingWithState:&v94 objects:v102 count:16];
    if (v36)
    {
      v16 = 0;
      id v75 = v36;
      uint64_t v76 = *(void *)v95;
      do
      {
        for (i = 0; i != v75; i = (char *)i + 1)
        {
          if (*(void *)v95 != v76) {
            objc_enumerationMutation(obj);
          }
          id v37 = *(id *)(*((void *)&v94 + 1) + 8 * i);
          id v38 = objc_alloc_init((Class)NSMutableDictionary);

          v16 = v38;
          if (a3->var4.var9.var1)
          {
            uint64_t v39 = 0;
            while (1)
            {
              switch(*(_DWORD *)(a3->var4.var11.var1 + 4 * v39))
              {
                case 1:
                  v40 = [v93 objectAtIndexedSubscript:v39];
                  v41 = [v92 objectAtIndexedSubscript:v39];
                  [v16 setObject:v40 forKey:v41];

                  goto LABEL_57;
                case 2:
                  v60 = [v93 objectAtIndexedSubscript:v39];
                  v61 = +[NSPredicate predicateWithFormat:v60];
                  id v62 = [v61 evaluateWithObject:v37 substitutionVariables:0];

                  v63 = +[NSNumber numberWithBool:v62];
                  v64 = [v92 objectAtIndexedSubscript:v39];
                  [v16 setObject:v63 forKey:v64];

                  goto LABEL_57;
                case 3:
                  v48 = [v93 objectAtIndexedSubscript:v39];
                  v49 = +[NSExpression expressionWithFormat:v48];
                  v50 = [v49 expressionValueWithObject:v37 context:0];

                  if (v50)
                  {
                    v51 = [v92 objectAtIndexedSubscript:v39];
                    [v16 setObject:v50 forKey:v51];
                  }
                  goto LABEL_47;
                case 4:
                  v52 = +[NSNumber numberWithInt:v39];
                  v50 = [v88 objectForKeyedSubscript:v52];

                  if (v50)
                  {
                    v53 = [v93 objectAtIndexedSubscript:v39];
                    v54 = [v37 objectForKeyedSubscript:v53];

                    v55 = [v37 objectForKeyedSubscript:v50];
                    id v56 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v55 options:0 error:0];
                    BOOL v57 = [v56 numberOfMatchesInString:v54 options:0 range:[v54 length]];

                    v58 = +[NSNumber numberWithBool:v57];
                    v59 = [v92 objectAtIndexedSubscript:v39];
                    [v16 setObject:v58 forKey:v59];
                  }
LABEL_47:

                  goto LABEL_57;
                case 5:
                  *(void *)buf = 0;
                  v42 = [v93 objectAtIndexedSubscript:v39];
                  v43 = +[NSNumber numberWithInt:v39];
                  v44 = [v88 objectForKeyedSubscript:v43];

                  +[Yp00msaYdVlZesvU otlAmd6vMhhfwQLu:v42 withObject:v37 errorValue:buf];
                  if (*(void *)buf)
                  {
                    v46 = [v16 objectForKey:@"ec"];
                    BOOL v47 = v46 == 0;

                    if (!v47) {
                      goto LABEL_56;
                    }
LABEL_54:
                    [v16 setObject:&off_100688160 forKey:@"ec"];
                    goto LABEL_56;
                  }
                  double v65 = v45;
                  +[Yp00msaYdVlZesvU otlAmd6vMhhfwQLu:v44 withObject:v37 errorValue:buf];
                  if (*(void *)buf)
                  {
                    v67 = [v16 objectForKey:@"ec"];
                    BOOL v68 = v67 == 0;

                    if (!v68) {
                      goto LABEL_56;
                    }
                    goto LABEL_54;
                  }
                  id v69 = [objc_alloc((Class)CLLocation) initWithLatitude:v65 longitude:v66];
                  v70 = [v92 objectAtIndexedSubscript:v39];
                  [v16 setObject:v69 forKey:v70];

LABEL_56:
LABEL_57:
                  if (++v39 >= (unint64_t)a3->var4.var9.var1) {
                    goto LABEL_58;
                  }
                  break;
                default:
                  v20 = [[kjAS9HuCdR1m5txL alloc] initWithGyF0atX3JpCKc9pK:v84 qfSDGTGvqd3Hruzg:-27052];

                  id v17 = 0;
                  goto LABEL_72;
              }
            }
          }
LABEL_58:
          [v84 addObject:v16];
        }
        id v75 = [obj countByEnumeratingWithState:&v94 objects:v102 count:16];
      }
      while (v75);
    }
    else
    {
      v16 = 0;
    }

    if (var1 == 3)
    {
      id v17 = [v84 filteredArrayUsingPredicate:v87];
      id v18 = v84;
    }
    else
    {
      id v17 = v84;
      id v18 = v17;
    }
    goto LABEL_7;
  }
  uint64_t v28 = 0;
  unint64_t v29 = 0;
  while (1)
  {
    v30 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:a3->var4.var5.var3 + v28 xNtFS0jGMQPgkTi7:&v98 i4KDOQicW9Xd5WBz:v91 TWWnmIjkBlMfHmma:v85];
    if (v98)
    {
      v71 = [kjAS9HuCdR1m5txL alloc];
      v20 = [(kjAS9HuCdR1m5txL *)v71 initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:v98];

      goto LABEL_71;
    }
    v31 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:a3->var4.var5.var4 + v28 xNtFS0jGMQPgkTi7:&v98 i4KDOQicW9Xd5WBz:v91 TWWnmIjkBlMfHmma:v85];
    if (v98)
    {
      v72 = [kjAS9HuCdR1m5txL alloc];
      uint64_t v73 = (uint64_t)v98;
LABEL_67:
      v20 = [(kjAS9HuCdR1m5txL *)v72 initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:v73];
      goto LABEL_70;
    }
    [v92 addObject:v30];
    [v93 addObject:v31];
    int v32 = *(_DWORD *)(a3->var4.var11.var1 + 4 * v29);
    if ((v32 - 1) >= 3) {
      break;
    }
LABEL_29:

    ++v29;
    v28 += 136;
    if (v29 >= a3->var4.var9.var1) {
      goto LABEL_30;
    }
  }
  if ((v32 - 4) > 1)
  {
    v72 = [kjAS9HuCdR1m5txL alloc];
    uint64_t v73 = 161;
    goto LABEL_67;
  }
  v33 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:a3->var4.var23.var4 + v28 xNtFS0jGMQPgkTi7:&v98 i4KDOQicW9Xd5WBz:v91 TWWnmIjkBlMfHmma:v85];
  if (!v98)
  {
    v34 = +[NSNumber numberWithInt:v29];
    [v88 setObject:v33 forKey:v34];

    goto LABEL_29;
  }
  v74 = [kjAS9HuCdR1m5txL alloc];
  v20 = [(kjAS9HuCdR1m5txL *)v74 initWithGyF0atX3JpCKc9pK:0 qfSDGTGvqd3Hruzg:v98];

LABEL_70:
LABEL_71:
  v16 = 0;
  id v17 = 0;
  id v84 = 0;
  id obj = 0;
LABEL_72:
  v21 = v77;
LABEL_10:
  v22 = (id)qword_1006AD1B0;
  v23 = v22;
  if (v83 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    unsigned int v24 = a4->var0;
    unsigned int v25 = a4->var1;
    *(_DWORD *)buf = 67240448;
    *(_DWORD *)&buf[4] = v24;
    __int16 v100 = 1026;
    unsigned int v101 = v25;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_END, spid, "ma", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  return v20;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a5;
  id v31 = a6;
  id v9 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v32 = 0;
  v10 = [v8 objectAtIndexedSubscript:a3->var4.var8.var0];
  id v30 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3->var4.var9.var1];
  id v29 = [objc_alloc((Class)NSMutableArray) initWithCapacity:a3->var4.var9.var1];
  id v28 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:a3->var4.var9.var1];
  [v9 encodeInt64:0x594EAC2DD9E5ADEFLL forKey:@"0x5563"];
  [v9 encodeInt64:a3->var1 forKey:@"0x6595"];
  [v9 encodeInt64:objc_msgSend(v10, "JmiV9VW8P3Gxz1H7") forKey:@"0x07aa"];
  [v9 encodeInt64:a3->var4.var9.var1 forKey:@"0x89bc"];
  LODWORD(var1) = a3->var4.var9.var1;
  if (var1)
  {
    unint64_t v12 = 0;
    do
    {
      uint64_t v13 = *(unsigned int *)(a3->var4.var11.var1 + 4 * v12);
      v14 = +[NSString stringWithFormat:@"%d 0xa8c1", v12];
      [v9 encodeInt32:v13 forKey:v14];

      ++v12;
      unint64_t var1 = a3->var4.var9.var1;
    }
    while (v12 < var1);
  }
  v27 = v10;
  if (a3->var1 > 1)
  {
    v15 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var26.var2[0].var3 xNtFS0jGMQPgkTi7:&v32 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v31];
    [v9 encodeObject:v15];

    LODWORD(var1) = a3->var4.var9.var1;
  }
  v26 = v9;
  if (var1)
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    do
    {
      id v18 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:a3->var4.var5.var3 + v16 xNtFS0jGMQPgkTi7:&v32 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v31];
      [v30 addObject:v18];
      int v19 = *(_DWORD *)(a3->var4.var11.var1 + 4 * v17);
      if ((v19 - 1) >= 3)
      {
        if ((v19 - 4) >= 2)
        {
          v20 = 0;
        }
        else
        {
          uint64_t v21 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:a3->var4.var5.var4 + v16 xNtFS0jGMQPgkTi7:&v32 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v31];
          if (v21) {
            [v29 addObject:v21];
          }
          v22 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:a3->var4.var23.var4 + v16 xNtFS0jGMQPgkTi7:&v32 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v31];
          if (v22)
          {
            v23 = +[NSNumber numberWithInt:v17];
            [v28 setObject:v22 forKey:v23];
          }
          v20 = (void *)v21;
        }
      }
      else
      {
        v20 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:a3->var4.var5.var4 + v16 xNtFS0jGMQPgkTi7:&v32 i4KDOQicW9Xd5WBz:v8 TWWnmIjkBlMfHmma:v31];
        if (v20) {
          [v29 addObject:v20];
        }
      }

      ++v17;
      v16 += 136;
    }
    while (v17 < a3->var4.var9.var1);
  }
  [v26 encodeObject:v30];
  [v26 encodeObject:v29];
  [v26 encodeObject:v28];
  unint64_t v24 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v26];

  return v24;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = +[NSNumber numberWithUnsignedInt:a3->var4.var8.var0];
  [v5 addObject:v6];

  if (a3->var4.var9.var1)
  {
    uint64_t v7 = 0;
    unint64_t v8 = 0;
    while (1)
    {
      id v9 = +[Yp00msaYdVlZesvU listDependenciesForStringType:a3->var4.var5.var3 + v7];
      [v5 unionSet:v9];

      int v10 = *(_DWORD *)(a3->var4.var11.var1 + 4 * v8);
      if ((v10 - 1) < 3) {
        break;
      }
      if ((v10 - 4) < 2)
      {
        unint64_t v12 = +[Yp00msaYdVlZesvU listDependenciesForStringType:a3->var4.var5.var4 + v7];
        [v5 unionSet:v12];

        id v11 = +[Yp00msaYdVlZesvU listDependenciesForStringType:a3->var4.var23.var4 + v7];
        [v5 unionSet:v11];
        goto LABEL_7;
      }
LABEL_8:
      ++v8;
      v7 += 136;
      if (v8 >= a3->var4.var9.var1) {
        goto LABEL_9;
      }
    }
    id v11 = +[Yp00msaYdVlZesvU listDependenciesForStringType:a3->var4.var5.var4 + v7];
    [v5 unionSet:v11];
LABEL_7:

    goto LABEL_8;
  }
LABEL_9:
  if (a3->var1 == 1)
  {
    uint64_t v13 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4.var26.var2[0].var3];
    [v5 addObject:v13];
  }
  v14 = +[NSSet setWithSet:v5];

  return v14;
}

@end