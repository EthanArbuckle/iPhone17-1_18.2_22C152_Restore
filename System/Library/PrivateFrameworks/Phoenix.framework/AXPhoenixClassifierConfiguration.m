@interface AXPhoenixClassifierConfiguration
- (AXPhoenixClassifierConfiguration)init;
- (AXPhoenixClassifierConfiguration)initWithDictionary:(id)a3 missingKeys:(id)a4;
- (NSArray)doubleTapPolicyThresholds;
- (NSArray)generalPolicyThresholds;
- (NSArray)tripleTapPolicyThresholds;
- (NSString)accelerometerSampleRateInHzKey;
- (NSString)dataKey;
- (NSString)doubleTapPolicyKey;
- (NSString)generalPolicyKey;
- (NSString)maxAccelerationBufferSizeKey;
- (NSString)maxPredictionBufferSizeKey;
- (NSString)minDurationBetweenTriggersInSecondsKey;
- (NSString)modelPredictionRateInHzKey;
- (NSString)policyKey;
- (NSString)predictionClassDoubleTapKey;
- (NSString)predictionClassNoneKey;
- (NSString)predictionClassTripleTapKey;
- (NSString)predictionConfidenceThresholdKey;
- (NSString)predictionCountThresholdsKey;
- (NSString)tripleTapPolicyKey;
- (double)predictionConfidenceThreshold;
- (id)toDictionary;
- (unint64_t)accelerometerSampleRateInHz;
- (unint64_t)maxAccelerationBufferSize;
- (unint64_t)maxPredictionBufferSize;
- (unint64_t)minDurationBetweenTriggersInSeconds;
- (unint64_t)modelPredictionRateInHz;
- (void)_initializeKeys;
- (void)_parseFromDictionary:(id)a3 missingKeys:(id)a4;
- (void)_setDefaultConfiguration;
- (void)setAccelerometerSampleRateInHz:(unint64_t)a3;
- (void)setAccelerometerSampleRateInHzKey:(id)a3;
- (void)setDataKey:(id)a3;
- (void)setDoubleTapPolicyKey:(id)a3;
- (void)setDoubleTapPolicyThresholds:(id)a3;
- (void)setGeneralPolicyKey:(id)a3;
- (void)setGeneralPolicyThresholds:(id)a3;
- (void)setMaxAccelerationBufferSize:(unint64_t)a3;
- (void)setMaxAccelerationBufferSizeKey:(id)a3;
- (void)setMaxPredictionBufferSize:(unint64_t)a3;
- (void)setMaxPredictionBufferSizeKey:(id)a3;
- (void)setMinDurationBetweenTriggersInSeconds:(unint64_t)a3;
- (void)setMinDurationBetweenTriggersInSecondsKey:(id)a3;
- (void)setModelPredictionRateInHz:(unint64_t)a3;
- (void)setModelPredictionRateInHzKey:(id)a3;
- (void)setPolicyKey:(id)a3;
- (void)setPredictionClassDoubleTapKey:(id)a3;
- (void)setPredictionClassNoneKey:(id)a3;
- (void)setPredictionClassTripleTapKey:(id)a3;
- (void)setPredictionConfidenceThreshold:(double)a3;
- (void)setPredictionConfidenceThresholdKey:(id)a3;
- (void)setPredictionCountThresholdsKey:(id)a3;
- (void)setTripleTapPolicyKey:(id)a3;
- (void)setTripleTapPolicyThresholds:(id)a3;
@end

@implementation AXPhoenixClassifierConfiguration

- (AXPhoenixClassifierConfiguration)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)AXPhoenixClassifierConfiguration;
  v6 = [(AXPhoenixClassifierConfiguration *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    [(AXPhoenixClassifierConfiguration *)v6 _initializeKeys];
    [(AXPhoenixClassifierConfiguration *)v6 _setDefaultConfiguration];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (AXPhoenixClassifierConfiguration)initWithDictionary:(id)a3 missingKeys:(id)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  objc_super v4 = v11;
  v11 = 0;
  v8.receiver = v4;
  v8.super_class = (Class)AXPhoenixClassifierConfiguration;
  v11 = [(AXPhoenixClassifierConfiguration *)&v8 init];
  objc_storeStrong((id *)&v11, v11);
  if (v11)
  {
    [(AXPhoenixClassifierConfiguration *)v11 _initializeKeys];
    [(AXPhoenixClassifierConfiguration *)v11 _parseFromDictionary:location[0] missingKeys:v9];
  }
  v6 = v11;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v11, 0);
  return v6;
}

