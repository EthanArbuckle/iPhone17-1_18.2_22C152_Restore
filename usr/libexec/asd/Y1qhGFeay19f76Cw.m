@interface Y1qhGFeay19f76Cw
- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8;
- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4;
- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6;
@end

@implementation Y1qhGFeay19f76Cw

- (id)compute:(_KUwyEjpVZR65eUyl *)a3 UtPlzRffoEpw7Ue1:(_eipjLVDiD7LNwlPc *)a4 SFkZRA5Ek9YzhDRs:(unsigned int)a5 jAVr67FQ6j4EzsgV:(id)a6 i4KDOQicW9Xd5WBz:(id)a7 TWWnmIjkBlMfHmma:(id)a8
{
  id v11 = a7;
  id v12 = a8;
  uint64_t v88 = 0;
  BOOL v13 = a3->var1 >= 2 && a3->var4.var8.var0 != 0;
  memset(&v87, 0, sizeof(v87));
  v73 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v88 i4KDOQicW9Xd5WBz:v11 TWWnmIjkBlMfHmma:v12];
  v67 = v12;
  v68 = v11;
  if (v88)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    id v20 = 0;
    v21 = 0;
    v22 = 0;
    v66 = 0;
    goto LABEL_50;
  }
  uint64_t v23 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)&a3->var4.var26 + 144 xNtFS0jGMQPgkTi7:&v88 i4KDOQicW9Xd5WBz:v11 TWWnmIjkBlMfHmma:v12];
  v66 = (void *)v23;
  if (v88)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    id v20 = 0;
    v21 = 0;
    v22 = 0;
    goto LABEL_50;
  }
  uint64_t v24 = v23;
  os_signpost_id_t v25 = os_signpost_id_generate((os_log_t)qword_1006AD1B0);
  v26 = (id)qword_1006AD1B0;
  v27 = v26;
  unint64_t v62 = v25 - 1;
  if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "fp", "enableTelemetry=YES", buf, 2u);
  }
  os_signpost_id_t v59 = v25;

  id v28 = objc_alloc_init((Class)NSFileManager);
  v21 = v28;
  if (a3->var4.var8.var0)
  {
    v58 = a4;
    [v28 enumeratorAtPath:v73];
    v19 = 0;
    id v63 = (id)objc_claimAutoreleasedReturnValue();
    v65 = v63;
  }
  else
  {
    id v86 = 0;
    v19 = [v28 contentsOfDirectoryAtPath:v73 error:&v86];
    id v20 = v86;
    v65 = [v19 objectEnumerator];
    if (v20)
    {
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0;
      v22 = 0;
      uint64_t v88 = 162;
      v14 = v65;
      goto LABEL_50;
    }
    v58 = a4;
    id v63 = 0;
  }
  v61 = v19;
  v70 = v21;
  id v64 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v24 options:0 error:0];
  id v29 = objc_alloc_init((Class)NSMutableArray);
  if (a3->var4.var9.var1)
  {
    v30 = 0;
    unsigned int v31 = 0;
    do
    {
      v32 = v30;
      v30 = [v65 nextObject];

      if (!v30) {
        break;
      }
      if (objc_msgSend(v64, "numberOfMatchesInString:options:range:", v30, 0, 0, objc_msgSend(v30, "length")))
      {
        [v29 addObject:v30];
        ++v31;
      }
      if (v13 && (unint64_t)[v63 level] > a3->var4.var8.var0)
      {
        v33 = [v63 fileAttributes];
        NSFileAttributeType v34 = [v33 objectForKeyedSubscript:@"NSFileType"];

        if (v34 == NSFileTypeDirectory) {
          [v63 skipDescendants];
        }
      }
    }
    while (v31 < a3->var4.var9.var1);
  }
  else
  {
    v30 = 0;
  }
  v60 = v30;
  id v69 = objc_alloc_init((Class)NSMutableArray);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id obj = v29;
  id v74 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
  v35 = 0;
  if (v74)
  {
    uint64_t v72 = *(void *)v83;
    v21 = v70;
    do
    {
      for (i = 0; i != v74; i = (char *)i + 1)
      {
        if (*(void *)v83 != v72) {
          objc_enumerationMutation(obj);
        }
        v37 = +[NSString stringWithFormat:@"%@/%@", v73, *(void *)(*((void *)&v82 + 1) + 8 * i)];
        v38 = +[NSURL fileURLWithPath:v37];
        id v81 = v35;
        v39 = [v21 attributesOfItemAtPath:v37 error:&v81];
        id v77 = v81;

        id v40 = v37;
        stat((const char *)[v40 fileSystemRepresentation], &v87);
        v75 = v40;
        uint64_t v41 = [v40 lastPathComponent];
        v76 = v38;
        v80 = [v38 path];
        v79 = [v39 objectForKey:NSFilePosixPermissions];
        v78 = [v39 objectForKey:NSFileSize];
        v42 = [v39 objectForKey:NSFileType];
        v43 = +[NSDate dateWithTimeIntervalSince1970:(double)v87.st_atimespec.tv_sec];
        v44 = [v39 objectForKey:NSFileModificationDate];
        v45 = +[NSDate dateWithTimeIntervalSince1970:(double)v87.st_ctimespec.tv_sec];
        uint64_t v46 = [v39 objectForKey:NSFileCreationDate];
        v47 = (void *)v46;
        v48 = (void *)v41;
        if (v41 && v80 && v79 && v78 && v42 && v43 && v44 && v45 && v46)
        {
          v93[0] = @"fn";
          v93[1] = @"fd";
          v94[0] = v41;
          v94[1] = v80;
          v93[2] = @"pp";
          v93[3] = @"fs";
          v94[2] = v79;
          v94[3] = v78;
          v93[4] = @"ft";
          v93[5] = @"lat";
          v94[4] = v42;
          v94[5] = v43;
          v93[6] = @"lmt";
          v93[7] = @"lst";
          v94[6] = v44;
          v94[7] = v45;
          v94[8] = v46;
          v93[8] = @"fct";
          v93[9] = @"ec";
          v49 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v77 code]);
          v94[9] = v49;
          v50 = +[NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:10];

          [v69 addObject:v50];
          v21 = v70;
        }

        v35 = v77;
      }
      id v74 = [obj countByEnumeratingWithState:&v82 objects:v95 count:16];
    }
    while (v74);
  }
  else
  {
    v21 = v70;
  }
  id v20 = v35;

  v51 = (id)qword_1006AD1B0;
  v52 = v51;
  if (v62 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
  {
    unsigned int var0 = v58->var0;
    unsigned int var1 = v58->var1;
    *(_DWORD *)buf = 67240448;
    unsigned int v90 = var0;
    __int16 v91 = 1026;
    unsigned int v92 = var1;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, v59, "fp", "p=%{public,signpost.telemetry:number1}d,i=%{public,signpost.telemetry:number2}d", buf, 0xEu);
  }

  v22 = v60;
  v19 = v61;
  v16 = v64;
  v14 = v65;
  v15 = v63;
  v17 = v69;
  v18 = obj;
