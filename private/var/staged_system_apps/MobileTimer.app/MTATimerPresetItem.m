@interface MTATimerPresetItem
+ (id)itemWithNumber:(int)a3 unit:(id)a4 duration:(double)a5 identifier:(id)a6;
+ (id)mockItems;
- (NSString)identifier;
- (NSString)number;
- (NSString)unit;
- (double)duration;
- (void)setDuration:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setNumber:(id)a3;
- (void)setUnit:(id)a3;
@end

@implementation MTATimerPresetItem

+ (id)itemWithNumber:(int)a3 unit:(id)a4 duration:(double)a5 identifier:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v9 = a6;
  id v10 = a4;
  v11 = objc_opt_new();
  v12 = +[NSNumberFormatter mtDecimalStyleNumberFormatter];
  v13 = +[NSNumber numberWithInt:v8];
  v14 = [v12 stringFromNumber:v13];
  [v11 setNumber:v14];

  [v11 setUnit:v10];
  [v11 setDuration:a5];
  [v11 setAccessibilityIdentifier:v9];

  return v11;
}

+ (id)mockItems
{
  v51 = +[NSBundle mainBundle];
  v50 = [v51 localizedStringForKey:@"MIN" value:&stru_1000A2560 table:0];
  v49 = +[NSString stringWithFormat:@"preset-timer-0"];
  v48 = +[MTATimerPresetItem itemWithNumber:1 unit:v50 duration:v49 identifier:60.0];
  v52[0] = v48;
  v47 = +[NSBundle mainBundle];
  v46 = [v47 localizedStringForKey:@"MIN" value:&stru_1000A2560 table:0];
  v45 = +[NSString stringWithFormat:@"preset-timer-1"];
  v44 = +[MTATimerPresetItem itemWithNumber:2 unit:v46 duration:v45 identifier:120.0];
  v52[1] = v44;
  v43 = +[NSBundle mainBundle];
  v42 = [v43 localizedStringForKey:@"MIN" value:&stru_1000A2560 table:0];
  v41 = +[NSString stringWithFormat:@"preset-timer-2"];
  v40 = +[MTATimerPresetItem itemWithNumber:3 unit:v42 duration:v41 identifier:180.0];
  v52[2] = v40;
  v39 = +[NSBundle mainBundle];
  v38 = [v39 localizedStringForKey:@"MIN" value:&stru_1000A2560 table:0];
  v37 = +[NSString stringWithFormat:@"preset-timer-3"];
  v36 = +[MTATimerPresetItem itemWithNumber:4 unit:v38 duration:v37 identifier:240.0];
  v52[3] = v36;
  v35 = +[NSBundle mainBundle];
  v34 = [v35 localizedStringForKey:@"MIN" value:&stru_1000A2560 table:0];
  v33 = +[NSString stringWithFormat:@"preset-timer-4"];
  v32 = +[MTATimerPresetItem itemWithNumber:5 unit:v34 duration:v33 identifier:300.0];
  v52[4] = v32;
  v31 = +[NSBundle mainBundle];
  v30 = [v31 localizedStringForKey:@"MIN" value:&stru_1000A2560 table:0];
  v29 = +[NSString stringWithFormat:@"preset-timer-5"];
  v28 = +[MTATimerPresetItem itemWithNumber:10 unit:v30 duration:v29 identifier:600.0];
  v52[5] = v28;
  v27 = +[NSBundle mainBundle];
  v26 = [v27 localizedStringForKey:@"MIN" value:&stru_1000A2560 table:0];
  v25 = +[NSString stringWithFormat:@"preset-timer-6"];
  v24 = +[MTATimerPresetItem itemWithNumber:15 unit:v26 duration:v25 identifier:900.0];
  v52[6] = v24;
  v23 = +[NSBundle mainBundle];
  v22 = [v23 localizedStringForKey:@"MIN" value:&stru_1000A2560 table:0];
  v21 = +[NSString stringWithFormat:@"preset-timer-7"];
  v20 = +[MTATimerPresetItem itemWithNumber:20 unit:v22 duration:v21 identifier:1200.0];
  v52[7] = v20;
  v19 = +[NSBundle mainBundle];
  v18 = [v19 localizedStringForKey:@"MIN" value:&stru_1000A2560 table:0];
  v17 = +[NSString stringWithFormat:@"preset-timer-8"];
  v16 = +[MTATimerPresetItem itemWithNumber:30 unit:v18 duration:v17 identifier:1800.0];
  v52[8] = v16;
  v15 = +[NSBundle mainBundle];
  v14 = [v15 localizedStringForKey:@"MIN" value:&stru_1000A2560 table:0];
  v2 = +[NSString stringWithFormat:@"preset-timer-9"];
  v3 = +[MTATimerPresetItem itemWithNumber:45 unit:v14 duration:v2 identifier:2700.0];
  v52[9] = v3;
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"HR" value:&stru_1000A2560 table:0];
  v6 = +[NSString stringWithFormat:@"preset-timer-10"];
  v7 = +[MTATimerPresetItem itemWithNumber:1 unit:v5 duration:v6 identifier:3600.0];
  v52[10] = v7;
  uint64_t v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"HR" value:&stru_1000A2560 table:0];
  id v10 = +[NSString stringWithFormat:@"preset-timer-11"];
  v11 = +[MTATimerPresetItem itemWithNumber:2 unit:v9 duration:v10 identifier:7200.0];
  v52[11] = v11;
  id v13 = +[NSArray arrayWithObjects:v52 count:12];

  return v13;
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unit, 0);

  objc_storeStrong((id *)&self->_number, 0);
}

@end