- (void)_initializeKeys
{
}

- (void)_setDefaultConfiguration
{
  SEL v5 = self;
  v4[1] = (id)a2;
  [(AXPhoenixClassifierConfiguration *)self setAccelerometerSampleRateInHz:100];
  [(AXPhoenixClassifierConfiguration *)v5 setMaxAccelerationBufferSize:250];
  v4[0] = (id)[MEMORY[0x263EFF980] arrayWithCapacity:3];
  objc_msgSend(v4[0], "setObject:atIndexedSubscript:");
  objc_msgSend(v4[0], "setObject:atIndexedSubscript:", &unk_26EA41950);
  objc_msgSend(v4[0], "setObject:atIndexedSubscript:");
  [(AXPhoenixClassifierConfiguration *)v5 setGeneralPolicyThresholds:v4[0]];
  id v3 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:2];
  [v3 setObject:&unk_26EA41938 atIndexedSubscript:0];
  [v3 setObject:&unk_26EA41968 atIndexedSubscript:1];
  [(AXPhoenixClassifierConfiguration *)v5 setDoubleTapPolicyThresholds:v3];
  id v2 = (id)[MEMORY[0x263EFF980] arrayWithCapacity:2];
  [v2 setObject:&unk_26EA41938 atIndexedSubscript:0];
  [v2 setObject:&unk_26EA41968 atIndexedSubscript:1];
  [(AXPhoenixClassifierConfiguration *)v5 setTripleTapPolicyThresholds:v2];
  [(AXPhoenixClassifierConfiguration *)v5 setPredictionConfidenceThreshold:0.95];
  [(AXPhoenixClassifierConfiguration *)v5 setMinDurationBetweenTriggersInSeconds:2];
  [(AXPhoenixClassifierConfiguration *)v5 setMaxPredictionBufferSize:8];
  [(AXPhoenixClassifierConfiguration *)v5 setModelPredictionRateInHz:10];
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(v4, 0);
}