LABEL_50:
  v55 = [kjAS9HuCdR1m5txL alloc];
  v56 = [(kjAS9HuCdR1m5txL *)v55 initWithGyF0atX3JpCKc9pK:v17 qfSDGTGvqd3Hruzg:v88];

  return v56;
}

- (unint64_t)computeHash:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4 i4KDOQicW9Xd5WBz:(id)a5 TWWnmIjkBlMfHmma:(id)a6
{
  id v8 = a6;
  id v9 = a5;
  id v10 = [objc_alloc((Class)NSKeyedArchiver) initRequiringSecureCoding:0];
  uint64_t v15 = 0;
  id v11 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:&a3->var4.var7.var1 xNtFS0jGMQPgkTi7:&v15 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];
  id v12 = +[Yp00msaYdVlZesvU yv5QRLoFvJ66jYJS:(char *)&a3->var4.var26 + 144 xNtFS0jGMQPgkTi7:&v15 i4KDOQicW9Xd5WBz:v9 TWWnmIjkBlMfHmma:v8];

  [v10 encodeInt64:0xC24A388BC1F4D127 forKey:@"0x5563"];
  [v10 encodeObject:v11];
  [v10 encodeObject:v12];
  [v10 encodeInt32:a3->var4.var9.var1 forKey:@"0x49b7"];
  [v10 encodeInt32:a3->var4.var8.var0 forKey:@"0xd61f"];
  unint64_t v13 = +[Yp00msaYdVlZesvU cv2QAcQ2CDdiHuN6:v10];

  return v13;
}

- (id)listDependencies:(_KUwyEjpVZR65eUyl *)a3 jAVr67FQ6j4EzsgV:(id)a4
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = +[Yp00msaYdVlZesvU listDependenciesForStringType:(char *)&a3->var4.var26 + 144];
  [v5 setSet:v6];

  v7 = +[Yp00msaYdVlZesvU listDependenciesForStringType:&a3->var4.var7.var1];
  [v5 unionSet:v7];

  id v8 = +[NSSet setWithSet:v5];

  return v8;
}

@end