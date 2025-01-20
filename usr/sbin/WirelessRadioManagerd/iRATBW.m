@interface iRATBW
+ (id)URLOfModelInThisBundle;
- (MLModel)model;
- (iRATBW)init;
- (iRATBW)initWithConfiguration:(id)a3 error:(id *)a4;
- (iRATBW)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5;
- (iRATBW)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (iRATBW)initWithMLModel:(id)a3;
- (id)predictionFromCca:(double)a3 weighted_average_phyrate_rx:(double)a4 weighted_average_rssi:(double)a5 weighted_average_snr:(double)a6 maxOfActualLowBandwidth_d:(double)a7 tcpRTTAvg:(double)a8 wifChannelType:(double)a9 wifiguardinterval:(double)a10 isWfiCaptive:(double)a11 wifinumberOfSpatialStreams:(double)a12 error:(id *)a13;
- (id)predictionFromFeatures:(id)a3 error:(id *)a4;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation iRATBW

+ (id)URLOfModelInThisBundle
{
  v2 = [+[NSBundle bundleForClass:objc_opt_class()] pathForResource:@"iRATBW" ofType:@"mlmodelc"];
  if (v2)
  {
    return +[NSURL fileURLWithPath:v2];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10013AD30();
    }
    return 0;
  }
}

- (iRATBW)initWithMLModel:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)iRATBW;
  result = [(iRATBW *)&v5 init];
  if (result)
  {
    result->_model = (MLModel *)a3;
    if (!a3) {
      return 0;
    }
  }
  return result;
}

- (iRATBW)init
{
  id v3 = [(id)objc_opt_class() URLOfModelInThisBundle];

  return [(iRATBW *)self initWithContentsOfURL:v3 error:0];
}

- (iRATBW)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v7 = [(id)objc_opt_class() URLOfModelInThisBundle];

  return [(iRATBW *)self initWithContentsOfURL:v7 configuration:a3 error:a4];
}

- (iRATBW)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  result = (iRATBW *)[(id)sub_1000CBE18() modelWithContentsOfURL:a3 error:a4];
  if (result)
  {
    return [(iRATBW *)self initWithMLModel:result];
  }
  return result;
}

- (iRATBW)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  result = (iRATBW *)[(id)sub_1000CBE18() modelWithContentsOfURL:a3 configuration:a4 error:a5];
  if (result)
  {
    return [(iRATBW *)self initWithMLModel:result];
  }
  return result;
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = sub_1000CC388;
  v14 = sub_1000CC398;
  id v7 = (objc_class *)qword_10027D270;
  uint64_t v15 = qword_10027D270;
  if (!qword_10027D270)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000CC5BC;
    v9[3] = &unk_10020DAF8;
    v9[4] = &v10;
    sub_1000CC5BC((uint64_t)v9);
    id v7 = (objc_class *)v11[5];
  }
  _Block_object_dispose(&v10, 8);
  return [(iRATBW *)self predictionFromFeatures:a3 options:objc_alloc_init(v7) error:a4];
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5 = [(MLModel *)self->_model predictionFromFeatures:a3 options:a4 error:a5];
  v6 = [iRATBWOutput alloc];
  [objc_msgSend(v5, "featureValueForName:", @"actualLowBandwidth_d") doubleValue];

  return -[iRATBWOutput initWithActualLowBandwidth_d:](v6, "initWithActualLowBandwidth_d:");
}

- (id)predictionFromCca:(double)a3 weighted_average_phyrate_rx:(double)a4 weighted_average_rssi:(double)a5 weighted_average_snr:(double)a6 maxOfActualLowBandwidth_d:(double)a7 tcpRTTAvg:(double)a8 wifChannelType:(double)a9 wifiguardinterval:(double)a10 isWfiCaptive:(double)a11 wifinumberOfSpatialStreams:(double)a12 error:(id *)a13
{
  uint64_t v15 = [[iRATBWInput alloc] initWithCca:a3 weighted_average_phyrate_rx:a4 weighted_average_rssi:a5 weighted_average_snr:a6 maxOfActualLowBandwidth_d:a7 tcpRTTAvg:a8 wifChannelType:a9 wifiguardinterval:a10 isWfiCaptive:*(void *)&a11 wifinumberOfSpatialStreams:*(void *)&a12];

  return [(iRATBW *)self predictionFromFeatures:v15 error:a13];
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3052000000;
  v20 = sub_1000CC388;
  v21 = sub_1000CC398;
  v9 = (objc_class *)qword_10027D278;
  uint64_t v22 = qword_10027D278;
  if (!qword_10027D278)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000CC614;
    v16[3] = &unk_10020DAF8;
    v16[4] = &v17;
    sub_1000CC614((uint64_t)v16);
    v9 = (objc_class *)v18[5];
  }
  _Block_object_dispose(&v17, 8);
  id v10 = -[MLModel predictionsFromBatch:options:error:](self->_model, "predictionsFromBatch:options:error:", [[v9 alloc] initWithFeatureProviderArray:a3], a4, a5);
  v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
  if ((uint64_t)[v10 count] >= 1)
  {
    uint64_t v12 = 0;
    do
    {
      id v13 = [v10 featuresAtIndex:v12];
      v14 = [iRATBWOutput alloc];
      [objc_msgSend(v13, "featureValueForName:", @"actualLowBandwidth_d") doubleValue];
      -[NSMutableArray addObject:](v11, "addObject:", -[iRATBWOutput initWithActualLowBandwidth_d:](v14, "initWithActualLowBandwidth_d:"));
      ++v12;
    }
    while (v12 < (uint64_t)[v10 count]);
  }
  return v11;
}

- (MLModel)model
{
  return self->_model;
}

@end