- (void)_parseFromDictionary:(id)a3 missingKeys:(id)a4
{
  v140 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v138 = 0;
  objc_storeStrong(&v138, a4);
  id v127 = location[0];
  v128 = [(AXPhoenixClassifierConfiguration *)v140 dataKey];
  id v137 = (id)objc_msgSend(v127, "objectForKey:");

  if (v137)
  {
    v124 = [(AXPhoenixClassifierConfiguration *)v140 accelerometerSampleRateInHzKey];
    id v125 = (id)objc_msgSend(v137, "objectForKey:");

    if (v125)
    {
      v121 = v140;
      v123 = [(AXPhoenixClassifierConfiguration *)v140 accelerometerSampleRateInHzKey];
      id v122 = (id)objc_msgSend(v137, "objectForKey:");
      -[AXPhoenixClassifierConfiguration setAccelerometerSampleRateInHz:](v121, "setAccelerometerSampleRateInHz:", [v122 unsignedIntegerValue]);
    }
    else
    {
      id v119 = v138;
      v120 = [(AXPhoenixClassifierConfiguration *)v140 accelerometerSampleRateInHzKey];
      objc_msgSend(v119, "addObject:");
    }
    v117 = [(AXPhoenixClassifierConfiguration *)v140 maxAccelerationBufferSizeKey];
    id v118 = (id)objc_msgSend(v137, "objectForKey:");

    if (v118)
    {
      v114 = v140;
      v116 = [(AXPhoenixClassifierConfiguration *)v140 maxAccelerationBufferSizeKey];
      id v115 = (id)objc_msgSend(v137, "objectForKey:");
      -[AXPhoenixClassifierConfiguration setMaxAccelerationBufferSize:](v114, "setMaxAccelerationBufferSize:", [v115 unsignedIntegerValue]);
    }
    else
    {
      id v112 = v138;
      v113 = [(AXPhoenixClassifierConfiguration *)v140 maxAccelerationBufferSizeKey];
      objc_msgSend(v112, "addObject:");
    }
  }
  else
  {
    id v110 = v138;
    v111 = [(AXPhoenixClassifierConfiguration *)v140 dataKey];
    objc_msgSend(v110, "addObject:");
  }
  id v108 = location[0];
  v109 = [(AXPhoenixClassifierConfiguration *)v140 policyKey];
  id v136 = (id)objc_msgSend(v108, "objectForKey:");

  if (v136)
  {
    v106 = [(AXPhoenixClassifierConfiguration *)v140 modelPredictionRateInHzKey];
    id v107 = (id)objc_msgSend(v136, "objectForKey:");

    if (v107)
    {
      v103 = v140;
      v105 = [(AXPhoenixClassifierConfiguration *)v140 modelPredictionRateInHzKey];
      id v104 = (id)objc_msgSend(v136, "objectForKey:");
      -[AXPhoenixClassifierConfiguration setModelPredictionRateInHz:](v103, "setModelPredictionRateInHz:", [v104 unsignedIntegerValue]);
    }
    else
    {
      id v101 = v138;
      v102 = [(AXPhoenixClassifierConfiguration *)v140 modelPredictionRateInHzKey];
      objc_msgSend(v101, "addObject:");
    }
    v99 = [(AXPhoenixClassifierConfiguration *)v140 maxPredictionBufferSizeKey];
    id v100 = (id)objc_msgSend(v136, "objectForKey:");

    if (v100)
    {
      v96 = v140;
      v98 = [(AXPhoenixClassifierConfiguration *)v140 maxPredictionBufferSizeKey];
      id v97 = (id)objc_msgSend(v136, "objectForKey:");
      -[AXPhoenixClassifierConfiguration setMaxPredictionBufferSize:](v96, "setMaxPredictionBufferSize:", [v97 unsignedIntegerValue]);
    }
    else
    {
      id v94 = v138;
      v95 = [(AXPhoenixClassifierConfiguration *)v140 maxPredictionBufferSizeKey];
      objc_msgSend(v94, "addObject:");
    }
    v92 = [(AXPhoenixClassifierConfiguration *)v140 minDurationBetweenTriggersInSecondsKey];
    id v93 = (id)objc_msgSend(v136, "objectForKey:");

    if (v93)
    {
      v89 = v140;
      v91 = [(AXPhoenixClassifierConfiguration *)v140 minDurationBetweenTriggersInSecondsKey];
      id v90 = (id)objc_msgSend(v136, "objectForKey:");
      -[AXPhoenixClassifierConfiguration setMinDurationBetweenTriggersInSeconds:](v89, "setMinDurationBetweenTriggersInSeconds:", [v90 unsignedIntegerValue]);
    }
    else
    {
      id v87 = v138;
      v88 = [(AXPhoenixClassifierConfiguration *)v140 minDurationBetweenTriggersInSecondsKey];
      objc_msgSend(v87, "addObject:");
    }
    v85 = [(AXPhoenixClassifierConfiguration *)v140 predictionConfidenceThresholdKey];
    id v86 = (id)objc_msgSend(v136, "objectForKey:");

    if (v86)
    {
      v82 = v140;
      v84 = [(AXPhoenixClassifierConfiguration *)v140 predictionConfidenceThresholdKey];
      id v83 = (id)objc_msgSend(v136, "objectForKey:");
      [v83 doubleValue];
      -[AXPhoenixClassifierConfiguration setPredictionConfidenceThreshold:](v82, "setPredictionConfidenceThreshold:");
    }
    else
    {
      id v80 = v138;
      v81 = [(AXPhoenixClassifierConfiguration *)v140 predictionConfidenceThresholdKey];
      objc_msgSend(v80, "addObject:");
    }
    v79 = [(AXPhoenixClassifierConfiguration *)v140 predictionCountThresholdsKey];
    id v135 = (id)objc_msgSend(v136, "objectForKey:");

    if (v135)
    {
      v78 = [(AXPhoenixClassifierConfiguration *)v140 doubleTapPolicyKey];
      id v134 = (id)objc_msgSend(v135, "objectForKey:");

      if (v134)
      {
        v74 = (void *)MEMORY[0x263EFF980];
        v75 = [(AXPhoenixClassifierConfiguration *)v140 doubleTapPolicyThresholds];
        id v133 = (id)objc_msgSend(v74, "arrayWithArray:");

        v76 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassNoneKey];
        id v77 = (id)objc_msgSend(v134, "objectForKey:");

        if (v77)
        {
          v70 = NSNumber;
          v73 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassNoneKey];
          id v72 = (id)objc_msgSend(v134, "objectForKey:");
          id v71 = (id)objc_msgSend(v70, "numberWithUnsignedInteger:", objc_msgSend(v72, "unsignedIntegerValue"));
          objc_msgSend(v133, "setObject:atIndexedSubscript:");
        }
        else
        {
          id v68 = v138;
          v69 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassNoneKey];
          objc_msgSend(v68, "addObject:");
        }
        v66 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassDoubleTapKey];
        id v67 = (id)objc_msgSend(v134, "objectForKey:");

        if (v67)
        {
          v62 = NSNumber;
          v65 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassDoubleTapKey];
          id v64 = (id)objc_msgSend(v134, "objectForKey:");
          id v63 = (id)objc_msgSend(v62, "numberWithUnsignedInteger:", objc_msgSend(v64, "unsignedIntegerValue"));
          objc_msgSend(v133, "setObject:atIndexedSubscript:");
        }
        else
        {
          id v60 = v138;
          v61 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassDoubleTapKey];
          objc_msgSend(v60, "addObject:");
        }
        [(AXPhoenixClassifierConfiguration *)v140 setDoubleTapPolicyThresholds:v133];
        objc_storeStrong(&v133, 0);
      }
      else
      {
        id v58 = v138;
        v59 = [(AXPhoenixClassifierConfiguration *)v140 doubleTapPolicyKey];
        objc_msgSend(v58, "addObject:");
      }
      id v56 = v135;
      v57 = [(AXPhoenixClassifierConfiguration *)v140 tripleTapPolicyKey];
      id v132 = (id)objc_msgSend(v56, "objectForKey:");

      if (v132)
      {
        v52 = (void *)MEMORY[0x263EFF980];
        v53 = [(AXPhoenixClassifierConfiguration *)v140 tripleTapPolicyThresholds];
        id v131 = (id)objc_msgSend(v52, "arrayWithArray:");

        v54 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassNoneKey];
        id v55 = (id)objc_msgSend(v132, "objectForKey:");

        if (v55)
        {
          v48 = NSNumber;
          v51 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassNoneKey];
          id v50 = (id)objc_msgSend(v132, "objectForKey:");
          id v49 = (id)objc_msgSend(v48, "numberWithUnsignedInteger:", objc_msgSend(v50, "unsignedIntegerValue"));
          objc_msgSend(v131, "setObject:atIndexedSubscript:");
        }
        else
        {
          id v46 = v138;
          v47 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassNoneKey];
          objc_msgSend(v46, "addObject:");
        }
        v44 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassTripleTapKey];
        id v45 = (id)objc_msgSend(v132, "objectForKey:");

        if (v45)
        {
          v40 = NSNumber;
          v43 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassTripleTapKey];
          id v42 = (id)objc_msgSend(v132, "objectForKey:");
          id v41 = (id)objc_msgSend(v40, "numberWithUnsignedInteger:", objc_msgSend(v42, "unsignedIntegerValue"));
          objc_msgSend(v131, "setObject:atIndexedSubscript:");
        }
        else
        {
          id v38 = v138;
          v39 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassTripleTapKey];
          objc_msgSend(v38, "addObject:");
        }
        [(AXPhoenixClassifierConfiguration *)v140 setTripleTapPolicyThresholds:v131];
        objc_storeStrong(&v131, 0);
      }
      else
      {
        id v36 = v138;
        v37 = [(AXPhoenixClassifierConfiguration *)v140 tripleTapPolicyKey];
        objc_msgSend(v36, "addObject:");
      }
      id v34 = v135;
      v35 = [(AXPhoenixClassifierConfiguration *)v140 generalPolicyKey];
      id v130 = (id)objc_msgSend(v34, "objectForKey:");

      if (v130)
      {
        v30 = (void *)MEMORY[0x263EFF980];
        v31 = [(AXPhoenixClassifierConfiguration *)v140 generalPolicyThresholds];
        id v129 = (id)objc_msgSend(v30, "arrayWithArray:");

        v32 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassNoneKey];
        id v33 = (id)objc_msgSend(v130, "objectForKey:");

        if (v33)
        {
          v26 = NSNumber;
          v29 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassNoneKey];
          id v28 = (id)objc_msgSend(v130, "objectForKey:");
          id v27 = (id)objc_msgSend(v26, "numberWithUnsignedInteger:", objc_msgSend(v28, "unsignedIntegerValue"));
          objc_msgSend(v129, "setObject:atIndexedSubscript:");
        }
        else
        {
          id v24 = v138;
          v25 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassNoneKey];
          objc_msgSend(v24, "addObject:");
        }
        v22 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassDoubleTapKey];
        id v23 = (id)objc_msgSend(v130, "objectForKey:");

        if (v23)
        {
          v18 = NSNumber;
          v21 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassDoubleTapKey];
          id v20 = (id)objc_msgSend(v130, "objectForKey:");
          id v19 = (id)objc_msgSend(v18, "numberWithUnsignedInteger:", objc_msgSend(v20, "unsignedIntegerValue"));
          objc_msgSend(v129, "setObject:atIndexedSubscript:");
        }
        else
        {
          id v16 = v138;
          v17 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassDoubleTapKey];
          objc_msgSend(v16, "addObject:");
        }
        v14 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassTripleTapKey];
        id v15 = (id)objc_msgSend(v130, "objectForKey:");

        if (v15)
        {
          v10 = NSNumber;
          v13 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassTripleTapKey];
          id v12 = (id)objc_msgSend(v130, "objectForKey:");
          id v11 = (id)objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v12, "unsignedIntegerValue"));
          objc_msgSend(v129, "setObject:atIndexedSubscript:");
        }
        else
        {
          id v8 = v138;
          id v9 = [(AXPhoenixClassifierConfiguration *)v140 predictionClassTripleTapKey];
          objc_msgSend(v8, "addObject:");
        }
        [(AXPhoenixClassifierConfiguration *)v140 setGeneralPolicyThresholds:v129];
        objc_storeStrong(&v129, 0);
      }
      else
      {
        id v6 = v138;
        v7 = [(AXPhoenixClassifierConfiguration *)v140 generalPolicyKey];
        objc_msgSend(v6, "addObject:");
      }
      objc_storeStrong(&v130, 0);
      objc_storeStrong(&v132, 0);
      objc_storeStrong(&v134, 0);
    }
    else
    {
      id v4 = v138;
      SEL v5 = [(AXPhoenixClassifierConfiguration *)v140 predictionCountThresholdsKey];
      objc_msgSend(v4, "addObject:");
    }
    objc_storeStrong(&v135, 0);
  }
  objc_storeStrong(&v136, 0);
  objc_storeStrong(&v137, 0);
  objc_storeStrong(&v138, 0);
  objc_storeStrong(location, 0);
}

