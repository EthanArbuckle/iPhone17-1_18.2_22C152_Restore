@interface WOMockWorkout
+ (id)defaultGoalValueForGoalType:(unint64_t)a3;
+ (id)defaultOutdoorCycleWithGoalType:(unint64_t)a3;
+ (id)defaultOutdoorRowingWithGoalType:(unint64_t)a3;
+ (id)defaultOutdoorRunWithGoalType:(unint64_t)a3;
+ (id)defaultTriathlon;
@end

@implementation WOMockWorkout

+ (id)defaultTriathlon
{
  v2 = [MEMORY[0x263EFF910] date];
  v3 = [v2 dateByAddingTimeInterval:-7200.0];
  v4 = [MEMORY[0x263F0A8F8] _workoutWithActivityType:82 startDate:v3 endDate:v2 workoutEvents:MEMORY[0x263EFFA68] workoutActivities:MEMORY[0x263EFFA68] duration:0 statistics:0.0 goalType:0 goal:0 device:0 metadata:MEMORY[0x263EFFA78]];

  return v4;
}

+ (id)defaultOutdoorRunWithGoalType:(unint64_t)a3
{
  v66[10] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [v3 dateByAddingTimeInterval:-1800.0];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = (void *)MEMORY[0x263F0A930];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v4 duration:300.0];
  v8 = generateSplitMetadata(1, 0, 1000.0, 300.0, 1000.0);
  v9 = [v6 workoutEventWithType:7 dateInterval:v7 metadata:v8];
  v62 = v5;
  [v5 addObject:v9];

  v10 = (void *)MEMORY[0x263F0A630];
  v11 = [MEMORY[0x263F0A830] mileUnit];
  v12 = [v10 quantityWithUnit:v11 doubleValue:1.0];

  v13 = (void *)MEMORY[0x263F0A930];
  v14 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v4 duration:482.8];
  v15 = [MEMORY[0x263F0A830] meterUnit];
  v63 = v12;
  [v12 doubleValueForUnit:v15];
  double v17 = v16;
  v18 = [MEMORY[0x263F0A830] meterUnit];
  [v12 doubleValueForUnit:v18];
  v20 = generateSplitMetadata(0, 0, v17, 482.8, v19);
  v21 = [v13 workoutEventWithType:7 dateInterval:v14 metadata:v20];
  [v5 addObject:v21];

  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v23 = *MEMORY[0x263F09DE0];
  v24 = [MEMORY[0x263F0A830] meterUnit];
  addSimpleSumStats(v22, v23, v4, v3, v24, 5080.0);

  uint64_t v25 = *MEMORY[0x263F09BC0];
  v26 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v60 = v4;
  v61 = v22;
  v59 = v3;
  addSimpleSumStats(v22, v25, v4, v3, v26, 257.0);

  uint64_t v27 = *MEMORY[0x263F09C08];
  v28 = [MEMORY[0x263F0A830] kilocalorieUnit];
  addSimpleSumStats(v22, v27, v4, v3, v28, 50.0);

  v65[0] = *MEMORY[0x263F0ABD0];
  v29 = (void *)MEMORY[0x263F0A630];
  v58 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  v57 = [v29 quantityWithUnit:v58 doubleValue:162.0];
  v66[0] = v57;
  v65[1] = *MEMORY[0x263F3F128];
  v30 = (void *)MEMORY[0x263F0A630];
  v56 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  v55 = [v30 quantityWithUnit:v56 doubleValue:121.0];
  v66[1] = v55;
  v65[2] = *MEMORY[0x263F3F148];
  v31 = (void *)MEMORY[0x263F0A630];
  v54 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  v53 = [v31 quantityWithUnit:v54 doubleValue:104.0];
  v66[2] = v53;
  v65[3] = *MEMORY[0x263F3F138];
  v32 = (void *)MEMORY[0x263F0A630];
  v52 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  v51 = [v32 quantityWithUnit:v52 doubleValue:136.0];
  v66[3] = v51;
  v65[4] = *MEMORY[0x263F3F140];
  v33 = (void *)MEMORY[0x263F0A630];
  v34 = [MEMORY[0x263F0A830] meterUnit];
  v35 = [v33 quantityWithUnit:v34 doubleValue:300.0];
  v66[4] = v35;
  v65[5] = *MEMORY[0x263F3F130];
  v36 = (void *)MEMORY[0x263F0A630];
  v37 = [MEMORY[0x263F0A830] meterUnit];
  v38 = [v36 quantityWithUnit:v37 doubleValue:900.0];
  uint64_t v39 = *MEMORY[0x263F0ABE8];
  v66[5] = v38;
  v66[6] = MEMORY[0x263EFFA88];
  uint64_t v40 = *MEMORY[0x263F0ABC8];
  v65[6] = v39;
  v65[7] = v40;
  v66[7] = &unk_270DB0958;
  v65[8] = *MEMORY[0x263F09B20];
  v41 = (void *)MEMORY[0x263F0A630];
  v42 = [MEMORY[0x263F0A830] degreeFahrenheitUnit];
  v43 = [v41 quantityWithUnit:v42 doubleValue:66.0];
  v66[8] = v43;
  v65[9] = *MEMORY[0x263F09B18];
  v44 = (void *)MEMORY[0x263F0A630];
  v45 = [MEMORY[0x263F0A830] percentUnit];
  v46 = [v44 quantityWithUnit:v45 doubleValue:61.0];
  v66[9] = v46;
  v47 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:10];

  v48 = +[WOMockWorkout defaultGoalValueForGoalType:a3];
  v49 = [MEMORY[0x263F0A8F8] _workoutWithActivityType:37 startDate:v60 endDate:v59 workoutEvents:v62 workoutActivities:MEMORY[0x263EFFA68] duration:v61 statistics:0.0 goalType:a3 goal:v48 device:0 metadata:v47];

  return v49;
}

