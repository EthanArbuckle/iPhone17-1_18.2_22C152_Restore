@interface CKRecord
- (void)updateFromFence:(id)a3;
@end

@implementation CKRecord

- (void)updateFromFence:(id)a3
{
  id v4 = a3;
  v5 = [v4 location];
  v6 = [(CKRecord *)self encryptedValuesByKey];
  [v6 setObject:v5 forKeyedSubscript:@"location"];

  v7 = [v4 label];
  v8 = [(CKRecord *)self encryptedValuesByKey];
  [v8 setObject:v7 forKeyedSubscript:@"label"];

  v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 locationType]);
  v10 = [(CKRecord *)self encryptedValuesByKey];
  [v10 setObject:v9 forKeyedSubscript:@"locationType"];

  v11 = [v4 placemark];
  v12 = [v11 locality];
  v13 = [(CKRecord *)self encryptedValuesByKey];
  [v13 setObject:v12 forKeyedSubscript:@"placemark_locality"];

  v14 = [v4 placemark];
  v15 = [v14 administrativeArea];
  v16 = [(CKRecord *)self encryptedValuesByKey];
  [v16 setObject:v15 forKeyedSubscript:@"placemark_administrativeArea"];

  v17 = [v4 placemark];
  v18 = [v17 country];
  v19 = [(CKRecord *)self encryptedValuesByKey];
  [v19 setObject:v18 forKeyedSubscript:@"placemark_country"];

  v20 = [v4 placemark];
  v21 = [v20 state];
  v22 = [(CKRecord *)self encryptedValuesByKey];
  [v22 setObject:v21 forKeyedSubscript:@"placemark_state"];

  v23 = [v4 placemark];
  v24 = [v23 streetAddress];
  v25 = [(CKRecord *)self encryptedValuesByKey];
  [v25 setObject:v24 forKeyedSubscript:@"placemark_streetAddress"];

  v26 = [v4 placemark];
  v27 = [v26 streetName];
  v28 = [(CKRecord *)self encryptedValuesByKey];
  [v28 setObject:v27 forKeyedSubscript:@"placemark_streetName"];

  v29 = [v4 schedule];
  v30 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v29 startHour]);
  v31 = [(CKRecord *)self encryptedValuesByKey];
  [v31 setObject:v30 forKeyedSubscript:@"schedule_startHour"];

  v32 = [v4 schedule];
  v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v32 startMin]);
  v34 = [(CKRecord *)self encryptedValuesByKey];
  [v34 setObject:v33 forKeyedSubscript:@"schedule_startMin"];

  v35 = [v4 schedule];
  v36 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v35 endHour]);
  v37 = [(CKRecord *)self encryptedValuesByKey];
  [v37 setObject:v36 forKeyedSubscript:@"schedule_endHour"];

  v38 = [v4 schedule];
  v39 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v38 endMin]);
  v40 = [(CKRecord *)self encryptedValuesByKey];
  [v40 setObject:v39 forKeyedSubscript:@"schedule_endMin"];

  v41 = [v4 schedule];
  v42 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v41 daysOfWeek]);
  v43 = [(CKRecord *)self encryptedValuesByKey];
  [v43 setObject:v42 forKeyedSubscript:@"schedule_daysOfWeek"];

  v44 = [v4 schedule];
  v45 = [v44 timeZone];
  v46 = [v45 name];
  v47 = [(CKRecord *)self encryptedValuesByKey];
  [v47 setObject:v46 forKeyedSubscript:@"schedule_timeZone"];

  id v49 = [v4 muteEndDate];

  v48 = [(CKRecord *)self encryptedValuesByKey];
  [v48 setObject:v49 forKeyedSubscript:@"fence_muteEndDate"];
}

@end