- (id)toDictionary
{
  v64[2] = *MEMORY[0x263EF8340];
  id v49 = [(AXPhoenixClassifierConfiguration *)self dataKey];
  v63[0] = v49;
  v48 = [(AXPhoenixClassifierConfiguration *)self accelerometerSampleRateInHzKey];
  v61[0] = v48;
  id v47 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXPhoenixClassifierConfiguration accelerometerSampleRateInHz](self, "accelerometerSampleRateInHz"));
  v62[0] = v47;
  id v46 = [(AXPhoenixClassifierConfiguration *)self maxAccelerationBufferSizeKey];
  v61[1] = v46;
  id v45 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXPhoenixClassifierConfiguration maxAccelerationBufferSize](self, "maxAccelerationBufferSize"));
  v62[1] = v45;
  id v44 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v62, v61);
  v64[0] = v44;
  v43 = [(AXPhoenixClassifierConfiguration *)self policyKey];
  v63[1] = v43;
  id v42 = [(AXPhoenixClassifierConfiguration *)self modelPredictionRateInHzKey];
  v59[0] = v42;
  id v41 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXPhoenixClassifierConfiguration modelPredictionRateInHz](self, "modelPredictionRateInHz"));
  v60[0] = v41;
  v40 = [(AXPhoenixClassifierConfiguration *)self maxPredictionBufferSizeKey];
  v59[1] = v40;
  id v39 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXPhoenixClassifierConfiguration maxPredictionBufferSize](self, "maxPredictionBufferSize"));
  v60[1] = v39;
  id v38 = [(AXPhoenixClassifierConfiguration *)self minDurationBetweenTriggersInSecondsKey];
  v59[2] = v38;
  id v37 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AXPhoenixClassifierConfiguration minDurationBetweenTriggersInSeconds](self, "minDurationBetweenTriggersInSeconds"));
  v60[2] = v37;
  id v36 = [(AXPhoenixClassifierConfiguration *)self predictionConfidenceThresholdKey];
  v59[3] = v36;
  id v3 = NSNumber;
  [(AXPhoenixClassifierConfiguration *)self predictionConfidenceThreshold];
  id v35 = (id)objc_msgSend(v3, "numberWithDouble:");
  v60[3] = v35;
  id v34 = [(AXPhoenixClassifierConfiguration *)self predictionCountThresholdsKey];
  v59[4] = v34;
  id v33 = [(AXPhoenixClassifierConfiguration *)self doubleTapPolicyKey];
  v57[0] = v33;
  v32 = [(AXPhoenixClassifierConfiguration *)self predictionClassNoneKey];
  v55[0] = v32;
  v31 = [(AXPhoenixClassifierConfiguration *)self doubleTapPolicyThresholds];
  id v30 = -[NSArray objectAtIndexedSubscript:](v31, "objectAtIndexedSubscript:");
  v56[0] = v30;
  v29 = [(AXPhoenixClassifierConfiguration *)self predictionClassDoubleTapKey];
  v55[1] = v29;
  id v28 = [(AXPhoenixClassifierConfiguration *)self doubleTapPolicyThresholds];
  id v27 = -[NSArray objectAtIndexedSubscript:](v28, "objectAtIndexedSubscript:");
  v56[1] = v27;
  id v26 = (id)[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
  v58[0] = v26;
  v25 = [(AXPhoenixClassifierConfiguration *)self tripleTapPolicyKey];
  v57[1] = v25;
  id v24 = [(AXPhoenixClassifierConfiguration *)self predictionClassNoneKey];
  v53[0] = v24;
  id v23 = [(AXPhoenixClassifierConfiguration *)self tripleTapPolicyThresholds];
  id v22 = [(NSArray *)v23 objectAtIndexedSubscript:0];
  v54[0] = v22;
  v21 = [(AXPhoenixClassifierConfiguration *)self predictionClassTripleTapKey];
  v53[1] = v21;
  id v20 = [(AXPhoenixClassifierConfiguration *)self tripleTapPolicyThresholds];
  id v19 = [(NSArray *)v20 objectAtIndexedSubscript:1];
  v54[1] = v19;
  id v18 = (id)[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
  v58[1] = v18;
  v17 = [(AXPhoenixClassifierConfiguration *)self generalPolicyKey];
  v57[2] = v17;
  id v16 = [(AXPhoenixClassifierConfiguration *)self predictionClassNoneKey];
  v51[0] = v16;
  id v15 = [(AXPhoenixClassifierConfiguration *)self generalPolicyThresholds];
  id v14 = [(NSArray *)v15 objectAtIndexedSubscript:0];
  v52[0] = v14;
  v13 = [(AXPhoenixClassifierConfiguration *)self predictionClassDoubleTapKey];
  v51[1] = v13;
  id v12 = [(AXPhoenixClassifierConfiguration *)self generalPolicyThresholds];
  id v11 = [(NSArray *)v12 objectAtIndexedSubscript:1];
  v52[1] = v11;
  v10 = [(AXPhoenixClassifierConfiguration *)self predictionClassTripleTapKey];
  v51[2] = v10;
  id v9 = [(AXPhoenixClassifierConfiguration *)self generalPolicyThresholds];
  id v8 = [(NSArray *)v9 objectAtIndexedSubscript:2];
  v52[2] = v8;
  id v7 = (id)objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v52, v51);
  v58[2] = v7;
  id v6 = (id)[NSDictionary dictionaryWithObjects:v58 forKeys:v57 count:3];
  v60[4] = v6;
  id v4 = (id)[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:5];
  v64[1] = v4;
  id v5 = (id)[NSDictionary dictionaryWithObjects:v64 forKeys:v63 count:2];

  return v5;
}