+ (id)defaultOutdoorCycleWithGoalType:(unint64_t)a3
{
  v66[10] = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF910] date];
  v4 = [v3 dateByAddingTimeInterval:-1800.0];
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = (void *)MEMORY[0x263F0A930];
  v7 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v4 duration:300.0];
  v8 = generateSplitMetadata(1, 0, 1000.0, 300.0, 1000.0);
  v9 = [v6 workoutEventWithType:7 dateInterval:v7 metadata:v8];
  v62 = v5;
  [v5 addObject:v9];

  v10 = (void *)MEMORY[0x263F0A630];
  v11 = [MEMORY[0x263F0A830] mileUnit];
  v12 = [v10 quantityWithUnit:v11 doubleValue:1.0];

  v13 = (void *)MEMORY[0x263F0A930];
  v14 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v4 duration:482.8];
  v15 = [MEMORY[0x263F0A830] meterUnit];
  v63 = v12;
  [v12 doubleValueForUnit:v15];
  double v17 = v16;
  v18 = [MEMORY[0x263F0A830] meterUnit];
  [v12 doubleValueForUnit:v18];
  v20 = generateSplitMetadata(0, 0, v17, 482.8, v19);
  v21 = [v13 workoutEventWithType:7 dateInterval:v14 metadata:v20];
  [v5 addObject:v21];

  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v23 = *MEMORY[0x263F09DB0];
  v24 = [MEMORY[0x263F0A830] meterUnit];
  addSimpleSumStats(v22, v23, v4, v3, v24, 5080.0);

  uint64_t v25 = *MEMORY[0x263F09BC0];
  v26 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v60 = v4;
  v61 = v22;
  v59 = v3;
  addSimpleSumStats(v22, v25, v4, v3, v26, 257.0);

  uint64_t v27 = *MEMORY[0x263F09C08];
  v28 = [MEMORY[0x263F0A830] kilocalorieUnit];
  addSimpleSumStats(v22, v27, v4, v3, v28, 50.0);

  v65[0] = *MEMORY[0x263F0ABD0];
  v29 = (void *)MEMORY[0x263F0A630];
  v58 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  v57 = [v29 quantityWithUnit:v58 doubleValue:85.0];
  v66[0] = v57;
  v65[1] = *MEMORY[0x263F3F128];
  v30 = (void *)MEMORY[0x263F0A630];
  v56 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  v55 = [v30 quantityWithUnit:v56 doubleValue:121.0];
  v66[1] = v55;
  v65[2] = *MEMORY[0x263F3F148];
  v31 = (void *)MEMORY[0x263F0A630];
  v54 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  v53 = [v31 quantityWithUnit:v54 doubleValue:104.0];
  v66[2] = v53;
  v65[3] = *MEMORY[0x263F3F138];
  v32 = (void *)MEMORY[0x263F0A630];
  v52 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  v51 = [v32 quantityWithUnit:v52 doubleValue:136.0];
  v66[3] = v51;
  v65[4] = *MEMORY[0x263F3F140];
  v33 = (void *)MEMORY[0x263F0A630];
  v34 = [MEMORY[0x263F0A830] meterUnit];
  v35 = [v33 quantityWithUnit:v34 doubleValue:300.0];
  v66[4] = v35;
  v65[5] = *MEMORY[0x263F3F130];
  v36 = (void *)MEMORY[0x263F0A630];
  v37 = [MEMORY[0x263F0A830] meterUnit];
  v38 = [v36 quantityWithUnit:v37 doubleValue:900.0];
  uint64_t v39 = *MEMORY[0x263F0ABE8];
  v66[5] = v38;
  v66[6] = MEMORY[0x263EFFA88];
  uint64_t v40 = *MEMORY[0x263F0ABC8];
  v65[6] = v39;
  v65[7] = v40;
  v66[7] = &unk_270DB0958;
  v65[8] = *MEMORY[0x263F09B20];
  v41 = (void *)MEMORY[0x263F0A630];
  v42 = [MEMORY[0x263F0A830] degreeFahrenheitUnit];
  v43 = [v41 quantityWithUnit:v42 doubleValue:66.0];
  v66[8] = v43;
  v65[9] = *MEMORY[0x263F09B18];
  v44 = (void *)MEMORY[0x263F0A630];
  v45 = [MEMORY[0x263F0A830] percentUnit];
  v46 = [v44 quantityWithUnit:v45 doubleValue:61.0];
  v66[9] = v46;
  v47 = [NSDictionary dictionaryWithObjects:v66 forKeys:v65 count:10];

  v48 = +[WOMockWorkout defaultGoalValueForGoalType:a3];
  v49 = [MEMORY[0x263F0A8F8] _workoutWithActivityType:13 startDate:v60 endDate:v59 workoutEvents:v62 workoutActivities:MEMORY[0x263EFFA68] duration:v61 statistics:0.0 goalType:a3 goal:v48 device:0 metadata:v47];

  return v49;
}

