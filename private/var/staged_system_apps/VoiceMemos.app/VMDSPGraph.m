@interface VMDSPGraph
+ (BOOL)writeGraphTextToFile:(id)a3 samplerate:(int)a4 bufferSize:(int)a5 error:(id *)a6;
+ (id)_noiseSuppressionParameters;
+ (id)_reverbSuppressionParameters;
+ (id)auStrip;
+ (id)nsImplementation;
+ (id)parameters;
+ (id)propertyStrip;
@end

@implementation VMDSPGraph

+ (id)nsImplementation
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"NS Implementation"];

  if (v3) {
    v4 = v3;
  }
  else {
    v4 = @"ons4";
  }
  v5 = v4;

  return v5;
}

+ (id)_reverbSuppressionParameters
{
  LODWORD(v2) = -24.0;
  LODWORD(v3) = -1035468800;
  v4 = +[VMAudioParameter parameterWithName:@"RS Pass One Gain Floor" defaultValue:0 min:@"ReverbSuppressor" max:v2 internalAddress:v3 graphName:0.0];
  LODWORD(v5) = -12.0;
  LODWORD(v6) = -1035468800;
  v7 = +[VMAudioParameter parameterWithName:@"RS Pass Two Gain Floor", 1, @"ReverbSuppressor", v5, v6, 0.0, v4 defaultValue min max internalAddress graphName];
  v14[1] = v7;
  LODWORD(v8) = 8.0;
  LODWORD(v9) = -30.0;
  LODWORD(v10) = 30.0;
  v11 = +[VMAudioParameter parameterWithName:@"RS SPL Reverb Tail Gain" defaultValue:2 min:@"ReverbSuppressor" max:v8 internalAddress:v9 graphName:v10];
  v14[2] = v11;
  v12 = +[NSArray arrayWithObjects:v14 count:3];

  return v12;
}

+ (id)_noiseSuppressionParameters
{
  LODWORD(v2) = -12.0;
  LODWORD(v3) = -24.0;
  v4 = +[VMAudioParameter parameterWithName:@"NS Suppression Level" defaultValue:0 min:@"NoiseSuppressor" max:v2 internalAddress:v3 graphName:0.0];
  v17[0] = v4;
  LODWORD(v5) = -20.0;
  LODWORD(v6) = 20.0;
  v7 = +[VMAudioParameter parameterWithName:@"NS AGC Post Gain" defaultValue:4 min:@"NoiseSuppressor" max:0.0 internalAddress:v5 graphName:v6];
  v17[1] = v7;
  LODWORD(v8) = 1117782016;
  LODWORD(v9) = 1120403456;
  LODWORD(v10) = -25.0;
  v11 = +[VMAudioParameter parameterWithName:@"NS SPL Meter Calibration" defaultValue:6 min:@"NoiseSuppressor" max:v8 internalAddress:v10 graphName:v9];
  v17[2] = v11;
  LODWORD(v12) = 5.0;
  LODWORD(v13) = 10.0;
  v14 = +[VMAudioParameter parameterWithName:@"NS SPL Time Constant" defaultValue:7 min:@"NoiseSuppressor" max:v12 internalAddress:0.0 graphName:v13];
  v17[3] = v14;
  v15 = +[NSArray arrayWithObjects:v17 count:4];

  return v15;
}

+ (id)parameters
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000398C8;
  block[3] = &unk_1002211C8;
  block[4] = a1;
  if (qword_10026A6D8 != -1) {
    dispatch_once(&qword_10026A6D8, block);
  }
  double v2 = (void *)qword_10026A6D0;

  return v2;
}

+ (BOOL)writeGraphTextToFile:(id)a3 samplerate:(int)a4 bufferSize:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  v11 = v10;
  if (!qword_10026A6E0)
  {
    id v41 = v10;
    double v12 = +[NSBundle mainBundle];
    double v13 = [v12 pathForResource:@"voiceMemo_NS_ReverbSuppressor_template" ofType:@"dspg"];

    v14 = +[NSMutableString stringWithContentsOfFile:v13 encoding:4 error:a6];
    id v15 = [v14 rangeOfString:@"noise_supression_imp_token"];
    uint64_t v17 = v16;
    v18 = [a1 nsImplementation];
    [v14 replaceCharactersInRange:v15 withString:v17];

    if (!v14)
    {

      unsigned __int8 v35 = 0;
      v11 = v41;
      goto LABEL_12;
    }
    v37 = v13;
    uint64_t v38 = v8;
    uint64_t v39 = v7;
    v40 = a6;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v19 = [a1 parameters];
    id v20 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v43;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(void *)v43 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v25 = [v24 address];
          [v24 defaultValue];
          [v14 appendFormat:@"param %i %f in\n", v25, v26];
          id v27 = [v24 address];
          v28 = [v24 graphName];
          [v14 appendFormat:@"wireGraphParam %i (%@ %i 0 0)\n", v27, v28, [v24 internalAddress]];
        }
        id v21 = [v19 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v21);
    }

    id v29 = [v14 copy];
    v30 = (void *)qword_10026A6E0;
    qword_10026A6E0 = (uint64_t)v29;

    a6 = v40;
    v11 = v41;
    uint64_t v8 = v38;
    uint64_t v7 = v39;
  }
  v31 = +[NSString stringWithFormat:@"[def fs %i]", v8];
  v32 = +[NSString stringWithFormat:@"[def sz %i]", v7];
  v33 = [(id)qword_10026A6E0 stringByReplacingOccurrencesOfString:@"samplerate_def_token" withString:v31];
  v34 = [v33 stringByReplacingOccurrencesOfString:@"size_def_token" withString:v32];

  unsigned __int8 v35 = [v34 writeToFile:v11 atomically:1 encoding:4 error:a6];
LABEL_12:

  return v35;
}

+ (id)propertyStrip
{
  if (qword_10026A6F0 != -1) {
    dispatch_once(&qword_10026A6F0, &stru_100221208);
  }
  double v2 = (void *)qword_10026A6E8;

  return v2;
}

+ (id)auStrip
{
  if (qword_10026A700 != -1) {
    dispatch_once(&qword_10026A700, &stru_100221228);
  }
  double v2 = (void *)qword_10026A6F8;

  return v2;
}

@end