- (unint64_t)accelerometerSampleRateInHz
{
  return self->_accelerometerSampleRateInHz;
}

- (void)setAccelerometerSampleRateInHz:(unint64_t)a3
{
  self->_accelerometerSampleRateInHz = a3;
}

- (unint64_t)maxAccelerationBufferSize
{
  return self->_maxAccelerationBufferSize;
}

- (void)setMaxAccelerationBufferSize:(unint64_t)a3
{
  self->_maxAccelerationBufferSize = a3;
}

- (unint64_t)modelPredictionRateInHz
{
  return self->_modelPredictionRateInHz;
}

- (void)setModelPredictionRateInHz:(unint64_t)a3
{
  self->_modelPredictionRateInHz = a3;
}

- (double)predictionConfidenceThreshold
{
  return self->_predictionConfidenceThreshold;
}

- (void)setPredictionConfidenceThreshold:(double)a3
{
  self->_predictionConfidenceThreshold = a3;
}

- (unint64_t)minDurationBetweenTriggersInSeconds
{
  return self->_minDurationBetweenTriggersInSeconds;
}

- (void)setMinDurationBetweenTriggersInSeconds:(unint64_t)a3
{
  self->_minDurationBetweenTriggersInSeconds = a3;
}

- (unint64_t)maxPredictionBufferSize
{
  return self->_maxPredictionBufferSize;
}