+ (id)defaultOutdoorRowingWithGoalType:(unint64_t)a3
{
  v63[7] = *MEMORY[0x263EF8340];
  v61 = [MEMORY[0x263EFF910] date];
  v3 = [v61 dateByAddingTimeInterval:-1800.0];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = (void *)MEMORY[0x263F0A930];
  v6 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v3 duration:300.0];
  v7 = generateSplitMetadata(1, 0, 1000.0, 390.4, 1000.0);
  v8 = [v5 workoutEventWithType:7 dateInterval:v6 metadata:v7];
  [v4 addObject:v8];

  v9 = (void *)MEMORY[0x263F0A630];
  v10 = [MEMORY[0x263F0A830] mileUnit];
  v11 = [v9 quantityWithUnit:v10 doubleValue:1.0];

  v12 = (void *)MEMORY[0x263F0A930];
  v13 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v3 duration:482.8];
  v14 = [MEMORY[0x263F0A830] meterUnit];
  v59 = v11;
  [v11 doubleValueForUnit:v14];
  double v16 = v15;
  double v17 = [MEMORY[0x263F0A830] meterUnit];
  [v11 doubleValueForUnit:v17];
  double v19 = generateSplitMetadata(0, 0, v16, 482.8, v18);
  v20 = [v12 workoutEventWithType:7 dateInterval:v13 metadata:v19];
  [v4 addObject:v20];

  v21 = (void *)MEMORY[0x263F0A930];
  id v22 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v3 duration:482.8];
  uint64_t v23 = generateSplitMetadata(0, 1, 500.0, 192.8, 500.0);
  v24 = [v21 workoutEventWithType:7 dateInterval:v22 metadata:v23];
  v58 = v4;
  [v4 addObject:v24];

  uint64_t v25 = (void *)MEMORY[0x263F0A930];
  v26 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v3 duration:482.8];
  uint64_t v27 = generateSplitMetadata(0, 1, 500.0, 197.6, 500.0);
  v28 = [v25 workoutEventWithType:7 dateInterval:v26 metadata:v27];
  [v4 addObject:v28];

  id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v30 = *MEMORY[0x263F09DC8];
  v31 = [MEMORY[0x263F0A830] meterUnit];
  addSimpleSumStats(v29, v30, v3, v61, v31, 5080.0);

  uint64_t v32 = *MEMORY[0x263F09BC0];
  v33 = [MEMORY[0x263F0A830] kilocalorieUnit];
  v57 = v3;
  addSimpleSumStats(v29, v32, v3, v61, v33, 257.0);

  uint64_t v34 = *MEMORY[0x263F09C08];
  v35 = [MEMORY[0x263F0A830] kilocalorieUnit];
  addSimpleSumStats(v29, v34, v3, v61, v35, 50.0);

  v62[0] = *MEMORY[0x263F3F128];
  v36 = (void *)MEMORY[0x263F0A630];
  v56 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  v55 = [v36 quantityWithUnit:v56 doubleValue:121.0];
  v63[0] = v55;
  v62[1] = *MEMORY[0x263F3F148];
  v37 = (void *)MEMORY[0x263F0A630];
  v38 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  uint64_t v39 = [v37 quantityWithUnit:v38 doubleValue:104.0];
  v63[1] = v39;
  v62[2] = *MEMORY[0x263F3F138];
  uint64_t v40 = (void *)MEMORY[0x263F0A630];
  v41 = [MEMORY[0x263F0A830] _countPerMinuteUnit];
  v42 = [v40 quantityWithUnit:v41 doubleValue:136.0];
  uint64_t v43 = *MEMORY[0x263F0ABE8];
  v63[2] = v42;
  v63[3] = MEMORY[0x263EFFA88];
  uint64_t v44 = *MEMORY[0x263F0ABC8];
  v62[3] = v43;
  v62[4] = v44;
  v63[4] = &unk_270DB0958;
  v62[5] = *MEMORY[0x263F09B20];
  v45 = (void *)MEMORY[0x263F0A630];
  v46 = [MEMORY[0x263F0A830] degreeFahrenheitUnit];
  v47 = [v45 quantityWithUnit:v46 doubleValue:66.0];
  v63[5] = v47;
  v62[6] = *MEMORY[0x263F09B18];
  v48 = (void *)MEMORY[0x263F0A630];
  v49 = [MEMORY[0x263F0A830] percentUnit];
  v50 = [v48 quantityWithUnit:v49 doubleValue:61.0];
  v63[6] = v50;
  v51 = [NSDictionary dictionaryWithObjects:v63 forKeys:v62 count:7];

  v52 = +[WOMockWorkout defaultGoalValueForGoalType:a3];
  v53 = [MEMORY[0x263F0A8F8] _workoutWithActivityType:35 startDate:v57 endDate:v61 workoutEvents:v58 workoutActivities:MEMORY[0x263EFFA68] duration:v29 statistics:0.0 goalType:a3 goal:v52 device:0 metadata:v51];

  return v53;
}

+ (id)defaultGoalValueForGoalType:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      v3 = (void *)MEMORY[0x263F0A630];
      id v4 = [MEMORY[0x263F0A830] largeCalorieUnit];
      double v5 = 300.0;
      goto LABEL_7;
    case 2uLL:
      v3 = (void *)MEMORY[0x263F0A630];
      id v4 = [MEMORY[0x263F0A830] secondUnit];
      double v5 = 3600.0;
      goto LABEL_7;
    case 1uLL:
      v3 = (void *)MEMORY[0x263F0A630];
      id v4 = [MEMORY[0x263F0A830] meterUnit];
      double v5 = 5000.0;
LABEL_7:
      v6 = [v3 quantityWithUnit:v4 doubleValue:v5];

      goto LABEL_9;
  }
  v6 = 0;
LABEL_9:
  return v6;
}

@end