- (void)setMaxPredictionBufferSize:(unint64_t)a3
{
  self->_maxPredictionBufferSize = a3;
}

- (NSArray)doubleTapPolicyThresholds
{
  return self->_doubleTapPolicyThresholds;
}

- (void)setDoubleTapPolicyThresholds:(id)a3
{
}

- (NSArray)tripleTapPolicyThresholds
{
  return self->_tripleTapPolicyThresholds;
}

- (void)setTripleTapPolicyThresholds:(id)a3
{
}

- (NSArray)generalPolicyThresholds
{
  return self->_generalPolicyThresholds;
}

- (void)setGeneralPolicyThresholds:(id)a3
{
}

- (NSString)dataKey
{
  return self->_dataKey;
}

- (void)setDataKey:(id)a3
{
}

- (NSString)accelerometerSampleRateInHzKey
{
  return self->_accelerometerSampleRateInHzKey;
}

- (void)setAccelerometerSampleRateInHzKey:(id)a3
{
}

- (NSString)maxAccelerationBufferSizeKey
{
  return self->_maxAccelerationBufferSizeKey;
}

- (void)setMaxAccelerationBufferSizeKey:(id)a3
{
}

- (NSString)policyKey
{
  return self->_policyKey;
}

- (void)setPolicyKey:(id)a3
{
}

- (NSString)modelPredictionRateInHzKey
{
  return self->_modelPredictionRateInHzKey;
}

- (void)setModelPredictionRateInHzKey:(id)a3
{
}

- (NSString)predictionConfidenceThresholdKey
{
  return self->_predictionConfidenceThresholdKey;
}

- (void)setPredictionConfidenceThresholdKey:(id)a3
{
}

- (NSString)minDurationBetweenTriggersInSecondsKey
{
  return self->_minDurationBetweenTriggersInSecondsKey;
}

- (void)setMinDurationBetweenTriggersInSecondsKey:(id)a3
{
}

- (NSString)maxPredictionBufferSizeKey
{
  return self->_maxPredictionBufferSizeKey;
}

- (void)setMaxPredictionBufferSizeKey:(id)a3
{
}

- (NSString)predictionCountThresholdsKey
{
  return self->_predictionCountThresholdsKey;
}

- (void)setPredictionCountThresholdsKey:(id)a3
{
}

- (NSString)doubleTapPolicyKey
{
  return self->_doubleTapPolicyKey;
}

- (void)setDoubleTapPolicyKey:(id)a3
{
}

- (NSString)tripleTapPolicyKey
{
  return self->_tripleTapPolicyKey;
}

- (void)setTripleTapPolicyKey:(id)a3
{
}

- (NSString)generalPolicyKey
{
  return self->_generalPolicyKey;
}

- (void)setGeneralPolicyKey:(id)a3
{
}

- (NSString)predictionClassNoneKey
{
  return self->_predictionClassNoneKey;
}

- (void)setPredictionClassNoneKey:(id)a3
{
}

- (NSString)predictionClassDoubleTapKey
{
  return self->_predictionClassDoubleTapKey;
}

- (void)setPredictionClassDoubleTapKey:(id)a3
{
}

- (NSString)predictionClassTripleTapKey
{
  return self->_predictionClassTripleTapKey;
}

- (void)setPredictionClassTripleTapKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end